Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB253BE172
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622227; cv=none; b=mWoH7muI5I/cSZ3yAby+MHmnG477fGU/5rhRll8ARAZ/0+iECRo7toOcHLBnxOJXQ4ReDPaGgvb9pU9rh2pdro4mYPxUd+8tzE1T1E386/dxJoAtXUkV5Tlx7ETot/MuiJK+2/fqNTT4g6/bWoYYqGGexAugxYvGXI2whbJjRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622227; c=relaxed/simple;
	bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJJqJhbn6XGBG4pWDuQ6teaM4zS+T7S5jBFxy6CP7KxfN9fJIvjHwzoqgSxcmhSnYF30yCXpZG+0ntkzW18LyB9Ez8EtwO+sIIjTHXa/6d76voNsvqc8dLLIngbkMkKCYakDaybgyQ2L9O0g2Xc1n68xbKS+dmGMbGoFPzZMoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4E0x9MI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIh90iUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4E0x9MI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIh90iUc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44Ffd534746
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=; b=o4E0x9MIkFZWDjtl
	WCLPQW4YiSIZO0Px41erUtL8r/A69HXcH15arxy3GHULCkgy+chhPpn1CtA6pauP
	+V/f5TFV/Wy3sATamSghw8tRMUEUcFhzZNLh0pQM815yZ0FdxouVUruKV71lYOZH
	57XT3c68fyX2DAPOlYYYrD5GaMmRSXHW1uQuLZH0q6f4hPgbMBCUvDYea96mqWCU
	pthTncgfitZub97xDVz6+ooqBL/DGVEz27sUDyI/rCG8VZmXzDxHkjf537SNYNe9
	6M3Zh24dRFK2To3T8vTgUhSbvrDwmBDwR0d4DVuTgw3vhWPcQhjznQJNnQfMeHGO
	RKi0uw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duh00d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:23:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso166921491cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622224; x=1785227024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=IIh90iUc98zZ0j6cT6xhEu1G+ujBt/8jU06IH5NkI3B8x3wH2jYCrTXAMU07n7jgf9
         qf76PdGe1eQ17GzgH1IpE5tcN+T19NTAwAvLPJw7oY3WujAzFG8yQDUoq5V8Iuz5VRU5
         OdySIn1Iw/DRmifGKXOReBcXsy+OeqwraW6LO9w5ye8vevgzt/LUoijic/c5OegNeO/Y
         pCSbA815N75vMOXtCG7V+L9XAoR9PEg7s7lhWhu3OGqVz4gtd6cJH7WQlhCmZkAVM3HK
         xrhG3Vv9F/XqvOzo4FuaTfpA4jH2eI5KiGzkm/iRqTPWwKWyYXRWLLEjE0ZM1plCNhWx
         ctBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622224; x=1785227024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=aRMhZ1+6CJ9nQOgoFTzLAs7mJ0kZKHJfl7K83kefz7XmXPPX5oTDq4PqjQ52m0dmDq
         eKoAaF2o32nbIIH6V2ebZwSkFPPCk6xWQ26OFdJOshS1/1HFYaLNY/uMzTiT0nrwENnT
         SHPykw95rLkLlYu+05pFgCK2hzmS3Xvr5lmSXz+e743USGlDejUsB7uiz8m05WGh/sfW
         SoU0+YEXvYcm0m14FLT2y9s+V9vnvwpiFzlyj3L5ojewJOj9to/kt4PMggiwFSQa5y9k
         QmfH0e2TNG9Qn/rN1RGM/WNMTveaJLOBypXOnorPsjWmUmq6G/47eNL5gvX8+oQPC9DK
         aUbA==
X-Forwarded-Encrypted: i=1; AHgh+RqIjqmJmyW3U+5VeRT+0IJoAZtuW+rVBTba74G3FOGr3rK++V/sYUP/cPbzyDrpvw+hJAp+dcLXlK2O@vger.kernel.org
X-Gm-Message-State: AOJu0YymF5T8agh7cDdlcdpNhd/WtNi5mgDStx6AVWyjJXwYIh7APMCr
	LjhLIaoAYZWwDj0MYHT8AzI0ndiDrebnxc/mjIknIzwMGnU1V1zieZuhm5anVG7XWK1FSitvxGN
	3snzFhn1Jx18lDQ9uVPjtDjRwyYZT0hZMrZW6+OZpdstftmTP/oq/Y4ahp+15AaOY
X-Gm-Gg: AfdE7clXOS0YjzNgGG0OC/d8toPukyTfwjT89V1DFCfYmy+HFmbAVL17QCEgX1F+uFK
	U0mVNVcCkHaP7sqTt6Ijx9Lu+82jpr4Unf5kwR4kFIKs/nIp8JqTRLVf5/aoPoCGepmfF4/6L4B
	7Qi6Mt9fXzQnJgMV8Q0b/7R5pyzEEfNV66oVYLf2fiWYCyEr3mssdJ7fSzIgD55MhocoafK6w/r
	ce6AFkbPgWnWz6hjpE3kK6gYsQOywD3Dm8XodWT0edALEoVC0/hRFG+G/TJAln3XXRIJ7ShJxeE
	9eVLAbWixi0b2csrg31LDpPkxM50RY824mrYF3QmvnKpAvq+ioVvPvwnfK3SSCg9vj9SXea8Mhk
	fZZVkQMK3
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr168270851cf.80.1784622224486;
        Tue, 21 Jul 2026 01:23:44 -0700 (PDT)
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr168270601cf.80.1784622223949;
        Tue, 21 Jul 2026 01:23:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm38202194f8f.24.2026.07.21.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:23:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:23:30 +0300
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v2-2-f3345405e4da@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXyyIIOXe94NlcyPwQTkZkGoOTX8Z6WK7M5TV0
 QP9xGPNLGOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8siAAKCRAbX0TJAJUV
 VoBoEACz2Nv1zIaOKpZ6ygLwj7g5UyqUVMqJ8LZsgDRPZRCbl8plWUd5aDpNzbmhATMTcqbx01h
 muuzLEUqMPeOChkDhVRKahivUGZ7s2tCOt9SjCDosC/X1vG1a9ywlp0rToXSqjQ8ENp5IomXycc
 77AL1qXoMPD7KIeFLsuv2dJQulQFclxaUAademze+2My6y1WiikNhQumX27MryDfxbrqIcBB+y9
 mWZLZHDl2PDQcRPO2Rx3je1gk/zDZT9vpqWWe8/P9VZtQ6M7G8A9euabo/ooYyrz1NeFGj9G/a/
 rtGycd842xSjhkuANB0FIkl5IvylPhQ3KDUVwd4CgrZuMYUBUN3cNTzJ/QhYOpKKedlVGORvsW7
 nVgWEZLJaMTzoNS6nsbXLNThbLZdHwxYxwu8FUFtrV2qMRLR2kZpYIimZfSvox96sbCeCjgx2dG
 Tpr4xyFj+BbnlC63msQ1/ZPWdYyBYIALfNGnesQkmnmwJszme4NBPxirXodFk4Y6zb8GGWyiLKd
 vgYSNW8x7r/8Mh0UBx4jCNoUEREa/SsDIkQTfkcuEt36+nLGbe0j++q02CESc/0Huf6fnpLn7Af
 lfkLnBrS2hOp7OYtc/ZZ6KtD2CCMJ4MdOYO1QeYqdgvz/br/vAzvck3ST11P1Lghn+dVnKK8zKy
 zXyw2SMc132Tlfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: BG5ssLDXSr2c2_oRDYQXCKdagZ2iqUTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX4HROl/vNqthm
 2ICOCq6tEPUQLCH8thRETjZizXjFi0NFaAPS1PTmV4aosZ7FDuScEFryY4DCLhVwrFKDxCBlmI4
 CaiYZo3JBKptRZKnFJMF1jUlsvHyIvaNsq5WWg0e6/58UuTNywRSyI8Oc0OqHzs+PlPH3WN9Hhy
 UJ5OHizqabg8hNJYP3vi0vnM03LGD0F8a8na8n9qo6t6YUGoOnDSEFo5qYQxIZ7w6m32oVcxCzF
 x3WA8kTmEAE85/AxRBJwY/+CdIeYFjVL+sqvA4GM3JEl/IN4BD8RGat9fbaOq5qmo5jcuFASaRm
 2FWOhaozzr11D8KGXYc5GLaY4EuPEBo0i2AuwOO1L+8pQ53WYgDkfvMOPtF8CbP6ReXstSfSzod
 Vj7j1I6oXiJHkK26MV8CuSioCCl7zcyxWYWZ9CV7lCwUyZf79oZ7w0SLN+6sEocOnlxh4ku6FdN
 C6rAGHjaT0XUX46dZ0w==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f2c91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BG5ssLDXSr2c2_oRDYQXCKdagZ2iqUTY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX6SLK+mt9Ej0t
 dZRE+hdlyfN+Aea0+Bri/mMmDk5nfHQLDXNU7Ltf/MVmfY7Zevf3iGR8shEAkQB3QRuUqZ19HHN
 HruMLkl3O3vuIokcQpjI6KafgRAXuDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210086

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

