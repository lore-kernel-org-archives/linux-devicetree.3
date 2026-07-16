Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE5424D75
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211934; cv=none; b=Y/kJ8Y7/j9MK3uaJlhnyvxnLKcmc3GpE6hBfo6Xm2+Am8EqZE7geOIcKOS9kBWp63fsHZbNNxeY9tvhbBZr3rFoKaZH0zvtTidv8BdRFXC6M238z9sNNtQMdsX0T4TOazRaWEOk264tQoMuCrJc1ErMqwT0tzI+8P36OWJMgIQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211934; c=relaxed/simple;
	bh=F2pjUZPSQSG0UbROTs2H68prkNCNZx7c4zDAujqDi/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g/L9WgY63DKoHW9njTMOPpmiMfN87ObGyjzdLfkuVGRdfPYsFrXi1B+0WCr0NW7YDkn4Y1IexMV/Ncr3R6vce2T13VDNeWPMRMxEk8UXnALq2oka3A5GB07v7QnIdryuwvQK+Rz6JA23NHDqda6Hpjtv2nMcBgDm8j7yB5W0qqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIKydUle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fq+RmZqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIKydUle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fq+RmZqA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJdLq2946554
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4VVPsqKfWwY
	ISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=; b=VIKydUlepjo1gLEbFxvHtJz7mCL
	/6ATMz/NI55zimZSGnzClM8zYGJl5RlsuDJkb15CIAZKr4+U8KQa+RgHhKP+tQH5
	PKuU/oGfF6hojz7fNpAoiyw71zUkt7tKCzIEWl4TYTAN5XFVUY7YJKcAxD4MlSmF
	P0XnuCfsB4bbTdGP8GNjomg5PeSWFEorzClU1iij6v6Vew8ksdcjsnOxmNWYlg0T
	UQ6lQ+jn2vQmy2ptLptIRluauTBHYWFJSEExYYjghaq2xHYjPsouMu9hghzNSP0r
	/2tCo+K+8SWYLGC5j69RCL99yXQWe+J5G3pz1HqMDPuolBqTfuKIAK4hOgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4waxff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c075c1e25so84919251cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211931; x=1784816731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VVPsqKfWwYISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=;
        b=Fq+RmZqAkcfLk3GZpR+oBLEMq4Q+BnP2sHmJzkPvZT58p22dnx4U85YjoZ8prV3p+9
         20gwARzY1zirNVNEkZ+WEognk8ceqXm9vMcghB9k6Csju6fLLzxAjwIr+oLWsZHJPz4g
         fOemz0STZZ8zt3SQtHihoqpjKqH4/bmwvAhEz2aYWRNNMRPgL0b7fOVrsMDGh8CSaNIw
         LJbtrpj9wqFAGWPB9Ljjlo+lXw93rk/iGCFTqIw1xwmHRnv+21O2ek3r/miR4UmB1Np6
         DKBXesAaOe4+s/w+412RPTrCi0qQ8UCz1XsAqUGVOnNGr41L4lREBPLFEOgs+F370DW1
         Af0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211931; x=1784816731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VVPsqKfWwYISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=;
        b=i5Zetd2kTWYUECZNKJ7ZQPr6mOuaeFVlSOYDrZgEuiwCaeakS/DvBw8LLyecMAdsbi
         uzKbztBGYw8e6Ku9XEwTFcUUdw1XT9rmreTv/v3M/4JehSpA+JWRTttDYUT9xIna9/F5
         9/yL3KR/etypyqerUhR6/m26JZhxsgr+m87VP9KAZjoPnt6uf55kb3NcSxaES8UjyM8V
         NCmljeIWQ1ZDq4e6WMXTumt0AYJsn3Ay2vG0PJeG3+qHJbop4b9FH9mjJsm7Nw8vBVnx
         QhrL6dWqQ/uGuKdKffTpJgvnCtC6b7ZIHtJMjmuCrISy+o9q7tK89YftTJmDlj7LWI2O
         X4Jw==
X-Forwarded-Encrypted: i=1; AHgh+RoFLbyQwg3JvN1HBTXcIGd8AdPgasvr1NudUhwhrGOwvgHalRkhUE7oMYdvsZ77ZZ+7C2tlRtt259Y7@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjMzGLcdMZe2ZJ8wgQ/iDpQ6CqgXuiHIvwUFYD313/fKIgaSr
	QHnNjR2NSZgGX8sYWQjSH+Hv322OrkETa5qPeBkQlylNtf/xnV3KOyKfbUysQQEqwje4LUkL8mh
	z73S9coMGPTJhZYR+NRQDjDaIL3gqqvbi3O/8W4UlbaJfdGifxwyYLNu+CLRo7XTi
X-Gm-Gg: AfdE7clYKMmJdJLozSI/GnL/CrV57FGI6vizXUOim9JGrjLSqSe+wWTyXiqWK6pypo8
	N34ifO2aBYjxEyVbsO/qJh8qy6rPyh/BavA9nh0sQQmMcjsooLo3yjhkcEx3RT/JajYY5ohHhMS
	rHBNPfm9vi84QyaEN3pAmdoeaLJp2/yoDObfVllvDUrVcoqt3P4Z6dND7YvBtLqC1NJkqTfBSz/
	ApFfVu/2nyENTIpsMJ6TCbG59rmcVk19O4X9w8JiJpW8Eca3ziCJZ2AajyNsOfcK0QqCxGbN5mb
	S4+KiKefWexMzrpspYEBR3DiwJil1kc2bzby7/wUnZQ6ZI88zNy15/RbiwB4gyYoJpwms+0iXxh
	nzhNLDg1oMkuuFTgHBXLucK/QxLbYlrMmmcw=
X-Received: by 2002:a05:622a:f:b0:517:9095:c329 with SMTP id d75a77b69052e-51e42480577mr113368441cf.45.1784211931019;
        Thu, 16 Jul 2026 07:25:31 -0700 (PDT)
X-Received: by 2002:a05:622a:f:b0:517:9095:c329 with SMTP id d75a77b69052e-51e42480577mr113364411cf.45.1784211925232;
        Thu, 16 Jul 2026 07:25:25 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:24 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Thu, 16 Jul 2026 19:54:44 +0530
Message-Id: <20260716142445.2767955-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58e9dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JwlagmxLDNlzgN86bHYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lZlamrgQGxAivSc-jvgewUFY_KaF5us4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXyMCkEVhkE46k
 Oaei3PgaH0ZncZUJ1DD6hIhUGHaG/I5iFK0QI2XJEmpfyslyird0r78irWULyql2i9gF9ed6P4Z
 cPkbFFkBMYet0FnBUaL8x1/tR1AWR6o=
X-Proofpoint-ORIG-GUID: lZlamrgQGxAivSc-jvgewUFY_KaF5us4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXyTrc/K/zgZ9p
 LJU579AfO6tJdcX1MN8XXJ0FDzbeuDiWVCqkt98eQrPAFBTPuYYuMF2D///edZo/gaUTEATzs9N
 JE2oVbwbB5+Vsv2J0v/8g+sMHDkG10H3uwk99Ljk5yiyZw/tz1l5bTTjncGed8pxbDPCuVihpdM
 Vh/2XM39udDHuFjdx4MSjCTxtHjkGctHlM60QE0UNUMVB0k3ZWO8p8mxi9sJuF2UsCFbt+Hy57U
 I8kt0se9TYcQfDwBu1Bo303pqZaXnV7JZ8J0LZkk8sgy5vydwYr62XfUnvHCghiR3qI2stunna6
 HbD08Ez/lVW6FIJYJlXPsg08CC1IZS5t5QfaMSh3CMcoLRHewzrQGU6Ffao/8/3v++lKwCNYzbg
 dwbjUelgOBjxu2sHC5cC2Yu/KCVggvvJo4Hal8idW2y+LuMkou8THl1tQRCaaTs4KuACX+1A83O
 Z3pKK34eurqwFuInyHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

The monaco EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
configuration from it. This allows storage media selection to be handled
through device tree overlays.

Introduce an SD card overlay that enables the SD Host Controller
Interface (SDHCI) for SD-based storage on the monaco EVK board.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 3 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..20e5a0fe7dbe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -70,6 +70,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..436727350dd3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -694,17 +694,6 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l8a>;
-	vqmmc-supply = <&vreg_s2s>;
-
-	no-sd;
-	no-sdio;
-	non-removable;
-
-	status = "okay";
-};
-
 &serdes0 {
 	phy-supply = <&vreg_l4a>;
 
-- 
2.34.1

