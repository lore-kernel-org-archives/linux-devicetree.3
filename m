Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACEF388E5F
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919486; cv=none; b=EJqvZ6UZjM82ud/DO76eQv809r7XckuzFYTn3Xhab6VfYWKw8BNYH3ovhC2tYRFUeU2M9vXvlDLSJbk8vYYnScVssRsj6C7+di2wl1ZRkpFV2/tzUyrz1PnIC+V86NWNFoXEHgvCVIybivdlRn/T+DuJ3LYQNV5vAg6+XsViFCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919486; c=relaxed/simple;
	bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCAVfOwQgaKzMne3+m0gvSKhXq/G63IgSmcRB5n/dk4wE+cBYLUTd/mxe/TMtlZspaNUHL7N2ur7alevylQThhFs9UV8uoKUr9K1RRjQ7Q+8mdTb3bFFj1z+rO3/ai+w8S8Qd6W1kHbpssYGDoGY1iiOUR0MUq4e5UvTVZWqFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xI/yQ3Ay; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xI/yQ3Ay"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48896199cbaso32123525e9.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919482; x=1776524282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=xI/yQ3AyQUWar/25CI2XeiaUeYENa67MEZpxKCJ2SKfSBkgkzZJW1DXNzmUtyPfwdI
         mQN2p0/Vk1snrPaPISwwNDVTdc0APcvbaf30TdlcSJfRwVx9/K9VboX4dtMDudiHfasC
         vfuNPWen2gCDYmBeK9tqa8DPLAES8ltEppV6vGvDqtvXmz1ZEs3cFdw77CohxRE0Ei/G
         xWY+/83IACNilHzU2AFi4ptVXkap8b0wnOS11wuQZzD9Nktea929/Y9FJauRxqO0RAQ/
         TfnaEz+lNNk5UnJgfirlVP97ZBF3ZNNIKwVNbaLiqAPAglLfNayb7qBvgzVSoub+aTPE
         gA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919482; x=1776524282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=oJLScQAEbQaHFmCNbUPMzoK9PuACQ1T3BqqLrcu8S22b1aMm4Lg5e56Ot6Ry6J5nvX
         IVQ5sCH7eQM2gCkfCrjLCKAc/myiWK1y3rWmttrZS2/MsdozZQLl4jX0aLrTeOI5aYQy
         Y61ypX988uOkFtg4+qk9QZ/V08DIOWZ0sruixyGOqxJqB/iV9dfOm+rLoBO8BQrOCrek
         97/fBD2A2Fua52uC0ngT4olowp94IMmeEtc3Q7cgNB+9odrtbDmEYpuR6bIpLTSyzKaV
         v7YmoCWDbkNHuP4DhSyDHmOcrZA3+dAc8bmJCkHkRkPyQLRNooz/s9XqMTkzhyVObhaH
         dcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZZjTRgXh8SGdv7RGFL5FBojESbWGtGB110iEe+sqfSYQlDfI6qcxVZ9eta3jsMmUzV8plqwu1bqGB@vger.kernel.org
X-Gm-Message-State: AOJu0YwStRXyIA+EKdXg8JduAkZXAa8Kc6m6ykmSzZyx5JwjIvczQVrR
	j9cRnoz3ZyVWzALlFMztac94vR5KhB1eQgklHqXzVpiRXzCGljBU2Kur17N4OP5k2vWaTCxcRaB
	m9R9s25lOLg==
X-Gm-Gg: AeBDievidHf8s2nAF1FOWCd8hAxg4DqkoVN45kXaM4QXHarb3fxQ+VFyGsZ56RRefPt
	O6yZPqP0mlKaNj5qLJyzDrlIg5cW3w55+QIGsbIoH2c55kRoz2LVpHZWWTvgCOCpcCKThBk43pd
	aGSSDynXXGvb+Am6EdczyRgAYXdpyCORXP0RADO2xw6IBa+Avd+9xo/XERdkheNo0bHryLjhjS4
	UMUkmf/IcXkDR2EKApYuTscbliOo4J/4KmaZcRFwhPNm8ilOCMoCzXhJFo9jVh29VV8/o5FlvZe
	3Bcbgf8YlsmGAzuE3kNakZQ/jKI/HvPyAXvYpUKNZka8YIizODVzOKMjtInLalGhtaq0GtMgwHG
	1jTSAPg4rogeetrfU54BFHb4hi4zXYZiYjbn9xtYM6QZpNEw9xv6Wi8tZ2DaDtZeAV1VFSGm6Tb
	XKdDf07SfFSDEJWGX8cs24
X-Received: by 2002:a05:600c:198c:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-488d67b8d43mr91896385e9.5.1775919482459;
        Sat, 11 Apr 2026 07:58:02 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:01 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:28 +0200
Subject: [PATCH RFC v2 03/11] ASoC: meson: aiu: introduce I2S output
 formatter
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-3-4c8a6ec5fcab@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EosnHvX2S1hn1HVt8fpdp+xfn0y91sISLBCUUXGh3
 S/hZEJORykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZySo7hf6Bfovuj2cvNZ1sx
 ZE0wepfPxjz1u6mR85G3WfYvDpVUNDL8Lyu166lb1MmmtD9m9g1zg5xMM16brOe8CY/etmhbVE5
 mBgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Introduce aiu-formatter-i2s, a gx_formatter implementation for the AIU I2S
playback path. This is going to replace data formatting tasks that are
currently being implemented in aiu-encoder-i2s.

This should ideally follow the same design pattern used on the AXG
platform (see axg-tdmout), but the problem here is that all playback
features (including data formatting) so far are implemented in the AIU
component. Getting the full AXG design would mean introducing incompatible
device-tree changes. Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still implemented by AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 106 ++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 146ec81526ba091a174a113ce3d8412ddbbfd9dd..f9ec0ebb01f048728b8f85fd8e58fb90df990470 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -5,6 +5,7 @@ snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
 snd-soc-meson-aiu-y += gx-formatter.o
+snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
new file mode 100644
index 0000000000000000000000000000000000000000..c7eff04521de3c282f7f79864143e073ff1b2f27
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "aiu.h"
+#include "gx-formatter.h"
+
+#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
+#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
+#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
+#define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
+#define AIU_RST_SOFT_I2S_FAST		BIT(0)
+
+#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
+
+static struct snd_soc_dai *
+aiu_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_sink_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->sink->id == snd_soc_dapm_dai_in)
+			return (struct snd_soc_dai *)p->sink->priv;
+
+		be = aiu_formatter_i2s_get_be(p->sink);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+aiu_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = aiu_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_playback(be);
+}
+
+static int aiu_formatter_i2s_prepare(struct regmap *map,
+				 const struct gx_formatter_hw *quirks,
+				 struct gx_stream *ts)
+{
+	/* Always operate in split (classic interleaved) mode */
+	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
+	unsigned int tmp;
+
+	/* Reset required to update the pipeline */
+	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+	regmap_read(map, AIU_I2S_SYNC, &tmp);
+
+	switch (ts->physical_width) {
+	case 16: /* Nothing to do */
+		break;
+
+	case 32:
+		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
+			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	switch (ts->channels) {
+	case 2: /* Nothing to do */
+		break;
+	case 8:
+		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(map, AIU_I2S_SOURCE_DESC,
+				AIU_I2S_SOURCE_DESC_MODE_8CH |
+				AIU_I2S_SOURCE_DESC_MODE_24BIT |
+				AIU_I2S_SOURCE_DESC_MODE_32BIT |
+				AIU_I2S_SOURCE_DESC_MODE_SPLIT,
+				desc);
+
+	/* Send data MSB first */
+	regmap_update_bits(map, AIU_I2S_DAC_CFG,
+				AIU_I2S_DAC_CFG_MSB_FIRST,
+				AIU_I2S_DAC_CFG_MSB_FIRST);
+
+	return 0;
+}
+
+const struct gx_formatter_ops aiu_formatter_i2s_ops = {
+	.get_stream	= aiu_formatter_i2s_get_stream,
+	.prepare	= aiu_formatter_i2s_prepare,
+};

-- 
2.39.5

