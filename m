Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024670;
	b=cmvDHRkupdWixG6iAYIbkXgR/fBW/uhKpX5qnPhwJGFUI3/+u8LBha3heCNwftJixDe7
	 eDm9z4sZ5WoziljIg4ZelbHDg4rsOu0JWziLYvYxzoFxW+DZzB6dHR8TAPEhCsOzP2VX8
	 NLUa8a6CMFXt5lqOP+8Ng0vWQhFFnF5UhWLc/qDcLiuJwJdfVU4Xj7Lr99+iEi4ueRqWz
	 3/fC9U0qlIwvI/7zV0EpoqZPNAAK7dPzxUN1Xyf/zWbTuQikHuk1wf0XKD9GqCExTrbZJ
	 FKGcOUNvNL+j5B7h+9eC79xQxL8i9UUPMDnL0VqoIKTenpIU+1i7aBog8bqxD/nNmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024670;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TjvxZBNLs4IAKs2sHgik/6GkI9qP0rOwgDWT4BQftP4=;
	b=A0FGQquRV/Dh++Z7YqF92U5Wqg07ToPCuD7gKKi0bDvEESEehKqvGpO7PKmDbHnq9yTg
	 5JjO+7Ua5i932G6///oMurqJRk4OY5/H0P3UecQFvG/Jbm0fBRLAIgfT7BbLbDX1hyQqp
	 mjtwD3lpdmw6QpgLReX+gmiiz8fpQ/4rMTM0uotafCOd/YU5zadakdp6w6SgjDKJb3UU5
	 o50aNKR9lvpGQ5+g3QGB/2W8xFIk13Tv76nmrhamdkStaZ8gQgyEF1/WIKpM+z26qvgTC
	 b+waPUkTB67MF+9/If0qTI9NNtV84k29YSBJM9gMttzzaeikBLfYGtN99yKZQB4OjOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VSU/1CQp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2605606A325;
	Wed, 18 Nov 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSU/1CQp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1904B1F000C4;
	Wed, 18 Nov 2026 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024670;
	bh=TjvxZBNLs4IAKs2sHgik/6GkI9qP0rOwgDWT4BQftP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSU/1CQpVaae4WTDeso6akOnzqlOgbyXrIfoVx9VKJy6IYQAB6EqWoBKrWN8SfZip
	 K6Piuj0K4wCXWapaoz5i+Qzr4H1B5vEOPWWK+0FPWB2L33x6BpXknzV7iigX239NoJ
	 I1wHnXvNUvTPRP2lBG+I4wwuUZDTPTgZ0WKCrY3Ao3fr775dEWYGXcQKR3BXdkRBo5
	 NjMPHhBq7FLVu/3Doqj9+XgyyhaVbsjc5G9CA3eu2mZdh3MTm/BilhZkhGVU8qB1ia
	 3xtwpOt5rj2LsRIRl/EHa9MbyMnHwWi2JPic9eMnPFFSi7SC6WebX3pnwuAxB7iRhS
	 o5/D/P+KOg8wQ==
Date: Wed, 18 Nov 2026 17:57:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH vV 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to DT
 schema
Message-ID: <20261118-repackage-backlight-1bdc5955a8d2@spud>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VDEPCKkUm+2GkwGn"
Content-Disposition: inline
In-Reply-To: <20261118062526.1436893-2-mason.huo@starfivetech.com>

--VDEPCKkUm+2GkwGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 02:25:25PM +0800, Mason Huo wrote:
> Convert the starfive,kcs-bmc binding to DT schema format.

This is not a conversion since you are not deleting anything?

>=20
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  .../bindings/ipmi/starfive,kcs-bmc.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/starfive,kcs-b=
mc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml=
 b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> new file mode 100644
> index 000000000000..2cb91d321a32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/starfive,kcs-bmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive BMC KCS Devices
> +
> +maintainers:
> +  - Mason Huo <mason.huo@starfivetech.com>
> +
> +description:
> +  The StarFive BMC SoCs use Keyboard-Controller-Style (KCS) interfaces on
> +  the eSPI bus for in-band IPMI communication with their host. The KCS
> +  channels are part of a Super I/O (SIO) block and each channel occupies=
 a
> +  0x100 byte register window, starting at offset 0x200 of the SIO regist=
er
> +  space. A channel is identified by its register offset and the
> +  "starfive,sio-id" of the parent SIO node.

Where is the binding for the parent SIO node? Hard to review this
without that I think.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jhb100-kcs-bmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: KCS channel interrupt
> +      - description: eSPI bus reset de-assertion interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: kcs
> +      - const: espi_rst

No need to have "rst" since this is a reset by nature ;)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    kcs@200 {

s/kcs/ipmi/?

> +        compatible =3D "starfive,jhb100-kcs-bmc";
> +        reg =3D <0x200 0x100>;
> +        interrupts =3D <282>, <57>;
> +        interrupt-names =3D "kcs", "espi_rst";
> +    };
> --=20
> 2.50.1
>=20

--VDEPCKkUm+2GkwGn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3nGgAKCRB4tDGHoIJi
0lwoAP4oulQaLwNYWO5qXsDGleXSLonXEwJ9eMjq8RxSWj4jZQEA5YrftxDXSi0M
KWixreLZ35a+s5+Siry/wls+W7trbww=
=aFXt
-----END PGP SIGNATURE-----

--VDEPCKkUm+2GkwGn--
