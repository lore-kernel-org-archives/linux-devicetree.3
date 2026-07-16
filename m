Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B3435AB4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222123; cv=none; b=UiW6grFv6y/0RQSePnABwEM3LOe10y3/k5RuTytSF+ZbX0aG7Vcek8glMTWmr87DA7ozOrIb99pRvyfCkBIcQLMTLKUoTKRZ7Jrz+Ny7KMJ7psHh24MOwHutlfKfRBf6XClusy3xhyw0obQX2E+jjji2Xlp6xZxpbz/eTQ/rzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222123; c=relaxed/simple;
	bh=I6x0qHKw03O4fYsK5Q0gJ2HTAu9OXoIiSfZOStEA+Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPZ8CQwdo2gK6ZhFw0dxvTTYcVDg4e5Yiew4XdmvvAye1xr1j6arfmyoCPX/E9VtwMOChgoSo3HlOrLC05AYwStjy/DDj/2S6+dpuW9BE+oXxPrgsCDVmUQQHZ+5jzTKSf5+clEj6bz+frg7tLc/S4oV1Bb4a4TtC5UTzs/MCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec4c8n0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec4c8n0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F5C1F00A3D;
	Thu, 16 Jul 2026 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222122;
	bh=PsPCuPzfA0/GmVqbYm6ZtWA+Bb6mhqaV7zghns37cjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ec4c8n0tvsQ+StTt++L1TEbDeUohy0NX2EI2Kt66tm4dGbIMHlR0DCIIv3YlV8c13
	 caEMH7YZD58KLEPONm56PpmnQ94/+4Kps9iZbF5qPw0ej1IhBdEtmGM6wJb7YiDIvw
	 bS/FSG7ZGaeLSHQdMtlLR92VuCav35L38Tg7iViUARK9nW3WICCt7vOKWbjvN5xcyW
	 huQbBI8epwaaIormmxXNCjwCKLxDVkelMwVgdPWyHiP1DJE4NmWqKgHle1nYFe6Gpb
	 bs70rvqoYLSe7iy7/U4NJuoyVFXsXBDoQqq/9zQ3HPf14qtWEJsqNeo8o3iaWaLsmf
	 7i7K0z94rsZNQ==
Date: Thu, 16 Jul 2026 18:15:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260716-decidable-tingle-175efaf36540@spud>
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-2-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbV4hcmtpxM17zNB"
Content-Disposition: inline
In-Reply-To: <20260714101146.200416-2-kieweg.leander@gmail.com>

--cbV4hcmtpxM17zNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Jul 14, 2026 at 12:11:43PM +0200, Leander Kieweg wrote:
> Add Device Tree binding documentation for GlandaGPU, a custom
> FPGA-based 2D display controller.
>=20
> Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
> ---
>  .../bindings/display/glanda,gpu.yaml          | 49 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/glanda,gpu.yaml b/=
Documentation/devicetree/bindings/display/glanda,gpu.yaml
> new file mode 100644
> index 000000000..40304e773
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/glanda,gpu.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/glanda,gpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GlandaGPU 2D Hardware Accelerated Display Controller
> +
> +maintainers:
> +  - Leander Kieweg <kieweg.leander@gmail.com>
> +
> +description: |
> +  GlandaGPU is a custom FPGA soft-IP core providing a simple

Sadly googling this device only shows up Phoronix and other copy-paste
reporting sites. I think it'd probably be good to include a link to your
project either here or in the commit message.

> +  2D hardware-accelerated drawing engine (clear/rect/line) with a
> +  VGA-compatible display output. The register window covers a
> +  combined VRAM + MMIO region, with MMIO registers at a fixed
> +  offset within it.
> +
> +properties:
> +  compatible:
> +    const: glanda,gpu-1.0
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Combined VRAM + MMIO register window (VRAM at offset 0,
> +      MMIO registers at offset 0x00200000 within this range).
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: Bus and pixel clock provided to the FPGA IP.

This clock sounds like it is actually required? Doubt the device works
without it!
pw-bot: changes-requested

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpu@c0000000 {
> +        compatible =3D "glanda,gpu-1.0";
> +        reg =3D <0xc0000000 0x1000000>;
> +        interrupts =3D <0 43 4>;

Usually I would say do not include things if you don't have to, but I
would much rather you did if the alternative is an interrupts property
like this that doesn't resemble anything used in devicetrees.

> +        clocks =3D <&osc1>;
> +    };
> \ No newline at end of file
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index b1af9deac..b8b7a5401 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -666,6 +666,8 @@ patternProperties:
>      description: Giantplus Technology Co., Ltd.
>    "^gira,.*":
>      description: Gira Giersiepen GmbH & Co. KG
> +  "^glanda,.*":
> +    description: GlandaGPU
>    "^glinet,.*":
>      description: GL Intelligence, Inc.
>    "^globalscale,.*":
> --=20
> 2.43.0
>=20

--cbV4hcmtpxM17zNB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalkRpQAKCRB4tDGHoIJi
0hjuAQCx5CZauAKjA9Fmp9BQ3OqGeSR3oSHpAphtfKtr9lFuMAD/WgcLIUUZUcYE
FD0968ML3qNI8JkkOL0edXx6Ff2+NwU=
=Cw7h
-----END PGP SIGNATURE-----

--cbV4hcmtpxM17zNB--
