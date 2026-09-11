Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08B3D16E9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164921; cv=none; b=Hahrsj4wyjQgpSb6Y6uWmawye2U61HJZ9iKVOdg/ogLdxA+WaoI+vhFGBdlldSrMkAlSRy62XhjT/2a8xUv5+9R45L1HdTJlfb3duQD/C/R4uzLr0R25bFxsSoU/gI2OmmbxYCno8erM3gi8cn0PJd8HbH9PJCWbeSiEkW8X52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164921; c=relaxed/simple;
	bh=6fSYtC/gN4yRWzT4VG1S6kcjUzyFoAinugRVvinR+3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6jPzk435p1afpN0um4uNIuuZrmgupFiCJLNjR4MjroWqHpo0lfFKAr0viDyIue7Q/El3DP7fEtfV0T0y4JNAlIvedeybx/ul46OWHWjCUpUnCQ9KyqqtL5OFE4t+mX7wE2q5HyH0hxksw3/uA+Wiz8g927PAWxWpC0eye5EOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hddZX7hU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hddZX7hU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13775135e9.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164916; x=1789769716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=hddZX7hUF9gK1HAIwHirXeFIjnRj1irSeC76L823kJrpqLJy4ti08H/TXPDbdSQhBH
         xaJ2AcmEw5afa9j50xWGS1qO4kZlMUnftn4uPW/Jsbezk1SiOLyAUdTIN5gsmIBn+FrM
         HnpYQWIW9kEFxWsjf0nazBwEjlGBRJoxvHprpYwjWCySz7QWEkku84Ib7mgu0nVPDJCa
         pn+XqwMdezkIrXhD6dujsbSzVhfcM9PKw+8zAUxkGU3P7v9jFcI3dgNkQHL+Vh3J3P9g
         2y1nRtAnYLtydquapcalWi7KPAMLZU9SbWhkATAnIC1TTF7OfE4xrJr9Cd9rfRQ8VITn
         Iu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164916; x=1789769716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=EObFwyTXsHC8hvVis7cu2dvNEi8dsA7f6chA/aCidT+4shjk1FFUUmjRPxKuTkTAMI
         QdaDCLknN7BSzIQFmgIJNi0WXS+kVNAqcEZRij4clzh1Bu8xlKhVV22GxB1MM8nVZVex
         6K6KTy/l7E5NmnP8/s3uJV2QW0+UquOellCmKy+Q8nrBFcdjH3PegVH4VflT8KgF/4cB
         +EtOzd/Jx91KMDH1qI3OGmpGQAInu0Jqvy8V8GL/LCRmQBmVvEMbdwfReb10eC6v1USn
         Wi0/w1CBBJzlGgFz0pHq5s5gNI5Wx3/vFB6O3bir1TXEDoVXaXO3BC67wsbXGBQnt4R4
         aRdA==
X-Forwarded-Encrypted: i=1; AKwUvBw4TK1NvDhnPedfjb9etf/SXNrA+XIA44BRF8NpH8mrquJxpHledMaHDaZHrfdrZ0h4lXX+YAqvLJLN@vger.kernel.org
X-Gm-Message-State: AFuF++m8uxXCAAz0mVxn6lY/GdAVm+s6YF27yT4lzYpNwPzJi9d5M63j
	i7EoyuIGjiUkrSqTpAGNxs7m5AV/y3El9CT3jxRP5/zeU7ytByUY1tnLp1BiGm121XU=
X-Gm-Gg: AYBFou1X12ugIzPadTjdh8vd0dBtKCLTzbY/CESYHogX2s9fxhPCIfWlynTr2os2kXW
	LXMRvqGfpDgHCHSQTrXFHuMVCtJ4NWX09CjFGY9/GYw0jRwttmk68J5KNAb/m+0892PklBYOOvB
	dXiyXNIjRerhUsqnuLD05luSlshDL2PERJXlp3K01xhAQlBNAr3nnNAj1rwIre1+VLws5t9OGFB
	GLyhUWf7v2KQCNpoZSro7l8lMQri1VlnmS1ZrK1cNa068IcQ90N6e7evciQb3Fciah4oAk7MHfc
	jGxnl+NPfNAGn+HwB02cmt0yyUEWHkLtzYxMZLj7LpFqNIMfYaNAHhQGul4rXSgQE+hBGVOneGJ
	4KCKcdFWN+6UG6tf19bi6+DHX7eI3IW1AkxeJntVMD1uweZ5O6YGwUuyb+5ASa3n8Y7nUSWwzSO
	2PqDTyzbEMGYdrHvuQ3n+L/T2XBBrli1feK9amB8/t4Qxwp42jP+gb5Fhe4btmXmSzaA==
X-Received: by 2002:a05:600c:34c2:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49e619d87ecmr78261575e9.27.1789164916192;
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:35 +0200
Subject: [PATCH 5/6] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-5-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6fSYtC/gN4yRWzT4VG1S6kcjUzyFoAinugRVvinR+3A=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPnF/HWmOcoLhLc2aG2y6DOYPfOConb106Fss1Z+
 2z95GubOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRReGMDNsvL96RqhvU1Piv
 1CHgfe2NXe9suU6fDf2gmDCh41u6z2JGhgk+6q2L/vmtyXV7mvuuaEL6yVSdTdcdDS9l+Rce9Jz
 +hB0A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also
"meson-gx-audin-fifo" with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..132d9771e2b3 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "meson-gx-audin-fifo", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

