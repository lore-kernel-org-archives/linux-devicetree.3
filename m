Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538A3E49F2
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691489; cv=none; b=DunTfB5FPsfrZ6atPQhJx1DVH8N6z5BlyrhotIOOlE/oVyeCQKqkQNglZDfmjZrQfKhUF+J/AWY0rddnoLIjWWVhZutHcEB2wEYgT4hpNaQwV9S7f2guxNlzyyiflswQ917TTv0T/iehQQXRouAQ+d/O4ymxDY/G3oR5IOn9t9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691489; c=relaxed/simple;
	bh=oopDUr7HbyOBpNekMXJhFTmQE2m7SAXdWvhFqIuQXb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=THXabwwCxthZBoMUh9mA+gNiR6610qvZZqe26YSyQc1HHA26CHVrEJJYTB4XS/bHX8GMRb28wDkhgzxkmg30cCCoRWPRDj6y3N4Il//zrZvXS9Yn0ba2Hk1cbjiOvUAKwpNs5DB2FsoyzFyrm/5opCNajzGdFY2SYn6bC5hRDj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeyzkoMh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeyzkoMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434B01F000E9;
	Fri, 14 Aug 2026 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691487;
	bh=lRbc/goT2DfcUXkzNbjcoCNLTuOda4bmKeLaWrTBboA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VeyzkoMh74fpF11A+lBiLZw+HIPOA8gHzpiJdTo3xwsP/NKbqKfiLAk6ikLdxCPwL
	 SeL0J4DA863zlw9sygFcitCVfKPSrcCHb8SG7uVwyhRozdZfQtOVVZSkFyeLRWHise
	 iZjCfy3ebJbRcobjRSqB+YuZUPtN5yUrHWzT6gWPLM53Ygeot9roS0PL+QbKOIKcWM
	 s/vRCbI7g0qQqM/Oc2xv6WrtBYvJ70vcMWPdxKi/XLKgsUR2iekXSugAUB8gfT1T6O
	 OGRHTUpuXXFpV3gwIjn4AeiFFX74x7GwNDrUgFwUAXIf0ftf19sS65U3JJXs7ul4HP
	 LUXdPFazDQF9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] riscv: dts: eswin: add hsp bus node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814070007.1662455-5-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-5-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:11:26 +0000
Message-Id: <20260814071127.434B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The syscon node is nested under a simple-pm-bus, which relies on c=
hild PM runtime to enable its clock, but syscon bypasses PM runtime, leadin=
g to unclocked MMIO accesses.
- [Low] The compatible string 'eswin,eic7700-syscfg' is introduced without =
corresponding device tree binding documentation.
--

--- Patch [4]: [PATCH v4 4/7] riscv: dts: eswin: add hsp bus node ---
commit 478468d2187b14120b83e2c525f0193b36412f11
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

riscv: dts: eswin: add hsp bus node

This commit adds an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR registers
and the register spaces of HSP peripheral devices.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index b16e3e28632c2..771a88645d835 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
[ ... ]
> @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =20
> +		hsp: bus@50400000 {
> +			compatible =3D "simple-pm-bus";
> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			syscon: syscon@50440000 {

[Severity: High]
Will placing the syscon node under a simple-pm-bus lead to unclocked MMIO
accesses and system hangs?

The simple-pm-bus relies on child PM runtime to enable its clock
(EIC7700_CLK_GATE_HSP_CFG_CLK). However, syscon does not instantiate a stan=
dard
platform driver. When syscon_node_to_regmap() is called by any dependent
driver, it initializes a regmap with a NULL device and performs raw MMIO
accesses without calling pm_runtime_get_sync().

Because the parent bus is never resumed by the child, the clock remains gat=
ed,
which can cause any read/write to the syscon registers to hang the system.

> +				compatible =3D "eswin,eic7700-syscfg", "syscon";

[Severity: Low]
Is the "eswin,eic7700-syscfg" compatible string missing its device tree
binding documentation?

Without corresponding schema documentation in the bindings tree, this will
cause schema validation warnings during dtbs_check.

> +				reg =3D <0x0 0x50440000 0x0 0x2000>;
> +			};
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814070007.1662=
455-1-pinkesh.vaghela@einfochips.com?part=3D4
