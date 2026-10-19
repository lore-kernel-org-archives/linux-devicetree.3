Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81D3FE375
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393274; cv=none; b=ryXG+Spl9zn7elSjulERYIj76VyGwUBGCopSX2XruXvCtjw/v9+xeaJPCHalX9srT7ZvhE/UIu+35zYzi1KXoE3cH1wdb87p2N8p5VLXov71beXka4Rw9Xs5PoEszd8shjXXUd9jLAJvobeLaEugOC78i/brr79OCpVB2lMHf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393274; c=relaxed/simple;
	bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWoPNvO7UZB7GVCxC3L0JvM0w088k0zgaoWwpce2I1QiTyr2jD39UOdaCiQdwvvLymNWpohf2SCmwXbgP3skB+6Pgzg17xc6resUiyT5lhJayyDnvp9bKSgL07L1WccvVtzngzhsUbzvrNKstAf/vwaXa/LMUX7zF6SWZzDeTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WFaGix46; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WFaGix46"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2980313a12.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393272; x=1792998072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=WFaGix46Lz1n08JyZmgqDocAeYq2pXOmMZHkbQoXwjpSt15IC137n35bfYVWI6CMl5
         rBE66V6Wx6ENL01C5x4KzDwSOv2iEeQ6RQ6/eOWK2N8c+mTyM0IbrSzAI9gFQd6SLupE
         UU23CzjQ3WUM6OY6tQEkf1ssY7qZDux+uZXHTZVvyNR/Ea8h18Kw+/ARQ8pSb1zOS8Rv
         hZ0BSrovjFNCh/nUNrgjgN5YXabJj+4PtJ13maD5yqRbRrQlKXoa5XaoXgYXOdvsmKyF
         YjFl49AHjtC+DEbmJNHRZe7iQVdFFTWgHu0U1nrCfKDNVAsqyP2BkUSxoonzhJsmcNQ6
         zRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393272; x=1792998072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=htSRwYmBmm5lBa7Xs/CtaUwuiG+r/dSXclpfmAYd4E9VdALcjkZkOtmaGpR043xc2M
         8jDCWDRQwbfSbSQhAtjSPToBhKziIkOoGyYstIB5LqwKyL3YpWG+NMV0MIYeKdoJjpDJ
         yPW33A1nn6sYe+b0VL3we0Z///P/oj9GviW3nCJ3lZSpBzz+H42XPr4oLj1uvlPm5W1X
         adLySFStmcC5SBxRACtsqAr/X07k9ypfS0w+8U+BTz5CCP2EQSKuwr1t0pYvSk0Q9B8h
         Sw1uIhF4B6JDMl4DMc0ochzf95ksPu9ZkLdQwsm6ApV0xy3v2piaCakSiBTz96YW++fD
         cd5A==
X-Forwarded-Encrypted: i=1; AKwUvBxbniBI8QxsQ+EiPoSP1LjhcNOFHyikLruo/qmReZd2Q+MXMrVeH4ePQa0EuMtC/h7DJKsRBSedIluC@vger.kernel.org
X-Gm-Message-State: AFq9FYIRpWRdt34RbRC9WSFnJLccSOlsS7vTMEITZQF8Y+R04gRU+6hY
	hniCbMnHbF9KwJw6h/1DzwbsRxj0xdH1cs44nrxUQx2hIDDN2NQS6rdNMSgN3B/IL1A=
X-Gm-Gg: AYBFou1WnH8X8X55jLmEVd8dd7DhdD2GN8bk1cLrEjtXXd1MJ03ypq15OqMDbbX2IYu
	GevKcpiTQVwuTTNdvhwyUDVVVmHGVsohQ/fF1Ew++vudtrdK59TuyvbJEG74VpEq3RONqQpRzzT
	Y8VVW2qSfigeVKEh6fBSyuY4xOCa5oyurTisoqv45jz8ZpGCnCrISKRzIG8xvQNTdW700+7vsvL
	XLCPl3/N9t89XOZoarDVGLgN0uEeTnfDqtnPIiDbFZ0HoxR4WK7O+WH69kwzJ/zpmQ+oAHZvi5a
	Rbze2yH9Q9ngL2pUHBs2yccTrIAIKxD3VyOj4fNDV82cbZP9su0GSGYGkoEggQfYUJgR1CEsElr
	oV5y1n3mEHyyQlWlQXBW/M3XbX1rOJ1PcXcCOAwz8ztW94zTYa87vITBtKfugDV6gQZFWMtJZRY
	ZqCYn7mRGE0vtXUd5u1XcQqbsIEFxSop7TQAPJMyFqXO1f7IGwhl8tB4VkYcRyticYfOuRu3bsg
	O2OC3u3RiJ3qf/HFC9GjG1dP0qlYGz9C7bEvksK//T+dYbDZnk9vey90xqRCQ==
X-Received: by 2002:a05:6402:325c:b0:6ac:6fd3:1e97 with SMTP id 4fb4d7f45d1cf-6b3a8198b00mr3033569a12.35.1792393271655;
        Mon, 19 Oct 2026 00:01:11 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4e7ff1sm22693440f8f.25.2026.10.19.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:01:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:01:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ross Cawston <ross@r-sc.ca>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chris.packham@alliedtelesis.co.nz, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
Message-ID: <atW_3bhMg0vsHtNe@monoceros>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-4-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxjchq4abhvsnp6i"
Content-Disposition: inline
In-Reply-To: <20261018194339.132-4-ross@r-sc.ca>


--nxjchq4abhvsnp6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
MIME-Version: 1.0

Hello Ross,

On Sun, Oct 18, 2026 at 12:43:38PM -0700, Ross Cawston wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> which pulls in a big
bunch of dependencies on subsystems not used in your driver.
<linux/platform_device.h> already provides of_device_id so you can just
drop the former.

Best regards
Uwe

--nxjchq4abhvsnp6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVwDIACgkQj4D7WH0S
/k4jrAf/da4fouhkXJC88m375WuCC2zmp7feudZpUHTGrjpPVuXOGtGEQGIvfq0q
pCd5kfrkD6R2nAVU02XiHIf6z9KbVLfbNaXojWbu0NdKBpCvyUMEJ3C+QZtXSXZX
qG+en94XPUEproDiPCzMnTCEjwPK9ZGBVPezOSTj2EiG83ehP6Y91UVRf9X4z/qb
qHVHfNszS2ZHEOYgkDU9vi4ouTTg7XybRC8+ikJXmYJIkqMG3WP6HXRHADnr6mVO
CaTbrr7SvLdlO5lEfKp2E6GEpfgwDCwMR/GeIHXL2qj7KO85kycsjOk20ZcuMzUw
3qudAVQ2eBldeyhG8SHT4ndWZyFrJg==
=+WSr
-----END PGP SIGNATURE-----

--nxjchq4abhvsnp6i--
