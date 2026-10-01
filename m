Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD03DDDC0
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881094; cv=none; b=NWFxcSt9KdzlYkkOdxPMt8MIfKCr6dY9aAa0VyjJ9mMbUxy0hI9yAKhh//AA7M88dDm2JyyoUo9fjaUOT2791CUVWto0UKM/c0yG6NwcgvNjbRyc/KCdm1Ll0HHOT2EoY9ZjNLd2RfJnAb2xSMvApzZwEVz0xIHeMdPEiE4/nmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881094; c=relaxed/simple;
	bh=C+TD+y9xyooV0TFYd+32h7AlsWYzgPptYzY+MvSOyAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGwfWmeC2D3lk9d/zpq5ZcbUi//++Rg/XNqSARy5eAcNIdxkV9tAprHNrG3CZZnAWK0pSuaYheILH4sNXKNE5TpLESWSvM9AnObChlwnqMMufuVcj29XSrYgsr25QmtU19hSxcq1K6l+bEGjHWg+Gc1DhLW1JSeRxcMgR4NFds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFTgRlh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFTgRlh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59D61F00898;
	Thu,  1 Oct 2026 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790881093;
	bh=JTBtV6ayhA9VHqdrweYZ+awmTW6qh/zT9wC0NVAKNEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFTgRlh7RwmICEThImnhf+prrXwKKTXJXxKXT7MIU2MGOhyYBnerQfig1xzBFGYKl
	 sjWW6jF2P7Tl0h73XFX3ma3iLRWf64jmsUaSXHBsslEIHZQBV2YjwCvPT8ECHxh0xA
	 rm6wx3nbM7zZSmTUHqkJQPZlIn0gmhU6NVYMqvnRoEQiVdQLqTB+Gk93xQVwdA2EMM
	 kO2JekiXKxubGD2fueE+QkeXqlTUknMuCJsu2k7vuTz4SLU9Cq3LoKtwO7+k1LGBRI
	 Qx5vSbMT8mtV0O+MzpoI2qKLYLetpadck0/GzexC2iig2IOPYDdTfUB3sJVWK9Nisx
	 BHCM8gIzceVxQ==
Date: Thu, 1 Oct 2026 19:58:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the robh/linux for-next branch
Message-ID: <20261001-stride-trailside-d533de737a6e@spud>
References: <20260928105951.2187076-1-matthias.goergens@gmail.com>
 <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com>
 <20261001112526.3822682-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NXsZ7F2OumMCybN8"
Content-Disposition: inline
In-Reply-To: <20261001112526.3822682-1-matthias.goergens@gmail.com>

--NXsZ7F2OumMCybN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 07:25:26PM +0800, Matthias Goergens wrote:
> Hi Rob,
>=20
> > Is doing this preferred over changing what HEAD points to? Happy to do =
either.
>=20
> Neither, it turns out; please drop the patch and leave HEAD as it is.
>=20
> The motivation was Sashiko, which reviewed against the default branch
> of the tree in T: even when that branch was far behind.  Your master
> follows mainline closely; while it is at the same commit, as it is
> today, Sashiko reviews against mainline in effect.  When it falls
> behind, Sashiko now skips it (since 28 September) and uses linux-next,
> which has your for-next and dt/linus.  As Greg pointed out on the tty
> patch, a single branch in T: could not cover both anyway.  So there
> is nothing for you to change.

Does this mean that you're dropping and/or reverting all patches of this
kind?

--NXsZ7F2OumMCybN8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6tQQAKCRB4tDGHoIJi
0jfeAQDV5tY0+W5YFrdNk0767YRKIFkt8DR0QS7BUtAErfS07AD/b2TZtImYsyud
dPDNkUWq3hAEDweUEzqDCOpCXPb6gQc=
=zFw4
-----END PGP SIGNATURE-----

--NXsZ7F2OumMCybN8--
