Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868447;
	b=ZUZ0r0v0vMLc8snT4Nkrj/OIyVRp3TmOk2rucEy6H863ZgKgR90ObQ8SGuW4qSfqwG16
	 /J/oEe0vE3QBMevo0ACtFdoflI253GrwSxPqks6VlE6s4S8Blk2hKqG9egPLpH41p8q8N
	 oJqlGOZqC8QE1IOor9zWywg5rnILFtyR2zD5cECIw5uvPcQnVNmYp53YpV2va+48y/z8c
	 Nm/PhZGcezWVHV3j6I8D1+mPneo0R/EEM+8YbPMDM5kfKRX3009BENMJxyx9o2R8dGE8s
	 L6i0YfnAZWBwjmGd5kvQu4XgPmUcleK8eePLSqIcXxWUjEsJE7O+ml3g7d6zBzHJuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868447;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6Q9bUi3mA2wjRJltW7VApHrKjyQlIrD0FwBHFWxwSuc=;
	b=kXfw6ozaQDD06lueWUstHTq7wnQzu+2KqV6h8ueJ6dSmjyWbeAXxMEOVCvYPS6DSMxKH
	 2xCw/okJNDwpMGg3z+VAFbgpnkwHXGm5qNiKuy1XvGdf8Sj92IZgKiRkgWa5L/kYyGwcQ
	 XT/SKZx9m1bEEPVSwbFxL24UrDg0UaSil8uw0INbO1jeDLZf0ASzFeO3its547/WMPk8l
	 AaJ+LcYiiDj81qrJrKOCVDlwqHbDKCdVb5x+jSP/cqSZIxtPttYNwJCZ2k6Fh97fO5cjo
	 OZUOV946i+QOMjRm5CZwC0l22rQCdN/zZryAVF4KdnciZSQwsvvDnoC3BjGL0jwxOjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WmivuB/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D133606A896
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmivuB/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2405F1F000C4;
	Mon, 16 Nov 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794868447;
	bh=6Q9bUi3mA2wjRJltW7VApHrKjyQlIrD0FwBHFWxwSuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WmivuB/TUcQ19wqTlyAv8MSXiJTiD/sjvVXmrN7p63x0Jl8i9E6riJBDz0H3QyahU
	 szcSTBq3x4yX9+en9J/SNm3kp71IN6+3Y2fLIQQueHB2VTH5Ac+l35rpvJd4/YNgcQ
	 pmOcaW19RR1YES77ZbmN98yzvv8w1xMumRZSWSUezjEYMuT5niRbtJPj9BZr0EUINy
	 DwDDUYyy3726pxQW8rn/OjvEtlb0BbcCEd66OvRyPgb9xK6SeGrxgUEdMmBsEHvy3t
	 4WLgk2i0h4FzDIBW2HUvpW7pwFLcda0vpK5VpbP8ZkIsVOdfTHltzLCp+IHBm/2+Xa
	 yOAb+9Qcns9Xg==
Message-ID: <sashiko-outbox-217793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: dsa: lantiq,gswip:
 add reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-1-4ecd18c922e2@telaak.dev>
References: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
 <20261115-mxl-gsw1xx-reset-v4-1-4ecd18c922e2@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:34:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: net: dsa: lantiq,gswip: split GSW1xx into separate
  schema
--

commit 01a5dca493e3ff68856f4f4d443a02d28d47883f
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: net: dsa: lantiq,gswip: add reset-gpios

This commit adds the reset-gpios property for standalone GSW1xx switches and
notes its effect on the default RGMII slew-rate configuration.

> diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml =
b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> index 49af5573e452d..89f78a1bc113d 100644
> --- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> @@ -40,6 +40,11 @@ properties:
>        - const: mdio
>        - const: mii
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the hardware reset input of a standalone switch.
> +
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>      unevaluatedProperties: false

[ ... ]

> @@ -173,6 +180,7 @@ allOf:
>          mdio:
>            required:
>              - compatible
> +        reset-gpios: false
>      else:
>        properties:
>          reg:

[Severity: Low]
This isn't a bug, but would it make sense to split the standalone MDIO-based
GSW1xx switches into a separate binding schema instead of adding more
per-compatible conditionals here?

The SoC-integrated MMIO GSWIP variants and the standalone MDIO GSW1xx switc=
hes
sit on different buses and already require overriding or disallowing nearly
every top-level property outside compatible and ports (reg, reg-names, mdio,
gphy-fw, and now reset-gpios) in the allOf if-then-else block, alongside the
MaxLinear-specific port properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-mxl-gsw1xx=
-reset-v4-0-4ecd18c922e2@telaak.dev?part=3D1
