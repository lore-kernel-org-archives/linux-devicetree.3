Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916E13EE1F6
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352328; cv=none; b=oJ0hSPmJ1/ohh6Ejk11l3W8Eho1luV0CdqPLeZ/BB+FkbdHyUOUvmnXJddNp/pyxP5ycw/9Svy23gmY/zWEI0rWbZ4HAyHw1OolDIUV0BVLFNDqWSwAmKuFzLP966KTopwNI8KOYkM3oBqaOEjcL6J0wnAI6MpjEL83qlCluq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352328; c=relaxed/simple;
	bh=xDe5OwkC59HG0l6E9h1OwEErzx9ysv39/KByzvSAFgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A30tEiejkFtu03VlCP2hHBftekQZwe2vqIsJcSww3uXbUiAxH28qhRsPEdSZOjfh7pv2ABldru6v/+axcf86dCQQBPswfCgjFf6+tZ0/LLGXCl5Tm3P6yfqr+SYgD2dPdojgwgZjrgz+REKDel6NuxFSARSM6U6nPUoGm34tYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=vYz0qjw1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="vYz0qjw1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso34473435e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352325; x=1774957125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AEOePYJtU4kn4mkWQfK7NUJrP7JZP+VFvVN1gskxyo=;
        b=vYz0qjw1Qb3eigahsHUowHZCtHmucwme8mlhLI3BadP14N903BB+xohcWNIuE/mqtN
         twIfNLwZ/9YHSKHKOeS2A5xQd3fMsLJRf5glwJTUb3AQyYqk9aWf/1XSQq/lIRRWw8Bv
         n3g9ar3GdBEohYsaZKv4v+ig6b8XpYqbAW21WktREp6OqQPDqk3bUmTPy5wn416Jp69v
         297cZ5nm96GC+eOVP6T51XdiSyyQtD5STwSqbWB/x07P5nMQJOxO3xW2Qj6ew74Oehuc
         DuQ6Pt55pii3b+Px9r8A59B3gMsPhe+a1KHZAT0G3IV1PX12N7vr/v1tMs1jp3jK0y15
         gQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352325; x=1774957125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3AEOePYJtU4kn4mkWQfK7NUJrP7JZP+VFvVN1gskxyo=;
        b=CkY/J58TNo4TmqUXGohxSvsXiwr+4l7+2j+qNnEFyj6V9ZCOv4tq25YzcGj5WC7QEp
         iC8yi91NizusDhFbh6E9SN+UnSdZNFg4Xjcf/6Wc87gGfP0tCAK/RRCRMoEOkalwLh9P
         QquybZUhfMzPUg0dIMFJvT5yIL2Oim168HLqt/DbPOcbQeRyKiwgafLf1BgaS4cxZvVN
         OLmBZq3ak2XeI7E/Y2ZU0fpZg2aOPTuOisTWLzskT1SRVFwPYkZ4VWT664/2PkIRx/ht
         yKhliClxFDNklWQSnbNGclCA25OK2xZC6eCN65b1LOJRXcxgWCP0VLl4rXrTGX3LNU/b
         ostw==
X-Gm-Message-State: AOJu0YzQdSGV70fBKibzvJ38MHn+QVkHYyQnR63jO4pbcsU/LZ531a/J
	CdwaGYc1X841bf++/EINp1tYbYGV0c8OQwYlIxE8lMQk+vuZrwN3BjxoKiPxRWP1k6U=
X-Gm-Gg: ATEYQzwKaO3+QVANnsrTqYrRF+teDn9F3jnIG2JMCjlzFjRanDs74y92DeZqBK11Chk
	0endZW4eButdN+8kyU63IeZNpWXFsVMgSK4wq8le5CSkRSh0Vlldx8NDlp/LH7p+MMZMQrgjDcy
	gCyzua1W4WwBk0nCKf4hQ1zlrzmYeV1m1+qPDecmS1i9iiPGx8PZB3n/NXjzorJ7s7fbUI4G+9C
	VnUs/nduQe/kCMVGWpUQ3WIHfisrivx7WWzA82Ra3UDzuG/OuIDtF/qZeTGA90VAchAzaIzKUga
	QBTK96/VUk5Y5G9k0pjimlKD28G9V3TwgQiY2Ry3rGQvfN3waH55ksjnJkWWiSVNhcbQiOerYD5
	i9R01YieWvIwLQUaud36o+U6YyCE9ETHiVMzbkCUdS5ZT+rHLXcXcxa6xraJs+kUWHpCr908XEh
	UBqq8wcyNqkR1zOssF/EZ/6PdRu+8U5tCgcaO7Z1YrycxIQFMMEgn3yjl2pHorDVSeQ9J6qeI1B
	oWEfw==
X-Received: by 2002:a05:600c:3b07:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486fedab40emr213637765e9.6.1774352325006;
        Tue, 24 Mar 2026 04:38:45 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:44 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Mar 2026 15:38:13 +0400
Subject: [PATCH v5 08/11] power: supply: bq257xx: Add fields for 'charging'
 and 'overvoltage' states
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-bq25792-v5-8-0a2eb58cf11d@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3105; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xDe5OwkC59HG0l6E9h1OwEErzx9ysv39/KByzvSAFgU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl/78v5FrW3Z0yIrZLIlf7oFrWm6vHcJ2/xOQ6OIh
 ZOyeFO7OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 Q0MdYx0jBi5OAZhqyQRGho2zmHwjJEP59j2dujnAxM25s9SquE35MsO0nyuqndhOiTL8r2q/Fi1
 iv7Y9UPXVO9Y9ZtuO1Hzo3jExf/KhurJbkXxveQE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver currently reports the 'charging' and 'overvoltage' states based
on a logical expression in the get_charger_property() wrapper function.
This doesn't scale well to other chip variants, which may have a different
number and type of hardware reported conditions which fall into these
broad power supply states.

Move the logic for determining 'charging' and 'overvoltage' states into
chip-specific accessors, which can be overridden by each variant as
needed.

This helps keep the get_charger_property() wrapper function chip-agnostic
while allowing for new chip variants to be added bringing their own logic.

Tested-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq257xx_charger.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/bq257xx_charger.c b/drivers/power/supply/bq257xx_charger.c
index 0765673728e4..9c082865e745 100644
--- a/drivers/power/supply/bq257xx_charger.c
+++ b/drivers/power/supply/bq257xx_charger.c
@@ -54,8 +54,10 @@ struct bq257xx_chip_info {
  * @bq: parent MFD device
  * @charger: power supply device
  * @online: charger input is present
+ * @charging: charger is actively charging the battery
  * @fast_charge: charger is in fast charge mode
  * @pre_charge: charger is in pre-charge mode
+ * @overvoltage: overvoltage fault detected
  * @ov_fault: charger reports over voltage fault
  * @batoc_fault: charger reports battery over current fault
  * @oc_fault: charger reports over current fault
@@ -71,8 +73,10 @@ struct bq257xx_chg {
 	struct bq257xx_device *bq;
 	struct power_supply *charger;
 	bool online;
+	bool charging;
 	bool fast_charge;
 	bool pre_charge;
+	bool overvoltage;
 	bool ov_fault;
 	bool batoc_fault;
 	bool oc_fault;
@@ -106,8 +110,10 @@ static int bq25703_get_state(struct bq257xx_chg *pdata)
 	pdata->online = reg & BQ25703_STS_AC_STAT;
 	pdata->fast_charge = reg & BQ25703_STS_IN_FCHRG;
 	pdata->pre_charge = reg & BQ25703_STS_IN_PCHRG;
+	pdata->charging = pdata->fast_charge || pdata->pre_charge;
 	pdata->ov_fault = reg & BQ25703_STS_FAULT_ACOV;
 	pdata->batoc_fault = reg & BQ25703_STS_FAULT_BATOC;
+	pdata->overvoltage = pdata->ov_fault || pdata->batoc_fault;
 	pdata->oc_fault = reg & BQ25703_STS_FAULT_ACOC;
 
 	return 0;
@@ -478,14 +484,14 @@ static int bq257xx_get_charger_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_STATUS:
 		if (!pdata->online)
 			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
-		else if (pdata->fast_charge || pdata->pre_charge)
+		else if (pdata->charging)
 			val->intval = POWER_SUPPLY_STATUS_CHARGING;
 		else
 			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
 		break;
 
 	case POWER_SUPPLY_PROP_HEALTH:
-		if (pdata->ov_fault || pdata->batoc_fault)
+		if (pdata->overvoltage)
 			val->intval = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
 		else if (pdata->oc_fault)
 			val->intval = POWER_SUPPLY_HEALTH_OVERCURRENT;

-- 
2.52.0

