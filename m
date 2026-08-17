Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9E3E764C;
	Mon, 17 Aug 2026 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985991; cv=none; b=n5HhF97RHCZUmBhdn1/FDNN7ksbTbNn0wtqgawlzSZX3o76IoiqZ4YF57vwVqKEaa1LI6DjzP+D+zhuqD6J8CcaX5yATrgZ6HOsqAeot76Z80Xrq6ENixf/BMmcu0DICOAiz3brLz08i3cyTbYy5hDYQjzriny2yMV9Oatlujc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985991; c=relaxed/simple;
	bh=MGZ0yp3dGa4GSbO05csV0+B3ysyLN6dK7fZjW/9YYlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRLZ8/L188Zwq5aNU46j9WQPPQwkAbrVlPaHBm2UKp1E4hZhQfnUylxwx4EToYnR1wcZJssD7rZIloebtVx4zIlV1N1NLb1A0UdGa9eQPaaDwXDr37KaaDQ5Suf2Qi4W8pbIII+WdwOBZjkOyPcwd/eDnqUWTq1N8OdyajCzakA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTeAGuB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTeAGuB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797581F000E9;
	Mon, 17 Aug 2026 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786985981;
	bh=MGZ0yp3dGa4GSbO05csV0+B3ysyLN6dK7fZjW/9YYlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nTeAGuB3yQ/Aw32qS9wBrwnXG1N4oHa9olp3Sf8sbnnWoV1g4+T5++8IPCcTbwhM9
	 AGdDqz+RAbMI4iPEgA9uhcU6eh6PD8r5BZNmt7OcvoTe7QB6HWyHuUY1Kl20ldD/Cr
	 QLvteaumbXN2owPM99m74QqxaiyL9TXfYpvaDNz1iP1dqryxQj35YR+mjWrIne8kPE
	 7fFaekEq8CPcVnIJohr11bfauB8XUUoAyivirGly9shNiAroCKBQgCax795oHp1AyH
	 o6VWB4adKoOttJL3n6pShfzRuaqyMn8oRnmNs6RMHGY3UTOHBG0zPq4o0ZsKPj2CoZ
	 k9ExTNO5PqycQ==
Date: Mon, 17 Aug 2026 17:59:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com,
	simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: regulator: Convert TPS65023 to DT schema
Message-ID: <60784aff-46f1-463d-8c4e-a2c397f898ea@sirena.org.uk>
References: <20260815082913.2144978-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsXn8At6nwz2jbZ9"
Content-Disposition: inline
In-Reply-To: <20260815082913.2144978-1-egbostina@gmail.com>
X-Cookie: Obey all traffic laws.


--KsXn8At6nwz2jbZ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 15, 2026 at 08:29:13AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TPS65023 family of PMICs bindings
> to DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--KsXn8At6nwz2jbZ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDPfgACgkQJNaLcl1U
h9D8zgf/e5uoWdz+jtZyxdfJDOtfWMWL0osxXkPHezP22ccv//kGlpRbsvRWT1Th
n73OAWhp6l2cbaFxZvEehIotgNl45xlX6Mr6gr4Bp+a/4XwtO5Vl7CWM0RLgnOZ1
UABualBOamRInDHBevmwYqltw7TMemX/R8hlJCCCZh8yBRDSY9Bk7USq01OVrqLu
/AiWG4y11UJHWYhgAwpM7bZnHoA/f/FvqOi7eGM1gFmuuqqdvSWLCUiIaSeX0Gs/
Ml/rVyv15W6TbAnjPcY5gkcMoH7w7LMxslNs7zQuftbecL9VYIRFEAGvvGkAc97K
VBjgtYjY8WJqsWrhHIfyn9xlih5lWw==
=WGfR
-----END PGP SIGNATURE-----

--KsXn8At6nwz2jbZ9--
