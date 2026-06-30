Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF82A3C1973;
	Tue, 30 Jun 2026 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839120; cv=none; b=Uo0jkJr+TnimTRYBuzw7brFvCi7t1sJXLbihwURMUBFQZacn3KPjgO1sb/x2UIBcYYmY7tfxT75kRCTqGSuEGysC7O074pTXiZHO/2j5129YmWao9I91hCcaC/VowsYHd4sj7YEGB460vvMOfwmcGjR1ZcHrUCdWZRnG8rw5Sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839120; c=relaxed/simple;
	bh=Oy+BfZGdEP+9m1zXT7vncVJp5kLOPzNnlDD5ehcqJ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nu6qGtxyrSBGHGMpbJokSvTR7fARGZqqquvdwyvrf1sgNbF5Zyd3SR/RrxgYIzK94m7MhiIdNDgWyitIxCiUva3tRPQsyeUpRamBRnQ9UV9rAggr/Nseai59BwBNHOGUTFodIwuHHxgYq6wxflUPsqf/Eha7rMGCDf3yfJgS+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWhGdiLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWhGdiLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A30F1F000E9;
	Tue, 30 Jun 2026 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839119;
	bh=CKdtDTaecC+HUonkVnwkzk/WVKXHYxo/bin0q3mo6cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QWhGdiLk9DzqF3DaLu1vpSJ7yQJrFmB8W/+Sa1OCPTqCdKtpqn0ssYGwuSeOduNO2
	 oLzCLIqwjsR9Bi9LLwl/KQz2AXp3sh9zCP8Ve6JfO9JKcOQiN7bWYsOHjzlYIaHR18
	 uKLhH1ujQ6yREHvpEPuN2e/+2FwBKhH1C/O6BK/13sZks5Ngfkgi9r/gomicPxtDVo
	 GDGehdTp1d5BZlALab2CBT1er8cyxoYYWKR/4A7R76mOYJ3OoYzfSr1/n7yPUTifLw
	 puKZ+uQQJSP07LMxeUI/QNmdRrgE7Ng494kFEpgw3hKJatwdbB8VLhRbVw4VZUWtyX
	 Z2epO6g5EwFyg==
Date: Tue, 30 Jun 2026 18:05:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, nm@ti.com,
	robh@kernel.org, sjakhade@cadence.com, kristo@kernel.org,
	vigneshr@ti.com, vkoul@kernel.org, yamonkar@cadence.com
Subject: Re: [PATCH v3 net-next 2/2] dt-bindings: phy: cadence-torrent:
 Update property values to support 3 clocks
Message-ID: <20260630-chowder-unpleased-162d2c891ead@spud>
References: <20260630134324.61085-1-g-praveen@ti.com>
 <20260630134324.61085-3-g-praveen@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="claZfrcYDscXuJ3R"
Content-Disposition: inline
In-Reply-To: <20260630134324.61085-3-g-praveen@ti.com>

--claZfrcYDscXuJ3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 07:13:24PM +0530, Gokul Praveen wrote:
> Update maxItems value of "clocks" property to 3 as description of
> this parameter already indicates 3 clocks(refclk,pll1_refclk(optional)
> and phy_en_refclk(optional))
>=20
> Update the "clock-names" property as well with the 3 clocks.
>=20
> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---
>  .../devicetree/bindings/phy/phy-cadence-torrent.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.ya=
ml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index 9af39b33646a..54fe78da297a 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -34,7 +34,7 @@ properties:
> =20
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      description:
>        PHY input reference clocks - refclk (for PLL0) & pll1_refclk (for =
PLL1).
>        pll1_refclk is optional and used for multi-protocol configurations=
 requiring
> @@ -47,7 +47,7 @@ properties:
>      minItems: 1
>      items:
>        - const: refclk
> -      - enum: [ pll1_refclk, phy_en_refclk ]
> +      - enum: [refclk, pll1_refclk, phy_en_refclk ]

This does not do what you want it to do, I would think, since it means
you can only have two clock names.

Additionally, please restrict 3 clocks to only whatever new TI device
actually has 3 clocks.

pw-bot: changes-requested

Thanks,
Conor.

> =20
>    reg:
>      minItems: 1
> --=20
> 2.34.1
>=20

--claZfrcYDscXuJ3R
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP3SgAKCRB4tDGHoIJi
0mY1AQDA1BtEt2XQX/AY8otmFWna4lcOAOS4LCkehrqayL71ygEArP3hoqxqdl54
tnTH5YezNgF9fglzhsf8H1wpoHH5nwI=
=Og3T
-----END PGP SIGNATURE-----

--claZfrcYDscXuJ3R--
