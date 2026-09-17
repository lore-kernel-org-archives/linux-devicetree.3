Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6574FDA46
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663384; cv=none; b=uRD9zXdbaKAln/ZotZJQbN+bcDauhF8xB5cJzZUKUNs2AsUOdkYLECMm2qaiNcOTrG3/3a8yDgVplkXpZ4Q+U9/umCU8oeNg7qZDLKerFRIsW/p1tYIorlehgleWBVI27UrLn95CsfMYrHzoUxYVl6UpDqdZ1xW7pHXdOnAIIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663384; c=relaxed/simple;
	bh=NQRc2H0SMv6k7mAi6iiGzQFZlFsO9E7NdDVaN97xlVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ipu6hC7H5+hn2xpOBA8YIDmbcF76e2mpLMaVHtwYM6fQUaxUDftZ4vGr4I6rzHylD5lSeBCZtHhzkXIbeUr8tlzyAqjk+3a2zSb8VGO/h9pKYVMeSaBdOeRq/qtVdFaaIlRCMmtMSKq+qvXDTi9RdF1IWIKdLzzpxqqZCc3C9PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RohZd+rn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RohZd+rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1DA1F00898;
	Thu, 17 Sep 2026 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789663382;
	bh=bVkTo18e6bMog8Ht4pm984OKtDxgBK7QOTNXHKB23BA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RohZd+rnOmnCMJWeZwvxVAM483gVGsJgDrCC0vPzzs8Ctxq8DLzalTgJEVSuqtyFy
	 Nw91dA3uhUVbWUedti+gnryvUiZ9XqrujSntrH6mX7igDkgyYwjIEM60KgR/szIGoW
	 jfgXzmdKPJnLB6a0IUcePzfLNfdtZZPf9GXEcKrMnplttGHbP/u9PTkQ7eQt8dBSLJ
	 Umi5dgQ0Mhwnep2MFHOBXr9Ui3Uy2IQy/fStLmmtaOlIUvH9de7PlexNLJufkD1oey
	 3V4Obbvq4jgnwsVSTVyUhHLyaHfPJhtZxTFpSzWr+BCJLbC0SiwUK+SqhY2hFsWT2F
	 BaWJfZt28XVGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917163157.1380860-4-petko.manolov@konsulko.com>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 16:43:01 +0000
Message-Id: <20260917164302.5B1DA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm: dts: out-of-bounds I/O access due to dw-apb-gpio size mismatch
--

commit 3b5d14b4fd8ed90306ed124677b8ae6312b78a2f
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module

This commit adds a new device tree for the Draeger M48 CPU Module. The modu=
le
is built around the Altera SoCFPGA Cyclone V.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..dae809c02adb8
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;

[Severity: High]
Does this compatible string cause an out-of-bounds I/O read regression duri=
ng
probe?

The gpio3 node specifies a register window of 0x20 bytes. However, the
snps,dw-apb-gpio driver unconditionally accesses the GPIO_EXT_PORTA register
at offset 0x50 during initialization in dwapb_gpio_add_port() and during
system suspend in dwapb_gpio_suspend().

Accessing offset 0x50 from the 0xff202000 base address falls outside this
allocated 0x20 byte window. On an FPGA memory-mapped bus, accessing unmapped
or unpopulated physical memory can cause a synchronous external abort, lead=
ing
to a kernel panic at probe time.

Should this node use a different compatible string, such as altr,pio-1.0,
which fits the exactly 0x20 byte register window?

> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;

[Severity: High]
Similarly, does this compatible string cause an out-of-bounds I/O access he=
re?

Because gpio4 is placed immediately after gpio3 and also specifies a 0x20
byte window, the 0x50 offset accessed by the snps,dw-apb-gpio driver falls
outside the bounds of the gpio4 window as well.

> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917163157.1380=
860-1-petko.manolov@konsulko.com?part=3D3
