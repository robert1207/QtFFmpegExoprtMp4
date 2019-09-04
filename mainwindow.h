#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "exportvideomanager/exportvideomanager.h"
#include "importvideomanager/importvideomanager.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

    void DoExport(QString abs_file_path);
    void DoImport(QString abs_file_path);

private slots:
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();


    void onExportProgress(bool is_finished, int percent);
    void onImportProgress(bool is_finished, int percent);

private:
    Ui::MainWindow *ui;

    ExportVideoManager *export_mngr_p;
    ImportVideoManager *import_mngr_p;
};

#endif // MAINWINDOW_H
