Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80133395ACE
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318725; cv=none; b=i0RP6hwUUipznk8z9qOeDuPwv378ZOHcHr8afuDEwYyWJ65nvAlCyfKDFTANEr/deg/+yEUJYeOkn3l6JumwIbn17OYoSBkl0eY40QAqQRHfH9cSOe4WDwDqnIdwpEWxDcQPqhHQlJxZjOwXNFUAcQXEbkczhe5s30CV/172dPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318725; c=relaxed/simple;
	bh=JbM2VE3IsOerKlOKNPqjWE7ND0hmDWEReikc0eKWCJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3c5oT07UmDpIqAc+jKUa9FyNfaykiGdoxFAbdHA93SSdbLuxX0nkyDmTkT3RhU7ODx5j38ewlK6XFbMfuPpKwObV+HfOC2WbRvYpDkKml0dxhD+bH41JuE74N9XmNVKbydkAtX7v0AkngezNaxOQsWa/LVOvVK9aRadga9M7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U262+0sG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U262+0sG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so8619255e9.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318721; x=1792923521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0GYKkf8XbyAZJHyQTcaoYxGjldhybLRAxAX/UufVP4=;
        b=U262+0sGl8B11GSJtGJTjxQtwaqF35xn88ASzVicc4Fc/rFlWEQCLrPrjPKuDbE+QT
         VP5VYKfVxIVc4KtNXk3nI9TLS5VV4GTgWPgzj2Uy0rkhjN+Omzu+foKIcyQeCE/RaDrw
         vLxR9ESTS3dUBpo9VjQPNSD9OhA55xb6F84mxxmNov3ps/OlHDZDom1nJwwh5nmndF4e
         oz01OBO9wiBZsolh6JhYVih0d8lZlirAer4mklxG4OAc12/+q6szPGFcIKQ1fRjyyAtH
         EFriWUPlyDf1qXNtqn6DvIOyxglYDraZVQCjJK6kz6Rar1WYT4DvdeAhJ6sZVOdIT7X3
         TRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318721; x=1792923521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0GYKkf8XbyAZJHyQTcaoYxGjldhybLRAxAX/UufVP4=;
        b=G6rpLHCdEbsEoOnNOu53Pv2ZK0c2GNIP3duflDfXKQv/pU2j+MCdBmrnAle3sa7u2/
         eFV0bnjRf1u3XJU5pF58P8aCygbcJGtxlQwq1zyon6B/tVwUXTTPw8ytwQw1c5Lk3S0o
         lQz+CWFRHIl4KU9oOjGfQXdqwAB15kof/ijfxmIzcEllmbGfmJraQ+ePCPvd5uWYmLaW
         WJtL3/SHDH3vBc68/mlYUMW0SPZMhGkUNCPuFV+Zo3jGCJjBWK6pgjFmzfaFEsF5oFZ+
         7wwh/eQ+HMx9wAB8KJnmBY4TQ3HJuo9cs4T2mGvYMvs/CNbSWkjHcfmgeM/X45wDU9DX
         ZEsg==
X-Forwarded-Encrypted: i=1; AKwUvBy7bxGDbtR7riFyZSwTNOcRh/1Ll1eZEIdb3Ue0H8ZO46FLrIv92i4THPUqhY3k0taLMs0RSTxQXIa0@vger.kernel.org
X-Gm-Message-State: AFq9FYJUITjx4aeqHey1aa6lrRMl2SuW/KrMOWtVSX0a8AcPusjTjSMg
	wECJl5PEP8xoNPIMWXgJgO+as+DWONdvwUfsEqeCTupOpdln21BG84xvSvQmz+glDIQ=
X-Gm-Gg: AYBFou0Zc8dcCbknGsb24DN68UIcHhBMjvVqJ/qvfw18oFULBhSLOOwL9FYezuj87ZZ
	S83nKfdVQ0FRBrZKwvePuEToVjrduzpYIGkTGEkZDygWP24CSvXpAfGDUer+8hkEjiZnYJBZ07r
	eapcoPzJ/ccRhZp5RdsphPU3xM71+Blqmdd3YuWUUk7064S3ypkQTO1YjRJotLSLKrzgvBOy0hE
	sMtGOAn0Lpc6lu5h6aEA4V4QUxspMCGpO0nSbJ0U0Lrad1+gjd19/paqcNUz11f8EA4TUKvfWmd
	QSma5phR6GRHAiwq+3F6VNll5MH1+75eYabR1s3Ge9kX7ddrZ3swYa50KmJSV35+HjpV2z7Z1zA
	ANJky/DwaAr+NAfDklxUObRR4e3SMECwrbOEATJyNSaOOdCy8LyV4w9U+np/VW5r77soZCHQObq
	tQmzoHSCPZCcK4puYXl4iX7h7aakU6TOrSB0me2FRXKwrrXkTn99JjSmrRz7rraKPBz9hU
X-Received: by 2002:a05:600c:3f0c:b0:4a1:e383:6811 with SMTP id 5b1f17b1804b1-4a1e3836c4amr24008775e9.29.1792318720807;
        Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:17:59 +0200
Subject: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate
 module
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=JbM2VE3IsOerKlOKNPqjWE7ND0hmDWEReikc0eKWCJU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxOCv+/XCiZOzFa6sPhy1KTdvuufjJLujw65Y7kr
 +MJ1zac7ihlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEolsYGXrOfpw6RzL8+s31
 wr7Z3r/F/sob30oxmFfGXp+/lZ09fy7DP+sNAUZbQjKfc7hbXc00vFp7qu9MlqOoi5kvT6Q+X9E
 XBgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Instead of including it in 'snd-soc-meson-aiu', create a separate module
for it. This way it can be independently selected by either AIU or the
(upcoming) AUDIN.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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

