Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DB333434
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679569; cv=none; b=dcLd/btc8B621cgktpUTi6aLsvL+sxZOIOWznvl3R6g/jBkJb8LAXAfu4yZorM/Z0di8KGcqC1xdV2dwt1hWYcv44ATD8yhp2H/ayYUPg1JwKLQvWNBwH1XOP6R2r+b4A9CepmAt3AaHvT4chJs0k/+Fmu9tTRdWB7mWTHNP604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679569; c=relaxed/simple;
	bh=QL3aLv7tfkJWceDD9z9IZ1f1wPHpKCE9Y2VUEZ48vIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zj4QI5MbN8zQiS/VtTNGZcBrv+0khROTV+X+ScQN5JP1vLGuCWxsRbU30RwxIISAz7beaahNPUPT1avpMIHGpXFM8MNyqcfob9guckHzGmxg/pjhazqUwNx577peDGli7RIL8Nvn9e9s4GZmE6dDj75IO+GnzbrAwesfNnHsw6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=X1gfQdU9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="X1gfQdU9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so60796895e9.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1778679566; x=1779284366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9uFItAse7Ylvn/bLaUPDjvgqhYs6vt2DJt3kwbd8yg=;
        b=X1gfQdU9maH7aw9HwgDX7AG7SZohcJBkp9lZBcbLOyfO9TDE+mcYfhOtwMbF4oYagZ
         cK7jf6MbLWPTWEY2WAJRk+qVcPV86DUB6xp0n5bE4TiYJ3egTXkewIrCm2xGlyvqQ75m
         05T6Fabeajdfjkku20EDe/kmEoyCOUSzOs5Pf8iQTotqzE7wN077C5ic+DMCPNgkkxnQ
         qmVYjNXhCGaMxxuwLPpwQ9kOjtjmSx9T+2TiDt8JoH+sVsmOqDLcl/DNO0uRRAOkrA60
         9b0V+YolFApI5ngw2ZGEpjQyKXehbe5E42mY1k7s0YP9dJun/VAcPLSq3f4mxaeB+oRa
         hW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679566; x=1779284366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9uFItAse7Ylvn/bLaUPDjvgqhYs6vt2DJt3kwbd8yg=;
        b=LqSw9JzL5ji7MXHbeo5tCAOIPTppwDZ15S9Q9sSc2ggAYMmz3KLhUsca8q+zCnARlo
         eg4coU1+3qIliyXefVScC6zbQ+nCThl+olWI5Agt3GftVAB/TxJejG9e3o+Hc8RKGCFm
         QFNdVPQVffzZrbZu4bRFkzWGTqhn2nZCWWCrgkgk4k4bkhxyiPoPstG1M0ddxFc4vRyX
         0TAUA9ui8DiBhD8pLTLUOmibEGZdZqd6POHVlpoYIE9+mAFXHTEhe7CBumQ8WEE/qBG6
         RQQXLQcf/R2QgExIfSpZb0CaCG1qY9EHHB6ydot5kSvMJ8Mr2nwjVgwJtvBaJem3fGJk
         OsTQ==
X-Forwarded-Encrypted: i=1; AFNElJ92a13E3soSldDVm4mbkQpUVpzbNpzPggFwV9MRY+q/YuqgZjiIYNBABRMMuPocXIh3CLOuPR2Gvvug@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv97Z5pLHpYwOJ1SdKGCBB83qEhJ8lZIERS95y24T//DCGVGlJ
	zTiNtDjRxccEUtNRsDm0fvBIWXp6icQDJAWzkLLY/1UKk+m99+OkXHeg3x4VWnTdpws=
X-Gm-Gg: Acq92OEzaTmajs7+l7EGEuikDjilIm7N3CyFoneWj3JOJydvpTSZXAMQwt2CVNvI175
	qJGORkb18cbAeHTCxnkN9aa7/83YfNYv0LKKNH2/IHbbBl8xWgDViNQEoONOSTNoaNGgf06pkzj
	BeF6OrIR5tj4gBMeH6lZhsREKENLf0Edau5zKCcoVC1AtRltrTvRaYBUxBdsZd9U2Xw9ofsUv6y
	+QQKrKvpg0tTymDcdAdXV3YR15vQwi4F0b+T2Sjq2KRuRYJ0yyQ2nIahUx5SEoeY+K3YVJ6R/+Z
	mMRnYnOO0MkUTdqAk/2LVjJJ3+pJuPCxcv2QIBqTJYw7VfiLYIjQ2wU2hCPxrclBthbWDDjYWaH
	gVxa5DRKDeHT0HT6mk/5f5vKLx0DTiJXC1dKuTRfcWQE8OJmowQklUy3QZCOUIt7Pq2AO7woOON
	Fc5N3mvBQsVbHwb8jLTpxyYvSbyZhwrVthJj2MRoxXSjviWP9tCASZY66BcdaDG8hv7GWQbdFch
	8Dy8e9A
X-Received: by 2002:a05:600c:524d:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fce9c0965mr43813865e9.8.1778679565873;
        Wed, 13 May 2026 06:39:25 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-83-110-135-253.alshamil.net.ae. [83.110.135.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca383asm39627560f8f.28.2026.05.13.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:39:25 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 13 May 2026 17:39:11 +0400
Subject: [PATCH 2/2] ASoC: codecs: nau8822: add support for supply
 regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nau8822-reg-v1-2-c532e18e92ad@flipper.net>
References: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
In-Reply-To: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QL3aLv7tfkJWceDD9z9IZ1f1wPHpKCE9Y2VUEZ48vIM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSx1LNV5jXuXnkn6UzW39/Jt3t2m9+fLGkWty+W61h3r
 sP+zdYBHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1x2KGPzwxJ7qWsGs+OPec6cLBy/Z8k1bdky/crFViwMJcn29pe4zhN8sr/9X
 1LEpzg63byrVP9azMNOqT8zbQvTD9zwu70pNlDAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

NAU8822 has four power supply pins: VDDA, VDDB, VDDC, and VDDSPK, which
need to be online and stable before communication with the device is
attempted.

Request and enable these regulators at init time, if provided.

This helps avoid -ENXIO errors when the codec is probed before the
regulators are ready.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 sound/soc/codecs/nau8822.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index a11759f85eac..c21a037e0f08 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1153,7 +1153,8 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct nau8822 *nau8822 = dev_get_platdata(dev);
-	int ret;
+	static const char * const regulators[] = { "vdda", "vddb", "vddc", "vddspk" };
+	int ret, i;
 
 	if (!nau8822) {
 		nau8822 = devm_kzalloc(dev, sizeof(*nau8822), GFP_KERNEL);
@@ -1167,6 +1168,14 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(&i2c->dev, PTR_ERR(nau8822->mclk),
 			"Error getting mclk\n");
 
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulators[i]);
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "Failed to get regulator %s\n",
+					     regulators[i]);
+	}
+
 	nau8822->regmap = devm_regmap_init_i2c(i2c, &nau8822_regmap_config);
 	if (IS_ERR(nau8822->regmap)) {
 		ret = PTR_ERR(nau8822->regmap);

-- 
2.52.0

