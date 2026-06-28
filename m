Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B913148A3
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674074; cv=none; b=hz3bMyZV67UYLkSqlK784n85RLfvdV7WekoK8IhfSjMJJZGu4hqiuStHyJV4dcQuJCKi1IoEdInDwu2HOc+7wzyE0Nb51URaawVQ0aXfrlXWqpg0cbT7Fkxg8XPLex1mOvgvJi+9et4bEaQLB0zYLah6gqElcTP2venZDBkroYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674074; c=relaxed/simple;
	bh=DMlhYtJnEvPn70yRypx4cuGLqNJDYuWiklxXB+wROq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmyNuZA4KQjwiHP5wcjn+sRNmPsEEqaqLcvcX/AlUtv7MdWHqb33rwu7BUDKxjkac29hHC5VbbD/MIj39XwnvsWj69TQ1P2brDCBb+lJJ/OBLjDLbGQVdPsiAERI+1Ae0Rgnsb1dKozR/uCfxzMtDX1Ua6iafmkTE0vIyBIg6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKqqH+Kx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKqqH+Kx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9e89fded0so3775475ad.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782674071; x=1783278871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkelLxlwo9Oa3TSDm0DqWkVvnNdXa84mEmjMr+oRxK8=;
        b=SKqqH+KxubcX2MkJQU3j5R5hfvi3FqeAQ226lULw5uAePq5bbtE4ZJVXvi6g7YYEb/
         lG3PzT1CheFZRz8iry3jygt2RYcY41rUpUdyAhdCYL+YA77OCu6H6SOYV+ESuRgwT3yv
         O4hDcl8/Tfz59KluoYzw+Se0ccbRMJU5D5xmqeakp/E5S40lRY80hCJK4oEVQPR7Rq/K
         6GZbDGJjDhbhQ+ZFhdg3SO4VwqkLtL84abZ2mr29qd5mIQ8H1e9oi+M8r0uYHTcX8XZo
         WMnVC7OXbjAeBkobfV1bqzENI0NMMs6Zu9m8yhwlmLf67GwyUgpi32RDx4rqzFiop/px
         YjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674071; x=1783278871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkelLxlwo9Oa3TSDm0DqWkVvnNdXa84mEmjMr+oRxK8=;
        b=RL/CykigITnvULezMDpGmVKlzSP5PJ7zeEaZ4G69jS5hlC4vyL1F91STyNzwg1TUgc
         xVNkLppQZkz2REW5D8H9hpYgdVZVx1opMZ8nUakxte2PWCSRyF0ZoLLFS2Vu2+X1nHmS
         SYdb2tY8cVe7o5cjxN/tCHhxHjgsVWrTlX6e/jr6ppla5eWpFvmicTrC3D1gn/M68aLZ
         /LJAAfE91PB2UcosA2nD56XRDbguHAXRqlCWvN6wI5P6WEuni0GXbwGD9IFcMuVoat1P
         Na86rLUTMUxIJZp75Jdjf78MV+LzKfTXKS8iPQ8Vzao+RA1HDclr4eNh4g/rdm2lRKv+
         r9Eg==
X-Forwarded-Encrypted: i=1; AHgh+RryiLu098bN7GMwDooQUNJPMdeafKRmFL9raXQjvcC9FCK5loMp5ao3mYDT/t5WOjf7yOflG+BjgWmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUseohU1BUrTqvJcnN4JN0wpowykS/JnNVgjVGpcokeu6I4rJd
	8oDQkjKljNQzcHbkOCKbA7oUP3GtU8yWftBXCM5u07iva7Czsc4+nwJc
X-Gm-Gg: AfdE7clNu4RFdjhplkgnjeVdIhEDJI9GrO15hwMAxZkXGg9HAmy7bhoomdHd67rv89D
	mKhrfTqx8vHczmV312tnhIdmvoyADO7fHlSIuBHdCgaKn+81KdzKmvl3H89FxlCRrd4mZ1y1wF5
	N/Boj/MkI3ROR5y8xyLcvJ5i/GC1Pdg2jWe3Yesl10J3sr/lr9yZCIKjSW1RcqS2s4Kqu6Qpw03
	jyOMKxpIY3JtqAX+rW0oH9tl2NHNb+lYABPS3GL0c8k52h0tPIryO88b6dYeDZ38ps6k7j4wnI6
	9K6joWH1kskmLo4TkzdrPromuAkMUwhVhy44PesNapwQPaWC7KaJsmKaruAgTHw7yw8INn+3E5o
	W1iq7Au5vx8mlhWgn6jhCTISRFYzSA16yXKzTNIN8/7i9zw+0MdXT4xrM7jbq49Z9UXSOohPkLp
	0hNW3vopa/kITndpHCD5jM6V9RsbPKLyVZ5ILO7jEGd2QfY8nup1tjqiDNH6dScASHnZQv4tZsF
	Mmx3U9/UTV6eJQVPEFTbz5F2lKy
X-Received: by 2002:a17:903:390b:b0:2c9:97a7:f549 with SMTP id d9443c01a7336-2c997a7f62bmr69034425ad.47.1782674070942;
        Sun, 28 Jun 2026 12:14:30 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm1354385ad.2.2026.06.28.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:14:30 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v6 3/5] iio: osf: add protocol decoding
Date: Mon, 29 Jun 2026 04:13:35 +0900
Message-ID: <20260628191337.937-4-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628191337.937-1-kimjinseob88@gmail.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helpers for decoding Open Sensor Fusion frame headers and supported
message payloads.

The decoder validates the OSF0 wire magic, protocol major version,
header length, payload bounds, reserved fields and CRC before exposing
decoded frame contents to the rest of the driver.

Use explicit little-endian wire storage sizes and designated
initializers for decoded output structures.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                                 |   1 +
 drivers/iio/opensensorfusion/osf_protocol.c | 258 ++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h |  97 ++++++++
 3 files changed, 356 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 17c80b55b..32d3e7674 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20016,6 +20016,7 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 F:	Documentation/iio/open-sensor-fusion.rst
+F:	drivers/iio/opensensorfusion/osf_protocol.*
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/opensensorfusion/osf_protocol.c
new file mode 100644
index 000000000..7e27ce3b0
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/crc32.h>
+#include <linux/errno.h>
+#include <linux/limits.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_protocol.h"
+
+#define OSF_CRC32_INIT		GENMASK(31, 0)
+#define OSF_CRC32_XOROUT	GENMASK(31, 0)
+#define OSF_FRAME_MAGIC		0x3046534f /* "OSF0" little-endian */
+
+static bool osf_sensor_type_valid(u16 sensor_type)
+{
+	return sensor_type >= OSF_SENSOR_ACCELEROMETER &&
+	       sensor_type <= OSF_SENSOR_PROXIMITY;
+}
+
+static u32 osf_crc32_ieee(const u8 *buf, size_t len)
+{
+	return crc32_le(OSF_CRC32_INIT, buf, len) ^ OSF_CRC32_XOROUT;
+}
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len)
+{
+	u32 expected_crc;
+	u32 actual_crc;
+	u32 payload_len;
+	size_t total_len;
+	u8 major;
+
+	if (!buf || !frame || !frame_len)
+		return -EINVAL;
+
+	if (len < OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	if (get_unaligned_le32(buf) != OSF_FRAME_MAGIC)
+		return -EPROTO;
+
+	major = buf[4];
+	if (major != OSF_PROTOCOL_MAJOR)
+		return -EPROTO;
+
+	if (get_unaligned_le16(buf + 6) != OSF_FRAME_HEADER_LEN)
+		return -EPROTO;
+
+	payload_len = get_unaligned_le32(buf + 10);
+	if (payload_len > len - OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	if (get_unaligned_le32(buf + 34))
+		return -EPROTO;
+
+	total_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+	expected_crc = osf_crc32_ieee(buf, OSF_FRAME_HEADER_LEN + payload_len);
+	actual_crc = get_unaligned_le32(buf + OSF_FRAME_HEADER_LEN + payload_len);
+
+	if (actual_crc != expected_crc)
+		return -EBADMSG;
+
+	frame->protocol_minor = buf[5];
+	frame->message_type = get_unaligned_le16(buf + 8);
+	frame->payload_len = payload_len;
+	frame->sequence = get_unaligned_le64(buf + 14);
+	frame->timestamp_us = get_unaligned_le64(buf + 22);
+	frame->flags = get_unaligned_le32(buf + 30);
+	frame->payload = buf + OSF_FRAME_HEADER_LEN;
+	frame->crc = actual_crc;
+	*frame_len = total_len;
+
+	return 0;
+}
+
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample)
+{
+	u16 channel_count;
+	u16 sample_format;
+	u16 sensor_type;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !sample || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_SENSOR_SAMPLE)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_SENSOR_SAMPLE_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	sensor_type = get_unaligned_le16(payload);
+	channel_count = get_unaligned_le16(payload + 4);
+	sample_format = get_unaligned_le16(payload + 6);
+
+	if (!osf_sensor_type_valid(sensor_type))
+		return -EPROTO;
+
+	if (!channel_count)
+		return -EPROTO;
+
+	if (sample_format != OSF_SAMPLE_FORMAT_S32)
+		return -EPROTO;
+
+	if (get_unaligned_le32(payload + 12))
+		return -EPROTO;
+
+	if (channel_count > (SIZE_MAX - OSF_SENSOR_SAMPLE_BASE_LEN) /
+	    sizeof(__le32))
+		return -EOVERFLOW;
+
+	expected_len = OSF_SENSOR_SAMPLE_BASE_LEN + channel_count * sizeof(__le32);
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*sample = (struct osf_sensor_sample) {
+		.sensor_type = sensor_type,
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = channel_count,
+		.sample_format = sample_format,
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.samples = payload + OSF_SENSOR_SAMPLE_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value)
+{
+	if (!sample || !sample->samples || !value)
+		return -EINVAL;
+
+	if (index >= sample->channel_count)
+		return -ERANGE;
+
+	/* Samples are little-endian two's-complement signed values. */
+	*value = get_unaligned_le32(sample->samples + index * sizeof(__le32));
+
+	return 0;
+}
+
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status)
+{
+	const u8 *payload;
+
+	if (!frame || !status || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_DEVICE_STATUS)
+		return -EPROTO;
+
+	if (frame->payload_len != OSF_DEVICE_STATUS_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	if (get_unaligned_le32(payload + 16))
+		return -EPROTO;
+
+	*status = (struct osf_device_status) {
+		.uptime_s = get_unaligned_le32(payload),
+		.status_flags = get_unaligned_le32(payload + 4),
+		.error_flags = get_unaligned_le32(payload + 8),
+		.dropped_frames = get_unaligned_le32(payload + 12),
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report)
+{
+	u16 capability_count;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !report || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_CAPABILITY_REPORT)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_CAP_REPORT_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	capability_count = get_unaligned_le16(payload);
+
+	if (get_unaligned_le16(payload + 2))
+		return -EPROTO;
+
+	if (capability_count > (SIZE_MAX - OSF_CAP_REPORT_BASE_LEN) /
+	    OSF_CAP_SENSOR_ENTRY_LEN)
+		return -EOVERFLOW;
+
+	expected_len = OSF_CAP_REPORT_BASE_LEN +
+		       capability_count * OSF_CAP_SENSOR_ENTRY_LEN;
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*report = (struct osf_capability_report) {
+		.capability_count = capability_count,
+		.entries = payload + OSF_CAP_REPORT_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry)
+{
+	u16 sample_format;
+	u16 sensor_type;
+	u32 flags;
+	const u8 *payload;
+
+	if (!report || !report->entries || !entry)
+		return -EINVAL;
+
+	if (index >= report->capability_count)
+		return -ERANGE;
+
+	payload = report->entries + index * OSF_CAP_SENSOR_ENTRY_LEN;
+	sensor_type = get_unaligned_le16(payload);
+	sample_format = get_unaligned_le16(payload + 6);
+	flags = get_unaligned_le32(payload + 12);
+
+	if (!osf_sensor_type_valid(sensor_type))
+		return -EPROTO;
+
+	if (sample_format != OSF_SAMPLE_FORMAT_S32)
+		return -EPROTO;
+
+	if (flags & ~OSF_CAPABILITY_FLAGS_MASK)
+		return -EPROTO;
+
+	if (get_unaligned_le32(payload + 16))
+		return -EPROTO;
+
+	*entry = (struct osf_capability_entry) {
+		.sensor_type = sensor_type,
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = get_unaligned_le16(payload + 4),
+		.sample_format = sample_format,
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.flags = flags,
+	};
+
+	return 0;
+}
diff --git a/drivers/iio/opensensorfusion/osf_protocol.h b/drivers/iio/opensensorfusion/osf_protocol.h
new file mode 100644
index 000000000..479cb07af
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_PROTOCOL_H
+#define _OSF_PROTOCOL_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#define OSF_PROTOCOL_MAJOR		0
+#define OSF_PROTOCOL_MINOR		0
+#define OSF_FRAME_HEADER_LEN		38
+#define OSF_FRAME_CRC_LEN		4
+#define OSF_FRAME_MIN_LEN		(OSF_FRAME_HEADER_LEN + OSF_FRAME_CRC_LEN)
+
+#define OSF_SENSOR_SAMPLE_BASE_LEN	16
+#define OSF_DEVICE_STATUS_LEN		20
+#define OSF_CAP_REPORT_BASE_LEN		4
+#define OSF_CAP_SENSOR_ENTRY_LEN		20
+#define OSF_CAPABILITY_FLAGS_MASK	GENMASK(1, 0)
+
+enum osf_message_type {
+	OSF_MSG_SENSOR_SAMPLE		= 0x0001,
+	OSF_MSG_DEVICE_STATUS		= 0x0002,
+	OSF_MSG_CAPABILITY_REPORT	= 0x0003,
+};
+
+enum osf_sensor_type {
+	OSF_SENSOR_ACCELEROMETER		= 0x0001,
+	OSF_SENSOR_GYROSCOPE		= 0x0002,
+	OSF_SENSOR_MAGNETOMETER		= 0x0003,
+	OSF_SENSOR_BAROMETER		= 0x0004,
+	OSF_SENSOR_TEMPERATURE		= 0x0005,
+	OSF_SENSOR_HUMIDITY		= 0x0006,
+	OSF_SENSOR_AMBIENT_LIGHT		= 0x0007,
+	OSF_SENSOR_PROXIMITY		= 0x0008,
+};
+
+enum osf_sample_format {
+	OSF_SAMPLE_FORMAT_S32		= 0x0001,
+};
+
+struct osf_frame {
+	u8 protocol_minor;
+	u16 message_type;
+	u32 payload_len;
+	u64 sequence;
+	u64 timestamp_us;
+	u32 flags;
+	/* payload points into the caller-owned frame buffer. */
+	const u8 *payload;
+	u32 crc;
+};
+
+struct osf_sensor_sample {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	const u8 *samples;
+};
+
+struct osf_device_status {
+	u32 uptime_s;
+	u32 status_flags;
+	u32 error_flags;
+	u32 dropped_frames;
+};
+
+struct osf_capability_report {
+	u16 capability_count;
+	const u8 *entries;
+};
+
+struct osf_capability_entry {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	u32 flags;
+};
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len);
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample);
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status);
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report);
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry);
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value);
+
+#endif
-- 
2.43.0

