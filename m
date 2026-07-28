Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650A42BE8A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241766; cv=none; b=QGzDquZNIz2F3n1ytD58UMLqbRVZqhu+9Lu+oQuFNcEpkrzwUvdax9oDMnXU9/o+MLJvrasU07NsL9xA/D4dAw77s+VZI0NmNvUQ4Zr0ayQrWb+fToLrZUZysqalJbJtDt4EIGDPNIEYPQAc11ayRzs88FbTlH96sKyykKSgiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241766; c=relaxed/simple;
	bh=w1ymp/2ZEcZMnPZehQ78Mgv1Yf2s/uEivWQyJwoe4K4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLvvqnLbILaOaRvldHiHJdXuq7ddxDf2/KFFXMj17w4hPJqHKfV3de/FfSeEUm2z0gqGva9qwvlcvjPP3mwnDX44yzKCwaL6A3FQ7BAxAP5IBIa8+8ltMqU6QjcTbHGhcejyUgSByBr/nfklKqBCVbnU/GKntG2kpzWHypJ4Vz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oilzEXyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oilzEXyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9901F000E9;
	Tue, 28 Jul 2026 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241765;
	bh=jKYh6ma6/e5zAxGizgqjVB77XvQ0VLy68nPeb0FD9LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oilzEXywOzu3a+k6LbgpSM1PyRsfZIShpvJJn/Kw2vSbjAuSyRQgs+RfaAcwCUXV4
	 139uLCGP1wz4pk8ImM1a+RJVwvIO/zwsNNXDK+BW185ROrXraRaSpJpChxRCdb5rP3
	 03uBxPF06uEvWP5cciB36jS9rhJ9EYcOHzPvddUBJtsOpwrfZARtm7Fxz6wAM0K385
	 1BzDosWaO+iNiNNae2v1L3bRjEv3yCjM/TF7n+4eBxjQDWn0ZHrxv9+zFw5LDwlHym
	 Ubp6Q6CqywqfB3ZJJPpnN9agkx7AOLsdAZbHwbJUCaSjiiBfmwabkwOwpia3U53C9b
	 SFK10z14RMMGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: display: sn65dsi83: Add output
 data-lanes property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260728122032.692482-3-wojciech.dubowik@mt.com>
References: <20260728122032.692482-1-wojciech.dubowik@mt.com>
 <20260728122032.692482-3-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:29:24 +0000
Message-Id: <20260728122924.AA9901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `data-lanes` property requires exactly 4 items, breaking sup=
port for 18-bit (3-lane) LVDS configurations.
--

--- Patch [2]: [PATCH v7 2/3] dt-bindings: display: sn65dsi83: Add output d=
ata-lanes property ---
commit 9dc2b5a1e0c25c9fb7936d93599a48a919079b3b
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

dt-bindings: display: sn65dsi83: Add output data-lanes property

Add an optional output lvds data lanes property with two allowed values
for default and reversed layout.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8ebb..0eb3913acc9d4 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -125,6 +125,21 @@ $defs:
>                lanes in microvolts.
>              maxItems: 2
> =20
> +          data-lanes:
> +            description:
> +              Array of physical LVDS data lane indexes
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 4
> +                  - const: 3
> +                  - const: 2
> +                  - const: 1

[Severity: Medium]
Will this strict 4-item constraint break validation for 18-bit (3-lane) LVDS
configurations?

In dt-schema, specifying an items list automatically implies minItems equal=
 to
the length of the list unless explicitly overridden. Without a minItems set=
ting
defined here, the schema will reject arrays shorter than 4 elements, such as
data-lanes =3D <1 2 3> or <4 3 2>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728122032.6924=
82-1-wojciech.dubowik@mt.com?part=3D2
