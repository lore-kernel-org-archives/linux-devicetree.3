Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147543DA5B6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840535; cv=none; b=jUK0w4jBWCN1rwuR7n3vYVKjvdNnmjZkBndP2MucsSvXEFMsOJx6pmMXXFRcqaKKKNrH6C0yxxl+Xq9ySSwHTad7kiffqxcAc2cDuOFZaAmsomhFgCEjsAICsXx4dxNOl89uDL36oUAA9+zKs6Mq0ZrqRn2Ap0mIL91xMlL0cx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840535; c=relaxed/simple;
	bh=oSYYRF992xkNBj38UQH7xncuI48YTdNanxBrkb/gvBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgXcnySHfX1KJrsg3DdI1j4Wt7nJ1vYa7Hnl4X5m8YueRVqs6BoFxgOPyaiY7H5DjY6Zpc98GdEVdhUTxbTrBt+DR0gTPMDw5yqZA7j+CTvkiiKVAs1bZTEQKofLQacPkPrXaEmOT49+X+TGIB7Od0mX57gfEznXPyaG2NhOoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGWAHvfN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGWAHvfN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7872abb6so580404f8f.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784840531; x=1785445331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrydZRpK44o17ihkahW3T+469O/DVylnzq9QG5iYeEE=;
        b=CGWAHvfNld7XhK4Z2WrpC57jFnQqYhEPB/Tyx3MmyVTifFCT1LN2OtUui8+xq76uFq
         +i2i0v1PBTPCKYCYjD9Igpy4KamP1SaHFrArp5k34sBlKlaL8DT2ZToulyOXDF2UOekb
         e5PSYxmVFulVHtG6JA81FYxt8/mm9v51xI37w7E//UnVWuWxrRAZLmSCFNOVL9Q/KgUc
         Uir+R8BLscjov5pyVMCvhHO6BWzSNpv5697yj44ipbjMsr5P1PKbl481xg9muKawuLo8
         y+rxT6YkXuI5MCVZ1HjWTd8bWIBs4lisvy9leKUsKKGCkKSMacZTWSKaUkaxKWMaNEWt
         V7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784840531; x=1785445331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrydZRpK44o17ihkahW3T+469O/DVylnzq9QG5iYeEE=;
        b=QqAQ76luFYc9ZyrMwqM7iPq5yJtEvErCwIquj8o1b/BARpyAe2+3oNue9ZXIw6aXl6
         O4TX93QpCVnvEkleYCiv1Pow1qO0JhlYjm5TWfOknVxfUvoRWAsDYt8GFGzxrgrxdd8Q
         iBqx2QUrMKPZWHulWQGVyvtZ0p3HivjxV90G3NZZbaqPZ+3fTgTDNEoB8J2zEXISOB/g
         an33a19pnsgUTk2ivfahe6k6Er3U+zzqZ+GDafvgJ3qmmrt+EY7Hnlk5m1I8FuN/yx/P
         A92lAgx2KcjzEATZlqt35FHqUkj3FSKPQx+1vjevk/8Cqs1kH9q1ZS9dH7r7w925tL93
         U6lg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5hWdGZfMogJ0mFhPx7M50ytNelMcvZz9p9zZMeDnywS6KAaEw6Rh+i9aSFYR5IX2G0cXNaoKsMFuh@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUe/jIT/bcNyAQ60r1HA7l9ryiN//nYIPUTg0JM058BjQlxmR
	phvDjDSML+LiT/jXs+x4IG7skVjbzfn0NqJP7PJNAK1kcB9+k+iuT8TK
X-Gm-Gg: AR+sD13RylvH4lRcgNhM9OipIv1klJ0e890hSa1CW8ZcgP7LzGbSnkaJyEuGKQGQZJF
	ppo+IDw3pDIJgHj6sc8R1SxhwNqbvJwVjG62ZswUEo2TlGdaecgZKpDyxG9IUBTuuxhqiLYpGo5
	vUeW2eCV1u4dS4gOMBjj39nf169gVwo8BI45+ziBFlp2uEAS0rYZQMkv+XxIGFoC5U8JXC/rfsN
	YkFtU/viOK3HVT6X/r4hUtN/6WXHAAr7lZK76Qfr2uTEJvezGaDJVZlqI+itdTliHfhcQy1jqOG
	KSJ9T7mRO1oxzUH8JIek0d+xZ5AQ7BLcsGq70Hq+QeOivMBl53/qNW2A+pqvR82607DF20S0XvC
	tWqmDOsJh4LiLNjy6a8YnH/jscZWW6YsuEoJWHZQuQ9UFnTIVnne0nWX/IacAyKhoKRzDUacD+r
	NqatQ1tS/CdffrXMfd0UnYP7bHM8nqPlXDDPkvX13yNiYc86KvGrUkRrr48yj7BAmW7F2otPbLL
	cOPbW/alf83IIdrAwVAs8cMMoIKTHhm6PX4i/g87lZMPz5f94xeHTus/P3M6YNKxyqdMyGhsd7s
	mYOcotzSR5fKSfHyCpvGgh33dcB/fhthDuCCmnG5jsoiBcT9aNCFvatKVymradEanE5WRN009pe
	hb0Z1+MZhTn8=
X-Received: by 2002:a05:6000:29d1:b0:47f:91eb:342 with SMTP id ffacd0b85a97d-47f91eb0469mr3353431f8f.13.1784840530953;
        Thu, 23 Jul 2026 14:02:10 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm19445591f8f.37.2026.07.23.14.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:02:10 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:02:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] iio: dac: add support for Microchip MCP48FEB02
Message-ID: <20260723230209.05c9f482@systembl0wer>
In-Reply-To: <20260723-mcp47feb02_refactor-v1-3-ee59e63672bc@microchip.com>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
	<20260723-mcp47feb02_refactor-v1-3-ee59e63672bc@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 16:43:12 +0300
Ariana Lazar <ariana.lazar@microchip.com> wrote:

> This is the iio driver for Microchip MCP48FxBy1/2/4/8 series of
> buffered voltage output Digital-to-Analog Converters with nonvolatile or
> volatile memory and an SPI Interface.
> 
> The families support up to 8 output channels.
> 
> The devices can be 8-bit, 10-bit and 12-bit.
> 
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>
> ---

...

> +#include <linux/device.h>

No need to include device.h, as struct device * is an opaque
pointer.

Instead, add dev_printk.h as you're using dev_err_probe().

> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

Don't include mod_devicetable.h, this header has recently been
added to spi.h, thanks to the effort of Uwe Kleine-Konig.

> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include "mcp47feb02.h"
> +

...

> +
> +static int mcp47feb02_spi_probe(struct spi_device *spi)
> +{
> +	const struct mcp47feb02_features *chip_features;
> +	struct device *dev = &spi->dev;
> +	struct regmap *regmap;
> +
> +	chip_features = spi_get_device_match_data(spi);
> +	if (!chip_features)
> +		return -EINVAL;

What about returning dev_err_probe() and -ENODEV instead of -EINVAL?
It's about 50-50 in the kernel but -ENODEV seems more suitable as an
error code if spi_get_device_match_data() fails.

-- 
Kind regards,
Joshua Crofts
