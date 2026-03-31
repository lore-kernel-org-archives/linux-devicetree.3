Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F0421EE7
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971845; cv=none; b=q5dI74R7zh0JI//S2zlH9d7t1mrxiKKwVMv38ttxiyq1LXHslJBIIkQD2kzUZ0xfxkh2A9Dw3v+VKg2nk4Nla7L/oTOyLYKKsmtSyvAj++W2ayk+7Xh268hXcDM4GiFKsBXkm0+DUjr+X+QlFD1l3Rv6CxLEcDdgVMClqZcSF7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971845; c=relaxed/simple;
	bh=HoUkMd3aj0s9m5BRWarIKv4NrOIfktIuX7B1xZTtvpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTZTsyYbDI0/Q3+nHPtfL5c7I1HvfWAaOsNeQzJSuZru1RFdkUkqgRnO01fWUOgTY59S/cNa3Yob/4rR7MB+mgw3rN9VU1ikwaK9MQQPhnW79ONnC3ievf7dtnmxd7+fm+aJJb43Z2tr2Zungswq7r5ZYgtL1JXRN9/saDZ0x2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=IaCwYfwj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="IaCwYfwj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fb439299so54967485e9.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774971843; x=1775576643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv4k2NFngBv6AeWEv4O9srLSbI6EPVNmV51Qs0A5klE=;
        b=IaCwYfwjk+9pZGEcglvLOH5NCVKRXaON3jeepXBRTxclg4znbhHPyNPN5YNXkU7rj1
         XN46uQvriYKCQkHx7nLKAjmdraT7LVfU2Nb1K3rXA/YsSfHp20CPiD2ig2VqI8CbE/og
         k7mJR73eQPKeePq841wwX9a6cYORjmtW2e5OuIDqSMN4qzfNF39i9mB7y+kHOALBKpZF
         03pkeZ7xckk8nhMuS8nbSnbH0++YLb/ZAxDuwZJgDs8+yEPxvMPCz4EcFYPo0PWzbHd6
         75BSOAnoq7Xe8KzZRl86spW45IXM10q7mg9omYNywa1gWvyQx+NdiDxDNa8tuF6w3mqD
         Cqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971843; x=1775576643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jv4k2NFngBv6AeWEv4O9srLSbI6EPVNmV51Qs0A5klE=;
        b=B5hhuPd8tu+WV6kcklr1DrCdZmekDLX/WcomPn3q9wSPAqIDo8k69JOOMgT7kPoC+c
         tF5s6Q0VLTHmMaWcwV28GiQLG7ZvVqoRqz4nrL7zKPynP988pI5S8wVNcgQg0bCBYKBR
         QmYAkHSl5y22kYBQV6P9YZQ6qWBOIIzN6v4/1n60ROnOGcFlQKVZXJz0dEYJJKOB5jyk
         nZtIB7dNIeb2RR/5+zcH6wuGmGL5nRaVi5L8ohmf1biSjQ9YYNZR97WATGARcwa1hrKe
         bI2knAOTeVrkGsrsR+Vx+35+HBFGwfvoIsPMExGjMf2Q88Cm6RKuCXglPCtX9JXrfsev
         0d+g==
X-Gm-Message-State: AOJu0Yz8d/c/+eHYNfdn9qs7llC6stFfljPrS0FJxf1kRypFqdN/2MlV
	hPC/V6GubrQDQimaSzp4aeK8748zzojFY2ph7hZ7xUSlvGUDwtbzNplWqAhx5qkDA9Y=
X-Gm-Gg: ATEYQzzF6NPRA07SR8qR2VowEmXsczjJpd+EbSwn7xhn4x5l4q6FfWPDxYX0DYR12H+
	9M0FCwa80nCIIJBuRF5EDS+7SsYLjaV0fGRMcRYRMU2IvQyPZIxfHaRZosW9f53nvTQ789RpzjU
	JKmRjH3XHkEghjhHtIbq3vMEpQSTGgWHG4ipWc4EqUyH8TAmkbCaeJGe4bvKEjdBtLqiKdAjKR+
	7j7DmKZPpCyGlmYGWufM+MlGOBcR/EDI4TR9n+kVhLBLGrtiN+NsQA7Kz9tqSx6BhZmOOhkMASp
	BJqeyN8mr9Fj5H2onvJ9VAQm0YM8FDC60SmXdS7s9tX52sRprQB3712rkmgpFfSGUtvW9JaU6ic
	N8tA90UyIqseMLWmu0lO6ArYblN5QjM1zZIsxTBXeBuGhIfDo+wVsk+MqXcNet0VqJ4TpuE8MBI
	zvsK54hoAJc8jmLvvnRzhY31SReHYte94CyzkSWZVYg8V5UllIKqdsEx5iaB4Y7AUKaJu12PwgR
	DLSvg==
X-Received: by 2002:a05:600c:1d1e:b0:486:fc95:1a91 with SMTP id 5b1f17b1804b1-48727f2373dmr287944595e9.12.1774971842949;
        Tue, 31 Mar 2026 08:44:02 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm48412605e9.9.2026.03.31.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 19:43:43 +0400
Subject: [PATCH v6 06/11] power: supply: bq257xx: Make the default current
 limit a per-chip attribute
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-bq25792-v6-6-0278fba33eb9@flipper.net>
References: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
In-Reply-To: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
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
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSefr3ef0ttquypte31uzOPPijUa9PT2HKimnHdZVnRH
 0+ucm5e3zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrqGOsYMXBxCsBUJxgy/DOYdUY7yz5kzsZgxwXp0/L+vf1w7O3eBSWXNetnxHrc3X2ckWG3ouj
 vM+evmi9YI8x49ceKQKGJWy2m/YnJ+99caDdn9Q1WAA==
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

