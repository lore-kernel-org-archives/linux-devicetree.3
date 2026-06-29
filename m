Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E13403FA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726265; cv=none; b=lL2Yase5urg5/4ZgAPcOc661e6v+lnIXQjBkA8Tye6MjoF84UEkU2yJ3o4fU6WUXU9aW71EWHbHDn+MxF39F8ST9FoqqFcJUZ8I4bNg9ctyf1RIGttMI41cUyoxaflk7iMeYNsII+QoFtu1skkVWGtf1FUnsPIpWAJLWDoooAqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726265; c=relaxed/simple;
	bh=Ni3b6hK/delt575/KqJFxY4Hic2jk9IFCtbns8Px69M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N3OJgvmPN2wX0MZUaXBL+gj9Fm+dQN0osgVWL9vfVEFu0q27vNxe6Qw+W7xd4QHaqveivv6bv/nLHHJ4gOTCnMPUFZuMlNzMNGEOD9H0i/T6GO9QjaMXZ6Xjwyl89PmRZw0AlzcIo4w24ZMkfCd1nE8wWlSNlNi6D8q6N5Pf2Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP3UHswT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP3UHswT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AAC1F000E9;
	Mon, 29 Jun 2026 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726264;
	bh=5rgokd700FWSIOjTS7tPX7usxEMJ1OcChGfJ5rGnw9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GP3UHswTkj0ZfmdkjG3TD9zU9J1v6mtnI7/pg/FggvysdCKHmh+u1Xaw8ozq5vKOj
	 +BoF8a/1SmlIDcuqFlSXTDVCzVcjHdtmUPsBV6zpbctQyWGjBRg2SJvoY2vJq8q1fd
	 v/SYGRIrW8WWWPQa3Y8Ui0uA1k0dn0PieqXCVzsNCu9Gu1XXJQJHSkQ6/lWfzVGsvF
	 k93vGoVBRYlxqxBQJmeg57LJFzYP+XB7OxXzzWqWu4p2oFfIv0XCZeGEAPwaJJwlij
	 59r/NKyVVTq0p9AyxA/9ROCLmLU7uDMXZvsr167V7WZ6O/WgCQVmNBsn1MEyF0pod/
	 4fDa+azi5dKGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: tegra: Enable XUSB host function on Jetson
 AGX Thor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629093406.1118594-4-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-4-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:44:23 +0000
Message-Id: <20260629094423.F1AAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree nodes use `GIC_SPI 4096` and `GIC_SPI 4101` which =
incorrectly parse as hardware IRQs 4128 and 4133 due to the SPI offset of 3=
2.
--

commit 0e16479e341627ad9fb569ac2ccd54f1ef421b1f
Author: Wayne Chang <waynec@nvidia.com>

arm64: tegra: Enable XUSB host function on Jetson AGX Thor

This commit enables XUSB host and pad controller on Jetson AGX Thor.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra264.dtsi
> index 2d8e7e37830ff..3433587dc5725 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -4049,6 +4049,160 @@ pci@8480000 {
>  			nvidia,bpmp =3D <&bpmp 5>;
>  			status =3D "disabled";
>  		};
> +
> +		xusb_padctl: padctl@8680000 {
> +			compatible =3D "nvidia,tegra264-xusb-padctl";
> +			reg =3D <0x00 0x8680000 0x00 0x20000>,
> +			      <0x00 0x86a0000 0x00 0x10000>;
> +			reg-names =3D "padctl", "ao";
> +			interrupts =3D <GIC_SPI 4101 IRQ_TYPE_LEVEL_HIGH>;

[Severity: High]
Does this map to the correct hardware IRQ? Using the GIC_SPI macro for an
ESPI INTID adds an offset of 32, mapping to hwirq 4133 instead of 4101.
The kernel will emit boot warnings about the SPI being out of range.

Should this be replaced with <GIC_ESPI 5 IRQ_TYPE_LEVEL_HIGH>?

[ ... ]

> +		usb@aa10000 {
> +			compatible =3D "nvidia,tegra264-xusb";
> +			reg =3D <0x00 0xaa10000 0x00 0x40000>,
> +			      <0x00 0xaa00000 0x00 0x10000>,
> +			      <0x00 0xaa50000 0x00 0x10000>;
> +			reg-names =3D "hcd", "fpci", "bar2";
> +
> +			interrupts-extended =3D <&gic GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&gic GIC_SPI 4096 IRQ_TYPE_LEVEL_HIGH>,

[Severity: High]
Similar to the regression above, does this sequence map correctly? Using the
GIC_SPI macro adds an offset of 32, which maps to hwirq 4128 instead of 409=
6.

Should this be replaced with <GIC_ESPI 0 IRQ_TYPE_LEVEL_HIGH>?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629093406.1118=
594-1-waynec@nvidia.com?part=3D3
