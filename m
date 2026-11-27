Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769382;
	b=P8xrZ046biiuxolWqOp1odUD/ietNjiDF18nzc9AdNrx9E7ZCZrXPCK4PsbybDeWtLVj
	 RNQLlgH9aiOFAUCF3HpeIj3PMQTzNcI4eigMq1foDIvK9sTNZvsFZ1Ycx4z4E58f8j7VT
	 DfwVMWLZxdJsOAxiJjKcV+CenjBJ/XqBsjgSKV3NVtBqQFB4HeZrusvL9wP9iO2qzv5jL
	 klkuwkXltH/I4BbvE9rMwbgXuIUlPgHzLLE90Qwom0VfXDT0fzao5/XH3LTTt3KZsFK1q
	 WR7P17jkkjeDVdICRrGb3bH8ONWqNuTd0X7sSMvvJEAoSc/mv6YwQ9YP9EcAP0cp7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
	b=yEkH1TZcd1gAHthS8uE4h4SXFjk2O8UdIm3FOl8VgxOI8Pp+l/cm+8kz5e/Q5VWmhPI+
	 r7FX/5UeZheOd14P6qOx4tImMbVMVuGnpgJrNy4zGnt50MVrBn3d6fEiCOGcxI4nVYUMC
	 IIF48AzeQ+heqzQAQgoL5++TWVh2rtNRXYXO1H8BVnd6n6zgjRbA+LaNFEvLbxMkUmISP
	 53IlhOv2+WCfyyrEFIn1pOeH3gZHAjWw4KhzUzY/ISKC50K9KSHQpcdq0ChgkybVapv3s
	 foqJRxWhqtos/QaO+wKP959n9iMKGNAAxVp7gtXuwmcmHe4Ysnq7iEm9fM3JciSjj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/qqubfd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D39606A6B5
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D39606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/qqubfd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GjEZ1475503
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=; b=Fiocv4r3+WrYzRgR
	ylvaa1j1Y4nn0x5m4z/PrPipQnhkhVj8NrAj12ZxAAM1UOzTmymp06SQluXMUIHB
	bsTUA6DD4E1dhSORqk9vKqN9mymsi2/f1rPiFWtJ3vDY4tTwSQKmYuYhu8HipMBK
	oq5VTyYcUtoOgHAJJ9qRMISBtSvCj952DB/T7TPoU+pXlSoO1yWNUqIzZ/jVXaSf
	QSBXXkaQJ8aR75rpZUXqNmrt/DxEl+bT8kvBDO/Rw4PeK3FHZm37MKuusnV2uCeV
	N/D/yQEOp2vZoCJhC7VXdEVPCAZrjHqC4YwuAjkXfBJVdn7nv5da05fvhXK8VUNm
	ldCS/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd84379223so242580a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769380; x=1796374180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=E/qqubfd6luEFv+hCkwXI+88Mra6+6zyqGRezhVyv+Mv3nkA1cYAWeJXg1gQgAHyIH
         vWuV8qKjQkkwZXhRa+cpDHb1Oyo+C1Zdc69bnZu5FRfT6+0uqo/Rsp8d4Iq3DYncG1bC
         Bg+dGKR3U7liTAVA02O0o954MvTbWvxHIYIJSiwF9APjgS8MvtRb9nzy+GV3picm7AH6
         JjSlRnBnY2Uiu8vRzOJv4ssgePuY1MFphvOpaHxVJa3CLYIe3bieBi6CJlfFXhYWinRA
         TbEufGTcBmpAbu2RohU5IC5pNuYRsjEhKZFWNDVvwtL3gdEQa+xf7eWLYUBxKkqsBreq
         h/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769380; x=1796374180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=VzXiBI+65OQ2Dyql26pRhHjlgJpqNEdIyEZjiV7QcJu9UIyAUFtYUQwF5uNRZ1Bqh8
         y7S8PDSz0IW7MQkgjwLWgs0jXYxTw6f+io8ArmyNgS0g7HV9od+mJb00+HhDvzxyPWUy
         zVTbmmpR+jkhBTXOPEpI+JioeCvWpCVoYoad3AAu4YrUwSm4sW+z7AzPc7d+7Bfbvh9h
         VEWR+Pn69r4eO32PcJD607IS7SOY1JA8DyDOxGuz5ljDPiyMtXdavlZC9lqayIPpFcIr
         9qewVExVqLXtlpf9hhvK3nfTC5XEgO+3WEp04SOfRq86ST/iG0fGIrtfbmqTs8n7m/QW
         C3ng==
X-Forwarded-Encrypted: i=1; AL+hErEn3mvdQ+EQX3GRqZeQ4vcFPQrlotmVWV/e8LmddARLshzKab//S/LoA1J6PSYXB2sorq3w30z2lWIO@vger.kernel.org
X-Gm-Message-State: APuU4Z+5CbfGuNFvKD7NZUB57clltVoinE29apegodHVirCHUmSld25O
	mNETQ5Jj+ejou6FiFUrRhOOcILSz4J6+3fIB9/+c1lvAv1Zll9PuYH6tk+oTE4G/vKKW5gIhZNn
	k4qRc3kT3GgKj1d6zEC5r07LYZvDtx+bJt/OZyb3G5ZMn0tvJ3irVRvIT0k0vWjKo
X-Gm-Gg: AZFdTZez7koHrjBXRQJy6PIhJoD/IIAQTJP2eKjTMHtR9/c7I8A959NbnbYWg2jYc3+
	0BeGRKSZSBZj+wrL2764FBJCBhkN1e6B6XLQPN1+EGZEAipfpZFwKP44M6kuLpQAF4NPcP0LHVW
	LmgSsmra376iB2JJEJ0ar4J3y73j5s4xxoB71h4GCpEEIrcfwUrXIiSHuq8TnMST1z7td1L884H
	kgzwLz8E69CptpgA2RCPk7RI7NwCC7fm9c/dT21W0pdVauwLYF/bDLHIvNcE1fJFsRdMljlNPxz
	2KVuPnOezD8nqtqmFzHy2KEh7jCHCUCDJriSlEcNMyJFP1+MkuZHjF9QnWWZNNxyQn2OppDYahw
	N4bkwLkCDKh6fBpQ09nYQnxaLQcMhHERfbnjhVmv5/I9FfSvOR2bzh3FrDwSJEQzY+Ui2Hy5vXt
	ulY/gg5wT9ZzMppu3easmlClQbF0wyonYZGc9TWUPCwI+fwLrJAVz2qPJOd5xppQVG2PnLPCpgM
	99kxCPUJ/hhkmdC25JBleLiFgK8tQ==
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869735ad.4.1795769380467;
        Fri, 27 Nov 2026 00:49:40 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869475ad.4.1795769379993;
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:23 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: eliza-evk: Enable HDMI output
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
Message-Id: <20261127-eliza_disp_all-v1-1-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3172;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Tc4IF8QhApcJLjNKZX1uGI6mMT6TCVFK65N6fccSJGI=;
 b=DUR+qCC7na9KJSaIm53BA7ckVADIAExITbGXHQEnEBNeAp+YuPPK0eKm5sSQEhyYEb8hfMPF/
 QiVLFhHJBQwC4r1tpMLczv3Dk0BKy5sTxaza0+wpFI5uU0WbesBAbK1
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXzs+vjut9rBlt
 DtYwzxocPAIbCMm3DNlzYzAN+jI92ii6lRLutPy37TYObCg4Rh0qGaNatUrOBdSl9ffcd+4brhK
 O6N73Wa9WFt5Fioi26cz4OWOfrFlKhI=
X-Proofpoint-GUID: LSfh0fxvNckgFH6LSE0MCO0fIOks72l3
X-Proofpoint-ORIG-GUID: LSfh0fxvNckgFH6LSE0MCO0fIOks72l3
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b094425 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sRTJwmOA1GI60g-zRKgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/KVb0Po9VQjc
 0mlv5q3VvU22R2pnloKoWLIwMeU+d2NRKOtqAYpQ1vq1ZseGbXUbu5d9UkGVicLmugavUE97CQh
 dtoZ57O8UnPztUGsvKyFiUnt+ClPEAZI4TjkCZyVy1KJ29DE0745YC7360ltPjLH7r5vXfINPT+
 1VffutmnEZJEtyGNqID/D21pXq4CNae3sl9UJSeI+CrqlS8hwvV9fFRCIXFhagalkZlSCQbWjZb
 jjC+AyyHZWJ5jnfOCPTUlwrgiIrwvhuG4WspgQit6aYNeqJH8ZNXtHCz1CKlIR2GlDbCjnkVE4p
 13DZKLWkwZQOEd9NgxGFNqcy9WlbuMDOez1VSiXs/3KMziQH9otDoBLacVASpDmbBrglFucviP2
 d/c5ZF1it13uiqp2teivGeyyomtZrgQx3K19bF5nb+PXTijoaaDI7JrQS+QU5k0/z6LaR4IMJ1m
 KPq4Ils07+YeBrAO1RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Enable HDMI output on Qualcomm Eliza EVK through the LT9611UXD
DSI-to-HDMI bridge connected to the DSI0 B2B connector. The bridge is on
I2C8, with reset and interrupt lines wired to TLMM GPIO16 and GPIO13.

Add the HDMI connector, fixed 3.3 V display regulator, bridge node and
DSI0 endpoint wiring needed for the HDMI DSI0 B2B connector path.

The HDMI DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 8c663ef6718d..734bea47855c 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
 
@@ -220,6 +221,27 @@ m2_e_uart_ep: endpoint@0 {
 			};
 		};
 	};
+
+	hdmi_0_connector: hdmi-0-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_0_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8550vs_g_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 };
 
 &i2c4 {
@@ -238,6 +260,45 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		hdmi_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_0_connector_out>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;
@@ -514,6 +575,18 @@ m2_w_disable2: m2-w-disable2-state {
 };
 
 &tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-disable;
+	};
+
 	m2_w_disable1: m2-w-disable1-state {
 		pins = "gpio35";
 		function = "gpio";
@@ -541,3 +614,20 @@ &mdss {
 &mdss_dp0 {
 	status = "okay";
 };
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};

-- 
2.34.1

