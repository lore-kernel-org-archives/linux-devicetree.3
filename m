Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD9D438025
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841943; cv=none; b=X/Yo6HwggtAwxkJNz36bsP7PjdRUpBhv51zDKnAJoCgnRvYU7cFKPce2xE9oWpTQ2051syvgbRD0nH3myBMEj9tPxjYYGOt/lmBtDHvyMTTGojTKCQzhj69N4wDMY6Cl+gWxf66Lqba2021uXIm/hIvPjO0pZ8322yHC6gtn4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841943; c=relaxed/simple;
	bh=fg2ebKu1TlJw8GqEpFeruX4s1MC3NIwKS2RHj3DpYd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tzkKaocaTNxPzI8vcZBiTmeVmslZTC5wC6/mL8Nf7O9p5UZQZDBeQpq4sirNsFx6XrMobHVSRYekrDWtmFQj2M6dWySm/CXSyZfl1QqIXYLw8Kxbpej31Tn/3BUgn5d74a7ZFIEQ8LqdqJE9cOdZ5eJ/gJArHJetWQdB4r96J6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDfPc+jB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDfPc+jB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261071F000E9;
	Tue,  4 Aug 2026 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785841941;
	bh=7zfPQbsxoTNg6hXwJtegs92+5/RyO0YHTEUuvYbJSgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LDfPc+jBUN1Y8GYyGYFrvzaMs4NWUNXhUuFDrD5q23kzPyPimXBSRLmE1rTPYeSQb
	 nXfqmvuCe2R0wrm3hrNlc3w8JuJ2RjaBO3o8zv+LzKmRvceFc+Pn4fozQLE4w3ih++
	 wv8/i3tb1p0NSOqQ0w4LxnOb9zGcbx/EPObYIdH46foTNpeHD9a+QY10xErcgHOzUj
	 lakOz+1YG+je8rRDif1rXXFWfCCDK/DMOKSQVs6UP4hKz5NZ2hZooERelTzBjXorAU
	 YahScgFYGdeOs5YpDReANPDvksZ0SVY+HWpbyquMfc8ca56R52wtxj6A+R5HzlQjSK
	 DAF8i59OaWHlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] riscv: dts: eswin: add hsp bus node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804104431.1391839-6-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
 <20260804104431.1391839-6-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:12:20 +0000
Message-Id: <20260804111221.261071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Generic `syscon` node under `simple-pm-bus` will be accessed with =
its clock disabled, causing a bus fault.
--

--- Patch [5]: [PATCH v3 5/8] riscv: dts: eswin: add hsp bus node ---
commit 4e57b37c3aadc988b1aed52b079b78ca92be234c
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

riscv: dts: eswin: add hsp bus node

Add an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR
registers and the register spaces of HSP peripheral devices.

> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
[ ... ]
> +		hsp: bus@50400000 {
> +			compatible =3D "simple-pm-bus";
> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			syscon: syscon@50440000 {
> +				compatible =3D "eswin,eic7700-syscfg", "syscon";
> +				reg =3D <0x0 0x50440000 0x0 0x2000>;

[Severity: High]
Will accessing this syscon node cause a bus fault due to the clock being
disabled?

Because the child syscon@50440000 uses the generic syscon compatible string=
, it
does not bind to a standard platform driver that would invoke
pm_runtime_get_sync(). As a result, the parent simple-pm-bus will remain
suspended and the clock EIC7700_CLK_GATE_HSP_CFG_CLK will stay disabled.

Additionally, since the clocks property is on the parent bus rather than
directly on the syscon node, of_syscon_register() cannot fetch the clock to
attach it to the underlying regmap_mmio.

Does this clock need to be placed directly on the syscon node so the generic
regmap core can manage it during register accesses?

> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804104431.1391=
839-1-pinkesh.vaghela@einfochips.com?part=3D5
