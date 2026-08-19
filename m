Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A493F2113
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128853; cv=none; b=tSoqLIQ7Q880sW6jj/FTo2Iajbb1a8N1+TVPdjpTTbmxI7HE0RCsZ1Ep92dMmReOfA91rtAtSxisWPIpYHq+fGzV1Gprwu8mxRnyK0sZBByIX3LyeO3he+uSPqGuOMSxHa4jn0b/WnaEFeZcsyqtDX6jDSGQFjkqSEa1bkN9i+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128853; c=relaxed/simple;
	bh=GMowu2iynCcNzROcJEdJQ5/+u+MAHjsvsBWL0ZZIAjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eElH8Gj/+k1NU2TgUkQaMNpaEYKDydjMGLcazlNuh4BxRkLqH45Ad/opA7xj6kySbaZkPFgutWuvJU5iFn5f62H2ybisiqZlphS3AzwOMzvS/bMlw1/ASkX9cTq9KJiQ8hw+na0aKk+p75SbD2+ZR30M/qmYjpPxe+zcVBnsTos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oagAlJOM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oagAlJOM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so321216f8f.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128851; x=1787733651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB6JEi4fc2rxeFHvTUIWmqP9ewveXbrmeQ7lWaASPb0=;
        b=oagAlJOM2trt43X6V7NPpTyjnsgSAb04QXsxgMEcNUjmxl+0GdNO+WHxf/DKUw2Ga+
         INVlv9GYs//1C6Dg0c9V7PlznPTRhx0c4jqKYNZ7h3YUs4rsyf9GNPz3eIfAGDJqJKkP
         UOxpy+BAAsmMSo/vB6ZcOHTMXBjZeNaj5r6hu2BW9e/8/z5B1+s3g0Ox7wC3NP/0neYR
         9lKjVYkUraFA7TLgUh6hWJdh7NLnZvEJEj0s1/pJglKCgpqpnySnNyZAqUiuDk4Zber5
         igm/frWLHG475Wp9+E35DcuhTrw/J/DmRlu1KiKhFwgyRplyszq3KjXL+87O1IOi3DZX
         FnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128851; x=1787733651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB6JEi4fc2rxeFHvTUIWmqP9ewveXbrmeQ7lWaASPb0=;
        b=AmQ64bENRqU0KpPT6dHuwxbMOY2WvZnHXVGDmhE4uYEAZXfC+k9dXsl0FeiQWTQcjE
         My3JU49n8eWJMMNn5gLT9vj7kcbr20nvbuUUEAT5dPPNyjc29jnwsWPtmfVmdotx+itw
         bmDpwvkwa+//2LtVsmZxXAWB76r/YUaOmTepLMrReLwMXu0Vmc2Gk0Gip35Iyap1RMLu
         K+y0HkPrJVi5yT5FqdgBmPFVoKg6UDqj8yLl4Gd7Kow6avOG5BWrVTyDql2zzAYujbJx
         ZD0FMOoNGxf83VOLmm+5K7qLcFY1fUREs6vgyd3GYpLAHb508JlYTZDJ3kCrIIbKbDqP
         z0xA==
X-Forwarded-Encrypted: i=1; AHgh+Roq9wU00QeRuqDT3cW+oN8FjtSRvHS80YDNu0UhyF3P6GDgU6Ae2JXK0V2E55dYJ0rdFE9b/jC3PYME@vger.kernel.org
X-Gm-Message-State: AOJu0YzS0KcoacxPHm2aFMKl/DtfaMw0ZKkZnWKKy0wIqz0fTECndC34
	8mLkSeGiDgcqSZagXKTDaFKR3rwIJORJ4igKTaZYqd/Vx357BxU4x8ae
X-Gm-Gg: AR+sD11QGR8+Zz0Q2fYRksznJWDM6YHBCaG/sQvrhCQG+4WSJdCRgv32n0bH23Cz0lh
	qSkd7H8zc4seHa+OLIp1Fr/lTHwqZq42OgjUxz72uODdgdVM8xsatYaCvl4wMFfyYrPlN4Ddyb/
	W7uZlKzt37ORDuetQmX3IMqN23kxWrTuQagWHaELdtg3xPhvWSLPyagZKpUDaXg7R9DM2DYX2eh
	RwKmNdvPvAezjS/mFXxhUinZU2AaawLPvIBcBnBul9NewxXbut5oA3Z5MalfN7BKK6ibBVKvzlb
	ntocdnb0Eka/zA98TLSGlJIo2SrVkCG8Ihjnv1440l2ka5wL/ELjp2iwk52Ypg/fpqkL2KlqH8M
	tF7qHINLwtTyD7vATEDJCsf8ihiT4YjIrIdPr+iIQVGyVw8FyO5cCocaBQiHfGPkcOoqA5cABsY
	DAPfUa8n+caykcAcNavk+LJhSvggAAnkmHzOX5i+F5JmTeBKCx6a1UmVFsEYttpWTlIcW+9bc2o
	G2hXIBQV0bQazFwo3wvcYVZMA==
X-Received: by 2002:a5d:59a7:0:b0:481:44e5:160c with SMTP id ffacd0b85a97d-482b1e8632emr5012255f8f.2.1787128849753;
        Wed, 19 Aug 2026 01:40:49 -0700 (PDT)
Received: from fedora.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c45d1sm3637685f8f.30.2026.08.19.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:40:49 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 5/6] iio: dac: ad5504: strictly separate ACPI and DT probe paths
Date: Wed, 19 Aug 2026 04:40:45 -0400
Message-ID: <20260819084045.16300-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoP7Hr3ahJK87tyP@ashevche-desk.local>
References: <aoP7Hr3ahJK87tyP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> #define AD5504_VA_ACPI_DEFAULT_mV	(60 * MILLI)
> What does VA stand for?

VA stands for Analog supply Voltage as far as I know, following Analog
Devices datasheet convention. Will rename to AD5504_VREF_ACPI_DEFAULT_mV
to make it self-explanatory in v5.

> It's better to use has_acpi_companion() or is_acpi_device_node().
> I prefer to see the latter as that one unifies the style of checking
> across the drivers and subsystems.

Will switch to is_acpi_device_node(dev_fwnode(dev)) in v5 and add
<linux/acpi.h> accordingly.

> This should be (MICRO / MILLI) instead of MILLI.

Will fix in v5.

Best Regards,
Taha Ed-Dafili
