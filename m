Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31D389E17
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919502; cv=none; b=L3vCM+Y2PQZPCNePodPG7wy+I0a8NsMGQjEWXAWGQjv76rpXv08un2XBkGWB2Hd5YAT1k7cp/AZxUkvFaBcS/bHVabkmGm4yIRLdtclstMgGFJ8Qib7LRxuMpKAvuAf5jhhP+nFIdp1SXrPCs1L9rMjOb+l3m+7GlKlhLMTYzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919502; c=relaxed/simple;
	bh=G0Gm8t6IneiVYTkTeSCPBc6CjJqlMmdql/bqJBW4d+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDTOCHc5uOUMYshg9FxpZFRHKDMd+zZ20QLKIq12cSX/G1lGNtvamqi874wLAWPoVEfWXPZg3FyctLuwsDmoZXB2JFa9la/E0kgf80cuzbbspT3NtYqjxwzilF9WZDQ4nWApsjOZg1jJ40sIle5q6jQCP+6UodW8UU5VwIPs67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=IGN0mRVV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="IGN0mRVV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a041eae5so21104005e9.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919493; x=1776524293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=IGN0mRVV0NbUpCm4Ml5wCTsrjPdXouj0BjERPHLM+P7Lp7CbskHfqRYgUhE8AFAY69
         6W7ONTzFoml1i9t8o6APMvTuKJbfPwDCMlhf+vRQCIgLYr1c25fBp20Jmp4prSEM3ps/
         4oGrSCuO5t5nyZk8UX3H+1EpMo9rW6vzrbr2gusPmiAm893XWItgPE8sSAb41qKGonFo
         +uTP31sqntwcAMkbL79+G79EKcIDbcK5gD99We14iqS2rNf9SGtiEks/Y52L5EX4R83h
         4OCorpuK13a4sj6nEOv0r71wc0iJoMBuzAVMTo/nJ0vqfR0uEehxJ3tz8gCqB6jKIxMp
         axtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919493; x=1776524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=jJaPJxesY1ONq5vZ8D9LvFbNzUZlu6a641/dO5b5XhjlqSbLaVeGJrlqs7o+quTb/7
         Mr8OUef19qC4ujGojs0YzT0tM1HgKT6q5eS5fSaZ/JCU9pLq997XzjzHn6pl4J3AAnJo
         Hj17rsewFaiymi8zjblyLMYKjGX98CGzJNyWjbqXfJZ1f2ICdYZt9pooSXjYOMx0BzXY
         KCXKb16Yf9BFqre5587X9oP2WJI4CgCW4LPoOGKfUWQyR7cI9EKGAJEE2lwxRHJ+5x4k
         pFHPvim0ZZvKIlUMDXNpSL3hGrihkowwFz0rVotZ7hheXIlCJCYcxIZlBj5ZMIRgmCPE
         emAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjeChIQfnp9HJz8tRpvnptH+g24TPB35Q9+O9R0JiQCeRmU4mdtygDEabb/vWEje9PEe7u9mE+sfvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOZu9M8RhmLes78FOFdGIH84BF2YjyhALIC1ThOK5V4Jk3M7y
	mIT776fhLxohr0+lftiqqgeRUE/dypJ2apwcPpnE7m2JtBrjnTwTFPiFjmuH21bzSrM=
X-Gm-Gg: AeBDietlefbyXw9kvUIBAzwnmF5VKktazfKtvX9DyB1EmACHVlJyRcfp6xCqZrdowGi
	nPfh6lOIUhqUjbqek0ZF/sn1TQ/qSTR5t4UZ6MiyvVgg+6ZWxnqrDY6P6QkVDfgP3cPvqm2Pfha
	R3nVuD/hpAdV7ypwA/DRbw/qNJwCFUCInCtsbMvOpHxNiXYHCRhyCycohU926TG3O4APFbQcWjr
	0+vvT9jRAQw6WnVC/l6H9TMbIraQcqtI1/OFcnnuWQepdIufJ8xNp/4r3xVLBB9xp3dsKyoFIXC
	tLccs8BKALPCuOeMnIhR1Oa6Bv/ZZcsoICOLHlsVfrSbF8A4wOwEMzhdtp/pcn8PrL5WAATkL/m
	WYMX/4j/K1dvyHdyBeYuiMivRHYDPIN8v+tZjyPzypZiuWWQESXbi9QpqfnYpPy+tm20i5fXn23
	9FpWln5AXbLgA7O7OfbNrS
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr90911785e9.6.1775919492745;
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:36 +0200
Subject: [PATCH RFC v2 11/11] arm64: dts: amlogic: odroid-c2: add support
 for I2S audio input
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-11-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=G0Gm8t6IneiVYTkTeSCPBc6CjJqlMmdql/bqJBW4d+4=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkvqxVwT5VamJ1TGemSZrpGo//vDKYVhXsDtaT9/n
 d2a1vCyo5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABOZtYXhv3uboq/N4frukMUf
 t4nU8UmbXFJtuSO040y/Yqmh6CY3I4Z/mocXTZBzknidk319x109g85X2gJL3tnpVhtHXvs7SYC
 dDQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

- Enable AUDIN I2S decoder and all FIFO components;
- Add AUDIN I2S Decoder as AUX device to the GX sound card;
- Add AUDIN Capture frontend DAIs in the GX sound card;
- Add I2S input data routing to the GX sound card.

Note: in the routing part, usage of "AIU I2S Encoder Capture" as source
for "AUDIN I2S Decoder IN" is fine (despite the Encoder/Decoder mismatch).
This belong to the fact that the interface is implemented by "AIU I2S
Encoder", which was already existing (and named) before the AUDIN addition.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810678edc81fe1a8e3eeae69786e27010c..54798e5b631fdc594cabc5876ab73a3a85944ab0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -188,6 +188,12 @@ sound {
 				       <270950400>,
 				       <393216000>;
 
+		audio-aux-devs = <&audin_decoder_i2s>;
+		audio-routing = "AUDIN I2S Decoder IN", "AIU I2S Encoder Capture",
+				"AUDIN FIFO0 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO1 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO2 I2S IN", "AUDIN I2S Decoder OUT";
+
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
 		};
@@ -209,6 +215,18 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin_fifo0>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&audin_fifo1>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&audin_fifo2>;
+		};
 	};
 };
 
@@ -216,6 +234,22 @@ &aiu {
 	status = "okay";
 };
 
+&audin_decoder_i2s {
+	status = "okay";
+};
+
+&audin_fifo0 {
+	status = "okay";
+};
+
+&audin_fifo1 {
+	status = "okay";
+};
+
+&audin_fifo2 {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;

-- 
2.39.5

