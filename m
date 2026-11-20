Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180229;
	b=cPu+ToX0DubtsJMI9XPAhDMt6mGbgyA1Cz237XrwBuT3ERqvgDz/NrYs5BZ38f+yw6ry
	 BxNsLS01n8MlMqZFGcthD+s24TbuiN+1dd8mibLNzB2HGu0sWvI24IfeDUAZN8KfTUWs3
	 CG7loMtsoEmjEJSL9KERZ6oRwq9k0Pvobu4DQxFCuVwsxUXi+Txav3XoK3BMztlBa0V55
	 Sh7lkLIHXW05o2nmjQZ6HyfcY9VOXRSEMkRSDEJ7KUHAr6NoZMqLU32RQLtvUVyoBgB0x
	 mk9Rf3VQmCgqBgPmimHSS/Q0rif4yNFprTWM5aemx+KeIB17vdfK0Oga6Zxn9WRJHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180229;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WgsgDEptb1WfQcFPHT5FL+IZJcye/iQfq0n7PVkxj+s=;
	b=NFiWNnXSSg1Fohg5tMOnr8396QlZv/3RYJnUBptRBxOjn81fYJ83r1U0ON+I2Hybzwfg
	 MEfYs5xKWRTrJlHP89J2rNrMb/KBWuZ+QfADJeI8FoZxWCzHkzlxma3PEABRztk03vjf0
	 UNMSzrkTemIvHePKg30K0vlKRSOgTxZP39XZLRJQDvNBrUu3Mad8NOK2yPS6tv8EP64Hj
	 awznakbeUMOYVRj0LLdiJ5R1PbeX9lrXGenutausTrRYw7ynX6HX8B+4a2pJ8bSfWHxIK
	 ttnYfrJfKU+r2ZM+jN13JOxmuo2zBgtoDIffU3XJQgRhsHUwKtdGE2v/8kdgx2qOpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS82Q+yH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED0606A33A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IS82Q+yH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B283C1F0093C;
	Fri, 20 Nov 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795180229;
	bh=WgsgDEptb1WfQcFPHT5FL+IZJcye/iQfq0n7PVkxj+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IS82Q+yHpVL4dgo2mR7SPki6SOwJwnp0TF0o6DVIZGrtvxKNH7tsN+MCEpSzI1cLr
	 EXc1MQ+2xgxW9Pu6VGXNIOhr4922uCnuJImFtfY3BpAaxwFBleVbq9ezCwXzdeySOW
	 YfdeMImB96pM7QLCfZLLJ3Yvo1BQKXuX2Sn2NGLYH0HA1hnVD11RTnLq0cw+rxu+EV
	 aETQJD1j6hXnMtgSvkhZbnliZla+CqcuUc05O++lgJwD1umKWu3rLzVCD9F4nIg/uT
	 /T5R1RGvFqvNnABhQqjrbbeoQWtwReUIgCQ+I/A1mgk+M3xss0XBxqziiUIbvVWzKz
	 OKXlrdOJedBww==
Message-ID: <sashiko-outbox-225185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: cadence-torrent: add phy-mode
 constants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Robin" <benjamin.robin@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
 <20261120-phy-cadence-torrent-ng-v1-3-da2db7125cd7@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:10:28 +0000
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
- [Medium] dt-bindings: phy: cadence-torrent: cdns,phy-mode conflates
  modes and duplicates QSGMII
--

commit 2de59f32b4a9ba0a123cffdae1bfb6c23d74476c
Author: Benjamin Robin <benjamin.robin@bootlin.com>

dt-bindings: phy: cadence-torrent: add phy-mode constants

This commit adds the cdns,phy-mode property to the Cadence Torrent PHY
binding and defines the CDNS_TORRENT_MODE_* constants in
include/dt-bindings/phy/phy-cadence.h.

> diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.ya=
ml b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> index 8e845e2373acd..17a8343ac8990 100644
> --- a/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> @@ -101,6 +101,15 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 12]
> =20
> +      cdns,phy-mode:
> +        description:
> +          Specifies an optional mode of PHY for which the group of PHY l=
anes is used.
> +          Refer include/dt-bindings/phy/phy-cadence.h for the constants =
to be used.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 63
> +        default: 0
> +
>        cdns,num-lanes:
>          description:
>            Number of lanes.
> diff --git a/include/dt-bindings/phy/phy-cadence.h b/include/dt-bindings/=
phy/phy-cadence.h
> index 0671991208fcd..94945b843288c 100644
> --- a/include/dt-bindings/phy/phy-cadence.h
> +++ b/include/dt-bindings/phy/phy-cadence.h
> @@ -15,6 +15,14 @@
>  #define CDNS_TORRENT_DERIVED_REFCLK	1
>  #define CDNS_TORRENT_RECEIVED_REFCLK	2
> =20
> +#define CDNS_TORRENT_MODE_NONE		0x00
> +#define CDNS_TORRENT_MODE_USB_G1	0x01
> +#define CDNS_TORRENT_MODE_USB_IO_11V	0x02
> +#define CDNS_TORRENT_MODE_XAUI_LP	0x04
> +#define CDNS_TORRENT_MODE_SATA_LP	0x08
> +#define CDNS_TORRENT_MODE_2500_BASEX	0x10
> +#define CDNS_TORRENT_MODE_QSGMII	0x20
> +
>  /* Sierra */
>  #define CDNS_SIERRA_PLL_CMNLC		0
>  #define CDNS_SIERRA_PLL_CMNLC1		1

[Severity: Medium]
Should cdns,phy-mode be modeling all of these as a single unconstrained
0..63 bitmask?

First, CDNS_TORRENT_MODE_QSGMII duplicates PHY_TYPE_QSGMII (9 in
include/dt-bindings/phy/phy.h), which is already accepted by cdns,phy-type,
creating two ways to describe QSGMII in Device Tree.

Second, the CDNS_TORRENT_MODE_* flags pack orthogonal hardware properties
into one bitmask: an I/O supply voltage characteristic
(CDNS_TORRENT_MODE_USB_IO_11V), a USB link generation limit
(CDNS_TORRENT_MODE_USB_G1), protocol low-power settings
(CDNS_TORRENT_MODE_XAUI_LP and CDNS_TORRENT_MODE_SATA_LP), and Ethernet
interface sub-modes (CDNS_TORRENT_MODE_2500_BASEX and
CDNS_TORRENT_MODE_QSGMII).

Finally, constraining cdns,phy-mode only with minimum: 0 and maximum: 63
allows arbitrary bitwise combinations of mutually exclusive protocol flags
to pass dtbs_check without per-cdns,phy-type validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-phy-cadenc=
e-torrent-ng-v1-0-da2db7125cd7@bootlin.com?part=3D3
