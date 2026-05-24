Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA338E8DA
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779612835; cv=none; b=PszVMbTmjStcTRPKh6sA+sJeLn83aQIm7zi3L7EHBZYA13UApybvWez6MGpMwvoMEi7qioeqJlgoW87i5+IKuJP/et2tNdnedfOJ/3SbNVRYCz21Y8aYG86ZiAvd2nv0li3xikxau1INQ0O0EJXDMTGHQWkvwOjQyTbxYKnB27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779612835; c=relaxed/simple;
	bh=JQFcnG2hyCIPDGZsHUJKv/yfIWKH5QAMSCNMowNCIpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHMbf158nPbNbA2e/VP5SUYdY6pZ9pOj1VkILwgVJMf2qZATsZ8c33qKOKqEfznE1xDlyYCj4iDVjzN1TKJpO4qvr2u0g+qz3d7TF7nPX1YIKz+zHZEjiEVxlDguk+0B72xikVMvzOPIRVb3jKLmVl2HjafPmbgMWIiQJ5FZX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTd3foSm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTd3foSm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3969349b3a.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779612833; x=1780217633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLhf9NCIQR8/SjUY7PFqXJOHwil80+JfrtnhSO8qnWs=;
        b=kTd3foSm0iCzdujau42QPr8qmTHhTf7nPAjh8+QX1zR6heMKVD8BMTswOFkY9yEY7E
         OPnnpUuCYHG00yVXLElyv5vWk4Sg6cmNPe5ImQqN+256QWSpfYaKkoyNNZkn/6Cn66Zo
         U95zjM8FAhLonyZyeRBrZZqHbYwJ0pjO9xUSjul9rB+CLjeqa/U2PHh9RbakFJExsC1+
         w7GDIjJsf7Mu5CcATRlzJFvKbKZxJoxhYDaHMlBLRaNkU8a/OwsX8tpTVu1InqEMwqgq
         83M8ZKYSVdQd9PJOP7jtmTgQEMQyzeRk548wmzoYWDRgI2dGmxC3cuTHLU/AcwEwL8R0
         MbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779612833; x=1780217633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLhf9NCIQR8/SjUY7PFqXJOHwil80+JfrtnhSO8qnWs=;
        b=KAnkAG9GnDqFlhzh4HvfV4LdlYSLnfXeQOJJWg+JoDYU1bogRfu2XRb0VLQt657nhL
         zy4iMtiGRMWu5Kgeth/G1ehuVgsIXl5yK8GZLby2bGsODXjkEABgi09K8UVTPlHczS2S
         YSs94X/EFXkQB7nejfAprd6BB8RPz5qIHsGWxXni3P2R3ayM8sN0onhx9NCUTZv4INeJ
         JpNnEHDSpIiXXE5A6HbJtj9J7yw9uaxTq6p1e+7EiAX4RN0Z0mlUV8+oJbzLoaYgqKQO
         WDMbU7nEX/bfIiT20eAkACyVU1PakdxxlMU1lx5qN37OX0Qa0dawZ85+sMeIr7Y+XQxV
         c/Rg==
X-Forwarded-Encrypted: i=1; AFNElJ/6hUaYDPVjCEkUIuP7hGRC2GOeRAWrJWAA2pcbyfTB69jlRLl2od4dWKqqrfL0ZGGV2x/VtdYqaPL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/xGIDZ9CXJlew+TMAD7+vTo9Ia19N5yx0l2h6QHCM+zLkip5
	05e94YwQCcWYUoXDO1cf3dbvpFJGo13S9I1dj/iWAbtdWww8lNvtyAuR2X5wXm5JwH8=
X-Gm-Gg: Acq92OEGMU3+XjMDPETPu59OiK44p6NnmGkic4iBgdUdjbfeHswcZt6NCe5DEEukzlv
	WcUtpXQyworYV1oY8GtzEfrBtmyHM4tOsThEvec76lOr6LikqrNrWMm8AdGNYeuxZN+6WKBdg0V
	8jQ1uQIbqAenAjfd2qAv+yRcKg80U8IG/c95225BrkxQsYPL1c1UYK/UdHNCcJZRmzEG5chOjR3
	Z93X36nW1H2oycyN2uWhD6xTMcAB2JVRklnC89/qa8nCZxjKeJU8Zt/d8GZSc8DqBJHpFsdSwqN
	X/ST2IvXaOhtoRr+sbLKwbiMqEyRYJseFgf9wGZapHX9lIMrvk82tA2vKMoFaNCPHnH6aq5Sgwi
	77+H12XqznaIdDfFlXmw3nA4O3Q+1weG/wNYUd7S+zhMOPkbrk4EnMKmp0A7XtRJcImlViDXD/5
	AD89rIhTL99A5h1ZjOm42Uv756JUu+CcfUJ3hJB4JJ3at7XdEYgHOFkRjMrfgkf4UN1v7azmGGL
	Bn5S/ILAakMkWQCC1dlw68LLdGvEafk4zWuXg==
X-Received: by 2002:a05:6a00:3923:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-8415f5983ecmr10120508b3a.48.1779612833389;
        Sun, 24 May 2026 01:53:53 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea4de4sm6353116b3a.35.2026.05.24.01.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:53:53 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v2 4/7] iio: osf: add stream parser
Date: Sun, 24 May 2026 17:53:09 +0900
Message-ID: <20260524085312.15369-5-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524085312.15369-1-kimjinseob88@gmail.com>
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add byte stream assembly and resync for OSF0 frames.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_stream.c | 207 ++++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h |  31 ++++
 2 files changed, 238 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

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

