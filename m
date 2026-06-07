Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51B33ADB0
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 23:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875923; cv=none; b=A5Re6gtCfiBGBuryaMmAK+anYbANE797KgOs74Yeun28GgdK2DNhp84vXbsBhRQoeDl6tKjpJFMvpNmpSayJeo1OYawhC8GRDy3fbzcJiDZ0DjaeLvxGRMfLrMbUzNfR3wZkDgqZ/SAN8CWry1Wh6daCJXu8gQIGTkYVzJ3xDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875923; c=relaxed/simple;
	bh=J+az5RicRenEneEDG27NK4Kvad9Qms6Iox6ODxzmpTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPpFQK8iuOYKw5yFoc+6lOoa5Zgd4Plt8xM8dtZD7X/C6/ddWEZbb5tSLns3dZoH6KagRVnlhIG/7z+Fbl9D/oal4ZhCrZLIhzeEviY1/9eV5XnujcaerMn1NL8/xB+IF9XrozgbBb88KaRLPeWRdTIp8n/sJlexCnIY0ese1gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3LDUBy+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3LDUBy+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84236f9b638so1581040b3a.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875921; x=1781480721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Moxyp6VJ7Jh2y4csvP0jcOZ0gGOtSLLwcv7kOefBRHI=;
        b=I3LDUBy+dwT5F4MV21F4/qE3Up91ZVyXpULmZ9tYyLoabjXA0hR9xHhQbv3Wt9jk3f
         97r8eP4h1e3KWIZbhLqmiYBicIKA89kbMEyVT7miwXqQh3guAxyWWS6KgW3lsriPoMS6
         yMErxXb0IgNL06qo5zIALfl1mOPoxflsmqq3XKBrNLLQHEJtCY2Vqtkcx26WzK2phKII
         3TUtNj/iAYttvecv6Ufm4RRlzztkISzsgcB6RID1ngXHhk9shh0SbU2kcDDSAyoVjq8F
         MDLlIMouS0Nw3ZYeTD8PT7P6Ccl9zqZ8NdJ9GhWHCA20Fx4lM8b5D772ua26jVduWWDq
         i2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875921; x=1781480721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Moxyp6VJ7Jh2y4csvP0jcOZ0gGOtSLLwcv7kOefBRHI=;
        b=ksfAjgnl0yob8fj2UtKQ4ZfRMzdbgrn790CXhnVJup7K9m7UF4I2HIR7rvKlCeCg0k
         k7BKbtsBh5rchP9TWHpwkmgoyD+WgJh138h/wbfx99IYmU4/f7Xm1cq7UTCXXxcQSvgG
         Nq/49/0HfW64tegjBW7Jcc3NAmFKQiVTEBOqa6bMxpfpMwdWU2d1BucyUKqY7DVVQ00h
         mAhSCj8DbSYsEc8mZZfIR5otgtq0bm+r3LPRP0OdzEAM8U7igpheJxZp9d8nUN6zN6mq
         Zz2GSFA7qsZdySG4DZ43RE0V913WReY+7tdNAE/8uNk4Bm/Jcv7XyzPzrmljJy0VWl0L
         n3bA==
X-Forwarded-Encrypted: i=1; AFNElJ8wfKrx3uEJK9BUEXTynyFvMT5srlQCxGlDTsYZeOzz5NtOfc3SprDkpA97TAE6nrzG+6h4me8rn4rz@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfqoMD6JcRgGCPHJ4wlfzJ0oPTvveG3c9rEB9tCWWTnp0kR74
	71CpOwwYD3iT9hrFnH+FL6QX+hcWtnj4CbOEn+NaBC8gC3vNQXZU46Oi
X-Gm-Gg: Acq92OH6/jhUnr1o0KWnOzSkKAuJ/wZKvQjAc7VelltKYyjWLZjpZVoX1cp6UKO080V
	EU6Y+ack8S55IcCwVmiwiULuMGu/mjN3l3ssPz0u4acrHbnsgzYDBttgVz0263JXJXTZB6MV9MG
	o9U5JCvYOdSEA57STLE7f1CPrJTDNQsrChspvGo2f2791dilAttABrz6haL6FSZjIMYYJKCLlPd
	b2I9/OFkuIGJpctMm3zFrN//x5YwqEALaaQsBJhWOkrOoYH46XqgeXSuTAaDO+b1t7wcY2eb/3Y
	L02PfSk3bt8Ox4GYXi26VGFDBkmhXXVrPgG2+lai1FvRP6HWfeleozXXCwLtGWaozQ4eYdC6MIB
	VVuHc3CNLYbkbwdG1cUd9/blJ8Tvoc1s4ow2Rni75w1XvtfGz9sgs4W0AJ1y8pnOnOXK5RRsLwh
	7LL69QbkD3yBuL3lqwZ3XvhLi57Z0GvCooRqk4slJUPOaQdcpzlLx1qLpVGSvaSR6CDFdzoYjXG
	/L3+0mE2lmxKUqbmLI2WTgX9OR0CqbeUDH3hAyIYNndepaq
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr13296464b3a.40.1780875921415;
        Sun, 07 Jun 2026 16:45:21 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:21 -0700 (PDT)
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
Subject: [PATCH RFC v4 3/6] iio: osf: add protocol decoding
Date: Mon,  8 Jun 2026 08:43:40 +0900
Message-ID: <20260607234343.22109-4-kimjinseob88@gmail.com>
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

Use a FourCC-style wire magic comparison.

Document signed little-endian sample handling.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_protocol.c | 4 +++-
 drivers/iio/opensensorfusion/osf_protocol.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_protocol.c b/drivers/iio/opensensorfusion/osf_protocol.c
index ed91d3dd5..5bee545f3 100644
--- a/drivers/iio/opensensorfusion/osf_protocol.c
+++ b/drivers/iio/opensensorfusion/osf_protocol.c
@@ -11,6 +11,7 @@
 
 #define OSF_CRC32_INIT		GENMASK(31, 0)
 #define OSF_CRC32_XOROUT	GENMASK(31, 0)
+#define OSF_FRAME_MAGIC		0x3046534f /* "OSF0" little-endian */
 
 static bool osf_sensor_type_valid(u16 sensor_type)
 {
@@ -38,7 +39,7 @@ int osf_protocol_decode_frame(const u8 *buf, size_t len,
 	if (len < OSF_FRAME_MIN_LEN)
 		return -EMSGSIZE;
 
-	if (buf[0] != 'O' || buf[1] != 'S' || buf[2] != 'F' || buf[3] != '0')
+	if (get_unaligned_le32(buf) != OSF_FRAME_MAGIC)
 		return -EPROTO;
 
 	major = buf[4];
@@ -136,6 +137,7 @@ int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
 	if (index >= sample->channel_count)
 		return -ERANGE;
 
+	/* Samples are little-endian two's-complement signed values. */
 	*value = (s32)get_unaligned_le32(sample->samples + index * sizeof(s32));
 
 	return 0;
diff --git a/drivers/iio/opensensorfusion/osf_protocol.h b/drivers/iio/opensensorfusion/osf_protocol.h
index 4b6fb131a..c62c2c254 100644
--- a/drivers/iio/opensensorfusion/osf_protocol.h
+++ b/drivers/iio/opensensorfusion/osf_protocol.h
@@ -2,6 +2,7 @@
 #ifndef _OSF_PROTOCOL_H
 #define _OSF_PROTOCOL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 #define OSF_PROTOCOL_MAJOR		0
@@ -14,7 +15,7 @@
 #define OSF_DEVICE_STATUS_LEN		20
 #define OSF_CAP_REPORT_BASE_LEN		4
 #define OSF_CAP_SENSOR_ENTRY_LEN		20
-#define OSF_CAPABILITY_FLAGS_MASK	0x00000003U
+#define OSF_CAPABILITY_FLAGS_MASK	GENMASK(1, 0)
 
 enum osf_message_type {
 	OSF_MSG_SENSOR_SAMPLE		= 0x0001,
@@ -44,6 +45,7 @@ struct osf_frame {
 	u64 sequence;
 	u64 timestamp_us;
 	u32 flags;
+	/* payload points into the caller-owned frame buffer. */
 	const u8 *payload;
 	u32 crc;
 };
-- 
2.43.0

