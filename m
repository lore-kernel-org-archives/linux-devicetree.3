Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2463D45D4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489608; cv=none; b=RtffepwtMNbvY5o+Sadi9q7h+/NoBAVtBh7vhIMYqq0hF4l55RmsXWc1UObsrcXeYbqlCB8J2unAJdqCb1V5wxP937Z3D+4gMzzhbCGdQibgzomrrrmoIOLLWGL21r2KstYaKAGVoD4wI6CDwPTSZBXVmE9owuT7bgDPuG5kmxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489608; c=relaxed/simple;
	bh=3jIsHOEB2pBvR4m/btDNC659kkrYQVQgt5gTAuhCyB4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6hSqVAv4CF5C2eGgoB8BfKqGXdhqye3gKGKeb3KXdecBBXm6EItmY5yqeDASuXEhKtswlY7ApdIB3AyGd2xIncJ0ecplVdqpq1boKJk+OSJIokD+wI9gu32jeDjn0bYbAWN0nPXn9ivUHFb2KHxeUowl8u2ulGFXm/nPwV2Th4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOf1qL4F; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOf1qL4F"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bef1e6423e7so233217366b.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780489606; x=1781094406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4aVZcTl8U1FLvESvygfBSaJHvnQyZU6dW/R+A9ZYVI=;
        b=AOf1qL4F14i/C+CIj8WK6zCxoJSA0DaWD7pTV+j0sYGso7YWdF0peZHioGyOEFdMDD
         z2X9bQzjaIpJcHvKHiddDzqye28tytsXsGw9Nq/pTgZ4EYmaAutHENR5/71+apibeg1x
         TLLRyd5A7PPqjocY/Uow2GxkwQXkeOa14v9zKAgYAYH+wvnC0lTJTFaCvGh1cGiFdD8C
         /in5lYM8aRX0YppJCYLQipNlua/eiGZbvZppoPqmF7iik34ZkEYVF63u4W9ki9w6RUGS
         /5VGK7Rvmk6rwkfQ3gOzJuUjBxcyLDCnayPwZzOni3FJE6LRIMorDB6bi9EH4ONYdMz/
         kljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489606; x=1781094406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4aVZcTl8U1FLvESvygfBSaJHvnQyZU6dW/R+A9ZYVI=;
        b=XP5aOM7+wyGZbOGSXSocU07D8KMCJc8dfEq1z7dHLd7K4JXQXnHF+hcTB3lr4vBelW
         L1j2UnZG5oYP/NL7UwipRXwbmasFa6DD/yeUupQO8/PMTdLslQyvpkFkzqC60p7qZQEF
         uf4L2ryNfg5gDa74aYOse2kop2jrYt9mXwZVrcJ7aVLZDXlYflkVx2+GXyxtSoqsP6dC
         EkrBpGVF02z5FgDwBEN0FIX9mfkpTRAINgyWSMNMd6N/LHpV+GO6t2MCmcQu2y3duY3R
         9gGtMxah1A+SY+hGPAYTQcj4ngLfggnPT0FxY9cWVI8oLgzLToTYQUj/JbuR6sFVqkft
         g8Gw==
X-Forwarded-Encrypted: i=1; AFNElJ+Cdf8qoMfD8qQ/EwT0J0Ngp4l9fYW0B7i/ZVMWx+kQVkCmbc952V1tAwXOzsP1fYvwsPF7zLJHpbES@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8R0XPMLyYbmYOtcxo0KN1wRcaGCUcDEPIemWb6TVtfuwzBt6
	bngzuJnb2F1B6YU3SSnr0aZb5gm/taCMEX3npNc70YEwGfcv+U78Chsu
X-Gm-Gg: Acq92OGCryeRBI4+ck4swqDi8kZkKO2NAJ5+nRQtmCkncUTLL9XcSnPVUTpsTXvbtEK
	RNdN1CC38BDvADtWHlmRTFq0E6PE7spXUkGbnT8rHHAqi6FWQX9h++jLUKQdijFV41TnR+zA29b
	fo1ZKLLog3cx6RtD+oLDmvQc7YH/u/NT8P5IzROjSHXgGbllDjBhW5BC/QKZSN+UIL/Gm0XfF3F
	SRaxBuaUZvVfLH2Qut4yPS6dLEbBKzNQYgYVIwC0lNvfqOWUEErvIqoazjCY3um+7DNqZIpY5te
	dxDxxfwbvFFT9oXhRXuCtI2cutoM4aKH6qch3ZG6ehWI/6LwP5UxdT6FmEckENV5qXq22DtppTo
	hnXLsUw+8RsJOgwlsk8i9w3UbDZn/HG4z1pBBsMXsIo4oFJA/QasGPXWuU4c40/FcG74V6XWwQ1
	dbrmUmnnkDpQQ5WGtY7GXDxzv+TnqhJ1gsKUnV/QxR9LsZCP5LTCrAJS5Kl05LbY4/qe8hpvq+o
	JUqDDVKMs4GInkdrI3dGm/4DYAdFBmm3Eq38uxCNcVnFX2fXQ==
X-Received: by 2002:a17:907:1998:b0:beb:b53d:4839 with SMTP id a640c23a62f3a-bf0aea0a6femr173937066b.33.1780489605837;
        Wed, 03 Jun 2026 05:26:45 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf04e9e3847sm149542666b.0.2026.06.03.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:26:45 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 13:26:43 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 09/12] iio: dac: ad5686: implement new sync() op for the
 spi bus
Message-ID: <ylp2jf3wbojbwoozhow433vcvnz24ahvqlr35hhdoctm42rqqn@irrv3f76gr7k>
References: <20260602-ad5686-new-features-v1-0-691e01883d27@analog.com>
 <20260602-ad5686-new-features-v1-9-691e01883d27@analog.com>
 <ah8roqGqZ_VhAPaa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8roqGqZ_VhAPaa@ashevche-desk.local>

On 26/06/02 10:14PM, Andy Shevchenko wrote:
> On Tue, Jun 02, 2026 at 05:33:56PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Use of local SPI bus data to manage a collection of SPI transfers and
> > flush them to the SPI platform driver with the sync() operation. This
> > allows for faster handling of multiple channel DAC writes, avoiding kernel
> > overhead per spi_sync() call, which will be helpful when enabling
> > triggered buffer support.
> 
> Why spi_message_alloc() can't be used instead of manual handling?
> (Seems no current users, so you even can modify it for your needs.)

I need to manually call spi_message_add_tail() to append messages.
I suppose that such function is a bit weird and no wonder why it
is not being used. struct spi_message_with_transfers might need
to be properly declared so that users can populate the transfer
array without manually moving pointers or having to redefine the type.
 
-- 
Kind regards,

Rodrigo Alencar
