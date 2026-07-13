Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7F34C83C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783975293; cv=none; b=lgQ2vMC69DdWdWr84CWELQSfv8CXoXVRVWkO5W3Im8iUdCS/oaNwFtC4drzdn+YGzXDk7Fo0In3ZfUP8d3gPOrgRA5jrvt8gC4r5Vru/xiTuuUYZo9WkFeBm2+K6O63NlgZ36I6EYeR6JTVNbFTzxYLBQsNsyU8bon0JR+hWDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783975293; c=relaxed/simple;
	bh=hDw34zVvk19w5qHb9M9MAnt3oIrHDw+zR2/b6i4teVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7SMbDeNOAcUtoEwvqzhlVZG7pRHw+prDbQJN4YRNTkgfHquH9OlmolCrI0Lt41HAR530eLMI0xlczwhOhvwcAXC7wwJ3aqwCbqL8Ub3LMUBCfd5OgkHuZaAJfD+boKB8HNug9g8aSVRKag4CY/FyFjz1zsX1IbiAguB38CWOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG6o2J1K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG6o2J1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58091F000E9;
	Mon, 13 Jul 2026 20:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783975292;
	bh=teZZEVclWNNYd7wtnW4Bey3Jh1JUF+6GQ1lGT3IKG7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LG6o2J1KvVbOHSHkX/HyZvWucg/iNEXg8WimphMl2Z7lOcBPUzDnQjWFKw5+RQqE6
	 YA2Sl4Uymym5VBom9t9q0X/zyt2IlEpPGaDurR73vUdugr50Q5+iPqsj1G8lCIzdRx
	 G6zTu38Vj3bb8KEbRkjJm6rb/6h8nPzMw+BCJrDsSBnhoYDNTd/5In7YqzuY/LwOo0
	 HBtafR6aOi/MXJskp8yWY3ZHk2fmshSCd6aLUePDzy39t8EgXEFNWfmeheNI8z3jtY
	 z4+Q+mPpJ13z0dottnNHauS6ZZUWmIhiNrPCM/cx8wxsf+pkcsdMhLGaxOh4jRbkOB
	 UE56yPxndWogw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 refactor to support M6 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713-nanopi-m6-v3-11-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-11-227567ffc5dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:41:31 +0000
Message-Id: <20260713204131.C58091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_npu_s0=
` during refactoring.
- [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.dtsi`=
 file.
--

--- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6: r=
efactor to support M6 boards ---
commit 056adff75ec08989b96f09adc0efff6c3a5d662f
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards

FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
for adding NanoPi M6 support.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588s-nanopi.dtsi
> new file mode 100644
> index 0000000000000..a8e532ad8b7a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi

[ ... ]

> +&i2c2 {
> +	status =3D "okay";
> +
> +	vdd_npu_s0: regulator@42 {
> +		compatible =3D "rockchip,rk8602";
> +		reg =3D <0x42>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_npu_s0";
> +		regulator-min-microvolt =3D <550000>;
> +		regulator-max-microvolt =3D <950000>;
> +		regulator-ramp-delay =3D <2300>;
> +		regulator-boot-on;

[Severity: Medium]
Is the addition of regulator-boot-on here intentional?

This appears to accidentally revert a prior fix that removed the boot-on
property for vdd_npu_s0 to save power during early boot.

> +		vin-supply =3D <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};

[ ... ]

> +&u2phy0_otg {
> +	phy-supply =3D <&vcc5v0_usb_otg0>;

[Severity: Low]
Does this create a dangling phandle reference in the common dtsi file?

Since the vcc5v0_usb_otg0 regulator was left in the board-specific
rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like the =
M6)
that includes this common dtsi will fail to build if it doesn't also define=
 a
regulator with this exact label.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-nanopi-m6-=
v3-0-227567ffc5dc@gmail.com?part=3D11
