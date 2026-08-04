Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BA4BCAA9;
	Tue,  4 Aug 2026 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874025; cv=none; b=R9PYWD+Z7o0V9y9qir9YuWGbJ4k9NzJ8q3A+/3u5GUBuB0UERq8Kh/dIChOe3kN5Uzbbs7FW6s4JM0eGTNpsgVtViWHv5PBQI6222nUQ0AFm1XN0ahJNnXPOUIwMg3NphweNl+YY4kvwxvv+Qz+kaHz4vK8fAAsC3WtY+ef/IWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874025; c=relaxed/simple;
	bh=uJIEmdk+5dWsifdEdMtV3b80h5V+0B604vcQnosNLgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XM2DXIeclWM7KNbALHGt/I/gY2hEjGzWCRpGG1uagaiHMmirf2NlkVGpR6vbWANjwLIRYniIsruV3pbwpRaf0oaYGGVK4g2GNZtVNPubmNkoUepgjiOjcv3ImQoHa9Iiac/Q1bsqHtv9fWeSRbaJsHRIyu/DIVgn2C+SOpazvbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4SgrOm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4SgrOm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EAC1F00A3A;
	Tue,  4 Aug 2026 20:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874024;
	bh=uJIEmdk+5dWsifdEdMtV3b80h5V+0B604vcQnosNLgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4SgrOm+h1U1ESWtkLGqpiyMVDp/4yEcBvcVq7ISQIVT0S2wSYrhToeFxPBU53YfO
	 9YyT7vbdyJA9yZenxX3iT2nBXlSqOSk7Z0xlrssAxTE2dVWF3Wk6aFEAburi2+Dxhg
	 gdOGGcqm6xtWLASOA2LfjToDzxEBrDQC9qW6+n/yBEjbV6r4/+4TWgAPuyRsr+wdu1
	 Y8Uzyb/Eo4ia0DpRZ8aWQ4MvV07PwyQFbnXAUHA/IVQBrICicXz1OpHunXBhhcA6gQ
	 aeoezdjEr37r+k2zSfpHhj/Ozu6qVbsSjOsgLVYm6Q1OZrCf2p08bDoMh1MPXgFKDh
	 2oTffIwKSpJxw==
Date: Tue, 4 Aug 2026 21:06:59 +0100
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/2] dt-bindings: regulator: Use generic power-controller
 schema
Message-ID: <46ee8825-0845-4455-bf6e-663831ca9e41@sirena.org.uk>
References: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cn60xfTGHd5pwIro"
Content-Disposition: inline
In-Reply-To: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
X-Cookie: Biz is better.


--Cn60xfTGHd5pwIro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 10:37:51PM +0800, Peng Fan (OSS) wrote:
> The generic power-controller.yaml schema has been added to dt-schema,
> providing a common definition for the `system-power-controller` boolean
> property. Convert regulator bindings that locally define this property
> to instead reference the shared schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Cn60xfTGHd5pwIro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyRmIACgkQJNaLcl1U
h9AuVwf+OsejAXvnHhApi/S4bngl/3U7NigiNbaOzoARS76v7/c7NyLoA/tNJKID
QLhqkOwnBd2TGFD/+W6yG6O1pCFPHKQX90neDdA1qJ1CJS7/ujQY8mNt7uXPoThS
fhotKmY7Zs+QXDd1+fm16nkUCskqTcThkDZW9KpmA/gbsgQPGTk1NaO93qgijIAq
W2nYJgwcPmkg0+8dzmyjQ66Dyevbd1w8ixep2ALNxztw1WBAeojAlFoFiFIAm17Z
vvom6Kd9Ztk77KHgzDeoIAqRMz56xyYsWmFDOHqXt4Ht/C/HxbX1yCqXgo4L4EWm
sL/Ypvq1F4U0XYu/ziCBPZt63MiiwA==
=BVhA
-----END PGP SIGNATURE-----

--Cn60xfTGHd5pwIro--
