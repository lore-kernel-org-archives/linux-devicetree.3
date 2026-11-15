Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731886;
	b=qUdHkxtK8QA1ECtRIHCIUFSI0uwsz8kouz5u7+h7g4zz/AsKy72XgSNYgc408lJMIxjv
	 mdQ6npcXIZVDmwgbiSsE9s4pd2/ei1g0Xm0u7q3yzLFX1AQSaODTUphTuTedRMuCd5mrv
	 cZlIMAu3RSm6aBPA+T3PocHg69RtNJjL+DsecjOR+hNwdPbTKw7ip/M+fV843D2jDxpaI
	 DXclJAvkw+s2g2yJVkU75SNw2zYUH4Z/RwnvCVc9nvdZlFEgdMf6PXrNfidA1BMIMkBd/
	 xOY8Trb4GhOnlYUGqtA51s69ZVviLT61SdP2/A+Aa2ozGjVtNPx7f4VqmvEuSjLLekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=Vlba14grovvlpRQCQ848uQf5AEIMQXqEFAyEn3u0p19Ru92fU+Sl3eYRbWD0WTY2wy8W
	 a/YG7btjSoWCGkctwjJ1mEC3i9Zk4FCqNVzCUTRWOf4BCfri3E+9PRxF/f/XlzXgf5Bmu
	 Qk4Cr5V34VUwATdIh3K/+8sZDNhEaAXTiwB0L3qfzTgk/PEHcebrwwh2XrZgq8rXl+RVa
	 eoOwvu0594HUO/wvK5o452WuhwY9v3fQMFxEC/Q93NYosVPLjn8Cy8i4mGiO1Zy8pmIs4
	 quQJYIvG8H2XPiwIMNvHrYFAK/6fy0elZLqoEArmeuDHwb75g1xEJEe8ulVeCEV6uQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvVKeoHM;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C65606A8A4
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C65606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvVKeoHM
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso518439666b.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731883; x=1795336683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=qvVKeoHM4kmAdUefhbLzNsQaTehL/q6/ivDkdZOAGX/7czeIdJxqhrwmPEW8Gh/6F7
         sbSVMqL0foqRicWhK1ok6tB4VnEe93keo4KAR8lG/m2/3Wwkm5LeTGifc8ZAHmpzbzLF
         rGUP7AgUkygDQ6beLqTYBhv8JvX1VsTYvy416KjYN4vxzhbUFhxpFKv2km7H2mbH8XN8
         oHRnQN0UPr/IXDAIFItpyZABunCQGaOI5pDRNb1I8joEPua4W4PM+Hy1Xb9c29rgSLyi
         4/JBVnhylkZCvfegBFoCUhVZ0SGbSPe8tujYYs5r4yTgwat0TidTciy4GKiI3mrKLx0j
         MUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731883; x=1795336683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=kdMiXcWcdL2+NlRQymHlZ9NImvtoj2sNvXZl4DgRwWW+GJaqr0l/6kABPhBm/uxvbo
         QVZ4xUG7EZboRjbCOEIrd/o8XwDXQXGRlfZq3eJeYd1pSsUgEHZRKE+ihzaJWDkPn8pR
         HOXnSq/yce5IuPpR6m9Gq0uHiy2t5oRDQxlOfR7MU2ZtiefKHJQcUixakPeanlq6lncU
         YgyjEuq/9IRs/gvhyn6gQsQdWHG0XFRRETCSi9B3mNXvYaE+TPE0zxsnMm8Z8l8RM2dO
         oeXL8posAiwgKoRo1zibOrYYjypOPqOicd1aQSEk4CFzhQ6qBgfYnMPRq4/e7RTJnjw4
         Cz1w==
X-Forwarded-Encrypted: i=1; AL+hErGe73DzNd48rWgzl72lSgFCB7qzLhHjjO+XNEf6nIx9lsVVoem2hqzvIazH0vM2r6uqg+hqpFj2Ysg4@vger.kernel.org
X-Gm-Message-State: APuU4Z/AJ4okiyVChDVC6x0zG6bjpEQ1HYRiH2XPze8zzbU2xr3cnVG7
	7v9nkHSY4GOuCB2BjwQoJrzRa/d7cT9ll7BI3Pc7evRuy43mfOgiiN3i
X-Gm-Gg: AYBFou2Z5WFQGhwKGZwHN891AvQ2ZRCuQDfDOPZbZxPBoACwpCY3MdaBQqRDjzTCrso
	zB9pxdEIZICuuLCHcejzuOamGE4hCeR4WRkseMPfF1+HO5mhp0PSUxxqlUcUdeQGJInYEeqp3x/
	e/hCBaNZuMffiANS7LAFIY8lxwva/uj32cfZz5vjLQfrKyADnpcwalGhV+LEuWP5mipQxjdVqt/
	t7Go2+vc95CnoIPegNEyDuCRV8S6GIx/IBYUrXL/KtFTdOnIP+qZE6PblI53TPWG7L0E66xGfr3
	rsQfdhe0PUE0OPKUSB0E+dX9aj5wd6zoL9d/Az38EPq6VXilg4H0C8w8N0TBr3fSW/UFlu4yQoz
	LTpy0S1nCZSSGaVoeoKbHeNIThkqdUeffGeJLysNT54GR/toUr87NeVJp0KNzpUVdC5qsQ771r+
	pHy12TsVyUh+jgByeAhdEKIRlJtAMZUlU4qt26cpc+gaHpkkKr+F7fw+LYZfQAEblbMgmhIRhcu
	/duPxwyV6ac8qG8DwARY/rRYTc9MXYr5EgbLTmYp/HvCTYafwDNMtETYuUcFOH2nq5LUqBE9LmS
	FVqHDy1BL4mltAvYwhLZZISTJ2s6MenLLhE3Uwy4U/555ruZtOkwe9G3RjQIa3Bz/KBCojXDv25
	Q6oxtbtY8mA==
X-Received: by 2002:a17:907:d01:b0:c2d:d4dd:8d0 with SMTP id a640c23a62f3a-c507c3c72b7mr878493266b.16.1794731883335;
        Sun, 15 Nov 2026 00:38:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:38:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun, 15 Nov 2026 10:37:40 +0200
Message-ID: <20261115083741.62140-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-1-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

