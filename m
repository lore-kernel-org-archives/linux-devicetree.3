Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90F1C5F39
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676803; cv=none; b=VSAl15/pcIDm0tD5gTKDyKvs6d2Ka9m8KXn3kNJ0VRnHnvtQgC5R1YZjgpDOFSqruwNus9zdkKHqx2Qd4RwVgaN599qnI7aLjauWLRX6VWS6zihCilR0kxx1kSPOB0APn82mrcHd7fUGXg45xWbATPccpPMDh13Xbq7FJRoRUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676803; c=relaxed/simple;
	bh=9VikqXsU08fbyphHi0rkr7e2f6VvDu0uRkmBtU84b2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSQkElQ91lq28Bn9dmZIiOb20b487eymLMQoudaD4eUQwGHhNTsd3BPiXwmdR0nYmxnHco7reaNvVIi9MMgttKCPCSL9QwwOa732EB0rIW0h3akUcEajX+sPcIT/74iU6tyYHtljn+j+WFPzSeOBjPvl5+98C4vMxPDe2D5QGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgOQ5SJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgOQ5SJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079C31F00893;
	Fri,  5 Jun 2026 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780676801;
	bh=TDkJX3CC6ghJvaftv3jQASO7eqNjjXTkyuVDTdp/ScI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgOQ5SJQ1QgrMS3Hn9s8P0qgFtx+m1AbuDD1+R06pmKcILq35OnCyplA4sBULMUtQ
	 fP6As5l98FZRyNwm9m+zQ5VyNIyC1G9OPHU9cyeso3lfxd0jlHEBZrfCghgX62jT/3
	 7arajdfT431RhkQqkNuQ4pXLybjlU2xuCk1HsPzR7xRQY5KbErkqGlLgSYEw2i4yZG
	 /ep3neWwwfCIgVbVh7CJoufJjA36qkGbIMksZSFiC0eLamSqRXvRgR/y/z9/kZ7Nwa
	 2nyO1u8MuiLikyQI/JJFP8mHdVYVDpqt6nm0iy3ZusAgYGndvdpx3RMb2/IkLwayXX
	 UjtO+xqJK7Yfg==
Date: Fri, 5 Jun 2026 17:26:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V5 3/6] dt-bindings: display: panel: Add Anbernic TD4310
 panel
Message-ID: <20260605-carless-mouth-92684e2ee74e@spud>
References: <20260604220802.119107-1-macroalpha82@gmail.com>
 <20260604220802.119107-4-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="puxlIvdh/rKnMLXj"
Content-Disposition: inline
In-Reply-To: <20260604220802.119107-4-macroalpha82@gmail.com>


--puxlIvdh/rKnMLXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 05:07:58PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
> on the TD4310 controller IC. It measures approximately 5.5 inches
> diagonally and is 1080x1920 in resolution.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/anbernic,td4310.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/anber=
nic,td4310.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4=
310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.=
yaml
> new file mode 100644
> index 000000000000..6f7f92b9c860
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/anbernic,td4310.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Anbernic TD4310 Based Panels
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +description:
> +  Anbernic TD4310 Based Panels, such as the RG-Vita-Pro panel
> +  (a 1080x1920 5.5 inch panel).
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - anbernic,panel-vita-pro
> +      - const: anbernic,td4310
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Panel power supply
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vdd-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "anbernic,panel-vita-pro", "anbernic,td4310";
> +            reg =3D <0>;
> +            backlight =3D <&backlight>;
> +            enable-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&gpio0 13 GPIO_ACTIVE_LOW>;
> +            rotation =3D <270>;
> +            vdd-supply =3D <&vdd_lcd>;
> +
> +            port {
> +                panel_in: endpoint {

Drop the label if you respin.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +                    remote-endpoint =3D <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --=20
> 2.43.0
>=20

--puxlIvdh/rKnMLXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiL4uwAKCRB4tDGHoIJi
0irKAP9L+hIB/TYnCd82iGYGbBpXm8onM2v9d1tkIAL4ndCnAQEAiXWKVveu8dZx
zselpGMyAyU19cu2tFx1NY1q2/1BdAs=
=wQ7A
-----END PGP SIGNATURE-----

--puxlIvdh/rKnMLXj--
