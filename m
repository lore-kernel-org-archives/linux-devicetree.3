Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC4332EBC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199637; cv=none; b=jtdLYPgYqN86zP559YWCCRAZ5Hk3GJzNwK7CWLd9OpcgzNR5D6cSdixn3a33KAZgHFW9/5IUNU2KWYLXy3JfNKLfSVCV4TeKYIEKgCREzo0Qfyl5zcrcOnfzj8zBymphr7XnbWUznhLuK6i5Xd2JGhxiwuCovys51JlUBOGEApw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199637; c=relaxed/simple;
	bh=B6fPCFajjqx+bqSKTPcLkjoZWKhORO9MGEFzRdQ9TWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4E/LE75fyLvKTLCAsr9XMhzF0J7/ufREDf/DAj0hmPkn2YKH4Hrfc+nrzYtFkfMdFhlx6pdylxbF1VyJWa05s7QSgo//VlCWileLk8G1iVxKhfW9+0Pvv19DTefxbXrOe68upld9vjm33ZXQt8ZDdY+P6lx/SS15eUFFd+y2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs2CfFyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs2CfFyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DAC1F00893;
	Thu, 11 Jun 2026 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781199635;
	bh=dGY6gRpDw/FAnqooubUhL6f+5QZqWpLz1cM5Q+PhkxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cs2CfFyEUgif8Vr3NmTvuk8fEVqQtQR3QOR1ahHqzP5Tz5ReeABg3vUArco3rAWR4
	 HcUv7of+PVoQL1A/UzVrxzbhtCefqUrKajPajyF9xFd3VdaJouRRFHHFcuLur3YFrY
	 T8iNUDi/Hc3KfGWRNFJKIh3P8T5le/5E77Ga0bFWrUsvjmXACj6r0zcJxKMYYZOCqr
	 bdvPjjVVKKktWd8tZ3Rx5VMG/QLUScRkaWTC1MFJyILzKRdR+FPd96xxuO1zAIaOOS
	 v3ljD95lBKliDAV5cc7hDxETJ2t2LMM/n+h+pwua+VordAG/9S49C2xwk10ves8VM4
	 5pxBmBYNEZURg==
Date: Thu, 11 Jun 2026 18:40:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Gira
Message-ID: <20260611-swiftly-imaging-d624308d16b3@spud>
References: <20260610213047.500701-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vwwu2srQgu/T3eE7"
Content-Disposition: inline
In-Reply-To: <20260610213047.500701-1-l.stach@pengutronix.de>


--vwwu2srQgu/T3eE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:30:47PM +0200, Lucas Stach wrote:
> Add vendor prefix for Gira Giersiepen GmbH & Co. KG
> Link: https://www.gira.de/
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Where is the user?

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..2b7bf7d7b9c2 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -656,6 +656,8 @@ patternProperties:
>      description: Giantec Semiconductor, Inc.
>    "^giantplus,.*":
>      description: Giantplus Technology Co., Ltd.
> +  "^gira,.*":
> +    description: Gira Giersiepen GmbH & Co. KG
>    "^glinet,.*":
>      description: GL Intelligence, Inc.
>    "^globalscale,.*":
> --=20
> 2.47.3
>=20

--vwwu2srQgu/T3eE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairzEAAKCRB4tDGHoIJi
0hr1AP9aZt2FGffm5aovrzrK3EYDLJS745E4ba0dekxVr2XcbwEA6e0grA/0OY+H
xrsldYVLBLhFRYuruI4Mn4R0hjte8wo=
=dv6u
-----END PGP SIGNATURE-----

--vwwu2srQgu/T3eE7--
