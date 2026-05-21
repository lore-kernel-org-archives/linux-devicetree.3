Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90D23BCEE;
	Thu, 21 May 2026 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382763; cv=none; b=f+A55dRpMfEjgL7b9gOsULMGg4/8XHbFhabB+60fcW5HBsVUZ97aI8zWqso4CrAmsv7tcOZ0ehvUjAnGEeNJoScuXEPRJBCVfUk/ZljZHgCNzqI4gMdy2skbaBlwljGHqfubYtP1mdbYCv6fHU55VR37mHtG8bCnezi3kxXSfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382763; c=relaxed/simple;
	bh=2GKmZkZRT/ZSfNAcD2QRXrR4w9pDGNsPRX334Y/Rl20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ll8PsfwXKrvS4SBpDKfEquc2JfSoaRfXBrIre9SRJ8N0mxuED0UTpxGem+l3emglLAR5DwnQcJcANB+Lqikc9Z7I1oqA6DJt7hyNYsjQiykck3h2sTrZT4Q79lMQxiYYhB1yBVxgWh0MoCdsXax0UyBBYJKRcyHdsMTKE/FAUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+QqISau; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+QqISau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346391F000E9;
	Thu, 21 May 2026 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382762;
	bh=EM0tOpRC6ixc7T8RIHjmgk36nAVQgn8lpdFzEdyfyNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+QqISauQqVYxSIXaHqVaUlLJHDcMT4QNJN/9mxUtxf6sJycMYnsGFXAZU3wvySRq
	 tfVy50AWhc8dHAB6jL2KIqy2aqEQdwp94yXY3Wpp+Gc1XtFJgHuWH2Hy6I7mletKwf
	 8XN2+KM2UmpbI3mqBqctxzmNiaYUCYpQt41jrU+8QN4W3bDm9OLPpK7ic1jwvnuYCk
	 2rzqJAeJKol7jUWW4iTOVuGywYeNKo3amm643l4OxM5RSkHV874dU0jP8VDYdcl6nZ
	 SpADqiIHtY1es6/WpDQzJifaN4XoMcrq3sBLxF3jK8rn0MzJMreog3QgYveKDqZYTT
	 wPlMSXrbx49Iw==
Date: Thu, 21 May 2026 17:59:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260521-cleaver-starboard-963eec225121@spud>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zZiN10fyI46t4nxn"
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-30-ivitro@gmail.com>


--zZiN10fyI46t4nxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> The panel-lvds binding only supports single-channel panels.
> Extend it to support dual-channel LVDS panels by referencing the
> lvds-dual-ports schema when a ports container is present.
>=20
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Ah, this is part of what sashiko was talking about I guess.
nvm that email so.
Why can't your new device go into panel-simple-lvds-dual-ports?

> ---
>  .../bindings/display/panel/panel-lvds.yaml          | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 7ed0c486870b..45183a1439ce 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -82,6 +82,17 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> +
> +if:
> +  required:
> +    - ports
> +then:
> +  $ref: /schemas/display/lvds-dual-ports.yaml#
> =20
>  ...
> --=20
> 2.54.0
>=20

--zZiN10fyI46t4nxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag855AAKCRB4tDGHoIJi
0l4mAP9LCzA3DYw150Odv8EVXwZMevxuRD/apsBgRbxPRJbN6wD/ZX/TS7nMkBei
vgOWMO7ndOs70m86sVKr1GJtxamNnAQ=
=xKXx
-----END PGP SIGNATURE-----

--zZiN10fyI46t4nxn--
