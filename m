Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57574417BC3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376349; cv=none; b=TrWef2xjWzJtICTQf6kQFga4emeNucwTw7wQSuHb4JesgcUzVQxZz1BBo2SLdHoqD0Cb6vsZxcubgBFtA/Zux0xChvwrAFaezak9A2lP2CgOjAH/78C+VWcRHaR9D9LDJcJFLxqPUaLaQJgEKHyBaF6mLTk9HK8EkX1sFXIOESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376349; c=relaxed/simple;
	bh=g6znYCCn3/yoIa4DdoJwc9F7KKna78UvWYBm5/Hagk4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ngjZIA724c8JZEepbgbe7oyBhd5dzT1iO3XCP44baslsvtc2JPRGJJ8gNfr73vp7Fqd1KbV5fq2X3jQpMCg4KCl3txxoLrxLBoee/O0ISq248WofOCtkIfBCM+sHIOOeioV2wAsFU53XKgyzIhm/SGanx7I3xypSE2QOPGUhKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=MRCLqk/l; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="MRCLqk/l"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g6znYCCn3/yoIa4DdoJwc9F7KKna78UvWYBm5/Hagk4=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789376339; v=1; x=1789981139;
 b=MRCLqk/ltyx2C0g5pRAKsZtm0iJXn9FdB5sUR+T1MnXCemAG26tqvbnbbddaf9RktEnzOt9X
 TSLxHSlYVsVIjbLYi5uXv6WKgVq0AKwacGgwccAXFTttdo0UPTHO8QEQKpmoBx1lXyZLeG5px5v
 kknGEyoBsgSXy6p8rGUpCJrMsqagq6RD/75wJU1tzuDqorV13kb47SteqvdSmhnZh7tE26U7xty
 DjohuNK0lmEYta8feJoc4bXJtTZTY2xT5ZO1a76AT7oRcL7AFMad1522r1nPPaaiyAw18PBhtO/
 0/534V5NzQwNmzkHbYfFB92CgWxPXN7/PnVsACG+tMzqA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b1d13efd5afab658;
	Mon, 14 Sep 2026 08:58:49 +0000
X-Mizu-Trace-ID: b1d13efd5afab658
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:58:44 +0200
Message-Id: <DLEWYVCME40R.L2IMBIU3ILG1@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>, "Jonas Karlman" <jonas@kwiboo.se>,
 "jensen" <jensenhuang@friendlyarm.com>, "Andrey Korshunov"
 <razor1702@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/4] arm64: dts: rockchip: Add FriendlyElec NanoPi
 R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <HystericalDragons@proton.me>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
In-Reply-To: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>

On Mon Sep 14, 2026 at 10:24 AM CEST, =E5=AE=89=E5=AE=B9 via B4 Relay wrote=
:
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC:
>
>   https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S
>
> It is closely related to the already supported NanoPi Zero2, sharing
> most of its power tree and peripheral routing. Patch 2 therefore moves
> the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
> top of it. The split leaves the NanoPi Zero2 dtb unchanged; I verified
> this by comparing the node and property sets of the dtb before and after
> the split, which differ only in node order and phandle numbering. Patch
> 4 is a coding style cleanup in the shared devicetree and the NanoPi
> Zero2 devicetree.
>
> The devicetree was derived from the vendor tree:
>
>   https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a3=
17436e2357df01af8268ce7
>
> but with many changes to make it suitable for mainline.
>
> Tested on a metal-case unit without the optional onboard eMMC: boots
> from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
> registers, and all three LEDs are functional. The USB Type-C connector
> registers as a DWC3 UDC in peripheral mode; gadget enumeration against
> a USB host was not completed, because that connector is also the 5V
> input and a PC port cannot power the board.
>
> The bootloader was U-Boot 2026.07 with a board specific R28S target,
> which releases the RGMII PHY reset before Linux starts, so the reset
> description in the PHY node is all the kernel needs.
>
> Two things I did not do, because my hardware cannot verify them:
>
> - The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
>   only the SDIO controller is described.
> - The eMMC is described as HS200 rather than the vendor's HS400 with
>   enhanced strobe, since the board at hand has an unpopulated eMMC
>   footprint and the faster modes could not be verified.
>
> ---
> Changes in v5:
> - Dropped the pinctrl-0 before pinctrl-names reordering from the coding
>   style patch and used the order the rest of the rockchip devicetrees
>   use, pinctrl-names first, in the new devicetree as well. The strict
>   mode of scripts/dtc/dt-check-style asks for the alphabetical order,
>   but it does so for many other properties that no rockchip devicetree
>   sorts that way either (Chukun Pan).

Then you can also just drop patch 4 as (by far) most rockchip devicetrees
do not have a blank line before ``status =3D <okay>;``

> - Moved the SYS LED, which the NanoPi R28S shares with the NanoPi Zero2,
>   and the led1 and led_sys pin configurations into rk3528-nanopi.dtsi.
>   Both boards now only add their own LEDs to &leds (Chukun Pan).
> - Renamed the NanoPi R28S LED nodes to led-1 and led-2, to use the
>   led-[0-9] node naming (Chukun Pan).
> - Changed the user button from KEY_RESTART to BTN_1. It is a general
>   purpose button on this board, not a reset button (Chukun Pan).
> - Link to v4: https://patch.msgid.link/20260911-r28s-upstream-v4-0-fb6c85=
f226d4@proton.me
>
> Changes in v4:
> - Dropped the patch that moved the NanoPi Zero2 RGMII PHY reset to the
>   MDIO bus. GPIO4_C2 resets the PHY, not the bus, so describing it on
>   &mdio1 is not a description of the hardware. It would also break
>   Ethernet in U-Boot, which reads reset-gpios, reset-assert-us and
>   reset-deassert-us from the PHY node and has no support for a bus
>   level reset. The nanopi-zero2-rk3528 U-Boot target releases the PHY
>   reset before Linux starts; the failure I reported was seen with the
>   generic-rk3528 target, which carries no board devicetree. Pointed out
>   by Chukun Pan, and by Jonas Karlman in the same discussion for the
>   HINLINK H28K:
>   https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwibo=
o.se/
>   My own R28S has in fact been running a board specific U-Boot target
>   all along, with the PHY node description this series now keeps, so
>   the reset ordering problem I described does not arise there.
> - Reworded the coding style patch to state the coding style violation
>   itself as the reason, rather than the tool that found it (Diederik de
>   Haas).
> - Link to v3: https://patch.msgid.link/20260909-r28s-upstream-v3-0-ee3e1a=
34a353@proton.me
>
> Changes in v3:
> - New patch 1: describe the NanoPi Zero2 RGMII PHY reset on the MDIO
>   bus rather than in the PHY node, so that it is applied before the PHY
>   ID is read. A PHY held in reset by the bootloader was otherwise never
>   probed, leaving the port dead. Reported by Andrey Korshunov, who
>   proposed the deprecated snps,reset-gpio properties on the MAC; the
>   bus level reset-gpios in mdio.yaml fixes the same ordering without a
>   deprecated property.
> - New patch 5: follow the DTS coding style in the three NanoPi RK3528
>   devicetrees, as found by scripts/dtc/dt-check-style --mode=3Dstrict:
>   pinctrl-0 before pinctrl-names, and a blank line before status.
>   Suggested by Diederik de Haas.
> - Picked up Conor Dooley's Acked-by on the binding.
> - Link to v2: https://patch.msgid.link/20260907-r28s-upstream-v2-0-21ab57=
0fc91c@proton.me
>
> Changes in v2:
> - Split the parts shared with the NanoPi Zero2 into a new
>   rk3528-nanopi.dtsi (new patch 2). The NanoPi Zero2 dtb is unchanged.
> - Name the pinctrl labels after the nets in the schematic: usr_btn,
>   led1, led2, led_sys, pwr_wf and pcie_eth_perstb.
> - Rename the button node to button-user and its label to "USER".
> - Link to v1: https://patch.msgid.link/20260905-r28s-upstream-v1-0-f68d53=
89269a@proton.me
>
> ---
> =E5=AE=89=E5=AE=B9 (4):
>       dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
>       arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
>       arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R2=
8S
>       arm64: dts: rockchip: Follow the DTS coding style in the NanoPi RK3=
528 devicetrees
>
>  .../devicetree/bindings/arm/rockchip.yaml          |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 127 +++++++++
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 306 +--------------=
-----
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 314 +++++++++++++++=
++++++
>  5 files changed, 456 insertions(+), 297 deletions(-)
> ---
> base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
> change-id: 20260905-r28s-upstream-e212e27d6165
>
> Best regards,
> -- =20
> =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


