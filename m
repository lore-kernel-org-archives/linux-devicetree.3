Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E8388378
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757612; cv=none; b=ZKimStDLTLmH9W906dfcbn+E1DLvSpB29Ok6oQmNxJPSvQ/qmtrJQZd4ZyJITTMsMBGjvWSnxr5ZHo491AOAPFU0JIp2RbdS8FOI87uQEblR0gWIuf/ULC0e9wRFW7qilLJppdpqzExic1+4JXk2yZ4vxOUM53IruuHEkE4q0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757612; c=relaxed/simple;
	bh=kzyDvkFK6iGGFDC1FAl8RBsY+mQ/Oy+KX9lIz6WoJ6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aH/i+kJZKgmEM4qTQqGzL9Re533mmL4R2Ayx9/75o9h9HWwQIhNYnaCEYBP/sZvnDxrgezL0kcoed7Orfuc1BrAVkuAX/C6Rus7VOmHe2NRZ8LhUA1tMRDY32HNG1xwuAC5VFvdDPoAsVQzMq+SwpL2ZK6D2udl/pbLoaW1Iccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLiON2Yz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLiON2Yz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D0C2BCB3;
	Thu, 14 May 2026 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757612;
	bh=kzyDvkFK6iGGFDC1FAl8RBsY+mQ/Oy+KX9lIz6WoJ6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BLiON2YzagGRV/Td8VDHDl4UrThXjyuxtZqV1nrzyACcJ0t4dOxs0MlzOz+ncm18Q
	 LEnIjnqJoanGVt9Q/oVApyte9w19sp/bYl3lzg99JX3G3P5T0w6aaYX6QGfFFxdE26
	 Q7tuqPakaPni7byBPfapv6J/o2r7mTTzcQUUmTkZHn7zjJ73HK9/87Ghtm94YLfGv3
	 xxkRJcOsUI9qe+PioW9/o8EE9fw9vnDa9kqIzfem+tYTCuUGvuuappIMEGqqntRwPH
	 KVePweMdFsq57y8UNnKvl3b5ozZND8Q4/xQJNe7pHb8LarTdhXBklmrwiLlHVwXJDP
	 Uo0pwW2UsBuRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513210942.692269-1-s-jain1@ti.com>
References: <20260513210942.692269-1-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:20:11 +0000
Message-Id: <20260514112012.0B0D0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing pinmux configurations for the DSS DPI interface.
- [High] Hardware IRQ routing mismatch for the HDMI bridge.
- [Medium] DSI display nodes are left disabled on the EVM.
--

commit 83fc36958520450910c6fa0df0ef01548f3f6fd9
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: k3-am62l: Enable HDMI & DSI display

This commit adds DSS, DPHY, and DSI nodes to the base SoC devicetree,
along with enabling DSS and an HDMI bridge in the board devicetree.

>     arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
>    =20
>     Enable DSS, DSI and HDMI related nodes and pinmuxes.

Are these descriptions accurate for the actual changes in the patch?

The dsi0 and dphy_tx0 nodes are added with status =3D "disabled" in the base
dtsi, but they are not overridden with status =3D "okay" in the board-level
dts file, leaving the DSI subsystem physically disabled on the board.

Also, it appears the patch does not add any pinctrl properties or pin
configurations for the DSS node. The DSS DPI interface relies on a parallel
bus that must be physically routed to the sii9022 external HDMI bridge to
function.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62l3-evm.dts
> index a1af4571a815d..7462921e21804 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
[ ... ]
> @@ -192,6 +204,36 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
> =20
> +	sii9022: bridge-hdmi@3b {
> +		compatible =3D "sil,sii9022";
> +		reg =3D <0x3b>;
> +		interrupt-parent =3D <&exp1>;
> +		interrupts =3D <16 IRQ_TYPE_EDGE_FALLING>;

Does this interrupt routing match the hardware configuration?

Checking the gpio-line-names array defined for exp1 in k3-am62l3-evm.dts
reveals that index 16 is an unconnected pin (""), while the actual HDMI
interrupt line ("HDMI_INTn") is explicitly mapped to index 20. This could
prevent the HDMI bridge from receiving hotplug detect and EDID events.

> +		#sound-dai-cells =3D <0>;
> +		sil,i2s-data-lanes =3D < 0 >;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513210942.6922=
69-1-s-jain1@ti.com?part=3D1
