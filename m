Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6228642B;
	Sat,  9 May 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350289; cv=none; b=WQQrRmTGGSeq4dTv/ty8Dq7FYktZoMBm1kA30fbGdt8tGcy+2FmQ5JKjePTBNZM9u1fPFG6buo6QIJr+FBRndNOt051tbDV+yhiYDex4U0jz+jky2OxoIm0Fwh1ltxBwB8CU7E/twY8aPX+SCCqLwEe04sMi8envf+9I/o0usaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350289; c=relaxed/simple;
	bh=gDMWrWGRMA+bNB2IM5vWVlWNAEk0uIF5LKAFfCzDFp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFGc3MQRkk7P60MU8Hu66P3xWuftMbB4ZNIJONjFuuqTjpt4kzfBZyzBlT6BFpOgYVsO22cc6l1Xcc4hUGHBK7pG/e6pnR9Jk9hVmSm0FioFmEgjkLObrd5yG+2oXW4m4BF8EG0upWyyK35W5ingEvCNUc2X3r/8HhLGRPZndk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYZ2tVVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYZ2tVVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC663C2BCB2;
	Sat,  9 May 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778350289;
	bh=gDMWrWGRMA+bNB2IM5vWVlWNAEk0uIF5LKAFfCzDFp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYZ2tVVVhi89Sy3JQaOCEq6cPaESn81RV0I7Vf5nRAXOE1P9JeQn2uRD3X2KdYcSI
	 0woak/4ZoQ7l0mNS1UEqSgJfUdz4GMbjHqd+DIeZyST2nN75xBW/NFvr0RnzLYyj4S
	 fCwVDz4ly9Wr5RoJp0DEtN/UzP5HgUPqps3PvjlZQjfx1dnZ5jduieumbcBSJPEB8o
	 SaE76jjsGvOmps0ggAnCRVdJLDw998wdquxQTq18lN5YccQEDVwWpucCJxJYJSrq+I
	 2MO80EL4wxBXhV+WmQ/gdDGGcq4tnP3MeidZSqnQ34DhEnAfsUoFarvT3PU/AZURN+
	 N26Hxwtbgo21A==
Date: Sat, 9 May 2026 19:11:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: robh@kernel.org, jacobsfeder@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: Add binding for Xilinx AXI-Stream FIFO
Message-ID: <20260509-railcar-cornfield-6d850a1b8119@spud>
References: <20260509171648.46933-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKpmVidQQS2+vGT5"
Content-Disposition: inline
In-Reply-To: <20260509171648.46933-1-pramod.nexgen@gmail.com>


--sKpmVidQQS2+vGT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 01:16:46PM -0400, Pramod Maurya wrote:
> Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
> The binding documents the three supported compatible strings and all
> vendor-specific properties that the axis-fifo driver reads from the
> device tree.
>=20
> This resolves the following checkpatch.pl warnings in
> drivers/staging/axis-fifo/axis-fifo.c:
>   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-docum=
ented
>   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.2" appears un-docum=
ented
>   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.3" appears un-docum=
ented
>=20
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>

Someone else submitted this conversion (which it is, despite you not
removing the old file), and the commentary I provided for that patch
applies here too:
https://lore.kernel.org/all/20260227-unboxed-customary-7ce6eda1858c@spud/

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 92 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-=
mm-s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 000000000000..1e07db9cd456
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx AXI-Stream FIFO
> +
> +maintainers:
> +  - Jacob Feder <jacobsfeder@gmail.com>
> +
> +description:
> +  The Xilinx AXI-Stream FIFO (PG080) provides a memory-mapped interface =
to
> +  an AXI-Stream FIFO IP core. It allows a processor to transmit and rece=
ive
> +  AXI-Stream packets via simple MMIO register reads and writes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axi-fifo-mm-s-4.1
> +      - xlnx,axi-fifo-mm-s-4.2
> +      - xlnx,axi-fifo-mm-s-4.3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  xlnx,axi-str-rxd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width of the receive AXI-Stream data bus in bits. Currently only 32
> +      is supported.
> +    const: 32
> +
> +  xlnx,axi-str-txd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width of the transmit AXI-Stream data bus in bits. Currently only =
32
> +      is supported.
> +    const: 32
> +
> +  xlnx,rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth of the receive FIFO in words.
> +
> +  xlnx,tx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth of the transmit FIFO in words.
> +
> +  xlnx,use-rx-data:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Set to 1 if the receive data FIFO is enabled, 0 otherwise.
> +    enum: [0, 1]
> +
> +  xlnx,use-tx-data:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Set to 1 if the transmit data FIFO is enabled, 0 otherwise.
> +    enum: [0, 1]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - xlnx,axi-str-rxd-tdata-width
> +  - xlnx,axi-str-txd-tdata-width
> +  - xlnx,rx-fifo-depth
> +  - xlnx,tx-fifo-depth
> +  - xlnx,use-rx-data
> +  - xlnx,use-tx-data
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    axi_fifo: fifo@43c00000 {
> +        compatible =3D "xlnx,axi-fifo-mm-s-4.3";
> +        reg =3D <0x43c00000 0x10000>;
> +        interrupts =3D <0 30 4>;
> +        interrupt-parent =3D <&gic>;
> +        xlnx,axi-str-rxd-tdata-width =3D <32>;
> +        xlnx,axi-str-txd-tdata-width =3D <32>;
> +        xlnx,rx-fifo-depth =3D <0x1000>;
> +        xlnx,tx-fifo-depth =3D <0x1000>;
> +        xlnx,use-rx-data =3D <1>;
> +        xlnx,use-tx-data =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b107057ad8c..84be7c8ae257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29130,6 +29130,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
>  F:	drivers/net/ethernet/xilinx/xilinx_axienet*
> =20
> +XILINX AXI-STREAM FIFO DRIVER
> +M:	Jacob Feder <jacobsfeder@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> +F:	drivers/staging/axis-fifo/
> +
>  XILINX CAN DRIVER
>  M:	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
>  L:	linux-can@vger.kernel.org
> --=20
> 2.52.0
>=20

--sKpmVidQQS2+vGT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf94zQAKCRB4tDGHoIJi
0r7cAQDuAbGOJUXUHqt1y+o4MpDTbTZcfnp/7hGZZmMM8GSynAEAwdse4tqpFo9c
vyo8MdLp7BKJs32Lo50Z1NaMnXayHg0=
=kLlH
-----END PGP SIGNATURE-----

--sKpmVidQQS2+vGT5--
