Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795199;
	b=oChfm8xz69XU1Bpc/Xbyml4m0fIVxpRRrtO1MoCVQIYTUDrHc6QJrG8nUpwXbNy94LMK
	 xKmo6Au1ublVq06uZu9HxtgZg/BX3ekB1hOQto9yrfvhE5KyJP9yuP+pmtVvSeNmE+Id1
	 D7w55oknQR+6T4Nq77le2t8NvSYny8g79U8fuz/1Wo0KDKG+HReXFvSOXfxW10oDMfg3Z
	 /KvSy572kWHhqverH70yc2CJyQCUQcfNC4iFOOUdjC6S6UFCiBjti+vZiZAaqQ0TnO7tv
	 SeXwMEi26PPWTr1sn07F/1zwpdAuxwIxkOUQIOXFGOVVA9btQKniNWABdyo+MjfwF/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WFDlyoZB7f18B/lPyVmWgAS81CxVxhcEOqRbakazlQ4=;
	b=TMWBfDqv/Tgbg4j2OFteLtoWr37XQPs+Xi4dCaHOkEuIBjCGPgrZV6mQa0NAaYbWSp8H
	 tbuiO5xS5dRXRJ9XntVWQbf+wZfTAED4r4s7/oiRRXkLWtFNfmrvaHiTD3oB7z1LuNZty
	 Z2kXIkmUUQ5uUBmfJvizuBq9DATud+gVhrUGZltGaBIx488VhAisMR3oUxaz72bLBcL+9
	 36Hiy5q+oTB1zoG19kOu6obsnF9ACnTvt/hKS9SH+jQ2c9jNRlt8RCn26UZAiCrKwatPW
	 ViQz66QGLqmHadH0kZngSSmatp86ajDk/lNSX/ST2KO5TfUzlUHyEk6BMBRc+GQWdLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FDNO8Hoe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFAF606EEB5
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFAF606EEB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FDNO8Hoe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6402935e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795197; x=1794399997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WFDlyoZB7f18B/lPyVmWgAS81CxVxhcEOqRbakazlQ4=;
        b=FDNO8Hoenxsk9RdhBjUJf1xXGIubiTiiFjh8a8rZmYEaPTHWI/JA9b/CIpWY0vyuT5
         ZoG2PrgS5+mMGh2+N6uorh26BABTsNMSEkqkWqp8WBVYtiDMDw7JfiUG8ApMAV8uVyzE
         aC7re713i44tUyQ5KK5uAWu8eeffiSY/NYuSBcp/T884VTWQLbQ5mmn76u3RaL4joXZn
         C7lDhje+qpOgUglBX26W37f4N9+RrPQUgJ5Q1e+3I2ZxQVkqTnL8wmn83QaSgckcWXKf
         2RcrmyzxBinzbD5b9CD5txaG/VcZExADmWCd6X1+gY1TjF9XjnS/bHmcs2oWi2IsBGdB
         UqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795198; x=1794399998;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFDlyoZB7f18B/lPyVmWgAS81CxVxhcEOqRbakazlQ4=;
        b=Eqh/2P2X45m6pB5SkTSimZXpzHWXUg0riqY9gzfeNGGOWcAPjqfss7w9U17pKYIR9a
         0Yj6T06r45jNBg2FRBQYBdnZoyY0WlYyiQB2UGG0D/83UrxaXLDvYs+SXph5PvW0ripM
         7QQwsQfqdVI91Aji4lrQWI8Czfw3v6lI52WvTbm/+4yAINQxgzfO3d2QCvmsLS1S+HC/
         5k8qt+FzkeNGLYNmXuNC0mWX7xBPyZ2jKEuZx1IUrI/9JOK40GtfFKXs6bkOTVuvU100
         3Hw9X7ad3TZbFdkMJkBfZQunlkkfttO1DgUpJ9YU4d0u7drUPq6MUzkjvKCCbAoGcDlB
         z9qw==
X-Gm-Message-State: APuU4Z/GPvMzInBSubWZN7Ng5TE9+T0Iq39WERXf0+bhOeMUeSc8Sp0y
	rHiZ1NH/0mlq0DY+xT0giPIaQvz6HOoNO+JONiCns83t5Xe1rxHn71KT
X-Gm-Gg: AYBFou2/crR92puAMMSIiH5Wd3o0zSGyZ4gvJccBErBJHXhe1LB2EsEANUQrbHZhKrL
	iCwdBcT90E0lG3wdUeDMxZHRQ/tP7FrlRV5tJ/QrZMsOZct/ICIQj0LWQr8YGSPUmAa3hSK4JG6
	dS6kQQTfJNo0pAf/MR/qpRjq2dQnBp5359gCrfvqchIlB93vPrvrrp7WujNL14KsWNgjVNPySz+
	6eayAeh0aoq1YIa7Iz5nTnOiFjjtog4mwUQd8+LdiRU4tu00orct0+RoaCWgcXW9/Z9gtvYWs4X
	WX9AbpGuekcQWam02MnAiu+h2DRxb2IVPUP92YnREUEBHqLPbrHZuXQw7NgA+B1iVqLgB3jAiYp
	ZDpVFperuSES5iKnkJYuOhAMc92r9nUa0XaoaSfXyAwaFCGo/j+YtlKd3MG78rVtGH6+j9wkJ+B
	a0MFMxvPZ3BzCwd+RYoFp9YS180ZkZ+5akZSJjwVIPbkY5omGZR4v/z4UtJFrMLsOIcs+YLD8FH
	1F7Dg6chdSNKm1jqEfTw/VfhYq8YkY+Hmg/8JVmFPV+1wpKZPo/UYmGjZTFQwxqjfDHu/0u5pQ2
	I669Vba85S4Qap38Njm1v9mmWIXM1/nH65IWGvItBgVBqdi5qA==
X-Received: by 2002:a05:600c:638f:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ac17d16a26mr365450235e9.6.1793795197552;
        Wed, 04 Nov 2026 04:26:37 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v13 6/7] power: supply: Add driver for ASUS Transformer battery
Date: Wed,  4 Nov 2026 14:26:05 +0200
Message-ID: <20261104122606.215629-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Driver implements one battery cell per EC controller and supports reading
of battery status for ASUS Transformer's pad and mobile dock.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 .../supply/asus-transformer-ec-battery.c      | 289 ++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index ee7dc5f2617a4..856eb81c97ae9 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -122,6 +122,17 @@ config BATTERY_CHAGALL
 	  This driver can also be built as a module. If so, the module will be
 	  called chagall-battery.
 
+config BATTERY_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's battery driver"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y to enable support for battery status access on Tegra based
+	  ASUS Transformer devices.
+
+	  This sub-driver supports battery cells found in Asus Transformer
+	  tablets and mobile docks and controlled by a special embedded
+	  controller.
+
 config BATTERY_CPCAP
 	tristate "Motorola CPCAP PMIC battery driver"
 	depends on MFD_CPCAP && IIO
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index f3c0d1006c1a2..bec4a6263048c 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_TEST_POWER)	+= test_power.o
 obj-$(CONFIG_BATTERY_88PM860X)	+= 88pm860x_battery.o
 obj-$(CONFIG_CHARGER_ADP5061)	+= adp5061.o
 obj-$(CONFIG_BATTERY_ACT8945A)	+= act8945a_charger.o
+obj-$(CONFIG_BATTERY_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-battery.o
 obj-$(CONFIG_BATTERY_AXP20X)	+= axp20x_battery.o
 obj-$(CONFIG_CHARGER_AXP20X)	+= axp20x_ac_power.o
 obj-$(CONFIG_BATTERY_CHAGALL)	+= chagall-battery.o
diff --git a/drivers/power/supply/asus-transformer-ec-battery.c b/drivers/power/supply/asus-transformer-ec-battery.c
new file mode 100644
index 0000000000000..46bd50001e47d
--- /dev/null
+++ b/drivers/power/supply/asus-transformer-ec-battery.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+#include <linux/unaligned.h>
+
+#define ASUSEC_BATTERY_DATA_FRESH_MSEC		5000
+
+#define ASUSEC_BATTERY_DISCHARGING		BIT(6)
+#define ASUSEC_BATTERY_FULL_CHARGED		BIT(5)
+#define ASUSEC_BATTERY_NOT_CHARGING		BIT(4)
+
+#define TEMP_CELSIUS_OFFSET			2731
+
+struct asus_ec_battery_data {
+	struct asusec_core *ec;
+	struct power_supply *battery;
+	struct power_supply_desc psy_desc;
+	struct delayed_work poll_work;
+	struct mutex battery_lock; /* for data refresh */
+	unsigned long batt_data_ts;
+	int last_state;
+	u8 batt_data[ASUSEC_ENTRY_BUFSIZE];
+};
+
+static int asus_ec_battery_refresh(struct asus_ec_battery_data *priv)
+{
+	struct i2c_client *client = priv->ec->dockram;
+	struct device *dev = &client->dev;
+	int ret = 0;
+
+	if (time_before(jiffies, priv->batt_data_ts))
+		return ret;
+
+	memset(priv->batt_data, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(client, ASUSEC_DOCKRAM_BATT_CTL,
+					    ASUSEC_ENTRY_SIZE, priv->batt_data);
+	if (ret < ASUSEC_ENTRY_SIZE)
+		return ret < 0 ? ret : -EIO;
+
+	if (priv->batt_data[0] > ASUSEC_ENTRY_SIZE) {
+		dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
+			ASUSEC_ENTRY_BUFSIZE, priv->batt_data, ret);
+		return -EPROTO;
+	}
+
+	priv->batt_data_ts = jiffies +
+		msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC);
+
+	return ret;
+}
+
+static enum power_supply_property asus_ec_battery_properties[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_CURRENT_MAX,
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CHARGE_NOW,
+	POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
+	POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
+	POWER_SUPPLY_PROP_PRESENT,
+};
+
+static const unsigned int asus_ec_battery_prop_offs[] = {
+	[POWER_SUPPLY_PROP_STATUS] = 1,
+	[POWER_SUPPLY_PROP_VOLTAGE_MAX] = 3,
+	[POWER_SUPPLY_PROP_CURRENT_MAX] = 5,
+	[POWER_SUPPLY_PROP_TEMP] = 7,
+	[POWER_SUPPLY_PROP_VOLTAGE_NOW] = 9,
+	[POWER_SUPPLY_PROP_CURRENT_NOW] = 11,
+	[POWER_SUPPLY_PROP_CAPACITY] = 13,
+	[POWER_SUPPLY_PROP_CHARGE_NOW] = 15,
+	[POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW] = 17,
+	[POWER_SUPPLY_PROP_TIME_TO_FULL_NOW] = 19,
+};
+
+static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv,
+				     enum power_supply_property psp)
+{
+	int ret, offs;
+
+	guard(mutex)(&priv->battery_lock);
+
+	if (psp >= ARRAY_SIZE(asus_ec_battery_prop_offs))
+		return -EINVAL;
+
+	offs = asus_ec_battery_prop_offs[psp];
+	if (!offs)
+		return -EINVAL;
+
+	ret = asus_ec_battery_refresh(priv);
+	if (ret < 0)
+		return ret;
+
+	if (offs >= priv->batt_data[0])
+		return -ENODATA;
+
+	return get_unaligned_le16(priv->batt_data + offs);
+}
+
+static int asus_ec_battery_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct asus_ec_battery_data *priv = power_supply_get_drvdata(psy);
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+
+	default:
+		ret = asus_ec_battery_get_value(priv, psp);
+		if (ret < 0)
+			return ret;
+
+		val->intval = (s16)ret;
+
+		switch (psp) {
+		case POWER_SUPPLY_PROP_STATUS:
+			if (ret & ASUSEC_BATTERY_FULL_CHARGED)
+				val->intval = POWER_SUPPLY_STATUS_FULL;
+			else if (ret & ASUSEC_BATTERY_NOT_CHARGING)
+				val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+			else if (ret & ASUSEC_BATTERY_DISCHARGING)
+				val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+			else
+				val->intval = POWER_SUPPLY_STATUS_CHARGING;
+			break;
+
+		case POWER_SUPPLY_PROP_TEMP:
+			val->intval -= TEMP_CELSIUS_OFFSET;
+			break;
+
+		case POWER_SUPPLY_PROP_CHARGE_NOW:
+		case POWER_SUPPLY_PROP_CURRENT_NOW:
+		case POWER_SUPPLY_PROP_CURRENT_MAX:
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+			val->intval *= 1000;
+			break;
+
+		case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
+		case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
+			val->intval = ret * 60;
+			break;
+
+		default:
+			break;
+		}
+
+		break;
+	}
+
+	return 0;
+}
+
+static void asus_ec_battery_poll_work(struct work_struct *work)
+{
+	struct asus_ec_battery_data *priv =
+		container_of(work, struct asus_ec_battery_data, poll_work.work);
+	int state;
+
+	state = asus_ec_battery_get_value(priv, POWER_SUPPLY_PROP_STATUS);
+	if (state < 0)
+		goto reschedule;
+
+	if (state & ASUSEC_BATTERY_FULL_CHARGED)
+		state = POWER_SUPPLY_STATUS_FULL;
+	else if (state & ASUSEC_BATTERY_NOT_CHARGING)
+		state = POWER_SUPPLY_STATUS_NOT_CHARGING;
+	else if (state & ASUSEC_BATTERY_DISCHARGING)
+		state = POWER_SUPPLY_STATUS_DISCHARGING;
+	else
+		state = POWER_SUPPLY_STATUS_CHARGING;
+
+	if (priv->last_state != state) {
+		priv->last_state = state;
+		power_supply_changed(priv->battery);
+	}
+
+reschedule:
+	/* continuously send uevent notification */
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+}
+
+static const struct power_supply_desc asus_ec_battery_desc = {
+	.name = "asus-ec-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = asus_ec_battery_properties,
+	.num_properties = ARRAY_SIZE(asus_ec_battery_properties),
+	.get_property = asus_ec_battery_get_property,
+	.external_power_changed = power_supply_changed,
+};
+
+static int asus_ec_battery_probe(struct platform_device *pdev)
+{
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_battery_data *priv;
+	struct device *dev = &pdev->dev;
+	struct power_supply_config cfg = { };
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	mutex_init(&priv->battery_lock);
+
+	priv->ec = ec;
+	priv->batt_data_ts = jiffies - 1;
+	priv->last_state = POWER_SUPPLY_STATUS_UNKNOWN;
+
+	cfg.fwnode = dev_fwnode(dev->parent);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_battery_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(dev, GFP_KERNEL, "%s-battery",
+					     priv->ec->name);
+	if (!priv->psy_desc.name)
+		return -ENOMEM;
+
+	priv->battery = devm_power_supply_register(dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->battery))
+		return dev_err_probe(dev, PTR_ERR(priv->battery),
+				     "Failed to register power supply\n");
+
+	ret = devm_delayed_work_autocancel(dev, &priv->poll_work,
+					   asus_ec_battery_poll_work);
+	if (ret)
+		return ret;
+
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+
+	return 0;
+}
+
+static int __maybe_unused asus_ec_battery_suspend(struct device *dev)
+{
+	struct asus_ec_battery_data *priv = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&priv->poll_work);
+
+	return 0;
+}
+
+static int __maybe_unused asus_ec_battery_resume(struct device *dev)
+{
+	struct asus_ec_battery_data *priv = dev_get_drvdata(dev);
+
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(asus_ec_battery_pm_ops,
+			 asus_ec_battery_suspend, asus_ec_battery_resume);
+
+static struct platform_driver asus_ec_battery_driver = {
+	.driver = {
+		.name = "asus-transformer-ec-battery",
+		.pm = &asus_ec_battery_pm_ops,
+	},
+	.probe = asus_ec_battery_probe,
+};
+module_platform_driver(asus_ec_battery_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-battery");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's battery driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

