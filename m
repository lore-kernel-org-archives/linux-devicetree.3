Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0C941B8F6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228819; cv=none; b=OVGMv6AkVMX4u1eHkqZV6O7wztuIGkZLts9m/EWpz1UaJXyMCxGwkVoBzZnHCuS+1mBCBtUmMgM9XBjKXVFQKguiNXyGTxOf+Z9xsbiaf+a2rE7KIz1SO+Clsvtu4hhrHoVtLM4N3C1NzIy3W4j2azYAC0qJu3inyFowlJ8Ho1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228819; c=relaxed/simple;
	bh=ick+WWmqmCUpFTYEqKwHZN904kzdEs6qmaxRqBbcHEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zj3Wy85wRrM/W4G1ZfffRabwy3uwCloHVbsevhi9agieYmTi0buQczq1bJ2Khk722CT27YzAHleB1KfJdZyEz0xGSKGOYaAOsXBbasc3mInKUAu/uatpjX8qluyqpUgtyXvRRlmG8+womuUMeDzoOJ30P28UcfLhrQgrHgd3/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHTjzXUD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHTjzXUD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2355724f8f.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228816; x=1785833616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4CKiPyWDCN9LNyo+oN/M4sc1942fAPx9sco/RY3rQo=;
        b=iHTjzXUD7r1Nnqt6kCcsgzWOhNJFhrlyCOIMWmmob22k9Bvu34oQ//9Gazk1wsp/+0
         foq3VJXEvmxEAy+745S69xeBHwrcTsMZxPuN/yG+vwQERrJLmEkcxzoF9nENkCbkhPB0
         tPrBGVSs04OLB2TfECN53g58o4KD9d2KkbQrYsOcWyTgjCVcYuIKgLW7XOHeS82no2kC
         Gu70MfZZulHUCYYQvHKnhFSKlED9D/qcR8ctTDEpC3yIKcGbt0eeyw0SHA5Ei/odDRKB
         M5z/xlxgtV1rVRS9upaThu5T0sREyK6/66U+dl0Bq/Vr9tRgDYu8MxG/U3e/jOzlVtoW
         0G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228816; x=1785833616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4CKiPyWDCN9LNyo+oN/M4sc1942fAPx9sco/RY3rQo=;
        b=kLGmRj7hxWiWRKEL4MYWJpj7/2SZhgpNtYmwj7tHc01KqG42svJmCSbZDajDwqPnK2
         XCNSawAdSLnwxszjH5b+sJba/OTBBTJ8b/fltfL1WhMD+MouvHEjSWI0IwimMK6ksQQc
         Xynhr4iVlbJf2z/2bJSQ//Wjezpq3aQFVuIyI5FQLyWnO8S2klzoSf+rJBHkU7OCmJoL
         M/7Cj/+7Zm2/6Hkh16k25sgwgEjMKgaax/qxY0OBjEi5UGAbYQBuvIdD31xdgX6aPUeX
         VDjY/zTK5Ue+SZjc6JOgddorNmKvysORptNDBUbJ3ecal68SGc+v+hWUWGsTEQu43N7t
         cB8w==
X-Forwarded-Encrypted: i=1; AHgh+Roy/w7k8vPR1PHjzrS41z5xRrcJz2fnycp6pTWYJ+dGkneuUVLD+RDLltBuEhURVAKsQP0ripKaSuck@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNYNlsZ0B/7687Q6Qc0dFJI4A6+uJntqlD+Ie96ivlAkL8/sD
	LSIe6ZmGpvS1S0nk+LI655wSSMkSY+qHs/xscSH1LsUe7r72Pwz9N6kSqrg+kR8JpLo=
X-Gm-Gg: AR+sD10i7tfVm0oM0lHJV+GZ+cOiz2glBW9KNqqcwWjFEoshTLhEI7/HVxfhrl5+n1D
	AGcs/CDDjoamrUhjr13OApOa1B4wjs55NPMv9M3N8f4vqCOPn3Yp/LWbu3EbzMoe4htLGDDJYyq
	XRi8Oil7s4/vDlK4LHTj4ToBVLVRoo3jiO98/9LEVcdLJz0548o/5W8ZtZ4qasW/w/o7lRamhy9
	S5w8yUuRMG+pekkpkgfpP4CWqTz14v7CDaFWNcg9hqHCiYnSJrRPU58TD/0Ad2zTTk1nsZD/Lak
	nFyjH71Oe39XFoSJMPF9VV3MkYM+zudqntJNlUepkZkohk3A4WQdUNBFDl5ey2OHYj9DXNjZ1gG
	zLMW+qD3eAmWn+xOJOGU47hE4XR+BqWNhX+wbPzIAl3Q2A2jWrUx5IKsaBk8WbtNjUnqoLFeLxK
	S7P8MmePbnOahVtHA3zSgCTDA=
X-Received: by 2002:a05:6000:1a8d:b0:475:f0f0:9ec9 with SMTP id ffacd0b85a97d-47fb1ec0c51mr1747934f8f.52.1785228815750;
        Tue, 28 Jul 2026 01:53:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56430085f8f.8.2026.07.28.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:53:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:53:31 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8x50-next-hdk-i2s-v1-4-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ick+WWmqmCUpFTYEqKwHZN904kzdEs6qmaxRqBbcHEY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaG4L0aF41ucrfMTV7lL23mI4XS1RNvwg3oB2Hkr8
 yMHkglGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhuCwAKCRB33NvayMhJ0QM7D/
 9TkoCEEQ0PoGLYnI+hfCt2Tc/EhPFMy8dgiYz2V3HhQwBdr955i+aDNn2Z59yGKhOUM49EUoYbW9HX
 j/qxXTm4CE4KUZDG7AvlQFz0yom7I3yQ51yL3bsZuuDWrlGba5nBnq2dScjaH800NKYTiAJFLpRXQF
 PFb/cmvh+kF+v2a8YGlllo/4iMI9yaT4eyBtPZDNduMeO71DCbiXUa7BQuRI9t7DobDZzqg0Oet7eS
 qQF9QS1VHhMUw9uXmrGTyWv+XbZrwY7NZsBSd10P7RwR8D3Naipc73Fv31PbYNqENVROQnV7evww5R
 fuXQ1px4fzQgOA5Rt2sCCgINnx++vAnglnWqHhIktaoWogEywbGF1Mx3GqPfyrwrMX/9R+xiuLkA5u
 Xmc9CFsQsAkZ+Q4Za/HPnarHYNY/rIgvE9HO7Q9n6e2EOfh++BQ0Yloic4JO+t8E+SvC7918n7bwft
 D7rkm35jb3ODR4ScboaRLlUqjor6l+yqfu+P/K5n34EHx168Mr7w9pyGqWRmpHmZ5jgCV9SfJAk9Ub
 hiOAJ4z+7SGpUVT7EAPmk1+ivjheu6C6eVxCtRXYyyOWygx4ndffBazjjqc+7CHwJqJYZC7kuu7uCY
 Ba6FH+hbEcYvkfA2OlNM65g/arQiLXdJxQcrAB/BR5abbV5JM8FLjn3rcjkw==
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
index eabc828c05b4..69327c4857e1 100644
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
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk",
+			      "bclk";
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

