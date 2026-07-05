Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084503815DB
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260060; cv=none; b=Hj1pWa3Q08dkjliwizJROc/z64Mu/bcwPD4+Ysr6ypFaRYvFsL/fedGb7RdlqqavGqXU6JtIu2EHk1ceWRseLk6GqhCzqcLyhW4yosLO8gs4xpPBItaMfBwkiGjSG2LugaBlfxIc0YICpcqzoZD0l2E08Fov69kCNO6pHLjKrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260060; c=relaxed/simple;
	bh=k14XuxHIxj+omGG5Ik0+Ij5ld0x8B24ZiWi3QN2r9mM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BcRuATSamfgdiuFRy3KmooBp/Ix9u3AZ1JFnvWt7pORDUAbzJ9JQwhfiYw49Zt3xaz09Nl4K9cyeuO/vG4pcBAHDitmb2fjlT5t1x2Z+GJFtq9QzjoXCkCVZiaxXi67bVkX+4XJfqQaNv7DpdKoul7o1ayyPmOM96KuNw2p+O4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbvwUkJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbvwUkJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D43E1F000E9;
	Sun,  5 Jul 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783260058;
	bh=4VZNzfJU0IyxySdYvJ5boZijibGScPpmE+AX5GSBPh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gbvwUkJWv6+H1ZSOc/I4XtldRH7MN52MkYCG85ohvwAHahim8qBzgYHbo5ZU5ctH8
	 bTKcngpnnGpxYa5ME6CXm2neLP7rrY4Ch2oqXcsLus8npbVsy+5DWnsiq8BGo0xSj0
	 4/3Cg82QqQEwTnt7VeJXgmCKxOr5BuapCZzwcbeNFr1b+VYqRFzXZ145RshlFILCwR
	 QqCzprxKSJXm3qX5MvL9nKtX7zFEp1to1Xjkt5ldnKIkb7IZ/CtGs9I3pYb6x3L9cn
	 SpAUBfUJwTGkvGzLS+CCJSoAEfup9UzU9GaXhKTOKJuS9oM85R7/yBoqhYKRoQKMKa
	 TDhUXQXy8bXHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: LemonFan-maker <2254650260@qq.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 14:00:58 +0000
Message-Id: <20260705140058.8D43E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Contradiction between physical PCB RX delay and RGMII PHY mode s=
etting, risking Gigabit Ethernet instability.
--

commit a30ca0bb9560e6ed7ecdf88333f509d579374640
Author: LemonFan-maker <2254650260@qq.com>

arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

This commit adds basic device tree support for the EmbedFire LubanCat 4,
a single board computer based on the Rockchip RK3588S SoC. The enabled
peripherals allow the board to boot via serial, eMMC, or SD card, and
provide networking over Gigabit Ethernet.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> new file mode 100644
> index 0000000000000..f8c78df4a14ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts

[ ... ]

> +&gmac1 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy1>;
> +	/* The board has 1.5ns delays on RX lines; TX delay is provided by the =
MAC. */
> +	phy-mode =3D "rgmii-rxid";

[Severity: Medium]
Is this phy-mode setting correct given the board's physical delay?

The comment states the board already provides 1.5ns of physical delay on the
RX lines. However, setting phy-mode to "rgmii-rxid" explicitly instructs the
PHY to add its own internal RX delay (typically ~2.0ns).

A total RX delay of ~3.5ns within a 4ns RGMII data window might shift the
clock edge out of the safe sampling region, which can cause packet loss
or link failure at Gigabit speeds.

Could you clarify if the comment about the board is outdated, or if a
different phy-mode (like "rgmii" or "rgmii-txid") was intended here?

> +	pinctrl-0 =3D <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names =3D "default";
> +	tx_delay =3D <0x1b>;
> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705135014.1004=
166-1-2254650260@qq.com?part=3D2
