Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8931716A
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005723; cv=none; b=SuHQNA9zDDkeTeVKOVCKyM0CV4De3v5sAjo1E+oTDfX5yEbPCmTZ9UWFHEZNut3eqtG02Bd2jC5TJtBCUjy9nfMdHyA2ue3KlMIIDXcDBxpl9TCA/qpjzJB4rQFg6mGfE7O5ougStO9ZVbQtME84fugXuFK8fJIHwO1tYMd935U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005723; c=relaxed/simple;
	bh=tt+48wedr7uUJxi63ZaOcZr/xpn8MgOpgeuldGnZdbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MIrRyCyA+qHi24ZSFuKo19j7AQT7Gs42OsvsK3qJIQaW4X+Y4c7OaihZBkP+sxdWuwk9x815lpeb1oit3SHtkYxMciz5uzhS4ZOp55JF+Sdh5QjPr0zLzACyyUNT90pLy5mvltyxHv6a8yttRborI0HJyi1PaqTB6YcKt/IOXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aq2nOTHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aq2nOTHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0731F000E9;
	Thu, 28 May 2026 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005722;
	bh=RSyrMxOuZzn0Yei6VIjGa3+rxaRnR2C36IE2TxzV34k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aq2nOTHNqA1Q08ZHux217p30f+dfP3P7b0i4tmjPFHL2EVQUX5RPO5VYo/g4Nt+0V
	 uWCidUL+dzQlu1OTrukUWS5iTfQDaln4nIzcU2fHQFIPcIBjnX2/VgrL2gOwb8Q53f
	 1+vMIdHYroOWQWKymm7HHuJe7I/0X+OZcX4N1ut7Ak0dE6tAUGr1mRDiz87VjLM/gU
	 I83bOLKnrlNYX15GHBERATOCwnKczym7wUOgP3SSxfRJEb8XX+vjGt9LmOrzDxl3w0
	 kjaqDWqW3bphs5OLMxvM5zfOm9WJSn1/k7ODNMQbP6Iy/pc0NWPXpN4EncOUesrysN
	 l1PnOep5g/WHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 22:02:01 +0000
Message-Id: <20260528220201.DC0731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The file pattern added to the MAINTAINERS file does not match the a=
ctual path of the newly added device tree binding.
- [Low] The devicetree example uses a non-standard generic node name `clk` =
instead of `clock-controller`.
--

commit aa0b3a597f8880d6044f62a15d10b6b5492211b1
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 top clock and reset bindings.

This commit introduces device tree bindings for the ZTE zx297520v3 top clock
and reset controllers, modeling them as a single device with two memory
regions. It also adds a related header file for clock and reset definitions
and updates the MAINTAINERS file.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcl=
k.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
> new file mode 100644
> index 0000000000000..968820bde7558
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    osc26m: osc26m {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <26000000>;
> +      #clock-cells =3D <0>;
> +    };
> +
> +    osc32k: osc32k {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <32768>;
> +      #clock-cells =3D <0>;
> +    };
> +
> +    topclk: clk@13b000 {

[Severity: Low]
Does this generic node name violate the devicetree specification? The stand=
ard=20
naming convention for clock providers expects clock-controller instead of c=
lk,
which might trigger warnings during a make dt_binding_check run.

> +        compatible =3D "zte,zx297520v3-topclk";
> +        reg =3D <0x0013b000 0x400>,
> +              <0x01306000 0x400>;
> +        reg-names =3D "top", "matrix";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +    };

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4ae1e77c2fd78..ae51d590d4403 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3864,8 +3864,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated=
 for non-subscribers)
>  S:	Odd fixes
>  F:	Documentation/arch/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/zte,zx297520v3-*

[Severity: Low]
Is the path in this pattern correct? The new device tree binding file is cr=
eated
at Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml, so=20
missing the bindings/clock/ directory components means this wildcard won't =
match=20
the new file.

>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-zx29clk-v3=
-0-c7fe54ea388f@gmail.com?part=3D1
