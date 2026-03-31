Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E3423147
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971848; cv=none; b=GfIObQWGh3uS6kolaa+jJq8nJ9zvOH2Mzf1DCoGh3eRwbyM7dpQ83ORkoK3nAL/1jtAkVZyJdJrrU571rISXskKrgl4wzrjXSW9cBt1kEsDDbzkFyYSLYfsuHdQ88zSDE3VVIEWfaXkwEeUzcsw1eYH2ID81fgcJ4xZXYBcaTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971848; c=relaxed/simple;
	bh=K/K91eQQ75phcINLj4DBBQbD0ofWablCORf9BgG8obM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJ3mQ11lvmIa21hg5WXI0cpZrFPKR8J2BJrKO0ueX2OeyAJVQDnBxoT+3GkTNCDeEwlgTgzbs017ldp/f/sktTLDzzfOwRPSfR3nbb/HpMevysIEHgyVM52J0ihrR5Nwkx/jh0g5I3JsRoPmHI5SQFCPFPhXjQHk4ijiQBrrZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=cABwwynB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="cABwwynB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486ff201041so58037905e9.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774971845; x=1775576645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b97w0FIxP+iQSlY9+U8NDMrKZX5YXrCInQTxcuoNL8=;
        b=cABwwynBtz91HQQXT/PqabNqB0tswzybZM5KooRH9z1AxGGpZHl8q1fodnGBhoDQJ3
         zk4uMZ33EPZLLB7q9yPK5bGTSvh9M5IyeltMwCUrRAyhT/qGzCkBX0z+vx+sIzP/xx0l
         asyOx/ywrHqOKgu4Z5EPad0qSjEqOgtu6biVFicz6VdF5ti4Vla+4WDKnLZAvjJQYO9R
         WHmowSwsck+ehm5QrrnZyTW0fZIRG398JC3HSaLlDPddrnSLfsLdADIuA3oY63OopW/m
         4SBhO47MBKzseDp+VXVaiMhbBFJr9g+2IA6CK2fixrqj70WPHf6SPduDNTFZ3qQ6m+8A
         eQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971845; x=1775576645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8b97w0FIxP+iQSlY9+U8NDMrKZX5YXrCInQTxcuoNL8=;
        b=VN7oPXY+yKHtlu1HiCE6K/W9zj0G/uuxaIkCtDomCnl0YVyIHwzB0IvUrqavYC+jBh
         cE/frYccebkKjoWjKsENu63Kew6AGg4OJ6wqS1h/zBOPgZD2dL/NeYmdaOWNvp/i5L22
         Cv2oP/4oSDayj8+k4QGH42knjgmp9snRewA5qpYtC1meHcOgeyaWX4OcdUlYrKkrQWKp
         Ra5AvECDQugzHx/JHFDye0/qwunzGCwA6ZMgAryJglAS+gmXryBeuXuzvjyb15tdDaez
         UXDEnXcF59sSNvEQgQ6OhJdXRR9Uiz5CDcXOhW2Slj9fSrr9/yGhG87kvu6jWCY58NSa
         ioow==
X-Gm-Message-State: AOJu0YxURFvWY+mH3AJv4pKJkfJbmtdkaXJqCAXKW3CITAM0M4DUKgD6
	gvzhLxUG6xumhdmX/AR2B4h0Wrump1aTfjqYX0VIAQ3aD8DpasX6B0APypVIspOS484=
X-Gm-Gg: ATEYQzypVHZrV6xGFocNtHrViTeHcvGu11Zx+EI1u5Ld+vvE/x0Fs+QOxqjuDIBzrkm
	J3I+LDV47ZNuR9Lbpgo2PJv+aW7I/5Q/zo9Ty0IYCF6O2E019QFTSrcNxydY4lxiso+Q8LATJSq
	fgCAm19E6EBDFn4GfABQhZSoKBOMwJ+mT0Qask1kX+tb6l5h4LaW/1GixHdK/qEvs4nlqz9HL3G
	4J+5iw125DqjdaqNEPLGqPL2FloYVY1PAOGv8dve8XzgiPUpu9j1hDq6efMp7JX56Hi/6zp00Ct
	rq0KcH5oUcqLksU9mBzNDjWXcOebMJDMtzs/1y+yMX6+DNUOSyea3llqzZCJSUIX4fLkXC5ete/
	nF5FrooJN+XHDJUM8CmHWmlG6xXEKPJgRRM8IaY+5CA3KxcM/LW59CsyDiIwNswek1+6d+WWX2g
	66Fa9rjWulQjRCLnL5/wcLPE8ZALpPlD2lNI6w3eID+5MiUFR9F3HjXudUCjohB0J+/WTDkdD7E
	7jPHQ==
X-Received: by 2002:a05:600c:4f53:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48727ede47amr285030835e9.25.1774971845478;
        Tue, 31 Mar 2026 08:44:05 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm48412605e9.9.2026.03.31.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:05 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 19:43:44 +0400
Subject: [PATCH v6 07/11] power: supply: bq257xx: Consistently use indirect
 get/set helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-bq25792-v6-7-0278fba33eb9@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4242; i=alchark@flipper.net;
 h=from:subject:message-id; bh=K/K91eQQ75phcINLj4DBBQbD0ofWablCORf9BgG8obM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSefr1+UozjGbdn6i0TNpbc3npbND99gm+lRDTzgcszY
 j9X9x+Q7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqOecx/GZ5eHLud+NqkwvXFk6dtfPAzH1LGR0WMhQfzZq9R11l9vIdjAynPe4
 smT1xtX6F8eq1k6MnVKwM3qArO/U/f63lsS4Jj3+8AA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Move the remaining get/set helper functions to indirect calls via the
per-chip bq257xx_chip_info struct.

This improves the consistency of the code and prepares the driver to
support multiple chip variants with different register layouts and bit
definitions.

Tested-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq257xx_charger.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/bq257xx_charger.c b/drivers/power/supply/bq257xx_charger.c
index 39718223c3f9..0765673728e4 100644
--- a/drivers/power/supply/bq257xx_charger.c
+++ b/drivers/power/supply/bq257xx_charger.c
@@ -22,18 +22,30 @@ struct bq257xx_chg;
  * @bq257xx_hw_init: init function for hw
  * @bq257xx_hw_shutdown: shutdown function for hw
  * @bq257xx_get_state: get and update state of hardware
+ * @bq257xx_get_ichg: get maximum charge current (in uA)
  * @bq257xx_set_ichg: set maximum charge current (in uA)
+ * @bq257xx_get_vbatreg: get maximum charge voltage (in uV)
  * @bq257xx_set_vbatreg: set maximum charge voltage (in uV)
+ * @bq257xx_get_iindpm: get maximum input current (in uA)
  * @bq257xx_set_iindpm: set maximum input current (in uA)
+ * @bq257xx_get_cur: get battery current from ADC (in uA)
+ * @bq257xx_get_vbat: get battery voltage from ADC (in uV)
+ * @bq257xx_get_min_vsys: get minimum system voltage (in uV)
  */
 struct bq257xx_chip_info {
 	int default_iindpm_uA;
 	int (*bq257xx_hw_init)(struct bq257xx_chg *pdata);
 	void (*bq257xx_hw_shutdown)(struct bq257xx_chg *pdata);
 	int (*bq257xx_get_state)(struct bq257xx_chg *pdata);
+	int (*bq257xx_get_ichg)(struct bq257xx_chg *pdata, int *intval);
 	int (*bq257xx_set_ichg)(struct bq257xx_chg *pdata, int ichg);
+	int (*bq257xx_get_vbatreg)(struct bq257xx_chg *pdata, int *intval);
 	int (*bq257xx_set_vbatreg)(struct bq257xx_chg *pdata, int vbatreg);
+	int (*bq257xx_get_iindpm)(struct bq257xx_chg *pdata, int *intval);
 	int (*bq257xx_set_iindpm)(struct bq257xx_chg *pdata, int iindpm);
+	int (*bq257xx_get_cur)(struct bq257xx_chg *pdata, int *intval);
+	int (*bq257xx_get_vbat)(struct bq257xx_chg *pdata, int *intval);
+	int (*bq257xx_get_min_vsys)(struct bq257xx_chg *pdata, int *intval);
 };
 
 /**
@@ -490,22 +502,22 @@ static int bq257xx_get_charger_property(struct power_supply *psy,
 		break;
 
 	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
-		return bq25703_get_iindpm(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_iindpm(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
-		return bq25703_get_chrg_volt(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_vbatreg(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_CURRENT_NOW:
-		return bq25703_get_cur(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_cur(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		return bq25703_get_vbat(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_vbat(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
-		return bq25703_get_ichg_cur(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_ichg(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
-		return bq25703_get_min_vsys(pdata, &val->intval);
+		return pdata->chip->bq257xx_get_min_vsys(pdata, &val->intval);
 
 	case POWER_SUPPLY_PROP_USB_TYPE:
 		val->intval = pdata->usb_type;
@@ -633,9 +645,15 @@ static const struct bq257xx_chip_info bq25703_chip_info = {
 		.bq257xx_hw_init = &bq25703_hw_init,
 		.bq257xx_hw_shutdown = &bq25703_hw_shutdown,
 		.bq257xx_get_state = &bq25703_get_state,
+		.bq257xx_get_ichg = &bq25703_get_ichg_cur,
 		.bq257xx_set_ichg = &bq25703_set_ichg_cur,
+		.bq257xx_get_vbatreg = &bq25703_get_chrg_volt,
 		.bq257xx_set_vbatreg = &bq25703_set_chrg_volt,
+		.bq257xx_get_iindpm = &bq25703_get_iindpm,
 		.bq257xx_set_iindpm = &bq25703_set_iindpm,
+		.bq257xx_get_cur = &bq25703_get_cur,
+		.bq257xx_get_vbat = &bq25703_get_vbat,
+		.bq257xx_get_min_vsys = &bq25703_get_min_vsys,
 };
 
 /**

-- 
2.52.0

