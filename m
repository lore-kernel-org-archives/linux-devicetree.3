Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB773382F3
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875929; cv=none; b=fde8TNZpKrCWVpyddOVeVmCjspkekdQW2fQ87hXZc7vLE1S5bBQf5kMrpLrIoSiE7fDxYS6bfBV7lk7laUWqCiDyRODLundWgQO7SosJYsyrRHn8YI3yh+QPqRv7YyG5IU47UDxN6yHU80o9vF5Yn+NAdwhJ4vO7RyqVud+Q0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875929; c=relaxed/simple;
	bh=KJTRCy7wNY+N6IrE/mRVGcB/+axShhI0D7cUwSRv3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuyme3PwUJOKsCpC2yvPSBCj14lDurB1iFdNc1NAAIGXmW7YYhz1jpxgRwLVCI1OHS3f63n0PEwNiVcze58WV3dPhW/5+AcFrA3WzCF7D9gMJ6t7eKfwOMTLqDU0fAy3vYxNiVPIdJZA2moh4mESU92mtrMUfv7ONSBq90l+Shk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfXaCEIz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfXaCEIz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842358aaf36so1280960b3a.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875927; x=1781480727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaQl7dtgCPoeeJ0ksgq85IpZKAoo0yYD7cImexjDLms=;
        b=NfXaCEIzgPw9KMgLquOrieq1tveEjSb1X+Osk33RZeynIwunbKnR+mjfEhLYS0smB0
         2tnklm4n7mrS2qtsI2lMcDCPf5KFq46B4OsHHwO8+DHQWtpc4ccoXWi0rHxdwwQ7cmee
         aCRmpSq1ZGkXqWgq3mFOtuDc+cX/08mbTAzQFkdrt48q8CEza4MgJJy2zu0Zu8BtJI1C
         ngFpXkBSRrQhXD0pr8GbD/IzoDHVnTb+s2dXqrD5tsGkJZy6VhDNr1EMqy/P+OuE5iXS
         raUCeAZh4BiMb8VZj7btGI2iKdSAQCcX4xF5Hky7MQEEi81jbdzNQctkookv5ougt3Ry
         nkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875927; x=1781480727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TaQl7dtgCPoeeJ0ksgq85IpZKAoo0yYD7cImexjDLms=;
        b=nPTRRKwc8NzA8e0JB6D0LnOCSrfnUrtlNu7KkCfp+fcJIT7p8311CSfSvg8oc50OFs
         cjXG26Y1S+JIqcIsuQk4ONO9Gn9bjOwSNO3V7ZM6tyRyvS4SyOviwDWhpHEvVHvBBTfV
         xxu9RYEghCQItS2W+hOE5ylJObtgJ4KKc6nl/lRTQm58CmUYEcLsOvftlH4/o9SMqO1k
         cChYsEQc+1CDq7z6Y7DpiwxVXRYNgVKog+wAtkGDEQCfUfX4CuBYuGVLtIXNxTEl9MM5
         MgEETZCjYPCyXlK6/TqA/ygvuSVN9wCGb2fOh+R+f65Dn2ON/6UCZUnoHYlcuA7FK4hf
         rrVw==
X-Forwarded-Encrypted: i=1; AFNElJ8lLbLpRC8QgFyVtxPHoaZeBM6GqjfKn/kEYUqknZl+htt3h0pQuSlhO2LSHb7S9wLb2i7A+66BtggP@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUdAiRbo7RGKFGG0icAHjNDDHCyxrB4iDOtJp7iK8heQae9Xl
	/zA13otmSgCxPc1wF9tznz0Z6oiaQbxDR3WERYP2CpjKmp1JpCmZS3F+
X-Gm-Gg: Acq92OHATMFaE9MZKvdpk7bh/fPlWPAfYX0rw7/SAl71t34YIUHKB2IDaE+gW0gIyeX
	eLFYTtp7hEWpEAXewzGOwL5u5yYDzttaBYiocxMhtxYtnef1XG0Z+ZflFO6rRK//2SzTpNKnkYC
	HpeARssmI2PNPw2ugmlXlbqhUYpimbQo+66/W7uK+/WoFzyuwme4jQ/+pPYegUYB7xi6CzMyRfv
	1gl9sIOebPgstL7Z7K5OX/4G+SivnSULlUHuaaesbhGVO2EiXOBj+qOB+bnepnnBsmTth/BMrPv
	b28EilHTLP46APlIaL2h/zeS6bssSmNea1BexdXBzyvrFqW2Esg29IoBLVTiuAHRj8QUcs5RBOG
	DZzKNeD6mq9VrU+RvVoyPhdGihBhRb1uB4EAzdsPx8gJNAjJab1IyKN4PDD6V/SSbOOf7m66iSb
	9+tTaMM1uVXRXWSBpjlPNAuI3Nt2KjylQCxX+0blDeIYvQQ/HHgz8n6s/4LUXNTg2yX28LyMMFf
	RwSKG9y3P7Bo6Q+iXBi6Cpy6p8Hew0AVJ5pNPvANeyrpv/e
X-Received: by 2002:a05:6a00:3d4a:b0:842:5712:c2c2 with SMTP id d2e1a72fcca58-842b0fb6d60mr11804229b3a.41.1780875927308;
        Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:27 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 4/6] iio: osf: add stream parser
Date: Mon,  8 Jun 2026 08:43:41 +0900
Message-ID: <20260607234343.22109-5-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the parser focused on frame assembly.

Let the core decode complete frames once.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_stream.c | 38 ++++++-----------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/opensensorfusion/osf_stream.c
index a2739c987..957f73716 100644
--- a/drivers/iio/opensensorfusion/osf_stream.c
+++ b/drivers/iio/opensensorfusion/osf_stream.c
@@ -62,8 +62,6 @@ static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
 
 static int osf_stream_process(struct osf_stream *stream)
 {
-	struct osf_frame frame;
-	size_t decoded_len;
 	size_t discarded;
 	size_t frame_len;
 	u32 payload_len;
@@ -82,10 +80,8 @@ static int osf_stream_process(struct osf_stream *stream)
 		if (!stream->len)
 			break;
 
-		if (stream->len < OSF_FRAME_HEADER_LEN) {
-			stream->stats.partial_frames++;
+		if (stream->len < OSF_FRAME_HEADER_LEN)
 			break;
-		}
 
 		if (get_unaligned_le16(stream->buf + 6) !=
 		    OSF_FRAME_HEADER_LEN) {
@@ -106,34 +102,18 @@ static int osf_stream_process(struct osf_stream *stream)
 		}
 
 		frame_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
-		if (stream->len < frame_len) {
-			stream->stats.partial_frames++;
+		if (stream->len < frame_len)
 			break;
-		}
-
-		ret = osf_protocol_decode_frame(stream->buf, frame_len, &frame,
-						&decoded_len);
-		if (ret) {
-			if (ret == -EBADMSG)
-				stream->stats.bad_crc_frames++;
-			stream->stats.dropped_bytes++;
-			osf_stream_drop_invalid_head(stream);
-			if (!first_err)
-				first_err = ret;
-			continue;
-		}
-
-		if (decoded_len != frame_len) {
-			stream->stats.dropped_bytes++;
-			osf_stream_drop_invalid_head(stream);
-			if (!first_err)
-				first_err = -EMSGSIZE;
-			continue;
-		}
 
 		ret = osf_core_receive_frame(stream->osf, stream->buf, frame_len);
 		if (ret) {
-			osf_stream_discard(stream, frame_len);
+			if (ret == -EBADMSG) {
+				stream->stats.bad_crc_frames++;
+				stream->stats.dropped_bytes++;
+				osf_stream_drop_invalid_head(stream);
+			} else {
+				osf_stream_discard(stream, frame_len);
+			}
 			if (!first_err)
 				first_err = ret;
 			continue;
-- 
2.43.0

