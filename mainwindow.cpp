#include "mainwindow.h"
#include "ui_mainwindow.h"



#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>




MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    export_mngr_p = new ExportVideoManager();
    import_mngr_p = new ImportVideoManager();

    connect(export_mngr_p, &ExportVideoManager::onExportProgress, this, &MainWindow::onExportProgress);
    connect(import_mngr_p, &ImportVideoManager::onImportProgress, this, &MainWindow::onImportProgress);
}

MainWindow::~MainWindow()
{
    disconnect(export_mngr_p, &ExportVideoManager::onExportProgress, this, &MainWindow::onExportProgress);
    disconnect(import_mngr_p, &ImportVideoManager::onImportProgress, this, &MainWindow::onImportProgress);
    delete ui;
}

void MainWindow::DoExport(QString abs_file_path) { //do this at a thread

    export_mngr_p->Export(abs_file_path);
}


void MainWindow::DoImport(QString abs_file_path) {  //do this at a thread

    import_mngr_p->SetInputPath(abs_file_path);
    import_mngr_p->Import();
}

//export
void MainWindow::on_pushButton_clicked()
{
    QString filename = QFileDialog::getSaveFileName(this,
                  QApplication::translate("MainWindow", "Save Video"), //title
                  "", //path
                  "Video files (*.mp4 *.avi *.mov);;All files (*.*)"); //filter

    if(filename.isEmpty()) {
        QMessageBox msg(this);
        msg.setText(QApplication::translate("MainWindow", "Save path is Empty !"));
        msg.exec();
        return;
    } else {
         //do save
        DoExport(filename);
    }

}

//import
void MainWindow::on_pushButton_2_clicked()
{
    QString filename;
    filename = QFileDialog::getOpenFileName(this,
          QApplication::translate("MainWindow", "Open Video"), //title
          "", //path
          "Video files (*.mp4 *.avi *.mov);;All files (*.*)"); //filter

    if(filename.isEmpty()) {
        QMessageBox msg(this);
        msg.setText(QApplication::translate("MainWindow", "No mp4 file is selected !"));
        msg.exec();
        return;
    } else {
        DoImport(filename);
        QMessageBox msg(this);
        msg.setText(QApplication::translate("MainWindow", "import finished, read the codeo please !"));
        msg.exec();
    }
}

void MainWindow::onExportProgress(bool is_finished, int percent) {
    qDebug() <<  "is_finished= " << is_finished << "    percent="<< percent;
}
void MainWindow::onImportProgress(bool is_finished, int percent) {
    qDebug() <<  "is_finished= " << is_finished << "    percent="<< percent;
}


