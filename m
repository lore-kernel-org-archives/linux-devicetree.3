Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD902D97B7;
	Tue, 21 Apr 2026 17:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791613; cv=none; b=YVeElO+0s3ea9FaXu7ATXay6OlKSuarpyxD7Swd+aFnUdMj7JCU1CJAf/1DCryB9txk6q/UX7LzpFiJk80y+dv7Q6NoKspH7v0xMhI3SvKo0OkgenesVXJKxztQbdzzRH4h0bDxmyg9lS7Wq8hESxXRO/n2oZ/nSf0aUbzxVtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791613; c=relaxed/simple;
	bh=juy8vvjaKj7ECiU5zZaw/79uupGBeCVQesLH9Ly/Iqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTao3cPw1SzYdJGeOADKck0eY+D/pbl7L/MGxlHTTBvix6a4c02BmviYCoKUsuWCDApLIuB+Ckas636ScnwfaJNiOdgyhq8mHAs2x+Yy5S1kWzwBRjjZ6Q38aeRuJF09nw2ol1bVKPAXBtqBTLLUWNtKL/8xi5v8IZCpkMaS5tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CggrhaXr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CggrhaXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6678C2BCB0;
	Tue, 21 Apr 2026 17:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791613;
	bh=juy8vvjaKj7ECiU5zZaw/79uupGBeCVQesLH9Ly/Iqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CggrhaXrPlLHxH33w4Vl5GjAA8kyLeFV2zJFGFl5V5/45vR6+hGLuMbwHutCH/tHH
	 y91PN4z5UobOB1dMuOWkSbpAGzTNZagfr/Wv8yxvvDY8mV9oSNsPIC01Fh/FAyy1xC
	 GDItMWb+DgM7vqFTsMsI5fr8Pi+Ybgj60k+lTnAqILsztOGEdlQPy9rZ47a0JG9nbw
	 mdVFdxzVkUNMbQ8/cVLe0h6f+p9CiYdEuh6KoytCa4O7aw3itST6km3sk7F/xP9F/p
	 oitdsr7Nn2WZx0WJfXh5zrOS8jlAGeWHZz7r1ndEsjC81VVzA0DOj3+hYE27oXxdUq
	 6LJksxHkZleiA==
Date: Tue, 21 Apr 2026 18:13:28 +0100
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for
 Amediatech X98Q
Message-ID: <20260421-scribing-paternal-e855cdee5944@spud>
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at>
 <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Xt2J/yWb1gzAPTi"
Content-Disposition: inline
In-Reply-To: <20260421155328.26359-2-christian.koever-draxl@student.uibk.ac.at>


--4Xt2J/yWb1gzAPTi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 05:53:27PM +0200, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@student.ui=
bk.ac.at>
>=20
> Add the board binding for the Amediatech X98Q TV box
>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@s=
tudent.uibk.ac.at>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--4Xt2J/yWb1gzAPTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeewOAAKCRB4tDGHoIJi
0t9wAQCnOaMRmKZPShx/jet1Ljjx5OwgLBaDjEl3uD1VWrQNdwEAwLrXKr4Ax5A2
ixb69eoU02+OpKk7wIsYjzMrDxpiwwk=
=MSwk
-----END PGP SIGNATURE-----

--4Xt2J/yWb1gzAPTi--
