Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660626;
	b=P+p+EMuZU/ykqago1ZBpQU9rP19Fm1tJIZH8T7chg1apAvTn71SDveT7tn5W7SqmhrBK
	 v679hjFno4JonuBsGeKcRJt6K7l5jJSRTCzkPtqOYaHDhD3lS0eP5hKIvKhNAODdVQdtC
	 YPQqiJMfKbK1mYho30LTLE1KEWUDim9qwAsqjViZ084SF0npFJXAxCBLnDN3pavLyeP1A
	 HZcITFN+MElzBRPvk892F4JMV+wLqHV9eLjC/yUT0ggAMp3qf3gy0JNmx61jM4SkJTF76
	 vhqcxpix7LrwvmNZYpvV9EGafvIzgwCql3E5D80t5AOAGGb+jQjgxWju5p4gDjYc+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
	b=SsHtBQFXjrb6y5a3oSAuQmMTvoBJ0OaFvt9kivy06HBOofIa5I0AVz5+NYBSVxr9UZV1
	 UCI3fdLd75FzM5/tPGqDzwCcsKNcc8xS8cYr9rqRTAbcv5zcXZ06md+ZZRRnG/W6DTCve
	 T076IesvlpXA9w5RdpqO2CPf8MU2NpUDSBYKAL7xHHEwGz2xmQQ+Kr5Hz2uYVZ7QH0yfI
	 N5x+kO7a8LmyVeCnEBu6dBJCq7QjFND4p90qsKLdEC66SHDeYeeFvZD5zcHqZO812oVre
	 hK3ZmfPlAj3wD25xpYkq24vi0UU+DMs6E4I7DG+hKeHX6kYUXFIkEjKTC+/m/nTyFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cf6auOfF;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596CD60A2611
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596CD60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cf6auOfF
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso3025065e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660624; x=1793265424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
        b=Cf6auOfFAWmlccKl7br9Gwc77SIPB4BQsbiyKpDWzZqfdSugvK/fN1E6kg61LHAkRC
         QHaZKW4v0ZZDN0wvtv3kTmJ77Bf72Mm11m7ldtmG+lgEPccLMFEAqs+8kf7cFeYyRYm6
         RWHzj6scVWtYKI8X5OtyU6fcGntQAeUh2e+nqaMp0cKLietRQgfKlfY6iCPXfmuBgZmg
         GUkGM79iB9Zw90zVvTdA2TowUpfpEnCSE5CRAiIWtLIcSbqdIZZH7UtnBtevX5K7mJuG
         Zct67ICaLgTtL5gcoUmkKZJDu8Uc8FcMYqLWrlm39q3QCojq7D0KsGJ+BCA40Lydd7dD
         nJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660624; x=1793265424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
        b=s3rCbNwlp0UhdtmfaIibhMLEVGV8DpOhjU0I0TqRufkFXQJN/4KsOlpYdiOCVT+BWX
         SP6wuBV0IKmhLrKf6PLrKXAvAPCggM8CW8gN3HqXvGc8LZFGqKNODR6EMvBRMryvXHYH
         SAvnzZ524DW8mgFZavMCiB1Lj/xA7GtTDqIR+/xR8UGtJDtgM+Vl0B7Smp6FwtAdqnz3
         kdlWXpUggZ86KQneo8LMyGgKX+brlg2J1UzeWflpK94lji+DoOZSIg96Kx8TZuDv9R7Y
         av7kYvbHgJ83auy/8QJb85tPi9MShrLDloc5qG05PkYA+NGn7RDeqQA3fM8RpDSIM9hX
         kamQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQDmNBcj+wI84axBrK6wu9s9eijwS9DmBbAnrwGEfDUGz1poIqujz8bs5pfwwKmpZjsmNeIBci3a91@vger.kernel.org
X-Gm-Message-State: AFq9FYIWHRSz7c0pAVnNGSGxi2MRCxzTq8cVggpyU8uQpIc8a6Z7XUmD
	FPCYBAelTUW28GX4VE7+MX11jHWV5IjGQg2zQhAjrvx14mX5l8kPqFmeeG4n403nAnFQUmAnk8c
	Mghym
X-Gm-Gg: AYBFou1XDNlTKmposT164V2GUkmtIbE38vru5aYZDCVzkGh6GALCYLHHBP2uroxjuEK
	SMlQDlznI+XSIvbzFt4tx9hE8pFaUAUbG6DxeyUSHz3IKHIBHYrrkwxLjkjZTRO1n7/fV0M85WM
	rLBvS9k1TXH5NvDJycBSI6LQ8DqxA03a76ySl00IvdBroldAvuGOjlLwZeRZwCljY3wdp8ZhvvU
	ph+9t0fA47Pkc14siyElDJReLSPiG0NVlNOASYVuAtBXIiZR+/JnbuMcQyOQxM88ibeZMulv5jo
	8ZL7Q4sQ0fMucF7rFIJu7YB4b7u24WpL1ui8uHgHw1FOaEZd+ODl0V08DfyevCwb1Ensp8JfJIy
	HS73mbflUE7HE5lhyFPmCG09ZZGSURMGLr5ZdRmnil1MAp8A1vRa25knalEjDnq5IleD4Fwu5NW
	80hTUaCWtIKgcXpuGpYEvkWDaiX2Pnq1kbr30cZhTpnqkJhJ5yl/fSEhpmSh5WudZ8L4X0SYl3q
	kCFDsYlttP5GY1EAu8P3yN0z48D9F3CTHRlYFeXr7OcaqI5nTKkvkRKCZUF18f6xSFYQwM=
X-Received: by 2002:a05:6000:4381:b0:48e:389:d2d5 with SMTP id ffacd0b85a97d-48e264dfe0dmr10396247f8f.51.1792660623447;
        Thu, 22 Oct 2026 02:17:03 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:16:59 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
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
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mSEhch/t/0QkSDJ2mhCmqms/U7I2YKfexi0NQ86USzY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSLrJAVjztrWE82gcgctFtpO4XEaHtphcE3EigF
 xFCdrg+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUiwAKCRB33NvayMhJ0Ur4EA
 CM7l3zTUnF6cNi4UTfOHKTZS5zLxE55mSpRwj109t/sZZWeEdfSBXL+mndutHgGwYl2hxwZ9zV134t
 N86U6G6ZnTqrjrHw2t4jh9g4AIaQMk6YEn3WLEvmRD1kpiJPexiw3OeQiMU6yyBKAgV9s56rZ8YnOf
 iWD/PmaBx0JQiNxRXr5u4vMcAxnVJ1/ryBPu/sz0YyHo+nCEgKYnFryc1Nh+Om1Db/ar4YQlh7rjrk
 WjURNouErU6pNZ0buTLeHiFoC8jIamxagLCP53IPAANm08XPbHYvaWsEa4cAKgNi0TjUFpOWL+dBMm
 4FruUfNzW7bjim4nvsMAkFF0bNzFiRjHCV7UIJ4E8IU5mi59+5m8BtCdl0QxJyL3nlOJveX/lrYTgW
 4FGuDp+owTWIC37svmfwmQ98nDXchNv9H9Ira3k9NPHoCgWMrTpuvSeGVMkpjyhHLxFEWOMz/5NKWc
 geD2sqBsXNjzymUpLeEq0/xqhTz49XLrJtxKCBZI20+RYoV5mqkDL6uMQLHJABfHk4WB9G/w2hfddg
 Uk9kajeY2dY1pQ+LTN1U0Fo3SdGlmE6cpleZ7izoWnO5+1YtGDPm7JAxzFkaGyhc1tFlcIxffWjNnu
 AXEU5H31CBRcLyxtOS+/Gm9lEJ07TBVHNbLwwKJKluLjhTfKYvVIfn46qLyg==
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
index 6cb0dc089b17..eba989e6766b 100644
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

