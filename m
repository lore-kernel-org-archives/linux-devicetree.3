Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7B397E85
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336562; cv=none; b=cUqIKWR9wmYo/HQsDDAC2fjzo7qWjp0KyqWu4w/enoL7UXaE2t/RzcistLCnBnILa7nifxqP3tgX0hpTeI/9rpfyy75YR/mtGpfkuYn9lgtX53Wfc/dx2d7/cnekAkiznuG+ST5l+54hEw6afWIjsX2WryUw0AWBaGcIK4tmLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336562; c=relaxed/simple;
	bh=JA4MiRw1MJjH7bNhnR6shbkdzsy4pqluHZpVAh1DmGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJRjPvMbLlOG/2LU7VHWUx9Rs5bahVmBl1TgBwJY0OpJtuD7nTzAnLMSSUi8zf0+e6ci4PLSmhZWS7LoIk1zElFYG437snXY8BnDjzV96CjFCszmrNKpnNGil7F/Uv2q2XlhH4bENu3/XTjSd4RXtCAfZa6H4Ho5e0m5mrD/Spk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs2zXbnr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs2zXbnr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so32845755e9.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336559; x=1778941359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPxOp9tFICZjOEYxN5qhdPtWLZ//6o03lBo1ImPhBvM=;
        b=Fs2zXbnrXEupnp3kNKMMac5wcRK9kpaPy2PtRKyUANqwxGSV0xpbamWXR8EHIyxBQJ
         jdUhbzccODLp44ygjv79flBbB6H54rWGskR9F86j1mFFuFT+V6gP6c8Kq3sCzbsFeZuR
         lrTeglJA779NLo6KvqU0L+k8v7r09VbQkRCqs/8DHAnpTOzY1IXKRBhUAYKpYpfYy9Qr
         i+azntup870D3OBQ/jmwg7btXQZm0RnIE25Hp2ygSvd64eVIXVF+MnMuh3egT24hIiWe
         x8k5R6puf/YBQ5y+wgx+Qk8IfTQwgnRCq05BOFS6MGV5vWxpRqG58uAIAJ4tz9hhXAdl
         I53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336559; x=1778941359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CPxOp9tFICZjOEYxN5qhdPtWLZ//6o03lBo1ImPhBvM=;
        b=SDEL5zjwCmFepruEAJGLoxmiqSxkfDd8RglMI1VnjWle63Aaa1agpR8CiW6YDtfE88
         0aoWSknHNv519igth3nSpNgPQ5YabAqHSrIylwCX85+jnnygfKqk3RAYSWIXVkvd6tDX
         8uwA6ukQ3VVlbE9bOfxQSRFTeqG8SMGeTz8CbK4bKEYkYXpq88H56fWf0kb8q18bsWag
         h7DO6i4eQmNq/5546ml/I75/lUtXP/8FLNokwY1zWILc8+gBLaiBn4yRL3cyrIhiFNnf
         6dpx+hBt98bbBrkaQTSBC++98+6iUI82kK7qQNw+Tap8EcJBiox6MknxZP/FsX+uL+3v
         1CAA==
X-Forwarded-Encrypted: i=1; AFNElJ+qqmq2Mf5SFjDWQ0QN22H4OfvFh79OFjULfzvAqFd9lbOOT8cDMBm4GXmbjx8I0ylMzo1Xdj8rfrI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1K85kwYuuZf7dPiJGz9OaAhUtVoPMaYkHw8kOjLcZS3SvQdb
	WJj+0Lkhewr8j+o3FeJ+Ac/618dlJLbFb3vtO4sVoHm44B0aO5AIAWlDDAbo1t/ssds=
X-Gm-Gg: Acq92OEdBtoUOjYe03Hf8mc5hTIf0xj0Q+p4CpFSgR/F3gLUoBSAr0beMMXYlmYqt26
	FhN57SQ25hHAImSnPVmutLiuP+o6jJlMC6Y3j2yONSJMNn1OyYpaWLWIDgCmg4R3DWhCnKNAIQn
	qDXbLO241WdfLbVhrNmrSbGI0ri9SCCA14BalaspTqoXYb+3bpCzzgkA+Oc1wnY0FnoSYzCSldC
	nZD13Mvhktltkzab5mGXJEE29ghVdpL1XhGctUll1HeInnRFJVBV9TZwQxUIgN9M8SHWmSBc9gT
	9as8YYs81S35gaUoExpUXOxUg0WGuZaY9BRiNrY3ojMkTRnnVOdztYe1CUIIB43LcWZAA+NVp63
	zPh9xOrny5jttAyWf0h6cbXnO90XLkW/hse75fSiCh9JhFoNaEQlzrBwrUKm8e4cgZBl9HHakHM
	tVKIbSa5Jt11RZNb2C5S0hAWF8gbW+jmF2TbRG6oCIdtzV/V/9KkZ9k8/c41g4ec7UoUhb
X-Received: by 2002:a05:600c:3586:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48e706acf6fmr45737035e9.5.1778336559002;
        Sat, 09 May 2026 07:22:39 -0700 (PDT)
Received: from DB-07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45492271510sm15127763f8f.37.2026.05.09.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 07:22:38 -0700 (PDT)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 3/5] iio: dac: ad5504: Align headers with IWYU principle
Date: Sat,  9 May 2026 15:20:41 +0100
Message-ID: <20260509142047.30302-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260509142047.30302-1-0rayn.dev@gmail.com>
References: <20260509142047.30302-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the header inclusions to follow the IWYU principle and ensure
they are sorted alphabetically:

- Remove <linux/fs.h>, <linux/slab.h>, and <linux/kernel.h> as they
  are unused. The driver relies on devm_ managed allocations, so slab
  is not required.
- Replace <linux/bitops.h> with <linux/bits.h> as only the BIT() and
  GENMASK() macros are used.
- Add <linux/mod_devicetable.h> for struct spi_device_id.
- Add <linux/errno.h> and <linux/types.h> for error codes and data types.
- Add <asm/byteorder.h> for cpu_to_be16().
- Add <linux/array_size.h> for ARRAY_SIZE().
- Add <linux/kstrtox.h> for string to integer conversions.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/dac/ad5504.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index 03ce37e2c616..57e6eeed26ef 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -5,16 +5,19 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <linux/bitops.h>
+#include <asm/byteorder.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
-#include <linux/fs.h>
+#include <linux/errno.h>
 #include <linux/interrupt.h>
-#include <linux/kernel.h>
+#include <linux/kstrtox.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 
 #include <linux/iio/dac/ad5504.h>
 #include <linux/iio/events.h>
-- 
2.47.3

