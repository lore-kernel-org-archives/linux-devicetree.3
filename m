Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E5331EA2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138163; cv=none; b=I7m47xij1ojSyoqC5X40+QqNE2JSIiqb4qXP71Fj5BT9Kc8dYiYnehGE1gL9Z2Xsi3EhQIqdhxtq3w0pIIQpRMWX127OP5TC51NZV4jiRanAAZT1O83xWCa1tFsJrJwdZRzmWEHYEf0qf1uGYIzgRzGqP3XMv88ypf0Nh1fQJaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138163; c=relaxed/simple;
	bh=/+cZe71OM6QQonn6owxArqASNTi+WrkzMr1fAXwBfV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TzZlWwbDxH7miUseaZNuwGzjM5Ug1simI3NqrisBbY/N6el099qErs4WAl68IyIyMW9F+5OzvPsaTgDUWILCI/RZCb9rucZtpNihHHquBgE3yIrTeYQymGbj8Or7lBUjHDcLhlvPOurf5R7QzaeUg9pHGAxwMK9WB2/luiwMFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA8Zh3pv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA8Zh3pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59651F000E9;
	Mon, 27 Jul 2026 07:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138160;
	bh=hu8GgUaIAS8YzVAUMHw0AyqCwTy+3kT1Cy74cm/E+fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TA8Zh3pv5EC8KS/HEMPwaBeNYLclp8f5Gi7F/76vLQTfq4Yn/Ge3Im/cG9+VYn3uw
	 i2Q8hsrDmMpXrl/9YBnj96WnnJm9TKj46i43GRxda9V+nqod0kwNjR1BRUU1ANgy7Z
	 V0BJ0q5UE0eCU4xkslvQ/yooNsde301WArufzlcNnVCoeQkKg8bwMK4uRovCslM//J
	 F4Jb74PkcisVHtVdQh0hqDWQ+fggRncBW/rrzbD5/YJ9yrnrU0+QSgck/IK01D2uNk
	 5eEWWB10eGvrBlJI5rpEyKQlipdNXyRK9pr7GadKg0fUofYPZhGH1yaC8VGZ9jOroG
	 NvWjhQefrx+qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1dac6b9ae1565a2265e87537141e46c988d16de3.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
 <1dac6b9ae1565a2265e87537141e46c988d16de3.1785135437.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:42:40 +0000
Message-Id: <20260727074240.B59651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The `pcie_kcs4` device tree node is missing the `clocks` property.

Pre-existing issues:
- [High] The `kcs_bmc_aspeed` driver accesses hardware registers without re=
questing or enabling the required clock.
--

--- Patch [2]: [PATCH v3 2/2] ARM: dts: aspeed-g6: add pcie-kcs4 ---
commit 206a33dca85271dba16c0470168b764c592b52a0
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

ARM: dts: aspeed-g6: add pcie-kcs4

This commit adds the pcie_kcs4 node to the LPC bus in the ast2600 g6
common dtsi. It enables a KCS-compatible interface exposed over PCIe
for IPMI communication with the host.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi

[ ... ]

> @@ -656,6 +656,14 @@ ibt: ibt@140 {
>  					clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>  					status =3D "disabled";
>  				};
> +
> +				pcie_kcs4: kcs@914 {
> +					compatible =3D "aspeed,ast2600-kcs-bmc";
> +					reg =3D <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
> +					interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Should this node include a clocks property? Neighboring KCS nodes include=20
clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;. Leaving this out could result i=
n=20
an incomplete hardware description in the device tree.

[Severity: High]
This is a pre-existing issue, but does the kcs_bmc_aspeed driver need
to request and enable the required LCLK before accessing these registers?

When aspeed_kcs_probe() in drivers/char/ipmi/kcs_bmc_aspeed.c is called,
it issues regmap writes to the LPC controller registers via=20
aspeed_kcs_set_address():

drivers/char/ipmi/kcs_bmc_aspeed.c:aspeed_kcs_probe() {
        ...
        rc =3D aspeed_kcs_set_address(kcs_bmc, addrs, nr_addrs);
        if (rc)
                return rc;

        /* Host to BMC IRQ */
        rc =3D aspeed_kcs_config_downstream_irq(kcs_bmc, pdev);
        ...
}

If the bootloader leaves the ASPEED_CLK_GATE_LCLK disabled, or if the clock
framework dynamically disables unused clocks, accessing these registers
without enabling the clock might cause a synchronous external abort or
system hang.

> +
> +					status =3D "disabled";
> +				};
>  			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785135437.gi=
t.gregoire.layet@9elements.com?part=3D2
