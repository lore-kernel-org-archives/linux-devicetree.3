Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466252EFD9B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 01:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388774; cv=none; b=ooEjoXOfSwNFHFAM8R7MbxTfXXIONKX0F1GFsn0YWMMCP/iBo/ZduvhXJ+KYXVW/eFMBWoxFB09OIHndm81HqNK4L7xrrW9R+cOE+C5nxNXZrG4CoI/6VWhBJl9kTKbUPhQB26B0EDofTKZi3S/v0FMbtCRENMnUPWAcVpg+ez0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388774; c=relaxed/simple;
	bh=kI7s9yltd5AgkLI2bxLn3xeHM1lNdmxvr1rM9cs3Ilo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQ8wI7R2woUD6yFgZ6g2NIRHDG+b9Bmt3XAfCnhrPmw2jZyHxi4TTjY/FSA8CE6Hq/rYtSehAyUvH1+DQAazjgyLW6/pzHLSD7rHJXL8CgZKK8Ixkj2f5NT07/efUmI2fffiPIvAyfyAgQIUaGkJbYi5HZh9DI1BSXgLFC0JOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJvWIvkT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJvWIvkT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8478cc93299so3987723b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388773; x=1783993573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+EFZlSjNgkKbpQvGXdwF4M2t0hpDuDX0ewz9Q4mIcg=;
        b=AJvWIvkTPLAQm65G1fr9M3i8dXtxkcPDNG2l14RGQeC3uE/yIaSHUGmJlEkTvvKC1u
         S3xzEn8kvNMyGHUFqle4U91ZRMD/hFfC4SxiLLK3aUUmPJqvK1h7iEBn9SQQiQoZHqRQ
         QR8q2/MszpxgxkrIKRgqrlgvMU4h4WziAMnIK9M0347tlMrd3001CPUOCfggf5Irw4P8
         yvmwMdnhEMV1v4505tkuHYdy9ctb9H2pRhFlZwI9uXKHTHBIuZMOaorjOVau9R9wVapn
         pks2S04KO96ojIfLuVaA62Q8zB3xc7p+SiyOAUhSLyRnCXrEILkbmUOaVo84SBMVKKwr
         Pscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388773; x=1783993573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+EFZlSjNgkKbpQvGXdwF4M2t0hpDuDX0ewz9Q4mIcg=;
        b=bvrjtftRNZzgt+TvnvoLpcdW8xspHEnMKXt6a9N+/5GYjcdRs6e7LgERMN9HEcBU+N
         BsaJ5PN8px/2VIKyXk2fkERTRj7Z4rH5tI4gSPtY7J92T50+FV/hsYJM8tCocCMpFZHY
         p5s7IF64NtAbZTn1SNhbV3Dww1xK4XllPGSjUD3IYj9i864JXqcLwV1Mi6CFC4Yhrnvv
         irI0Quyn6yAuPKGY8QXPFa4EfRoatkU+JaaenFEkNTWYMG4aQJJ0m0bF/3ipjDWiKOHS
         YiwfuKSG21dpeN4TmlILOqTEZh2xS9YVe89CyMKx5+HvT+hU/wUTdpGwAuPnybns1ROf
         wRcw==
X-Forwarded-Encrypted: i=1; AHgh+RppRVjJuYWPgZNRKalYzC9tjdV8bk/SqbWzkeCoM2LTbjrFsYRWzHWFNKBrAK4MYgYHSkdYvq8R44A7@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTdrts+ZKGHB7o1xsypaXiHm/JC7h9ze894T5+Vqq2bd94X1t
	UHoAbR0xUb+OignFk/An6z+PkZfkllXUzcno1sX0HCkixUMU2CFMj3aY
X-Gm-Gg: AfdE7cnYP8TielMmoJGB7Ys/XN1rtkYiEaKWrkg1Hk0LN8pKEiTQElYkfOCgf+HOgei
	uzO75VRpbr6aaprARkb2k5rR6bX2LlQYRHH47mLZLFQvWyuUjWWvOLZ5gWfmxDnoKSSyhvmwKaU
	nxHzdkIoki7wCuw2MDJIs+ZibjkVQPIQI6880h8CRMD32JZ6e3r9ljC5F8YJNhByK3pJ64Mnc9U
	wmmM4fPB2RZUWqUQ0NabShxuLhelecztq2+50Zob022q8mQvU61pYjQFJtoefXtJEWoDk3gistg
	ndGBNl5GgDdahsMKA/3yH88y53CR9JhQdVZqjimY5ddHLGc2Ejosay8iqe3JmCwhuDB3ZD0yVEl
	newfRNC4dEBvmeZYVoRkUfiFDgbSjMmwsA/RlFu0Sqmwf3uOvsVl5NpyDNUZbq4lngQLnXYZVLa
	hD4XXs5Qr51V0eUW5BV3HARcFTx30vwkNo8Ac+29Y5lNwVH59BU6sWa1YBzHidfWvk6lnP2H4UQ
	G3KBuOhPS5elneSgoEax6ijWfLlr6PSTZ3gDe8=
X-Received: by 2002:a05:6a00:908d:b0:847:1d73:f753 with SMTP id d2e1a72fcca58-84826df100cmr3050359b3a.45.1783388772700;
        Mon, 06 Jul 2026 18:46:12 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4645653b3a.28.2026.07.06.18.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:46:12 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/5] iio: osf: add protocol decoding
Date: Tue,  7 Jul 2026 10:45:23 +0900
Message-ID: <20260707014525.1015-4-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707014525.1015-1-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
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
 drivers/iio/opensensorfusion/osf_protocol.c | 242 ++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h | 100 ++++++++
 3 files changed, 343 insertions(+)
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
index 000000000..b5749525e
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/crc32.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_protocol.h"
+
+#define OSF_CRC32_INIT		GENMASK(31, 0)
+#define OSF_CRC32_XOROUT	GENMASK(31, 0)
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
+	if (get_unaligned_le16(buf + 6) != OSF_FRAME_HEADER_LEN)
+		return -EPROTO;
+
+	payload_len = get_unaligned_le32(buf + 10);
+	if (payload_len > len - OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	total_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+	expected_crc = osf_crc32_ieee(buf, OSF_FRAME_HEADER_LEN + payload_len);
+	actual_crc = get_unaligned_le32(buf + OSF_FRAME_HEADER_LEN + payload_len);
+
+	if (actual_crc != expected_crc)
+		return -EBADMSG;
+
+	frame->protocol_major = buf[4];
+	frame->protocol_minor = buf[5];
+	frame->message_type = get_unaligned_le16(buf + 8);
+	frame->payload_len = payload_len;
+	frame->sequence = get_unaligned_le64(buf + 14);
+	frame->timestamp_us = get_unaligned_le64(buf + 22);
+	frame->flags = get_unaligned_le32(buf + 30);
+	frame->reserved = get_unaligned_le32(buf + 34);
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
index 000000000..f87b504aa
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.h
@@ -0,0 +1,100 @@
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
+#define OSF_FRAME_MAGIC			0x3046534f /* "OSF0", little-endian */
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
+	u8 protocol_major;
+	u8 protocol_minor;
+	u16 message_type;
+	u32 payload_len;
+	u64 sequence;
+	u64 timestamp_us;
+	u32 flags;
+	u32 reserved;
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

