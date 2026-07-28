Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962B41A500
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228817; cv=none; b=LMBAzUmA1ajxiPOtwXQtnSuvY+TUZDRQZzlb9bAvMF6ubrCtYwcS9zecg70kjWhfn5K0bBtaEmKURxmdUDV2578atwgY3HynMf83KpfYmkXV9ZrOh86duW5sbz8rFzTLTdhSa3OktYx8aUq7rBKAHnEu1KNOYjlPooxfrH2ChuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228817; c=relaxed/simple;
	bh=ydJ1ImWK3pOuMPBDZGfeArFU0n9lwHaMq+8lsYHy1ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aK13xT8jekYxgPpsrtlJD+y7QiANK1iZ8BYPT4pakppbArFMvefRbM2PS+DegtLBujEbeHzXccnvctWN66KJI6Lo0d24SI4C/53DFqnxZlC9XVahdz95s34UGy6oT81c0OJLxCT/4s5fjE7jLutnZ1/aLHH8eQbhZOxPujoU83Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kso4vUMY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kso4vUMY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2598902f8f.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228814; x=1785833614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+m3ZorXt8/t+IsxXBxyaK3AkfKx2jZSAwYAvb53/FI=;
        b=kso4vUMYbz3EmHWTdzoLoTBwKgjdNGe0pqaUUrhJBBwW+0JAwz/r7mULLw38v52rMt
         l3lUIy9m6UaY8snySN6hENpi+24lRKQl+yjhpUUN5H+CzWzXtmifaCpajVaf2IHGJO5V
         EzThek53CtfbW7xZ42U75E7PAf02qGP88MvsZggXZDzHuvDO8fd/KrQQFiffEKWTtTqd
         fpqa12MU7sS7BBZ4g7EPrHP6G642349m6uOga73Bo2iovwkj9VeVRB+LGEQc2GzLSgB7
         TXjBjzxsV0h8n5Q+j4rE0kULSxkrSrroydijFXtP9zuEVD9txJG2HUoF6p1ceO/y5kUo
         X5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228814; x=1785833614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+m3ZorXt8/t+IsxXBxyaK3AkfKx2jZSAwYAvb53/FI=;
        b=H7KikkPAWtUXMT/2kgwlQ738YC2p6aAdJo0EMe1FzKYfhTbELSpiuRkmjnvTBTbj3Z
         JnObz8yl2Yo0bjyrvhzSwlge0lvymzdgIKKTLzOe7C/DYVC2ru6UfpNJCIjTjRO1Syr4
         OJDDd0jSibiguVulo2IezFpO0B4BHXspwTSs2nhgTgcWOOFqFF0i3U2VCl6b1/eqtjv5
         Q0IvpOuVdLesq4JRVgM8P5c137uxsCYsBpUxASuEZhTrqEEfp34rmei1/soCJnu/M9Bf
         Vf724pBdU0iffkxlBfhUyI/30PTerL+1n4j1CNMbAhb7/oYqjKIz0NUN0utSnEe4yOKm
         EbCg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/4AJ5jTdasIIqr0gpmPHbIXzraY6V/z8qpFFT0RVv+QphIWNBeqci/Rqmj4K9SRHcKbx4TOXYOXGE@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPGOp0qVUqXHZCa5kDP0H7j3NP+9kXNJfBwxgTsME5FjQQllT
	9ahXVCxxXWqs4ciARv4Gho3jKeCNZoSKs3/bAhUH9bnu8pMGgcWHpn1OyxPY02cTcS8=
X-Gm-Gg: AR+sD13yjDWfHzExlPg3N2aNBUkVLTVxseEyh/gCoeKatGHobyMMSxksTV5Ybe9H+Vo
	Yg3v5ZhZQHZ8jHDLaY9ZgCIBdgQzQKXwbco601hbjve7NEWHl0Cw7mJMh7ezJIBttXFu9jAswXI
	m2jGD4buRlbf5K+XXJqYmo8BLjCOoGmqHrsWZMYTxaVCOKPAlXZI3Omg25RP+SQfw2WqQozNQ0n
	mNSTVo8gcdbIjBORqKyysYhhCOzYigJ7PQxmgzhJdc81XxvvKbyHdX/9USfO2HXpLLdVRXjqDzo
	ROuPErTCIdEO2R6N1+4PRKrF3SQeeHmLM6Zl5lzt8AV8y/x0YDU1hH7Mi1M32VfvtOEAYssBxhK
	mw8PVKxiNkiH1QA9z4dwifmcuy5SF6wBkYzSicfK7aUn1Ynx0YkQbzCojda9MqLxU/lfgN+Imeh
	P4PBzK02YdICUhBYS3D5TxbS0=
X-Received: by 2002:a05:6000:2085:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-47fb1ecdfd7mr1573209f8f.29.1785228813987;
        Tue, 28 Jul 2026 01:53:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56430085f8f.8.2026.07.28.01.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:53:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:53:29 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8x50-next-hdk-i2s-v1-2-2393a0fe4aa9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ydJ1ImWK3pOuMPBDZGfeArFU0n9lwHaMq+8lsYHy1ao=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaG4KT40jlUSm3m7wSGjHKRHVoBEZFiG8b9ZEmnJv
 wLOsQYSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhuCgAKCRB33NvayMhJ0UT2D/
 4tGwOWHkbSLeYAA2xdnLS+f/vAYx4eYwgfsg2P8kkrjBaK7TTHr2icA2n0NRyvQlKwqGetlJDUyKLM
 gVHHVCZhdLXbD2YrKpdf3MXg7K4RLwn7bVrobV3qYeXG5AJTdclUH7GQ9wLIlU8uFLyXsRtwbo70gZ
 tQ6HDLN/LpsUnptIT2UOw1TnyNRWvuiAvaEgzvVnFIgHMFNC7KODjBbYWCeMZ1zr+l6yxKkOKpcZV2
 J54ZWA3VQTvoftMqvK4cGin93JV9QCpTs84Bf+DJIgrb7I2Qvr/wrCLGOeTe8eMEmabti7WhGBHGPh
 VppBT+OlG2h14UkObckVHXYN32Bnw/iGYlcdz/nNVhygJPm9DSq9YtjBXRxMknUCADeOFIHqQGoP8L
 9n82Vglq8+sstwKW01xxI1SPHuabjPDEYBt1iQGVi5s5S2zqpakNm6es5pv0dnfXocyJdyp4bf/Ssn
 UYOM2/c89bhfz73i5PLEA3MuwBRw563JGiJXVheapFS8AJGGS+rL89VPFUpI/8EbmXy8J12DJ17npE
 /KPZX1d+vI8gZq7Hh8ienP6mbnvMrzSjU/nadBK/BherB2r0nLnD9UxUN8X5vQEV7vvq/f5dqb+pIM
 xKabT2Qdtj9MRInNQv9jQVYtvA5B2vVj95y+vK9R5vKTUUjEYFe1npqxx/pw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index b37998cd9a2c..6a6d8346046b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
 		vcc-supply = <&lt9611_3v3>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
+
+		#sound-dai-cells = <1>;
 
 		ports {
 			#address-cells = <1>;
@@ -947,6 +952,19 @@ channel@44b {
 	};
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
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
@@ -1079,6 +1097,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..879019d48063 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4313,6 +4313,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1

