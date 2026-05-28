Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491BA3FB7C1
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990533; cv=none; b=PYDwJEfHHDPP/JdzTmF7lGqCoP1V2hZCvYXS+o9GRDsgMLICd80heVMKcOP7I8ysYoR1HsUQ6kW9hrQv5MED1s7lf0k4x+m2ekxNzRfvblAkEsAv1qOzVU+hgofSy5G8+0YgrVEFJklIBdKZxw177apkfUcYfZXcO4/B2/GbMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990533; c=relaxed/simple;
	bh=oQ7Hpkxdi7o1OAw57CCpb+Au53scJEAlsV5FWRttpUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KyQxVld/3Ph+p53+N71MNFyMMlpNcsuYYZ4gAC0MyVPdGiQ0BH0oFc/rL3Jux4Do1UxIplRGAaqFJo9ahBEMth0FOdykiE5mYHakuY+hFBAc97z6pc81KuQD06C6JyKRH5d/iEPeDfXTT562O26JhcOD1v4gQfPyktnTmxPZF+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHI5NGrV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHI5NGrV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso62475855e9.3
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990531; x=1780595331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=tHI5NGrVuwVKO61IQOv0ntvMaN50Ji42MBtQsXOKuxrnP/CPvSXc8bwITuj2A8Iklo
         mjMmSzyqbJe17ppFHzokISC55eNegE0NR48LgKjQKJgQ4Tij/q3WvAhvk1lluAj84L8+
         DddChQy61YlNTW0VtouxCo3ioXDrdhtyrQCtHw4ZaPoBRg8SKZMxRJW+qeqU5zU6/me3
         qtuQ8WtgyerTGlYX0DeqB+MUf4OvJCLkbUF0KGYQPc+Utpx5FfQDkYpXAXbwsDK2EkHq
         0JX/m4t1fazB42dOWmtnzvzf+bSEuQEPEidLtKP8c+trwtfgwS+nb9p0+0Ve5wuKMjz2
         IAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990531; x=1780595331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=T7pt0H5NFax862uF2YXYlXvt3bhTDrkDhorYoizXVPKu+oqqVjhJo4FM8JGM6RKwN6
         udBXH0aC+eEPhwBatthe5NKHTBYiHyWaj5kRN6X6xTVl2fgJYaii4JvIoxbryOI3WVPp
         ffa8n8UgOvqrEVPRrVwOBKOQM+wMc4X72Mhj23IKuNe6sGTgUV/O8UVgHGqomikCX9Ka
         DEaM3YCemlC/sB6rwsuWBROC1qRbSj/NLWxBhqBcmA7zt/EN7U9rjUV6Wrz+khy97iA1
         c0uTiTQIf1kjJI83fiwWYyGVvmXaVzAtcZxg3mTERClla7EU14XDtw8eJ9lSaLByKwh0
         P5Yg==
X-Forwarded-Encrypted: i=1; AFNElJ8fvxwTQAIPbj4cQR/1/WinvkCk2aic8F4MVbp1jQKYO7OVC6SD3Zib4hgUeUpthZ+Ac9XN283GoFrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdG/GDEratghsPLPGAhQxAI1/9ACKBYXASKEru2J3/3HHh+/1V
	F3oIWAAbkbDfu7dnNvWcoel8HofKsVOJf8RtA8TThU19ZxR1pkrL0yOh
X-Gm-Gg: Acq92OEw8oczMlOiO6btu1tYAxpQ2qRwSh7fEuMXDJiUpxYhrCWwQkzARP4FDJY501x
	cDUUAXSHEUUdzbBSmfzvvqc969j6d9C7O2AUtnqzPgH71/poS5qlvIYv+cbgMv0ghX4wq5yRBTe
	3y7ntlJoDS91/1mru/ptjaz8Z1aBDozdnkeLw2FzieAisfldVB281kJgMoIlzbk7Y8Ey5TVWyx+
	+Jh4MhmBOkUGEtSt6GioFOypyUSs2K8DskBZtMRt/oPrfjfhzmYxlvhkPzzJ0EiRol/8hl11DrQ
	WPT14wLyxJ0Ya10PfYFM+eZ8t+PZkcjeN7pwHNrA8+Md7U75mkMmVyIBb2m55tgjVOlZTT6FB/U
	RWnJUty6Tjn1VnW+25LwgLFN9q9+y3knaT+sxsF6ynGZMb3Kj51JOKxZiWmp2fv3aN7r073HOLw
	Z8RCzd+ni6qLs2V0T9Mt6/Pk+sHDQWEqY7pC8eXBXmvIg1CVBjiZgKnA9OGJsszHppbcSb5uG1P
	CyneSsImoZfOarBog==
X-Received: by 2002:a05:600c:1f8b:b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490686997b7mr266156675e9.6.1779990530436;
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] ASoC: Add support for Airoha AN7581
Date: Thu, 28 May 2026 19:48:28 +0200
Message-ID: <20260528174840.28644-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  48 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 453 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 156 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1467 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0

