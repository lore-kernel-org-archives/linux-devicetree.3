Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F4F4A7CB1
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637713; cv=none; b=iFHiErBoERk5M0LCmalNagmruHd8Jr3qVaQMmsUwJeFkihMH3JWiF2I6CsY4drMz0que0I7euQz0mtg0bTvZ9iwGrPqwjNXo82c4chXwT87s1ICei2XA1NsIyLDGIFxOuPC3MLN/v9MCgnC5yyKobEPa2F4y5ihSbjOE0OjSZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637713; c=relaxed/simple;
	bh=/HCrjvOnLIY8QuZD2OYhUwpYy68pk9wHq05+Q0dSSZE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fW6sIMVyAkVgSgiEIIkAvjUYFyLrqJc1Wxj9sjtZPUxHaIg+44UWD1m5KAYohC9qTfhLrhtxmin2Sh3iozEK2aqqmnwcroY9GhGHRJWEfsPFumj678tVo7PEwjreoe9/EyKCjl7PZoXpMFNYe9ZPEd5GrcMzMLCD/2N7eFbTPLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPYhlHqr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPYhlHqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA15E1F000FF;
	Sat, 10 Oct 2026 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637709;
	bh=F2xcBPeNhZ6iqDPNkj8xzyu7m4WrxlJSszBQFiqfKH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JPYhlHqrOraCf3fJJJ1/gOth7lj/ltyYG9C9pGG50krGPziYZWseFnwksq8QHf7/H
	 lr7C/d+MT0yUfPaQVNG5aTbDqqqCmFo7cick8Jfq3n/i1vJrEAv+RoW5ikIM1TSS+x
	 DfLJmYOQgD1kP1Lk/gohXKzrDhc2xDAWL6zdTLgb0bSRkjfHLaIHk2Jux8HmZ5BFkB
	 L5uK4z0LvI2cZ/qnDu+P5Bmk9DWg8IGi//vweGKhvmdDHFV0+CcTTOOhXLXIbEms3M
	 Xs3clovLs4w8aiYT+6x9/C2ts4DoKtnU8m/tNL8iRsCjghFCYDgviP28wpqvOSIDnZ
	 ammL8z0rdSy/g==
Message-ID: <sashiko-outbox-166566@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261010130024.177503-18-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-18-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:08:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: undefined phandles in example break dt_binding_check
--

commit efe0acccd5887c49f0011f1f35c4533d75acb64f
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: net: Add ZTE ZX279128S Ethernet switch

Describe the switch, receive interrupt and per-port PHY modes and MAC
addresses for the ZTE ZX279128S Ethernet switch.

> diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yam=
l b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
> new file mode 100644
> index 0000000000000..56c81aa6e72ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ethernet@92000000 {
> +        compatible =3D "zte,zx279128s-gmac";
> +        reg =3D <0x92000000 0x400000>;
> +        interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        ethernet-ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                label =3D "lan1";
> +                phy-handle =3D <&phy10>;
> +                phy-mode =3D "internal";
> +                nvmem-cells =3D <&macaddr 0>;

[Severity: Low]
Are the &phy10 and &macaddr phandles defined anywhere in this example snipp=
et?

When dt_binding_check extracts and compiles this example, will dtc fail with
a reference to non-existent node or label error? Dummy nodes with the
corresponding labels might need to be added to the example.

> +                nvmem-cell-names =3D "mac-address";
> +            };
> +
> +            port@4 {
> +                reg =3D <4>;
> +                label =3D "wan";
> +                phy-handle =3D <&phy8>;

[Severity: Low]
Does the undefined &phy8 phandle here also cause a dtc compilation error
during dt_binding_check?

> +                phy-mode =3D "gmii";
> +                nvmem-cells =3D <&macaddr 1>;
> +                nvmem-cell-names =3D "mac-address";
> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D17
