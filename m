Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D8340EBAF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122182; cv=none; b=QeH9osYbA1ypSZfuPCyjsoCB2R28ui/QhfF7ZOSY36Ra1LhTOMrga9toiXImDAPs2lk3LreILxOkAcdZNrY5oI0TYCNVRTeZ+DmQAYB9WPulEFwb2hZN8vdxIAvuERzHK+kLyKdErZgEIFNHR/g8XlwBtoAxSb1xKroXwRtRR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122182; c=relaxed/simple;
	bh=zRo/gK16oMS7vWD/0v0ZdzYrGb0S0hZPcGmBlokvCc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLhyjg9HhzXhbKrT2VCe+VfgnhGbjNqyqkhWqKpo473gY9U59FwBnFu1H3IQrEOS+Ee36uOA31TF67aBKEQvs9qrrTIS2E0+XPB7Xx8Q6iex36wjskaMPsEjPZXltoMyPJXxPf9Gh06Ki8iZmK1oH9PibCw5OeBlgcMmavIob8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPR1zZy4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPR1zZy4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f6de72faso11692345e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122176; x=1784726976; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC/uQJ/wM6LfyAr0O1pyfwfICQNJXf2TkvnQK+M76HI=;
        b=hPR1zZy4M3LuHP21XWihI6AeAL8VIXcmNwNUtnN4SUCZjQncROFRPqgAzQvhlEoYeQ
         lP9tlVKpieD9v9jHgPk8VuthTpRQvi5qMu1PdT689AOe4zbBdog/hcs/uQRaAnhnuzeb
         JUW5pxBz3pabKUBzx/fdiAFrY+RVOJsL2XfBugyy92sFye9UvotJXkUHFL4UQ0J1fzkd
         nUjJQVY52tDwbCQiKo43QMWPch0IxZp75S9PgxnbHV+M/qY55UQ9OJMnVYZzANry0fIX
         o3wLCNF5QULucWjeTj63b6tCYbqx9FC0PUMJhVAwqBJJuNrnK3Hfl1rFxdHtNLcughx2
         oM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122176; x=1784726976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fC/uQJ/wM6LfyAr0O1pyfwfICQNJXf2TkvnQK+M76HI=;
        b=rsnELenEsTZQWcEeomJGJLc7jQcYCa0Nrt/BnzAQIfX1CKEWv2DPU0Zyqjq8Eb/uUw
         T+bgrN7PNOt7vi1rtv+a0MXuERdzHpejYbRcPUf/eDKc8TVqZzL3hQuKldVL1roF275x
         zNgf3cOLKFibhe1HILFTRjRE1GmfLXpUVJkUo9oPWewggGz6wd9dg0wu2Wu1tIor3Sny
         AHs42b4y+BSPAIgbj5hwQt/dZpM1f0sWh/hCGQmCV+O/zbqiJ5VExpO9Qa1B8YWMm1Zn
         oGBT8SQQ3gmK5AA+aeMfZXiSbHzhdmR0Up72qBSGu85vJPkGagWrMO21LWYyF4ZKzfj7
         RhXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5cn61/NI0OkUbGCKRj1sSU30LUNS5doa8l88kmHH6D/V6e0exspEm2Bi0+EoL/5mvaM4FpBg53+qG@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHFKYKuVNBwpflJmMyN4cWa3PrxOOYf2M5FH8L7A9WMfoLg/U
	zRLNK/EfCX2EhFdL1j7YJZlMMGsEfp0ZTW5zO/iF+ZJqs/yPzmn+aTln
X-Gm-Gg: AfdE7ckNpDJGuYfxKYRJv1yJwmZ/m+kS86HO+2CovzAwbHxQoxIgao/QGk5uv9B2/nb
	i7xjOPH8//+CSl3LwDqX2V6SSuT8nI+PVG5V2R86MuzCXjAwIDbA+YDtKbuy13ozqb+2+yvw/Tb
	XtpfIOkXlxUQej1QYdGN4WYIJUr+qAKu5As5cvt+6Rp6Wr2/F7+rYDDnn+uKh2XZ+mo2Fm1+e4t
	qzwDDq3z4MXZs1x16qz1oyIL5ud4g496/JynPSMtheWRPC7kvPMHQqeFcS4SJwxMr+BvWZOD1W3
	zrb+eaAaACAuyTKPBtKxHRWXVlx5qP/SnHx4vCHkLhSPuW5djIRUFJHBiDW/Cb2A7z4zG+kcCG8
	rH0GE+EokG5uEfC1mHQTgiycenjiVEwtZaWRdpFl5kfebq2zUbXihYccMfYWR8ni3aAxKqiLjcu
	HGQNhsiJWskZuUeiIfJjik3izSo1o=
X-Received: by 2002:a05:600c:4e16:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-49400818cd7mr135805335e9.11.1784122176062;
        Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm274958745e9.7.2026.07.15.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:29:32 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Marius Cristea <marius.cristea@microchip.com>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <lpbqk3wv6emhdtxhnczrgufzzxprcfpfgenfepnmzhzfj3b3ci@rdphuko7ikti>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
 <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>

On Wed, Jul 15, 2026 at 02:09:19PM +0100, Mark Brown wrote:
> On Wed, Jul 15, 2026 at 01:41:04PM +0200, Janani Sunil wrote:
> > Some SPI devices support sharing a single chip select across multiple
> > physical chips by encoding a device address in the SPI frame itself.
> > Add the generic spi-device-addr property for describing these hardware
> > addresses. The property is placed on the SPI peripheral node and may
> > contain multiple addresses.
> 
> This really isn't a generic SPI thing, if nothing else you need *far*
> more information in there about how exactly this would be put onto the
> bus.  If it belongs anywhere outside of the specific device's binding it
> feels like it might be regmap.

Just for some context,

For the analog chip, it can share the same CS line with another 3
identical chips. It has two pins that depending on how they are set act
as the device address (so only one replies to a given transfer -
naturally the peripheral driver needs to setup the correct transfer
and that depends on these pins setup and hence dt property). 

This property reflects that. Apparently some microchip chips are doing something
very similar so Conor proposed a generic property given that we would have at
least 3 users of it.

- Nuno Sá

