Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668977;
	b=JMgnA8UVRuwO0P5TnDB1aMSK5Ii0VInWxUAP5/fFUfNZk7yR++hmFgSVqv9nZar9rRX7
	 /rJT977n/uw/US49aHoBCvn9Qp6mn2Gxi84j/3qk72BL/snWPY5j1R1gqAAgyeQRmzB+r
	 oRuRKK4Parnwi33iKFg8nUgJeK+JrApoHx7fvDj6Dl9n5h/nCjCK6yvXsF8GsgmTOUo11
	 jk7RFrEVOYNco7PRwyGROnJmO75VY+ELy61SDMqQTtEDFob2z4EWvF3t0d9EjiBhbETDC
	 Q6rEFPuAsPyh8i/xooMME8ooJJSEGUwvKKFWw0T/+UPZHH2cA2rQmWxFrfKd5NRsW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nvogVjHgUkKHLSoyeVICOyzHi/hhdeaP9GdYrV3oI9s=;
	b=xQ9IeyOSTih0Q47eaV1daFwvpkLwFfbk3kD2Y7SdmDIekmNoGh3iNLq9rrNqVwdVKIZ8
	 QBl2DgtLUidxZ58QVluJbLhSadjS9DGIgZPaISWd0CcXQjALBlAeRcpk1eLkB58daCT/O
	 852hMXst7N7a6nm30cNIR6ZEwmv9Fn2wwRIzFLysu5SyZNrS8NC+DVYLfUBjIQh3ZUw+K
	 Byn4XPn1vGVoksovdI4ZkvW1+/Av4w+roCZ9bN4SCfvFr6K1M61cHQ8Nt9oQwfH+H3rUU
	 EqnM0kiCo5+5V+09Pt8d8FX6op5HS6NYEvJWjCSg5ykrG/RuGS+qWBGs3HoH9nj/FWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gz2TsLZe;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD63606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD63606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gz2TsLZe
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3acb41888c0so183475a91.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668976; x=1793273776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvogVjHgUkKHLSoyeVICOyzHi/hhdeaP9GdYrV3oI9s=;
        b=Gz2TsLZeoPmDRdyh6sC6sUH3i8TowIWWbnT3N1VLnJ8rc5075qU5EfYr+MJSrQGkJf
         /N6j6ix9Gn8R9VXxs3pVgr5z+dLUTH44hjtZhESlXKhfzNlaz8aTxKXyU2DMRP+0mnRA
         mLO+0M4uX6E7Z7CpzLlm7+YyfqJ6OQzG0iE19ECY7aOPCfYtW0lbLPkS186T8ihEEKnp
         v6FzGMLpx6/48UwwsDmRGp5/sudJ6MC5orv1bGJMb7CpUNDce10kpDPySFc0ZRL+kVMU
         mCwq/ewHKedruKZ57UjN2wTvaIHu/mxKOAgQv84dYWgPWlvLETAAfSYRKakLCro4XKmh
         ia1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668976; x=1793273776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvogVjHgUkKHLSoyeVICOyzHi/hhdeaP9GdYrV3oI9s=;
        b=DHDCG/cOFzS6f+4w7FtOSpSLYdQaAoFnsz/qfnjccXf2itp0n/7aHBf43f9CW7Vv96
         tP8KMNdbAX11M43b317zPRQz8PSazNsO2jmyTwxHw+bamU2tlcD0OFMGXS5VdPVg9Ujn
         BtmifpbowXH+tfqnmzFFnPssuIO5wh0FvHZDN+C6wN6FrwZS9dOwOy0TZomiBy83h3yS
         DYSKgEmHmQu1zELcDcev8vwQKjUwj/WuDLZD4+LiUDiyUJ3WgoU1B0mydGFjO4v8G03H
         pP9lhgvXuTJViqx1lYe4PgPIL8unptsQ5PnoEgGXMU/udHN9WQXJkZo7CwL3wl32lXRR
         jeLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0ji+CmGz4PoU8QQmxn5sDfozSTfRM2OzdeRY8XSPyiRBt4FcTnfu/0n7WwAzbe+e5fJishLU9B7cF@vger.kernel.org
X-Gm-Message-State: AFq9FYKM11Zn9RYFYh1UHyJ6k8loWUhpChE2i43/mL61wJipg40PTCzn
	sNm655UJsauNUbzDWZPEiiqUljJOq1lq0niVIlAerT3tzjXE7A8FmJL0
X-Gm-Gg: AYBFou1C6P8LmkVB/vp74V9WBSvFdde99kU3fcH4o86txxBEGYoiw95QnNQuZWCkreO
	Et9HAyA2DgBm1SJ1dej6rpesBXGSXac8zMVV2BdnpOwxqfYWkLKZQWM5inHSbaw8FXPa7jbNPkh
	GFVC1+F+ILLwOp5N0eCpF7Kd1dGXCTFeFUYx53/6Krh69PMdg8Est3SIA36ncNSmbKqK/eoyqCE
	ujWgil3G1qJNSEQlSEDsLsXKebBfuw6NETIAPK7VkpqtthLTksuSnKg7viBXyZmZUKibtz/LWt5
	wpq+F4knhDQ/p6Np73wqzkzzFgUnCJKnTfGrPwm9cluwre8be3NAATrvnl21NERqRnqANERrlNs
	IeA/rvQBbJwxCuAPKMH0VS7Wz9YGT0AhtUnDGURB2ONKmECHz+fhRyj6nlDeVN5D9pU/0Y0J98Q
	kZC+cmkUGQ4do+o9jLI2gBNa04q6UsPLiVlVU4A9lIYyQxDVo9hgoHMMqFxAnHZJpEa7c9S1Ykr
	CksmIdemZZ0mCP0LXE7+20KR3q9TVdVXkc+zgHuBedGjO3zhWF+UO6n6JhwJy46sBryFfO3c9Bt
	UENQvTWiGaDaTfp6ZYo=
X-Received: by 2002:a17:90a:8c14:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adba54c4a5mr130623a91.1.1792668975794;
        Thu, 22 Oct 2026 04:36:15 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:15 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Thu, 22 Oct 2026 19:35:58 +0800
Message-ID: <20261022113601.2320940-3-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
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

From: redstonee <1516235445@qq.com>

The sm8250-hdk has a USB-C port, which support role-switch and DP altmode.
The USB-C protocol is implemented by the FSA4480 chip.

Enable the i2c port of the chip, add the FSA4480 node,
and set the USB controller to OTG mode.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 105 +++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index d92e569d8..9ff15d9d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -415,6 +416,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -489,6 +494,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
+};
+
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l18a_0p92>;
@@ -504,13 +513,18 @@ &usb_2 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 };
 
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &venus {
 	status = "okay";
 };
@@ -579,6 +593,28 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	status = "okay";
+	clock-frequency = <400000>;
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
 &gpi_dma0 {
 	status = "okay";
 };
@@ -593,6 +629,7 @@ &mdss_dp {
 
 &mdss_dp_out {
 	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
 &mdss_dsi0 {
@@ -609,3 +646,69 @@ &mdss_dsi0_phy {
 	status = "okay";
 	vdds-supply = <&vreg_l5a_0p88>;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
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
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.47.3

