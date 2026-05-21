Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8333D515;
	Thu, 21 May 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392747; cv=none; b=A95g3ojRnIcM/UsV1mqZ1rM329t+y54w+E3UCrR0mdD6md8bgWKdFqHW8F6P2V8UG28u/QK4AM/iKd5cpaA0g8aJdWKov39eDWNHjUZpvGVvZcQ/Mr9Izw1czrsPv+o3fY0UgdH4MBEl5ClBIRJ+5TG6l0Ak4vE50wvY7tPZMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392747; c=relaxed/simple;
	bh=xWTz+PK6cPpapPFfoPGZzVnX0/URVe8BYJSEBkZG94A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrq/NqcdWQm4LSbDHDDDF4gfasJ32O9m3wEdKRxak+zWj9LzXyGJgRfr8A2FO0ib/hNnO33kK2SCdP7m1HsWBQBJ5sevE/0ygUuEg57eF1CNJJQWy2gltqjyVqaRvjdS7GwYQP9MVCad4y/dk7E5wY9NPKY0INzulFIJcSir5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZadTR6KT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZadTR6KT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96701F000E9;
	Thu, 21 May 2026 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779392745;
	bh=F4b+yc8CfkyNhVW/62+W5IoH+J2djrTARSYfh0EO7aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZadTR6KTj+xwIujS44DBtHbwMfGzqSxR0Io05qH5cx8qNO7B+sQy0PS62h69HAQkN
	 tmNbQmqhYtTj5DODHXjbUnoHdNCRLU+4gPnlSUsOLOzA9CPzW4zv2HEEQ0ewEltYyH
	 Q8fQnHIhImtPWz4LasXSSj7smMPmPTGTMiZR5PNOjK7VRc3pE8WVH6z05HBder677o
	 ribyldxYgnKr5AsnqYasbxWHfe54WbPqPOzTFVudcHUYo+qrQEf7HLqqdIT4m+H5o8
	 jbFghSQpia1HlZvajZe2TWOqpT2AcItf3GepiGinK0zRNm7Zlb9XbaRQoqGiMWk+sW
	 w4GF4ADgOQq9g==
Date: Thu, 21 May 2026 20:45:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <20260521-hemstitch-vagabond-9cd0e083c33a@spud>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
 <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4PKgTlw7QdEjQYY"
Content-Disposition: inline
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>


--s4PKgTlw7QdEjQYY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 10:46:06PM +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
>=20
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++=
++++++
>  1 file changed, 125 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r6=
3455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r6345=
5.yaml
> new file mode 100644
> index 0000000000000..a94b355ed9557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.ya=
ml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
> +
> +maintainers:
> +  - Jun Nie <jun.nie@linaro.org>
> +
> +description:
> +  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, us=
ed in
> +  pair in Headset devices. The Virtual Reality Display complex is compos=
ed of
> +  two strictly identical display panels, each driven by its own DSI inte=
rface
> +  but forms a single virtual display for the human eye perception and th=
us
> +  requires a strict synchronization of the two display panel content upd=
ate.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sharp,ls026b3sa06
> +        - boe,vs026c4m-n52-6000
> +      - const: synaptics,r63455
> +
> +  reset-gpios:
> +    maxItems: 2
> +    description: 2 reset pins for 2 physical panels
> +
> +  left-pos-supply:
> +    description: Positive 5.7V supply for left panel
> +
> +  right-pos-supply:
> +    description: Positive 5.7V supply for right panel
> +
> +  left-neg-supply:
> +    description: Negative 5.7V supply for left panel
> +
> +  right-neg-supply:
> +    description: Negative 5.7V supply for right panel
> +
> +  left-backlight-supply:
> +    description: Backlight 21V supply for left panel
> +
> +  right-backlight-supply:
> +    description: Backlight 21V supply for right panel
> +
> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports: $ref: /schemas/graph.yaml#/properties/ports

Missing a newline in this, but also probably missing going into more
detail about the ports themselves.

Sashiko complaints look valid.
pw-bot: changes-requested

Thanks,
Conor.

> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - left-pos-supply
> +  - left-neg-supply
> +  - right-pos-supply
> +  - right-neg-supply
> +  - left-backlight-supply
> +  - right-backlight-supply
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    &mdss_dsi0 {
> +        vdda-supply =3D <&vreg_l3i_1p2>;
> +        status =3D "okay";
> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg =3D <0>;
> +
> +            reset-gpios =3D <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
> +                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +
> +            left-pos-supply =3D <&vpos_left>;
> +            left-neg-supply =3D <&vneg_left>;
> +            right-pos-supply =3D <&vpos_right>;
> +            right-neg-supply =3D <&vneg_right>;
> +            left-backlight-supply =3D <&backlight_left>;
> +            right-backlight-supply =3D <&backlight_right>;
> +
> +            vdda-supply =3D <&vreg_l12b_1p8>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                port@0 {
> +                    reg =3D <0>;
> +                    panel0_in: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    panel1_in: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi1_out>;
> +                    };
> +                };
> +            };
> +    };
> +
> +    &mdss_dsi0_out {
> +            remote-endpoint =3D <&panel0_in>;
> +            data-lanes =3D <0 1 2>;
> +    };
> +
> +    &mdss_dsi1_out {
> +            remote-endpoint =3D <&panel1_in>;
> +            data-lanes =3D <0 1 2>;
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--s4PKgTlw7QdEjQYY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9g4wAKCRB4tDGHoIJi
0n2xAP9rz9F+fqSMjeMy2FG5Z479hxwQhcAaHPBineV7J8AHrgEAwWHd452w1Jl3
Sf/Y+I3E7f/gmrbIO6nWrHwkBt0vQwE=
=oATP
-----END PGP SIGNATURE-----

--s4PKgTlw7QdEjQYY--
