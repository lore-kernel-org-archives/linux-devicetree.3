Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06A421EF8
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419900; cv=none; b=HCvl/btHjIyZFjj8KrEOx9dWLD4C9ce+i/HxliBBZdT/CUCH2lR5LpAO6k7zRQPIJLY11/3ZPTRjmNH+txAjF6SuRympdePjzm/cSChu6jPqC+RrdmiISXi/RwBXNAl9FdyjfBN1Z5K7OPHlmGZy0ER9iEm/mCIMskxBLnthm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419900; c=relaxed/simple;
	bh=u7zgZrTOK2FORMIQTlhXhvs/siao9KMXBgcj2MnCymE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6LXFAtXrjlApGP4y1g/cHiNAd6aQ5AQfA0F41/JSdvoeUO3DIZc/6PvJ4exmni9VgdfwAYZndewbld99We5kB1lPrzNjQWX4463FWJTVIa7PSkuk4QCNDUXcEFB4CHGMlgQoM27qojI0v3ZEKQSJXyzTb0H+VErd5GELW+YDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfX3RAgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfX3RAgV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AD81F000E9;
	Thu, 30 Jul 2026 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419899;
	bh=RpUCZkfzDfbBnWnrPsz15M9lG0Adb2gj1nJrp6lBEwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YfX3RAgVvWTQBa2tlJP1Sqdfua8/Ct4hA/PWoRA9D5x5TouzCppMkwFLo6kZJ2CO/
	 GG8JWwFGj5Jc5vLXqKtElO0qkLGwvXpBSkk/L6YOqeegUpBUwHmJsPO4BBqjf6TLUC
	 30RxPO8cDOGaEs4dZzDhC+56MFGNnLXQAM2Lo+ULn0sq2RXlU0lhJBusF/m9DCmTp/
	 MKbab4k8qoi/GPORULGdMrf4xC2ubxDjnzZTZ6O9wledRPhxtKcVyczLvLAFj0gclo
	 7Kk6WxME9teh9Qrng7nJOE3j/KIh93D4BlooSy/BVmuMvUYWa8xtaUULfFyLKEMzwJ
	 HlpVY8VW7cZgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Axon Lite board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730134815.434654-3-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
 <20260730134815.434654-3-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:58:18 +0000
Message-Id: <20260730135818.B8AD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Explicitly defined UFS regulators are not linked to the UFS host co=
ntroller node.
- [Low] The sdhci (eMMC) node specifies full-pwr-cycle-in-suspend but lacks=
 regulator linkages.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Axon Lite boa=
rd ---
commit 0d3ea17fe4a76d8ba79037c8dbb6e188fec6a23b
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: Add Vicharak Axon Lite board
   =20
Add initial devicetree support for the Vicharak Axon Lite, an RK3576-based
single-board computer. Includes support for eMMC, UFS storage, and other
peripherals.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts b=
/arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts
> new file mode 100644
> index 0000000000000..56b66e9f4fe14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-vicharak-axon-lite.dts

[ ... ]

> +&sdhci {
> +	bus-width =3D <8>;
> +	full-pwr-cycle-in-suspend;

[Severity: Low]
Does this node need vmmc-supply and vqmmc-supply linkages to successfully
perform the requested power cycle?

The sdhci node specifies full-pwr-cycle-in-suspend to instruct the MMC core
to fully power cycle the eMMC card during system suspend and resume. Without
the supply linkages, the subsystem uses dummy regulators and cannot physica=
lly
toggle power to the card.

> +	max-frequency =3D <200000000>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;

[ ... ]

> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0m0_xfer>;
> +	status =3D "okay";
> +};
> +
> +&ufshc {
> +	status =3D "okay";
> +};

[Severity: Low]
Should this node link to the explicit UFS regulators defined earlier in the
device tree?

The board defines regulators for UFS (vcc_1v2_ufs_vccq_s0,
vcc_1v8_ufs_vccq2_s0, and vcc_2v5_ufs_s0), but they are not linked to the
UFS host controller node via vcc-supply, vccq-supply, and vccq2-supply
bindings.

While the device still boots successfully because the defined regulators
are marked regulator-always-on and regulator-boot-on, omitting the linkages
obscures the actual power topology and prevents the driver from managing po=
wer
states dynamically.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730134815.4346=
54-1-hrushirajg23@gmail.com?part=3D2
