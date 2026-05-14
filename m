Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71F389E07;
	Thu, 14 May 2026 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782750; cv=none; b=DNSWcrcqzF064nOqTDzPsQXILxz6cXaHjObnG0GbUOqRKjaGlPLFQot/xKUAcq07STp8si++DxvW/yW+pBWCvFikzPuVwYwgmRJWIS+42yVGttLZXkOEHuiwoI50tWE/9KeFu6FcFq2Mn6h3lgk1cFg/qrsUbrHk8sp0SIaxZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782750; c=relaxed/simple;
	bh=oskWj6FYOM+YyUjtoCyY/BW6/OJD3HZ2otLe5Zw5UH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6EkGBazTa6620ESwAouFagpLPTDkkVBA41vLmdBJTWEcqMyfZ9xEGJfshfpvG6iVB7bnODmlnSZ3fpjj0IUo3AmJD2lu/qy3NRlnLIVgfgn6mwsri5BcYUiNPPOnWf9C/6DsxAsE5ET71Lh9FQbLiRow5lzUIIkJjHoNTCyVjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d85W4tHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d85W4tHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BC0C2BCB3;
	Thu, 14 May 2026 18:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782750;
	bh=oskWj6FYOM+YyUjtoCyY/BW6/OJD3HZ2otLe5Zw5UH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d85W4tHohozL3MJLZFbUXdKr5bp29xyRxseVltsCJghOeRL4AdrCDe9u4Jfk/uBVW
	 dhnNL0kC0iv72zYcBF6fK3HmJmlu79zj1iuQE02HU+qy3+6LRheOAjgPuSi//IXgSs
	 +bAIMCs9p7U/oN4yGpxj9cGpmRB3Tcu8YHWFPEiFwFf2fnpe3hnM//YXrPdf0Sn1KU
	 37VxJ2Ywu4BAjgHJpPUIg+UtL4UOdLDa6hrD23V5RzRQ/bvjfL4snOZCy4oOuqVXxz
	 QdelQhH/roIoiCCXJDtVjq6ZjwZ4vrNmSoivyWoOo+GB8w+jcRfgjXaIGBivgTrunO
	 IoaGoiImUYKBA==
Date: Thu, 14 May 2026 19:19:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Message-ID: <20260514-jolly-confining-997882e502c7@spud>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ND+hi1ksBt5vREJc"
Content-Disposition: inline
In-Reply-To: <20260514070133.2275069-3-damon.ding@rock-chips.com>


--ND+hi1ksBt5vREJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 03:01:32PM +0800, Damon Ding wrote:
> Add data-lanes property support to the port@1 endpoint for physical
> lane mapping configuration.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/bridge/analogix,dp.yaml  | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
=2Eyaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b0924..a82f9b7776c0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> @@ -36,19 +36,35 @@ properties:
>        Hotplug detect GPIO.
>        Indicates which GPIO should be used for hotplug detection
> =20
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true

Why are you adding a new property as deprecated? Why does this duplicate
what you're adding to the port node? At the very least, your commit is
lacking an explanation.
pw-bot: changes-requested

Cheers,
Conor.

> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> =20
>      properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Input node to receive pixel data.
> +        description: Input node to receive pixel data.
> =20
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> =20
>      required:
>        - port@0
> --=20
> 2.34.1
>=20

--ND+hi1ksBt5vREJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYSFgAKCRB4tDGHoIJi
0vfuAQCYa7+xBuugVT/DlZ1pBbcXCBgN8Wyd8R33GiHPMNg7LwD+KCtqQx6uVzXy
gMRBovmIOEAUzvyOimAsHgCmjhx66wI=
=B72q
-----END PGP SIGNATURE-----

--ND+hi1ksBt5vREJc--
