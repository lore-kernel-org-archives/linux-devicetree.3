Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5F38B7BD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005168; cv=none; b=mta4qT83CKkCrb+bAASB6YSmhrc39s+OaUGjPd1LoS+pzur7epFllU9NOnu1HvBuoha+YkioF8Xpz/1chb5BHi1ktPvfOjjk7gNpsd826lpljEAFXwZuoJTzvE/W3PVPBrcwJZuKmt2Tc6cX5S5zIcjflanaaeit7mV8wGY6Jlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005168; c=relaxed/simple;
	bh=m996FWhRx8Jyse1pg+wk0JpYoaqx8/UREkFYUcB/3mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWs26ttzd4lFokrjeUS18obhz7cZDgVLnTwRBVlKzADFVuGDY2HWiYzR1vmehrRRiUMvZnzDz+5UL9ZeG5nG+Tjmk0Wvc8VehemTCVUxCZr3IuOswCDzm/FMGCkAq67sCHv2ZqKxZWQzP/e7sN+qV5sCBmjnm7DzJw6A4UuduU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROQr9E3c; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROQr9E3c"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so4325849a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005167; x=1781609967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFE4SMGzYu6VfqVWZy1LVzG1tn7Hezp1rS4Db45ZIm0=;
        b=ROQr9E3cGqMkiJLWPAGhCFmHQ5RCEH7s86veA0+pL+HxA6/9HGQ2r+mC9uE3ufOe9b
         HvXZEnnZF75Lwj/Laj9aDLWMdzhui+5bZB+49RKYWbHNnaw1JRjH3Ea87jckZMC7rb2I
         uj1UInB/hA2wibqGNka5MSzp10+n80uBmXOsKXuU4J9z1FMYQPEH3FgI+VPoWnqsb1uA
         rEdLmbjWoQiBaoiBaobBegWyQexlzSJS4ApMFrpsFcHULi4MzS9Bqp8nmVz6UqGQVkBD
         nbDMm3NWFWtPVEUGr6e6CXzv3Hm3vVbNggkbiM4HLrC28tzYC6g30FU3/OBhwujmjHF5
         tU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005167; x=1781609967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFE4SMGzYu6VfqVWZy1LVzG1tn7Hezp1rS4Db45ZIm0=;
        b=SCtjvNU9QQxNbSh5noll3YEf9p0gcnJmqvBF4RYJ6HUAtj77amFLKUY1oN/yQQBtBe
         pMB8iWZ3curOYoPp0UrVXICFV1ZSmWmuKovmVhNiQmXyz/EDNqttjU5duSTXLL412u5o
         97b3mKR2Q+GLHjEg1RAxxtZg7VVlBiRyZqZ7HuN9HUGG1G+z1w6g1Src/SbRsE9nAaZ2
         AT6px8hYldGeU8EhmmU+A6egFFV19Xwsga4nNNMjLs3HjVVsp1s/cAQOAWt6ussOK9Ql
         /l7ntLnsJdO9GCvOh+2YdVuvBanke9mVCz8wD21qYTEc6EiWruHli9/tHfOffOjQNZqr
         YcrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/90GwwgbNkE5ktq1dVKB2zTCfmDWnELx4XmRIAsFegzUbR31n2rkEPStpOYaLvXhzbI6T0pNzlOJXg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfv24muDeq3EUeg1RaY/XhxmBuuxQNATQrOFowO2oIDM0g7TnN
	gaSTrncA+uzWfhVKN6WPnudYBFqjybT05st7ifDtmpXInUvIpqreV46p
X-Gm-Gg: Acq92OGBrsU8AR5U99cx6AxQJXY1xSYY1GjREaq903XZXGjwfVuIW4X4d3ytwqNJb5r
	+b0oVRGQ7d+kDmugT3pHF0Mgcu19iUBXjZDecSMU3YhhYFP45gvJQriQHgKL1nggOS3dlOPiaAA
	yzogQ8yReO5gH9ZLZ8JXBytxIgSJrkhRrO1rHjjFgD7MeUZx9O17nSrXFoXRtZ4rQlpA8uOLVhT
	mIdiQfIKZ2e4d6Wagb1H97Sc4XGIHWYwmhejBRO2nXwqJYldutOGxZ9sew88oeaPUeKzseDXVQs
	7APHZ2u72Bdl5wlEI6XECeXoBUczvEZa5CUQg0tAa9l0fRK3ADsr/O+owsTjgsVj7OHyFCiNnjR
	96uG79VPK9C3HPCZ9pzx18g99xjIoYROPvyr/Yas4qXzgAoEfUVMQLq3EAq5cqRKH3AOnv6FJ9D
	Z8y1n83nYRD2guZtH9G3CvnPsv2oXNkki88gaGHqZRy3d7qU8dlk8Y9w9eUySJ2h3j52kl
X-Received: by 2002:a17:90b:4d11:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37521779d48mr2843139a91.24.1781005167145;
        Tue, 09 Jun 2026 04:39:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:26 -0700 (PDT)
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
Subject: [PATCH v6 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Tue,  9 Jun 2026 18:38:31 +0700
Message-ID: <20260609113836.45079-7-phucduc.bui@gmail.com>
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

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3e3c6fd7c56b..1df7dc014363 100644
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

