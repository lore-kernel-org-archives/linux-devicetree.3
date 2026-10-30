Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323934;
	b=C8n6ZFYWjaH59O6thB/v1z+TftVSuAhDP4yxPWDg4IqdRvbYHhQRVJt7sSqUjYBn4kyA
	 2RzcZFC42Rvq91VZom8V168UzZjO/giFp9N4Hwg+l0ZiHd6mYCcjXm3rejKnNpggV4C9W
	 JCTLt6pyfLHuBHTIhWb8TOnxUOCJIoEf+J7BJOogSybHcOYCB3svetHZWJITkx5jUnXY0
	 AmXz3ABkRLirmd6G/54cjtX1cuosqnsAb3FACFPzYKxX54zzUM8IYyP67hfg7QQey7TgA
	 uPY7Vi9+5U6AQykG6msgDDPDvnbxfOLppwl5Q8aEQdQldpFRjjzIwJptZ1clIU4RZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
	b=Swqi9DPpSHdWzdEW1flXO3RMFBz746PTTigPAcruUHEXNst4nmJIfAdzTbqep68nieRg
	 dInf2iXnbqQ1lnEZ4+LKv0HXlam5Je5FkUTIMUaj5yQSD3KJlwwid+/M0QPw3j9fM3Bca
	 AM0U2i8KhUFpaHMw5iiyoih98ZopWDPTODaAGjKhsU4fnE9EwY4SSWe4povKMaQAXDg1B
	 hDxai5AAZZAF3RGytYvVn/C/uPryvm2+u0OJigKJ8BvUw9MeKNCuUULaup5J0oCjKRq/p
	 8LBAC0gyS+629iFtgpFZ47gKejKY9EQDZyg5sXfuTJAhml7AHUH4odypjB5tH7gRpBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s4lQTuD;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F194606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F194606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0s4lQTuD
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d7791b00so1194135ad.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323933; x=1793928733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
        b=0s4lQTuDD8b8qe1ccjkxSVeSpvI6q5vYLZh0CKaEtoQ3B/TcCLnLe3zu93dsWXTIOm
         4BtLlGdboOwnP3xH6h3sfHbbsspf/pfrcVoLhPgf5CqiIdmXgmqdvo4YpBWLddQt2yB6
         G8aSxEI360elLGe7SuY5+o8BPfCcXAQOuC8y/J910gyLopScmJ1C6rTsR8VYMPICLjAS
         Aou5bwwAl8MIxWW9NRKKE6cNRfAFM0TwrCT+oz/lDuhn0MShlaKoxIAYC2X7YiEgOsHS
         mcEKcy0GscUL8sbwWjZ/tk8QAsPFxFB7x/HIB3Fccn4XvHpR49udUGXr7e7Tg7tB8B2D
         +WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323933; x=1793928733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QGZcFpZgf8ttlAmgJ4zukB4qZXyiXpWWujR8ZV6lIA=;
        b=LuZcX4sbVeZU7/0zWObY6PQwNe2hXvItrDvrKeWLbD1JCjGqsoADYwGZ+SVl7DAvEq
         c0a3wZ5kJ0H7EuInqwYRiKJQvKry3DFKGYQs5w2N82G06T+OlAuXI4uc1eZ+cXYdWdLg
         8/Q1gji7tJ/4IkkOvmS5uTI8Brp94IVhLNLkuciJ7iFJBQ8ZTEcKZSs1tFSsg5FoViJb
         oWyd+2VqXgsSr0F16LrEoNfR4r7VRl5neFyPelV8NYNxiIk9PIgK5Rkikg7MOVSrvMGv
         vVahEbsGd2XSVyin+BQIr1lRDePs0jnWRT9yfnUSdh1xBpkVzFMfvtotCvsJYoXEMAun
         ErPg==
X-Forwarded-Encrypted: i=1; AKwUvBwI+4hI3BUrHR2p1epEajPzIoX+puITzsVzCdhwdN3NH+4flashWl8baUVDzs7FpJk+m6ay1cmFLrrg@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8iJnSjWK+wMXFGw0Fu9SGKONHyS41Z4/w7CFxvpya6qnsS+BG
	bFB3MMfY75eki9mpnfMwygEd5PqQJraObc3Vd1uvWvWHj44nJMFt5Q8U
X-Gm-Gg: AYBFou3yymQPeMkT0nrwjoGuU9vo5z57O3WxsMdHTBcj6GptqtU1eNuRkAsnRWR31zh
	li9NqzSVq7zRBwkvyZ+S80eG+KBZeMEf+GRGODxKCLQ+4ZZ9JZNCIdW+BTn/coqAdp6drUi0DWn
	CnksUbH2+PEEw72Ieml0vbLOvU9yHmf5ySN/LMLJXkScRSGK0gwNmVWXgMHBX2Ylw6P4rZKJAqn
	EjOgxrdtninp+9MErFLKKtn0A3mvZWRAfgRTIZjeWDLVKlkulHgqoZuBdDVq9UMMN7MAKQTeyfH
	t/QZIqbo/QwLgALJ44aFbvHQAZkmCf/cEsCcOS61xT9JogM1cOeVzKnbprov9m3i3+7kld6Qwly
	k2MZIH+e22fkBKg/DQXJiyHO5Y1A/HuECYsXClcxfCg+NoFLitUUUJqDHdG25CzeUkMZ3Bbo/ec
	R4licNH+JZsjeUPQU2eGrFZ1txMh3wNOeaMBklJ37zZvYFbwvc26soTl4EEe5+QLfUfwMfsyl0S
	yvhwYpVVxf86H1ZTcQydKJWSlAwKErfCGf4lUbTfL4HEcyjQNH7QeEiPG21nW9zc7bVTl96uIxZ
	brtb7HHFchTwdgfniu+6Gb1vQTlYfb8UBsJxYPex59bTr5Ua94NbgIPbjhQrNjCB
X-Received: by 2002:a17:903:388b:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2eb364b4deemr8399945ad.30.1793323933299;
        Thu, 29 Oct 2026 18:32:13 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:11 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Fri, 30 Oct 2026 09:31:32 +0800
Message-ID: <20261030013135.158157-4-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a USB-C port supporting OTG and DP altmode.
This is implemented with the FSA4480 chip,
which hasn't been added in the dts file.

Change the USB controller mode to OTG.
Enable the i2c controller for the chip and the dp controller.
Configure the PM8150b type-c module and vbus regulator.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 142 +++++++++++++++++++++---
 1 file changed, 127 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 9dd380fbe..1efa9d53e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -445,10 +446,42 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	fsa4480@43 {
+		compatible = "fcs,fsa4480";
+		reg = <0x43>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pm8150b_typec_sbu_out>;
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l9a_1p2>;
 
@@ -466,6 +499,68 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm8150b_vbus>;
+
+		source-pdos = <PDO_FIXED(5000, 3000,PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		altmodes {
+			displayport {
+				svid = /bits/ 16 <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&fsa4480_sbu_mux>;
+				};
+			};
+		};
+	};
+};
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -489,6 +584,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
 
@@ -567,14 +666,20 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_1_hsphy {
+&usb_1 {
 	status = "okay";
-	vdda-pll-supply = <&vreg_l5a_0p88>;
-	vdda33-supply = <&vreg_l2a_3p1>;
-	vdda18-supply = <&vreg_l12a_1p8>;
 };
 
-&usb_2_hsphy {
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
+&usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vreg_l5a_0p88>;
 	vdda33-supply = <&vreg_l2a_3p1>;
@@ -587,28 +692,35 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_2_qmpphy {
-	status = "okay";
-	vdda-phy-supply = <&vreg_l18a_0p92>;
-	vdda-pll-supply = <&vreg_l9a_1p2>;
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
 };
 
-&usb_1 {
-	status = "okay";
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
 };
 
 &usb_2 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "peripheral";
-};
-
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_2_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
 &venus {
 	status = "okay";
 };
-- 
2.47.3

