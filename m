Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746053BFAED
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778812661; cv=none; b=mtJ1iFzxlRfJA222LDH5tugKnMTmXgsE39mQCZoroJkLUQ4S8sp0f2FVCJ5kEqG6GkheSgKmzKyId3/ZEYfM1sYFEsUzsCJBU/Mmd+b3ukGklea9DCdE4rPE1Lsn2kMomWn5DmierQC6B99eWPibFIrnyk9qQesX4dl1tECuMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778812661; c=relaxed/simple;
	bh=mDsVIdyRAd24gTcRy2U6iftMi8jXTjkWabcR5YKWduc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NpQbGY1w4V7mcxyb3KNRPaiRxVaSOLVpQ3fTRYU+UmUVdH6H3VAjVlZWAaLOZ3J7/xo4jkMGrQUxScG1aIfHhYHGJbqhicFXlvSmW2NWSuGoK3zL/ZQLnsRj7m3v7FoWNKJt+OSWEd3sfXo0HD5e2XdKB37+XidbOI/0RxN4it0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrI34QPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrI34QPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB6FC2BCB3;
	Fri, 15 May 2026 02:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778812661;
	bh=mDsVIdyRAd24gTcRy2U6iftMi8jXTjkWabcR5YKWduc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rrI34QPqBbx2MK2hk3vDeDz0TkKBwcGf96dc1Ci1Ic84u+J6HEN+Ax+8G1uZEJ+Vj
	 dplHC+zwX2seIVUpihKmTBCw/dAbAdTs+1PaDJys8aVcIrtrSIFn1uuCLRdMYq3joN
	 zZFmmWB4+4zm/aWH36amPfSO0IQfmhiJRdX4wi3qXzt7rqb5IkOHS/bmnFj0i6QND6
	 A+ziYEa3WYqFdJgNIdyAsbErWE8NevqLTsioyLAvguiLKYUAkPaiJUWn5h6stOg9yQ
	 PeSWnJvSlSam0UVpXfO6F6bGLBWZS5r+KIFZWYnn5XG3NeneHqAu1icZjDR1g5VRMh
	 Mgp5sHREYbscQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:37:39 +0000
Message-Id: <20260515023740.9BB6FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Unused hardware blocks (PCIe controllers and UART3) are left ena=
bled without proper configuration.
- [Low] Board-specific power management features (`gpio-poweroff` and `gpio=
-restart`) are explicitly disabled.
- [Low] Unused PCIe link pin configurations conflict with actively used I2C=
2 pins.
--

commit 024b81fdfc4200deef00a8435cf80efa58aed943
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: add Rongda M0 board device tree

This commit adds the device tree for the Rongda M0 mATX motherboard based
on the UltraRISC DP1000 SoC. It configures pin controls, aliases, and
active peripherals like I2C, SPI, UART, and Ethernet.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi =
b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..101b416b10792
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> @@ -0,0 +1,85 @@
[ ... ]
> +	i2c2_pins: i2c2-pins {
> +		pins =3D "PC0", "PC1";
> +		function =3D "func0";
> +		bias-pull-up;
> +		drive-strength =3D <33>;
> +	};
[ ... ]
> +	pciex4a_link_pins: pciex4a-link-pins {
> +		pins =3D "PC0";
> +		function =3D "func1";
> +		bias-pull-down;
> +		drive-strength =3D <33>;
> +	};
> +
> +	pciex4b_link_pins: pciex4b-link-pins {
> +		pins =3D "PC1";
> +		function =3D "func1";
> +		bias-pull-down;
> +		drive-strength =3D <33>;
> +	};

Are these pciex4a_link_pins and pciex4b_link_pins configurations needed?
They appear to use pins PC0 and PC1, which are also mapped to i2c2_pins and
actively assigned to i2c2 below.

Since these PCIe link pin configurations are unused in the board device tree
and conflict with the active I2C pins, could they be removed?

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/ri=
scv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> new file mode 100644
> index 0000000000000..6f72d60ad55e4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> @@ -0,0 +1,111 @@
[ ... ]
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
> +		serial3 =3D &uart3;
> +	};

Is uart3 intended to be active on this board? It is aliased here but does
not appear to be configured with pins or explicitly disabled.

If unused hardware blocks like uart3 or the PCIe controllers are left enabl=
ed
in the generic SoC device tree without being explicitly disabled in the boa=
rd
device tree, could probing them waste resources or expose dangling interfac=
es?

Should unused IP blocks be explicitly marked with status =3D "disabled" in
this board-level device tree?

> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	gpio-poweroff {
> +		compatible =3D "gpio-poweroff";
> +		gpios =3D <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> +		active-delay-ms =3D <100>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	gpio-restart {
> +		compatible =3D "gpio-restart";
> +		gpios =3D <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> +		active-delay =3D <100>;
> +
> +		status =3D "disabled";
> +	};

Should these gpio-poweroff and gpio-restart nodes be included if they are
explicitly disabled?

If the board is physically wired to support these features, could they be
enabled by removing the status lines? If not, does it make sense to omit
these nodes from the board file entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D7
