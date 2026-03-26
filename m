Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31892389DE6
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523290; cv=none; b=g0ChEJlrS/3miMTX1Ija83aKWdVMXAG0o6C6qGOM+A1zdyFImPUaNUyE5Zue9F1UDbCbcDpkzRfIFY8itUSB9bgFpp6r4Xsao/ZOMntpZwqrMNhIKffAih19o018kMhSD4kGVFVIkiuXQ+n0EgsNTJ0y8/YM3zD9G4VBRadZAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523290; c=relaxed/simple;
	bh=+FhWc0INodHNcusM5JjA9bz3CwoI7iZDfiT6TTB+4QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcXR25N1e+DNxeuAI+WuR1CW9lncXXT0Rdak+q/R2aaPzlwUy0CvjM0q2ajD5AkKoy7fte3ml+bKN36iMRGFP6JS04KLkorTay9H7IBOKWhpvNWQcO4fgKtALLTqKpeMD3JLqrn2o6r6UVHOq5s1D1JAWcB3M5mfoG6ZvnlZgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOgdNxLs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOgdNxLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91817C116C6;
	Thu, 26 Mar 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774523289;
	bh=+FhWc0INodHNcusM5JjA9bz3CwoI7iZDfiT6TTB+4QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOgdNxLsTi8DtMDzePjgCDmLAHI5mhZkzKeH7gXHNmILLQJwgN+KjBX5ja3sWHVQ8
	 dOYWiUkC0dY/HRVSqfbB5jPWnjBYLt7uXcrCzmF0NMQ0Wb+8gk3c/UDUiiaUbcUdcx
	 44tT+tHR+AVhfL/BdHxujl5NxuTiD7XRocYQyUo6MZXeSY1QmeQSN9DVDMouytg2XN
	 PhqZ7oehi5pR/1/b1E3srSGvx0BFg8mBDE2Fq8Gc5NfwQl/b28iMzeuK2yZmililqC
	 gwV7jhPOgAMYiEx/csjr5zacH8CCPdZns5Uw5iDLfzt/HL+XvlDdojiQL7uzIN0hSf
	 /sZSgaNOMehzQ==
Date: Thu, 26 Mar 2026 11:08:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <0d027c7e-f1a3-492f-880b-4b48d64bbd41@sirena.org.uk>
References: <20260324053030.4077453-1-wenst@chromium.org>
 <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
 <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
 <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q/FgDHQaj/4ct7kW"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
X-Cookie: Here there be tygers.


--q/FgDHQaj/4ct7kW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:14:32PM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 26, 2026 at 12:55=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > The top level, so people can figure out where to describe supplies
> > without having to read the bindings so much - the supplies go into the
> > chip, even if they're distributed within it.

> OK. What about the more complicated mfd PMICs? We already added
> *-supplies for the regulator side of these PMICs in

>   - regulator/mediatek,mt6358-regulator.yaml
>   - regulator/mediatek,mt6363-regulator.yaml

> And my other series for the MT6359 also adds them in this manner.

Existing bindings are existing bindings, we can't really do anything
with them.

--q/FgDHQaj/4ct7kW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFE5QACgkQJNaLcl1U
h9CL7ggAgKF6xfRBI6ZivfcXbd/SrQnByho2Y1xJl2cnd1Y0TCfoatIiZB7ZiYz5
qCv+EKML1pICmBQM+d2qEJfssXEOVqou60WZIaiK35y8/G7WuubtGGHeOTaj3ISC
tYBPuL0xZkBonsk54HqiLedLdPI6kqudc17Bpjky4ohW5OEc6tBceHpIQ5JjeT47
XWnIUn4lT2ceikRNsgj5AI7EaVYTSVh6o/cXPHuz1FbQMlEj9htuvaey7/NpH76f
9N00HqwUP9qAesmrjOjVDa7M8sj5aPNLfH1YVL/qH03lP2dAOiqhYlmebW/YItNQ
ZN0kBy1Lv2fAMLBLsMn4GlliVMsccQ==
=aoz7
-----END PGP SIGNATURE-----

--q/FgDHQaj/4ct7kW--
