Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794F3090C4
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829463; cv=none; b=S0OFsu/sPifUyyde/UCq282ObEVp9crKbxF7ISgjzQgzhpKxKY32nh3M2asrdlAMRS/G40I+x4YEHRQLItm1qjSJluqGVQkjQ0QLwHn5LSiOn/UbLFEDzVEEawCWeLLNujwgcr9iapVnN3RRw1K6Yzj9qcH2ffENQKKjnOPMUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829463; c=relaxed/simple;
	bh=znqQm7DT7UcFPnnSBrZXl3aYwdcTU4QGT+ILe1Ni9YA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bR+9QQbkguKJRaMxx1nAhjdOUP0fWkFEbkwwwdMTbMY4hKtHg/ea4XLhQWy78fISf8uS1QcqnzEjTNsbXHwVOX206Aje3WcueFTc5Ii1yeqzEtqK3nHX9mVJuNf3kV/3epBnTPEa6gdz034xXGvEK2Vsbd63LTqBzdZWOpkinRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5kegDpL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5kegDpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627391F000E9;
	Sun, 12 Jul 2026 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783829461;
	bh=qdv64XW4FNPe2w8tib+gld1wLd7cHM0tvo+i/wPUJ/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5kegDpLXqMXJsCckp1nfK6PBSs/K6phu+QxsYhpniQ+7y/AqsjbPcJuHKjhqLDLH
	 649Go56DDHZDJq1Uk+GHLQzRndh761OCUCf96b5fbts1vVkDQ/c3VKV4XExS8HawH0
	 HnINWNy0LeEIcdM60FW47YgzXjQUPK3ju2AfxyuVncoqz/FEBc5G59uNbDUAbCrfly
	 xHN21iPn3I0yiPCgzMvoj6ysBEqk0FHDPvX+ZK5GN/E95FovM2xmxAGxlu72w1lOlT
	 C8xr9OJHnSlNNgIDoROEu5LCaYJc/2TqWdJ2BDJpvKgpAaqks4r0pdCxdY5AUYcdXM
	 wm3sKOiov8AVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6
 IO board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260712-bpi-cm6-v3-3-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
 <20260712-bpi-cm6-v3-3-8d1e2045179d@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 04:11:00 +0000
Message-Id: <20260712041101.627391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The LED nodes omit the `function` property, preventing standard sys=
fs naming.
--

--- Patch [3]: [PATCH v3 3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-C=
M6 IO board ---
commit eca00d20544419594bdbc975c29f6586b94b4fd3
Author: Junhui Liu <junhui.liu@pigmoral.tech>

riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board
   =20
The Banana Pi BPI-CM6 IO board combines the BPI-CM6 compute module with
an IO carrier board. The core module integrates the SpacemiT K1 SoC,
PMIC, DDR, eMMC, the eth0 PHY, and wireless connectivity. The companion
IO carrier board extends it by providing the eth1 PHY and exposing
standard interfaces, including dual Gigabit Ethernet, MicroSD, two USB-A
ports, a USB Type-C port, two PCIe M.2 slots, and a serial console.
   =20
Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/r=
iscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> new file mode 100644
> index 0000000000000..2c2d78aee98aa
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
> @@ -0,0 +1,177 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led0 {
> +			color =3D <LED_COLOR_ID_RED>;
> +			gpios =3D <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
> +		};

[Severity: Low]
This isn't a bug, but should the led0 node in k1-bananapi-cm6-io.dts includ=
e a
function property to indicate its hardware role?

Without it, the LED subsystem cannot construct the standard color:function
sysfs name (e.g., red:status) during the gpio-leds driver probe, and will
fall back to legacy or incomplete naming.

> +
> +		led1 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			gpios =3D <&gpio K1_GPIO(97) GPIO_ACTIVE_LOW>;
> +		};

[Severity: Low]
This isn't a bug, but should the led1 node also include a function property?

Like led0, omitting it prevents the LED subsystem from generating standard
user-space sysfs paths for this LED during device tree parsing.

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-bpi-cm6-v3=
-0-8d1e2045179d@pigmoral.tech?part=3D3
