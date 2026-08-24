Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41AB4334D8;
	Mon, 24 Aug 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589441; cv=none; b=b3KE0z4YRjYpN8NpIbskB4sKSqP5Ww8LcSrPBhuHKeH50EphZpmHWbakMI7UN0Z6D1W09QiqcMysn5lD0sgDWQcZRh1CZW7nv2OP4NTVRpc5Mz9jbLXdLDK9ZFK1/eF4La/2+/kNWVrxu42tQeKfj0NQYL9EKYdgRNISTHJ07Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589441; c=relaxed/simple;
	bh=Ii38IaN+tAJJw5LwMZsc+XeCW/z1i090Izn0s9J3ZjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siBnnks/YA1PTRLt2Yj+ChaRhtRvFJLvEMWAsta806A/OCBf3wAZeflioafIGpPmSrqxL5V/vPpvsTFGmEW3pJGtUZHCKPoYC++Gi+58oafvYNc7a+gZ3ISemJJRAVvZjaw/X4We8rDcBBb7rbPwS1bG2yhY0XVlNxDGM/6X2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtg66Vfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtg66Vfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF671F000E9;
	Mon, 24 Aug 2026 16:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589440;
	bh=Ii38IaN+tAJJw5LwMZsc+XeCW/z1i090Izn0s9J3ZjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtg66VflSzIEX1eUsLAuDw5a9etLdGkMue/ucYLoeiR6c3v64E2Ya9fOBQAdhm9Kv
	 eqiWbeVrHG2tB0AeT9Ls8O9AniFATMJns4fkUV04G0yeKLFqx/0LfDe4ma1+IyqHGY
	 LaIEwZwNIp7dffBb95Xv/+mplobgdEtI8uBX5n8fMfyTSSlXzwGmLtx2BAR0KAYEEx
	 QQVYO38OkVObmoaAvB1kqS3rT+G9rrphcglH4faDT95vxTK8YdAAmsIJWcJEI9Ai55
	 5JESou85ggyBE5BdlSw+oCb3qAmjB3x5UiBt/uTe/SLpyjPh8wr1/Oit6teu6FReX0
	 0snZzMlsFYz2g==
Date: Mon, 24 Aug 2026 17:37:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: fan53555: add tcs,tcs4526
Message-ID: <20260824-narrow-pogo-0696536f5190@spud>
References: <aousEdwMni9ScZBn@0d3a7a881997>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56BYViHxiGZnbdxy"
Content-Disposition: inline
In-Reply-To: <aousEdwMni9ScZBn@0d3a7a881997>

--56BYViHxiGZnbdxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--56BYViHxiGZnbdxy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzPAAKCRB4tDGHoIJi
0hOjAQClWK+g2aj5XfDSuCK+fzhDBOHb6K9Hpi/KD3SIh+25IwEAy1dUEnvHYNBl
7cvkMDNlYZRHuBOPA37wX7wiSeeZ7QY=
=fcBK
-----END PGP SIGNATURE-----

--56BYViHxiGZnbdxy--
