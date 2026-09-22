Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B435476C1
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092897; cv=none; b=KW2lnu2x6FGVargt1ZFYjukDXp51qhE2zNk9U7lfLPZ1xzKqGe96Dh8FtTu4yJPua5HniiDX5VXCrWeKs2sNDgpCo/fYeOK4/jQ59NSKc07OXDnTJL+PjgES0569FZabZvxnWTAmA82mnMn9Rq0Esk79aWHPKvXJcBBWp/l+Ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092897; c=relaxed/simple;
	bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ce+NURAVlVlF7Da2ybn8foNXj00rFT6llZnWaeURVExTnxcqYQUW6gDmvrklxlx1sLpk2ma22sE8x5MxhG8BHsqpKrWz9k018V3ScM7GKr2MSZHiRoVgVX91+Xbd3VU+Nn8up5gOy72ASS6vX9VXlQ2v8KxefDUhYfZMR1Mp/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KDsmwuBi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KDsmwuBi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so64163f8f.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092894; x=1790697694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=KDsmwuBiybtrkSHYDHa7uTKsM3YTxOFLkzqLaGfWrjn42VlGrowqP2iv9Efe2TvG6P
         iGu5foLddZmfPftl79zvXx11rw5y+7HvR/hHjmklLWaRAk9W/Nson7hFaJISYtj99S1X
         vezeh+3DoH4btwo3I+RvowLcEA+BaW4bmifyhNGJqbQCnk6HlJekuHGoTzLrM1qY7TSb
         sx7cHfdIUtyXvHhKerkAl++udwA15HYeXXLm7OcZximJgaIyWtjpB+zfAR++t+DQNQa9
         5l5zVf+9oTyUbB5eLYlSesw6Gr9ZAfKpdx+F5ov4L3emdklA/1spTb0bjD2Q/hdS7tHf
         gyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092894; x=1790697694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=GuUc4PSOKbPcsXzlFjIEpxB0qKekxynIwF3QlKRHLZg931xKpcmm2D1KQLPt2tktG+
         55I1XORpVoFp4PI2wVZUpcuQDsYmDXlVnYP5jq0Vhvge3NqoEgJqytKJhsbOLHhkdEoH
         GDve0aQt9EYR51tKX0RjmRlZO0B+2P1RVIwRY0QV31aY0oP+vpTeC6SMV4ZwXUDabk34
         s0/FUgumMMPnawLR6o5zTGMj2tKDpR6XCaXbJWWXGBUTwcndCvwrkU08I3wiwvfIKutG
         BeXB0L2MXxhxDpDofOoRbFXfAr59138rdB8iIMvcy5C2/cLhWkUdUFpkVL+XnYNvfN8o
         +rYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVhW0Jh9iHudjPxKoxYwy7F9tW1XvQbo4xwYSfTsjs531cgaTU1DV2mFGi6m4EU/KmNSZnrpWrYLUR@vger.kernel.org
X-Gm-Message-State: AFuF++lxwgidGw16kfjStVR22B14/y1V3PmOmvoFpH/QC8miz1JxqtSl
	Sh3MxQObF4Fi1XBOA49gV+pVRI6BQec1KDnhnN4Y092MDAnO4n2ZuRaJerBsOybzSXM=
X-Gm-Gg: AYBFou2O15U9ta8ep4R4ocCJkeLJdqE6OlxQxyxbXlncVVP+x/JuO2ojm7cEJ+5q5ue
	ucqZXTJlaG5vW9ZeUPDl0+/zYSM2vfX2J0pXvdmwiZZbsH7ZsCmbaR/UYoCFhqbVagVaEQVN6ki
	+T7rRAQ71cytFkhJck88RmJQGL9+kwQ+slmiTau+R9s5vFkQjNbNhfo5yI/QMRC1F2TkJi+wyFH
	/PXm+y3tkwJBiooYoIPV9nlfHJOmxCLH3+P0YXfRL3/Yd/5HLLJneOaxitLqckZFpUwijIbjI8a
	7IOgI7C+O8SC+kGT5XtM9cAbln8Hxy/mE2MjBQStarpX1UT048CDQe0YyR6r8ectdifhgCfAvOR
	J5fSNyeQNwSup6f6zGN8fq0RfUJLiDwh0m0w6ZXMq5u8/TPX5hqOdIJrcDQ7k5idwNTNdM3BLuC
	XQtxen0wqc/kVzIz8eVxOclzjHyl5SvvPMpMxXogYlFv/ztre3h6fZhO++AKVf6wOqGg==
X-Received: by 2002:a5d:64e8:0:b0:487:40a:5ba8 with SMTP id ffacd0b85a97d-4886704c06dmr106703f8f.15.1790092893762;
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:47 +0200
Subject: [PATCH v3 2/7] ASoC: meson: build gx-formatter as a separate
 module
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-2-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkXNVTA3EJ5w5MTt/YvSv399+NWkRVpNtr1IsiIit
 nLNRN4pHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZhIUCzDf/+Ebz4WizZvNz/g
 d3y1Orf2Uy8bxc47Lg4GVSLnmz9oGDAyXJrMeTWn/N2ZoKyQWY+/RTXLn40+avp9zo2YTT7bTta
 9YgMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Instead of including it in 'snd-soc-meson-aiu', create a separate module
for it. This way it can be independently selected by either AIU or the
(upcoming) AUDIN.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig  | 5 +++++
 sound/soc/meson/Makefile | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..4c40bf60dc4e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -2,10 +2,15 @@
 menu "Amlogic"
 	depends on ARCH_MESON || (COMPILE_TEST && COMMON_CLK)
 
+config SND_MESON_GX_FORMATTER
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
+	select SND_MESON_GX_FORMATTER
 	imply SND_SOC_MESON_T9015
 	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
 	help
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..1b1fbe8a0458 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -4,12 +4,12 @@ snd-soc-meson-aiu-y := aiu.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
-snd-soc-meson-aiu-y += gx-formatter.o
 snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-gx-formatter-y := gx-formatter.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +29,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_GX_FORMATTER) += snd-soc-meson-gx-formatter.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o

-- 
2.47.3

