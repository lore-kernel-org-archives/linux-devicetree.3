Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987562;
	b=DO8E8iCD7+708seeiHnG9aj+8W/c37W767QeZXiROze4dFNmKg7ucut8/cz6zbwACJY5
	 zCimwJre1QIS28W3IGlC0F6uoAMihzEtTq4TLQRz6VqDi9pPgEQi1ZuadSnNoCSpTz5jI
	 8s0cFwhw/GlvKYVnesnj7dmfTuPF9/hES0kKrvHKEvNbsBj82qZUZ6yhynK4iCOTA2Weo
	 JW14WllELRdrr8DhVwRVcm9oL6i5BxkuTN4uKAPkZmfjBVgc3K+m1xwyYsGTDbQ9xC99k
	 GJqUMGhJNGxd2M9vuor8akgRn+LhgDbe7Zfazg2zaVOLIKT1pVvv+B9r6izrrxn6kYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
	b=B2XDot4tb93Vk/pO8uQ1YDl23pLwLEOCWO2k0AF2ajsWfWAgIy+uG2tuf5+QdE0l/T2E
	 3Dfe+F4qw4aSUsGSC8ORdJMHjXsWijhNasU0iP43/MhXYBvJOqD6tFqfj6GxA1r9u4N2l
	 hymEp+vT+SVuBfiSisBOJkVXwX3MkrCPXF4DFkKZCL6Pl1k3TT9xitTJHfCmdeC4nF6W2
	 nxv363xJtNoGf1BadZH0GFB9HkmRdv94VPfBcyeZODqU4VBpBgdAIXDzhRBPimnnekOKH
	 O0rZg7RupLic931F3fn0hAea0muB7VIA25UwRmM01DIpsG6F1/d7oyh1Cy/uFrb3E3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=dJnL6VCC;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC32606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=dJnL6VCC
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49376eb635fso340553f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793987560; x=1794592360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=dJnL6VCCzjqn0HtRC+I0cQEvdVy8RK/ZpiYGX7AetqpS0imrsttLKo2pQBEoybw7e8
         ENPuVT194VNF4IeFX/wZif1U51zIXWpNbWI00p5B/+PRnVir1l4rwzP68+oOvP+/SgbS
         zVqufQTjDULfOG5tkwVwwFfWNRWAqcOjYMvpe8OlRKoeR2O1d7OEVzPc1Bu/oMKsvpTj
         m/3TQPrSIf3uvY0fyaO32bnslN4hSxIXT1uho1hgilMPZR9BPPWi60TT0YBi6XFGmsP/
         vnRD/QTwwe+n08dhenpHMbEuatW5H9thqPSYqxhgb7VdzJNU43hNzmxfH2kqdAE3b/iN
         XkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987560; x=1794592360;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sHP2oF/bjdk4Sr2x8S+jhHLHTWdyktVHIEfvBs5hv5Y=;
        b=Dp1b1PnhiMNgfodDc8ZIAambo6A3JpjYu6FzqTF9f5e2gMFEy98FFrna02HfMbQRx9
         DmZeS4bevoXxDIt1opELiROElnphwR9hrDX1raXQvkpf7dX4MX2qximU99EVnnbfKrDU
         YPzkZAMM3DDr3S5MHOPjMJZ7J5KY8MMtrzex/+w2FX+FJgsrk87k2Crt8+fiAe/8OH8C
         YQyohWoI6jGFXdrWfAnzMwBDHqIPbpNSIgXyg10xrx98kfXmaRmiZ8f34JVVfL/MzcVG
         CXnKKt5swnR98rQ/VOQNSAm6x1umccTJK8Lmg2GFLPzXhYophowEeOL+moDGYxGBrYps
         icGQ==
X-Gm-Message-State: APuU4Z+tz0wQ4LZIA4SPJ4zmatA1p7HuaO/dJNaRK82m+Kpa68s1yIDY
	eFzZ0aQ9ggCCYkC6HIavGHPWIS2Wn56H8vBDBfWoDQiQVER+iJd5pXG3J4iYvPsTX3G16EMIDU7
	d+57XVR0LTg==
X-Gm-Gg: AYBFou1fE05ADfreYtpRsI3uqCRuxs0dk2qA6C8YkBpDg4TPnvtOFEjkRWI1n7CtSSC
	JraoPpqzWRaNKoF9RslTbqGIZOG8Pr/POTS0XArC6KLebKKMpxQwRyXUz5biCtn7KFwIF2it/pd
	tIO5L1Pa5PRUJi6q3brtjifGJRCFNh2I/a1mjmYipLfg7tgDQXRggOFTPdehB+oXjHRJpVxpRax
	+/33OvBknHwZhXze8KgW6ISLVeJa75mzuQvmKdknlQWoPE20DOzBXctbj/9ZOfHM3kpvo3QjC8u
	pUAme09j4jEXQI8CYYP0O28JgDOBSI1RtI77zGmvgWyy7fGG60THIJ6eaJAK13tTMbESuXsu1XZ
	t7cZBXJDgU4hWwBvqdluKkKzgZCBbyCnMHTUyxN3KrqcbCA2mGTteazp7laTWETzVAbGlP34QSI
	OHKb/lXp9xXSBB4NEn5e1qzNFIHarv0f27b5mYQQYfR9cVkZ9DppSn/2BPYXaVR3lyz4wGIO2a+
	iCoNGV0oe/yiy2eh2BfTOgyut8W/98Nl6vdlDvbe+JqVfBAu62rCL0l1cxwlnEDSb5j0SsGA+uB
	geJM5uUJ0aPaWLboWcOHvT2h5i5I9Iz9JBajfNiuvbJKfylTvECHy0EcAcLvuSM9VVcC3x7TfBo
	kiv7BX2GEPg==
X-Received: by 2002:a05:6000:4b17:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-49275fe4f50mr6153448f8f.16.1793987560021;
        Fri, 06 Nov 2026 09:52:40 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm4427671f8f.19.2026.11.06.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:52:39 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 06 Nov 2026 21:52:35 +0400
Subject: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
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
Message-Id: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3S8jMQr2JcMGMHqgmaKRATw
 t0ZZfkt3tvAJKkYXIsNkqxq+p4y+FJAGPtpENRHNpRUOmZymF5V0zqU1TOOi/mKGYkkhhjrvqM
 OcvlJEvX7v97up23xTwnzbwX7fgDI0qS2dwAAAA==
X-Change-ID: 20261106-rk3576-evb1-husb311-00efcff4a808
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5103; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Bsdyugnk6OoKTZGf3182OVL5hFUwb7G3DqCpOh/DVH8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9E356PT+1Oc+onVHtN5c/m+fkZfEfbN/o3K4unBac9
 spw9eeVHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1piHD/0jlzK8xASsOlqnsPih7Ujw6X1Byvvb29dkyOWdP9cVbqzMynN3n+Cw
 3NoajdvvXrhNybAnxvYlB1670fhav3FKXwf+WBQA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
controller and a fixed-voltage VBUS supply.

Describe it in the device tree, including the wiring for both the USB and
the DP side.

This makes the data roles follow the Type-C port's negotiation, so the
port stops being host only. It also leaves the VBUS regulator to be
managed by TCPM instead of being hardwired via the tangentially related
phy-supply on a USB controller. DP lanes are also muxed dynamically by
the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
lane muxing also goes away.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 150 ++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f83d129f96f1..a9b27cdb2dfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
 / {
@@ -334,6 +335,22 @@ &combphy1_psu {
 	status = "okay";
 };
 
+&dp {
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&usbdp_phy_dp_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-mode = "rgmii-rxid";
@@ -772,6 +789,58 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@4e {
+		compatible = "hynetek,husb311", "richtek,rt1711h";
+		reg = <0x4e>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_drd0_hs_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy_dp_out>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -944,6 +1013,14 @@ usb_otg0_pwren: usb-otg0-pwren {
 		usbc0_int: usbc0-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
+
+		usbc0_sbu1: usbc0-sbu1 {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usbc0_sbu2: usbc0-sbu2 {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	wifi {
@@ -1008,7 +1085,6 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vbus5v0_typec>;
 	status = "okay";
 };
 
@@ -1051,13 +1127,74 @@ &ufshc {
 };
 
 &usbdp_phy {
-	rockchip,dp-lane-mux = <2 3>;
+	mode-switch;
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
+	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usbdp_phy_ss_out: endpoint {
+				remote-endpoint = <&usbc0_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usbdp_phy_ss_in: endpoint {
+				remote-endpoint = <&usb_drd0_ss_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usbdp_phy_dp_in: endpoint {
+				remote-endpoint = <&dp0_out_con>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			usbdp_phy_dp_out: endpoint {
+				remote-endpoint = <&usbc0_sbu>;
+			};
+		};
+	};
 };
 
 &usb_drd0_dwc3 {
-	dr_mode = "host";
+	usb-role-switch;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_drd0_hs_ep: endpoint {
+				remote-endpoint = <&usbc0_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_drd0_ss_ep: endpoint {
+				remote-endpoint = <&usbdp_phy_ss_in>;
+			};
+		};
+	};
 };
 
 &usb_drd1_dwc3 {
@@ -1079,3 +1216,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dp: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-rk3576-evb1-husb311-00efcff4a808

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

