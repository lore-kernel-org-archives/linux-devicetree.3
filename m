Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1E33C8724
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743522; cv=none; b=jkdjF1JT83YjfpUoZMiRklYzb9w1UoBHzW8ikQn3InuO8TNfsplLU4AKTFKxTCXgtX/QXSrgMiYF2vgaTNl+WR55mJ3hpeUapCOnnptBgVQwio8z5F1ejvqE/Pi5/SSNc2C3alMmBLN5TatgV9ZZc0I9OPmbi0LxnIoccttBtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743522; c=relaxed/simple;
	bh=Pp3H1/rIFLOhPVqMh9wOTjrIWW/51yVYEW5d2cMUT/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UiAYeAFbRKOynOrlqOzzhCfHelbB+JUPRv4KCWctHmbBuEsMFpwS0AkNBx4Fh1MRpd6B2+G5ZHpoQSWlRkMijDfzG72Kp7kAMKXN6MSLsTy0XyBkFleXxh3TZoX2xI90tP/CMSmjWpSxv86vWQvRVAKqC8jlIAlWkHAR5TKnR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuPZmMag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGW0btQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuPZmMag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGW0btQU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGaBb3732416
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WDKZF3IT0Tn
	Hy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=; b=MuPZmMagAyAx8QFklHvaj3147Oc
	JUlJqHYth4QdzSu1yQHd5jTHsuiZXLROfKE4S4yicSLPXYoD7uFhe1QF0MdFYKKS
	jmDgi6HKXk01ZCpFWpPonrSrAAPuiJPZRALd3H/t06XSuRtERtprX+xMOFaO0baR
	te4LudAh8A2zLKUHZT7ECdrbwxvj56wxl7ObDRZG8HdbLKkAbXX1InERp0j85Z5H
	0wJebZI3HH2zd/GKT9Zy7PfZPYV7PPR+yuP6ABMHAfe/MpfaL57KkgTtly1Wd95U
	J85B8XjkJ8GZ0SMRJ1XY4Z3+TyRMeo4oGNUfYIFSXshfjCp9GOUOh3+an0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrdmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1835002a91.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743519; x=1788348319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDKZF3IT0TnHy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=;
        b=IGW0btQUxRBEoRr9I7IhT2lTxNjWyLH9TISDeUk3RBmBsKhG2FjrmEaYraJQv8sLG/
         yyaZIcDp+hrMHtFPCWkYFa1lGTuR2bWuhSEg+FOi526jcLsAlh9OEvG3X8rotYHqpI9B
         C5B2/Y1X8RM+dkf39zp+ykAmoNnoKPGEWQy5jfvjN6f31Kn3I9C0lHolE/LcF3H1F1Hb
         CtJWoRawA30Kj7ajJ9gi4GUVYVGxzafT73CKnciTpGbLwx8IQAk19AuiW/d66Uv0DUj9
         Zgr2ur4lGzaOZhNijv0CnYU44ZnZTF9WGL8roUNZNmq0HONk0h180SQpruRgK8LJayao
         AoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743519; x=1788348319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDKZF3IT0TnHy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=;
        b=dZS73/kwq1B5dE6a9BvFpVDnTupF1QyboMd+w0T7FAPounCcQdT0z5/+AO6dyGyhH1
         YaXqlAlvt4spOeOFCrzMcAGahxWfzvT1mok6XOYfIUMUS0OYjGzZzDT0IuRTXWJqRsmk
         YXfiMGq4LJGKA5Nd7msW8QRGRa4P3I3iLBhTwZQGtYyzQiQibOd1f+9KGOmpuW4Irb+U
         +S61VLcmzMkfMg6UBoG88CQUedPiSxl5wNzgtQBtfGKttC3ambTA3ArptLg4TKCLKtiI
         AR3iQYjDTNAhhpG67ndkYhn7eUpcHWJtpds+r8ZB1igWEC3FLUs/Lkxj6aJis5KnvnW/
         8EZw==
X-Forwarded-Encrypted: i=1; AHgh+RqkAm7MyAIFDHaBuXB9Pheeq+iTtl9coJXOKSASTC7PV4PRUOiBcJ8vPQCnxMnkWFauNkcPLFsEVYoj@vger.kernel.org
X-Gm-Message-State: AFuF++khOpCjNh7M6SKwGlEUsoe2vXW5k/uLHmFN36VkPQFUQrrEyH3U
	hRHS4fZ3szqHtufRDqBis4/bnpSbL2XcrmFhFax6GgFqOlUYTem6b9p8op/udDWG8kjv6yRR6pv
	hWod4VFBfYa+q0+y54v2w9Pw/tUfuhcOPSOpPCT2c8TjDeuzdWdUohjno6eKs2+LH
X-Gm-Gg: AR+sD111fD0nYBwd1yDGZR2Gz6fHWVj9Qiz0QNiJ+u+0WML8skHQHGO6qru4H5U4Yuf
	txlaf69HpmF4CIVdFDXzxnIIU8wlvr5nTEM6LRI/0P5DXAHT4n+qFG+EOg4dsTX7VYLcE9OSUXs
	CduOVvh/DbQmUhBfq3wITr4EMh+djHSOws6yfR323kxg7gEPsIqItWhooZxm48jtCbq5IFgbXTW
	sJHg89YJVXMz2OkMnUJ0LKOqnGe0/s7zHukx5OSrVA/0/M2khZgUN2jW4F93x1FIVjfzlrTXEBA
	Y68oQ5E0vCZJuUa0gvmbfkyyH8NY4jdFUhyNej+GG8hL1Lt7wwUiv5VHqQJVbC9h08xg9lPJOOh
	z6htvoWWmY0RtZkTJmwjgGKj6c1atqOuyTGU=
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr13562642a91.12.1787743518797;
        Wed, 26 Aug 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr13562511a91.12.1787743518263;
        Wed, 26 Aug 2026 04:25:18 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:17 -0700 (PDT)
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
Subject: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Wed, 26 Aug 2026 16:54:55 +0530
Message-Id: <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX137XG55IjwqV
 43vZ4eFgKXRfBDVNUxWXMZm6FzEW5/28/68bzKQzbjxn0O/gN1Qa9OadDlwKKpHRDHmW0ihVHrm
 4l4c2L9NdN7Zxq1DUNbesB31VRUgwPc=
X-Proofpoint-ORIG-GUID: vZttVc4LJQchDFAld4MwtaB9iae6wzj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX0yLjR8gUjgg/
 SVnELZgK4Hz9qYs4LpvPmn28HWiPqq8g1IJM6CiKlMoBPevR2qrIT63r5eCbvvCyGihdhajkQEP
 22o+Zz+nsKFsCV6PVJ3nU0d3zuFCrFJ9ZMR7P/1uKv8gENkiXk/q411SS7yBphZ4q+R1V11aDhU
 By5olXrM5oa1BqyKB/pI5Gi+rJAM9A0ccyev8CqLuEpOWLozmJLhdba+1zEoHRGu4B6wlGAhtAi
 mpHiz94N0fNNfgPxm7Mklat2jmwCp5Zbz63r87/OhgRTegEKmHJtpQaqgoB327EZA41sYlufYK8
 TsnGWNOi250f4ETEmZZR8qb1QVUW7iRyrae6pljM6dIMVZj0cw+JYTGo0AzrrkeHI78w+Q1psxV
 Chl64br0rFAf5HundVWPM1TOrSUSKSkf3b4wWWrcjxkaJ2NYXiiM+7lHFMu5dsLWIDJ+IcFD9L3
 SfGJEvBa33+23o4j/lA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ecd1f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JwlagmxLDNlzgN86bHYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vZttVc4LJQchDFAld4MwtaB9iae6wzj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

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
index 1c86e7e98f55..466d4b67f72b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
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

