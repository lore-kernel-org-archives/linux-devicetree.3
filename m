Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8F52BE55
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915279; cv=none; b=OGU5BA1/YLHu+ecRE41ZrdplKFIv9Jpl55ODMv6U2fQiq6gFnWEaGYQXoN07SSDYF13Of1zBMHWqbqUa1fY/ZUPetquDPgifAFbByZLycZ3lQYWr6XDmKph4+aHfsE5faP6/xlIUUFsNjx4i9AJ6NEjlJESQL4EJrf3iF4I+I5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915279; c=relaxed/simple;
	bh=IilKprHN+dkOEjDRUlnznoimt/1NPDWwCTswIfyM704=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQy54I3wYQcw2WcIcRVDS6LaNApdwkiSBDF/QmI2aPcw9UWI0pt9OOgeAUfXqFexCZwvCGCLl2QJPJRY8KOO6ZTPp6FUh333gVHyXzFmfXSjIA6oLkvT4KqOcbWhqWHdkI158zVD8nWRit6J6vHr6f1UczGO/cM3VS2NP4KPINE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1nc0XHX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1nc0XHX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so1746995e9.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915276; x=1792520076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEOhgVr/F+JRU2d8CsY4syExbw/P/EYoR8Pl4QIjlT8=;
        b=m1nc0XHXgkLE6lXXkNS475lfQqXitndV7rQ6/IqiHNBG/pAlIqlk+/0RrerG0ZcKr1
         vE3NvizWPHF1Na2bke1LXuMh29tWLpAsSs2JtyQxQi3J3KyJoZ4ts/sWvWodKaoJEsMX
         STHlXNl7oaz1v4jtEyfqsUXEtmZ78EoALZkgJU42UthmvjNrAaUDNvulWnFGwcyYnLvw
         8PM/AzxQe3Sebvt7gvuVGwFK9KNx6PVgwSYjrnQz5H0Zva4ocxo6D+wyaebGmrEI8AXQ
         rxpDAjsRVlliA1fIpZjJnKNA2AEI+WDX+3liiM3cz8cv6GrwYpwottKfmQsYqASmx6xm
         /vLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915276; x=1792520076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEOhgVr/F+JRU2d8CsY4syExbw/P/EYoR8Pl4QIjlT8=;
        b=ug5Mh2JbmstMhguIf7FmSosdRYqySFyLBtJwb30JYHsD0Gs2GEo7b5GTbbubmNy/od
         XMAKCEhn/Jspiy0HmaVtr6pfo8xHc5VFkA/vVJ1N//axns6k6T+v0Vja+JWXSp8pM5h4
         /mGhq4i+luqwm7tvLnXYvYzOFL0dGipveiqxnW0K69ZEVu43SVbGMhbF6bURyRUxhUe1
         TPM4AWn3Oj2PrPhf2I2wjAu1wnOqEpLYzpIEzCQ8zP7Le/+PhJFAM+VJslHqtNtFynyS
         Q6m0W9558Kwq6oN8i5yy1oIabEC3S6lTpcoLaTJ0yMustamYGkCNlP/+OCFHJGt7hh0V
         DKbw==
X-Forwarded-Encrypted: i=1; AKwUvBz+VSUqSsUcQoSt/RH8YfVis0sQijwFppZ0K78r9j2K8YPh5HcTzFJweK+FKw0GSpMJs1DEr1emHriL@vger.kernel.org
X-Gm-Message-State: AFq9FYIZme6lYDFJnnaMeRXQNYwY14h/eCcfLdYPEZc7DELvOznx87D9
	4yud/rH7Zqt0441ueedjWd6uYrkutPGczVlXWuMdTW7G+8c1pI3CVrjr
X-Gm-Gg: AYBFou1tQL4HB+45Uu0qG65NobxyutudoDdBh85XPavDJLgZO1s6tanUSm13mzz/bjg
	Dsj7yMQds5DsJGKNa1g0ztWrFUzh5Qb1Hr1+tuLkLNyCH4WEt8q2GBSms6Lpq6f3Mn7grECiU9l
	hNzoZTZ5sSIiS4wZBDnEv3eYyPViRtQDCYSsddum7bQ/mSpMPboo9WQ0GvQ+u18YQ9c6C2mcuzb
	UuWKlQPzTQmUqSc5IlNs7VKRPPBZBVRCfPjnSbbGrmrheGznRq93pJsEqLWpZK82eOYQraFt37s
	QwDM/EFdMoX0uyatkRojBD5L34o1RMbK7V4UILpUj/0T+Z/X6RnDyYaxc2xDiepQ5Bjioy6RWrn
	KGs9LY6ummXyWOHfUyLmW9wPbSP8toAG3GxJjiQvY6rvfOV9gwJOH0ZGrAnQUcBQXzBA0KGr7As
	rhpnEC+Yovt/McAWUx85B0RbyCdEM4JJuzRL6n46XGuc5jMeYtYlsSLH+Xe4gJ97Ydx16xMAeRV
	KuCgTx676XJiFaCr0E=
X-Received: by 2002:a05:600c:8106:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a18e4d683dmr248422635e9.25.1791915275771;
        Tue, 13 Oct 2026 11:14:35 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] regulator: lp872x: Remove redundant regmap wrappers
Date: Tue, 13 Oct 2026 21:14:14 +0300
Message-ID: <20261013181417.492252-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove lp872x_read_byte(), lp872x_write_byte(), and lp872x_update_bits()
helpers which are just wrappers around the same regmap helpers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 66 ++++++++++++--------------------------
 1 file changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 13dce4dcdbe14..1e16d7e8361a0 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -204,36 +204,10 @@ static const unsigned int lp8725_buck_uA[] = {
 	460000, 780000, 1050000, 1370000,
 };
 
-static int lp872x_read_byte(struct lp872x *lp, u8 addr, u8 *data)
-{
-	int ret;
-	unsigned int val;
-
-	ret = regmap_read(lp->regmap, addr, &val);
-	if (ret < 0) {
-		dev_err(lp->dev, "failed to read 0x%.2x\n", addr);
-		return ret;
-	}
-
-	*data = (u8)val;
-	return 0;
-}
-
-static inline int lp872x_write_byte(struct lp872x *lp, u8 addr, u8 data)
-{
-	return regmap_write(lp->regmap, addr, data);
-}
-
-static inline int lp872x_update_bits(struct lp872x *lp, u8 addr,
-				unsigned int mask, u8 data)
-{
-	return regmap_update_bits(lp->regmap, addr, mask, data);
-}
-
 static int lp872x_get_timestep_usec(struct lp872x *lp)
 {
 	enum lp872x_id chip = lp->chipid;
-	u8 val, mask, shift;
+	u32 val, mask, shift;
 	int *time_usec, size, ret;
 	int lp8720_time_usec[] = { 25, 50 };
 	int lp8725_time_usec[] = { 32, 64, 128, 256 };
@@ -255,7 +229,7 @@ static int lp872x_get_timestep_usec(struct lp872x *lp)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, LP872X_GENERAL_CFG, &val);
+	ret = regmap_read(lp->regmap, LP872X_GENERAL_CFG, &val);
 	if (ret)
 		return ret;
 
@@ -272,7 +246,7 @@ static int lp872x_regulator_enable_time(struct regulator_dev *rdev)
 	enum lp872x_regulator_id rid = rdev_get_id(rdev);
 	int time_step_us = lp872x_get_timestep_usec(lp);
 	int ret;
-	u8 addr, val;
+	u32 addr, val;
 
 	if (time_step_us < 0)
 		return time_step_us;
@@ -291,7 +265,7 @@ static int lp872x_regulator_enable_time(struct regulator_dev *rdev)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -313,9 +287,9 @@ static void lp872x_set_dvs(struct lp872x *lp, enum lp872x_dvs_sel dvs_sel,
 static u8 lp872x_select_buck_vout_addr(struct lp872x *lp,
 				enum lp872x_regulator_id buck)
 {
-	u8 val, addr;
+	u32 val, addr;
 
-	if (lp872x_read_byte(lp, LP872X_GENERAL_CFG, &val))
+	if (regmap_read(lp->regmap, LP872X_GENERAL_CFG, &val))
 		return 0;
 
 	switch (buck) {
@@ -324,7 +298,7 @@ static u8 lp872x_select_buck_vout_addr(struct lp872x *lp,
 			addr = (lp->dvs_pin == GPIOD_OUT_HIGH) ?
 				LP8720_BUCK_VOUT1 : LP8720_BUCK_VOUT2;
 		} else {
-			if (lp872x_read_byte(lp, LP8720_ENABLE, &val))
+			if (regmap_read(lp->regmap, LP8720_ENABLE, &val))
 				return 0;
 
 			addr = val & LP8720_DVS_SEL_M ?
@@ -369,7 +343,7 @@ static int lp872x_buck_set_voltage_sel(struct regulator_dev *rdev,
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask = LP872X_VOUT_M;
+	u32 addr, mask = LP872X_VOUT_M;
 	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
 
 	if (dvs && dvs->gpio)
@@ -379,21 +353,21 @@ static int lp872x_buck_set_voltage_sel(struct regulator_dev *rdev,
 	if (!lp872x_is_valid_buck_addr(addr))
 		return -EINVAL;
 
-	return lp872x_update_bits(lp, addr, mask, selector);
+	return regmap_update_bits(lp->regmap, addr, mask, selector);
 }
 
 static int lp872x_buck_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, val;
+	u32 addr, val;
 	int ret;
 
 	addr = lp872x_select_buck_vout_addr(lp, buck);
 	if (!lp872x_is_valid_buck_addr(addr))
 		return -EINVAL;
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -404,7 +378,7 @@ static int lp872x_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask, shift, val;
+	u32 addr, mask, shift, val;
 
 	switch (buck) {
 	case LP8720_ID_BUCK:
@@ -433,14 +407,14 @@ static int lp872x_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 	else
 		return -EINVAL;
 
-	return lp872x_update_bits(lp, addr, mask, val);
+	return regmap_update_bits(lp->regmap, addr, mask, val);
 }
 
 static unsigned int lp872x_buck_get_mode(struct regulator_dev *rdev)
 {
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
-	u8 addr, mask, val;
+	u32 addr, mask, val;
 	int ret;
 
 	switch (buck) {
@@ -460,7 +434,7 @@ static unsigned int lp872x_buck_get_mode(struct regulator_dev *rdev)
 		return -EINVAL;
 	}
 
-	ret = lp872x_read_byte(lp, addr, &val);
+	ret = regmap_read(lp->regmap, addr, &val);
 	if (ret)
 		return ret;
 
@@ -728,8 +702,8 @@ static int lp872x_init_dvs(struct lp872x *lp)
 {
 	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
 	enum gpiod_flags pinstate;
-	u8 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
-	u8 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
+	u32 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
+	u32 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
 
 	if (!dvs)
 		goto set_default_dvs_mode;
@@ -750,8 +724,8 @@ static int lp872x_init_dvs(struct lp872x *lp)
 	return 0;
 
 set_default_dvs_mode:
-	return lp872x_update_bits(lp, LP872X_GENERAL_CFG, mask[lp->chipid],
-				default_dvs_mode[lp->chipid]);
+	return regmap_update_bits(lp->regmap, LP872X_GENERAL_CFG, mask[lp->chipid],
+				  default_dvs_mode[lp->chipid]);
 }
 
 static int lp872x_hw_enable(struct lp872x *lp)
@@ -786,7 +760,7 @@ static int lp872x_config(struct lp872x *lp)
 	if (!pdata || !pdata->update_config)
 		goto init_dvs;
 
-	ret = lp872x_write_byte(lp, LP872X_GENERAL_CFG, pdata->general_config);
+	ret = regmap_write(lp->regmap, LP872X_GENERAL_CFG, pdata->general_config);
 	if (ret)
 		return ret;
 
-- 
2.53.0

