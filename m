Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE5313E1D
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674077; cv=none; b=DL3Ue2jY5xg48S/NeCeOCj5uI/tc+DAz8ZNgAUEy42ozPXmpiUt4iIpthcoVCm4b00otUsSWZQI+dt5H6IW2WIIMAnt0cr5DJiMcYIFoYpaX4/dvL2o+kq2ZObetmWxSDgA+j4l7mK22lY+ppkHkUhYg23dtq4L32YQuhWF4ppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674077; c=relaxed/simple;
	bh=NuS+3+3TYGMxSpMgUHsnkmld7VT2jlfnkEqEyGdY7sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enXpSc6mdBM6CHrT8Wro8d28WWvOwXTKLMJSwuQ8U0iRNhNG1SevnoZp7flBS8KHZhljm9QCZHOQJPCHrb9l2o1z3eoM+t/bbrQMbvYMaFJ1trKUvJFY0m3XuPVy/oszkAx2c3NA88PQTvX11knwKuE8OIjlUyAzLe5+AVALQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQmAz3KG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQmAz3KG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c95a0c0aa2so17215595ad.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782674075; x=1783278875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2ivlxlOriivjU5KVldE7/+Mf/JW60VDPxj9Is5GtI0=;
        b=EQmAz3KGyeEpE+W5HBEgxKpDuWU64vWK+YiwUNq0Bl+ugQ6iEwnHPYV1KgEFtUys/C
         rFf5RcwB5Uq4Q6ycIFUsUS/n+Cq07ttalSWHYabwbUy/Twr34vZloyxnTn44bc9+TpAF
         0EyAQDCYqY9jNXJT04pW69ZfAjgbEUAs9LfOjeikC8aMQVSabYY8Gx2kzGf6w/yS5/iE
         UfzI3EDRiRXdnDwYbEKIOyqhmVnUbymLOMUqqsflwg7CSLpPuOWu+IWeGzgLPinsd7r2
         5hbR99ToUomoDuWF0rHqWaxhxVaSMwFZ7h9tmEShcFyUOJgcmyiWsEiFsGsjKL9PWeKM
         NxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674075; x=1783278875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2ivlxlOriivjU5KVldE7/+Mf/JW60VDPxj9Is5GtI0=;
        b=T+9nNVw8hF9OarH9FiO8uD9nbwx4hfAmMr4jsO+6sZR9shpO8dN12ys6QK8cKCE7Wt
         7FyBw/KONi3rE8ztny2gsmvhPQdijO9sxULlkyogirgcIFDlpOgnrlbHxTKuYVzbxHu9
         WaOLvVZJlRfGfKCrhRtqgxOO4B+y6YG1khqntMue8uHmD84SkzCME4AEpag8dcDC7V+x
         h7Yj7B5W7eDzfZAdS/GJ/Sw4gBrakla+S6TI6k1KBKHwiM5bsCx14bJERvJYCDBh/O8q
         etHlR3Y4SiVkFt7Odlpljg6VvR1FpNeB8tkpOe39c1lyxO7dFjvxq9+mKOZ2Lq83SgQd
         n8cg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9k4DtnIE+yEBi7hPPHxjDQ0e4fwIiHOLb8S4mY32e8aX4GiOErHWAqE9G+wtCb8xuTCMKNk9B1DUK@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8Xfdym9s8sTjlwztcOjObvj9aIsKaGJRSpuhpDsANr1DRqE7
	Whd1CFlcIbgx1KJNf68Epu+ZWjO2sDfKypMR8PETPTlvrv8aGZ5DyA79
X-Gm-Gg: AfdE7clJoarOzo2lYRn9Fz87O0VeGi/I7KqZZYyNPltRA5hy2b5iRJokfDbuiGLb8L4
	SX4BhsIADpq/1RgEnVQpr4I85wHzRfyKLqPp+nr9+sn/IbxmrQe5gzE6u+xK02/7dXlCNlJYb89
	1MdqK/mohA1hs4HitSnsFiu3x8Td89OrSZd1+UGcbgDZP2RJPjEW7Qrpvi+o7+qtbF3mN5PQllP
	H5m3lvoXXFkoZ4vRd8Y//joyFU0rL9CPKmrJT4OYKm7Ml0dg+4AtoceBcxpT0fNdC7GH8pCN6vb
	UdsiGs1nskk/2BX0rSNkJkbVT+6c+Sx3GrbpVB59yRUojHQF63Onyj9JepnEWASXDlsDw+GIw2e
	TveN32M93Xn5xwkDi0yEQtaO7O+vTcYkD3/Q6xtm1lZsMQLKYHQl7sJyDgx6UQF096Is2vlFZBJ
	wQyngXqtJSbJkGHyZ5oHLO10hPaFX2eRsi2b6t7L45KaebWwPcfYHDjDiKs47K3616jJZBNPS64
	PskCtJ29TE0hl3gk/E6z69h4koG
X-Received: by 2002:a17:902:ff8e:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2c9cf41b14fmr37647505ad.47.1782674074904;
        Sun, 28 Jun 2026 12:14:34 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm1354385ad.2.2026.06.28.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:14:34 -0700 (PDT)
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
Subject: [PATCH RFC v6 4/5] iio: osf: add authenticated stream parser
Date: Mon, 29 Jun 2026 04:13:36 +0900
Message-ID: <20260628191337.937-5-kimjinseob88@gmail.com>
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

Add a UART byte-stream parser for Open Sensor Fusion frames.

The parser searches for the OSF0 wire magic, keeps partial frames
buffered, checks header length and payload bounds, and passes complete
candidate frames to the core decoder.

Rejected candidate frames drop only the current head byte before
resynchronizing, so a corrupted unauthenticated payload length cannot
make the parser skip later valid frames.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                               |   1 +
 drivers/iio/opensensorfusion/osf_stream.c | 189 ++++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_stream.h |  31 ++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 32d3e7674..3d4199d9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20017,6 +20017,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 F:	Documentation/iio/open-sensor-fusion.rst
 F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_stream.*
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
new file mode 100644
index 000000000..470b4ec1f
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -0,0 +1,189 @@
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
+		if (stream->len < OSF_FRAME_HEADER_LEN)
+			break;
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
+		if (stream->len < frame_len)
+			break;
+
+		ret = osf_core_receive_frame(stream->osf, stream->buf, frame_len);
+		if (ret) {
+			if (ret == -EBADMSG)
+				stream->stats.bad_crc_frames++;
+
+			/*
+			 * Until the decoder accepts the frame, payload_len is
+			 * untrusted. Drop only the current head and resynchronize.
+			 */
+			stream->stats.dropped_bytes++;
+			osf_stream_drop_invalid_head(stream);
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

