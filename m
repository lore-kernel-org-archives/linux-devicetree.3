Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9A3C5546
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485162; cv=none; b=WUBH0lsRVryRTGImkA5MtLaqqI5gEUar+VB58Vy1lMhXv5iDCcdiB3tb4L0vrD1ZuNpH584BxL5Z0xSmldS6McD1ZkQwdvCpYQF+8ukkuwt3TmjnZ7/q4xtJXcKqiE8mQHUJm5aEXq7Ww+/OYe51ZzkbFwcrsOrtJKhbpNTEIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485162; c=relaxed/simple;
	bh=wvTrVwmH9PzRt8PVRzaJLv6T8Kz+y20pDJY1266M/fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hbtx0/EB31MvT6H0Ftydkx8xdoRQ/+0voI6K/4PIMtCqFsjfRo3YnPAe38SaWuPVc5RpQ5GgDbos5sLzrm73hmaqDczOWFNFlLWFMBrUGQzbn/iHIJQ2lIihlBbEzSzr4vpDMbuqTMHpTZ+88iJGdxz6pNCPzZQ2BD2om0ioNMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VynqhCNq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VynqhCNq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso1062007a12.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485159; x=1786089959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2NxtTeKIysLSdcICKOUJvlj8GihwdekyZDL7YHECjE=;
        b=VynqhCNqkBx/4b0qMnCJaMgySNrMLH/qjkFl0YRvWWGGLoMSY+uj+/ZyB/pb29ynaU
         U4lfP21tvNWxYBv/rhLbFQNuRhXgfThFsxeNLnzQEHNAXDrGHPZ1VCD9FUjlZiezQWLA
         Nd0L+bsDcK/voUL5AKAQZKdWYUs+VEBUeQh46sK6EWHpnB5GbZMpdneb2e/bZiZoywAn
         nXaMT0cz+PieUhoqlcCSDLjdB0mizNcj2I57X4Nah9YU+q5AeBr6dWnNlfDOLiYv4mMy
         i5jELsqKdU6ijeQP2HhkN/bFMuABrIzJMKmU7nl+9VNFx7pWA/DHsgTgsmQMBSym/sKM
         XX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485159; x=1786089959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2NxtTeKIysLSdcICKOUJvlj8GihwdekyZDL7YHECjE=;
        b=DrtDTM0+7p6UBt++bNbUVqn6jC4o9HSj59N84z9QnE8Zb25KNObmZl4clkXUthiKZk
         Mjc6BPiLq2ovLlwuicEfjzyRzuCjjxg6U9mtBsHP8jEXA6lhkpQKW+VcCpascsyAMLJM
         Htk3nooNVIb8kArI2E7VFBOFasX24bsCvpDbDWjAshxD3KNe3w4lkbnVymXvOAz0pG1U
         eNvdHDnX0UA6LO6t37SCz8YTFZMwx712LWdUkbM4Lp/NBPsriJE3NVcEqwIK8u9Glz1n
         BOu0ehTfFUAf0wdUkoTJDIGk+ezvyHSrmDeHZVf/m3ZFVmZaE+pHtkuHdwiYy6PwAwTx
         5CBw==
X-Forwarded-Encrypted: i=1; AHgh+RreBTFksazbk9CLy/0lUP4o6jtWj+uHXtzOZX4vhbrxZ5TY/wcNVhKW2v81QOIuE3sDk+E8q7Ile4Ia@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+gIfwN7sNGf1Q1KOONvU/cA1wtjSImjFjz7cR1e47w3etLgw6
	JkzMj09yCRs3qrNgBmSTmbe7d/xDowZjYefaxMVBEFAAj5VPr2/TeA50h93Yf8lbqVU=
X-Gm-Gg: AR+sD12Ybr8qbyImcNwtzMLwKBw3Z5fd5KM7mx78vqDzpBA+8/j0+GRXsf7BBmU+t5h
	KBuhRM2A3mz2mZaexcZQUyg6nFKlbI3bgyshAdH1g7prubUOGKK0PlFze0unZ1Hp35GSQbX/UnW
	DIkhDnZJLt0YiOeJmj8NTQO0dHPv2m0j8Ru4by3YLF2hW6IHlmO1F7HyTJ0ccX64HJiu06Y8IHv
	awZwrRO6Bg3dztJmGO1roecvcFkio5l4MxXHMGJmASMhUe96SbRYKFIjcIbNdBI2AYp8Izsoxha
	/4cGVILMJf9GjcF8Dqt4TNkwjW9HXhadFW97IhDBYvK/vlzCMzVwKcWk13Pvt84y35fLn1birHx
	0Mi6yRvOZ1yXok5rOiMKiqPLDHXAGZLCvVXTF+MUFPT+YOdz91yj9jebz5xYQoe58TmibmlAzO4
	g+ILaR9iFH81H7UX+1nTsnAp+HPHxwMcojZSG7M0wc2HK68Ods5c+A7MZT6sJ3FmENP8Xv+fOFs
	lHIVyGa0Q==
X-Received: by 2002:a05:6402:20c7:20b0:698:8857:9ff0 with SMTP id 4fb4d7f45d1cf-6a09b1428f3mr321027a12.16.1785485156783;
        Fri, 31 Jul 2026 01:05:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm1689589f8f.37.2026.07.31.01.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 10:05:52 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8x50-next-hdk-i2s-v2-3-42c1acee5a2d@linaro.org>
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
In-Reply-To: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wvTrVwmH9PzRt8PVRzaJLv6T8Kz+y20pDJY1266M/fk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFdhqLmhQOBIHy9X+uWB/OSkmL1Vf1JLCWPaXh4/
 e0RNd8SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxXYQAKCRB33NvayMhJ0R+ZD/
 wOt7pLLryDSKIv25KYPFZA7c3R694uJO6Bb3nVRFhZAMPKRtYtYhmbskVmBIPF/h3eQQbOdbIqOU4i
 biv9UWT4DT6gnXKAn+o74GIozHEO27raFzdzyF5oE1z5DTxW4cS5ozSmH6b7HUbPeDjbKCOy/WZjkX
 UXK/a3HjLttlR3dC8kaOGc21VYfdkCKLui6DStU3XgBJDCgphsywLlsuIAj0+m8VVYSPD1Kal/qNX/
 cv41+3hqOX9GLrSZgNB+pSj3ZIowhRDJzvh7bVJB9KX//sR6ALNwKHH738yelrFIRJghAos4AIona4
 OQR+lkVM5kPKFAAEgik4bzubfBhFb/Rai5tx77pZHpnPEjsP07kOvZUpwlal16m+CP7vg4HMLGRtE+
 toDOBOuuxCGbsUV1J1+8Oe/Jpfv3y3kdwgphowSholGclhzK7TgLQleeCIjoFwWlpC3OyTKMQ5RS3K
 9GMghgeiGOBZI79DYrWQ03wSxVawu6hSo5Ay8zARwaRacm35UL1UQSgvVO8WRw8vdD35j91ie6/ERH
 LcjQe4jsXI83ASBMJ6oD/HQcvW4705LvDJhhIN15dQjJbI7B87QP+WQm2QiYMrdzuvcrxs1WQF3hp9
 0Yf5KxcN0J+iLGfRcDKcMG6TKx77I6tUApCLwY18z5h/EnFMl79dLvpYG1QQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..b62d387b9afa 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vph_pwr: regulator-vph-pwr {
@@ -853,6 +869,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1072,6 +1092,19 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..c1beda2442c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6540,6 +6540,46 @@ wake-pins {
 				};
 			};
 
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

