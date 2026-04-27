Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C001340DB9;
	Mon, 27 Apr 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316685; cv=none; b=kc/0EL4X77cEf+yUgFwb3pSmXVzWN5wBzX3m1cuY6FdUe3P+IMHupF/SkEd82Hae3fTfbVZRFQk6gWByLZFIeQRQFKwfrLSnA2lR6PcjoQPAHxHJhKqjgLSPJhi1vDX+McCLHLm0ov0kk6OyCDPpP17gDjPQ562BO5liJHx66JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316685; c=relaxed/simple;
	bh=OJrbnfGJEPIUh+ucwhHYqPmjXNvaqvhxFElCFUXGCzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REKDu2Vx1FLNWJkbf/oqdqv/Q1tHlvT/ywA+H1roNMRLJLhxTzLkmW8O21CvSb6zRSuKoNbOqV9hxmTs8yzNBkXh1OjWBDgkyF1UNyP9UOAhXCnuc121z9rGepMDiaWcXBNawEDWgBqgBFiajOHN3KlA6+FKD8K1rr2eRZBisGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRAddl/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRAddl/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5789C19425;
	Mon, 27 Apr 2026 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316684;
	bh=OJrbnfGJEPIUh+ucwhHYqPmjXNvaqvhxFElCFUXGCzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRAddl/q0eGUui/2hM0nNNGtvGYL2HdDs5HgB52G2rrXG7AyM6GsjFbFOBlEx0qpz
	 X17Miiz9EjEYBvppwAyEeHfOrMxEs3Q69My2we2EUUCu/r83kb0BLcUIPkAopar91a
	 Dttqqa7rPzf38vTceviLIeG1QuBu2MtEpfYImPfUQR7Qkrl6/JqY+/5ZpAkU0dS+uN
	 pMASmA/I6zFOnGB/WZTDUuanxvQQIQ3kjkZ+jM/5l2yycqLRlHj9wEuVa3Ui3LE3tF
	 oKIHVNuNnKk6jx9ASUcyqsk2ftjz2B+7omrBvO/NJZwmhh5CqtCM3taiOpHD4eIazA
	 QkpJGGxYuiLDA==
Date: Mon, 27 Apr 2026 20:04:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios
 property
Message-ID: <20260427-smartly-sullen-509e3d5e1967@spud>
References: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M8XCgCKVrwRDqKCi"
Content-Disposition: inline
In-Reply-To: <20260427115443.3224840-1-eagle.alexander923@gmail.com>


--M8XCgCKVrwRDqKCi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 02:54:43PM +0300, Alexander Shiyan wrote:
> The vsel-gpios property is currently documented in the binding but
> is not used by the driver. The FAN53555 family of regulators supports
> two voltage selector registers (VSEL0/VSEL1), and the selection between
> them is intended to be controlled by an external hardware pin (VSEL).
> However, the driver does not support dynamic toggling of this pin via
> a GPIO, it only uses the fcs,suspend-voltage-selector property to
> statically assign which register is used for runtime voltage and which
> for suspend voltage.
> Remove the vsel-gpios property from the binding to prevent incorrect DT
> usage and to reflect the actual hardware description supported by the
> driver.

=46rom the wording/justification here, I disagree with this patch. The
binding should document what the hardware can do, not what the driver
can.

Maybe instead you should make fcs,suspend-voltage-selector mutually
exclusive with vsel-gpios?


Cheers,
Conor.
pw-bot: changes-requested
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../devicetree/bindings/regulator/fcs,fan53555.yaml          | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yam=
l b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> index 69bae90fc4b2..7f3b74ccf8db 100644
> --- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> +++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> @@ -43,11 +43,6 @@ properties:
>    vin-supply:
>      description: Supply for the vin pin
> =20
> -  vsel-gpios:
> -    description: Voltage Select. When this pin is LOW, VOUT is set by the
> -      VSEL0 register. When this pin is HIGH, VOUT is set by the VSEL1 re=
gister.
> -    maxItems: 1
> -
>  required:
>    - compatible
>    - reg
> --=20
> 2.52.0
>=20

--M8XCgCKVrwRDqKCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+zSAAKCRB4tDGHoIJi
0qjQAQCKcZkqhhMHPtv/OnIJa7IQNsuzLw9gRJ5aSd7PUhkzxQD/UVpYUHlPj3BI
a/MHz+sAAAInKB9dxy4w7AYYOjTtkQ0=
=DMlS
-----END PGP SIGNATURE-----

--M8XCgCKVrwRDqKCi--
