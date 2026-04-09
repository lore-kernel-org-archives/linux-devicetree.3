Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB426B756
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726916; cv=none; b=aJnkBZvoU5suEsP+iSkF4E4+PXaJWi/N5nNSwJbSH6ss4GvsMa83n6JkddTvKBcyqcmip7FdyW8E6A5wDe+UcXfA4efXc2f2Ba+mg3JC8vpDAVS0ZUGtqOMns23H1ti6fYOgJWR6Ujci8KCjrLTCm+2QlzCBYCZczT4ZG7FfEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726916; c=relaxed/simple;
	bh=CiV8Eb+aAuSaC0yvKkCcxTaJS4DNy3oRfwjQKCP0H7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ayJ8nAnl9x3b1ATaLovkAz9REwEJFjGlmYGFE12XnAu3HlIPl9yz2kGquXj+9Vq4z2/abUB2wHSXggi+uvGUMhK8q9Re28jSHhceHii+TxL07XkH4zAA3p3EYXv7/dp2J/WFRPFhQZ49YIj61cvrHPWOckvwQ1iiC9QEBlfSLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nv5A8ic6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BV5YCJ1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nv5A8ic6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BV5YCJ1K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395E2kT3712801
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lg4kF7DL+oB6tH36fAvaKX
	c/fnplKDnQGRscIl2tUpQ=; b=Nv5A8ic6AAq5FY0fikoVQK4LE01lplpMKBw2h2
	+852dBSD3AZur6FuuZ3piapy5e42Zkn5kq0H+T3O+VSN2tv4OnW5d4qj6H+uZs2C
	Zaq/grmLQvX8vTWnbCavFhODp1owuc9Fbiej7Fd92sLkG5QBPsiPd/zRlusWTVX4
	JSileFrlzzupDuig1ZquebDGLYyadNqWZNm+qdoVYHLXPW4RAQUbC/w28h3rjI9Z
	TpiRlPf/42gzyEHDU+psSZDiqgjKO2gr+gYx4w3SsTCRAuTu9e8F9LbE0xrf/Bk4
	2jFW9Vl50+7RQmErr87DEWpYMmhfanMB31UywRvP/ac8aKgg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74baf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:28:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0bf2b3879so18330895ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726914; x=1776331714; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lg4kF7DL+oB6tH36fAvaKXc/fnplKDnQGRscIl2tUpQ=;
        b=BV5YCJ1KqShHv8BksvstdsxfagdeO/SOhuNKwvhw8C8td0CDwPPVH5iwYbK3cyrsae
         SrypUsxfMRb5O5ZBhBYwKHHY+aRp2odnv9zRC9VX0ZhHO9vDtyCOrcJYlBKvAVP5M6ga
         QmP7QkzupKc2mTwJSNO50kjCZXQxreXOyHAX7qmZnhEuZ1+9ZtIwWKD3p1MGRqw1etMG
         dVkWrGArWD3ngOpTd0hboXY4tvZYsZsXKOTVcNW23n3cmz/z9UDFcn6acnS/IZuFrZcS
         AxlXwp0VYDZuYkqw1AQ5lSR335SMSaoxB31V/bkdv4ikRx3pnDuoZPEdekkIiZOdMuoI
         Ab6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726914; x=1776331714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg4kF7DL+oB6tH36fAvaKXc/fnplKDnQGRscIl2tUpQ=;
        b=lLpeoQStomM2B1Z5DskYBXEu+RK427dUJLzGSx5MJBz94q1GS/obir85pM1JRRA8n5
         gytW4ZAgYxIjBh9NLOANcJ3dc0naM9QFwv2CslcHXLYDpQFXXBcqyWZq4ItU4sf7Ed2w
         LwNzrcnIll+g+/tr5/UD/q7j3Z+i8067jsK5j4QRxjYFgnafJDqkAJYmAAsEgqH3+EOo
         Eur4qGz+259GMVN8cYyxky1RjQ421KGv7bJ4j5emLE+I6HB8DmsvKKJDmkO9kpQn0zJS
         ijzIwn7xiEhpQ4r+N30oZSA1kYf1307ZX2d8eog02ewpwUeae5dD1HlAK7e+MtDekJ0k
         mxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAbUrLZhYvx+OlnV8G0cRSj2rwsCb+NMAc/GEWweZNHuTQ/ZL6UIAK9YroXATp0hYrNibf524frvNN@vger.kernel.org
X-Gm-Message-State: AOJu0YwhEmcn5unXGnj9STvhhQDbDKhsx5Nz2vGfZEXEBjYzAR9ZsHUB
	Te1MUbaLEWi+pHLqOYQj6gG/HvsaFvqYWwpWNwuXtXeYWALLRbN/rWdNCPv9qtm5EJX9g/ExBw6
	fnKfF2TFCAd2XQP6pQdRnU0YH8VIO4mpmko+UGXnhGVrzfYiHl9mm3pX0z7/9feu8
X-Gm-Gg: AeBDieu/JVNjrgJ63U5a9spZf9I2wxJPdbWhesy23QNGYllDLlQzP+jAKazo9JEJi+v
	lSmBnxiiTQwS0+LklB7CGprTnQkWuJzAT+1ogQ4jQLO/hwv/iL5THnBzM9fkLUeKtCcay5OkFtO
	vBs8BCj8TpSZJ18l85CCIqDPYxXxK15lzRyPlWPJr7h28dnj308t2Ozi2dRNwJVdpyTSw24MLaN
	tHOoMjLX6eAEq8tMQIYLB1KstJ5xOJG/z9afAS32fqitdJbu86DBFmATWprGtj8puB3ZqSbKJCu
	q2l/q1GuDKfmoKjBE3cvIQTTl/Cpmk0gdwVbGPQrZ+gxthovcUUhxJylMMygsYwxLRkr+ZaaNu6
	2YPPbvTlyOqKhKeRBbUuXj29oPzaZD5XAYFzVesqqUWzipb6Or1sOzSbpkbe/c//bb4sRPFjM3j
	EJ6ikGawiMi5h/3iiNuS3lbsd288JeM0Im0OkhPnOAI/BoK88yHzxKUDZZ
X-Received: by 2002:a17:902:e948:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2816f8000mr292137835ad.21.1775726914020;
        Thu, 09 Apr 2026 02:28:34 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2b0:4fb6:85ce with SMTP id d9443c01a7336-2b2816f8000mr292137445ad.21.1775726913518;
        Thu, 09 Apr 2026 02:28:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2cfa82655sm9299825ad.51.2026.04.09.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:28:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:58:29 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: add the bootph-all property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-add_bootph-v1-1-cb2b5093f7d7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADxx12kC/yXMSwqAIBRA0a3EGyfY/7OViDB91WuQoRZBuPesh
 mdw7w0WDaGFNrrB4EmW9BaQxBHIRWwzMlLBkPK05DlvmFBqGLV2+8K4LOssKao6lwWEYDc40fX
 Nuv63PcYVpXsP4P0DeQqpyW4AAAA=
X-Change-ID: 20260409-add_bootph-0c68315784c5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775726910; l=3531;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=CiV8Eb+aAuSaC0yvKkCcxTaJS4DNy3oRfwjQKCP0H7Y=;
 b=iH7VNd6BOEXIFmu22BGq3V8MF47/ALDCUaRXxyYpUHjWI4Zo5nT4zKEx78HEPMyi1NUROIve1
 Hl+NbaKUXPuBew20/3DpeezCl+3NnHQ2+nQNSy3dss6439FDwO0Y6tO
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d77142 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6_qVrJlOYV7GrQKWXk4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kJ1wyQPtIghFssgVHBoZF8gcw_NjGRsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4NCBTYWx0ZWRfX2W+ekTXZl/AP
 KqC4BvRi/vuwyRT0vr77966/sLj19WBcHxjHtMOmE3wK+HXXGHn64+ttzehVG1xpbdnVo9RIt4A
 sTApjh0QgtJGJvZVTTfJVExuB/jtbWX0vZogd3NMuHhqZOtC6Td+VoUz4ttBt7gbX/srJd+EiCL
 wQE+PYTh2p3dJB5AyaA5DKOhakt+rwsQEF2MTqastl/qVK706qcDC+YySI2FiFIW6RwlDIMJOHa
 q5ksTwzFXtSMJSSykoap9mCq7dxDAvPl/4NvdqeKoYOdmiyAe/X1vip0cE+3opFZoIokArdVnU+
 tn7AvvArG+Geu1atFH4i+b3SVSjEsrfuIhtGFGKsz1KD7zSs+qGnUPYU7pwJ4vVCXc97NuxkZfF
 FER9ZyeHGmzjU0QYVo9lCRZSw0vHMuwy84aEmq3jtZ0tDgzJ2qvUHgSj0+ggl1wV04u8FywNA6v
 NFF9nL+HL0g8NK9PfOQ==
X-Proofpoint-GUID: kJ1wyQPtIghFssgVHBoZF8gcw_NjGRsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090084

Add the bootph-all property to the nodes which are utilized by the
bootloaders.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  5 +++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..56dbc506da78 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -17,6 +17,7 @@ aliases {
 
 	chosen {
 		stdout-path = "serial0";
+		bootph-all;
 	};
 };
 
@@ -41,6 +42,7 @@ qup_uart1_default_state: qup-uart1-default-state {
 		function = "qup_se1";
 		drive-strength = <6>;
 		bias-pull-down;
+		bootph-all;
 	};
 
 	sdhc_default_state: sdhc-default-state {
@@ -49,6 +51,7 @@ clk-pins {
 			function = "sdc_clk";
 			drive-strength = <8>;
 			bias-disable;
+			bootph-all;
 		};
 
 		cmd-pins {
@@ -56,6 +59,7 @@ cmd-pins {
 			function = "sdc_cmd";
 			drive-strength = <8>;
 			bias-pull-up;
+			bootph-all;
 		};
 
 		data-pins {
@@ -63,6 +67,7 @@ data-pins {
 			function = "sdc_data";
 			drive-strength = <8>;
 			bias-pull-up;
+			bootph-all;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..e0a90b16b097 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -14,11 +14,13 @@ / {
 
 	clocks {
 		sleep_clk: sleep-clk {
+			bootph-all;
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
 
 		xo_board: xo-board-clk {
+			bootph-all;
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
@@ -98,6 +100,7 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		bootph-all;
 
 		bootloader@87800000 {
 			reg = <0x0 0x87800000 0x0 0x400000>;
@@ -108,6 +111,7 @@ smem@87c00000 {
 			compatible = "qcom,smem";
 			reg = <0x0 0x87c00000 0x0 0x40000>;
 			no-map;
+			bootph-all;
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
@@ -129,6 +133,7 @@ soc@0 {
 		#size-cells = <2>;
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
+		bootph-all;
 
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
@@ -139,6 +144,7 @@ tlmm: pinctrl@1000000 {
 			gpio-ranges = <&tlmm 0 0 54>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			bootph-all;
 		};
 
 		gcc: clock-controller@1800000 {
@@ -152,6 +158,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		tcsr_mutex: hwlock@1905000 {
@@ -169,6 +176,7 @@ qupv3: geniqup@1ac0000 {
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			bootph-all;
 
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
@@ -176,6 +184,7 @@ uart1: serial@1a84000 {
 				clocks = <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
 				clock-names = "se";
 				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				bootph-all;
 
 				status = "disabled";
 			};
@@ -200,6 +209,7 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			bootph-all;
 
 			status = "disabled";
 		};

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-add_bootph-0c68315784c5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

