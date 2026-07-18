Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16A370ACF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784382706; cv=none; b=FEw6r0eX3eXYEQ+UsBsna2PA594/Rn0rLOMq3ALNSLUs/nVkMbmTcMRaIzOFHXBVie2NVzb9XoSFWFXifjR3MOJQ1dhvfYQ494Tqrzl3Me/U+egFz+AQvVV44OO7d+Fhu2e/ypblclmttUtsYJ6+xO/qNdE7eUFh+CFUSRJvoEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784382706; c=relaxed/simple;
	bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msk8lfXa2WCAEwlBtyycTHIAqx3Lyg0rQHggY4z/aBYU2jTyvb+Mq7lJXja2pKtQgFsc6I4gC4dIalLdTH69sJQvkPNlOxNXUlDnleUiu0bEit/qljjPH7cRw0exdlSjnwDZHzJj5nMJmRmjFrI/K97fj/KgK9f08GSyb8gzi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GKL91Ii4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GKL91Ii4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so3442315e9.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784382703; x=1784987503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=;
        b=GKL91Ii4po+JKkuJMgTkFcw9gMa5hG40MUcjQPiWPRaoDwb6V6KemIp6ikEMVYSOoG
         uasBvzoF1xjzvt96EivY1y0RMY9yfKWFYp2tqSWDFFpUcwe4ywp5pUWLZaBQOCV37Y3H
         JGdqu58UlL16H87AZsnGFg5wxImYU7PRdlIuUmZXbTla1RYuGzAzPzEnmDlyEgfaPa+q
         V4A/6eBHWxSPNSuCXhSmsVf4/tpNGt5Qb4OVexWdTVWrZPNOv3EP/bIj4NUbxulnetoG
         SA6qQvE5Oumwv6v7n7VV7Uld1elxI04orBMyuy9wa7EoYRtshBC69YK/3rm/HQX/Va6s
         D/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784382703; x=1784987503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=;
        b=okd0Z6C2Vj649XyPQ9tixNGFh0FJyurNR/FH0sf/dXXECcCrKPIyVCYveWNxdE22nH
         naRjrF6RgrzATsQ/Y0NSXAj0I7F4T1U4soxzh1f7hs0jU1tyMvjKSwnK8oTLFu+HcE69
         ggtExNz4u3hJjl9H3H3qyAnvKeJ3Od+8V3JKz2oTT0RRso3AzJgk9O6yOaGDIdbrIawG
         sM+CRLwf75Hn8EMuxX1OMsT2aTEy1GaAt0+HxQDoEvJBlq8heM3cI8SU4RT2ZbtZsF1N
         AQU59EyeHCvQFjNKT3FYIWNWOBMzhUsSiZRIuCeZp5Muwi4MuL1G3bFYMx3bHOtPvTES
         9qnA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ+xcgHjeBS5QwvCywv8osnYSyQntFj6oN8Dc1KgHuf/Y7aMj7h+9+QWNY2BvUX21IaspahG+zDtZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DwM74+nNITAV6als3EVLKovww5X/7PY7rrhjtdQovx8bloXO
	YZoamyZRoKvT9SMZ3I1m0x7/3DkWRpG8WWUWurRrsNtPH0dnk4yxni0uOn8U2olyZYs=
X-Gm-Gg: AfdE7cm4CzrAbWgLvDjOvcN6grdjS4GTu+3L0PD2ngHX6qwbWIR9Ayv8iEpclVK6mbh
	1zWWUYnwOyVTF5C49zmALcOcv155YNNMCEyiwn5BizF9qEZaNBJ21jycCrepHM7stHg9m6qQz9X
	JyHSx49lSz9QWE+/EwNWiChLhp53hI9ldoqXY+3zo41Ib4AOM4MV7zUZR6KEYdYjcT8oy+twyaP
	RuCJ51VrvtWqFe4ny6ragC9yFveFLPbTPUvlebPihNuCVBrIk4O30wuN5XA8qleiLfCgpO1/IpG
	8uALoAaf7gpDdJI6bO95EAgiBVpwNWjIibFMChsU5uCZ1oDDGGxvAsi8dcLx3TT9MKBKYa3sNEi
	m+zuGh/rsrfW9dSu6OvqxtEsCOYBuR2SbYNmBCXQn5o2TW3feTmtJFyZ+DDuqq8QRfuSK5IHJum
	AERACHGNM=
X-Received: by 2002:a05:600c:5882:b0:495:441a:39d2 with SMTP id 5b1f17b1804b1-4954a402f2amr56064715e9.21.1784382702902;
        Sat, 18 Jul 2026 06:51:42 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49549a3e56fsm125239405e9.5.2026.07.18.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:51:42 -0700 (PDT)
Date: Sat, 18 Jul 2026 15:51:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <aluEcXhBE-koqBaI@monoceros>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
 <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yilug374dphh6m6v"
Content-Disposition: inline
In-Reply-To: <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>


--yilug374dphh6m6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
MIME-Version: 1.0

Hello,

On Thu, Jul 16, 2026 at 10:53:02PM -0700, Petar Stepanovic wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't explicitly include <linux/mod_devicetable.h>. I'm working
on removing that header and <linux/platform_device.h> already provides
of_device_id.

Best regards
Uwe

--yilug374dphh6m6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpbhOgACgkQj4D7WH0S
/k4LzwgAqUsEtKBg3XgyxAvu4y7B4B4jSS6/on1s515DyGFwKexOluTvela8r2+u
fCLS0KTyCMzgs/r2Ht9WdrF7m24uHy4nYmttIOwOdk5ChYfCDlyYorB8uXVdHW0q
FaJRUGcYXKQ55vSbfNmmAt3RVmQj922qyja4NHpVU5mg0H7ic0rQ1WXmD+g0irJW
wR+cDY78sJRZ8FmNkgjA4XxLu9i252uMG39NB6xQqgazs32SCfNZnVQAyGBBGAoE
+atUSsl8IEV7PQnT4oeAY5Dhh4p4AQ9r9MzUmWL7EPkIyO98GqOdl4vglsRKg2hg
Bea+oa/lxGKZOkoO+wuPkU0H1qdXrg==
=zIaY
-----END PGP SIGNATURE-----

--yilug374dphh6m6v--
