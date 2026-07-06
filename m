Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE383CC7FB
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320532; cv=none; b=EDK5hsLhosjFCvEx6DZhD+008d1BnUsQX0IJlw4QaqjfxVOZ3ylS98NbmwMWX81GllHBlUzvDeZglSRbdH5hJU+AMDuHZggUluT6v3LdybfH6UtG7p8Ik9mwDoGD2FYA/Hjf6jSKNcH5G6wXQw114DNT8HdkmGm5T6A6oZiyBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320532; c=relaxed/simple;
	bh=3ZvwNeP8h8HGtApyFDz4G8wHqG6nsDcCVCGjDdyYh+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O43+72UWVLcx71D4Byr6pufnTKCQNuYs50DfAh3COHTpWh0ugnWUjE+74bX1evGOTgX2LqEvODNJ4p27/5gsCpRRSIc6P5rEcfSihLj31f4K02hFx+y/Ymzu2IFxMEfqNgWd2zQ7vGTI3yS8ahfSHJv6bDBewbodhNHQ+EX2ngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpNeD7OW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpNeD7OW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E769D1F00A3A;
	Mon,  6 Jul 2026 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320524;
	bh=2zGNSEqrGzqxs7zY0T+Ibd8yQuS06Oxt4q0wT+CKDL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WpNeD7OWgq7midtEKmD8h+RJRXu8cC8Je+9HX46clPGKr2UuB+D0FM+B+RtgWnXHj
	 RB+nhK/yyLQ3gIOCtY0dHjzbE0O7joyaBKzwQzU3t2pCf8LhGf+kRHTrsuk7ufPrJp
	 ucE99w3TEq2VT0z1W98cPpXWRWkjchNklqWGQ4M9+ux1POqvEwk15ZFKGzMajh8kjp
	 nxcrpqXJvzNjGiO8LCxw74pzwCJKrPlAcbfmEJX/7WdPGf3fNTJdBoXEtkse3Cp8Xg
	 ZpDDpNicNSROJNzrqkIvdQPDhjSGSDs9nhfX93frJsP2Aid+PqKouSEY6bmxHS9Euu
	 +i2zhEULvhslw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: axiado: Add initial support for
 AX3005 SoC and eval board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swark Yang" <syang@axiado.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
References: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
 <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 06:48:43 +0000
Message-Id: <20260706064843.E769D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Shared `cpu-release-addr` across secondary CPUs violates arm64 spi=
n-table semantics and causes SMP boot panics.
- [Low] The `gic500` node contains address translation properties without a=
ny child nodes, causing dtbs_check schema warnings.
--

commit 98da4ec387872dcf54e685ea2615453187fb1582
Author: Swark Yang <syang@axiado.com>

arm64: dts: axiado: Add initial support for AX3005 SoC and eval board
   =20
Add initial device tree support for the AX3005 SoC and its evaluation
board. The AX3005 is a multi-core SoC featuring 4 Cortex-A53 cores, and
this adds the CPUs, timer, GPIO, UART, I2C, I3C, SPI and USB controllers.

> diff --git a/arch/arm64/boot/dts/axiado/ax3005.dtsi b/arch/arm64/boot/dts=
/axiado/ax3005.dtsi
> new file mode 100644
> index 0000000000000..c3c66634d7774
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3005.dtsi
[ ... ]
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a53";
> +			device_type =3D "cpu";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x80002fa0>;
[ ... ]
> +		cpu1: cpu@1 {
> +			compatible =3D "arm,cortex-a53";
> +			device_type =3D "cpu";
> +			reg =3D <0x0 0x1>;
> +			enable-method =3D "spin-table";
> +			cpu-release-addr =3D <0x0 0x80002fa0>;

[Severity: High]
Since all secondary CPUs share this exact same release address, won't they
all wake up simultaneously on the first sev() instruction broadcast?

The standard arm64 spin-table implementation expects a unique release
address per CPU. If multiple CPUs wake concurrently and branch to
secondary_startup(), won't they race to use the single secondary_data
context and corrupt the stack?

If the AX3005 platform specification mandates a shared address, does this
platform need a custom enable-method or PSCI instead of spin-table?

[ ... ]
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		interrupt-parent =3D <&gic500>;
> +		ranges;
> +
> +		gic500: interrupt-controller@40400000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x0 0x40400000 0x0 0x10000>,
> +			      <0x0 0x40500000 0x0 0xc0000>;
> +			ranges;
> +			#interrupt-cells =3D <3>;
> +			interrupt-controller;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;

[Severity: Low]
Are these bus translation properties necessary here?

Since the gic500 node has no child nodes (like an ITS subnode), including
ranges, #address-cells, and #size-cells will trigger dtbs_check schema
warnings for arm,gic-v3.

> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +			#redistributor-regions =3D <1>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-upstream-a=
xiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com?part=3D2
