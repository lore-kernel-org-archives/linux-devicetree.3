Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5543E121B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056662; cv=none; b=gDHPM9HkYq1zYey4adqkK9j0crDDMRut9Tl+YQd5ITEWSmlwrfwWWEUNQGn0mylUE5oY7ZWLL/aehjjrqK5JS+B7lv+/C3TjfHp2PLgm7qIeo5LwUcupX8PzQ4Iv2zizxo1roNcKe+qsQ/XHsRBZjYxnn8R5PwNnH4xdJrBT/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056662; c=relaxed/simple;
	bh=5hBuvenJVW1uhvf1FlYMNBQsWWfgRCpmbHXB90VN/aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbOeBM7fVJIx1SfWBLTuzokSDRWQBcf8amYfLfgcYKzNg/d1f4i/4eig2pcED77cfgCGc811z0ixPLLkoXotRZm62b6usIGfmFwYehhy04heAu34O8TM95E/IZ898SJtSi6CJInvxbTU5AL27sfB8K7vM0rbUVupGTmNR8qkzp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7wrRw6J; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7wrRw6J"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3680540a6efso7878560a91.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056660; x=1780661460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emS1jQNoBv7TJ3i72JnQuDzTHH8V4k0g2GqipVr6FaE=;
        b=f7wrRw6JHzyNBVp6qLRzbnshBdZ/N+pBIsHmI35DA6MkzDaxexoTim6rMFIDMXFMSF
         f5RuHBhimEFDEKldZMlZ6zNT0Xh8X+dJk6P8ghgaidBhlKvA/JYwmq3PYuZoZe4XAptQ
         GooZRnc5ybSZyj8iKDHyEmtij+YjjlYdeoVoza+wBUMur2Xn0yE21ppB36hbGolPRACQ
         9vh7/3cdglO/Mf9ld2jExXQJHzEbUNKmclemLJYgBYR4S2sOBuXNdvpj7+kNPImt5Jh3
         AVlw5zP5VZw03tnQpmeTbA0QFKXVh70pYdGw9/7zGPzzi3aQwCOcsRAuNIm2uIe1ht6/
         IIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056660; x=1780661460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emS1jQNoBv7TJ3i72JnQuDzTHH8V4k0g2GqipVr6FaE=;
        b=JJXpnQrnkGJj2+LkmlTO9thysAmgUOWTw0Jn4DMHDdFCQEIS4RsTZ2vKNiRFQa6R0b
         9aS16My9/Y9nlPlogkxV1ra4QiH1DQCMLaP36VEJv6UbGjb0uk8Cu4s2pY4EpxhF2HJY
         Vrxsr2A5dzqs9ej3L7AzzqyqcGVTJWsLs/ZjJmzoIdlWJvufLxuaQH6hXmb2lvxTIXkL
         w6v/1DyTZ6MnMbNSBisZ3IyZidxgteJAbTGzrJMmVjhTcJ1vF87mQ5WrS9EqHWXE5cZI
         kjQGmjc72OHWaT4mZWvSRfMR9IrBb1cazLELUmtK2Kd4m+skSXYQse/lsycK4Y2ILKNm
         RM5g==
X-Forwarded-Encrypted: i=1; AFNElJ/TEGZJn77aJZXd1gCqIJYJ0P7pR/xMoMsDu4bMQ0gLU7Jgk2txExQ7QSGwa8esYQ4l8bNe3UjUo2m8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OFfiN1VIK0k+K9RzbOsQUMhSEeDUCseKGvQty6grHFxExz66
	1yVKez/rBm7H82eqrMIIIVFgu0uGztigLy/U5juj5smWgCDktpTfgstx
X-Gm-Gg: Acq92OEHKtbnKdhVfFx9aT48RzA1pEeLguun/6DK+S1tEkk1KNhHjLt+9Fw2AYInhkX
	G6OojH0QHjaOnkw9HLKVzpLLGvQ+yCFo8Evq2Bv6EeroZkI3TDZriCK+2iv7ld1DvtjNnKfTu+R
	IK20PrU+0mFVgJC3Fr4tcgDCfiwyIzczIw4/gPoQLgd5E040b1A4Nvbrk6HahYSvY6fLEVX9tGz
	w6X08psKpA8kCetUsj1Jk88eMB7uOcOcg319XTbqz4VEeiNaPQcM5JCsfUoXV//nn869iuPgEAp
	MCP4fQDYDabHH8WgIdZrX/VsXIW08Kv5gLsePGBdQIe/UG6rynOorKzyA38x6tPVpHdoR8WCJc+
	Ag3jfPWHS1WibXCmXRKMdVoLJkU3Ix9WRRXP4XVE6DnCsPAIjms4xDK7/mXoNBRpW29425Pe6Kd
	2GeFjiirUIt/xUa1RNrEIakLrV2QhXM8aOTpypDb/CnwuzZ7DV5G2XL9/KH1qIXR4LnsfaiObuU
	cQmH5K37ce+brHnueDklu7QIFD0cTBvXUSUdjFg6zdBqrvH
X-Received: by 2002:a17:90b:2f0f:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-36bbc6c1b61mr3464420a91.0.1780056660426;
        Fri, 29 May 2026 05:11:00 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdf3afc6sm942820a91.7.2026.05.29.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:11:00 -0700 (PDT)
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
Subject: [PATCH RFC v3 4/6] iio: osf: add stream parser
Date: Fri, 29 May 2026 21:10:03 +0900
Message-ID: <20260529121005.1470-5-kimjinseob88@gmail.com>
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

Add the byte stream assembler and resync handling for OSF0 UART frames.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                               |   1 +
 drivers/iio/opensensorfusion/osf_stream.c | 207 ++++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h |  31 ++++
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fab72689..91c342d88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19983,6 +19983,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
 F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
 F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_stream.*
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Rob Herring <robh@kernel.org>
diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
new file mode 100644
index 000000000..a2739c987
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_core.h"
+#include "osf_protocol.h"
+#include "osf_stream.h"
+
+#define OSF_STREAM_MAGIC_LEN	4
+#define OSF_STREAM_MAX_PAYLOAD_LEN				\
+	(OSF_STREAM_MAX_FRAME_LEN - OSF_FRAME_HEADER_LEN - OSF_FRAME_CRC_LEN)
+
+static const u8 osf_stream_magic[OSF_STREAM_MAGIC_LEN] = {
+	'O', 'S', 'F', '0',
+};
+
+static void osf_stream_discard(struct osf_stream *stream, size_t count)
+{
+	if (count >= stream->len) {
+		stream->len = 0;
+		return;
+	}
+
+	memmove(stream->buf, stream->buf + count, stream->len - count);
+	stream->len -= count;
+}
+
+static void osf_stream_drop_invalid_head(struct osf_stream *stream)
+{
+	osf_stream_discard(stream, 1);
+}
+
+static bool osf_stream_magic_match(const u8 *buf, size_t len)
+{
+	return !memcmp(buf, osf_stream_magic, len);
+}
+
+static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
+{
+	size_t old_len = stream->len;
+	size_t match_len;
+	size_t i;
+
+	for (i = 0; i < stream->len; i++) {
+		match_len = stream->len - i;
+		if (match_len > OSF_STREAM_MAGIC_LEN)
+			match_len = OSF_STREAM_MAGIC_LEN;
+
+		if (osf_stream_magic_match(stream->buf + i, match_len)) {
+			if (i)
+				osf_stream_discard(stream, i);
+			return i;
+		}
+	}
+
+	stream->len = 0;
+	return old_len;
+}
+
+static int osf_stream_process(struct osf_stream *stream)
+{
+	struct osf_frame frame;
+	size_t decoded_len;
+	size_t discarded;
+	size_t frame_len;
+	u32 payload_len;
+	int first_err = 0;
+	int ret;
+
+	while (stream->len) {
+		discarded = osf_stream_discard_to_magic(stream);
+		if (discarded) {
+			stream->stats.bad_magic_resyncs++;
+			stream->stats.dropped_bytes += discarded;
+			if (!first_err)
+				first_err = -EPROTO;
+		}
+
+		if (!stream->len)
+			break;
+
+		if (stream->len < OSF_FRAME_HEADER_LEN) {
+			stream->stats.partial_frames++;
+			break;
+		}
+
+		if (get_unaligned_le16(stream->buf + 6) !=
+		    OSF_FRAME_HEADER_LEN) {
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = -EPROTO;
+			continue;
+		}
+
+		payload_len = get_unaligned_le32(stream->buf + 10);
+		if (payload_len > OSF_STREAM_MAX_PAYLOAD_LEN) {
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = -EMSGSIZE;
+			continue;
+		}
+
+		frame_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+		if (stream->len < frame_len) {
+			stream->stats.partial_frames++;
+			break;
+		}
+
+		ret = osf_protocol_decode_frame(stream->buf, frame_len, &frame,
+						&decoded_len);
+		if (ret) {
+			if (ret == -EBADMSG)
+				stream->stats.bad_crc_frames++;
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = ret;
+			continue;
+		}
+
+		if (decoded_len != frame_len) {
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
+			if (!first_err)
+				first_err = -EMSGSIZE;
+			continue;
+		}
+
+		ret = osf_core_receive_frame(stream->osf, stream->buf, frame_len);
+		if (ret) {
+			osf_stream_discard(stream, frame_len);
+			if (!first_err)
+				first_err = ret;
+			continue;
+		}
+
+		stream->stats.valid_frames++;
+		osf_stream_discard(stream, frame_len);
+	}
+
+	return first_err;
+}
+
+void osf_stream_init(struct osf_stream *stream, struct osf_device *osf)
+{
+	if (!stream)
+		return;
+
+	stream->osf = osf;
+	stream->len = 0;
+	memset(&stream->stats, 0, sizeof(stream->stats));
+}
+
+void osf_stream_reset(struct osf_stream *stream)
+{
+	if (stream) {
+		stream->len = 0;
+		memset(&stream->stats, 0, sizeof(stream->stats));
+	}
+}
+
+int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf,
+			     size_t len)
+{
+	size_t copy_len;
+	size_t space;
+	int first_err = 0;
+	int ret;
+
+	if (!stream || !stream->osf || (!buf && len))
+		return -EINVAL;
+
+	if (!len) {
+		ret = osf_stream_process(stream);
+		if (ret && !first_err)
+			first_err = ret;
+		return first_err;
+	}
+
+	while (len) {
+		space = OSF_STREAM_MAX_FRAME_LEN - stream->len;
+		if (!space) {
+			stream->stats.dropped_bytes++;
+			osf_stream_discard(stream, 1);
+			if (!first_err)
+				first_err = -EMSGSIZE;
+			continue;
+		}
+
+		copy_len = len < space ? len : space;
+		memcpy(stream->buf + stream->len, buf, copy_len);
+		stream->len += copy_len;
+		buf += copy_len;
+		len -= copy_len;
+
+		ret = osf_stream_process(stream);
+		if (ret && !first_err)
+			first_err = ret;
+	}
+
+	return first_err;
+}
diff --git a/drivers/iio/opensensorfusion/osf_stream.h b/drivers/iio/opensensorfusion/osf_stream.h
new file mode 100644
index 000000000..f7f9477fe
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_STREAM_H
+#define _OSF_STREAM_H
+
+#include <linux/types.h>
+
+#define OSF_STREAM_MAX_FRAME_LEN	4096
+
+struct osf_device;
+
+struct osf_stream_stats {
+	u64 valid_frames;
+	u64 bad_magic_resyncs;
+	u64 bad_crc_frames;
+	u64 partial_frames;
+	u64 dropped_bytes;
+};
+
+struct osf_stream {
+	struct osf_device *osf;
+	u8 buf[OSF_STREAM_MAX_FRAME_LEN];
+	size_t len;
+	struct osf_stream_stats stats;
+};
+
+void osf_stream_init(struct osf_stream *stream, struct osf_device *osf);
+void osf_stream_reset(struct osf_stream *stream);
+int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf,
+			     size_t len);
+
+#endif
-- 
2.43.0

