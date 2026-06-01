Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9775F32B13A;
	Mon,  1 Jun 2026 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348505; cv=none; b=TwgvrLmnBiMnrf74Au5yENxV37qvxU9jq9cAgkw5o4wfQROwhmNfjsGwopLdSQBLttkz14PkvwrU/DSNbKw4tLiffU8s9yWZAsmaHWjgGa/Oq9yIJ/XtnSGTaO/W0yh9evEsNIqIPdbnjjCuzGS1uOH7GMx/b0xrb6gPuIvnzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348505; c=relaxed/simple;
	bh=Rmmc5X/RfTnrr9uXLmrVh9n9LYpoOjqi6pZIZ4XXwzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrqaRZ7nZP8bq3lc1s8gN437bZorgDzc59G//Cve8Kjmp2bj8+mn4cCPxIRwHVGimTR3AO53K/E/QfAMfm1jERLWcgC3+DRjIxrT5qiSo0iGH8lLd0aEDbe5aS7LaiS3nHQLNRKFudqt66NXOWLLqWhIINe9SPjl/aFxcw/UwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BA4h5YQh; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BA4h5YQh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BJ1G+vemrRGwdKUeXbxcpKqRngqC6+BNp4/tuI94jBk=; b=BA4h5YQhUwz7owmB7iwC+pvqkY
	ij5U1JH+egqTqc1rAATfOA/dEsV9O0abmpddoNHLFPd32J7e91PxQdHch3IOmdEzTP5zLpQz8q4o9
	7JwyKli2Yhexlrq0iTNstVXJN59qBCWP0qDyn/d+qTHhRTpM8ueigo6xGQhbN3KBVEQdotw/hshW6
	EA2hPz4jFZ8KzdrBEQpTFgPP+BZ9k/RZNgECOPN8QQbASfhG60JjxybRj3yGa6U6kOV9JNfPga4B6
	eALxOoND+G0KWs+Z+dNJLcRs1zHOZ3XT20sWn+JedVpBMipbALsmtgcdrbsOIOz+V2MMxK6fPFKXm
	KnwuqkpA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject:
 Re: [PATCH v6 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon, 01 Jun 2026 23:14:52 +0200
Message-ID: <9705193.oDFzTOozpa@phil>
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 1. Juni 2026, 18:21:39 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Hrushiraj Gandhi:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
>=20
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:
>=20
>   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
>   - RK806 PMIC providing all SoC power domains
>   - eMMC 5.1 (on-board) and microSD slot
>   - Gigabit Ethernet via RGMII (RTL8211F)
>   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
>   - PCIe 3.0 x4 and two PCIe 2.0 slots
>   - SATA 3.0
>   - USB 2.0 host ports (EHCI/OHCI)
>   - NXP PCA9554 I/O expander for status LEDs
>   - Haoyu HYM8563 RTC
>=20
> Changes since v5:
> - Enabled `i2s5_8ch` and `i2s6_8ch` CPU DAIs to resolve probe deferral is=
sues for `hdmi0_sound` and `hdmi1_sound`.

please don't flood the lists with 6 versions in a single day.
Generally we want 1-2 days betwqeen versions to give people time
to actually review them.

All changelogs contain at least some changes that should have been
caught before sending patches to the lists. So please don't iterate
by sending patches and instead test locally and make sure _everything_
works before sending patches.


Thanks
Heiko



>=20
> Changes since v4:
> - Re-enabled `combphy2_psu` which is a required PHY for `pcie2x1l1`. (It =
was incorrectly removed in v4 during the unused PHY cleanup).
> - Fixed alphabetical sorting of `rk3588-vicharak-axon.dtb` in the Makefil=
e.
>=20
> Changes since v3:
> - Completely removed `sdio_pwrseq` and `wireless-wlan` pinctrl nodes as W=
i-Fi/SDIO was already removed.
> - Removed unused `u2phy0`, `u2phy0_otg`, `u2phy1`, `u2phy1_otg` nodes to =
fix orphaned PHY warnings, since the USB 2.0 host ports utilize `u2phy2` an=
d `u2phy3`.
>=20
> Changes since v2:
> - Split the dt-bindings patch into two separate patches: one for the vend=
or prefix and one for the board binding as requested by Heiko.
> - Removed invalid `enable-gpios` property from HDMI nodes (ignored by dw-=
hdmi-qp binding)
> - Fixed copy-paste error in `rk806_dvs1_null` pinctrl node (gpio_pwrctrl2=
 -> gpio_pwrctrl1)
>=20
> Changes since v1:
> - Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
> - Added binding patches for the board (rockchip.yaml) and vendor (vendor-=
prefixes.yaml)
> - Renamed regulator nodes to the standard `regulator-name` pattern
> - Removed `mem-supply` properties and phandles from cpu nodes (vendor-ker=
nel specific)
> - Fixed pcie20_avdd0v85 vin-supply mismatch
> - Removed obsolete `regulator-compatible` property
> - Removed invalid `regulator-init-microvolt` property
> - Removed dangling `enable-active-high` properties from fixed regulators
> - Cleaned up unneeded i2c3 / es8388 nodes
> - Added missing `vpcie3v3-supply` properties to PCIe nodes
>=20
> Hrushiraj Gandhi (3):
>   dt-bindings: vendor-prefixes: add vicharak
>   dt-bindings: arm: rockchip: add Vicharak Axon board
>   arm64: dts: rockchip: add Vicharak Axon board
>=20
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588-vicharak-axon.dts     | 991 ++++++++++++++++++
>  4 files changed, 999 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
>=20
>=20




