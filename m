Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C883A8722
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870803; cv=none; b=NyHUOctX1KhIqfkVELbY06Cnd/f2gQITij38DO+I5YVoAF97HiJRP2le8gZiXMCgutVjVGxvmU5yFZ2x8r0ZZStQmf7sbkkgjFdi6ja9o5JAaefDOjz/go2/XnV0xhSnSk0R6/lA2RA5iUaNWXXVFTMXqn9EWJ4AROpaKdP3Dxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870803; c=relaxed/simple;
	bh=QQUrE+DwZ1KWpqLSQpoA8URn9azrBBw3jC33CI+5l4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKxD+tOt3spH1E7XSTRJjecr45/GSHp3CdnLc1o4pKrrfAxgdPYYvlMNXineYBjs7MBdp6uq8YX4wgqG/c/oRk8qqYEqWkZY0PIf4rD1UUlD9XDKjQOVMpuTkSbuhk6GjEA3dRO4wrdkQZ9e96lIP9eXYSgypERDSd32ubZgfv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eGnRjpbu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eGnRjpbu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so53935835e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870799; x=1791475599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=eGnRjpbuPPuJzW9JDdZWDid7S37OhgI3Oq3irAIl5hgl6oL3K/OrUJYDNBwdRPmblO
         m4/sL4/tvcWfkN33Q2XMRyHHOq5tysx3DM02tiE9knFh/3M+truSobV8EDdpbOLZnAL5
         3pDFQqH20uz2RxqKf9PYFqS3m3IDQ7cp+ezjckVrM+u+k2PLm3pFWQtJ5A9WsqxfqDw4
         AC/Z1fo3ymfn9B6VKiA0pA2vzuMvYSDnd2nBE3q1tDl8Ev7ohkSZQYsXVTgWK/8/M72g
         4VS4aVkfJ4P8mxnnHQFV2WBlhVLyJSsr9xFUnQgFo3Xcth9vXIQ+yP9kBpWnFbZPFHVI
         eUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870799; x=1791475599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jbM+/xCOFHz2ekpLk2drdaMa28onD9DLLAyaB1dHZ0=;
        b=Blzs0n2gnsXH6TMPy4uIG9Yg46H4FV89PoAAlPt9JOc0Cym9Aqaevqth2CtxB237Ic
         VHUuQ6w7bApUBemqk/JRTAZOFXLIAD5L/sr2lcbRFquL2zEQkHaWcZgZo6TrCaNB1KyB
         BafUrZ9MDr7gIDdebiqqjnDQOItt2u4uLJvQrZe5aU1aDvT/cln9/K+cTDy/Qk83ECIo
         jGQwFtVYYLC5CuW6A5c7/cMMJBv2JXpsmNeWdAedUZiplv21I2ObKQGZ34pgaIGckWk5
         K6Ex9pC5/N2i9djXuxYLvcHw5ozQiAiWVqcqInf7dthDqYBpO25ZUPCSY3lu/K79f7Qz
         iRZw==
X-Forwarded-Encrypted: i=1; AKwUvBwOhuhC/kAIi2FQf2c4UkMZpxQM6fJvbVpaMsepJ/Z0u+mlwVkqR79ycIm+zWCFYmLKIDgQq0pC2wXv@vger.kernel.org
X-Gm-Message-State: AFuF++neksPkiAd7qTVmG45MWBtnaaYn21OvU8jegw+MQ3ZjkJ6iBEh/
	wW62drH5TZ2kqn9UjdJrYq9LHQzotlZ2nlSh/AubSFgmRAQayWJ4G/uUwYKr94ELuiA=
X-Gm-Gg: AYBFou21CpLY6hvT/vDaSKUrai0mui9ReU94rrTUvXyzwMx6LjAOG/tZTLnwLCK3rg4
	9SLsmAI+FJFenozbd2OXfnX+DoSh2Yn7zwMUfxZoL4PGqOE3eD5s+jLQcRT5afX4Ms8rihDAgAz
	jrqVOEd31Nj4RuONGO20ZbffhC0zlF2OzT4n0DeMQrv8rrAK3LzDKbVOJsN3dyq1IWzBIdWrTFz
	A4ZhSqiD4IoQKqFCBepgglg/lFwbxOO9Ab0Ria5xQlDMtJXtNfIXgIQ5X+V0JwQSfliQSgX0KHy
	sr9nleS2Gud5T8rhi/6AsrmiHUuuWwJj9LAuoD75VZ62X/SJo13+DEPt6OMBtcukFI1Dd01yWgM
	EkxKQX52Sd+s1Mie5bbW+vj57fPUwpCYBKM1IXkCqR+2tviUfy8ModBI2X7sHWkklEfj98K6ayu
	Od3A3S5JLed2pku/ZSYdCymYRMb+U6P6l/mHJEME5eIsPM6bR7aDYvFZUX/Hw+JGMT
X-Received: by 2002:a05:600c:19cb:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a0276a312fmr1303425e9.31.1790870799033;
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:38 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:27 +0200
Subject: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrkUTqy4z3Vl0Q8e+9PveYtTTF9lnd4flmZ3N1Mg+
 KPFrNaVHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjITVGGfzpNLgy3Jrp8Xbu4
 SGvmtN92qybPreZpDftuLXrS2fr5L3VGhm8e+WIVchvPN+/es+Pe0euZGhfly/fbFky+VBp/0qk
 jkxkA
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

