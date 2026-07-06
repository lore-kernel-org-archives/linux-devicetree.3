Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A1D1CAA78
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358303; cv=none; b=UJTWlnmZEZdKJ0186esHgfybKeRVC2a0Nh5CmSKqchh0bbxtuJyrPlB2MYjn+iP1xAxEauaoAcFNPl/9T726HaijEHFI4YsuNsCFM0B26t9vz9ZB8cEeeHtLlivf1XZiD/6MJXrtVODCOIWWq/jwvuwf9a3udh8bSwfU4E4QahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358303; c=relaxed/simple;
	bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwsaDt2pUW+Npe9alT5IwPhOHO8nRx2S8+zGQ/zrROmE+K5r9mEY/ru+xuV7CrIMwdWAeq++cIv2igh9I9B4uDwupKaa52EPrEjo3mR3B6rRRef3i5JghPvYDROrU/svLCPXS19VfNL8i16BHJEdXwKyPeN1RWtOUD1NyS273kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KP5EJ8x5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KP5EJ8x5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so1399078f8f.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358300; x=1783963100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
        b=KP5EJ8x5tLj6T3WH3qG3/lCyzdtqkBQVklvAeqCQ0JQ23FrA0F600viRQhg8X77vji
         qgzB7eQBqqvT92u0Gqz3JMb75o2zzFFEGc2pZDSu4Oj+1RoLKTdZFO+i9QfTIeEd9vgX
         OGGOQzTanZ4DeMZsC8DvFZ4Dnk9Y0UXXhbn11pr82SMI80EEynByb5DWCnrT2CC6BdLf
         cx9+HXDPi5hk0Rm7ZmyGFlJmzzJIVs4brdXZgZ7wnvNSbMofh4bS26KQccZekmpDpCe3
         LCVOgG8V9y4OhYfET2AUX57brxDqCySda1FAglLri2X8SSoi0ORPwysLN2vbG5Td7x9M
         kQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358300; x=1783963100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmjH+Y3Kgb9Hbty0PPKiNXVdL4sCaB2vOqcjzHXfyzk=;
        b=FnNXP6uYZ9gidGNe4Yo9yK2QpM+v/XWE7h2uK1Tho76OZeLyjo2mU9b57MOu34X1wn
         S4QA+5TWVEzAfO69mfgMFUBQeeBISwsuOAIf6Lq3wXwq0NcTjDnBsw+kLkF23GEqlwyw
         7E/8nifrrQDfFu4p9Ba0VI8jSzmQaWREUmWhbhaUSbCehFJ7noZ7eWSa8RmTe5wPYJFU
         Efh531rbhgBHrGCULzd+DjDClvTGVosG/WR3Y3nenHETezqkQVVLYUWNsqn4e8Y6cDEJ
         PDMA0QtCaSUNAZQ7bHa63U3ffK3CBcdplHndyQ1ICi3SZ8dRLh02kHFYIjK75n/81Ken
         xmPw==
X-Forwarded-Encrypted: i=1; AHgh+RrhJurr6CEu9mFSSdDnUrhDsMERgtgzqiykq0RePLkLk+v6Hk7t6RQi+QeuDZm/+jg0NNvcYUywvDc2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo32C7lEalbvJF+w32zHSfJuvyjxDOhqwdcq7m36MBTRimTsmo
	58hGmOmf9J3xSo++wVgZA7m/cGYQ4KZSHEazCdEq2rEoj//dzQmAYbZDce+gbkJ0wBg=
X-Gm-Gg: AfdE7cntCI5+xzNO4P6lj7V1DPlkKGPddujFjefBp4Vrzw3kFrnXP+xpwohkL5P/AV9
	mlITUMdZpcZpTvqBUK1NVhA9el3Y8OhQu7XQfTLnWmS99Gosph/Tgt+/glA14SNfUMkzK+24/Ry
	R4zYCYtbfiYRTfiE7MEOXoKnzwDmKNkfY5cxW3X+ssoki3ujWouWvOlj7U+9V6oXQarCzDT+URy
	EomYtZDicAH77CeGgYj8sZmSbtDL/7WgWwCwoUI4N1BfXC0BZLLsIamFL0a/fK1pdjJIDrx65aJ
	0fcmDjeaP97+6KPcuRV5KRwkMnTP2JH5mI+wECck5oevg+fP66XsAOAzJh0KtZwLsMcDFY6olyZ
	wHAGZ1RNdbefrjSf8mM0/zZ9Sm+xevbdDF+bkBwpdYFKEAYszEIcU9mBR5SNIDt3kviriYgH2J3
	yeeVCGWOguk7mSZrupuZb2GTFTVK8LLr2M1NT/Fc+BCj+Ilf2FjUEmhcnV1oLM/mTSZ7T2NevGd
	IM=
X-Received: by 2002:adf:e909:0:b0:475:f0d1:eb5d with SMTP id ffacd0b85a97d-47de66e3e5amr1182516f8f.56.1783358300487;
        Mon, 06 Jul 2026 10:18:20 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm26168854f8f.22.2026.07.06.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:18:19 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:18:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Message-ID: <akvjRus_i5ZdqKGC@monoceros>
References: <20260703-ltc3220-driver-v12-0-d4f0da2985e2@analog.com>
 <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uiv27xnpipz6mahf"
Content-Disposition: inline
In-Reply-To: <20260703-ltc3220-driver-v12-2-d4f0da2985e2@analog.com>


--uiv27xnpipz6mahf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v12 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
MIME-Version: 1.0

Hello,

On Fri, Jul 03, 2026 at 12:10:51PM +0800, Edelweise Escala wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need.

Thanks
Uwe

--uiv27xnpipz6mahf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL41cACgkQj4D7WH0S
/k5JbAf/cryojVeqrUz0kxo7uqSdT74K5dDv86lDbYDbMwsUBUlKrMUtRiqoeRuB
/meKtGAcJ6Lhtc/EM/kPL13XbuQ4XXUyVqeZcv13kvKwjozPfhJQVvxxz4sAnNZ2
Yxv0z1QkwyvKFTJ2pZzz0ZFPM6t4etJ0/Ufb2jUir2s5+NYlWHQAMTZ7kVPSEFRQ
sAG8GHhJTZAK3YOqnvR1ixHkGn+LUNvy28iZipbEJbsNbmDim5JituncZFTDsipt
eD2dR5fMlrzkmnNneU3QocsdWL1Z+UYPeJXFqe+LCUbB1b/oGOEfOu5vwLALcYhx
7cOcr0mLPD1LAj61L0XPO0W7ik6Bng==
=8rWl
-----END PGP SIGNATURE-----

--uiv27xnpipz6mahf--
