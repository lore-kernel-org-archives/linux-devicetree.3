Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668F367F33
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261495; cv=none; b=RW5c6DcIQTSGE6p13jm1lpwThl9GQiGlzHgnJn1H8kJYxVzVlDql/mneEyLAlnYFAyfdABiJTwTdNu0y3plEeZeLAbUA+EgKJGWKYyI1uP7E5bxey7xgCuazqOMzQbkjY49/zVRCJCIg2gP+VdAeLRf398hZQD70/Ljvjafq544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261495; c=relaxed/simple;
	bh=m8RlGgwURyICt4aQmcsLHhrwNopwUAIPa5Y88JK2eEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmbyYd6EtHG14DcxHNkf3AMWXyKfLjlCxXfgtvq9vefJwOqYe8Al7w1c+3HHk+WqSqwD9D04WFECbEd725C607DKsehROq83iR8zZdBTTcYLDzTLlM5Tph0FRJJJye5aGDjFmlTbygytMfF9bbZd4VhyJuEgtl8yi0bEGYF3TrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qokvMuaj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qokvMuaj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2ea1b3962so55432625ad.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 20:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261491; x=1777866291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=qokvMuajAOpzl26J9X6XYx+S01mVCKDdnmCS3nEbLfpkn3oNG017cUAmeUXmSKCotx
         FpcVMKl+zZ4ZykBiuk9C601KcjNBzDZbsHqUt6e+ZnAqv3SCAzOu9gK534jyjtHI3AI+
         CyYcStlv0V2c47jrEYyarsSek1Grcd40iLn3JCkXRt6uKMrbLhiECQHNG4hwj5o2p/0R
         onaU41IYKuyaa5hg3tPAUnj8DV+Apm8lwBcE5wy4yB2i2lmm2cHD9PHy3bw78XLKvoan
         azr2HpOv9nN3nNu9YpiSz7/7uJjJz34YwuR3oSrdvvJmGvVvvqNnuVNuEfHoG1wB2tig
         z2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261491; x=1777866291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7US79DzYi1oz6JsAlo7MAoEcS/s37RIVJeKWp9La9I=;
        b=haQHrh2eZeNFlPfePr1PDRlAWmin9MDCQ79YehS8ofHXajffKVFCcLglHX21c74jA+
         eHJ6cUwHp12X/dqNab0OsWSZtdhzDMzJZ5dpL6a/k9CRSpEv7l98I/JarbJmxak4jv4g
         Y6HY977QKwT8LUYYf2eX7LqkrplkjktW+7CMiUpMFiAjGNCaGeSATUoMIK26DBhlGwqz
         pbRDlw6Sm1ley3p6NWE7P2D6xZaLt3pchz+MAc4oyUDVAGuiAgxH4RAPkafobVEqvgv4
         O/BNNYuaNA7vRZzVjoYXUbfVri+/489jrLowXwfljoQxZ7QTXsheD08dJQBUzzvajGku
         TDeg==
X-Gm-Message-State: AOJu0Yz5P9atEyGHBsfW7lnZzDo/H/1q3wd30mW5jNPUbh+GbiLiGjCM
	6Oi4+VYcgNQmnOEL5ggTpRJbOld+e3d7bdl7T8LPa3V/ha+oYvgHU6Xrrw1LAQ==
X-Gm-Gg: AeBDievDXXb1fov9ba1kUOYri/IXxPYImyDwLT0i67CL2Rp9fh/KG0ZvvLxlovupdrh
	m6Ss+DVeUXVa0MgC8aj0e7gzLl5tBAWP49a9r26kpQjQqHzf5dZRUyPsFynbFjwzivTqlhy6sLT
	pGfOJ3QiCOKUPKBjLXS2Z22nyQh8VolY8OedOeGex+IPH6Vr+mfoT/NCkDWVMr5FfFX5O9Ty+Ij
	zAnw0rImcS3nzR00sm/wIJF84EgOX/Gy1cTGjZCYv+H6SvCP6pWGmmbphNiOVB86eJgLg4WDhfS
	uDmD9ZcC9v6RVjoPZWZUM9/nWFHhbgPyMv3y8NnAnxxEZVWphupUl1TQKPHNu5h3A0odU32IX6y
	kRUMdRnZl8/MprAS9r+aSeBSLIOFyNfM+G4e+XHv+VmvocxNNKBgsBWIJvjykxlUECdNcB0uXQX
	5gCUJxTlQcXae/R8DzRY+qlGaTzPtxw/AkYTSQMoeFtXrnQUN5gpgAITg3XfRXTF39sI39Sj2wu
	YbdXN3vZrLGXEjR3lc38/7dgA==
X-Received: by 2002:a17:903:32c9:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b5f9fa70e1mr428464165ad.27.1777261491168;
        Sun, 26 Apr 2026 20:44:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Date: Sun, 26 Apr 2026 20:44:27 -0700
Message-ID: <20260427034427.881389-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034427.881389-1-rosenp@gmail.com>
References: <20260427034427.881389-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt76_get_of_data_from_mtd has been replaced by
mt76_get_of_data_from_nvmem in all usages.

Remove it to prevent people from using the deprecated
mediatek,mtd-eeprom binding.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 3 files changed, 92 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index afdb73661866..092804323d81 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 	return 0;
 }
 
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
-{
-#ifdef CONFIG_MTD
-	struct device_node *np = dev->dev->of_node;
-	struct mtd_info *mtd;
-	const __be32 *list;
-	const char *part;
-	phandle phandle;
-	size_t retlen;
-	int size;
-	int ret;
-
-	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
-	if (!list)
-		return -ENOENT;
-
-	phandle = be32_to_cpup(list++);
-	if (!phandle)
-		return -ENOENT;
-
-	np = of_find_node_by_phandle(phandle);
-	if (!np)
-		return -EINVAL;
-
-	part = of_get_property(np, "label", NULL);
-	if (!part)
-		part = np->name;
-
-	mtd = get_mtd_device_nm(part);
-	if (IS_ERR(mtd)) {
-		ret =  PTR_ERR(mtd);
-		goto out_put_node;
-	}
-
-	if (size <= sizeof(*list)) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	offset += be32_to_cpup(list);
-	ret = mtd_read(mtd, offset, len, &retlen, eep);
-	put_mtd_device(mtd);
-	if (mtd_is_bitflip(ret))
-		ret = 0;
-	if (ret) {
-		dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\n",
-			part, ret);
-		goto out_put_node;
-	}
-
-	if (retlen < len) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
-
-	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
-		u8 *data = (u8 *)eep;
-		int i;
-
-		/* convert eeprom data in Little Endian */
-		for (i = 0; i < round_down(len, 2); i += 2)
-			put_unaligned_le16(get_unaligned_be16(&data[i]),
-					   &data[i]);
-	}
-
-#ifdef CONFIG_NL80211_TESTMODE
-	dev->test_mtd.name = devm_kstrdup(dev->dev, part, GFP_KERNEL);
-	if (!dev->test_mtd.name) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
-	dev->test_mtd.offset = offset;
-#endif
-
-out_put_node:
-	of_node_put(np);
-	return ret;
-#else
-	return -ENOENT;
-#endif
-}
-EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
-
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len)
 {
@@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int len)
 	if (!ret)
 		return 0;
 
-	ret = mt76_get_of_data_from_mtd(dev, eep, 0, len);
-	if (!ret)
-		return 0;
-
 	return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..f447ecac664d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 int mt76_eeprom_override(struct mt76_phy *phy);
-int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len);
 int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
 				const char *cell_name, int len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..c24e1276700b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
 
 	offs = is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
 
-	ret = mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
-	if (!ret)
-		return ret;
-
 	ret = mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", size);
 	if (!ret)
 		return ret;
-- 
2.54.0

