Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D64C3E168B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056666; cv=none; b=WmWwujSBN6ywdxaRs3h/M9TjVKYOeZU7NerNzmojvN/akLyw6ry2R77rkLZCRbOEWf94O68dCtYBcba9uGXUqFgAKcHyfNtE+KmdKtJXnL9j/mdtFqaidS/UhCyTGA+NZ4xnNAOfdN18dc2Pa/5K2PmaGgSp5SJZGsfaJPaZq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056666; c=relaxed/simple;
	bh=c6/Aiu4UZ/sU0uPkdJkuopnm1atE3NwBxxm+EVVTIYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVvpkmbTUMUx8aShjr5iyfEuoHyW8oubnew1/fL7h61tKHp4hnvng/JuOgniEA9X4TifbMnAIYK6C4w82H+1gOCStX6npZAvF53MQyXtlMqYS2OkO6KtZ21BjeHWpPxns0KE02UeG46hD22bzLD0LKOe1nNem3mNbPgTTDZzrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfUcR+AH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfUcR+AH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso131816a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056664; x=1780661464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQCaoukUuAifdwoQLb2AtvzNeKZEcEahL4zcCl7ipLA=;
        b=LfUcR+AH8z20kY8dSPn9thJvvthOcAFZu8mX0esWy5VP23TxxSMg8jUXTgKvcTkZcn
         MGISgvPdhTqpZ/Mb2s4GiG03lttSmj2Cr2z/kS4U3IQXIOTQm/nQqR19dzJJSG3hRWjI
         YiDndByAm6AVdp7tZOVGf5g1j7zQljmc5lREVkqM8gYvGMwQMuDqPKcA/qjoQMj7VRE2
         ynHnsJq2+XFpqlPASO8CIHlXe9Z/T5c+w0q02VCz6NI9e12tFFm3ipesFp5/YoTxLKXu
         9N+ZZRO6itO512x780DYhpQjRgzcfFkPO3XDrBcpdr9MpNDtnb4SZamZd9W5JnAZinbl
         KVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056664; x=1780661464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQCaoukUuAifdwoQLb2AtvzNeKZEcEahL4zcCl7ipLA=;
        b=dA6Foxj1COU11WU8iKLwLwbRyiy0HTAOYnSAL/Ridr13uUXvcj6xXzkBi27iSDKobo
         J1EVymPHa4oodgb5xr/tmNl0GGRXAq4Ns8e5dWCZB0wn/UWTBKnYAlp7DZrOA6pTaHYw
         rSSn4aj8W4KFsvCnemOPklOBfgNNMBzTeaaSUrvQW08aiCBUPtmAY/6HKq1KKuaF1X//
         OIFJBBcuWeG7CJrtTHDyyDmVrWSqaN6RgawD0dwLO6EuUOoc4Q8c+bpsE1P/1Dvu5j0U
         gMoSiSa7RL93bgZc2AKmIgco+YP4ynLWtBSH5nPAJ0vcER3AlZHzN0WppjBP6S7PDFXK
         8Rzw==
X-Forwarded-Encrypted: i=1; AFNElJ8OnsUvXTQo6x7VMFz2w2i99Rb/Kj5CGyMH9tGBAmjGSksGEDiTyacgC0oZ0VoObiHf39yMQyaMgr6u@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnSC7AwHs9swdJ2VD8l+w/LRgPtmB7MypNFE71q8S1aLix+m/
	0SdFdsgVH+XPlkPboEyBrKKN5sxJUjeXwoRdOF1uX2rKQqckbWis1xni
X-Gm-Gg: Acq92OHGoNcYBX3d/PtvfMfqPqOrKdyNCPLOcevpKll8v6gPb6IxKBfLrVNNhEDkUso
	NUS0NawCtANxfgwCLvc6CUbACo7t0AvQLUEvDalEhc9gtT0ZFQN38wC2Wum72Gjkch3fhw5ot8K
	6rhES7UMf1i2gA8tpWktpQU5WqyEtjug45FUh2U17wOqBkVf16O9SZJEqOkuMZc9f0aNb/Qi7sT
	NqKmqzqS+oRKavzKYNRIx4ADsvJ+2iFl/CVHKqqG0MmWg6aZSDnxS5zFWJS5Yibz+ReC5BBilMs
	2ujCM5WmB5qWxwYlW/rqPiMOCEcDZwP5WGpwwMGVPW5lbS5mE2HNbF/zt4oVEsOtQ4E3qPUj/p6
	BnZ/1IlAf0aHlD43fLEb+rKKBKyPHDylaHBnDO4Om4GjG6xl9c/Ifi5iV7VWLpJ//bV+5J3nK6B
	QhyHteF5mB2WPf9ACa2Vs2ObETdF9yxah2KAdGcWmymoABo4NKF7wIA6cG+LRkuuz9SkdILE2pE
	JkI2G/rsAcVmtpNPJK72P9i4OECeEZ3S3IKe4XLIiBf2qZEJLNQ27yTZaU=
X-Received: by 2002:a17:90a:ec88:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36bbceae629mr3232957a91.21.1780056663735;
        Fri, 29 May 2026 05:11:03 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdf3afc6sm942820a91.7.2026.05.29.05.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:11:03 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 5/6] iio: osf: add UART serdev transport
Date: Fri, 29 May 2026 21:10:04 +0900
Message-ID: <20260529121005.1470-6-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529121005.1470-1-kimjinseob88@gmail.com>
References: <20260529121005.1470-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the OSF serdev driver.

Pass received bytes into the OSF0 stream parser.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                               |   4 +
 drivers/iio/Kconfig                       |   1 +
 drivers/iio/Makefile                      |   1 +
 drivers/iio/opensensorfusion/Kconfig      |  15 +++
 drivers/iio/opensensorfusion/Makefile     |   5 +
 drivers/iio/opensensorfusion/osf_core.c   | 107 +++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h   |  18 ++++
 drivers/iio/opensensorfusion/osf_serdev.c | 111 ++++++++++++++++++++++
 8 files changed, 262 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 91c342d88..ebbd82bf0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19982,7 +19982,11 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
 F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
+F:	drivers/iio/opensensorfusion/Kconfig
+F:	drivers/iio/opensensorfusion/Makefile
+F:	drivers/iio/opensensorfusion/osf_core.*
 F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_serdev.c
 F:	drivers/iio/opensensorfusion/osf_stream.*
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
diff --git a/drivers/iio/Kconfig b/drivers/iio/Kconfig
index 661127aed..939f6c546 100644
--- a/drivers/iio/Kconfig
+++ b/drivers/iio/Kconfig
@@ -101,6 +101,7 @@ source "drivers/iio/light/Kconfig"
 source "drivers/iio/magnetometer/Kconfig"
 source "drivers/iio/multiplexer/Kconfig"
 source "drivers/iio/orientation/Kconfig"
+source "drivers/iio/opensensorfusion/Kconfig"
 source "drivers/iio/test/Kconfig"
 if IIO_TRIGGER
    source "drivers/iio/trigger/Kconfig"
diff --git a/drivers/iio/Makefile b/drivers/iio/Makefile
index cb80ef837..d864fe17b 100644
--- a/drivers/iio/Makefile
+++ b/drivers/iio/Makefile
@@ -37,6 +37,7 @@ obj-y += light/
 obj-y += magnetometer/
 obj-y += multiplexer/
 obj-y += orientation/
+obj-y += opensensorfusion/
 obj-y += position/
 obj-y += potentiometer/
 obj-y += potentiostat/
diff --git a/drivers/iio/opensensorfusion/Kconfig b/drivers/iio/opensensorfusion/Kconfig
new file mode 100644
index 000000000..360f25b4f
--- /dev/null
+++ b/drivers/iio/opensensorfusion/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config OPEN_SENSOR_FUSION
+	tristate "Open Sensor Fusion UART IIO driver"
+	depends on IIO
+	depends on SERIAL_DEV_BUS
+	select CRC32
+	help
+	  Build the Open Sensor Fusion UART receive path.
+
+	  The driver receives OSF0 frames over a serdev UART.
+	  Frames are decoded and validated before being passed to the
+	  driver core.
+	  This patch only adds the transport path.
+	  IIO device registration is added separately.
diff --git a/drivers/iio/opensensorfusion/Makefile b/drivers/iio/opensensorfusion/Makefile
new file mode 100644
index 000000000..940c82edd
--- /dev/null
+++ b/drivers/iio/opensensorfusion/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_OPEN_SENSOR_FUSION) += open-sensor-fusion.o
+
+open-sensor-fusion-y := osf_core.o osf_protocol.o osf_serdev.o osf_stream.o
diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opensensorfusion/osf_core.c
new file mode 100644
index 000000000..c867b3158
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_core.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "osf_core.h"
+#include "osf_protocol.h"
+
+#define OSF_RESERVED_MSG_FIRST		0x7f00
+#define OSF_RESERVED_MSG_LAST		0x7fff
+#define OSF_VENDOR_PRIVATE_FIRST	0x8000
+
+void osf_core_init(struct osf_device *osf, struct device *dev)
+{
+	memset(osf, 0, sizeof(*osf));
+	osf->dev = dev;
+}
+
+void osf_core_unregister_iio(struct osf_device *osf)
+{
+}
+
+static int osf_core_validate_sensor_sample(const struct osf_frame *frame)
+{
+	struct osf_sensor_sample sample;
+
+	return osf_protocol_decode_sensor_sample(frame, &sample);
+}
+
+static int osf_core_validate_device_status(const struct osf_frame *frame)
+{
+	struct osf_device_status status;
+	int ret;
+
+	ret = osf_protocol_decode_device_status(frame, &status);
+	if (ret)
+		return ret;
+
+	if (status.reserved)
+		return -EPROTO;
+
+	return 0;
+}
+
+static int osf_core_validate_capability_report(const struct osf_frame *frame)
+{
+	struct osf_capability_entry entry;
+	struct osf_capability_report report;
+	unsigned int i;
+	int ret;
+
+	ret = osf_protocol_decode_capability_report(frame, &report);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < report.capability_count; i++) {
+		ret = osf_protocol_decode_capability_entry(&report, i, &entry);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t len)
+{
+	struct osf_frame frame;
+	size_t frame_len;
+	int ret;
+
+	if (!osf || !buf)
+		return -EINVAL;
+
+	ret = osf_protocol_decode_frame(buf, len, &frame, &frame_len);
+	if (ret)
+		return ret;
+
+	if (frame_len != len)
+		return -EMSGSIZE;
+
+	switch (frame.message_type) {
+	case OSF_MSG_SENSOR_SAMPLE:
+		ret = osf_core_validate_sensor_sample(&frame);
+		break;
+	case OSF_MSG_DEVICE_STATUS:
+		ret = osf_core_validate_device_status(&frame);
+		break;
+	case OSF_MSG_CAPABILITY_REPORT:
+		ret = osf_core_validate_capability_report(&frame);
+		break;
+	default:
+		if (frame.message_type >= OSF_RESERVED_MSG_FIRST &&
+		    frame.message_type <= OSF_RESERVED_MSG_LAST)
+			ret = 0;
+		else if (frame.message_type >= OSF_VENDOR_PRIVATE_FIRST)
+			ret = 0;
+		else
+			ret = -EOPNOTSUPP;
+		break;
+	}
+
+	if (!ret)
+		osf->last_sequence = frame.sequence;
+
+	return ret;
+}
diff --git a/drivers/iio/opensensorfusion/osf_core.h b/drivers/iio/opensensorfusion/osf_core.h
new file mode 100644
index 000000000..3680c8c9b
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_core.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_CORE_H
+#define _OSF_CORE_H
+
+#include <linux/types.h>
+
+struct device;
+
+struct osf_device {
+	struct device *dev;
+	u64 last_sequence;
+};
+
+void osf_core_init(struct osf_device *osf, struct device *dev);
+void osf_core_unregister_iio(struct osf_device *osf);
+int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t len);
+
+#endif
diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/opensensorfusion/osf_serdev.c
new file mode 100644
index 000000000..1ac93548d
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_serdev.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "osf_core.h"
+#include "osf_stream.h"
+
+#define OSF_SERDEV_BAUD		115200
+
+struct osf_serdev {
+	struct serdev_device *serdev;
+	struct osf_device osf;
+	struct osf_stream stream;
+};
+
+static size_t osf_serdev_receive_buf(struct serdev_device *serdev,
+				     const u8 *buf, size_t count)
+{
+	struct osf_serdev *osf_uart = serdev_device_get_drvdata(serdev);
+	const struct osf_stream_stats *stats;
+	u64 valid_before;
+	int ret;
+
+	valid_before = osf_uart->stream.stats.valid_frames;
+	ret = osf_stream_receive_bytes(&osf_uart->stream, buf, count);
+	stats = &osf_uart->stream.stats;
+
+	if (ret || stats->valid_frames != valid_before)
+		dev_dbg_ratelimited(&serdev->dev,
+				    "rx count=%zu valid=%llu bad_magic=%llu bad_crc=%llu partial=%llu dropped=%llu ret=%d\n",
+				    count,
+				    (unsigned long long)stats->valid_frames,
+				    (unsigned long long)stats->bad_magic_resyncs,
+				    (unsigned long long)stats->bad_crc_frames,
+				    (unsigned long long)stats->partial_frames,
+				    (unsigned long long)stats->dropped_bytes,
+				    ret);
+
+	return count;
+}
+
+static const struct serdev_device_ops osf_serdev_ops = {
+	.receive_buf = osf_serdev_receive_buf,
+};
+
+static int osf_serdev_probe(struct serdev_device *serdev)
+{
+	struct osf_serdev *osf_uart;
+	unsigned int baudrate;
+	int ret;
+
+	osf_uart = devm_kzalloc(&serdev->dev, sizeof(*osf_uart), GFP_KERNEL);
+	if (!osf_uart)
+		return -ENOMEM;
+
+	osf_uart->serdev = serdev;
+	osf_core_init(&osf_uart->osf, &serdev->dev);
+	osf_stream_init(&osf_uart->stream, &osf_uart->osf);
+
+	serdev_device_set_drvdata(serdev, osf_uart);
+	serdev_device_set_client_ops(serdev, &osf_serdev_ops);
+
+	ret = serdev_device_open(serdev);
+	if (ret)
+		return ret;
+
+	baudrate = serdev_device_set_baudrate(serdev, OSF_SERDEV_BAUD);
+	if (baudrate != OSF_SERDEV_BAUD)
+		dev_warn(&serdev->dev, "requested %u baud, controller set %u\n",
+			 OSF_SERDEV_BAUD, baudrate);
+
+	serdev_device_set_flow_control(serdev, false);
+
+	return 0;
+}
+
+static void osf_serdev_remove(struct serdev_device *serdev)
+{
+	struct osf_serdev *osf_uart = serdev_device_get_drvdata(serdev);
+
+	serdev_device_close(serdev);
+	osf_stream_reset(&osf_uart->stream);
+	osf_core_unregister_iio(&osf_uart->osf);
+}
+
+static const struct of_device_id osf_serdev_of_match[] = {
+	{ .compatible = "opensensorfusion,osf-green" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, osf_serdev_of_match);
+
+static struct serdev_device_driver osf_serdev_driver = {
+	.probe = osf_serdev_probe,
+	.remove = osf_serdev_remove,
+	.driver = {
+		.name = "open-sensor-fusion-uart",
+		.of_match_table = osf_serdev_of_match,
+	},
+};
+
+module_serdev_device_driver(osf_serdev_driver);
+
+MODULE_DESCRIPTION("Open Sensor Fusion IIO driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

