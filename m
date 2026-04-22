Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F95374170
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859588; cv=none; b=uHBCPS4/emJJIddL/wJXRxa3Bw9X/Ss+euPk3aEQEtH8CkBWWvPwTOynhgkVAdz7KfV7AFGHMBUi9p3ivh/hlKF+OOfLsrva6D7lvn8/Gh/jzW/wTuQSwFzWkmohvw+TytPJeNcbeyhh4w6MJ0SpV4ZsHi1dNOlfsHPm96UJ/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859588; c=relaxed/simple;
	bh=YdWIS+GWYOxF9myOt65lgye4aOYTDmJb1XDgOuFE4hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqrK1174gNdLBDXFPVwj2ktnduCVxzMvo7+nGoLY5TloFGNWoqHN2xtsGjRY7ZRzEBbjEgnpRhOE1GxTJq58CHFJlWbU5PPPGyEGaawf2Q5yBCVWJHxohBGP5OxMgkvnSKSKEDPaONgEiPl10Wj8G8DecfJxeEytjYvKHl89+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=b5qsZW4l; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="b5qsZW4l"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so2443242b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859586; x=1777464386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgmCuXwUu4Wzi6ClM7vTGFeIrRj3dmweZd0IGS6MY0s=;
        b=b5qsZW4lkZ7B08MQAHSrCNf4mLZmco33Gj1a0H/GC26wpfMB1opA46MwGeLtuNKwIv
         EphhhQwN01nFCy0O35P097VY4CdwtY2Njs17GTWoGKRZF+8FOFWS+/ZxAMJyYgAVEBxX
         hWSsDU2SWCcNbhblK7PsqFQvukcLWqLB2LSFeDz+27hfIdX5ZY9m7WZ3P73KAHWDvYHe
         eCgIivsZaPhyA09cWnk+ZU4FKCsK3Dvh3BUGv7y0Xhmo7G/ldOMEJgZK0z08Q49L+OLU
         60vv29tg9kqPknaHEBzzADaXLrIFSDagzAhJBHUfzBjgKfXGLBE4ubef48xb0C/OA6DN
         OUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859586; x=1777464386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgmCuXwUu4Wzi6ClM7vTGFeIrRj3dmweZd0IGS6MY0s=;
        b=pI9/DHgRjbi3b1+NtmeW4RktO/x0z3viKAhQgDKvXhtBTFLQmKNFfZXPp11RAZhJHQ
         jLq0/k+5G6zZLYQLV9VYU9k6UX+T27dOuOybVCOLS4IN+A3j1+B6Pv9zcGU3xhgzHpJJ
         F2jSW4J9HS6wIAiRVYcd6dmZxSjyOWN15NVEZ5Q5l2WIdqr02fdvU5UcfX8qfFr/YWts
         1uETcDvaxZ+N6BTBP3VAjsYheiVkDvPXMywUefcNur/vqurGtX/ngaSAhLWyVDLgn++Q
         6WetPDft+xI01W24DnkpCcxSsm+0/qeFLsv1M/9/kMIDoUevU0uJ7hhRRUdk5BhufmLM
         XvbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fhrJRu5GZ7IQPWHF6s7peE4PcME+mLzzUT2vJaq6WmCstqrSyJnD3qQp4d0EKlhV2rHzMoElSI18K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8OeU4Lm39WM5UcPRtrAtSadQF3PFxE0pja6bsBqC9NAhux2nQ
	SCFmbxUG/GR3Y/FEYCjiKyFe/gTle7iYqy9LcWN+uUy38sLhYXRhypvdfEFSwQCB4rE=
X-Gm-Gg: AeBDiesMcqEkLRWVVu9NbRGYtTcU5vLOoKd62+1TSGxEiPh7/sZ4fGr/dnie++OQxiR
	DfOsZWQXZ+pj10v9hTHH1U7me/06jGhH+/bsdvoUgiErG0YALwDpu7pK7GndvAP7dPuGfbRtera
	lr1ye9fOq8+PO0CiaDvzyHXAqJ5EEKyHY7wie8kc3eyqA2iSyVLouJFKzkRiRsOynuFWUcnoyQJ
	rraV07Hiewhtmn70WD2CQ9feDXrPQQ1DPcXIKX2oAVjBz75hONkTJxCDGwAV2sVynwDBDDVkh6w
	4tHQnc6t5UXpfr9t0jheTYiI2kGmQhUA5750OQvGM/boleWTSYaJcnrgT/LskJ2Lc14i+noMXHX
	37aVFiA+uuc4ZS2a6hLoTlD6lvXK29DpNIyFpn6XBsCJ59p9lrmq4SnVBAxMBlsL5B1fMY/9CfE
	10ZwvGR4O2JNmSYRwvYED2uIH/UZCTxFZTiDLcq0+wggvTv2OScJeWH5ByYfnJGuWVJ8Ga02/c0
	b+A
X-Received: by 2002:a05:6a00:4b4f:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82f8c94401fmr22326504b3a.35.1776859585837;
        Wed, 22 Apr 2026 05:06:25 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:25 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:06:16 +0000
Subject: [PATCH 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
In-Reply-To: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=11742;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=YdWIS+GWYOxF9myOt65lgye4aOYTDmJb1XDgOuFE4hY=;
 b=Bb/ZDIwDLuqQhZqK8G3UAC8/VDlDB3vUXpxFCfYhGSqEMXle1Uqhyuu6esZt3SEHd5ByB37Ha
 WfGjRPIt6jlALKmTBnbH5vTuynivrvApSlrC5yd4CW9ZAnZekRpBX4D
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add support for the Luxshare LX1308, a high-efficiency 12V 860W
DC/DC power module. The module operates from 40-60V input voltage.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/lx1308.rst |  90 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  10 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/lx1308.c   | 204 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 306 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b2ca8513cfcd..c86c21554c37 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -145,6 +145,7 @@ Hardware Monitoring Kernel Drivers
    ltc4261
    ltc4282
    ltc4286
+   lx1308
    macsmc-hwmon
    max127
    max15301
diff --git a/Documentation/hwmon/lx1308.rst b/Documentation/hwmon/lx1308.rst
new file mode 100644
index 000000000000..c1b72e1647c5
--- /dev/null
+++ b/Documentation/hwmon/lx1308.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver lx1308
+====================
+
+Supported chips:
+
+  * Luxshare LX1308
+
+    Prefixes: 'lx1308'
+
+    Addresses scanned: -
+
+    Datasheet: Datasheet is not publicly available.
+
+Author: Brian Chiang <chiang.brian@inventec.com>
+
+
+Description
+-----------
+
+The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
+digital DC/DC power module. The module operates from a 40V to 60V DC
+primary bus and provides a 12V regulated output voltage. It can deliver
+up to 860W continuous and 1300W in transient.
+
+The module has slow OCP and fast OCP. If the module output current is higher
+than slow OCP set point and the lasting time is also longer than the delay,
+the module will shut down and retry 3 time, if the fault still exists then
+module enter latch mode.
+
+If the module output current is higher than fast OCP set point then it shut
+down and enter latch mode.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_alarm             Input current alarm
+curr1_input             Input current (IIN)
+curr1_label             "iin"
+curr2_crit              Output over current fault threshold (slow OCP, 60ms delay)
+curr2_crit_alarm        Output over current fault alarm
+curr2_input             Output current (IOUT)
+curr2_label             "iout1"
+curr2_max               Output over current warning threshold (slow OCP, 60ms delay)
+curr2_max_alarm         Output over current warning alarm
+in1_crit                Input over voltage fault threshold
+in1_crit_alarm          Input over voltage fault alarm
+in1_input               Input voltage (VIN)
+in1_label               "vin"
+in1_lcrit               Input under voltage fault threshold
+in1_lcrit_alarm         Input under voltage fault alarm
+in1_max                 Input over voltage warning threshold
+in1_max_alarm           Input over voltage warning alarm
+in1_min                 Input under voltage warning threshold
+in1_min_alarm           Input under voltage warning alarm
+in2_crit                Output over voltage fault threshold
+in2_crit_alarm          Output over voltage fault alarm
+in2_input               Output voltage (VOUT)
+in2_label               "vout1"
+in2_lcrit               Output under voltage fault threshold
+in2_lcrit_alarm         Output under voltage fault alarm
+in2_max                 Output over voltage warning threshold
+in2_max_alarm           Output over voltage warning alarm
+in2_min                 Output under voltage warning threshold
+in2_min_alarm           Output under voltage warning alarm
+power1_alarm            Input power alarm
+power1_input            Input power (PIN)
+power1_label            "pin"
+power2_input            Output power (POUT)
+power2_label            "pout1"
+temp1_crit              Over temperature fault threshold
+temp1_crit_alarm        Over temperature fault alarm
+temp1_input             Module hot spot temperature
+temp1_max               Over temperature warning threshold
+temp1_max_alarm         Over temperature warning alarm
+======================= ======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index fc1273abe357..1c5dc4294248 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -221,6 +221,16 @@ config SENSORS_ISL68137
 	  This driver can also be built as a module. If so, the module will
 	  be called isl68137.
 
+config SENSORS_LX1308
+	tristate "Luxshare LX1308 DC/DC Power Module"
+	help
+	  If you say yes here you get hardware monitoring support for
+	  Luxshare LX1308, a high-efficiency 12V 860W DC/DC power module
+	  with PMBus interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called lx1308.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d6c86924f887..4861e144c7e7 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_IR36021)	+= ir36021.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
+obj-$(CONFIG_SENSORS_LX1308)	+= lx1308.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LT3074)	+= lt3074.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
diff --git a/drivers/hwmon/pmbus/lx1308.c b/drivers/hwmon/pmbus/lx1308.c
new file mode 100644
index 000000000000..c7a7a1fd4f21
--- /dev/null
+++ b/drivers/hwmon/pmbus/lx1308.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define LX1308_MFR_IOUT_OCP3_FAULT	0xBE
+#define LX1308_MFR_IOUT_OCP3_WARN	0xBF
+
+/*
+ * Decode a Linear11-encoded word to an integer value.
+ * Linear11 format: bits[15:11] = signed 5-bit exponent,
+ * bits[10:0] = signed 11-bit mantissa. Result = mant * 2^exp.
+ */
+static inline int linear11_to_int(u16 word)
+{
+	s16 exp = ((s16)word) >> 11;
+	s16 mant = ((s16)((word & 0x7ff) << 5)) >> 5;
+
+	return (exp >= 0) ? (mant << exp) : (mant / (1 << (-exp)));
+}
+
+static int lx1308_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	/*
+	 * The LX1308 OCP3 registers (slow OCP, 60ms delay) use a
+	 * manufacturer-specific U8.0 format. Read the byte value N and present
+	 * it as a Linear11 word with exponent 0.
+	 */
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		ret = i2c_smbus_read_byte_data(client, LX1308_MFR_IOUT_OCP3_FAULT);
+		if (ret < 0)
+			break;
+		ret &= 0x7FF;
+		break;
+
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = i2c_smbus_read_byte_data(client, LX1308_MFR_IOUT_OCP3_WARN);
+		if (ret < 0)
+			break;
+		ret &= 0x7FF;
+		break;
+
+	/*
+	 * The following registers are not implemented by the LX1308. Return
+	 * -ENXIO to suppress the corresponding sysfs attributes.
+	 */
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_UC_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_POUT_OP_WARN_LIMIT:
+	case PMBUS_UT_WARN_LIMIT:
+	case PMBUS_UT_FAULT_LIMIT:
+	case PMBUS_MFR_IIN_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_VIN_MIN:
+	case PMBUS_MFR_VIN_MAX:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_PIN_MAX:
+	case PMBUS_MFR_POUT_MAX:
+	case PMBUS_MFR_MAX_TEMP_1:
+		ret = -ENXIO;
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int lx1308_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	int ret;
+
+	if (page > 0)
+		return -ENXIO;
+
+	switch (reg) {
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+		/*
+		 * Decode Linear11 word from pmbus_core back to a plain integer
+		 * and write as the U8.0 byte the device expects.
+		 */
+		ret = i2c_smbus_write_byte_data(client, LX1308_MFR_IOUT_OCP3_FAULT,
+						clamp_val(linear11_to_int(word), 0, 255));
+		break;
+
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		ret = i2c_smbus_write_byte_data(client, LX1308_MFR_IOUT_OCP3_WARN,
+						clamp_val(linear11_to_int(word), 0, 255));
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static struct pmbus_driver_info lx1308_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
+		| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+		| PMBUS_HAVE_STATUS_INPUT,
+
+	.read_word_data  = lx1308_read_word_data,
+	.write_word_data = lx1308_write_word_data,
+};
+
+static const struct i2c_device_id lx1308_id[] = {
+	{ "lx1308" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lx1308_id);
+
+static int lx1308_probe(struct i2c_client *client)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	const struct i2c_device_id *mid;
+	int ret;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer id\n");
+	buf[ret] = '\0';
+
+	if (ret != 12 || strncmp(buf, "LUXSHARE", 8))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer ID '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Manufacturer Model\n");
+	buf[ret] = '\0';
+
+	for (mid = lx1308_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, buf, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0])
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer Model '%s'\n", buf);
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read Manufacturer Revision\n");
+	buf[ret] = '\0';
+
+	if (ret != 12 || buf[0] != 'V')
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Manufacturer Revision '%s'\n", buf);
+	return pmbus_do_probe(client, &lx1308_info);
+}
+
+static const struct of_device_id lx1308_of_match[] = {
+	{ .compatible = "luxshare,lx1308" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, lx1308_of_match);
+
+static struct i2c_driver lx1308_driver = {
+	.driver = {
+		.name = "lx1308",
+		.of_match_table = lx1308_of_match,
+	},
+	.probe = lx1308_probe,
+	.id_table = lx1308_id,
+};
+
+module_i2c_driver(lx1308_driver);
+
+MODULE_AUTHOR("Brian Chiang <chiang.brian@inventec.com>");
+MODULE_DESCRIPTION("PMBus driver for Luxshare LX1308");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.43.0

