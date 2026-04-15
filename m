Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32A2BEC34
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257260; cv=none; b=s/Mq1IdoR3f0zEphxpKJ1e7vsT7Z/qfvpYPXmiXESN0RShyCrYfmYs8PfCdUKOfO7Ezu3xw8FhdSWOcNdppal2d8HPTCEKuSotrqPX7BMTN+qIB6uwewbUvwjdV6cGzCPZsnOLgbWzvagNvlSIeDSAZaPhzTrjJpK3Y7UIOcjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257260; c=relaxed/simple;
	bh=v2J167Kc+xj+F1x7h/z4+g6abS0dMZHD0H2l9g42OPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f0lHPM8SSWSKKK7q0hWtfUZJ2tMSkfhf6oGJCI4E+9yAiRTYpaaDPH/uOEtENNcj6YBWltF6te6TzzBQr2OzCEKlMNbhsQZHEZlgaN2VEih74VqXe3GTF7zHb8x5RFWomLUd5Ld6JH/66AkBHjtX8+9rcDoJ7RuSsounPH4PEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/jItQsr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/jItQsr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso4234923f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257257; x=1776862057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=H/jItQsrOtLvlZYAx0pjpYLsNzjfMMBwH5LDpJdcW2R1LfVik2smzIro3RDlVKZXx2
         Sw0el3dpbo6syk/CVzvoLlcvqnZSmyUESe+iq+J+PoBdF7MQ2vp4gKddWHtjdp5qKRhK
         yJm65VOu3kV1i+9SbLQNO5id/tnCsEDkxQwLdqXiG66NQDtKYO5xWuISUKNbBJ0c8+r3
         mU8DObU+/NItbFQ/NcXz4GR/DTzn5eUskqOAp4mPreGCSiVFCVWo6d+6dU7ML+rHCeJG
         jLlC8JFGeY+WuPp8GCzeoGu51gGSir8N9hb0K5FlD+clPSIh1o4ZC8D85E0defmeD3ko
         RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257257; x=1776862057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=FRY054SAOU9C98oeeoHg8YD+eoP7W6arUdm8uYGvaKras1fuqmhoBrqgIvGswLszPx
         Vqr8MdoEyeA8l1WWSIckW+KJ9GzZK9SSzWcZRkjnrhKMsRlfVjt7Khi8WXFFdpfYB59m
         l1wQ6LQgVDk2W3rFYPJGzH5I8A1+/ESDwthEi+T8h3N8nUKcJIUqkoL/hydEvSRCzyUE
         NZNiiiSCEbAcrl36JXdp3ze+vr4RBqYYxwb1lhvRHhM+ld5uVIfBZCTDliOsZqnKtZwc
         RVx0I/oTg/8XvnlCk6aLGzmY+PhgSiRVYgdhzY+LtP2zV+hOlPiS3ROY06CVkFpg3gWQ
         Lsjg==
X-Forwarded-Encrypted: i=1; AFNElJ+cwtYOwOlJaOIF+qYw81q3yyzBhwrMlsoFJ8IrbqvPciokLYNqgsSOYetbeq6c4vQZK3Gh2QlT9sH7@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHQfRqz8ssO4rtj3d31LhucI0uXvWTs3gHDTjJlmfxSl2v+Na
	qGHjqzc1TClvAAgpfEYZv+Zp2I9/jMJXSLFwC5xyd9TUU9cYOQhZhs6R
X-Gm-Gg: AeBDiesFz1Q/tN5jUoNP6PCAYFmGn/a7lmSYGdhthMmbsmnEMxTUfkF2cDDWx+WtbeX
	GwVLIp/PYKTQecnb70EV05gqkb37dO2LzoikI3zSuq5wHUsOtw8fe+MLa6iQL2PKZhI8aYM7gpg
	TXa4nEr62wQ7cuIx0rUntSRtLDSRCOa485vC9fC0KQAsSgzAsm/FtFaNE+ZZkWifff4oJLHU3hI
	eNRe7iqotp++dohtVKOj6N4zEaYDN89/ANPg4bvuLTnVeYtVaY2RMZXO/r+KI+Kk23Q/Iwb1wrV
	6T77Xok1DqFo/biFrsNcE33UFGrvxhsqfQDwPKpDoyXUIzUECjO+absHb7SoNrig0CttDnbGJiS
	fdtqAJ1ks8ExFxuxSWgdrTmEN/0manB5GhFnNkJMEgH+/o/Pl0NXUuVwr/+I9ohcxaXrD/r59r+
	e7RTYVlndY5VC1SmeP3v/uVZNDH9yjGcxhjTMUGQ==
X-Received: by 2002:a05:6000:144d:b0:43e:a69b:d805 with SMTP id ffacd0b85a97d-43ea69bdab4mr9541704f8f.27.1776257257303;
        Wed, 15 Apr 2026 05:47:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:36 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 02/14] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
Date: Wed, 15 Apr 2026 12:47:19 +0000
Message-Id: <20260415124731.3684773-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RSND_SOC_MASK was defined as (0xFF << 4), spanning bits 4-11. This is
wider than needed since only nibble B (bits 7:4) is used for SoC
identifiers. Narrow it to (0xF << 4) to match the intended single-nibble
allocation and prevent overlap with bits 8-11 which will be used by
upcoming RZ series flags.

No functional change, since the only current user (RSND_SOC_E) fits
within a single nibble.

Fixes: ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - New patch
 - Extracted as a standalone bug-fix patch per Kuninori's request
   Previously embedded in patch 04/12.
 - Add Fixes: tag referencing the commit that introduced the mask.

 sound/soc/renesas/rcar/rsnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 04c70690f7a2..3e666125959b 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -624,7 +624,7 @@ struct rsnd_priv {
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
+#define RSND_SOC_MASK	(0xF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
 	/*
-- 
2.25.1

