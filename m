Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668974;
	b=IvpkcuL41VY4DuDK3U3oN8tyaZ4RZG43kLGXA34PITcNx1zkVJsGbnYX1t4pyAubZIDi
	 L+4ADizFLiRaekaZN/CKfYcR34O+Z/4WC0gZ25ETgnUSWddIou0fDzj4/PaCNmaslZVG3
	 mroK/g0UnHUupTqUaxi7BqCoa/y828v8x0RDJGLZUNM8PZz3u1+e4Lz1enbpjAmbgM6gg
	 pSJ+q9n1eXlWaNgmXrjPMxQ9LQWnZNsn1MPYp/X+PdWoKb2TSKI/V1MGfi7uaXoN46Jvz
	 FzSOS40/Qng5Lw53IW6C3sctpynqzSPoEOH0s12APB6MBPGHHBAQhBpIBOB09347fSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
	b=v96HVHXQKoa1p12uUrcrTStRVfyUFi4j7y87/bEHOJTCb+fFafm5/YeUuSh+tgjR7Q5g
	 fX4vkNzUCZHvqYrdDu+K289gzDRHOXFi0epYx6GP5L0TyMq/gqfp6K2YebZAFbwVOr5G9
	 5OGTWHHDQ15Ezcw7paCuCbK7KERj7F0a7AeX6mP+5foBhi7Cr/8hsGh0lURmQARn2kdEl
	 /3Rm9k566qCPojXyjp0eVQlf0OZaaK0zPCV8QrELchxX6SjP3zESrKPp2g1nJcYbPrd+i
	 Z6oc6lPBzVN+1bcLhb7DWKwl4xSfOb4D92yWNhwlSixD4Tv04c5eExTpMMYWSOix5tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D84roI0L;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64673606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64673606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D84roI0L
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so360978a12.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668973; x=1793273773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
        b=D84roI0L/glpLHzixfYSzhSgiaOlSkGX+cwkzJEag6pJYB2c8YXfG8Hj4bbKJyXZJr
         qkRRxO95H4AiT64Evf2gxOfXTxfX+3Mz+TDIBFutgHxpmCPXnfLOpDWFuW/FWzhdFqP5
         6RYWlr3cP2c6l2DIkjhFQQQ8jlEhm0BFUukPOpJhLYUEdWJE+IxIXpLRg192Bgh5P1sA
         74v9gfWrgjZ8v//PPw3sx1EzXOfjQcgzJ8oMTeBk0AX5P4zgMO4HqjYLcqx5wFyh1Nj8
         6JmKRL/Hp8cnAOfDwL/YBJH2as+bIVZpNOtpmnXQUJVT/FBS1hI4v3G1iIdeWzGc5bEj
         dRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668973; x=1793273773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
        b=JYfIhPt9WQKHpcnBeBjTNlZ6dC3YK5/rQbTuidadUJfe0SB+QPIbzZAfb8m5j0YPXX
         WHsvdiyqbMAsyOz+6zeqiGYqDNMNyZ2pwV8HWSULqqdEd7KD2dTTD9vYbVJToZfV+pki
         davxizsCDbBz84ewU0RBqVxlTOitzkTleI5f2KjZh8Gw/IsCmf5UxLGnZFVIMh/AuSrQ
         +I+VhgYB3+gH1ry4ENtDRTO+iMVYknNS8NKac0XbebxQwAdfVNTgNzZW/4K/P6D32Ie5
         BL+tELAWPh1EaC2NxJg5Mh7F7TSmMQ4B1XqjQsDzVWWYi1OYSfk4WhzA8VI9kf4tO0Kb
         G0bA==
X-Forwarded-Encrypted: i=1; AKwUvBwkcyETWb5972swHMLTuMbZN4cZx48la+et/VJd170/nES9s/4HQz5SAf+PS/iCVp2cMB0Z+2grp7Cu@vger.kernel.org
X-Gm-Message-State: AFq9FYJHE3uoIthHmctqeHbXetCVPQdSwPvvmDwn4PPxjUzf6yk9B48f
	1ICgDmj5fblyc6gtYoTxFogvcTSelCAXIk/71ibCUdE925chdsB0meBA
X-Gm-Gg: AYBFou0iVy+BUDweZf5J2MJuRf8NphtuKcDWFVOwe/ttERYfDXDxrX9ZfthE6NlYPBK
	u6ovWMiT85LSbeDTel+/hXvMKhgh0PA2wIeUonpvKFBPaFli5SNjikyZeVN2gHPg++RYhTjzeI/
	aLzJfExnH7QMVu92+9CZr4JwYh6yrFILNh1aYbX7gaCdcHBftxjjequqfKfaCxnTfrcHvKMOwws
	JVHzngvmY50sGE3zpTl5GXrIt/5CQBdDeZBFvgIIh3gxeWqSdZa5Fpj2ATmAyQ/vgpyXsYPS1IK
	IRs5hgtYGXAZiuvXW7MhgaLtNmd3eN+5lcE9T9KT4JPzE4hb/iCIcv2QKUqoNA5G1cLyrtjxDLk
	RNnfrzvevP1j58M5Tm+kX2ZW7nDPTnXKmnU6RkTYSuh9p1j5w16FnH2LcgY345o8HrPbg5QQpYO
	xxoNxSRLA00Q520/T3QhX1+Ye+7HrKYZYx5ckWt+gEva+LvNIiu8BpRrY85m1Abf4gn8WfSYZL/
	phD0yY+88tpZXnow6KHHwCcP82+36bXF65pZsdvLjBvC2RmaIOzOxxzc1VZcpXUigZxoZdaHQ==
X-Received: by 2002:a17:90b:2752:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3ada6c545d3mr1333278a91.2.1792668972657;
        Thu, 22 Oct 2026 04:36:12 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:12 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Thu, 22 Oct 2026 19:35:57 +0800
Message-ID: <20261022113601.2320940-2-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC convertng MIPI DSI to HDMI.

Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's rst&irq pins.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 123 ++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 5975878ea..d92e569d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -44,6 +44,18 @@ vreg_s4a_1p8: pm8150-s4 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -63,6 +75,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -396,6 +419,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
 
@@ -404,6 +431,20 @@ sd_ufs_cd_pins: sd-ufs-cd-pins {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	lt9611_pins: lt9611-pins {
+		irq-pins {
+			pins = "gpio1";
+			function = "gpio";
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			output-high;
+		};
+	};
 };
 
 &uart12 {
@@ -486,3 +527,85 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_default_state>, <&sd_ufs_cd_pins>;
 	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
 };
+
+&adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/adsp.mbn";
+};
+
+&cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/cdsp.mbn";
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_pins>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p88>;
+};
-- 
2.47.3

