Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613B4071F5
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756447; cv=none; b=clkN7a7xBTqMoSGCSeJ1Bjc5wd9ilhZYEofH0wDjNPFKGkgK1imQfZ9KdoXIF6cRHgMjY+rhoOOAXQm1Xsw6xYtNGYOv4okGXqq8K2BgKO5PPiBxRUsz8PxN/KcTjCzDyvUInPo4xoLHXOj2v/wzq10wDrdf5ryb1eQexTZpoqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756447; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fz/mwZclQnZwkMJyxSKOB6+YJb8zXyI27VPsvJPNyjUCdxMmvWtYt7tVxoMP3JTEJoKNwrRoZ58hD+jRfvK1voKcAcPs1gEnJZvAW/Mn66qMPYMNW/K7adIIEOIaEBe2Fqgm6PNW3SH2Omna+q7n8SwaDuu37FZgysB/75NYwgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aD6pkQOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4WHoKdq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aD6pkQOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4WHoKdq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673BQ4YL3790798
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 11:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=aD6pkQODAnkmWHVr
	c6cuyGiillAX8wRdF78niLwxbH0dafWIUK4Fj2bC4c88EuTcks0UFQ2LbTsMjigM
	XxKQP0IsG7SG7jucKNLXEZzeRtCklze9Rjo96bhpgD/FY8G3eRf5dfDJoISZEsQS
	VeYnjgT3KwGJxbw8JqzAIEhHYHxkvLxE89ppqsf5Wbnps22cvHIabAzkyZvYiukB
	KEN39E/siliQWCoAVK9mwWd29e6hxy9oeQVmvw5TlBw0LO6Q5nh0dFbAifj1ITeX
	3XNlQcPrnm6XEPqPS37ug34sCkyxvyZliCiy2v0+BcQfxk0AKS018HXK/46YPun2
	3MBf/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r15vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:27:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so5786795a91.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756444; x=1786361244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=R4WHoKdqsVfjVaPZ7uq9zT1P6AuKBF3qJkrvagjDhl0STnVOzStZtMU0gpyyJz9e4x
         gdztSBRxEBaBWkK7QIgv6os1ZAx11EGj7rUIqt4ZPVPmlpsloTxEOwnq5ITpeRIJZ0zl
         nas+j6k90IqKhPxqOCgdDir0oiKRYd1gceq09lnKhIqxVaajJ1cQfiGJrxuT1JkU94jo
         JHTifgfuuCvwbe7Vs4vnOMjvg8ysMBqMw7/VgOL64VwvP/zPD+JJI2N/pTVo2K3VVwGs
         SB9xjrufQod+9e8Sq7zlXcQIuYWkd1w4dPZCRmdrf4eaZCbKmL4D/dJmVvhggnwpKNuK
         /nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756444; x=1786361244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=rOhx/S/vUFxOyuZWpmfZD9me8QLW+oLkj9jqh2yvAv9tUq2D/fONHnCrvKSpO30VSx
         eZ+oXNLSycFv0w7KsrgRucrIHFzmgzlhyxxMKpDhvD34yw+S1EglyDdeMMiC5TeJkZkq
         Twe4kQfgrvq5lB1Ixd+0y33VCjB/2T0RHuPRjf+FK6HzYeKHBDeDPA8ObB7WpW9ZtavO
         rOAgZIB6fSgQh1rOMdcN/N+PWyhtSPC6CE/DWQfX0K8U2eP8/Om40+0vRF6QXIsIaeOW
         1AWdvvE0vhtyn1cHY62tddaT++9x8E5pdI9Ue7abiSkmgIhF4PdXq052/Gnat9Vs6Ivi
         59XQ==
X-Forwarded-Encrypted: i=1; AHgh+RonQVTebeM4TuAni+FDiSA3zRIPdKOEIPivlWbEXfltesWuF5nG/z0pjc/cen3wW/x645GQC0NuPJbI@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdTV4GyTWRcZg4E/bBM8n/bipKOnYEBA069/zrIUQwcetQPKF
	HXJs/QQ9ignbw2avuG2XY4kCD3jaa7o1zTXEU5Z86qxzmYzED2vunRBUrI5Nwm0vT10PnOzwKJp
	lA50UwQ0CdXr8HmROm+XAASGsEfiRGR7Xep4PC2KwfNMbDZdJLm5v1QyFSRdcVARM
X-Gm-Gg: AR+sD10MWf0Vcta/Z+qynnLG7jA9RFRaOliJHjsFPNDoCY1VCE+knpxZTVNGt1CN1FD
	wKJb8m+3rsdISlfE8CwDGJgJk4/KcOcElM2Bhu9Py+kJbNL6/JuazrJfnTLxlfhKHl4Kot9sRAu
	+L4b1FDY6Jqm0Fid4GesDuWCLoiC3YO8XlKGmCPX2ftA2DhRMAGsgZ+GEQ1gZaPmixOva9uJACa
	jDwDsrCs/AlXvmj+dFw2pOVLuwkfEAylIZ/wl29+oz1QbTmWPSZs3ulqIqMzt9wvqgDxjCKFFug
	QeB6e3bGNMvgRdYOV3LnMiOoBr7PjR1E8HekZy5/1ZKBIiaSU7nZvFcXH6KycADgmTxoZlNPLth
	zG+t0NzMKO+0TDVo=
X-Received: by 2002:a17:90b:2604:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38fbc414a45mr9636364a91.10.1785756443681;
        Mon, 03 Aug 2026 04:27:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38fbc414a45mr9636338a91.10.1785756443256;
        Mon, 03 Aug 2026 04:27:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:35 +0530
Subject: [PATCH RESEND v7 06/10] arm64: dts: qcom: shikra: Enable CDSP,
 LPAICP and MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-6-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=3WW/jjVoanz9dGGn8n7Xshe3VA+MsMAPWlb/jTF9G8BpIiqQ6uuAEhirn4hQabaZAXkL7dgkK
 +WM7KzaEgThACPVMVg6h6ZMom/Tt4djsTSv3ukejIESEuCr6SpU/Txy
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a707b1c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7Y_IHltWAQC7qmbLn16rrxZgD-XTLnKA
X-Proofpoint-GUID: 7Y_IHltWAQC7qmbLn16rrxZgD-XTLnKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX60Jtg3/eTn0v
 ypbIuBRBJyZHh9dURYce4uCy2nxucQLVqip1etWjTT5rEvYCl5F1/SsQ0Sx+roEUays465dPp5w
 /bZiYqaZ0HyLnDQH6md8uKfCFWf21uI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX2+iQUzwiGApC
 y4dzPgxl6kAQ+5loL71QweUBw2WvfqiEJ/ejMH1bqsvOkiQTOgRwbGURpbVBgeldPf1o2+NdLzZ
 Aex1YktvzgPn3cyxPQfSrBc0qjAMPOkSg/jNhr9S2r2cdiS/TEGcwa2HJHwi1/HDoMvgw8OloXc
 r3a3U6vMt+UHnEyGwvssdwLBIFgBf8+o1lTUSyVV3VNUytgpGtP7YnDE2MM2UKilMqfczO8pPKX
 6PnEZGDSYx2f+PmmM+8/iKjiRMBpqP7BirvRshS6LEoGq4kt0DatmPqMKvGTdqWuvyxY8n2FLAU
 OUWK6m4O/4k2TjYoY58J+LGtQviVMJf8PM4PuVsOG/4UDNoELOkXQxzE56gWoWHno5FEFeRPdjl
 Gg7FTUzdWKhUoLciVPX+mIQ2uCZ1ndTk+MJ2ta2BOkBmc8KJ+PE7+cBt4dVZ9ZFOPv72aJlivrP
 vIXrQSG6HWLe2BPyniQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030102

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

