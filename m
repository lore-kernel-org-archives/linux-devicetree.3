Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3033D5241
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175476; cv=none; b=UvKfpZ1WRaDQVN+Sgcikx0LalQ/w7IfT8iWLoNPnR2/JFCbYjlP+F8ZKoUdeRm3YjGOxX4meXODJRa7rKd9t2EaJwlLR919vDRPBmJi5ANwNXhICv97sNt1h6QXKeV9iZAI6KwFNiryPbyhhpfYPECrKsZQzklw6CnAt5KiRkQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175476; c=relaxed/simple;
	bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsYW+OKPO3dw46Li21gIcUw19lYVxKm/wFnkqiW3USb5wbKMfxpg5qpaPUvv27/HTALAUg0KGbO5IlGx7aK7aPPUfZU5JZQQ1XSKBT6f2+jd6LEpRJPigiu/KhvnynUB97KMLWK9iNJMJiqDCoyXpbYdMktULKPkCf+B9xllN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtLNAinw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY24tvAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtLNAinw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY24tvAF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5awCG1251996
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=; b=gtLNAinw4jjDSCiw
	t6Mpon3EoVXm3K2JeSHFmbZbJs2P8jfH1L/5rjcI6Oi4eQRekElJ9lfl6tML6xhD
	SeJKzKCmtuwpUMtytRrjgRRcNtvrPUulG8bkcsxJE4L2vjeUd1owwSV82T46ESyN
	+LbisWhifLdSF4ZV/OhgV0EtDd7Ha+8qGFJqITOx5PCot0AhVVxKNURjQ42nIvfi
	0zGw3hUUltJrHrBqDYVUT9oALDtXGTjdYF//JS0kcYRckAAKWBeUIj6UQD0lcWQt
	d8zKFhHiLGjBW+miY1AViLrLM2Wo0Q3iqy+Uyy94/cA+pDdfkk2q1nIxQwtTU6XM
	FM71xA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0kyc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:24:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13536592ebeso15438266c88.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175473; x=1779780273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=NY24tvAFN+KuM8eVafyYnbCus0bQjkpJd3Q5HN3R46jC591UP98zKqvT6eDMpjmoxk
         e66f0mMLQwBCFdeerEORzlI6+tho1qThK3dZzSBoDDKsjEId2cruqPt6nnMVZwZz9Tav
         oIi8m+QtiqfhMxEhI52EsgKQFNPG+yEZN5PYpLlKAqVsl3iyryqx7UCZgB71XN6Dx/i1
         iGuL5kBq8gvzVTYahwejdfaGO0d3Tqundg0Sn+hPUIm5uPQLTcUcPy5FQTMaY1pyEKgo
         a6bck3mQVXF1X7b/fIJkl1vwh9yAQshitI0vCmPb1QhhIUBEOd4ROPyVFbxAy0Yp1J56
         C2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175473; x=1779780273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=njilpSofWaIGYeqlmWZSQX687HLrD593ut1BvfYPbBfphPak/vzY8+IRXwJAUKrsC2
         OhQ6ueQmIgYVLymPwAgvWoqRWB/hmpzg1hK7To9b3nT7n2acDecjM1jeQPLYndemviy5
         +hinVRS//dwckeqK+00MIbojyXNVRAI+QwnYTkUJLS4doUak0esHx27oiHGRArG8zMlv
         OxQqGYNcFh2JElRvwW1uKFZxlYTN6vuFRx+Mu7Xsj8RYvBnQG6Uyx95xbT+uLKfR0yIP
         wxCenehRwfb0A4RHpv3l9Isj8/3yJv8z41RaiCYO1KHQ5Af6/zDSulW8HHd/Od73z6nb
         iOdA==
X-Forwarded-Encrypted: i=1; AFNElJ9Sr43txwC2OLYk/LBNM3AWhx9JYOtxVh2UyRGvlSmNUd4qs1So2LvLU8SEyBlA2Vxj0mu3eoQfc1En@vger.kernel.org
X-Gm-Message-State: AOJu0YxQAlywJTjHO+h0KM8s5N2D8jRVU4mhlZ6qZsRKAl/eTbUXmz7d
	71UDrMsLQ2Dj2Q8tcmaKPNFegl6tRnOETJTM0BD9Wrp5gQL/SySHWiq/6EVw/MTaBBh78q8yAre
	kw54aZK7MD4YHMWpCjkDdh0DBFCVTo4FT0dMuQsm4fHu+5DkEsXl989uSmR3jGkOg
X-Gm-Gg: Acq92OHy6LjMGZSCfgCVvE3DHKFRVO70fsHMt1aa8nE5d5/DtzPW+8VZxuGk512pfj8
	RRMIYfYoyDLM2NbwGRLPfrKCcWJdqrnug52au3SPXDjBlo6pIrthalLjuubQL0EbAYM9t6WdadO
	L4ZCriTcCmH2ho6dt6uLEvTIJlUyg6TXnNPyXntuwiykRnr4f2exNVPLfZKgougkQT22YfjNglo
	e1xKPmiaXJaz4okEH2QPlD8x8Ei00sry1vFIQ4Ryk/pKlQLsBUr+RE3ZfHCSLRhA9DPQkyp6uKj
	CyawDfZog5zsYEfcTtVfbyUoLUIk4TcqFXjrpoerQlYzfNa/yly95tS2iMpevWYnd754HjbslFj
	0V2I7jBHovOnL/fZIeGId+ftVhARFFx0+Ls9Lfg8gwi+VrkBWHjar1q6XHw4Qt1EA0RCqH7Bl
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539959c88.9.1779175472933;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539943c88.9.1779175472389;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:24 -0700
Subject: [PATCH v6 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-6-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=1799;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
 b=3R2bur04NLC9mbzUIEVCHdRIjCSiX7c8tDr4/ZvfHNleQwg5SpI/XwPd+VQtlHlQVM7lrDEH2
 /KBVnDvsOKNAXw+teUkL2UaquJHrLlbKE5A/DTxSk9mO2XuyqlgSWnW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX764mZ/GfxAVp
 DIkwPoxAGNWy4ZCt0SkDGrGDchYCaUngJXcnr2ItCMGGz818nNHnFecTqzlGQJ05RjFG0k/wBSI
 TTlmTBpKkvEWs0EsvkD9WBPsnvdWjHGwsSkgXkPZ2tWZ6HY15RuGmBQ2noFdYdZR33LqU/D2x8G
 uY5OB/R1O8+uum6cGihDTrSYGmx9soUzFxQ57dMNjaPEQUQ7PIH6VBT9+aCqGO8HLmaEtHLsKRN
 TivTm6x3D43MOpM3CW4u7IibIMBwCqTmWaqKtGfIwyah/6EEAJUwJjab67ka4+u9Dv9zx6wUIoG
 GdOoyZ38n9RJ8vlnE7dHCuWsowaz7DyMPGiEnjf2cU7fiNbnqeHE4JPPwT9hnzG/bUHBsfdhbmv
 W8OAtUCeybPX9mpSWnKlN1zbCW86R/+HF4vOmV0wXw0NaBFz0mVEixJ152Vnnl9bZNg8LyuFgRU
 I++IMU5d79SJkWO39WQ==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c1031 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: eVzTZcl3yYuufiJUWmNzEXuKyMNWVbRb
X-Proofpoint-ORIG-GUID: eVzTZcl3yYuufiJUWmNzEXuKyMNWVbRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ac2a00aacd2e..d2ea26562c07 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1588,8 +1588,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1

