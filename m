Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008244;
	b=fVwTM0NkX2Jjhk1B5MTX7Ow1ossQULdexfX+KbrY6GxMPVYu9627zhbMGWtIeUje4gqD
	 t+vS9Sd5ydwbO5OQdBq8gGuitwyzoj7jiNNPT+d8nhEbUjjqY381cn5jqw+PaiyGgJbzV
	 yqP62j2N1edJYNLPdLAcJ8GGvVYJMQ8oc1jl3I2gJXSdRIX5hmV6294ot0FJniC46/NBP
	 le0zJiGXAkCJVdRtspzIpUwFIWuKapK57p+jL8KIYM+Up57rAA3852i8lVcR4lZZUFI/d
	 d1fBzTamZLpy+f/0bi24IobjRfJNfJWp+iESa06A7aqMcyNrgp5WS4gqTx83uvAUvsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ECtvoPtqe7pQeH1ENPPjw93ehnoVYwM+89PruXe+qj4=;
	b=ov8pF0fZAPc0/ykfREOiQ51ToxUBMfmwNuVfkeaIiGeCjsj2OGZiTsb2KQcm0g7ZSp4t
	 UgWGSGYlKy9TXYyNtuF0rp2HOCLaRNLeMUqp/pVOr3i8yJvogjW4tGor6ocW0PWIaH6xM
	 XjWCE/dGVdb8I6R+EEYUQ9gK0MEuhTk2085f2IGHg+ASX74MyZ3/N3cbtHN8+xADyNrnl
	 0oaOV6ehi1PP76plb+f2dy+3lFgDVq9vVA5YWvPgMuHqdhNfbmB+na0rsOVl1PNoT2/2z
	 zC0mQIuRS0sVQB325kQi2nsgE/dafgRtjdjPgpQssA/aNp8DNouadqEb0ij8498+Hag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P9lW2En0;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E88606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E88606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P9lW2En0
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0728so652594f8f.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008242; x=1793613042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECtvoPtqe7pQeH1ENPPjw93ehnoVYwM+89PruXe+qj4=;
        b=P9lW2En0wySu05raW+XzqCf4R2DDEhxIDGzhIjZQOMuSa4WmUT7Sn/GZwfuGYQQnWp
         xJGDt7XRxQXKFrpvkHRqPs7bL8EEospEVs5wGSQs326CUD3yO2BQglfiXAh1dJTDlf+b
         HQiTZ3AyRlmfK1r0L+5p+SYZIjAKlQk1TKEF7H4us3+cZhqrAFpX+f+w/qup9Ohe/v92
         5V7Ns+2P5+uEjt9ogpZFl9IO4Gc69jEkpE5a/S4sEQc/FlqBhVqb9/Id172BCeqXKso2
         9eXWMbvb9KPR47ONJo2QyJDmkWxsSk0KNx77ITbsLNJsuQWpRu6zOODaS6+dH51dpIiB
         X9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008242; x=1793613042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECtvoPtqe7pQeH1ENPPjw93ehnoVYwM+89PruXe+qj4=;
        b=LCYfR/D4tf2yZ5xgJRa9GVruQL5xAJifRWARYJqmFYXvJEFy2UXUIHVtKooA5TL4bX
         9CG3+a8Kfhj/p1MVf8uFrPEuTN2YEdFi3v4Oc5Oony2TlwayUbZZ4Hz3x5FXBzWs6c+Q
         iN6aLTJZuhEbHrCn9NBSzlszjocJQQA0PvJYyIKUBDZnlRXIunEvoRlEU6LwWC6C/NqE
         B5dmWdcPuiLPg4Y82hf8SItuzsBTzFIplVeQBJ5ndMQFoDfcbm1wPgjEF8mSbrXw33YQ
         yTCT1uKQGgCWJU5m5gvr8yQn+cRmFsk88SD6OS8kan55+YKrdajYa6pxyxliP6TVkX+/
         GJJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ255YOjwEJAG/7XcCB5bf3xCIaFOFvbletsXW6WAU/DNAPeo4jmNGPLrDlAWPvr4w7t6MDt3dF1UE@vger.kernel.org
X-Gm-Message-State: AFq9FYK2wVBUoAWB68fmS5CQYOqc281b8cbnOo//66y3gS8eR4+KzZsN
	keC3/2Gma55WMlaKtjlUk+tYPVDGiLSeVABoHYvByzLtk003LSb8AXNgDuSaonxmA7o=
X-Gm-Gg: AYBFou3ht1OVqpimeN0mf0g0XBGk4sf3bIKN28aKBDAT8ffIO4ShBznrYTrnvwGiqtG
	9J40r3pofMw0aIUnM/8R4mlivNg3HebAfPm9734/n0PeMsPYeU1jyscqK5T+bdbuU7D0oMj6ny+
	ZqVDCDowt6j+EJ8aJlkT2aQXo2LNjoKQacPNltSRe4HNZ1jlsuR2y7DZz1KQKO2A2aiaQWCaHJD
	SK5my6+s1pfL9BZkXx1QLQbKrRTdI8ORtmA415vrdyjf+K2BDdeNYvgAQZFTVkI0WsNF/SirLzq
	Tv7rCrfwBJ+pmKrX4XaIKARcik4gNvtQf1WltAAlGPJcSPj4qR4aUrUb8aIhc4k3xbP+9MBgXbG
	qn6uDxH6GccSBnkGWngJOoXvgB3Ko6zuDhTUUKdDYobBQ9n7rOxI8ET96ZNA68uaOiDPrHi0fV0
	w4OnZHsZT7W2weA3Y5FimU0MlYaf2bIzZA6I38YldFt46FrAh5KY7QWRH93Nh4cWcLppaZpjfbW
	JF4LubZ8zYaql7YEUcnBL2CnccZeyqFdJ4gtLAbpQ0dnBXhiLRR2H6pHYGA4RMAZA2ndDPq4SpA
	IOnR+lGQiXnTiS74bXPGGxs=
X-Received: by 2002:a5d:5f81:0:b0:48e:390:80cf with SMTP id ffacd0b85a97d-48e3eb99b12mr11110353f8f.32.1793008241805;
        Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm15524019f8f.17.2026.10.26.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 26 Oct 2026 10:50:38 +0100
Subject: [PATCH v6 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
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
Message-Id: <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zjjFbvlsRocFR7fYYx6t2MxAc3tfNYFBzuISmMHYOZE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq3yJuiIpuzhICOpkR0zdvH2bB16CqgUiSC7UwGdnn
 7g+UJLiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCat8ibgAKCRB33NvayMhJ0RSQEA
 DHMTbQ9+e001W21gg02JBEAyPOYAd+0VIVOFYL6riQoagX87P6MUop89si9LncFURVbaxDVyo6flFU
 z6FPH3WhI/NI/D0RYDZxCgsMoBgTsR4fhfPO3ialyjBafFzVmb3ABWrZIZieI1LTGKNjd5o5fwzmEK
 1iaeNxewmJUyRDgXmvSruD52UPrrfvBCtDNlHvuzruqW8qKMPo4E0XufgD0tpgtbjxx0Sf5W8VQMFJ
 1+iP+Up0C4L5k2S1qQ3lofVoq7AmJDea/LGYYhs5/8t/n8AeZKph5h+EKH4yjLko5tVIxIFcZwnYiP
 idtLKxclJMo15wymhHvlE6RwCku3g5Itf1/4lYAtQA78o8RHSe5fmNFmlGqgqT6PS2KHPraDNCT0s3
 H8YmJBGrqcwHzMvi6miMNH6q62JIUDO3i+chg1/ZZUPFDx4Fh5xcfS2e8Uc+1IEVVdkGDfdYAxi5px
 Fo5ggTDnHwmDHl0W1TrO5JFrtQo72y748iezACdebOz/vvEbkMCPpVIMavWqaoO2856mRI348amG90
 38vbdHCSJnpR7kQSEBAibYXVTBY5dxEsHREtQy5bkv5ZcT0eoRWWM77iCmW44MOMbptFr/mTiRpls/
 6yI6fFHeLowCC+UR7l6+MmULVMi17OgFrgi50RNdoLzhL9jvUwbKZdh9RVqA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |  4 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 35 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 40 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
index 5a594d7311a7..8b008db2393a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
@@ -66,6 +66,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel0_in>;
 };
 
+&pri_mi2s_dai_link {
+	status = "disabled";
+};
+
 &spi4 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 6cb0dc089b17..6b13afc51590 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri_mi2s_dai_link: pri-mi2s-dai-link {
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
 
 	thermal-zones {
@@ -939,6 +955,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -947,7 +964,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1350,6 +1370,19 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
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
index 86fbb0fd6472..922868e2889c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6607,6 +6607,46 @@ wake-pins {
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

