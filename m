Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768168;
	b=tJWq7lBlAjxBVyzihdTcXyFbhWeHSpkUpmwAl3UjdnyRT3S/UUOKRsD2WYi0Nl2MlML8
	 il1SWRxpiemcgXLbmUXq8aDQRObucppo5581GEdcOF8UOj2RggWx6yNNtOvfTGoFrHkeb
	 CfVEvUh425YmOQPoIha5qjNkQtnMIaW4giamZo3pz2l5z0X6rh4v6AbJHw4bq+AcnLjk8
	 5IgTga7HupJLKjCNuXzpIMhuD6pD7uo0azM+hCryVetQNwNpN6QNIABHASMljqu4eb4kY
	 WuBKR7eaIYcBRv3/q1Lo65xPzMMlPXNapiwGjUMrtRjfsaky5f64xr8NjmZ7MTylYMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
	b=EgEjNnDjKgkuGOiYPEwbe4I/DMjgpxEX6vwGWCMu9vT0oeuFW3z68Wpace2gDGsycn2z
	 oiRIZDHBuW4vTK4O6z+AnBVw5BCQ4ZkWxwktebAKTKFKbPva/L3TzoEQ9pGHo3J72wvJJ
	 v0OGo3q71Jqp0XW4xID4Umng8mT0sI3NIOpmM8w4wzpVN52A4tHIF2OhwJEcBArQWznbZ
	 RRV8SzydrE3Bel1JqoIlssEZKOpIpIwpubGNb8HeI8iu3QWEmuHifeKeYNFDgUP8zviiz
	 9PeQbFZMnLnzTGYoWYHf3a98Er3VWhq3eknpowewzcFY7BaV8xpaQja0FHhIfOSsZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=enEv4e2G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ImLFtHPl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B2606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=enEv4e2G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ImLFtHPl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H3Pw1076541
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X1MryZQPPIOWhtdOUPODeT
	tX1ZYwlHKoUiFMMs4CXxA=; b=enEv4e2GH26Inw4Q57RPSNYnJserxPzJbzHODZ
	DfMXzb2TLIWxuseUGuQtpYr0q6oDbXaJR0xdkusKpc7nj1Vlk2le0Rk94gdJs0sX
	7dCwxMf5hmP53RDrPX4qVeW7a8Jc/5dHBML1NFrdDEqdMH8MqeKDra4V60qv8PPv
	DqjNzIAr3BxexYh2jsetI5k53nJOPP1frtgkaIYZN9jv3QjvAlVkoDyOvWhImWaw
	7OL8z30Y6obpXGW6huaS0i3ey5y+ltrzlGUXFgzGihHouc42617LYhIbCFsogCNr
	vj2m/R5JtCHmGAPx29Qm7wvmVbunqRPlU7cB6VlHF6dVKqXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55syfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:29:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55ba5fccc4aso52416591cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768166; x=1796372966; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
        b=ImLFtHPlBuEt4ob96qosia+ksMEMnCeQ6kQKRewoYHLZIWKJi131s0oqKoAdrK41Kr
         9W50wxOB1JaEcxU50iIk+ua6tZsK7wrycaAJ3AAFu2VgonvcZf9CdgGcQo05RsFSR2oc
         ibwalMnxk3Nd7Cfetzo6yL4kQGaFojWvo3UWna30u9WoGkNg2bEom3PtCgiJ8Ma8Fpp4
         PlGK216K4ly7hOHUkP8jGWA8SV1eHMyCF8diLngAtoMHA82JS2mcS4/UkL4+yVbOnZvc
         qz1ibIYILVAp1LBKWGvjGW5SWywNQdKc3+I0zazle47DFuUZ2kK48eIjJ6XjT8jT8SMV
         L5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768166; x=1796372966;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X1MryZQPPIOWhtdOUPODeTtX1ZYwlHKoUiFMMs4CXxA=;
        b=yXgqVkYX/xR9umCp+wQ0EeeaJM200WgB6C7IbK/FI0eejefh/jHv+uHvp4B/AY4zdb
         E7uSNRrcYD26l3esOs3xRNxLABTVK9DSHpTkCxIDX9KYB1DYa5SRdmC8dL7WaOYFsPQd
         23aZUW8ZprHBE0i6GoIHRE0lUkbqR5fNhn7pluegpxXshk9VCaa77/TAExE8lzlWhuUG
         n2WpEQrzNs/4UJcSc76cQ2zeDxbrg078Ml/H5R3L9oVXQrEOKXQewTUMZ0fCg+Neb5/u
         2d69TmJ6mcOVoh9kqyW7ojE+LpOuksDDLm8sNzDEPt1rCt/SxkYQuij5SKtlIN5M2Iar
         mEQg==
X-Forwarded-Encrypted: i=1; AL+hErHQTww/scPnDUPZpCMV4uXtkaYAJKrCUGNGE73Agx8eyOinW8wqJHcbe8PB/VIfrf8lu3MwEEaHL7Hp@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ldxt+7JZDOqkp2ubwAt+lGmVCNhJnX3wUQDdAxVXqyVXbnUXf
	hkCBU4IVhlzTEiprXc5GEdHEEhI3r9uaiAjEplMTBRrux2AnuYb4x/IN8kfw4sJek/vP7s9PwI1
	47VNY4UkxpLSCfk709116onnI0hc/oqt1CWA+KTcFiKU53RI5X3UlAJveuolwPb6uZCq6u2ix
X-Gm-Gg: AZFdTZc2x0LzYnak/CGKx8+ewm4hrFVDcp0y1baUyUn5c9oQqkBe5h1Gw2BVuTPzDKq
	Y0FGnnaLng0pURJ0lsInkvs8J4CyOnhrfBpQS2Dx0Pi7ojX9mJL7gHF5LzXThJh+W88HAsOhyK5
	2+q63Ju6JJ2NLpkwsRtQ6Mfvw78qRwgzPuXo59AP4nRlp0Gqf9ynqzAg4xEAiSpIkWlXQ8DOPcC
	VbOes4KzuWxrmfYVvJs3zRbcclkUlNwmeWgOvv6pT8PhyCV0E5x3gKkYlGS6jZnD7WKoeI9U6Dt
	1UeYW3ceaFrujxkXDURykF6Ejxy6UzCxJIJxQ3+6HzoTqdReVIMB6qx9OeCnSun54oEG72kWZEs
	W8eAaG2FoKWUhlBS6SxYhHcv3wWI16zW48NZiv1OGWgHbIj3XAOmJQSVuojvSCB6x4awsXcTeCz
	ZiRUilSqUxx2NnfnSrvvk9sORyFagMfvCgLKQ=
X-Received: by 2002:a05:622a:4c0f:b0:55d:876:8691 with SMTP id d75a77b69052e-55d768a3241mr438792111cf.4.1795768166062;
        Fri, 27 Nov 2026 00:29:26 -0800 (PST)
X-Received: by 2002:a05:622a:4c0f:b0:55d:876:8691 with SMTP id d75a77b69052e-55d768a3241mr438791881cf.4.1795768165674;
        Fri, 27 Nov 2026 00:29:25 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92181384803sm52101256d6.43.2026.11.27.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:29:25 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:29:14 +0800
Subject: [PATCH] arm64: dts: qcom: talos-evk: Add RPi Touch Display 2
 7-inch overlay
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-talos-evk-dsi-7inch-v1-1-2b271186b5d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFk/CWsC/yWNQQ6DIBBFr2JmXRIcQLRXaVwADnXSqi1Y08R49
 5K6fC/57++QKTFluFY7JNo48zIXqC8VhNHNdxI8FAaU2NQ1WrG655IFbQ8xZBaW5zAK5WvboQ5
 GaoSyfCWK/P1Xb/3Jid6fEl9PCd5lEmGZJl6vVaeVlbrpjPIYvfLRGK8a06I2klw5tkNs0Vnoj
 +MHZ4FA5LEAAAA=
X-Change-ID: 20261127-talos-evk-dsi-7inch-3b17924c5042
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768162; l=4411;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=x/UmiaqcDwSsrnkS/tNgpYQpoRd1sVPhYyn2o9u0F3s=;
 b=BerOusUmutWiu9tiD2TlyQ+W0JKxVVXV9bwgOLR5MqgkVZhYBFcEmDWSETyQNCPMRWR9pu8UI
 kVYsLnFgBtDApEEZharGPRW/HUu4czz3guM2AXLY5IhhTI6qaSJw5mH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfX0bdllDxrpK62
 yZpkIegk1QFoSImrQtZKFvLipFK1ArBm9Tkk8vQetVYK6lTJFchQT9vK8TdT+Wyt3uOwkrT2LUo
 vKWOEyhpH1a2+cupTxddmxlyrPVzGvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzMyBTYWx0ZWRfXzuYPHzRtz9sv
 2gxKrscK2WK4Qs3EteNCGpv8QU41FlJOZbKeBg6JcPvFIZmIY1Xhp1yEjQ/gJtGVly/qloSwTq4
 dqtI6C+B0q5Tb09NvgHk7RJcOfZjCgdDGNiYTTxv3V3iWxduNsEFT+lRNS+2AFO7ZQ93Aky2QLj
 7EyMOcLuccaiTcf6YyY2RBeYl4S3/p6mbRfEn71NY0dBoRb5rEftqXolEaMaebJnrh4whuXL2d2
 055ZsDwFH1bJf/nMPvMQqduWr3oQoyFxY0urW9/p5zninKrjwtV/jeeLUmriaOOT8MGLvWORV4w
 kEXdR2mTXwdoGLj/O6OkhSB4UjN/hNhgG4aiYoVTF8mdDIvqcvELd2kdgdOkLK3UtJ17rvuqFt/
 bGYfQV4pKC/Wh2zdt4JyN11cfhodzg0ZT1ir3HW34DjuZkqWCjQIoTcfP6ZvFZwO2FnJROhWdc6
 H+zF+lr5/Nk1L5RgPVg==
X-Proofpoint-ORIG-GUID: FJwp4638BB7Vm54r1v7O36xR7W0GpoAp
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b093f66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t19j-lEuRoXkQUzpf8MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FJwp4638BB7Vm54r1v7O36xR7W0GpoAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270033

Add a DT overlay to connect the Raspberry Pi Touch Display 2 7-inch
(720x1280) panel to DSI0 on the Qualcomm IQ615/QCS615 EVK. It mirrors
the existing 5-inch overlay; only the panel compatible differs.

DSI0 from the SoC is routed through a MIPI DSI switch that must be
selected with carrier-board switch SW7 ON to enable the 22-pin
connector.

The panel is an Ilitek ILI9881C handled by the in-tree
panel-ilitek-ili9881c driver ("raspberrypi,dsi-7inch"). Its power,
reset and backlight are controlled by the MCU on the display board at
i2c1/0x45 through the in-tree "raspberrypi,touchscreen-panel-regulator-v2"
driver. The Goodix GT911 touch controller on the same board shares the
i2c1 bus at 0x5d, with its supply gated by a GPIO on the MCU.

The ADV7535 HDMI bridge is disabled since DSI0 has a single output and
cannot drive both the bridge and the panel.

Tested on the IQ615 EVK: the panel probes and attaches to DSI, the DRM
device is registered, modetest reports the 720x1280 mode as connected,
and display, backlight and touch work.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso | 88 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..48b7d604d4d7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -517,6 +517,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+talos-evk-rpi-display-2-7in-dtbs	:= \
+	talos-evk.dtb talos-evk-rpi-display-2-7in.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-7in.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso
new file mode 100644
index 000000000000..6e8cae02702d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-7in.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_display>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261127-talos-evk-dsi-7inch-3b17924c5042

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

