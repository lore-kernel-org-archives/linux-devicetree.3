Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA63F4114
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778810570; cv=none; b=aCaDkyPt+Th7nJSGTm48Dczcy2k1mv9U0CIfQtEr1x1D+LiRym7FDU8Rg1Ox8CkWJAf/7omK5I1wpxYX0bXh3dPDqmsySig74BFqgyGjiCLKdsVTS3BvavD1hsR3w3jrT12MdA67wH/9IVv553KszWl314k23k9L8FC8mqpTiE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778810570; c=relaxed/simple;
	bh=265QdGngPkuZ/8o2U5P13nxEsdtGCEqeZgdkMqEZ9ds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OSdjTHygLMn5L0BuQfq8otGk9uoBUwPexbXHN6AUyNC3yHvI2+XNZnG3GuaKt/OXU9ZRj/gNbfPfuYRzG8+SA6a7wcrSbsiNGxzsio6NcyoNJkbqUIl1+/6BLDkcvk/ibzNKye2K9E4K1CTLbuN6bcRpQvj/Pl/bEqVhP+/O3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6Cvx9Hv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6Cvx9Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE16C2BCB3;
	Fri, 15 May 2026 02:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778810569;
	bh=265QdGngPkuZ/8o2U5P13nxEsdtGCEqeZgdkMqEZ9ds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H6Cvx9HvLkL0UnzISihKZdaPynYq6MMHDrzm0EYwO2yaPWFcH2CGQF+ghRSvTqAhM
	 TuT2CmVkppkymZM9d/bnwW+TWxWWJSDYkiIpCb5P99YYgNFFNJHIhz79PG9ZcvRUuP
	 HcOS80JSOMEwUjKovYczaSWj0sOiSAxDzXiAodroof5jOsPFyN/PdBGVEKYl1xzXIh
	 Xtq9MakW6Y6I4nMoWXO6Qn/ze1ChiUswrBHrba5appbDdD3WsVxqQqlvKd/WZMK9oq
	 HLNhG8IRSFjYu6O4o7+1yrW8Z0D1EYwybrqBL090whieL6AchqX5Yrb00z0SwMhkQe
	 77uhGDvc9OQmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:02:49 +0000
Message-Id: <20260515020249.AAE16C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The `gpio-ranges` property values in `gpio_b`, `gpio_c`, and `gpio=
_d` incorrectly specify a local GPIO base that exceeds the available pins.
- [High] PCI I/O space is incorrectly mapped 1:1 to a high CPU address, bre=
aking legacy PCI endpoints.
- [High] The Ethernet node incorrectly defines a broadcast MAC address as i=
ts local unicast MAC address.
- [Medium] Mismatch between CPU node unit addresses and their `reg` propert=
ies.
- [Medium] Ethernet compatible strings are listed in the wrong order.
- [Low] Clock node names contain underscores instead of hyphens.
--

commit f5aec289ca4daa2ae7f4c27bac4b1694ece4043b
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000

Add the base device tree for the UltraRISC DP1000 SoC. It describes the
8=C3=97CP100 CPU cores and essential SoC peripherals including the interrupt
controller, pinctrl, GPIO, UART, SPI, I2C, PCIe, GMAC and the DMA
controller.

Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb=
5@ultrarisc.com/
Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e=
274@ultrarisc.com/

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 0000000000000..1aae53fc1a2b1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,851 @@
[ ... ]
> +		cpu4: cpu@4 {
> +			compatible =3D "ultrarisc,cp100", "riscv";
> +			reg =3D <0x10>;

Does the unit address in the node name here correctly match the first
address specified in its reg property?

The Devicetree Specification mandates that the hexadecimal value after the @
must exactly match the reg value to avoid parser errors and dtc compiler
warnings. Should these be renamed to cpu@10, cpu@11, cpu@12, and cpu@13?

[ ... ]
> +	clocks {
> +		device_clk: device_clk {

Is it intended to use underscores in these clock node names?

Device tree naming conventions generally require node names to use hyphens
instead of underscores (e.g., device-clk) to avoid triggering strict
character warnings.

[ ... ]
> +			gpio_b: gpio-port@1 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				reg =3D <1>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <8>;
> +				gpio-ranges =3D <&pmx0 16 0 8>;

Will operations on local GPIOs 0-7 have a valid pinmux mapping with this
configuration?

The gpio-ranges property uses the format <pinctrl_phandle gpio_base
pinctrl_base count>. By specifying a local gpio_base of 16 for a port with
only 8 pins, it seems gpiolib will fail to configure pins 0-7 correctly.

Should this be inverted to <&pmx0 0 16 8> to map local GPIOs 0-7 to
pinctrl pins 16-23? This appears to be similarly configured for gpio_c and
gpio_d as well.

[ ... ]
> +		pcie_x16: pcie@21000000 {
> +			compatible =3D "ultrarisc,dp1000-pcie";
> +			reg =3D <0x0 0x21000000 0x0 0x01000000>,
> +			      <0x0 0x4fff0000 0x0 0x00010000>;
> +			reg-names =3D "dbi", "config";
> +			ranges =3D <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x0040000=
0>,

Can legacy PCI endpoints and HBAs that only decode 16-bit I/O addresses
successfully initialize with this mapping?

The ranges property maps the CPU MMIO address 0x4fbf0000 directly to the
PCI bus I/O address 0x4fbf0000 (indicated by the 0x81000000 bitfield).
Would it be better to map the CPU MMIO region to a PCI bus I/O address of 0
instead?

[ ... ]
> +		ethernet: ethernet@38000000 {
> +			compatible =3D "snps,dwmac", "snps,dwmac-5.10a";

Could the OS prematurely bind to the generic driver before applying
hardware-specific driver quirks with this ordering? Device tree bindings
typically require the compatible array to be ordered from most specific to
least specific.

> +			reg =3D <0x00 0x38000000 0x00 0x1000000>;
> +			clocks =3D <&csr_clk>;
> +			clock-names =3D "stmmaceth";
> +			interrupt-parent =3D <&plic>;
> +			interrupts =3D <84>;
> +			interrupt-names =3D "macirq";
> +			local-mac-address =3D [ff ff ff ff ff ff];

Will the network driver initialize with an invalid broadcast MAC address if
the bootloader does not dynamically overwrite this value?

Using a broadcast address as a source MAC violates IEEE 802.3 standards,
and upstream network switches may drop packets sent by this interface.
Should this be omitted or zeroed out as a placeholder?

> +			max-speed =3D <1000>;
> +			phy-mode =3D "rgmii-id";
> +			snps,txpbl =3D <8>;
> +			snps,rxpbl =3D <8>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D5
