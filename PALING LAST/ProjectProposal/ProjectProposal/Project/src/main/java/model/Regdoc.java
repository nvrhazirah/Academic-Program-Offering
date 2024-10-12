/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class Regdoc {
    private int id;
    private String programAkademik;
    private String entitiAkademik;
    private String jamKredit;
    private String tahapMQF;
    private String kaedahPenawaran;
    private String bidangNEC;
    private String tempohPengajian;
    private String tempohMinimum;
    private String tempohMaksimum;
    private String tahunSesiPenawaran;
    private String implikasiKakitangan;
    private String implikasiKewangan;
    private String implikasiFizikal;
    private Date kelulusanKPT;
    private Date akreditasiSementara;
    private Date senat;
    private Date lpu;
    private String documentPath;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getProgramAkademik() {
        return programAkademik;
    }
    public void setProgramAkademik(String programAkademik) {
        this.programAkademik = programAkademik;
    }
    public String getEntitiAkademik() {
        return entitiAkademik;
    }
    public void setEntitiAkademik(String entitiAkademik) {
        this.entitiAkademik = entitiAkademik;
    }
    public String getJamKredit() {
        return jamKredit;
    }
    public void setJamKredit(String jamKredit) {
        this.jamKredit = jamKredit;
    }
    public String getTahapMQF() {
        return tahapMQF;
    }
    public void setTahapMQF(String tahapMQF) {
        this.tahapMQF = tahapMQF;
    }
    public String getKaedahPenawaran() {
        return kaedahPenawaran;
    }
    public void setKaedahPenawaran(String kaedahPenawaran) {
        this.kaedahPenawaran = kaedahPenawaran;
    }
    public String getBidangNEC() {
        return bidangNEC;
    }
    public void setBidangNEC(String bidangNEC) {
        this.bidangNEC = bidangNEC;
    }
    public void setTempohPengajian(String tempohPengajian) {
    this.tempohPengajian = tempohPengajian;
    }
    public String getTempohPengajian() {
    return tempohPengajian;
    }
    public String getTempohMinimum() {
        return tempohMinimum;
    }
    public void setTempohMinimum(String tempohMinimum) {
        this.tempohMinimum = tempohMinimum;
    }
    public String getTempohMaksimum() {
        return tempohMaksimum;
    }
    public void setTempohMaksimum(String tempohMaksimum) {
        this.tempohMaksimum = tempohMaksimum;
    }
    public String getTahunSesiPenawaran() {
        return tahunSesiPenawaran;
    }
    public void setTahunSesiPenawaran(String tahunSesiPenawaran) {
        this.tahunSesiPenawaran = tahunSesiPenawaran;
    }
    public String getImplikasiKakitangan() {
        return implikasiKakitangan;
    }
    public void setImplikasiKakitangan(String implikasiKakitangan) {
        this.implikasiKakitangan = implikasiKakitangan;
    }
    public String getImplikasiKewangan() {
        return implikasiKewangan;
    }
    public void setImplikasiKewangan(String implikasiKewangan) {
        this.implikasiKewangan = implikasiKewangan;
    }
    public String getImplikasiFizikal() {
        return implikasiFizikal;
    }
    public void setImplikasiFizikal(String implikasiFizikal) {
        this.implikasiFizikal = implikasiFizikal;
    }
    public Date getKelulusanKPT() {
        return kelulusanKPT;
    }
    public void setKelulusanKPT(Date kelulusanKPT) {
        this.kelulusanKPT = kelulusanKPT;
    }
    public Date getAkreditasiSementara() {
        return akreditasiSementara;
    }
    public void setAkreditasiSementara(Date akreditasiSementara) {
        this.akreditasiSementara = akreditasiSementara;
    }
    public Date getSenat() {
        return senat;
    }
    public void setSenat(Date senat) {
        this.senat = senat;
    }
    public Date getLpu() {
        return lpu;
    }
    public void setLpu(Date lpu) {
        this.lpu = lpu;
    }
    public String getDocumentPath() {
        return documentPath;
    }
    public void setDocumentPath(String documentPath) {
        this.documentPath = documentPath;
    }
}
