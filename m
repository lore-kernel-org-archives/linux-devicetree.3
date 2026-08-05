Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69993E3DBE
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916118; cv=none; b=fATLIl1+aQLmfpedeHt6NqJS3nONp1/shuQifNQSYt7ujsrLe8Ha9ujevjqvbJLLE1zRyz6hBhdTA0/I/uExMmHLCgEplSD0hg4nHnX7yAlL2eL8yF7KY2dhselIEhgO86FRNNHw+1+oYGIcEuqEkFrEZxarVTGqZpeRYD2+32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916118; c=relaxed/simple;
	bh=M6qIODsCdMC/k36UYMJff866rnazmYTgUJRHTsGaUq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFUL1sU+eIqEWzFAivGJgB+P1fwEJmcxwT+s2W/6GQ68nuRTrZxK5P7k8IFekAPIex1XDlF0xfqmKrCwPQSPgOezx4/DndcY7k+kfuQdC7PHb/lUCwzfPJZswsgUQtQDzDacym+6yjyJoZBSphA6dq5zDZIYzAy9CujFOvivApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBWdneqY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBWdneqY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49802c418b5so5997065e9.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916115; x=1786520915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=vBWdneqYB583EnCSkkmPpq9rDQfqSpnRO46xc8xYMTBpvxEm89j/ucTvYiAZMa4V8B
         o6QXDzAEaVd17PEZxPTk21g7eck+ItbLCbmGwYHoZD8TwmyMTsfqZC09qn9M+gmdIRCr
         mqkZPSr4dVytOXkdVOoDVNS4v6P+6n4U9CLyPbX8A6wV5ZrGd5aBqKqd8RR2xTCmb3fs
         8DtVwVtUhmMwei4eahpI+meKbQoS2RDSDlcvmUFkwqt1aVFjLA2FBLR0guk7DfcrIYWU
         LiWRv2FLJ1dWLrFLQnTzkaHG2XQxsBsfjXkhVCmPX95dyMShaVzHxrSde23V5ppXJp+T
         FPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916115; x=1786520915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=O133jg4k0a6ACupwv8QpBJurf12tXrGtzoM36INmg1RYdKIpXa75UhwMAr9vx7BfF3
         G3WNznP/uNmwdiTmoz/+1GTWPH9x82JYTsqiHiDykM3XppNVLn1G5CHjptUcvRFJ79Jx
         Z2h7Ef2pPRE2Ov7lhuKXh2WNA/AewfoHGcR4SlWQaQNCYNFMgAxGyKOzVMv7+xZd1gk/
         swmYkJ9zccxbJfCqg420vzCE5ZZW/VdStvHXSyVa/703rC5aponQMpr8diQVoSc6FqbC
         HgvHHuNd/RC5Ps/UEi5bFWv7Wa/r5UbEoOZIwbLNBq884twI14sH4MWgHZzbYFTU2Gav
         Ivlg==
X-Forwarded-Encrypted: i=1; AHgh+RpRTmdodCq9MSjtvljdHcU3fiOSNNimL+QlpH2j16Ik87vMDkMcrWSuN7q/68nQkJYf6YVH+aQ/OztB@vger.kernel.org
X-Gm-Message-State: AOJu0Yywden2b0ael0C8z+b90+9JmSkqE+luDA/iNR8lmvIbsMNF/gmk
	B3fefULbuTlDSImQENTA/8BT6XXpk3ONGtIx2S77GYrSugr0ptnht7AF0V7+O8kb4xY=
X-Gm-Gg: AR+sD11G9Gfsz+MXwH784hntO/S/ZRop5LK2odnPlZnOZOH8umBmj8xx8SkfJx2M7Pf
	lmwIGydRJxDFqsHmHKJQObsDgahGkm4CCNRgGtKad9Qxu8dSdor6xKuWu+u+Mw7yw20aruqWlLI
	azd4YDz7QXcV7/7b9szJqpSKDG2MOyg14SuSFiNxhFO7FAX2McFlLTwZC7uCL3lq0Xwp/OGA1w4
	uWsE13hyneCdVIvzUCJfWFqJ4oIOdW9ef8RTKEJHwAthNzkJubSq5aVKgzc7F6/8//xfy9W5us4
	1xO4VVD9qWbKQ4OUQ0K154zzTSVPL2Uvc0fjPlyTL8olzfsRuRZwRO4LFV0OnJNHjiQBJqlKfiv
	weed78LIyu+TTisxwWuJjYkdG50GKBBDECmitZR72nIVdlO97C2I0SnuojCDpyG70WOL+auEG2h
	no1QRvMd/iEMQ3iCCmO7dw6oispF1rahOo1gnsP3WZ75VwbZF6wRQ/6WDn1K6vQh00TlvW+kC2G
	UbSJhMeRg==
X-Received: by 2002:a05:600d:8489:10b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4994e7c5e9bmr43271275e9.14.1785916114954;
        Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Aug 2026 09:48:30 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-2-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=M6qIODsCdMC/k36UYMJff866rnazmYTgUJRHTsGaUq0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurPLx2UN6UxZQ5YEXu8y1FmrtKuWhgncG+qPgs6
 ZySUUiCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLqzwAKCRB33NvayMhJ0QdPD/
 4kU/i5APP3Ci/pNgJos4TbRS7SYoC+0Dk0Ou2NC2kODS6x85DBy/0zKSlpaHY84/IsZrpe+I/PcKTq
 0d2zmD8r2oVkCRt+b0O/POLWjeOiLodp/jbHWXfVwY9a0IbeZHtkKuFlCgnPK8OtE/PpGGv+ievB2l
 pq7SXT8NvEluo9upgUSVpl+tWNWbgvYVC4yvDSIrawnUZG+vr1jTLposjRWpjOrP6SqsojiI3pAxj0
 lo5zxtb0R8UiaInx2PWA5dVmay7q+av0PO3SAGBW2uVji6Z9GQRkOd8+9ltw7EboJOhKwepL8+0fOp
 F+6aTlSCUpeW9/TaFxnlYR9K38l9F70eX+BmuaWRxQeJO9dzktU9m4yXA/sXJTBeAlXgeKKQHS83e5
 a0BdzV/ANS+MUS/i7RVq0b3u2hY/exrCM+kQJeQyhVaaMzRpJ/GD/7o8ROdDb4jOB0ExvB1ScHhJoP
 McGJ9MbndnlPyBR6uKc8TJG7NDaXJ2QIV/rdNOKZpPydrFYSP+hxHAlxTl2+8dDcccQWb+IlS2SvfB
 UsAR6yzb37Jr3ER3rZn3XrG6aLWpcupQGKyN0GLQv9e66nOHJrcQADe+f7r2nkl1S8mmpZLPGVBOZV
 PEiMBg8CQ2abAOLTbL9uUZOKExvwDVngANgysjMjukdAB0zQbLjOkEtrL9pQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..ff3e74c8a1c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -278,6 +278,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		prim-mi2s-dai-link {
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
 
 	wcn7850-pmu {
@@ -888,9 +904,14 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
+		#sound-dai-cells = <1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1144,6 +1165,19 @@ pmk8550_sleep_clk: sleep-clk-state {
 	};
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
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 396201905ef2..5a2f88614cbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5526,6 +5526,79 @@ data-pins {
 					drive-strength = <10>;
 				};
 			};
+
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
+			audio_mclk1_default_state: audio-mclk1-default-state {
+				pins = "gpio124";
+				function = "audio_ext_mclk1";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s1_default_state: i2s1-default-state {
+				sck-pins {
+					pins = "gpio121";
+					function = "i2s1_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio122";
+					function = "i2s1_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio123";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		sram@14680000 {

-- 
2.34.1

