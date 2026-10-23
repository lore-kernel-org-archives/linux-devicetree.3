Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740575;
	b=NlgXtl0C2V0xKKI01op8xZJ1e6I82DKffiVhQy7dhoqk68meycHGJ2qYjXT6t0infsiY
	 8d0dzLrNCpL6+eGLh9SeAjQzhWQB5bPM36qMYrSHPx6zB7Hi70O5TygvPMKfj+IhmTbfd
	 nbQilNxdVwPQwN2DoCduK+prKBQ4p7EZHMogjOPC3NugMDdqF9C3I8w5riu+BT+V8jzPX
	 YozYkIsEH4l/uqGo7D3aj8cM9MB7AV6meGCOuKFaDAciX4/9DWihvMuAz5UjV4pxbb5eq
	 8JtemPwLZwU5L2+jcBKI+c82JL3raA9iOl8IXJ07txBeXs2ryHkmNF8NfQah1MpLvFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
	b=rgFyInJLnFhNrtESF4Ca5T7xpdlDIOjoRy4s6CyFw8I1gVyjRrki4vOnb4A1fJMjciie
	 fv5qxbmcgYFkfkB5tDH/ybR1JmEnQ/Ij03yzG47hhnGWSdFnVPf9oEgc6hLtP6teUTfwq
	 8Q6i/CWj9sk9VbTmFYdFAVZ/9tst/he5RbXepNqS8dUyA6NHB1E6F3DLPZATHBvXkMy7o
	 M+2GK46PSNOPtxXxvDUHKNp6sFuDWjfq5xOju/kA82S/+yR8J4OJKvwA6Js7THR9pzfGj
	 Q0JnRexA5LoaZgz9z401QbXvzEmoq4zYqUX7bHAxKMdrcVo5Cb+H0MK7tej/Fm25sBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdq3CeN8;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0D606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdq3CeN8
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9ae391a05so3360095ad.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740575; x=1793345375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
        b=Bdq3CeN8nmxGTGNEujtXFVH2TPke7F6tCQtSP4fJkoqIK8dFkUJCCMGJ5+D20vCYcR
         5tbSrCkFkZN0RdkjNKwqaXfr0SS+yIc8dcUMXGxq7nK0i1Q7bfasZ4Li72GSkFQjxNRF
         NbAZdhkYm8pLhcUQjYtE7scCD4/58Etd1nmBUlHJUqVmit233CxXwCQM0Cit3ucwoPo+
         4DYqurVz3R765oB8Gt4dFMxn+6EduxxyTQYl/wfGNIP9bXOdh4V3Q1z/ntGh8u3nsZ/w
         1SWOuJtl4sytcxG6RKZw2u2msoDL3Hi4DkcK1FJE+67SNMB8SemFHobpSqshltuguV/p
         1DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740575; x=1793345375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
        b=I/8szy0RZrcZSVfWo+BjoP5JITAgkAcSXm/8XSsnQ6HK32W/9U1nX/9uhvoJDCRVa3
         EMyBVyag5CfE0eGmsqEFWtxqX7I2Bi8Ct3LMAo18vRB7aGZsL3gDxvahlTpXpJCua6TU
         tDq0wBHyWYIbrfutCX2QloWyYMJnUNBXDSGkJzgQkoYzQ5520d79jcX4DtPBdU85PAGn
         8n/ugSkZv33OQBm1LhOxq9XTsdAbk8Tt2PDfXxjYAfw93kVMmok0/98JvROibpXwDtdO
         Y/5yjyJWfKHBJb0EA47JN5IRXW/5U9uF5IPl4nYC2gM/e0LGcD8N4WRnTpfdjRnXbr7B
         5Ejw==
X-Forwarded-Encrypted: i=1; AKwUvBwqHdTbvQhBRDepCa/f7mPCr0o1RcOD4EuzryYECp9jK5MaohDshwG4xyXe1r8LD7WjdxCS5lM4YKYM@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3NHGhNVBif2TLAPQ+RySJ3xtklpC0aa3b1dYV3ajLSknMPDa1
	vTaFSpMKiGkX2Jz05mAaegf9XZH13SV0vERd6/BpzOL8jv4MpzwOfLWdnDddKw==
X-Gm-Gg: AYBFou0PeXponixHsIjjQv8M+Fd70QK8Di1PyR2v/5s9lxWziGBIDoytVFwQMs1QvrH
	jBoq5EbTna+9a6SnEhwbEzySETpU7DZoKPKmK5eT8qio3rJm7SMLdLkR142/VfNB9TuX0AwOcYV
	2V4X/ShHoMxtTFTwEfQmUkE3y/vj19HcI02Wd8kc+rwwJt4+bD3P0lQe6YMYIEulq5LG0LoDWa/
	FP16oNjGERPxi0ri9/0bYKIZzAnR7gs3ET0Bu6OUpVDdjFxLejpt5YJKQHpv4Fgdk0IZA8FQpLm
	WS689mFe7zwfsxqOI1GE2jGaW/+nZHiFF90sUGGNJ3wexYb9klnC9mMUTDAQnbA38lCBO2MyreE
	G3At3m2ZCuF4nV3eJgZxRyOI0dEe/Q6N5v9/7AUC1LAqbVFXxWKcKibuULreHfbcECwQAzR6tQg
	PTlOLjlAU5bll/jlZV1mN48Z4naB2cnZiqDJxOy7rZ2uwoMxFF4r4XhNbJGkVOcRQeiaRrPRtz1
	g/emJ+KgvBQU68nA43Tj7rb2Mx1u6nJpLhYjeYv1o8kob+Z6S0ms2EaD57rwVDLt7plTe8Umw==
X-Received: by 2002:a17:902:f38c:b0:2e8:4ef1:6fd3 with SMTP id d9443c01a7336-2ea627e3b09mr20695605ad.13.1792740574627;
        Fri, 23 Oct 2026 00:29:34 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:34 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Fri, 23 Oct 2026 15:28:28 +0800
Message-ID: <20261023072832.2642647-2-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC
converting MIPI DSI to HDMI, which hasn't been added
in the dts, so we have no HDMI signal.

Add the 1V2 supply node for the chip and the HDMI connector node.
Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's RST and IRQ pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 105 ++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index a049d78f5..0bc946682 100644
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
 
@@ -424,6 +451,20 @@ clk-pins {
 			drive-strength = <16>;
 		};
 	};
+
+	lt9611_pins: lt9611-default-state {
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
@@ -506,3 +547,67 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
 	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
 };
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

