Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC343B491
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019245; cv=none; b=tArJ8x+ooJAsoHKRiLZJMP64jLMFMl347eRPGhz3whHIhvc4ceSu+DkUiZXQX58DBIz0IAGTtKhN5ecMBCTGP0CeQuj6vJk4kRTzFcEmIjTaEU/3YX3kNGA1jAKCIn4+DyGFA6G81/8B+bxg58xldTlJOjRHkKBl78yz0G5vLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019245; c=relaxed/simple;
	bh=+Wg0xXzXfXlOq8LYCymCteD0JyocqtY9m9udaiPSyGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5RpRK+KQSm3QotO6Qn9JwVW/y+KGQZoHmeaJZRcJ3Ie4I+A7/njbaD7CriWWIhcM78xg49Gwb8RcsFk5rJqPX5Y6l1l/MMOW5CGrUHrSNv5tQ5ljx+u5nE0DgZTbG0ExGm5i8iSrOHYyky8SUGxQ2Sv1+6B1IZFotegLy/QYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROGS8s1Q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROGS8s1Q"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15ec1da77aso465297066b.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784019242; x=1784624042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QOPJ2ykF/Eu4mRV1f56hVXyVkIVyfFygrcAtErrlD8=;
        b=ROGS8s1Q9sIAOEwxqt2eylYuocogXDJPk4KwKM+dYKjSDB6aYxYoa6StfrNVcA0pes
         OfA8kmLWG1apuV2nVAECdSlB5K2vYqXK7cZ1W0RT/w52Ise7ASBSLurlyiSa6yhmxbZi
         AzLw/EBl02m8QWGScWaIOudL9oaoSJcbAIptJrc8NFzWKYh/tINd6lkzgSHmfO6OCdSD
         N2414xUxZCx8BauGdDh2ymjDNiv7TCyyE9gurRUM4Jvk4L+9hLiaW+fIygQgFLq/eWvI
         qTQsslhkr01fg3zaBUKgWph06CZ4VYxu/rT7U1+B6Wj/u9n+7XJ03wJB5ci6r4b4SvS0
         4AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019242; x=1784624042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QOPJ2ykF/Eu4mRV1f56hVXyVkIVyfFygrcAtErrlD8=;
        b=agttXA1TiUazgkByF5su79vf5mWMfFlKGGXM2P96Biz19ElnWIL2tENCHOwaqaV+Ri
         A2eVdxZ+svVslKcIWyBCDaqvA8mNzo5PsEfeu9TV8Z3ZTqbhTPl9Oz2doojaC78jKEVd
         Hv9Ai3QycLOTEVug/e/LdeEu+XzoHcKrKLynB/MDsl9+Ysltlsaq+mzTOedQmnq9VdSI
         uQFXO0RjuZV0Elo8iYs5vvFtHVQlm5MyS0vkND/nolA5+x1roPWHiO5XaEsE5GvoH7i4
         NMEkNPmQJnpUHT1DOLRISGs8h7bdZiz4w0IjpAHHHKP5HxM/OzAmBsulSFjQKBGjMHJ/
         izAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6xAkm5V8ikOI8M3ijmu/mY7DpEKTKOyMoF9l6lYCcqsBYbKPHQcEIRz7VI9U1vKga9fn/yNCaipxN@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBCcABjhBYtlilnrf+9UlTBDWvLaV0fsib3BqbU8cyHajrVt/
	cwDBTWMtKxI4XmwAZD0lH6DqOK5x7pYlnJJCeP4OypVn8zCGdvZca1H+
X-Gm-Gg: AfdE7cl2M6KeXG+TnlQ6bmb8sZhBzUJGuZWrmCzBtiKF3pICI2NDzXdotIJOiZvF1s7
	rEDmDuAtX3FUEZeb/EQUACbHRcR8rFezGjJKY656cma+nREBPkGx6il4IMQUcje/4r0vCc5ZhTM
	ZmhrLlTbHlm+GrvCZ91UQKsDs+hk8FwqKtjANqZuP+egFM+MvLMMVRAzdg0hti9XrUN03eNYR5N
	FgvG9H2lHM1ou811dSKj1NA6y0L6EWv8BeIEcFrfwmdsE4OQhD3MLvGnsLoC+kRZwHQxpE9UcTd
	9mXFQRe2Etvto0LQ1hh180xj6rUE/gQmKnBGg+Faq+/SBjeU85sAyOCCNc/xclFjMPxhal8KgrV
	NI80k7mKogs1nVBJiPQCYyYMdY3WB4rsn+D2l9/NwmTOIH1d3gOf/4DpHFI2SCNoblkZr7it3l6
	+fsCiekSWMax3oZ9fMBTwyYj1vQmg6bJ2Sswk=
X-Received: by 2002:a17:907:3ea2:b0:c15:abe2:e1df with SMTP id a640c23a62f3a-c16618ac78dmr113170866b.43.1784019241690;
        Tue, 14 Jul 2026 01:54:01 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm1143689366b.13.2026.07.14.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:54:01 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <maxwell@maxwelld.cc>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: [PATCH v5 3/4] iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
Date: Tue, 14 Jul 2026 10:53:57 +0200
Message-ID: <20260714085358.20842-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714085358.20842-1-wafgo01@gmail.com>
References: <20260714085358.20842-1-wafgo01@gmail.com>
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
index d6b547207591..8e593f5741e1 100644
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
2.43.0

