Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4FE3859DC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450892; cv=none; b=QTro+jelifVPeZhWnDILQoHsY3+kEe5qnU4wFtrvjq8xlItuI/Iu2Qzs+RCIh/yygJ2rFNMzafDPwO3XAXDL/3PjTovNCB8jic1RngUSni/JLOg0xBI1UhW2SZhqoWME7IwvGB483UXto0IxBa0PZO8vUVrubb+P7n1lP5Gojds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450892; c=relaxed/simple;
	bh=vrYb2t0m+G63nNvSenUd/NzCQrfLca1rtXAnnP4ag/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXRFxw1TKebYyHbw8nqbLQ9xO76i4WeYlNt/87K0WJk0HVl4W+AaQjnTTbwsACH8VijQ5Kv0IBarLpSfx5AmYrOkGFCcCsmQIRsnLc71BVsGnPAozcvNidEP7Qly79bH3xBxIpBjLxhmHN/FSWPYCGfvn2vG5dHCfvQ8mnGK1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHJNbYT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNtDE8ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHJNbYT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNtDE8ko"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K1SB1341626
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=; b=jHJNbYT3yiWWhmng
	IsDbt3FTdqE6YYZkMTkJWFa6TS/w5Qf4ivk7E24m9DYxIxf6ytnh0vhh9Hu6/NkO
	igPUaX8SejDaEHVTqs/GWgCHIA7GeHQQGm/ER8RUx9RpwMscc2NbTZc1evGZJUii
	CzQ216wbl66qruyPTzfXQFNoFMNkc4S8ggrWhyRmVFfdPbJ18nabb0JfL04a3WYk
	rlxDcaTicTmpuQQSmPqFY9tyEwfY6g6SY2TqFFgXgkzsENuRI0zLsdny8d5i2ScD
	MrJE2Skt0x7TDFIfphqVvHzctn2l0XlTVbnPRFmxxgK7Nx4I6ekCWciMPN7sWOCi
	PAoPbw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t491-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:45 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14fed306427so16932176c88.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450885; x=1792055685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=DNtDE8ko6JfzzzKtUQOMsv2YjAVwZ5I2/jYNvGJgqS3OllAjY+i7v5iK3XO37MkXeg
         DqL+6cPXKs4+PEuAT1H+AklDk7IAOVO/S3HTM2K0RR0F7+yIIaNys2Ns7I0z9QXgiMyR
         xOLX3TZwTerrwWpucf+72Bq1SI4DBR2Xx1TGXtmQeYEKMbtvTUR9YT7xt8hyKj4+sj0l
         YtzvfWmgfr18QaVwu4MkMIYyapLaiahCZjASniSBMR4oLi0Xz5+Kl9Sw3AjHZIIygD3c
         WnuHnHo2wlzBKd7GGs0195Qh/etp418Cwk9MTqzCGyQ5uwgTkYgGW1mirCcKHhuU6kGU
         tqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450885; x=1792055685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=zE2vss/0PyLVKDljbSJBkqkJoxL8ppXLfmEx1E4roeZ9sPQaTa9KEEco/gwdvByIY1
         266BJep58dHhhjX+YPVwPd3Gg4CSe74tZ7vE9enmOG8DAoi8ze3VAraNO7oqQa7KHE+4
         HZh4VWi1zogsD2e/vFMa5t6ufRdWtXl/l2S1QcVbzRghg62st3PNhvr2v1BdHCGg2/Us
         30GooWopUtsY1xyiS+e55ysk1s72bYPfH6VDGqmBiL8NB2fQkRArFBx6AAiJBHl5kAPY
         gp/ypN6sFc8S3xn9qSvPsTJHB3bWiIF+H+/w/2Y7SA3BmzWfQ/mE8nstmxqPAzoZe5Di
         9OXA==
X-Forwarded-Encrypted: i=1; AKwUvByMmYZ6mO0q++kTVXGBDp1jqO/3BVV4PvdFk3+ZUmXWNwfD9VPOtBAiOeb+weNhscXeeiD3PP7xazLX@vger.kernel.org
X-Gm-Message-State: AFuF++mgFccoqGWajggmGVNsp0nOWNduQyB4AxavgW5V4UikqEuRyU8A
	NYuyUjjONqVEFEAaXKmb7Xvl9/1+Az79RZu70gLiF8/fkxsDtHV7194+LTxs1Y6hf/7Io+N8K3B
	/RNPof6qos8FE163bAJrEZQda00KXyAVxMQoTuJARzU9BWE5NR1jvarnob0xYq0Gf
X-Gm-Gg: AYBFou0skIBA1+a0TDQjiCeoE5ElwngrWl2YRDkpNkrHu+/q/iiisk6gm6DcNMGOvm5
	rdidQwTxgUrNP2oQ/Lbr5tINOzTnJALMqq2LSD2PjJkI7ExluLJd3uyaLUIhceo5RQR6yDiBGlc
	ar6R59iqL/aPsUvMNQrVWY0qWjFtk2y5IKvbRHKzIRfQ9v8XtScCPgSFIsW8vmYDguhv0qmnTnN
	5UUGMx3iNSQbfcV+hQ3wooYgKxpnbrCtUGR703zP1Hq0t0bkP/W5gMrMxPLl+xB1quOeugS7U0x
	5tDlSHbSg1eIxuEhvXx7oUpvgmYqRTSer9M+L0P5SeVRcuZWED8emH6R5Hgv7tEP0IElRuervtK
	aWBMKbTLFHNmLKH8XCxgZjZRA184w6Yrls8JENx630O/jr4UPvuaYFhKelFFSeYL6WnSto6WZQW
	rT9ti7GHsfUmefVkqHe1LRarhWvcKf
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773249c88.34.1791450884672;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773209c88.34.1791450884045;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:23 +0530
Subject: [PATCH v6 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-3-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX/JjaY4Lqn0Sb
 rKjQRptJwVoof5qO+Vu38I0XxAFED12zEwooSqS4L6B4Tbfk0YF/Bw4+mlJxD1L0cEFCtvadyJz
 dMakVlprKlEOvCPza9kHHNaB3N2Q1ZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXza777rxFwIvD
 QAQIoNgk3BCsSW7kLwD+9TApK9so1vYmksWk9tjQ6DiHyNq5Rh0jWkm8UXODJMtClgUlKos387e
 of9rYX9oYuQ2beUsGAhD50O+P29pRwGnXEpyAfHNCGrCkYI++tmMQYr6dXvaphZYALYIzFIGH2q
 MJN2LALivxwYyjfn89cKI8f7kpZeE+20+FkBazK3X/mBo/bSV2w6GcBRairMmeYJbEAIbOZdayt
 XQsbi+//7YH47mWvMQVPsnrohKy9JcQwBNxJBCUTzFdz6AVroCAB/vy4pn63rXFjWfo8oCMjVnT
 ncylbp/blnqkotZnNbCSLOwKiFYTpZZ1Jf3sdd1OQaft7/a1bLOEBtuI27KgaSE/qIjHCz1ULpZ
 PIRoAZjZFLY5RBTHPu/kFrn3yKb+JVoT7BgqjWvVnoSTYM8DxV/rIIZX1FRP3Ify3dKXsX+7bvg
 f2VTIkRALs+uxw/CA/w==
X-Proofpoint-ORIG-GUID: kAfQTVsbIlCaA0A1_yddt-9v0XO4VEGm
X-Proofpoint-GUID: kAfQTVsbIlCaA0A1_yddt-9v0XO4VEGm
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac75f05 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r5J3puGfL9QIZnCGJ14A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add DT file for the NAND variant and include it in the Makefile.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 29 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..8b7106cbd7c6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.34.1

