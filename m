Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B02FE04E;
	Thu, 14 May 2026 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775736; cv=none; b=kK9eBasee0IAoq38xaZWcnNZks0CFkCPZ0u5WGJI46sftmusImIPCjYQ+ig5ET/mcwh7Wt4M+BDv05uA65bsqhTy8ZDGLsnWl93SnfOZGEi/fhDTzd2Su09q0d1YbUMOBSdaC/aCX+DoKkYvDqncHdTLrsyCF5sUbzk8fKp+iNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775736; c=relaxed/simple;
	bh=73fxWTuyiBOp6+GjEI2yaO9EgtXApTP1T+BOeTS3rAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpwvt2TX7WYiwIM1BWE7e0eYTisTR2/QhZey0Z4HaA+Z7MnHsJhkw1lAgftrE0+XxpjAf/iNL9Qaajqm1jzksNoweFWbY7QpqEGu8GY0WZC0XWb5iaQDbjlpXjw0JjP6lGA5ftAH6TPj+6d99bUan20UZ0sQE+zYGxseXzzLK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFbaG9QV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFbaG9QV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469AFC2BCB3;
	Thu, 14 May 2026 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775735;
	bh=73fxWTuyiBOp6+GjEI2yaO9EgtXApTP1T+BOeTS3rAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFbaG9QVp1qytR13DVfdptqgNWmRSqoEcj1AZPIJ3K40WgWlY5MxwrT2YOPXDxBon
	 S3FUrX48+glSKCgdEO7ME6HFjzO66pSNbCOYRindSFkZJSUzvJIN0AUdZzhNnIAvJt
	 1dydMn6238ZkjndwD3hppo1s9jOrR3SO4GouDHflcUom5KAkrnO7tkdvNzlEENdfV0
	 Dzuf96JYFEC5dZDTGIzoLX5eD316+k4Vbw8cjec2aZFFqh/amKdq9AWrxfIQEL3/0w
	 ultgIlAnQ6TDt4E8dAZ1vCl395lo8pOU8y1UmFrrl1R9svh86jWTSibUQsbAjl8X4p
	 mEqkPlBovnzSQ==
Date: Thu, 14 May 2026 17:22:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <20260514-gestation-hatred-69029fd05f70@spud>
References: <20260511031945.3228-1-jszhang@kernel.org>
 <20260511031945.3228-3-jszhang@kernel.org>
 <20260511-amnesty-afoot-84537aafc02c@spud>
 <20260514-fat-unyielding-jaguarundi-a5ddc6@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BbfoBwP5jS6lf41o"
Content-Disposition: inline
In-Reply-To: <20260514-fat-unyielding-jaguarundi-a5ddc6@quoll>


--BbfoBwP5jS6lf41o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 02:17:55PM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 05:02:18PM +0100, Conor Dooley wrote:
> > On Mon, May 11, 2026 at 11:19:44AM +0800, Jisheng Zhang wrote:
> > > Add dt-binding for support of apb reset which is to reset the APB
> > > interface.
> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >=20
> > Please squash both dt-binding patches.
>=20
> I think this should stay separate, because first commit is trying to fix
> undocumented existing ABI. It will have different rationale and could be
> chosen for backports.

Ah, I guess I didn't read the commit message. Sorry about that Jisheng!

--BbfoBwP5jS6lf41o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagX2sgAKCRB4tDGHoIJi
0m78APoC7BNZBKHuVWzSNwad6VS12v/38/OUqyzyeFhLxAyYrQD/UAu/Y28omxU8
tywp9InGV8Iox+8BKGMTg4/oq6IjNAY=
=efLo
-----END PGP SIGNATURE-----

--BbfoBwP5jS6lf41o--
