Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A69279907
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032442; cv=none; b=o8kaBAAstSExrrWg0l3AtND845nPPq1HedUrCiv06CPv9LYhbk31i1llx1O/9lwCiSpxivx0vExG+yxEcQpYviI8qJq1cz/VOWU6BCaE2DOToRXU4iEeF5yZDiVqnA50RyJyJ0Oo8PkzflD9DnaOY/EEz+L+DopxYWK02AQ2yL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032442; c=relaxed/simple;
	bh=LjCRoQ9v6mm0gbK6meWatiEaEoIf8rfjgHpRbM2hWEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXSlvnAGCicHobeyeeMvBlXWmKt5Grh3jijC5BlWhPQ1Zj7jcRwEf5cXUNO/2sX5NGuD2rsrAGEiUD7P0DHGoXkz8rSHmeIfyEjSznY3q6NW9Qfq0GdRdhbKqd5d8rEZmDh2k/PKFbBYRVxEHG7VsHqW8ku79CPWZoZITsmLAlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrW5MyWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYtaTDwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrW5MyWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYtaTDwx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIK07A2021085
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6P26DwrRHs6
	Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=; b=PrW5MyWRVSwKB+zE6EUaWK7LwjM
	IrU54G5jmlKiI3KvfbHpTLuMyHF2YBLEvQp0NHWFS4lCOPBrM3lKSdNmP/sMSD5X
	MjlbFOEbNzMziNGGdwT3hUXKpPb79uvJ8zWBKXBesOOzEDolbeV4tCWWl6AWAwJg
	AU0sqB6HlQEkhk6P+yObOpejDOKT8lGJxbcuU476v/Jqkag/oK4bquM8l9t4lYeI
	U9N8/+gyLkhHPaTUq0Jnrh1ygH5NTqppwQJmBypfz0utHcWi8BFnKTlV2nmFUeBy
	rGBZYhrloq/aGMqeXTJtzeDIB7yxh3ZbgGHu51ZM7Ks8SSe7NXCdGL9FoYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so54915451cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032439; x=1788637239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6P26DwrRHs6Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=;
        b=KYtaTDwxfgbj9KE+T3xfFofI9G+nlXc8GFo8T5s0MnbfehhUqVHxAxJ1EBwjiWmLAw
         45rR9DzUAf+0lQ29sJlOBSE4ovMAy4kdaimLvoXpZKlgchhsAUIKPTOlWaMbIEAPqNvU
         uQo3U/zgPID+DYr2BYK7eOgAENAQ/aXR3MQ2GWR8wD64HnSAsLDbNfAUNJdkaNJRZOqp
         F1YWAU9F7kpUd3JNr86oHfapYX7KxLeI+58MPTSXFvz240m5LzsCOzhPqGzLA5PfnXbz
         Dvs7qOd+pVYo/EAfYdjHlCiDlV/4nWfIcLeAZl+IAIiqx6OaCmpux552S/451zykK5LS
         C8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032439; x=1788637239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6P26DwrRHs6Nh+TbrqSZhsbcxSipg8Yf1pSl3q29CEY=;
        b=cHvt+fDFyDBAycngIYKmrbv3g9/QI2OKQfkBtK9lihtzC47tJBPNiRPiWv/Oq0X+Fv
         +tfUR+BJShMLLXq/MJ49z7bPebt5u954FB0lD+R/dVCBZ63Uv+5HHeI3dJsRve4jrM4Z
         un09RyGRa+ed8XS9u09Wwxj5lfpXGbJDPmRQbU2Oqbm9Pj/kzY8EUWaRMpQIGPJQQcuZ
         kQzh3K5wkkteTE043jyfuJtb4Dg6cgb44FhMiiJx8dxz1LKwZZqij9ZKj7qgu9COPDmQ
         GSDxqsPLQx4xTl0UFJFjmrz2EDvhDQmDOAbt5e8R+N09di7F95HwBA31nsP7Bzi4sDoc
         HDVw==
X-Forwarded-Encrypted: i=1; AHgh+RpMtEfsdPsvV3H7kbv7T4hKfdpv+3tSd1ZtWXMVdd3nOwLTGlp3+nw8PNEH43hCjIuSsDHdL5Atct4g@vger.kernel.org
X-Gm-Message-State: AFuF++kyDfzBUkfnG9Jf4aQRcd+/h9gbj7Km/0xVv8UQXgqLGWtwaWuy
	a1LocBpycW6i8GJ1/B5TI0b0esxyxlcPqAmuGCXCML2QjBW2tRbZ4bANnzHKSWDODT+duErDZd9
	h3CfgxxLA/lv5btVZE/PYaRIxFq/eUUwlOC2n7Ezi+drPkAK54QIo1I8r6b2VTPRg
X-Gm-Gg: AR+sD13ffTxer7YZNp1OP/ubl3NzowkWfcb4adD47DeqVlIp3TTxhfTgWbwanRXp7vd
	6BHhFaNWD23DD5W+ie/gJHKHV8d46Mo2eXEAFI8KWttLLcfQXEyQ3D8gtXeKP50ae1jw116n6mS
	/Vci/Yh2N7g1UADsUR0OY3t4ErhXcUbpMG0a+muYjJCJ4aKfMvBwoKO7yWqGdQY6gP/cS4L2d+E
	/L6y0Ap11sW5YaLQIRL/8nMv5/Rw8BjCGTXx0NnhiJTXnO0OgRCk6f8D8O6q0/bd9dlE02K8rUq
	G/eTD2Ig9EADaE9Rvp0pGwwrltZ7JTfr6MfD/wuiAZqQdk6jJ5gHrGz+QyceBjfS3LAC2SmO37h
	Kz9A8vixwhJrj0wQ=
X-Received: by 2002:ac8:5e51:0:b0:52d:ea18:a8f with SMTP id d75a77b69052e-52fb9624e53mr184585301cf.29.1788032439212;
        Sat, 29 Aug 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:ac8:5e51:0:b0:52d:ea18:a8f with SMTP id d75a77b69052e-52fb9624e53mr184585001cf.29.1788032438673;
        Sat, 29 Aug 2026 12:40:38 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm65736555e9.3.2026.08.29.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: imx8mq: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:24 +0200
Message-ID: <20260829194022.107807-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20231; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LjCRoQ9v6mm0gbK6meWatiEaEoIf8rfjgHpRbM2hWEc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWnhwfUUzccb3AlGB6gDlyoRNkCodAxJsuVG
 vxXsJS+syGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1pwAKCRDBN2bmhouD
 13UqD/0RnhndcbIijGFdo+AHm/J/QA5RdHWUl7ou0MFjBuJKL5OnFH7QQG8px999D6sXGOj1YO3
 A9IftuKRZ6sAzMr0iJz7MOKHuissMGmtWV2tnoggcbdSyTZ2WZeYCZvZnTmfYTC20TneaLrl4KP
 WQW4cRLiFiGUjoBI6h9913EKbLOMIiKwrsP6gAjGvXYdxa3VzvoF4+48fMWGlJpKAkHt0WH0jwR
 mxQLq8mQp539LQk7ZvM8Gjaylal4nxAShwEliI4ks6eMesYlpjnAVasSr26NkIj9lX/MT/grdBE
 etSFv7OLKT7kw9D0w51yoP7BQjEoM5xKVb7uEWqQFhDsRw7q7sq0oX3RDCIDqwoIAtkC9GRBV5K
 MH7gTW1YHQ0plEh7jQajbAdf8exQTjjmYx9c4tmp4Vtbkex7egi1xZ+wS80nRedd732WDx/BA9x
 q8kBuMUZ1bvRlM41eCWMTcmPRYxYEjO+FdKWjCE1xgwhjObuFsSmXXyZAwc/+do6q7PnRwFgtfg
 1RRSkTzHft1I1puGcRmyGZT0xpEFYZXWpZyE2sOo5LDWCHHMq+GNyO75fH9YK8ENLVGGFm3yX85
 PQ7+HVRoZCQ9dC7MRWQbaDj9MUx4MiVqePQqX42ULFhLNwp5Cg7iV5nY+vJv72UzUAI8r3VICEe OPDvGvEMVc+D89g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX9GY3VMtz2Tzt
 cMekTtyq+84qpSgV1q6wmux82OoJvff9j1tY36U0cR4d5fgnsbQcbcpQkUosIzBNcxeHOYgBQZk
 DtDgOXQSHy2OsXBA4qWPqNJKzJrxhFwZ+S2HZUCDAWTRP15CYOrOgeu4vIZnIxFmLifvP35YK0v
 m+Hla+qG96C2iNJXX3MKcO5B3Jafda5qNH55aDaKb5YK7FEpoLaQpQlASjNN/1GY81JYzEKGzTQ
 E9o2J968YXX67k1TgEZ7ecwWuByC+NdK3v2d8dPFNdiBf/YuuBdOZegMKpwUDqc9sawTMSyXdvF
 1qHPPHAFotGRGGHLMIOp1qwZw5LsqAjEVO/ogrZSKcmiXzf2eu9DfXUAtZpGlwlXrgSS8Pv6Stw
 BuJiUQl6m3O+Z1XR7Fs5Z8UJRRAwh6mN+3oGDrUDV1bggPI9OHM1SwHjS5U0tvZg1K1S2KYmMyT
 /tlgt/7TrZv8kOD2eNw==
X-Proofpoint-GUID: iDGLOe2h0R0RTDCql4vdh0wEYEUHU0ZW
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aA66hxyf1CaHEeRaiHIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXwtM5J9v4s9n2
 m4BK2YUBk9Lp6AJ2gNCpvRmYamciY5eHWXDcsa/Fy5aSSneT7lPvFg5pcbVbpp+KhBQj7Apmz7W
 4cJEUuVb+0sW+JdGB3Oyz75fZM4a2fY=
X-Proofpoint-ORIG-GUID: iDGLOe2h0R0RTDCql4vdh0wEYEUHU0ZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/freescale/imx8mq-zii-ultra.dtsi  |  16 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 168 +++++++++---------
 2 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368..a272c1bd7548 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -99,7 +99,7 @@ reg_arm: regulator-arm {
 		regulator-max-microvolt = <1000000>;
 		gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 		states = <1000000 0x1
-		           900000 0x0>;
+			   900000 0x0>;
 		regulator-always-on;
 	};
 
@@ -295,7 +295,7 @@ ucs1002: charger@32 {
 		reg = <0x32>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <17 IRQ_TYPE_EDGE_BOTH>,
-		             <18 IRQ_TYPE_EDGE_FALLING>;
+			     <18 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "a_det", "alert";
 	};
 
@@ -549,9 +549,9 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	reset-gpio = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
-	         <&pcie0_refclk>,
-	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
-	         <&clk IMX8MQ_CLK_PCIE1_AUX>;
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE1_AUX>;
 	vph-supply = <&vgen5_reg>;
 	status = "okay";
 };
@@ -561,9 +561,9 @@ &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
-	         <&pcie1_refclk>,
-	         <&clk IMX8MQ_CLK_PCIE2_PHY>,
-	         <&clk IMX8MQ_CLK_PCIE2_AUX>;
+		 <&pcie1_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
 	vph-supply = <&vgen5_reg>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d75710cdb5b4..5545b5b20ab2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -363,9 +363,9 @@ vpu-crit {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
-		             <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
-		             <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
-		             <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
 		interrupt-parent = <&gic>;
 		arm,no-tick-in-suspend;
 	};
@@ -531,8 +531,8 @@ sai1: sai@30010000 {
 				reg = <0x30010000 0x10000>;
 				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI1_IPG>,
-				         <&clk IMX8MQ_CLK_SAI1_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI1_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 8 24 0>, <&sdma1 9 24 0>;
 				dma-names = "rx", "tx";
@@ -545,8 +545,8 @@ sai6: sai@30030000 {
 				reg = <0x30030000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
-				         <&clk IMX8MQ_CLK_SAI6_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI6_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
 				dma-names = "rx", "tx";
@@ -559,8 +559,8 @@ sai5: sai@30040000 {
 				reg = <0x30040000 0x10000>;
 				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI5_IPG>,
-				         <&clk IMX8MQ_CLK_SAI5_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI5_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 2 24 0>, <&sdma2 3 24 0>;
 				dma-names = "rx", "tx";
@@ -573,8 +573,8 @@ sai4: sai@30050000 {
 				reg = <0x30050000 0x10000>;
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI4_IPG>,
-				         <&clk IMX8MQ_CLK_SAI4_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI4_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma2 0 24 0>, <&sdma2 1 24 0>;
 				dma-names = "rx", "tx";
@@ -585,7 +585,7 @@ gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
 				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO1_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -598,7 +598,7 @@ gpio2: gpio@30210000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30210000 0x10000>;
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO2_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -611,7 +611,7 @@ gpio3: gpio@30220000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30220000 0x10000>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO3_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -624,7 +624,7 @@ gpio4: gpio@30230000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30230000 0x10000>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO4_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -637,7 +637,7 @@ gpio5: gpio@30240000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30240000 0x10000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_GPIO5_ROOT>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -845,14 +845,14 @@ clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mq-ccm";
 				reg = <0x30380000 0x10000>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&ckil>, <&osc_25m>, <&osc_27m>,
-				         <&clk_ext1>, <&clk_ext2>,
-				         <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext1>, <&clk_ext2>,
+					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "ckil", "osc_25m", "osc_27m",
-				              "clk_ext1", "clk_ext2",
-				              "clk_ext3", "clk_ext4";
+					      "clk_ext1", "clk_ext2",
+					      "clk_ext3", "clk_ext4";
 				assigned-clocks = <&clk IMX8MQ_CLK_A53_SRC>,
 						  <&clk IMX8MQ_CLK_A53_CORE>,
 						  <&clk IMX8MQ_CLK_NOC>,
@@ -940,9 +940,9 @@ pgc_gpu: power-domain@5 {
 						#power-domain-cells = <0>;
 						reg = <IMX8M_POWER_DOMAIN_GPU>;
 						clocks = <&clk IMX8MQ_CLK_GPU_ROOT>,
-						         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
+							 <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
 							 <&clk IMX8MQ_CLK_GPU_AXI>,
-						         <&clk IMX8MQ_CLK_GPU_AHB>;
+							 <&clk IMX8MQ_CLK_GPU_AHB>;
 					};
 
 					pgc_vpu: power-domain@6 {
@@ -1000,7 +1000,7 @@ pwm1: pwm@30660000 {
 				reg = <0x30660000 0x10000>;
 				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM1_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM1_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM1_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1011,7 +1011,7 @@ pwm2: pwm@30670000 {
 				reg = <0x30670000 0x10000>;
 				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM2_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM2_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM2_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1022,7 +1022,7 @@ pwm3: pwm@30680000 {
 				reg = <0x30680000 0x10000>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM3_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM3_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM3_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1033,7 +1033,7 @@ pwm4: pwm@30690000 {
 				reg = <0x30690000 0x10000>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_PWM4_ROOT>,
-				         <&clk IMX8MQ_CLK_PWM4_ROOT>;
+					 <&clk IMX8MQ_CLK_PWM4_ROOT>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -1124,11 +1124,11 @@ ecspi3: spi@30840000 {
 
 			uart1: serial@30860000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30860000 0x10000>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART1_ROOT>,
-				         <&clk IMX8MQ_CLK_UART1_ROOT>;
+					 <&clk IMX8MQ_CLK_UART1_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 22 4 0>, <&sdma1 23 4 0>;
 				dma-names = "rx", "tx";
@@ -1137,11 +1137,11 @@ uart1: serial@30860000 {
 
 			uart3: serial@30880000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30880000 0x10000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART3_ROOT>,
-				         <&clk IMX8MQ_CLK_UART3_ROOT>;
+					 <&clk IMX8MQ_CLK_UART3_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 26 4 0>, <&sdma1 27 4 0>;
 				dma-names = "rx", "tx";
@@ -1150,11 +1150,11 @@ uart3: serial@30880000 {
 
 			uart2: serial@30890000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30890000 0x10000>;
 				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART2_ROOT>,
-				         <&clk IMX8MQ_CLK_UART2_ROOT>;
+					 <&clk IMX8MQ_CLK_UART2_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
 				dma-names = "rx", "tx";
@@ -1205,8 +1205,8 @@ sai3: sai@308c0000 {
 				reg = <0x308c0000 0x10000>;
 				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
-				         <&clk IMX8MQ_CLK_SAI3_ROOT>,
-				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+					 <&clk IMX8MQ_CLK_SAI3_ROOT>,
+					 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
 				dma-names = "rx", "tx";
@@ -1356,11 +1356,11 @@ i2c4: i2c@30a50000 {
 
 			uart4: serial@30a60000 {
 				compatible = "fsl,imx8mq-uart",
-				             "fsl,imx6q-uart";
+					     "fsl,imx6q-uart";
 				reg = <0x30a60000 0x10000>;
 				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_UART4_ROOT>,
-				         <&clk IMX8MQ_CLK_UART4_ROOT>;
+					 <&clk IMX8MQ_CLK_UART4_ROOT>;
 				clock-names = "ipg", "per";
 				dmas = <&sdma1 28 4 0>, <&sdma1 29 4 0>;
 				dma-names = "rx", "tx";
@@ -1481,12 +1481,12 @@ mu: mailbox@30aa0000 {
 
 			usdhc1: mmc@30b40000 {
 				compatible = "fsl,imx8mq-usdhc",
-				             "fsl,imx7d-usdhc";
+					     "fsl,imx7d-usdhc";
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
-				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
-				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
+					 <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					 <&clk IMX8MQ_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
 				fsl,tuning-step = <2>;
@@ -1496,12 +1496,12 @@ usdhc1: mmc@30b40000 {
 
 			usdhc2: mmc@30b50000 {
 				compatible = "fsl,imx8mq-usdhc",
-				             "fsl,imx7d-usdhc";
+					     "fsl,imx7d-usdhc";
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
-				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
-				         <&clk IMX8MQ_CLK_USDHC2_ROOT>;
+					 <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
+					 <&clk IMX8MQ_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
 				fsl,tuning-step = <2>;
@@ -1538,16 +1538,16 @@ fec1: ethernet@30be0000 {
 				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
 				reg = <0x30be0000 0x10000>;
 				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-				             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_ENET1_ROOT>,
-				         <&clk IMX8MQ_CLK_ENET1_ROOT>,
-				         <&clk IMX8MQ_CLK_ENET_TIMER>,
-				         <&clk IMX8MQ_CLK_ENET_REF>,
-				         <&clk IMX8MQ_CLK_ENET_PHY_REF>;
+					 <&clk IMX8MQ_CLK_ENET1_ROOT>,
+					 <&clk IMX8MQ_CLK_ENET_TIMER>,
+					 <&clk IMX8MQ_CLK_ENET_REF>,
+					 <&clk IMX8MQ_CLK_ENET_PHY_REF>;
 				clock-names = "ipg", "ahb", "ptp",
-				              "enet_clk_ref", "enet_out";
+					      "enet_clk_ref", "enet_out";
 				assigned-clocks = <&clk IMX8MQ_CLK_ENET_AXI>,
 						  <&clk IMX8MQ_CLK_ENET_TIMER>,
 						  <&clk IMX8MQ_CLK_ENET_REF>,
@@ -1639,23 +1639,23 @@ gpu: gpu@38000000 {
 			reg = <0x38000000 0x40000>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MQ_CLK_GPU_ROOT>,
-			         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
-			         <&clk IMX8MQ_CLK_GPU_AXI>,
-			         <&clk IMX8MQ_CLK_GPU_AHB>;
+				 <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
+				 <&clk IMX8MQ_CLK_GPU_AXI>,
+				 <&clk IMX8MQ_CLK_GPU_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
 			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
-			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
-			                  <&clk IMX8MQ_CLK_GPU_AXI>,
-			                  <&clk IMX8MQ_CLK_GPU_AHB>,
-			                  <&clk IMX8MQ_GPU_PLL_BYPASS>;
+					  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
+					  <&clk IMX8MQ_CLK_GPU_AXI>,
+					  <&clk IMX8MQ_CLK_GPU_AHB>,
+					  <&clk IMX8MQ_GPU_PLL_BYPASS>;
 			assigned-clock-parents = <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL_OUT>,
-			                         <&clk IMX8MQ_GPU_PLL>;
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL_OUT>,
+						 <&clk IMX8MQ_GPU_PLL>;
 			assigned-clock-rates = <800000000>, <800000000>,
-			                       <800000000>, <400000000>, <0>;
+					       <800000000>, <400000000>, <0>;
 			power-domains = <&pgc_gpu>;
 		};
 
@@ -1663,13 +1663,13 @@ usb_dwc3_0: usb@38100000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38100000 0x10000>;
 			clocks = <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>,
-			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
+				 <&clk IMX8MQ_CLK_USB_CORE_REF>,
 				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
-			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
+					  <&clk IMX8MQ_CLK_USB_CORE_REF>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_500M>,
-			                         <&clk IMX8MQ_SYS1_PLL_100M>;
+						 <&clk IMX8MQ_SYS1_PLL_100M>;
 			assigned-clock-rates = <500000000>, <100000000>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb3_phy0>, <&usb3_phy0>;
@@ -1695,13 +1695,13 @@ usb_dwc3_1: usb@38200000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38200000 0x10000>;
 			clocks = <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>,
-			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
+				 <&clk IMX8MQ_CLK_USB_CORE_REF>,
 				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
-			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
+					  <&clk IMX8MQ_CLK_USB_CORE_REF>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_500M>,
-			                         <&clk IMX8MQ_SYS1_PLL_100M>;
+						 <&clk IMX8MQ_SYS1_PLL_100M>;
 			assigned-clock-rates = <500000000>, <100000000>;
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usb3_phy1>, <&usb3_phy1>;
@@ -1767,9 +1767,9 @@ pcie0: pcie@33800000 {
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &gic GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 3 &gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-			                <0 0 0 4 &gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+					<0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 			fsl,max-link-speed = <2>;
 			linux,pci-domain = <0>;
 			clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
@@ -1779,17 +1779,17 @@ pcie0: pcie@33800000 {
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
 			power-domains = <&pgc_pcie>;
 			resets = <&src IMX8MQ_RESET_PCIEPHY>,
-			         <&src IMX8MQ_RESET_PCIE_CTRL_APPS_EN>,
-			         <&src IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF>;
+				 <&src IMX8MQ_RESET_PCIE_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE_CTRL_APPS_TURNOFF>;
 			reset-names = "pciephy", "apps", "turnoff";
 			assigned-clocks = <&clk IMX8MQ_CLK_PCIE1_CTRL>,
-			                  <&clk IMX8MQ_CLK_PCIE1_PHY>,
-			                  <&clk IMX8MQ_CLK_PCIE1_AUX>;
+					  <&clk IMX8MQ_CLK_PCIE1_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE1_AUX>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
-			                         <&clk IMX8MQ_SYS2_PLL_100M>,
-			                         <&clk IMX8MQ_SYS1_PLL_80M>;
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
-			                       <10000000>;
+					       <10000000>;
 			status = "disabled";
 
 			pcie0_port0: pcie@0 {
@@ -1868,17 +1868,17 @@ pcie1: pcie@33c00000 {
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
 			power-domains = <&pgc_pcie>;
 			resets = <&src IMX8MQ_RESET_PCIEPHY2>,
-			         <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
-			         <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_EN>,
+				 <&src IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF>;
 			reset-names = "pciephy", "apps", "turnoff";
 			assigned-clocks = <&clk IMX8MQ_CLK_PCIE2_CTRL>,
-			                  <&clk IMX8MQ_CLK_PCIE2_PHY>,
-			                  <&clk IMX8MQ_CLK_PCIE2_AUX>;
+					  <&clk IMX8MQ_CLK_PCIE2_PHY>,
+					  <&clk IMX8MQ_CLK_PCIE2_AUX>;
 			assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
-			                         <&clk IMX8MQ_SYS2_PLL_100M>,
-			                         <&clk IMX8MQ_SYS1_PLL_80M>;
+						 <&clk IMX8MQ_SYS2_PLL_100M>,
+						 <&clk IMX8MQ_SYS1_PLL_80M>;
 			assigned-clock-rates = <250000000>, <100000000>,
-			                       <10000000>;
+					       <10000000>;
 			status = "disabled";
 
 			pcie1_port0: pcie@0 {
-- 
2.53.0

