Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051243EE1C8
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352322; cv=none; b=mkgpJbvmYi2EiurXVfuGVHL3JtcG8sh2saIKIAfICoJjTV4Sq2wcX/XvA+T0RVNe9SpVchtOle7JBvbdtw+9pPi9YaVLRA3xNHxSv8/02aHHuLb7lwfKWxh5VItQaPETmJr0RkZB976ZRJkpkzuK3di7/Sb4Y/96mllWebUzE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352322; c=relaxed/simple;
	bh=HoUkMd3aj0s9m5BRWarIKv4NrOIfktIuX7B1xZTtvpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSqiYiuuh4ynKwDklbVffUxQq+IaG9ji3K3MnlrIYhdPN/L7TI9mLxcXrNvgXXxXcktj+L18BzJc3VyNG5fLp9fdShrBW42xWM91doDe8KRRYs4KOiGt/DclHCiKTyX/J9Fr+SkPtjHJ6hgWZsBedFXUB/cJrw4bpJErteNVvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=pjZgSKYz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="pjZgSKYz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso8801835e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352319; x=1774957119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv4k2NFngBv6AeWEv4O9srLSbI6EPVNmV51Qs0A5klE=;
        b=pjZgSKYzVnh+C4v0m/ChASHalFS64W+sGcD8ZcT5YHHdMOhYrWBYiytW9ZoNCTVYGq
         0kVd4cpW1kP7cYeoqCtb+4UBrV9sJP3u6Tybab8dowIh/AsFAJxWNg62zC7JWgw/b5sv
         xBef/PdBhbYXb8UsCc55Qq2Qfet/E3BBxybh0NRGnpNZsSxntihHjYZt3UsyaAR2CNW9
         5+rL5oYnZkdZNi20cnIOCNlxbQQjRdSMxHCFoeZ+d/sX4VTgczUpjo0/m7QNskqX3J2r
         MsqzPvCS+i6HMu/XPbrzHjenQ9UVpw/FbIi780aLeVKY6OL+msLcVMYEzPzadPVyq+jk
         YdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352319; x=1774957119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jv4k2NFngBv6AeWEv4O9srLSbI6EPVNmV51Qs0A5klE=;
        b=sexNyHYtCy9Sd6qVX43VGi/vbodigQK8ij7u1on0cx477d3JnKIB5dcvI9ZwwkxLND
         C0ZxC4CF7QPr1coIOG9GtF1g6Q/Lpl0Cf3p3wWgANaJJWFOg7erDxWsnCOAnqXGu4lTZ
         NWTsLjnSF28sbrAw6RW9ZwKSerx6PFUXzcZAsK/RpYA/mw2wJRV48W3766eaidIB23SF
         fUap4GTq9QBJkqLY5+r3a2gZlsZGAOqScNz484s0aSqfr1Elq9JnjBK0/XQyVBgdr9i9
         YdDlRyIoeZgbgG4oLV61MuBiUnACSU9GECyVB5tOlx3VwBpfbfKHaXyqEpqE3bS8tCwk
         SFTw==
X-Gm-Message-State: AOJu0YwIjVU0DJafbcxeZkrATIRo44gLdUGqbFDRx/CeHBNzB9xLrfn9
	Fjg9ZALENg3d8UBIEs1s+eZlJFhbitbiQ76qZnlOvw0IPQGMogxtoHTg9rB+iUnsovg=
X-Gm-Gg: ATEYQzxn4PNk6IJLTTZvdAXJpCMZKcAD/W99vFiT1MFxWVp7XwrzR8ZJuivL0sKrkXR
	6pYeO6HbSyn62X+BSwImnlrTez7a1vvmTIeLkrlIUBegfpD3Cgs7vhteBM1uPmwpbsqPLEhE+ZF
	1lm9WNzkrJd+7lbQ8s0BBe1W7XxncWq9yZuKnzqnkU4POIAm9vy/M0maopQBG11FEQCvnWc14lI
	6kccqnk0tGjl589gpQHWpCPzXVce5GOZjfrp1+w45HtOWmF7mA4ogWdHQcWomLIwGpk5XS9idp5
	7E/IamPsmVxUsza53Rv1Irldd5rKlK4Fr8BfVb2U3lEc0KfQ+HrbCvchxr8v7SBsQ74sVwkCxag
	lns/a5xYWkJTA3pcnqVAxK/76Mp9i/m0fxczA2LRhD8p9YroSybHeAQfx7UsJUYWLIVChiNVNJd
	7VruYGIc2I3CbJ2KE4Vdp6zBbcaxrNJYo9zn4H94//5ZmtQckdiKRG8T0FqY4q5FgH3LCJylrPH
	tkbCA==
X-Received: by 2002:a05:600c:3483:b0:485:7f45:f71f with SMTP id 5b1f17b1804b1-486ff0293fdmr223975835e9.32.1774352319384;
        Tue, 24 Mar 2026 04:38:39 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:39 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Mar 2026 15:38:11 +0400
Subject: [PATCH v5 06/11] power: supply: bq257xx: Make the default current
 limit a per-chip attribute
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-bq25792-v5-6-0a2eb58cf11d@flipper.net>
References: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
In-Reply-To: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=alchark@flipper.net;
 h=from:subject:message-id; bh=HoUkMd3aj0s9m5BRWarIKv4NrOIfktIuX7B1xZTtvpY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl8btGJtvBWLs+5ftfIvBW7/dWOn33hixXj2zqLfD
 ReWPrep7ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqLyQxMvzwjds5K2fqu3t/N909rnzDKDHIyNWnxLJnetDE5TN2L7jC8N/pyJX
 Z2xeKmgr/vJ3AHJcjkLOLYfuM2EOfLJmO1hr3zmAEAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add a field for the default current limit to the bq257xx_info structure and
use it instead of the hardcoded value in the probe function.

This prepares the driver for allowing different electrical constraints for
different chip variants.

Tested-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq257xx_charger.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq257xx_charger.c b/drivers/power/supply/bq257xx_charger.c
index 7ca4ae610902..39718223c3f9 100644
--- a/drivers/power/supply/bq257xx_charger.c
+++ b/drivers/power/supply/bq257xx_charger.c
@@ -18,6 +18,7 @@ struct bq257xx_chg;
 
 /**
  * struct bq257xx_chip_info - chip specific routines
+ * @default_iindpm_uA: default input current limit in microamps
  * @bq257xx_hw_init: init function for hw
  * @bq257xx_hw_shutdown: shutdown function for hw
  * @bq257xx_get_state: get and update state of hardware
@@ -26,6 +27,7 @@ struct bq257xx_chg;
  * @bq257xx_set_iindpm: set maximum input current (in uA)
  */
 struct bq257xx_chip_info {
+	int default_iindpm_uA;
 	int (*bq257xx_hw_init)(struct bq257xx_chg *pdata);
 	void (*bq257xx_hw_shutdown)(struct bq257xx_chg *pdata);
 	int (*bq257xx_get_state)(struct bq257xx_chg *pdata);
@@ -627,6 +629,7 @@ static const struct power_supply_desc bq257xx_power_supply_desc = {
 };
 
 static const struct bq257xx_chip_info bq25703_chip_info = {
+		.default_iindpm_uA = BQ25703_IINDPM_DEFAULT_UA,
 		.bq257xx_hw_init = &bq25703_hw_init,
 		.bq257xx_hw_shutdown = &bq25703_hw_shutdown,
 		.bq257xx_get_state = &bq25703_get_state,
@@ -675,7 +678,7 @@ static int bq257xx_parse_dt(struct bq257xx_chg *pdata,
 				       "input-current-limit-microamp",
 				       &pdata->iindpm_max);
 	if (ret)
-		pdata->iindpm_max = BQ25703_IINDPM_DEFAULT_UA;
+		pdata->iindpm_max = pdata->chip->default_iindpm_uA;
 
 	return 0;
 }

-- 
2.52.0

