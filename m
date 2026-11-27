Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742801;
	b=C5KBNHii/kI1ccu9K1Z8blhyModHRB6/iCFwj/+ckGgFxatKWgA1i7dQevjGti4NnI4e
	 SY/+DRo3tgbMGWq7PS5OHwzVjcZIBjV1QM6qq1mY2kQWe5eXJAIod5Mk66vv+nbvcx5At
	 BcKYxKnQQd9eeeonRqAxO6Dbx/8tfzdBu7tKmmuWBloh1hJar9xWZE+XuO6HzAuhhR2rr
	 538yRwvhASfhkcB11m1p6oxNNBnlf23I3zgQdBtok0cKk57XhTECezazlztTSfmRBF7pU
	 dFoCum4IWGanq3ZwN2jSCA8qF01AJ9nRgjOEWaZM65lhZew+hxqjKMJp7WIlZwDr4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
	b=W+NbAu6V7FVtvKpjjDZXPzi/wboSD2TY71nuLCDqRpEf2NNoGwyECYSmzXb4PDJcuf75
	 5QYTH+cYJ26KBeACggQsmIKBuY4heYyPA164mHM7S5Dn7ojNKzvDMZdwnV+TGdra8FgyS
	 zO9CqkuDLie7xuUxC8FryLV+ulU5f3fgd5laQ7bJ0LDYJtJyWTRRQN4S8D0V+8ynnu3Pf
	 LVnK2tH4HdO7+pXg0yIi2p5/ix7j3ZncYJd5EKZsJlxhcDY8C4iPdp5zWWwLATruNLVXV
	 387hqMfPQ4eCq11TcNB+7PqQPIv6fRuHjE4vEZ/TjHi80sbpKIT9L8qoU+A6KcCEbPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZJ2Zq+R;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8014606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZJ2Zq+R
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdece95eca4so87791a12.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742800; x=1796347600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
        b=rZJ2Zq+RDY/fb01QEHCePM5ygtdYWsebvzrtzeM8G5zGeuzHumTSh+vFaNcRNrd52Y
         YEQrv9lmanzmb9/YC7C3qAxExipaqLxHslawvL3vmU9F3ocuiPb90cneECBT0E+3HDRD
         6zxmaKMMu1vEj3LXG2CO1XeTZ5ZBdKVqcfJQxvC+18UBFl2RmkIZ7UD+v37MGC96DHnY
         NOiqid+zx4Gd124V19/gaMLB0VDJCusweadUFO8yYBMRR2MFfoOqJOfZliz3QbX5oens
         l5WdAflNPDoNIBuZlEZlEdA9QnmuzcKS8P9Uj8Cby50zujH/Zp5wh9+dBH34oICjLrZS
         ARvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742800; x=1796347600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xWdpHGsEDnnY/vu32Pb34b46nKTg/YwA60xJj7J8uQ=;
        b=WPxY79+d3k3TjaNeHHzL+1KWk8hb9bMBZR1CPynZFW0AGcsEcc7GMwmUMkZIEN+Q/x
         eoTCyIhHUg/Y+Q/Eiw8jXWJfUuwLrVFH/xwFntgigfaj0R90cLVcwYlCdlXKW/qtmJoJ
         Qa0UwDN8Nluz7cM/KyOi9tFNrBP4wABSaJxt0mDuaUbNQEH1oglj/ZAjaO7IkQ57N547
         W0pwiN2h8BX9EvbvWkxuhRRVHMSP5CaFXprcn/w5fEmWvLyyHCs449JPmT163bqbXZoJ
         08yIRHoai0+6hWnsdWjLmk2Nz03AA0SgQkGo9iaP9cNpEdWowKkC/gbXGeAdPek8ZTLt
         VH1Q==
X-Forwarded-Encrypted: i=1; AL+hErHPM1qMBcTV9TgVHk//tgpZYoISA20E4hHjTng06iFGMFeMx408OsOWc/8Rbaw7aKJYJhCEIMBuxfR/@vger.kernel.org
X-Gm-Message-State: APuU4Z8HJ0hjV/Mbag8rGBGxkUcunGaaquDcdpsXazgXy36xUYMjyNbT
	/bwGFfkS1TCLx7lW0cJX/hsxuQxogL1KGpZzZic5cH2BlipPWOuhURNw
X-Gm-Gg: AZFdTZcIJZXnRm/wLxkjet8Ge06JreIrrrLBK1S8w2eBBXQp5qjWTla+Wchr9BPYX+c
	I6+bkbuDfJ93oFQqeKk2YNoFZJVkdm1tSBJ1BXGKvx6jXq0XdGv3pWmeww/xpc1PVuuT/QNWxzZ
	HL1NaavyjZ5j89t4n9/K6uXY5aRS2oaE1fDSVkmB0NXk7znUZCTu4kWPWfN8wzwNrnPqWfAncii
	Mr1ZOyvcvZrAWn6Jqy+nmpWQWwr1YHAzKk3EQEQpF87HZQCAjNKaouQltv6T+vid9/Cc9BL7oXF
	PBOb8COshoOJ9bg/TCU6t9kugAqYAEOam8vn8dxnrxB2evy3Fd3SP14QErv8FTUgQKH0WJLkKRl
	SiInfTaJ43P/PZGOOhsN/FAhcITJZhPL2O6w1hZzSqrwMF8c4nNqroG5ipm+AvQAdFhwmucPYIu
	WVGVKgof1Xq57e4/Z+EtduJTuudnsZgBUH8iDlaSkUtgV4dp6gE+hOO8BxbJGzn1jgXFq9dD/4z
	gnlWTpuT1s14P46rx7WcSPdg4dN+M9b0N7eORbhPoyykIlPzVr+pMiRKJcpGiB3fxiwX6qPAL/E
	xVV19hT3sYCjszPvif9LjSbAyIzl1hU+pEj3ZrfP45DRkw9fH71WwysKuAioRVDtgftVQnZ3JLS
	PxUhBxAz/VVi36V+QXeO4uxGdYvpXYlvuFjmebofSTWKEdQ==
X-Received: by 2002:a17:90b:3f10:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3b41cb0caa7mr18094346a91.52.1795742800230;
        Thu, 26 Nov 2026 17:26:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:10 +0100
Message-ID: <20261127012612.1589039-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller on uart0. From power-up it streams frames at 9600 baud,
about 67 per second:

  0xff <b0> <b1> <b2> <b3> 0xfe

b2 and b3 are the raw 8-bit readings of the X and Y potentiometers, the
ones the stock firmware uses. b0 and b1 also move with the stick, but
their meaning is unknown, so they are not exposed.

Add a serdev driver that exposes X and Y as two raw IIO channels. As
the MCU pushes its readings, each complete frame also goes to a software
IIO buffer (kfifo) with a timestamp: adc-joystick then takes the stick
from the buffer, without polling, both axes from the same frame. Direct
reads return the last complete frame, -EAGAIN before the first one.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 MAINTAINERS                       |   7 +
 drivers/iio/adc/Kconfig           |  13 ++
 drivers/iio/adc/Makefile          |   1 +
 drivers/iio/adc/miyoo-a30-stick.c | 204 ++++++++++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 drivers/iio/adc/miyoo-a30-stick.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..253275882ab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18746,6 +18746,13 @@ M:	Konrad Dybcio <konradybcio@kernel.org>
 F:	Documentation/devicetree/bindings/power/supply/mitsumi,mm8013.yaml
 F:	drivers/power/supply/mm8013.c
 
+MIYOO A30 ANALOG STICK MCU DRIVER
+M:	Romain TISSERAND <romain.tisserand@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
+F:	drivers/iio/adc/miyoo-a30-stick.c
+
 MMP SUPPORT
 R:	Lubomir Rintel <lkundrak@v3.sk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1d6ed49041ab..48a0c4a88731 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1346,6 +1346,19 @@ config MESON_SARADC
 	  To compile this driver as a module, choose M here: the
 	  module will be called meson_saradc.
 
+config MIYOO_A30_STICK
+	tristate "Miyoo A30 analog stick MCU"
+	depends on SERIAL_DEV_BUS
+	select IIO_BUFFER
+	select IIO_KFIFO_BUF
+	help
+	  Say yes here to support the analog stick microcontroller of the
+	  Miyoo A30 handheld, which streams the stick readings on a UART.
+	  The readings are exposed as IIO channels, for adc-joystick.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called miyoo-a30-stick.
+
 config MP2629_ADC
 	tristate "Monolithic MP2629 ADC driver"
 	depends on MFD_MP2629
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 769965295dcc..eba4d8eb716a 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_MEDIATEK_MT6397_AUXADC) += mt6397-auxadc.o
 obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
 obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
 obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
+obj-$(CONFIG_MIYOO_A30_STICK) += miyoo-a30-stick.o
 obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
 obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
 obj-$(CONFIG_NAU7802) += nau7802.o
diff --git a/drivers/iio/adc/miyoo-a30-stick.c b/drivers/iio/adc/miyoo-a30-stick.c
new file mode 100644
index 000000000000..d83761558ee7
--- /dev/null
+++ b/drivers/iio/adc/miyoo-a30-stick.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Miyoo A30 analog stick MCU
+ *
+ * The MCU samples the stick potentiometers and streams binary frames on a
+ * UART from power-up, at 9600 baud, about 67 per second:
+ *
+ *   0xff <b0> <b1> <b2> <b3> 0xfe
+ *
+ * b2 and b3 are the raw 8-bit readings of the X and Y potentiometers (the
+ * ones the stock firmware uses); b0 and b1 are not documented and are not
+ * exposed. The last good frame is exposed as two IIO channels, and each
+ * good frame is pushed to an IIO buffer as it arrives, so that adc-joystick
+ * can take the stick without polling it.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/buffer.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/kfifo_buf.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/serdev.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define A30_STICK_FRAME_LEN	6
+#define A30_STICK_START		0xff
+#define A30_STICK_END		0xfe
+#define A30_STICK_BAUD		9600
+
+struct a30_stick {
+	struct iio_dev *indio_dev;
+	spinlock_t lock;	/* protects val and valid */
+	u8 val[2];
+	bool valid;
+	u8 frame[A30_STICK_FRAME_LEN];
+	unsigned int len;
+};
+
+static size_t a30_stick_receive(struct serdev_device *serdev, const u8 *data,
+				size_t count)
+{
+	struct a30_stick *st = serdev_device_get_drvdata(serdev);
+	size_t i;
+
+	for (i = 0; i < count; i++) {
+		/* resynchronise on the start byte */
+		if (!st->len && data[i] != A30_STICK_START)
+			continue;
+
+		st->frame[st->len++] = data[i];
+		if (st->len < A30_STICK_FRAME_LEN)
+			continue;
+
+		st->len = 0;
+		if (st->frame[A30_STICK_FRAME_LEN - 1] != A30_STICK_END)
+			continue;
+
+		scoped_guard(spinlock, &st->lock) {
+			st->val[0] = st->frame[3];
+			st->val[1] = st->frame[4];
+			st->valid = true;
+		}
+
+		if (iio_buffer_enabled(st->indio_dev)) {
+			IIO_DECLARE_BUFFER_WITH_TS(u8, scan, 2) = { };
+
+			scan[0] = st->frame[3];
+			scan[1] = st->frame[4];
+			iio_push_to_buffers_with_ts(st->indio_dev, scan,
+						    sizeof(scan),
+						    iio_get_time_ns(st->indio_dev));
+		}
+	}
+
+	return count;
+}
+
+static const struct serdev_device_ops a30_stick_serdev_ops = {
+	.receive_buf = a30_stick_receive,
+};
+
+static int a30_stick_read_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, int *val,
+			      int *val2, long mask)
+{
+	struct a30_stick *st = iio_priv(indio_dev);
+
+	if (mask != IIO_CHAN_INFO_RAW)
+		return -EINVAL;
+
+	guard(spinlock)(&st->lock);
+	if (!st->valid)
+		return -EAGAIN;
+
+	*val = st->val[chan->channel];
+	return IIO_VAL_INT;
+}
+
+static const struct iio_info a30_stick_info = {
+	.read_raw = a30_stick_read_raw,
+};
+
+#define A30_STICK_CHAN(ch) {					\
+	.type = IIO_VOLTAGE,					\
+	.indexed = 1,						\
+	.channel = (ch),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+	.scan_index = (ch),					\
+	.scan_type = {						\
+		.sign = 'u',					\
+		.realbits = 8,					\
+		.storagebits = 8,				\
+	},							\
+}
+
+static const struct iio_chan_spec a30_stick_channels[] = {
+	A30_STICK_CHAN(0),
+	A30_STICK_CHAN(1),
+	IIO_CHAN_SOFT_TIMESTAMP(2),
+};
+
+/* every frame carries both axes: the IIO core extracts the enabled ones */
+static const unsigned long a30_stick_scan_masks[] = { BIT(0) | BIT(1), 0 };
+
+static int a30_stick_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct iio_dev *indio_dev;
+	struct a30_stick *st;
+	unsigned int baud;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	st = iio_priv(indio_dev);
+	st->indio_dev = indio_dev;
+	spin_lock_init(&st->lock);
+
+	indio_dev->name = "miyoo-a30-stick";
+	indio_dev->info = &a30_stick_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = a30_stick_channels;
+	indio_dev->num_channels = ARRAY_SIZE(a30_stick_channels);
+	indio_dev->available_scan_masks = a30_stick_scan_masks;
+
+	ret = devm_iio_kfifo_buffer_setup(dev, indio_dev, NULL);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_device_register(dev, indio_dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Open the UART last, so that it is closed first on removal: no frame
+	 * is pushed to the buffer once the IIO device is going away. Reads
+	 * return -EAGAIN until the first frame.
+	 */
+	serdev_device_set_drvdata(serdev, st);
+	serdev_device_set_client_ops(serdev, &a30_stick_serdev_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot open the UART\n");
+
+	baud = serdev_device_set_baudrate(serdev, A30_STICK_BAUD);
+	if (baud != A30_STICK_BAUD)
+		return dev_err_probe(dev, -EINVAL, "cannot set %u baud (got %u)\n",
+				     A30_STICK_BAUD, baud);
+
+	serdev_device_set_flow_control(serdev, false);
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot set the parity\n");
+
+	return 0;
+}
+
+static const struct of_device_id a30_stick_of_match[] = {
+	{ .compatible = "miyoo,a30-stick" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, a30_stick_of_match);
+
+static struct serdev_device_driver a30_stick_driver = {
+	.driver = {
+		.name = "miyoo-a30-stick",
+		.of_match_table = a30_stick_of_match,
+	},
+	.probe = a30_stick_probe,
+};
+module_serdev_device_driver(a30_stick_driver);
+
+MODULE_AUTHOR("Romain TISSERAND <romain.tisserand@gmail.com>");
+MODULE_DESCRIPTION("Miyoo A30 analog stick MCU");
+MODULE_LICENSE("GPL");
-- 
2.43.0

