Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834340;
	b=MpdPCHbRnyUcFP4zp6PBaE2hOUnBfHh7G0scsCC0KFv9aHLHd7baTkup94vbLCDYsvHB
	 S8Ad+INxFZ6BGW9jw9zvQeoONkRAOQw1pEsvseMCHqPWAqTqlylOiAL3V3DhjCAmi0aaX
	 ez+bpYTDnOGfDHPmT+AjsVcUEw/MvNKGwxSjAEV7Hb+vdHRWNGarvyMDeTouwELnoi+N8
	 4o/g9X0PFB34d8YUBb/4tU8v1+bPmmF2i2piFNSngtf0EOrEH+SwQ6mK7aMvmF2CRI9Rr
	 p1hqgWNiU0lPyJxBjUIdshwiV9rq3atSEDKaQZaN2IGRidGtrpHsIgoa9PaqHsrdrrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=m8amb3i+khiSOe81DtcGYF7B2aOcB/g3Dj2fh2KJMY6Svumr0EzQFs7XIsbHH78ufOK5
	 Iq9SnuQ6o/tC3Fk2v1UOSQ+HYCTRd6oXIFR2o4mUBKb8WFnancmpKCkxxRdWzgZ9PxmRk
	 jDiapVSd7CimLaX4ESCxW717yWk7qIGpZQe9aTekFRvh9NhgaacN9qdujWsHYMI0N6DYh
	 MjjMRTfScMsspBwENUdT4xemO5q1cN2U/r+jutjSFcqZvuJy/Xs90s33cVQKKiumRws93
	 DLdLzre3bymEE94/FzfmE/Wudp7AWlXPREdXVl8uqqSDnoXiBlv/1J1sSZ76+MuAFxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nH+QS9CB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hr/rND0l";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB2606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79CB2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nH+QS9CB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hr/rND0l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1H081214689
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=nH+QS9CBHsdrsJJ+gi0Qnp2KHf4
	Owqqe+SFBP6d8+A//QIKXyztLl3u7a0qP5xkx28cRssNhwy3DiiXpbjxVi+ul5Fi
	NEGMFF2E+ACMQj3EkxbjjGZU9/G3mJosAYIIY5upnzl5ObCq/DQARGe1wRgAZuNu
	mL3i5AbXdaGuxj5eiVeEAFgxDkfVA89WqTku/Jeb4qHAI3QuE8dPtrFEmm2h43aK
	t4qqnGZIalkmq/CRLfarqAQXGIhoigXsLbzXag9SU6DQR6kHMQ3ey8qQ/c3tCIh5
	2/tTRJlB4NOaUc9AKbo1y+360/qLJU2a4EVSNzS5JxK3Ol5ziIXCWPoj3Dg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy8m7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:37 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5735cd94235so1063932b6e.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834337; x=1795439137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=hr/rND0l5IIDJkqQnNdykgZ1n2Vf6BtpVxLnOjaaqr0CQvX/Lub7B54MrRQ8eKbZkZ
         1lyfGeyPjpqM/6J3XgEw96eZOgdkrGmGHVZKChhoxYOdi3PYyJEae4ROqULvGLs1/sPp
         MIVKY+c/uHNN4bF5MgzOjCLYbJWMWgSJc0s0C0UX1jT6AGN4imzZ6pnqld4eI59U+hVT
         TF7k0aGB5QogmOPzK1Yt/CGu1dQOIc3y4H05prA8Y73WYykctLhxZ+m7MH++fa3PDh9g
         SGz3W42VkAe1+FjrAkxWQnMr2Nc9S6vXEeAVULjIj85RhFjk1Uf5YHxoGvDdNIizeyQw
         dIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834337; x=1795439137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=QuVLybHYus+nGWH07toU0iCRbhEvJ2IXyTyWXorHvxjsO+9uTrGY1TJ14ZLFfyLzA6
         SLeqCPT4GbbRckuD7a+8hgSDtK7oOhGFO2/uLV0q/EHB4uIcjzMktB5AhPCto3/sFPln
         UUxZetDnsm1WvcQQg574ekmzbBrjGz02e0Wz3U8EVVnbUokoFaV2poawCKPf2UIIN9bk
         5BL/VFEmnn5cdsCPeg0w6tgRS9v0FEB1KRlBYdW1RxA/wqGhnn0WpyMWyzcvyCC3mgQB
         qNLWH4LeF81BrgLEbaExgctzz40Ib2YUpj0OyHUq9o55+yVmHgF3wC97M9vFeKAhKw32
         Tvvg==
X-Forwarded-Encrypted: i=1; AL+hErEU3cC+u1ux8aB5MkMp8sw5I3+mpsxMZK4Z+2hiy28zyAsTHdXqOGWv1VXIJPZ6kB34wAgM3VljyaYm@vger.kernel.org
X-Gm-Message-State: APuU4Z+uGHwqK58ejbfoPmAsGxrxNTM20PJ4COPRaMmsrfJFx+hRt15X
	rUJDQljo5tZAHdQX7rBKSfOJ4+O/m5W3pHkzu3TrNeZfek9eLwgOaqOKBZJEwZTxSBFnm+LslUu
	Tk1iG9hsyk1HF/FLQww3d6qGloE33y8+99wFCN+OheeWsdTF1QcVRcax7GGCWUrgI
X-Gm-Gg: AYBFou0H/HlcK8EC+/0lttt5PWyBIFRZAMkXz7suL6KZAjDadYsegkV/tnaR2TVIHZK
	m8QHqEJSoFVZ6YiBlOrwEvi2bprQEo0twiYPQUTBTyLNrm8mBeFrwdruNvNmhLpxxhUOJKcPnM/
	S59A2ww3bN0GtzMC1gAUSUN0njmAlTzs8NPR28q0Gv0PMZfpDvI8frhwXQ7vxya/PGWDJ2voZZs
	0m4oHGNwsVLCtgB17htDeWiuBVWn9bMAnQZ8vaoXvfB6k0EjOQ1MUevt7yxa0c4BjZ9P8II9uXg
	OEAX7OM6G4h11n5KQM6mv5GuMTwbj1NOBNvrJLDA/QaKfPT2aIK9uvRmFNPprK5Hg2UCTLxhdEf
	7O3tubySdhTiw61AY8nOHdX25OykPX7+k68BVH0y/olq61QSzyYO0q9GUngN9AYSEu0Rp7MEI/v
	d7
X-Received: by 2002:a05:6808:4f0f:b0:4f8:716d:793e with SMTP id 5614622812f47-56e64dfe401mr9919957b6e.46.1794834337093;
        Mon, 16 Nov 2026 05:05:37 -0800 (PST)
X-Received: by 2002:a05:6808:4f0f:b0:4f8:716d:793e with SMTP id 5614622812f47-56e64dfe401mr9919909b6e.46.1794834336612;
        Mon, 16 Nov 2026 05:05:36 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:36 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 18:35:20 +0530
Message-ID: <20261116130520.1763088-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
References: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX3WBQsreMgiEW
 2kYe+45o5iXBlkrZCr5wHpyQdHhs9KTRiJUyA0cEZWe4jPk6iburXD/BBcHc8kAMk159zCPX0ZT
 I6VH0eMSHExlqO6h12SkGVJgJAcpYWk=
X-Proofpoint-GUID: 6ckWnZ30wX4e6GRUq8MGAzBgM8Z9kTHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX04U7O/TM1YW6
 X/7ljd0C+y5W8aWbu+vooybn0OvUEQ5RRuL9/OcJlK1BqOubNbn1hiBWZ0AZgG98U2HBt+1BmMo
 XtnFDCksc99t8NILVDTJk9TuVy137xzn5aFEkbUFYeDPI6RofBNsAxkoi1bWaoW255tT3TmFYu1
 mAoH5WNhmNZoLVrrOpH4gw9QRWAz7s3nXQg/RyDRL++pze8oBCu1tStTnSeNQqlv7u3cfuInlVe
 ba3NxtcND1O5F1SDjAleU7OzS7HB46iiwJkEgKAbBxFtuMJqzeTSEtKtlUcQEfoK8NIpmNdp4mf
 gsbn9vDx7BKiJtQgCPk2eYQlF4+6aJxlM2xPjesQ/nTlEf7lxv3i6dAycrGvRqQ/+77JL0dMdL+
 CFhfEc//r5geHOJgoCY4/TKiNCIRTyEYa6EJ+5Req9rJRuwVr/3aHmwrUJCMq4Hg8wGeZhiCRDU
 1X/7vjHBsv0jn3YEGug==
X-Proofpoint-ORIG-GUID: 6ckWnZ30wX4e6GRUq8MGAzBgM8Z9kTHv
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afaffa1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
physical Type-C port carries SuperSpeed and SBU while connector@0's
port is USB-HS-only by hardware design. The SBU mux and its GPIO
expanders live on the carrier board, so they are added to
talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
regulator that supplies the USB daughter-card connector's VBUS.

Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
switching is driven by the PD controller, and add the supporting
USB1_VBUS regulator and pinctrl entries needed by this routing.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..ed3a369dac02 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -179,6 +189,87 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs615/a612_zap.mbn";
 };
 
+&i2c5 {
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -229,6 +320,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -250,6 +350,14 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -258,6 +366,15 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -279,3 +396,7 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..020ce7db4241 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "dp_hot";
 		bias-disable;
 	};
-};
 
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	status = "okay";
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.43.0

