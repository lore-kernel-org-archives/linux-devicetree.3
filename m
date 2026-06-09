Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3D404BFD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005191; cv=none; b=oZA2NfX2HZBYpDifzk/7ELGl1a87PlJWLtM+rEamwlqCuPlwY4brz+XLL6YrHAVjQ3YGedUqeMgIDNVgy5ckkLWp5wn5bZ0p2TeYVz6OWwNvZ3GdQj1yZz1rX94m9NJKsug8F9cNTrZRNHLMIn/omB7R/JokHjKJb7S2hcYHGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005191; c=relaxed/simple;
	bh=nI5ECO865SLO/yR0Iz3efaPzhFXDP/Ze7Ooye8y662g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvhzMhMNKfuwGXT+u9RwzAKZEPMQHw+XYQ7Pf0+mPDSgqMGxKamuRZt4Wnjd91Rjh05+JzaAnAObZMZE3pU8VqdeFGbWLwEwfYa4q/Ma7KRvz+7bkkiBVC7itSVHc5Mq/nitSU/0iezKazv4VgYpB0gtaREr1y/yXXj0t4eqQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SisWZCGk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SisWZCGk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso48493055ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005190; x=1781609990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ/oe53fAvMnFVe28kFJYn/lJeWITuitrB7buiTdOTQ=;
        b=SisWZCGkRO0EKL/FIpqjtsu4ou3Gtsa3Sy0EYkuHKZtCHWqhNGFG0Vu5V+dVzrOHwI
         O5rSH2iuKw65eZMSg+uZTBWObfUR6AQY45gLLhjU2rrijKzKHtAxitnVWokz1gqP40Sw
         9mC32DR/GNiHlNyQePfE+TXCmXuNIwI7UpZbUn3kbRePtePAr0J+pe4LnhmJ4Vs9hmBO
         WRSHrYwfyf8Meb3V0tB3FOvEaAh+M65Zd5LjDpHLphHRM0EmHDfJc0D+BbHTLGcoA7FR
         Te8990Z/LX5Lj5whR7nxM2CjETUuTtqEuVsAnFAwx6F1C1GI0F3/OB8Z9gLw/vurFwoL
         i7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005190; x=1781609990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ/oe53fAvMnFVe28kFJYn/lJeWITuitrB7buiTdOTQ=;
        b=aGeYL2cGrBW8cDbsIQz0NcDoz8IOEQSF1i3UoY8ikR4MKJKVEKOHtRm4nHO4Dw8DlR
         iutiz34I8YRZ1lste7Rmb5KiBYDPn6XssIzw5cQt6xENK0O1pyZsl6tbeD9fGw3uAZDN
         vlSp/F23PcI3L+RPdJQzEW18PtrfVT7A/Gzq/AtIhMQSB9rJ1YKSw8GZp1lQtkQyf57g
         8qM9yUcPtGVxG3JwXwWinU7zos4ny81tjQdlSd3/aqbUIyfKGL6yD0gikmrHOR6ACExJ
         FMdS5brgfOKfUjgFaoS4PRLl7UQNjeAhWq/4G/5GZGcT2R3/3f29qcC4WSxqp4wc8Ayg
         F9Tw==
X-Forwarded-Encrypted: i=1; AFNElJ+Wkb9UxVHhoW2ANG6JcVKcKcLq5vFzbsn/5bzpN23R6mlEErZeFzmIZMoT+WKsnOg0bE5RrBmLi3zp@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYfYxxb4JAr6W35j376hZloDOftFCpIhZ5f94t7iR7AN2BT/h
	pCUndFXXTbQ1jGSI0OOn69f5YI24mf5/dirX/tPbEik0vrgMGODde0UA
X-Gm-Gg: Acq92OE/PRDF16YnhxLaI2/ZKeby9M7zAwTUcmGR6N6y87GXEugPboW9WU5DfKZnDw6
	QJcXRaVXT0wsVe58BofhX2C7FY59AoF7ULlI5Ovd2cJ8x5kW0thUaI9hyN7nyeHuytl+Ccnu7Ub
	khBsmEYQz/8TjyOaDVbD/r6N1c4thc0CzVWtHpk3SAMJqTZK8KNqhtEl3X9F8FmLSn8rVBDBVrL
	02xgFqO+I/yF1RXNYZEZnM1uH2NWldUxxrGt6fPZUYOPxXAvuM+JYzG8y+W77O8zA7nwsl5H9nL
	YoLzOWcumNRXEa9+QdrvhssZ5BXYv8VJ/wjTJk6Z21HIDhX0dvh6M3cBn0NFyZplnWZMw0gVQL5
	hHJTrGG6qzDOQ+WxFTzaBwyWxtwFW6fishg1i/eIwoOCsKUBdh+x0SvhgFilrxJPG2Y1SPFIAmr
	CpojTB+dTTcEIOqcOBBco0I6LR4x2JZ30jDaBjv61bzIBGHNnQTSEZcEdm/KORDz9FmymZ
X-Received: by 2002:a17:903:3885:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2245a3649mr194770575ad.14.1781005189646;
        Tue, 09 Jun 2026 04:39:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:49 -0700 (PDT)
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
Subject: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Tue,  9 Jun 2026 18:38:36 +0700
Message-ID: <20260609113836.45079-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - Minor refactor in clock enable/disable paths.
Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference
   counting.
 sound/soc/renesas/fsi.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e26f39dfe059..b72396b5de7d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+	/* enable spu bus bridge clock */
+	ret = clk_enable(fsi->master->clk_spu);
+	if (ret)
+		return ret;
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1605,8 +1610,13 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 	fsi_fifo_init(fsi, io, dev);
 
 	/* start master clock */
-	if (fsi_is_clk_master(fsi))
-		return fsi_clk_enable(dev, fsi);
+	if (fsi_is_clk_master(fsi)) {
+		ret = fsi_clk_enable(dev, fsi);
+		if (ret) {
+			clk_disable(fsi->master->clk_spu);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -1614,9 +1624,15 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 static int fsi_hw_shutdown(struct fsi_priv *fsi,
 			    struct device *dev)
 {
+	int ret;
 	/* stop master clock */
-	if (fsi_is_clk_master(fsi))
-		return fsi_clk_disable(dev, fsi);
+	if (fsi_is_clk_master(fsi)) {
+		ret = fsi_clk_disable(dev, fsi);
+		if (ret)
+			return ret;
+	}
+	/* stop spu bus bridge clock */
+	clk_disable(fsi->master->clk_spu);
 
 	return 0;
 }
-- 
2.43.0

