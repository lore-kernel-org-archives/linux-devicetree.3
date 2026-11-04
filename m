Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795856;
	b=GcumdR3dppBOkm/MpL6bALIHLLGcBuX7kvDB+J4QWf8DzYn7oZGSuyMoN4Pkeu+5UJPP
	 5yovym0Nd/EyXLClSz1aRjoq5HWqC6JT9gAk2DHwUI+MGHwRZUfFTuKKPzWf1oJ0NVRTX
	 51fOIbdl/Zx+xMnWVIs2JAqBuKhLcAtf7Vhs1dKngvopsQ0CZ9rHeXTs14yEiGE1EDsOj
	 rMJAlnrwBvvJJwsYV36ELRKLyw4TU8XXiK0R/d8gs2NZxohol1v02WUinOXG7jdBJqJYM
	 UfDqXS8x40fFXPt0XwbblNd3y/Vh7NMq/wFy1g5KrFNgo2Ko4BCjD2+PbVSFatZZm9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TN0Dl3OGarOlCBw81Tse2I1+1CweuxUpHwiihXspO4U=;
	b=G2g2DO0kN24yIRkCIhbjKgDm/owogokIinUlnU0zFPCNsZycmg3+wdUVoaYP4orEwueY
	 aFGpnb5j9AbkjxU51PlRniIyGiBRVJLNR/n4K+oyVTIbXbC//Ipgd7KZs25gcMW7neCqe
	 P2C0woLA9z/QiJt/b35/Jufcg7jS+R4NI4Ibf7R1i0YsWlFVRzHmnJu5tKh3rfAVH1ITG
	 DjJ14ky+TpxmE5LAysAwOsmyg5VOrIdBK+04Er50F+Eje68Gu5hb8PSjwAKMqsBWeDcb9
	 WflZU6pxmaEYvJ8Zdv7IbvGRoJB+0I0hWFwBnUrO3gJEVoqUhs5TX/KLTtWXipAtHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdSp9nHx;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F3606A334
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297F3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GdSp9nHx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3868445e9.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795854; x=1794400654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TN0Dl3OGarOlCBw81Tse2I1+1CweuxUpHwiihXspO4U=;
        b=GdSp9nHxJgcQbtLUMA6tRqITDOsAIp74efAFjp3c1A/DYPQ6tQbppbkq2RMgr2/gYK
         Qp3/ER9KIG3x5qkkMPfyCvB4+6xEm0eOfenIFERgYvwKtXuisySgLgDuBeToL2gGVvb1
         uy3xHHZYY9xXRx4yOtqjix4q4KFBiDWxgnzBGzMOL3lBAWcwvZvD7whm161g8vH0puKD
         crhWR3fJ0+bacXG5U1l6bXOZoqfzAKAWumCZ3CJzX/AbqT7Wg5CbX7A9M0CBOOrI57gT
         woKnYc08KpXr2QtPeFQo9myhruQikgPy1O9UI2MITkkowJcDSnbv+fZebBRpt0qmKd4R
         t42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795854; x=1794400654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TN0Dl3OGarOlCBw81Tse2I1+1CweuxUpHwiihXspO4U=;
        b=DWCCPO0sqhW4WcQNcUfEJ5awrufYjSZOwh3LP9+pO7F/1WEonrjQcMu4DuUyWJm7Or
         mkJkNpdS2V63zaItq/5vfd6May4e0J2jqe2xUDJDXvtzNvYUybMGryIrDtH+iv9xHnFb
         f2pyau3eKUHDa51vkhrmLIGq8a8rsZHa8fhc/Pqm7fScyfr0jjb3eBL+XzWJ01ajVp96
         +BWJvDL852YqStTG2RN4ZcfObTBd2buqpEQ7f0wImlPplfZpMTng62u+84rkpHOSTorO
         H+eL81u/5J6+z6A3RinxDxtN83My/27VwZTANNNCd9xWxyu4yNN4nRk7v5QpniDGmGrt
         ASOw==
X-Forwarded-Encrypted: i=1; AKwUvBw0QKNAv4EUbOUVBKVSSufAyqLaxSNb8OnZkcG1tx7HRJcQTs3zZCCmOpGRbnf6Yx48IqUcqe70UFFr@vger.kernel.org
X-Gm-Message-State: APuU4Z9csXd87UesxuRSRB8x2ArPrpMa++wJ0X7Z/d6CNqmL0SdIPGro
	XxZFA5yiGsF81aHrlU8lSLkCLaJHSMOdC8gn/TZ6Td86LlUDUvpqw9XsX8fCwA==
X-Gm-Gg: AYBFou0+Iint7Xru/vwxZm/g0sfUm5CoDLLD/cBhogji4Lf/m0ekMzWURV75XLvz0J/
	tj6pA+MRNYpnicDHgAMoFB2IsYelmL2Nn0fcXNqtJCQOsLu/Xj0OEo/K1FDA44nkBu+XkC+SDVz
	g+sBZ54WcoFfHG2IzQ8QHCRnL9/MKszpb47Aoaj46o3UspYLtc/cy84r2turtDEVh7VkSS5XsTr
	9eDYB4Kuwdoy+Rc5samWVs7bGdimbeqcaHQhSxvX9ZWRiPLOElN7L0EBSybFv5S8h8LVFjfiVBL
	TLRmdvA70M6p4NFQwZHPeEyzYIGvteEpBfYBICXEjI+E5rbDIRCaRJip1x3kTVYxcy1akHugVEN
	k0NGewQTgvp1kgEruFMUy4S6p+M0sGe8zMvlHtUx1JptnjFtkhnr7VnirZb5cmUGcO23301cdVA
	HVrBxA0Ew0UzOxuWIWSLGroD6sgh8AcpeTHkGnlIJqL8nW8RiAkk3Ev7eBvZ0LvdfrDg9VzASwM
	lwomAPPOjQ5AXAXt6FcwLcfgZMu2Qul0MQad2fWrdBGE4uvenPFw7cS1twmBlQo8PZIDQmyzsHH
	NTbli2PeJgs4eGwLioCTurlrREClG6JHmADayJf85O4gaDsq/Q==
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr358456755e9.19.1793795854236;
        Wed, 04 Nov 2026 04:37:34 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/4] mfd: aat2870: Convert to use OF bindings
Date: Wed,  4 Nov 2026 14:37:13 +0200
Message-ID: <20261104123714.234634-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conversion of the AAT2870 driver to use OF bindings requires a few complex
changes that should be done simultaneously.

The AAT2870 essentially provides two functions via child devices:
backlight and regulators. Both functions are fairly self-sufficient and
may not be populated on the final board. Consequently, the MFD
registration API was replaced with of_platform_populate(), and each
sub-device was given its own compatible string.

Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
was converted to use modern gpiod/OF helpers, allowing the redundant
aat2870_enable() and aat2870_disable() helpers to be removed.

The aat2870-regulator driver was updated to register each of the four LDOs
from a dedicated OF node using modern regulator framework.

The aat2870-backlight driver was changed to populate all required
properties from a dedicated Device Tree node. Its channel map was updated
to use u8 instead of int. Furthermore, because the maximum current is now
parsed as an absolute value rather than an enum entry, the calculation and
application of the maximum current were updated accordingly.

All of the changes above allow platform data to be removed entirely.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 128 +++++----------------
 drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
 drivers/video/backlight/aat2870_bl.c  |  51 +++++----
 include/linux/mfd/aat2870.h           |  95 +--------------
 4 files changed, 127 insertions(+), 306 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 0d56cd6fbc6a5..6b1040c65373f 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -6,17 +6,23 @@
  * Author: Jin Park <jinyoungp@nvidia.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/debugfs.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/i2c.h>
 #include <linux/delay.h>
-#include <linux/gpio/legacy.h>
-#include <linux/mfd/core.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
+#include <linux/of_platform.h>
 #include <linux/regulator/machine.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+struct aat2870_register {
+	bool readable;
+	bool writeable;
+	u8 value;
+};
 
 static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	/* readable, writeable, value */
@@ -61,34 +67,6 @@ static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
 	{ 0, 1, 0x00 },	/* 0x26 AAT2870_LDO_EN */
 };
 
-static struct mfd_cell aat2870_devs[] = {
-	{
-		.name = "aat2870-backlight",
-		.id = AAT2870_ID_BL,
-		.pdata_size = sizeof(struct aat2870_bl_platform_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOA,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOB,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOC,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-	{
-		.name = "aat2870-regulator",
-		.id = AAT2870_ID_LDOD,
-		.pdata_size = sizeof(struct regulator_init_data),
-	},
-};
-
 static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *val)
 {
 	int ret;
@@ -196,22 +174,6 @@ static int aat2870_update(struct aat2870_data *aat2870, u8 addr, u8 mask,
 	return ret;
 }
 
-static inline void aat2870_enable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 1);
-
-	aat2870->is_enable = 1;
-}
-
-static inline void aat2870_disable(struct aat2870_data *aat2870)
-{
-	if (aat2870->en_pin >= 0)
-		gpio_set_value(aat2870->en_pin, 0);
-
-	aat2870->is_enable = 0;
-}
-
 #ifdef CONFIG_DEBUG_FS
 static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *buf)
 {
@@ -332,9 +294,7 @@ static inline void aat2870_init_debugfs(struct aat2870_data *aat2870)
 
 static int aat2870_i2c_probe(struct i2c_client *client)
 {
-	struct aat2870_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct aat2870_data *aat2870;
-	int i, j;
 	int ret = 0;
 
 	aat2870 = devm_kzalloc(&client->dev, sizeof(struct aat2870_data),
@@ -348,60 +308,27 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
-	if (pdata->en_pin < 0)
-		aat2870->en_pin = -1;
-	else
-		aat2870->en_pin = pdata->en_pin;
+	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(aat2870->en_pin))
+		return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pin),
+				     "Failed to get EN GPIO\n");
 
-	aat2870->init = pdata->init;
-	aat2870->uninit = pdata->uninit;
 	aat2870->read = aat2870_read;
 	aat2870->write = aat2870_write;
 	aat2870->update = aat2870_update;
 
 	mutex_init(&aat2870->io_lock);
 
-	if (aat2870->init)
-		aat2870->init(aat2870);
-
-	if (aat2870->en_pin >= 0) {
-		ret = devm_gpio_request_one(&client->dev, aat2870->en_pin,
-					GPIOF_OUT_INIT_HIGH, "aat2870-en");
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"Failed to request GPIO %d\n", aat2870->en_pin);
-			return ret;
-		}
-	}
-
-	aat2870_enable(aat2870);
-
-	for (i = 0; i < pdata->num_subdevs; i++) {
-		for (j = 0; j < ARRAY_SIZE(aat2870_devs); j++) {
-			if ((pdata->subdevs[i].id == aat2870_devs[j].id) &&
-					!strcmp(pdata->subdevs[i].name,
-						aat2870_devs[j].name)) {
-				aat2870_devs[j].platform_data =
-					pdata->subdevs[i].platform_data;
-				break;
-			}
-		}
-	}
-
-	ret = mfd_add_devices(aat2870->dev, 0, aat2870_devs,
-			      ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
-		goto out_disable;
+	ret = devm_of_platform_populate(&client->dev);
+	if (ret) {
+		gpiod_set_value_cansleep(aat2870->en_pin, 0);
+		return dev_err_probe(&client->dev, ret, "Failed to populate cells\n");
 	}
 
 	aat2870_init_debugfs(aat2870);
 
 	return 0;
-
-out_disable:
-	aat2870_disable(aat2870);
-	return ret;
 }
 
 static int aat2870_i2c_suspend(struct device *dev)
@@ -409,7 +336,7 @@ static int aat2870_i2c_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct aat2870_data *aat2870 = i2c_get_clientdata(client);
 
-	aat2870_disable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 0);
 
 	return 0;
 }
@@ -421,7 +348,7 @@ static int aat2870_i2c_resume(struct device *dev)
 	struct aat2870_register *reg = NULL;
 	int i;
 
-	aat2870_enable(aat2870);
+	gpiod_set_value_cansleep(aat2870->en_pin, 1);
 
 	/* restore registers */
 	for (i = 0; i < AAT2870_REG_NUM; i++) {
@@ -436,6 +363,12 @@ static int aat2870_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
 				aat2870_i2c_resume);
 
+static const struct of_device_id aat2870_match_table[] = {
+	{ .compatible = "skyworks,aat2870" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_match_table);
+
 static const struct i2c_device_id aat2870_i2c_id_table[] = {
 	{ "aat2870" },
 	{ }
@@ -444,6 +377,7 @@ static const struct i2c_device_id aat2870_i2c_id_table[] = {
 static struct i2c_driver aat2870_i2c_driver = {
 	.driver = {
 		.name			= "aat2870",
+		.of_match_table		= aat2870_match_table,
 		.pm			= pm_sleep_ptr(&aat2870_pm_ops),
 		.suppress_bind_attrs	= true,
 	},
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 970d86f2bbb81..73b6d06858cff 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -15,73 +15,74 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/aat2870.h>
-
-struct aat2870_regulator {
-	struct aat2870_data *aat2870;
-	struct regulator_desc desc;
-
-	u8 enable_addr;
-	u8 enable_shift;
-	u8 enable_mask;
-
-	u8 voltage_addr;
-	u8 voltage_shift;
-	u8 voltage_mask;
+#include <linux/regulator/of_regulator.h>
+
+#define AAT2870_LDO_AB_A_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_AB_B_MASK    GENMASK(3, 0)
+#define AAT2870_LDO_CD_C_MASK    GENMASK(7, 4)
+#define AAT2870_LDO_CD_D_MASK    GENMASK(3, 0)
+
+/* Device IDs */
+enum aat2870_regulator_id {
+	AAT2870_ID_LDOA,
+	AAT2870_ID_LDOB,
+	AAT2870_ID_LDOC,
+	AAT2870_ID_LDOD
 };
 
 static int aat2870_ldo_set_voltage_sel(struct regulator_dev *rdev,
 				       unsigned selector)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->voltage_addr, ri->voltage_mask,
-			       selector << ri->voltage_shift);
+	return aat2870->update(aat2870, rdesc->vsel_reg, rdesc->vsel_mask,
+			       (selector << __ffs(rdesc->vsel_mask)) & rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->voltage_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->vsel_reg, &val);
 	if (ret)
 		return ret;
 
-	return (val & ri->voltage_mask) >> ri->voltage_shift;
+	return (val & rdesc->vsel_mask) >> __ffs(rdesc->vsel_mask);
 }
 
 static int aat2870_ldo_enable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask,
-			       ri->enable_mask);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask,
+			       rdesc->enable_mask);
 }
 
 static int aat2870_ldo_disable(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 
-	return aat2870->update(aat2870, ri->enable_addr, ri->enable_mask, 0);
+	return aat2870->update(aat2870, rdesc->enable_reg, rdesc->enable_mask, 0);
 }
 
 static int aat2870_ldo_is_enabled(struct regulator_dev *rdev)
 {
-	struct aat2870_regulator *ri = rdev_get_drvdata(rdev);
-	struct aat2870_data *aat2870 = ri->aat2870;
+	struct aat2870_data *aat2870 = rdev_get_drvdata(rdev);
+	const struct regulator_desc *rdesc = rdev->desc;
 	u8 val;
 	int ret;
 
-	ret = aat2870->read(aat2870, ri->enable_addr, &val);
+	ret = aat2870->read(aat2870, rdesc->enable_reg, &val);
 	if (ret)
 		return ret;
 
-	return val & ri->enable_mask ? 1 : 0;
+	return (val & rdesc->enable_mask) >> __ffs(rdesc->enable_mask);
 }
 
 static const struct regulator_ops aat2870_ldo_ops = {
@@ -101,84 +102,60 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	3000000, 3100000, 3200000, 3300000,
 };
 
-#define AAT2870_LDO(ids)				\
-	{						\
-		.desc = {				\
-			.name = #ids,			\
-			.id = AAT2870_ID_##ids,		\
-			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
-			.volt_table = aat2870_ldo_voltages, \
-			.ops = &aat2870_ldo_ops,	\
-			.type = REGULATOR_VOLTAGE,	\
-			.owner = THIS_MODULE,		\
-		},					\
-	}
+#define AAT2870_LDO(ids, match, vsel, vmask) {		\
+	.name = #ids,					\
+	.of_match = (match),				\
+	.id = AAT2870_ID_##ids,				\
+	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
+	.volt_table = aat2870_ldo_voltages,		\
+	.ops = &aat2870_ldo_ops,			\
+	.type = REGULATOR_VOLTAGE,			\
+	.owner = THIS_MODULE,				\
+	.vsel_reg = (vsel),				\
+	.vsel_mask = (vmask),				\
+	.enable_reg = AAT2870_LDO_EN,			\
+	.enable_mask = BIT(AAT2870_ID_##ids),		\
+}
 
-static struct aat2870_regulator aat2870_regulators[] = {
-	AAT2870_LDO(LDOA),
-	AAT2870_LDO(LDOB),
-	AAT2870_LDO(LDOC),
-	AAT2870_LDO(LDOD),
+static const struct regulator_desc aat2870_regulators[] = {
+	AAT2870_LDO(LDOA, "ldo-a", AAT2870_LDO_AB, AAT2870_LDO_AB_A_MASK),
+	AAT2870_LDO(LDOB, "ldo-b", AAT2870_LDO_AB, AAT2870_LDO_AB_B_MASK),
+	AAT2870_LDO(LDOC, "ldo-c", AAT2870_LDO_CD, AAT2870_LDO_CD_C_MASK),
+	AAT2870_LDO(LDOD, "ldo-d", AAT2870_LDO_CD, AAT2870_LDO_CD_D_MASK),
 };
 
-static struct aat2870_regulator *aat2870_get_regulator(int id)
-{
-	struct aat2870_regulator *ri = NULL;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
-		ri = &aat2870_regulators[i];
-		if (ri->desc.id == id)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(aat2870_regulators))
-		return NULL;
-
-	ri->enable_addr = AAT2870_LDO_EN;
-	ri->enable_shift = id - AAT2870_ID_LDOA;
-	ri->enable_mask = 0x1 << ri->enable_shift;
-
-	ri->voltage_addr = (id - AAT2870_ID_LDOA) / 2 ?
-			   AAT2870_LDO_CD : AAT2870_LDO_AB;
-	ri->voltage_shift = (id - AAT2870_ID_LDOA) % 2 ? 0 : 4;
-	ri->voltage_mask = 0xF << ri->voltage_shift;
-
-	return ri;
-}
-
 static int aat2870_regulator_probe(struct platform_device *pdev)
 {
-	struct aat2870_regulator *ri;
+	struct device *dev = &pdev->dev;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 
-	ri = aat2870_get_regulator(pdev->id);
-	if (!ri) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		return -EINVAL;
-	}
-	ri->aat2870 = dev_get_drvdata(pdev->dev.parent);
-
-	config.dev = &pdev->dev;
-	config.driver_data = ri;
-	config.init_data = dev_get_platdata(&pdev->dev);
+	config.dev = dev;
+	config.driver_data = dev_get_drvdata(dev->parent);
 
-	rdev = devm_regulator_register(&pdev->dev, &ri->desc, &config);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "Failed to register regulator %s\n",
-			ri->desc.name);
-		return PTR_ERR(rdev);
+	for (int i = 0; i < ARRAY_SIZE(aat2870_regulators); i++) {
+		rdev = devm_regulator_register(dev, &aat2870_regulators[i], &config);
+		if (IS_ERR(rdev)) {
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register regulator %s\n",
+					     aat2870_regulators[i].name);
+		}
 	}
-	platform_set_drvdata(pdev, rdev);
 
 	return 0;
 }
 
+static const struct of_device_id aat2870_regulator_match_table[] = {
+	{ .compatible = "skyworks,aat2870-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_regulator_match_table);
+
 static struct platform_driver aat2870_regulator_driver = {
 	.driver = {
 		.name	= "aat2870-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = aat2870_regulator_match_table,
 	},
 	.probe	= aat2870_regulator_probe,
 };
diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index e85f2b4d81068..2af2be8176a07 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -15,11 +15,19 @@
 #include <linux/backlight.h>
 #include <linux/mfd/aat2870.h>
 
+/* Backlight has 8 channels, each bit represents one channel */
+#define AAT2870_BL_CH_ALL	0xff
+
+/* Backlight current magnitude (uA), 450uA current is eq to 0 */
+#define AAT2870_CURRENT_MIN	450
+#define AAT2870_CURRENT_MAX	27900
+#define AAT2870_CURRENT_STEP	900
+
 struct aat2870_bl_driver_data {
 	struct platform_device *pdev;
 	struct backlight_device *bd;
 
-	int channels;
+	u8 channels;
 	int brightness; /* current brightness */
 };
 
@@ -29,7 +37,7 @@ static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 			= dev_get_drvdata(aat2870_bl->pdev->dev.parent);
 
 	return aat2870->write(aat2870, AAT2870_BL_CH_EN,
-			      (u8)aat2870_bl->channels);
+			      aat2870_bl->channels);
 }
 
 static inline int aat2870_bl_disable(struct aat2870_bl_driver_data *aat2870_bl)
@@ -84,24 +92,12 @@ static const struct backlight_ops aat2870_bl_ops = {
 
 static int aat2870_bl_probe(struct platform_device *pdev)
 {
-	struct aat2870_bl_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct aat2870_bl_driver_data *aat2870_bl;
 	struct backlight_device *bd;
 	struct backlight_properties props;
+	u32 max_current = AAT2870_CURRENT_MAX;
 	int ret = 0;
 
-	if (!pdata) {
-		dev_err(&pdev->dev, "No platform data\n");
-		ret = -ENXIO;
-		goto out;
-	}
-
-	if (pdev->id != AAT2870_ID_BL) {
-		dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	aat2870_bl = devm_kzalloc(&pdev->dev,
 				  sizeof(struct aat2870_bl_driver_data),
 				  GFP_KERNEL);
@@ -128,19 +124,19 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 
 	aat2870_bl->bd = bd;
 
-	if (pdata->channels > 0)
-		aat2870_bl->channels = pdata->channels;
-	else
-		aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	aat2870_bl->channels = AAT2870_BL_CH_ALL;
+	device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870_bl->channels);
+
+	device_property_read_u32(&pdev->dev, "led-max-microamp", &max_current);
+	max_current = clamp(max_current, AAT2870_CURRENT_MIN, AAT2870_CURRENT_MAX);
+	max_current /= AAT2870_CURRENT_STEP;
 
 	/*
 	 * The maximum number of brightness steps is determined by the max current.
-	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 * The max_current value calculated above maps to the allowed brightness
+	 * steps with +1 offset since max_current 0 is still 450uA.
 	 */
-	if (pdata->max_current > 0)
-		bd->props.max_brightness = pdata->max_current;
-	else
-		bd->props.max_brightness = AAT2870_CURRENT_27_9;
+	bd->props.max_brightness = max_current + 1;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
@@ -168,9 +164,16 @@ static void aat2870_bl_remove(struct platform_device *pdev)
 	backlight_update_status(bd);
 }
 
+static const struct of_device_id aat2870_bl_match_table[] = {
+	{ .compatible = "skyworks,aat2870-backlight" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aat2870_bl_match_table);
+
 static struct platform_driver aat2870_bl_driver = {
 	.driver = {
 		.name	= "aat2870-backlight",
+		.of_match_table = aat2870_bl_match_table,
 	},
 	.probe		= aat2870_bl_probe,
 	.remove		= aat2870_bl_remove,
diff --git a/include/linux/mfd/aat2870.h b/include/linux/mfd/aat2870.h
index c7a3c53eba681..a7b482b790b4e 100644
--- a/include/linux/mfd/aat2870.h
+++ b/include/linux/mfd/aat2870.h
@@ -54,80 +54,13 @@
 #define AAT2870_LDO_EN		0x26
 #define AAT2870_REG_NUM		0x27
 
-/* Device IDs */
-enum aat2870_id {
-	AAT2870_ID_BL,
-	AAT2870_ID_LDOA,
-	AAT2870_ID_LDOB,
-	AAT2870_ID_LDOC,
-	AAT2870_ID_LDOD
-};
-
-/* Backlight channels */
-#define AAT2870_BL_CH1		0x01
-#define AAT2870_BL_CH2		0x02
-#define AAT2870_BL_CH3		0x04
-#define AAT2870_BL_CH4		0x08
-#define AAT2870_BL_CH5		0x10
-#define AAT2870_BL_CH6		0x20
-#define AAT2870_BL_CH7		0x40
-#define AAT2870_BL_CH8		0x80
-#define AAT2870_BL_CH_ALL	0xFF
-
-/* Backlight current magnitude (mA) */
-enum aat2870_current {
-	AAT2870_CURRENT_0_45 = 1,
-	AAT2870_CURRENT_0_90,
-	AAT2870_CURRENT_1_80,
-	AAT2870_CURRENT_2_70,
-	AAT2870_CURRENT_3_60,
-	AAT2870_CURRENT_4_50,
-	AAT2870_CURRENT_5_40,
-	AAT2870_CURRENT_6_30,
-	AAT2870_CURRENT_7_20,
-	AAT2870_CURRENT_8_10,
-	AAT2870_CURRENT_9_00,
-	AAT2870_CURRENT_9_90,
-	AAT2870_CURRENT_10_8,
-	AAT2870_CURRENT_11_7,
-	AAT2870_CURRENT_12_6,
-	AAT2870_CURRENT_13_5,
-	AAT2870_CURRENT_14_4,
-	AAT2870_CURRENT_15_3,
-	AAT2870_CURRENT_16_2,
-	AAT2870_CURRENT_17_1,
-	AAT2870_CURRENT_18_0,
-	AAT2870_CURRENT_18_9,
-	AAT2870_CURRENT_19_8,
-	AAT2870_CURRENT_20_7,
-	AAT2870_CURRENT_21_6,
-	AAT2870_CURRENT_22_5,
-	AAT2870_CURRENT_23_4,
-	AAT2870_CURRENT_24_3,
-	AAT2870_CURRENT_25_2,
-	AAT2870_CURRENT_26_1,
-	AAT2870_CURRENT_27_0,
-	AAT2870_CURRENT_27_9
-};
-
-struct aat2870_register {
-	bool readable;
-	bool writeable;
-	u8 value;
-};
-
 struct aat2870_data {
 	struct device *dev;
 	struct i2c_client *client;
 
 	struct mutex io_lock;
 	struct aat2870_register *reg_cache; /* register cache */
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-	bool is_enable;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
+	struct gpio_desc *en_pin;
 
 	/* i2c io funcntions */
 	int (*read)(struct aat2870_data *aat2870, u8 addr, u8 *val);
@@ -135,30 +68,4 @@ struct aat2870_data {
 	int (*update)(struct aat2870_data *aat2870, u8 addr, u8 mask, u8 val);
 };
 
-struct aat2870_subdev_info {
-	int id;
-	const char *name;
-	void *platform_data;
-};
-
-struct aat2870_platform_data {
-	int en_pin; /* enable GPIO pin (if < 0, ignore this value) */
-
-	struct aat2870_subdev_info *subdevs;
-	int num_subdevs;
-
-	/* init and uninit for platform specified */
-	int (*init)(struct aat2870_data *aat2870);
-	void (*uninit)(struct aat2870_data *aat2870);
-};
-
-struct aat2870_bl_platform_data {
-	/* backlight channels, default is AAT2870_BL_CH_ALL */
-	int channels;
-	/* backlight current magnitude, default is AAT2870_CURRENT_27_9 */
-	int max_current;
-	/* maximum brightness, default is 255 */
-	int max_brightness;
-};
-
 #endif /* __LINUX_MFD_AAT2870_H */
-- 
2.53.0

