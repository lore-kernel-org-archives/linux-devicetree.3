Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13475318EDA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947894; cv=none; b=s4CMVR/6nWXZlPwcacYp6Jfq+qzbZ7AZ1YnIVpTqE7XQlm62tqKZYUAtJkJwOkpzu/GHaaDzsFZ5UGUy59k0kNW6uAoXuGjCbGDFV7AslH+pM+jM7EXRMqkfQSAX98dvaIQNmVe+wRVM4UA5q4e7PZXhBEt0JnRolAl/UBTlCYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947894; c=relaxed/simple;
	bh=BTWZgvMFDLsqE29q4K9SrpqPAwz/Ao9gpQ4HurHPP8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyT2a8lGXqJTod2/HcJc3wHnYn5Qfj/SeqGPDsq/lhdNb430KV4WGCQ5cMLIsm0akK5F91K1PpE0yrh9GuTw9ZXpmBj0O3AuVrmWOD+Dm/JAbWxgpkQ2GcaQEZbcOpj7SIR0w8Bs3rn+qB6xKtZuRsNEyNidH8dqsYYkzlv1oCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvqXcrS8; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvqXcrS8"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so195665a12.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947892; x=1792552692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PYUavPGXHain40lEWS6IBxjBfzIOfqYPMFChcw+Uek=;
        b=VvqXcrS8rTM8MhK6n3aOXX5kDdMJiCUAyE/1S9ATnLmDBvXYDDBuKOrcKAlvf+GsqQ
         gosTWGX3LRmk8X1FPNSZn+WqjyC6U7JDEOv0xJ34VVDKsWDxs9xf3Cz2lL+GdBOrTQP3
         MTJUjwI/leHuSI2s/PR83TjPeEiowFXCBLnSX/48vSAW2otlLuOREAyQhZEbNI9q3N4G
         WLP9DhCLArlh/t8c+9VkEkxFJEgeS+1mXO99Ox/+GYDxE8iL0WkkGcWMH/mwD3W4EC3V
         K0T0uu3wdFPLcl0iJWfenTjoFiciBPC0NNiJCXgqVnq65GwNJF4QwY8R5nmksA2UfWC3
         hELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947892; x=1792552692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PYUavPGXHain40lEWS6IBxjBfzIOfqYPMFChcw+Uek=;
        b=mbXCfmXeM4kkYu0Pct26pVRw5Be+bJN3wfgu903UAbsIml5RQwScvLDv9AZ1ppvt2c
         nF5+ZUKaOohhvPKlAu/U1Bfo0cXLQU7SeIeCHC8Gg6SXX89+HCiWBoErPwUk/RN+1u+y
         1HOQ4AW+5MRo5i5PvOq5O4uWAASGGZl1EbhbXBpOT7MbDQNOrTw6bMfc5xl8Ugm6wx0S
         1KuVTM1xb/SC42p1XwlnPWeCJ7RNlRendQ01ncIOO/DCaar7jnLEQhawkup72lKin22c
         1NiMoQ4hDHinAW/byqSiTqI8RUIoFVrFf9qNMm/5Fen27uFw8MAB+I0hFC1aowdCCpCq
         XRGA==
X-Forwarded-Encrypted: i=1; AKwUvBzsbqQkb8ttzISIH+tx8ooAH80+BQom33Bcwyhn+CXTRsCAM23rkBjEkz8/sZnJ6ePf8AmAvx6zQKP1@vger.kernel.org
X-Gm-Message-State: AFq9FYIpqICRR0yDA0oCi0WRKnfXvXZUJ0zXyTcW1iKW9Nan1saItJlY
	WxSqcrDpuPrH6e9LUDidYl228tUZnySm7ZS/NiWpEk5fhYzpD6eDBC5E
X-Gm-Gg: AYBFou37/GFANKZUGTKf/M4hoJQyZQxwzZtDZVw8PzTi9wAzLh5Eu9CGXO/lRavjGbO
	napT2TZh6GhZVlDUGTFgmWPTqNr9dorAGPDgd0KMnJA401R6LIHDzIf6HDZVh/6TT3FfgTNRzP0
	oj61WQzh9IfubGdvYgk+z0piuItZy3ZcAdbQ1xl4Jw2XFYx8gI29A9Z7Q+jaTvpfq3NKq9HElie
	mqzQtoke8dZRYb2jkee0mj1cLD+D6+hFxH4KA6fyAfNNSOuImQtnEM0H/IrZ+09beIhoA3bWetR
	QPFxMYlI9u0pCvGR5vJFeGV5bEBFp5uHJysKxIGqoUXYrdl23LOukrRWUPS/KibdjYm/w/lx/YE
	zKxOC06ZfriXjzKYV2cV1sjhRW6gH4hURssGSdcgUmPGr1vmAGnVHSXFE70pHpE+hX1VXUnR2af
	Dzi6zZ72hskPvjBrkoyMiYNRxQBh2DJLETIdqgS8cwh6JMdUl9IOkgLX1V5hf+MB3FYwmkSKVp
X-Received: by 2002:a17:90a:c10e:b0:3ab:2d17:51c8 with SMTP id 98e67ed59e1d1-3ab3a29028cmr12418582a91.8.1791947892009;
        Tue, 13 Oct 2026 20:18:12 -0700 (PDT)
Received: from localhost ([104.156.230.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f280fecsm2365730a91.13.2026.10.13.20.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:18:10 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:17:55 +0800
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <as70Y0biw0XMjwL6@zephyrus-g14.localdomain>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
 <20261013115639.167433-3-marcus.yu.56@gmail.com>
 <as5b_jzx5CG_UoZS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5b_jzx5CG_UoZS@ashevche-desk.local>

On Tue, Oct 13, 2026 at 07:27:42PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 07:56:39PM +0800, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> > 
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> > 
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements when the device is suspended or torn down. Power is
> > never cut (PON=1 always) to preserve register values.
> > 
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
> 
> ...
> 
> > +/*
> > + * Integration time is calculated as (ATIME + 1) * ((ASTEP + 1) * 2.78us).
> > + * ATIME must be between 0 and 255, inclusive
> > + * ASTEP must be between 0 and 65534, inclusive
> 
> Haven't noticed before, but is it indeed 65534 and not 65535 here (or 255 and
> not 254 above)? Haven't checked datasheet, please double check.
> 
Per the datasheet 0 <= ASTEP <= 65534 (65535 was explicitly marked as "do not
use"), and since ASTEP = n - 1, we have 1 <= n <= 65535. Similary
0 <= ATIME <= 255, ATIME = step - 1, so 1 <= step <= 256.

So I think the numbers here are correct.
