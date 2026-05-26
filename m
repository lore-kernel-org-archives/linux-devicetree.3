Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D9E30C16F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809412; cv=none; b=HPGrq6WJRxk7z9YRwvwG/IKR4KBwmLqwkrmqpxCqozfBEDAnwEKKxXyPCzvffietAyLThsVBBjPV6RNC9GBuGF2xDB47BKsckgE6O0WasvWWi1v/y8xcw24y0lJQD9u1+vx7D3ziDqMiB8CAER983Xv/HetMzjufICzkVmCHkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809412; c=relaxed/simple;
	bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oif7XmEtiuvVEk1hUih0fcYrv4eHw8sYieOJXTFnkj4LznoCOTTsOeEFewTDW/RLmsyDm6nZc4Gw0ME7WLGoowVokbk7vh9JJM809AApxorOzeKSzr7FbvcoX3s7APqXpq2ukUGw+Xosse3privX6V1gXjNZFgXxiORsC818FhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBPwvYY2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBPwvYY2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d734223e4so6804442f8f.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809405; x=1780414205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=hBPwvYY21w+3Kqj6/ns1M1Bz8PM2RUgx7L7AYPv27bqP5n1nxUYeYDr/GMP0QRLbAf
         /oB1excYIvSTwEFzycoE7gZ+uLZGSXkkxOhGEWlr1sj4evau5S/eoRUD15kXeLsmIAVQ
         /zThqbCBEgDtQOOFf+0AgUdzbNQ32pqguAi9De/6KVbLz/smPVETiEc7DbZznDd00EJX
         VPxfgWpQcrYI5ge9K5t+GMt/vKxS9x1UcJk4kvJYgQ9PanShUFU5df5yH6XHRRj6/U/g
         qjYJstEgM/HgP8W2BsiQrssQM7ptx9sdbLoeNbr8gFV5tMLf35TlMgkSwFl0ZwmFqjeE
         JbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809405; x=1780414205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=qMekbmXJD7rQZaSaV0v75VjcYeYtS5339XgVrxn9CtOKCre4YCiTc4m+HgQdZzAQM1
         soynwRNOFXTr4S7xt0DCxSszNNH+5GNWhUciUrGxxYXL6aB7H7RWMjMsKyATdeGve+Xl
         OqvSByE37QAQgTlOwiG0QxXHLiOp4SjCjAN0W917I6CovLc7xo1t+HPk2K795DzS7+9g
         59gY2mGwlnzwJGLD8br9Sq9SrTujwdX4jeOP2Ylwl/RDMSuvye3VT2kbt2aRKOaaZeDd
         mOQbQSj/FINc13JAG4lDu5K1mUTGhnOxqw/+6XaBPkCs2dG2AkcunICTqMcrOmQ1ccBz
         r/5Q==
X-Forwarded-Encrypted: i=1; AFNElJ90RB4hx9kQl07zfb9WdahUr4SyLGZI+XK3CQ5BPas+uGuWUC0xRWX2dRKoWebgMuBAVipRsKU1MrmO@vger.kernel.org
X-Gm-Message-State: AOJu0YylKpNHtMmp7KxmqBSc79Fhf4mzsviFVnyD+/PgnlAfXF9URUwU
	jOLiu/bAgm9Kf/8MUFWtd7hvHQUCbG9+pYi9sv7rKuIprJMMueys1/EZ4Tvt03DNxtE=
X-Gm-Gg: Acq92OEU62PS2IoXFJYgZP8DV4+4UA+9MmDWbGGCM6QmcusNsXR850rxev8PqeGqWcW
	aHyqDoimGoS/DmUr0AxBpxkcYu19fHxcuNyNwfxtxMZ/DSomz2QFleQapDqMHCVlBJ0TUvin1je
	AIrmKVZQH+aWyzT7jf1qn5XggCbSn+2/t9GwMTPDdL3wZkCiQublWG3u3c8ZS+BenBHEBC46Q53
	b8gzwCUwxU1KsVZiKJoUJmdIydRwm+3K9SEX/ErBEf+MiGAnVSnv7kYz/3kSsBkdq0gho0uoELC
	DACpsNzB6Q3hhL+2NXA+i6B3V6wMl15OyeuSa+zlHAh+9mVEWLxpJOAW1xtNjXxlHOh1vKVRX4G
	INDdDCNSRHjanihQ8MhmxDXpXjc3BJfnxB/j+zca4CL8gbTpC/8EA+7P2+rQomLu18zhDYR16LO
	Ghj9lTfd2D3TSutJ1HkwjGxx7seoUZ4rIA
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr27242005f8f.4.1779809404418;
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:55 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: kodiak: Fix up LPASS TX macro
 v9.4 control names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=6900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
 b=opyYbtZw6SUYmPrNcW3j6K1y7j4lAENYIJUfh4vzihODYxclG05oeO/6oBQLoTDqVlE9HaKJ9
 IcoBrff4BUpBMVnr8RGjImnxyVwIin1ve76FvwVv21237CSdGbl8J7L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

After fixing to the lpass-tx-macro driver to use the correct v9.4
configuration, some control names have changed and therefore need to be
updated.

* "TX SWR_ADC" 0-3 becomes "TX SWR_INPUT" 0-3
* "TX SWR_DMIC" 0-7 becomes "TX SWR_INPUT" 4-11

Update all usages in dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..565f7db91e77 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -860,7 +860,7 @@ &sound {
 			"TX DMIC0", "MIC BIAS1",
 			"TX DMIC1", "MIC BIAS2",
 			"TX DMIC2", "MIC BIAS3",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
 			"VA DMIC0", "VA MIC BIAS3",
 			"VA DMIC1", "VA MIC BIAS3",
 			"VA DMIC2", "VA MIC BIAS1",
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..a36bd6120ea2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -736,7 +736,7 @@ &sound {
 	audio-routing = "IN1_HPHL", "HPHL_OUT",
 			"IN2_HPHR", "HPHR_OUT",
 			"AMIC2", "MIC BIAS2",
-			"TX SWR_ADC1", "ADC2_OUTPUT";
+			"TX SWR_INPUT1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index c2cba9d7179b..ffe028bd0c72 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -101,17 +101,17 @@ &sound {
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
 		"VA DMIC3", "MIC BIAS3",
-		"TX SWR_ADC0", "ADC1_OUTPUT",
-		"TX SWR_ADC1", "ADC2_OUTPUT",
-		"TX SWR_ADC2", "ADC3_OUTPUT",
-		"TX SWR_DMIC0", "DMIC1_OUTPUT",
-		"TX SWR_DMIC1", "DMIC2_OUTPUT",
-		"TX SWR_DMIC2", "DMIC3_OUTPUT",
-		"TX SWR_DMIC3", "DMIC4_OUTPUT",
-		"TX SWR_DMIC4", "DMIC5_OUTPUT",
-		"TX SWR_DMIC5", "DMIC6_OUTPUT",
-		"TX SWR_DMIC6", "DMIC7_OUTPUT",
-		"TX SWR_DMIC7", "DMIC8_OUTPUT";
+		"TX SWR_INPUT0", "ADC1_OUTPUT",
+		"TX SWR_INPUT1", "ADC2_OUTPUT",
+		"TX SWR_INPUT2", "ADC3_OUTPUT",
+		"TX SWR_INPUT4", "DMIC1_OUTPUT",
+		"TX SWR_INPUT5", "DMIC2_OUTPUT",
+		"TX SWR_INPUT6", "DMIC3_OUTPUT",
+		"TX SWR_INPUT7", "DMIC4_OUTPUT",
+		"TX SWR_INPUT8", "DMIC5_OUTPUT",
+		"TX SWR_INPUT9", "DMIC6_OUTPUT",
+		"TX SWR_INPUT10", "DMIC7_OUTPUT",
+		"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
 
 &wcd9385 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index ce48e4cda170..bc492346f7dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -20,17 +20,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
 			"VA DMIC3", "MIC BIAS3",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
index b25df5a99161..c6606b1eb71c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
@@ -23,15 +23,15 @@ &sound {
 			"VA DMIC1", "vdd-micb",
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..e54379147d2b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -101,17 +101,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS3",
 			"VA DMIC2", "MIC BIAS1",
 			"VA DMIC3", "MIC BIAS1",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.54.0

