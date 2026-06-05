Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296984DC524
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662046; cv=none; b=ZcK7cBjeFpgGpdr8AO2P96CGauaQzV1eGyQAxAJwZF7f+bjENuMwwzlNezeS82iR0YveQLibHcHl5az9r0Crwx3P1DYA5Qspz2gbTYPNEoJZJYPVBzewcCAfcCKxXT9tdZd+MAXdPm3TG7Z3e2Zxg9Sz8tztm8s+lVOyHN+RtJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662046; c=relaxed/simple;
	bh=6JrAI+jHNCVY9D9mXTcwbzLOirSfEaNGPwbU2EKa/Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlVLWcnsWj7Ny6CFByrp4Q9AAY9x1TqVMz+ZLUIjC8dmjkDj8JOUm1BFllQakn0u4Gjn5xWinAQoS5uwRtOtw/QxrCSELlb/Z/ZRhWRfjqKBEKwKKuLFiNKNGA6lGrCtCCqF0bObJUXX2v2ysegczvDtZLVJKwPGEQ58FERcu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qXcVtmGv; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qXcVtmGv"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f869421so1344811b3a.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662043; x=1781266843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=qXcVtmGvGw7GKuID7xkrFjgKlu/h04nD69yfEpd1w7Z6ytp8hTm+xIDl5km7xBf7dP
         NnozEcjdInb3zb/1Nc6QYK6v/edalcGNlUgApJHfOvrd9oG32yjuKx5c64QRKywq/8tI
         bs0zEUARt8WyZZVogzR7IVqFHPlOJxJrl4iHXX8DDQZcrw7IRgjMsiCIvJWyOfQVi1FT
         la263xsAWD69pteJXQkojJVqXF8CxYLayHkKFdWUp6LEu6zfN4VXWN5rDcydUIzYVjiE
         VZ38zyzdNUunFhLLsZFXPGCmHneHY3K/gaBpbwVsP3JQvQfS+J3KgzFIA3AjMWcSTA1i
         PpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662043; x=1781266843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFeJyXKmHA1Uec1iK3fvTQXNf+MjrFSlqdhOvHAIFVA=;
        b=XGijs0+WTiY/1yBDFNxGUE7nVGjIHDPc17J2A9FNo/VSs1oRJ6jd1zrFVqt4Ui0a6w
         +GAIgNjvSv7m9xx+n/3ovipxiLeC503A1s378VFH+RkOTabrSJb4q4uRrrEjuTaNTaaS
         AQ+SaBMj47L9aPwELyP2wfEZBA09dK5hc2JeFUzSw7uUmcHt3F5mIC2mPDYbhdDJ++42
         u1kfeVILWfFgToYfM3fGiKrKGDO3pU/n+tp39l9zZaBhHyTxj0dO9poMOelfTqA5Ick9
         2IK93dBvMgjT+l9H+R3MRzQMuRZ5YG/tfxXBLz34Hh6rFTJckLPblXGDV/XTPLxhYsGS
         7BGA==
X-Forwarded-Encrypted: i=1; AFNElJ/f6+sY/GQNOv52aBPl6G5SOCxXeMb8KdUBkMGdeloIxECfRJpHbOyS6AkdJynRCZVywAy/6q4j5Y59@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8CfJWFWv7hk7miEVv8QK0rsi9lhGT044+K5xDi+1BQ8Rio4u
	a+9iFpCDUCTfu8J+p3ngMV27+FwM2s6sPLhGp+ID/Zr8dQ/pc1zWxJ3U
X-Gm-Gg: Acq92OGhI/Rvj5t1AR4E3RMf5zN66t4dDt7YqUvqyPvGl6KZxvhJO8KjhLhgXt+ULBf
	OqP/7+1Jv/FUDhPa5rgOTLumei6BqGY95ZEp2BJP1kOOXtrkxYUUr7RiF16Cf9TZwfZkN08kCeT
	2virtXMNBWuPW+PLCzmTGjk18w3uoZra1u2ldWkVeJVnNmcQBHwL1nEZv9BrqZnTD+mIG/NNsTf
	Cv1B/oHl4pMew5XHltqrAlLYHD/yVWRuE0Lt0vozZygZEJQRavx5pBSb7XOTy67T2oQUHvNEx6Z
	N8pxg8syAIY29VRxShzKXSdH9smIfnlBeoYUajjaPZVbWXVCyLEmOY8LmRtEvhbCRQNSjFIhPtT
	fGEwayeBG57RLAc64DJX2oGzp6Tl3Rpf++jNSO70Xq0fe3fl4YSe67bTPRis3/xZzRuxAr0IfiP
	t5r9OGoqlGUzw3Ezi2Wpo91namckKrn3jWsMI4q5MeGI1qsUA38No/lVvuxccSr33FFY2R
X-Received: by 2002:a05:6a00:929e:b0:83f:250d:59c with SMTP id d2e1a72fcca58-842b0fa5602mr3482846b3a.39.1780662043121;
        Fri, 05 Jun 2026 05:20:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 06/10] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Fri,  5 Jun 2026 19:19:50 +0700
Message-ID: <20260605121955.105661-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0f350bddeb1d..43e6772c06d5 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -717,70 +717,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0

