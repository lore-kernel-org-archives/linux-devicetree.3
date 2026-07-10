Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB8143801A;
	Fri, 10 Jul 2026 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702830; cv=none; b=LJPI4pA5PHNry0sU25zfDNVKCNNaKSbsucrgwNsrZ74T+ovJkRJ0Q3Ign5hhNGE7G3CAokTVxa8vuYQ160OcO7Mnno2D92tT/a5QuUK4zRSm6MGylbS/vlLUN/Ol235ogDsw3Mr/IOytULhmaKp6J7AbOLmqYAkOCRusCeivYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702830; c=relaxed/simple;
	bh=5Zj9hHjxmsQACL3TmtBVaEcbEaCvDkm4lamrMiQdSjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOViyl75SKBbvjjGlJOrWSo9jCJuTc1ovZU/O47zpCkSHCHhpa5RltxUOPs8SIKyaQSHZ6QfoaZYgu8tQEdv0zaUHRXgkkOcSQuy4B8/p1rPMbMlVTh1VwD3Gn5h/IlEiswyvphDLTgZQudr+pvkzeyD5TI2KUmutKPPXK2uL4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RL+Fv5qC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RL+Fv5qC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198761F000E9;
	Fri, 10 Jul 2026 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783702829;
	bh=KhnHSl0i4s7d2AvnbesOVFk4xzDdtZCJYreqMbDXWKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RL+Fv5qC3wH4Sh2uppJTVzFaO5KfVv2EL5yKIalY7nAVI1Y6Guso96lGOvdKRjOzT
	 ZeshD8AprXk4doRRvo8di+gqUwl6haQoDUdXsdtSZZJrfrAaIXU6qVu8o/dvQhbqQT
	 uKPxflDhEYpXcXpIfLSc1w4EHYGFVGAptUma7pMNin1qJE1TBAlHjFlaYJ8YwulJ8i
	 kLNJEVHZEDP/zG15P4Ht3CCsU74H6ftmALCFDH9viMeI5jUFqswRv8xlNbffiVUWrB
	 m5iu9SrY6Tl8dJgJYXN4aY1Aqc3rskTFoK4k0xP1yKOzEwfmBN6t45lEXR9ZIPzBPx
	 8BG+LbkkS0TEw==
Date: Fri, 10 Jul 2026 18:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 3/3] regulator: axp20x: add support for the AXP318W
Message-ID: <befcd3cb-3452-48f5-93e6-03210981bd76@sirena.org.uk>
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
 <20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SYJwS+xzN5SdnFtS"
Content-Disposition: inline
In-Reply-To: <20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
X-Cookie: No directory.


--SYJwS+xzN5SdnFtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 10, 2026 at 06:19:27PM +0200, Jerome Brunet wrote:

> +#define AXP_DESC_RANGES_DELAY_OPS(_family, _id, _match, _supply, _ranges,	\
> +				  _n_voltages, _vreg, _vmask, _ereg, _emask,	\
> +				  _ramp_delay, _ops)				\
>  	[_family##_##_id] = {							\
>  		.name		= (_match),					\
>  		.supply_name	= (_supply),					\
> @@ -436,10 +481,23 @@
>  		.enable_mask	= (_emask),					\
>  		.linear_ranges	= (_ranges),					\
>  		.n_linear_ranges = ARRAY_SIZE(_ranges),				\
> -		.ramp_delay = (_ramp_delay),					\
> +		.ramp_delay	= (_ramp_delay),				\
>  		.ops		= &axp20x_ops_range,				\

This macro takes but ignores an ops parameter.

--SYJwS+xzN5SdnFtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRJScACgkQJNaLcl1U
h9CboQf/R5KzARHIzV9u0gtVCT634AI8jwQnAWKVmSVbIp4YfziiLmNeaQUo0j3r
vYfGq1zVt3RYbaWZr6ANn5qnDVHqxwEbPqX7yZNRk3rsWlxfTVnlgtGVCeBSTsVh
o//UmvgYJbeF21C4jwgYu1GOJNeKiokVNp7K7s6ZxgHMMeJ/8eStyiSky0vAeX/X
YeStdOs0OrnZXWi6lbDfz4vFOkrscicQlsl8uUqWMMACXqB15aASLS1N3U34WPUq
kqCQ27QN4ldJ6K2wW+AJ3V9of7BVgpmKjlmp2fo9cBSBZqlc9aJDD5DafPAkKYXC
ZW3JHhqH5Wr1JFwZE4B/RIdTiAYxOg==
=LTOa
-----END PGP SIGNATURE-----

--SYJwS+xzN5SdnFtS--
