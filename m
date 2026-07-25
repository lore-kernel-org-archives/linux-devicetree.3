Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C26389111
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956812; cv=none; b=GhZ4SZBDpyXX3c9woL5pC8GO2krixvGKOE/qyJqfsCHmgPjkpiEhL5FYN0No6fXuLmBuYX5wcts9dkiNP+yOcbYRDTgLXk2rfPLjCQQjnyh+E91ofbNzo3qX4bTTzIyxtmjHXiUMnZJu3brImieqnDE1oNZsriqJSXw6qiPMom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956812; c=relaxed/simple;
	bh=OootQlTBneFM5SFiRkS9JvJKoNSaP86q+fjQFUDZZXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMSWXUgQto72+FwEGotN1p/yB26jUsWXG12uiqIKOw3t8PwGNUViYpKK+mdSn/wPejGA6Rh6Dl696YCiDzaMpDXoccAkb4VghummgrPILOVoKiW3lw8wG8s86bKf63UszvE8GuBgD6MFEfI9Qn9Vl9+obW3vAz3fOrFutA9pRK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kllQWRX2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kllQWRX2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5FD1F000E9;
	Sat, 25 Jul 2026 05:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784956811;
	bh=IA9z5D4ZArJj0QrrlSo1OconEddOByGPua3AQf+cpZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kllQWRX2YHFW4STyjT004YbM9wRxyJXpAUDhmB/8Fy0CrS4XPI1XdIekEdsneanYu
	 9dI3ngHRUrinO1L83Ofc/+dbmaW3C6cxV9SftazAzNO/rPFCyM6iqpKBAvw4eGayz0
	 ZSkQIDXDaffH7ceWmMqg5OfRP2qkz8FEvYXtZt97FXBYY95bIBEG0XUY4y0qAGtOW7
	 V90OG0adVIWSB7s3YYPphjMdSe66qWGVyT3oE8lNHE4I3P/acGGA4BEivPFrd2eH7U
	 jg1Hjv169VwuuyT0SAbMyys1GiIS869qT+t0wHo40TiOM7LsQMvjn+wsCyFyaAiwHc
	 0qgmhrrsXeApg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/17] riscv: dts: spacemit: k3: add display nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, dri-devel@lists.freedesktop.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-k3-display-v1-14-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-14-f22a10a52867@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:20:10 +0000
Message-Id: <20260725052010.AA5FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Cyclic DT dependency between DP controllers, their child PHY nodes=
, and the APMU syscon will cause a fw_devlink warning and a potential -EPRO=
BE_DEFER deadlock.
- [Medium] Fragile array override of `syscon_apmu` clocks creates a severe =
maintenance hazard.
--

--- Patch [14]: [PATCH 14/17] riscv: dts: spacemit: k3: add display nodes -=
--
commit c12c6ab932374f52bfc3ce3d04640d8193a9bfea
Author: Cody Kang <codykang.hk@gmail.com>

riscv: dts: spacemit: k3: add display nodes

Add the SoC-level display nodes: the two Saturn DPUs, the two DP/eDP
controllers with their PHY children.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-display.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-display.dtsi
> new file mode 100644
> index 0000000000000..4892ee6acda22
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-display.dtsi

[ ... ]

> +	edp0: edp@cac84000 {
> +		compatible =3D "spacemit,k3-inno-dp";
> +		reg =3D <0x0 0xcac84000 0x0 0x4000>;
> +		interrupts =3D <132 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;

[Severity: High]
Does this create a cyclical dependency that could cause a fw_devlink warning
or a permanent probe deadlock?

edp0 depends on syscon_apmu here, while syscon_apmu depends on the edp0_phy
child node below. Since edp0_phy is a child of edp0, it won't be populated
until edp0 probes. If fw_devlink breaks the cycle by dropping the edp0 ->
syscon_apmu link, edp0 will attempt to probe first, fail to get its clock, =
and
defer forever because it will not proceed to populate the child PHY.

> +		clock-names =3D "pxclk", "pll";
> +		resets =3D <&syscon_apmu RESET_APMU_EDP0>;
> +		phys =3D <&edp0_phy>;
> +		phy-names =3D "dp";
> +		status =3D "disabled";
> +
> +		edp0_phy: phy {
> +			compatible =3D "spacemit,k3-inno-dp-phy";
> +			#phy-cells =3D <0>;
> +			#clock-cells =3D <0>;
> +			clock-output-names =3D "edp0_pll_pxclk";
> +		};

[ ... ]

> +/*
> + * Feed the PHY PLL pixel clocks back in as the APMU mux parents. This l=
ives
> + * here, not in k3.dtsi: the PHYs only exist where this file is included.
> + */
> +&syscon_apmu {
> +	clocks =3D <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>,
> +		 <&edp0_phy>, <&dp1_phy>;
> +	clock-names =3D "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m",
> +		      "edp0_pll_pxclk", "edp1_pll_pxclk";

[Severity: Medium]
Will overriding the clocks property completely drop any future additions ma=
de to
the syscon_apmu node in the base k3.dtsi?

Device tree doesn't support appending to array properties, so if any new cl=
ocks
are added to the base syscon_apmu node later, this file will silently overr=
ide
them and break other subsystems relying on those clocks.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-k3-display=
-v1-0-f22a10a52867@gmail.com?part=3D14
