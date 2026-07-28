Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02654756DD
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785275391; cv=none; b=W+JLTLjUdrpv0ACMrsyt09KpBynNbMF2Sw4EO6w8FHVParxpVEku9esrB/4+RsmSbm/qTERALZ9oG+WSWzniggAX8h1yTijqEawU+8LMLwHxf7TVpTnQULLXMpGBDS4x40tq+wUEZ7yDuUNHlIzyurlN/o8LSn3QB4GJ5oNCWV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785275391; c=relaxed/simple;
	bh=bvSCyrdJPHI/O7SmyFzFWbGaFpXQE2wLFmiJP7lOXFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LN3gCSp6rCRgN9VgcOqY22lVNi6hRT/WHw5sDERudeQ7HNXWNmxNz2Oh8800OCsRECP9uPDBdPDBf1ctAaRDMw7vR1sYhb3i0PSSw3g4ztgpw3DGB9oWV2ETKOk2Rs3NCUmQzchDqB632wvm1pBHJWfsOVBwoqu8azKGJKET7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUzgjNms; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUzgjNms"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1843405e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785275388; x=1785880188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyoTdl6JWUrvGo1mbfyaooGMdcUCefFiFsk2EKvJSOU=;
        b=SUzgjNmsUi9K+J8XXrLCrqUwiL3uq8oROWrnC1hw7JwtpkOtK6jvhqlTZngX5c0jHt
         KwGwEuTA17aVi+FOVXa4d4z+mAoNzw9Dxuyl8QGOPGv28YK+XaDCAXZbMWUfZDfDRYhx
         /A0TBs3Bc4Gl88WT2PEVeJzwr6k3VKW06RaRGovXbyNqzzZHMmETV9G+QTBiIQJdrrE7
         U+hm6iwHCKEvSgPsd+BMpvR8vf4IMuTWaCePoF8F53bJwhUUhv5wvm/p5c2UVj6ohl85
         7jV0VuOEfzD5qTBo3HC5T5MJta+Ad0T/V0f9lu+NSZEES8OSrufJa6umwmn14FMTuvHp
         gbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785275388; x=1785880188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyoTdl6JWUrvGo1mbfyaooGMdcUCefFiFsk2EKvJSOU=;
        b=a4s5XCYVWVYB+eujmrQhWeDk2OUM9JDsfNRF87JMgA039jcKf0h58m+Z+vVQFL2U1O
         9+OY8EmbchOGGGtDE7I152ybNCBT15RijiIUW2URQ5PI+CO7UE/dr5+tuKeeWFPIAbCk
         tNtuPN5WpwrCppZgNlIgVhka32TGdJjiZUAl/nCDk3DMExQZ6q3/JH5MHT1S4/ob6A90
         DXOUVg0HY2p8vFqQ9hWQPTja0ZoKu5h+YmuW1hKsIPhX9dhcj0tuhD+CGWCCl4SFkM0V
         u2JNHWvOlWZeSIQ75N8JQorAhg0Lj1MgZvYVI7SqsD0wzwkMa7fkZetVqOJhFXwVuQTT
         JmKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9i5+SsBA/osaf/62yQFWDSmCZZQV2aaaTXiHIXUmPkVV7JAvoCPIwEWoYctt9AFW9kTWRPcv2sgwX@vger.kernel.org
X-Gm-Message-State: AOJu0YwWoQCDmRS+uBn55t+jIGyD2NDZSo5ofEDItwzQJWWH4qT3PPy/
	87xrrUJ+NxS95w5D9PMPJF2P6JW6IiDbBrw6YR/nnIaNimaJtP639NOM
X-Gm-Gg: AR+sD12sEEj2cuQU6J5nW2u1rimXVKH6dE0zmYqg+FqTq5orOa8B0f3Rc0h5fcMXjYW
	YucEgG2y1Gzh05ndzT7TCbeRJoPLSyACTEZojcWK1HKkv3S/9gq0fnyAlQkVbBNE575WMr27av3
	BOuFYXkMg3W+S4UIIBiydVa7XXfmN59xyXkjRE9aohO29JBr4jogYna5K++rZVCCW2d5JCrbSJ4
	vDLibu9T84NoQ7+u5Rlqdj3nOA7xWyrHr7adMrD6mIR6O22yJ5FDDJi6IbYkE/Jyy6OTROb/BV0
	u20hwKVAlsLAGEfG7r9ZdxRUuMT1pqtsAy2fI/awLz0AQYe/RVj+Aa7hO8fIEm50EGHBGGDQLuZ
	IYFGzMyOKFhHYE/h2VVIvFgZvOux46taw9EVkgCWkeOByK+HfwoxQlRn8EQf7lXosYFKVVAfWaX
	3N0a+iewGFaZfQ+Kpip0T9DVvcXNAtA7LEd8BPzRAA0A==
X-Received: by 2002:a05:600c:3b14:b0:495:4b1d:915f with SMTP id 5b1f17b1804b1-496c65653bbmr41087565e9.23.1785275387987;
        Tue, 28 Jul 2026 14:49:47 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0ef25sm2353042f8f.24.2026.07.28.14.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:49:47 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jonathan.cameron@oss.qualcomm.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	maxwell@maxwelld.cc
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	455.rodrigo.alencar@gmail.com,
	Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: [PATCH v6 3/4] iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
Date: Tue, 28 Jul 2026 23:49:42 +0200
Message-ID: <20260728214943.29820-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260728214943.29820-1-wafgo01@gmail.com>
References: <20260728214943.29820-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the IIO_VAL_DECIMAL64_* family with a femto-scaled variant
(scale 15), following the existing MILLI/MICRO/NANO/PICO pattern. Both
the read formatting path in __iio_format_value() and the write parsing
path in iio_write_channel_info() (via kstrtodec64()) already derive
their scale from "type - IIO_VAL_DECIMAL64_BASE", so the new type only
needs to be added to the respective switch cases.

This is needed by drivers reporting very small SI quantities where the
existing pico scale loses precision. For example the Sensirion SLF3S
liquid flow sensor reports its volume-flow scale in m^3/s, where the
SLF3S-0600F scale is ~1.667e-12 m^3/s: at pico scale only a single
significant digit survives, whereas femto scale preserves the full
sensor resolution.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
Reviewed-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 drivers/iio/industrialio-core.c | 2 ++
 include/linux/iio/types.h       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 37cf2817b3d0..767a7794624a 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -715,6 +715,7 @@ static ssize_t __iio_format_value(char *buf, size_t offset, unsigned int type,
 	case IIO_VAL_DECIMAL64_MICRO:
 	case IIO_VAL_DECIMAL64_NANO:
 	case IIO_VAL_DECIMAL64_PICO:
+	case IIO_VAL_DECIMAL64_FEMTO:
 	{
 		int scale = type - IIO_VAL_DECIMAL64_BASE;
 		s64 frac;
@@ -1032,6 +1033,7 @@ static ssize_t iio_write_channel_info(struct device *dev,
 		case IIO_VAL_DECIMAL64_MICRO:
 		case IIO_VAL_DECIMAL64_NANO:
 		case IIO_VAL_DECIMAL64_PICO:
+		case IIO_VAL_DECIMAL64_FEMTO:
 			dec_scale = type - IIO_VAL_DECIMAL64_BASE;
 			fallthrough;
 		case IIO_VAL_INT_64:
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index 924ac9dc6893..d8944c9e5e90 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -42,6 +42,7 @@ enum iio_event_info {
 #define IIO_VAL_DECIMAL64_MICRO		(IIO_VAL_DECIMAL64_BASE + 6)
 #define IIO_VAL_DECIMAL64_NANO		(IIO_VAL_DECIMAL64_BASE + 9)
 #define IIO_VAL_DECIMAL64_PICO		(IIO_VAL_DECIMAL64_BASE + 12)
+#define IIO_VAL_DECIMAL64_FEMTO		(IIO_VAL_DECIMAL64_BASE + 15)
 
 static inline s64 iio_val_s64_compose(s32 val0, s32 val1)
 {
-- 
2.52.0

