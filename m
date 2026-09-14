Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70D46EC7C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389075; cv=none; b=rLNrc0n6dRdLzf4NoItI6I44FwoKbPdMw9OFsGUkKJ6duwTkdYi+oe95f3qtGP49QvSXW10guPoMZPs1+56EWIegwLL+gHo4TQN3OFx73UwUxt8Vm5aY65tAJF/8ujfVfxLGU2/oWWxYphqR7F+eybir1vkj3fK0yBad+TNzoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389075; c=relaxed/simple;
	bh=cAtGYr9e6MM4F4nwcu1pZsI83RTeOExrQnCp065YVhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PAwdd07atz/Aas5ModXLcDmClK9ELQiAYZKSVWP4vwULZrbmFAP7cK0vycmeGTdm9wMuE15HNj9xh+R0xVLdN+5zxwFbmLbvWCJuOMZ5n8AbGA9QYCTaZwcNrNs817X81M6vL6PHYGyUlDYpBrN3lz33Zdg2Wd8jfM3SX3wHAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOjRrqra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOjRrqra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CC81F000FF;
	Mon, 14 Sep 2026 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789389066;
	bh=nhbDnhLd2WXqy1HvueG3qFb7FMgh7BCAEnbiY1dielY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cOjRrqra9IpTpBqdjStgRos+Ae0NByIvjm+QhTNuqxkrfmXqafyCnCGkltz9nzCMA
	 nFrSJcKpzHw2A7odQyJzEAY2e+Ec8LiUGvizqW2QClzFSI6SK0+iQQADIbSC3cEsSx
	 WOof9hByto+9tt+EPySkrUSivk2fd6xrTN4joWTVUNgQcrPrTJDBJR+3qqH13sujpE
	 hz0jj25NP+7sAAzMUIHDM0yfTNVXmbL02vU0ZpCr5gLRUIkuTSncuGgCqu4CpRRu9b
	 zkS4pIwah4TyDQ86Aq4M1kGF8SsRhuzVetRzbvEukFXSSkBHqmUWaLxvTBJdMF0KEt
	 iCt8qHkFw7K5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation
 in the example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 12:31:05 +0000
Message-Id: <20260914123106.44CC81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `mdio0` block containing the `phy0` and `phy1` node definitions=
 was accidentally deleted during indentation cleanup, resulting in unresolv=
ed phandle references.
--

commit 3067fd6538b78515dc2a63a2028de505854e6496
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: net: Use consistent indentation in the example

This patch corrects the indentation in various device tree binding examples
to conform to a consistent 2- or 4-space indent style. It aims to resolve
dt-check-style warnings across multiple net and wireless bindings files.

> diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-etherne=
t.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> index f0b5bea2458d5..da9bc170cd543 100644
> --- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> +++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
> @@ -87,18 +87,6 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/clock/cortina,gemini-clock.h>
>      #include <dt-bindings/reset/cortina,gemini-reset.h>
> -    mdio0: mdio {
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
> -      phy0: ethernet-phy@1 {
> -        reg =3D <1>;
> -        device_type =3D "ethernet-phy";
> -      };
> -      phy1: ethernet-phy@3 {
> -        reg =3D <3>;
> -        device_type =3D "ethernet-phy";
> -      };
> -    };

[Severity: Low]
Does the removal of this mdio0 block break the device tree example
compilation?

Since phy-handle =3D <&phy0>; and phy-handle =3D <&phy1>; are still used la=
ter
in the gmac0 and gmac1 nodes, deleting these target nodes results in
unresolved phandles when running make dt_binding_check.

Was this block accidentally dropped during the indentation cleanup?

> =20
>      ethernet@60000000 {
>          compatible =3D "cortina,gemini-ethernet";
> @@ -110,28 +98,28 @@ examples:
>          ranges;
> =20
>          gmac0: ethernet-port@0 {
> -                compatible =3D "cortina,gemini-ethernet-port";
> -                reg =3D <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> -                      <0x6000a000 0x2000>; /* Port 0 GMAC */
> -                interrupt-parent =3D <&intcon>;
> -                interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> -                resets =3D <&syscon GEMINI_RESET_GMAC0>;
> -                clocks =3D <&syscon GEMINI_CLK_GATE_GMAC0>;
> -                clock-names =3D "PCLK";
> -                phy-mode =3D "rgmii";
> -                phy-handle =3D <&phy0>;
> +            compatible =3D "cortina,gemini-ethernet-port";
> +            reg =3D <0x60008000 0x2000>, /* Port 0 DMA/TOE */
> +                  <0x6000a000 0x2000>; /* Port 0 GMAC */
> +            interrupt-parent =3D <&intcon>;
> +            interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
> +            resets =3D <&syscon GEMINI_RESET_GMAC0>;
> +            clocks =3D <&syscon GEMINI_CLK_GATE_GMAC0>;
> +            clock-names =3D "PCLK";
> +            phy-mode =3D "rgmii";
> +            phy-handle =3D <&phy0>;
>          };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913122910.9945=
7-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
