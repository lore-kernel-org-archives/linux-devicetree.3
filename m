Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06044BCB8;
	Tue, 16 Jun 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626319; cv=none; b=hlSct7KEXmlgFx8QQsXBM7uC3RF81Xz3OWP4cwf752CH5w3UEwBKxYBR1YF2V+SwkTAh8kaUEKw908FP9yMS4XnIZWWHV92wIGaQ5iGiWP3eTV9vchefd/ZIrmJxy7Gq8HhrsXyp+PodY6TJEV8sOzYNvT96bo3uCjnxyTVt0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626319; c=relaxed/simple;
	bh=rmMv1iHhtcgN7++fT1dCO3ImX3iIUvCrsRmP71XCZIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7lOCwCGLP9XKMePl5wfSdyRtg5U5JEbs2YUYIXRH0RKtzksznfjeTT4ZCoIGnVCeZMaWWIyO+umGkOYbgy3ZsVihHGmqPPbx1sAxQoq9uyoJ1Zp848x4ZOv3zUdSP+vAG857zZOMiWCa0IrQXaKYZbCtUzLREey7cTTjD6V3ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pai1nhmK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pai1nhmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA57E1F00A3A;
	Tue, 16 Jun 2026 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781626318;
	bh=tC7eCjFmiAaB+Yw47PNhNFXWEvRqH1fZbH4443SWHf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pai1nhmKDGIy4kmzXl4zaTS6g4p6U25tv6GJD2BOTtixchor6SUuMZlLr17DpALpd
	 xbuV+SQsjUvVm4uEJ/Gr5CgPvFmcRxgYV/b+A1e2gMFEiKokTMH7yQ+DniltvZsYyB
	 92P5WQ/AM16A73QeS0SpMIrYLNieVqlgFO+L5Qh1TExz9UOdI04KmFRDmc9T4fiV67
	 xk3JH3kosDCiT0LqNpiyBec37P2UGN8fcU9VUUh0BE90F4L0B7RS03D2ehY/jVkQoL
	 8drYzkyX9I68tiF3IomJRWc9hli5RMsarHauTXleMu0uCWnH4ZrHdSNa78DuOzfEIJ
	 E4n0xtYVyU9qw==
Date: Tue, 16 Jun 2026 17:11:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	javierm@redhat.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	airlied@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Message-ID: <20260616-nautical-obstinate-a92fd80ef483@spud>
References: <20260615175620.88828-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q0DLjkqvc1yG2XI8"
Content-Disposition: inline
In-Reply-To: <20260615175620.88828-1-amit.barzilai22@gmail.com>


--q0DLjkqvc1yG2XI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 08:56:20PM +0300, Amit Barzilai wrote:
> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---
> Changes since v1:
> - Drop solomon,width / solomon,height: both are deducible from the
>   compatible and are already declared (as optional) by the referenced
>   solomon,ssd-common.yaml, so a local override is unnecessary.
> - Drop the rotation property: it has no consumer (rotation is being remov=
ed from the driver).
> - Use dt-bindings/gpio/gpio.h flag defines in the example
>   (reset-gpios active-low, dc-gpios active-high).

The user for this appears to be in staging. As far as I understand, the
policy is that we only add bindings for staging things when they move
out of staging.
Sure, this is straightforward but why should an exception be made here?
Are you working on moving this out of staging?

Cheers,
Conor.

>=20
>  .../bindings/display/solomon,ssd1351.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
1351.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 000000000000..39622d74a41d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD1351 OLED Display Controller
> +
> +maintainers:
> +  - Amit Barzilai <amit.barzilai22@gmail.com>
> +
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1351
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        oled@0 {
> +            compatible =3D "solomon,ssd1351";
> +            reg =3D <0x0>;
> +            reset-gpios =3D <&gpio2 7 GPIO_ACTIVE_LOW>;
> +            dc-gpios =3D <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +            spi-max-frequency =3D <10000000>;
> +        };
> +    };
> --=20
> 2.54.0
>=20

--q0DLjkqvc1yG2XI8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajF1yQAKCRB4tDGHoIJi
0lCIAP9UFUoRqD46XYNz8YITcZ5e84UlpJDO4hAPr4aAeGUVJAEA7NxLCOg3hazE
JdfRopI+8N4g19X02vq5FB/XIqwXSgA=
=RkGp
-----END PGP SIGNATURE-----

--q0DLjkqvc1yG2XI8--
