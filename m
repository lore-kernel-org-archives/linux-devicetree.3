Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993E326D4A
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567760; cv=none; b=BOSJhsQYZI0rTMngJOfEHhb+TB+hRqnfbDnFCfVUo8YrOPr/xFJ+YZBkiFRhjybikI4SUFXfqibBsn/SOdnjweuhl4TbUtL/GBifhnqGGizRIJgrPiyPFQhox6mrqfc3G4md4RP+pq1LmuOLN/BVyrCIwUFY1O2hAhAqOxhCtmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567760; c=relaxed/simple;
	bh=3haTicrws9KKBYA0/O0HczFC3lS1iEMAoRvkVehqPzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jovIxOnqRdpgaKjPrSRyL81YYa0BlunfdpVm7lMsxmVdbyd50idqqGnOC+BoX8o+kqPelWfoRbfR4bHb3hFf7ElLIq7r/uOjnnm74+pzhTfFawxlaAVi6/FerWg0zU/jhhLZDdxR7OAo8SyFiaxcbHoReMcHt2CglxDE7tr2pY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJTrDwoP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJTrDwoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53071F000FF;
	Mon, 28 Sep 2026 03:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790567758;
	bh=/bof0q8o8X4FHMFjyVRidwsGvZKJujLpW8bWKQhpVYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cJTrDwoPgRoSOC6WlKeqgW/HICN89ddML3qqBezaoqsjsavUM8PbLwQsMrCHL5Tcy
	 w/v9pPBQxR1NEqrJNsMB98HZ42nRxYtV7YBwhppG8rVxVi7WHdaZxKUPKRF0ZQk2V/
	 Acgc+LZ+DZPAbTbT9E4AHILhNeSQCVHy1Maj9ncTyJSN40U/Wd7u66i4jeJ7c/b+ND
	 rdipILhVw9sqNpxP3TbrcKqeNA+SDUy/mAUpi7+GPPiagjb+RH8RyBwmOVzOQ5Wuom
	 8GR/j0PkArEXp8gzYjDrb5aHOP9s98MJriYHBqm+pTyJBjZb8OwHtO3zes4tpT+n2S
	 5hxjYbQSb1t8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62l-main: Add ADC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928034115.1084840-1-s-adivi@ti.com>
References: <20260928034115.1084840-1-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 03:55:57 +0000
Message-Id: <20260928035557.E53071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: k3-am62l: tscadc0 reg exceeds parent cbass_main ranges
--

commit 06bc07c12d27dc31a3a3ae1cf4ef12f047b8b0e7
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: k3-am62l-main: Add ADC nodes

AM62L has an ADC in main domain, add ADC node in the respective
voltage domain file.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a2..70157981aba5d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
[ ... ]
> +	tscadc0: tscadc@28001000 {
> +		compatible =3D "ti,am654-tscadc", "ti,am3359-tscadc";
> +		reg =3D <0x00 0x28001000 0x00 0x1000>;

[Severity: Low]
Does this reg size exceed the parent cbass_main ranges?

In arch/arm64/boot/dts/ti/k3-am62l.dtsi, the parent cbass_main bus defines
the Second Peripheral Window ending at 0x28001400 (0x0e000000 + 0x1a001400):

	<0x00 0x0e000000 0x00 0x0e000000 0x00 0x1a001400>, /* Second Peripheral Wi=
ndow */

The tscadc0 node's reg size of 0x1000 bytes starting at 0x28001000 extends
up to 0x28002000, which exceeds the parent window by 0xC00 bytes. This caus=
es
a device tree schema and dtc validation warning when building the dtbs.

While devm_ioremap_resource() still maps the full 0x1000 bytes, and the dri=
ver
only accesses registers up to 0x200 (well within the valid 0x400-byte windo=
w),
should the reg size or the parent range be adjusted to avoid the validation
warnings?

> +		interrupts =3D <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains =3D <&scmi_pds 0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928034115.1084=
840-1-s-adivi@ti.com?part=3D1
