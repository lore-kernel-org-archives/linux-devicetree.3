Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9964D6C3F
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606966; cv=none; b=Zv6ZulNEOb1dhDAvZ9ziKGq3COMHhRKAaz5jqwnq7WYYB8fLFP22fkfC4C3pGJc6rt0HbPBSaQT+mRlMvz+JSb0QK5mApam6BlahZnDYTXQiDOVIKAKqF423/Im5TURSORsQ/RWG1H/PGB33KDu6GpwXGDuielWgaSqgVv/eZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606966; c=relaxed/simple;
	bh=59oKfqDJu4UTzymLfhhjkAKWAp1F0nJpwZ/QgV5jcRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i3E10vsUWEJn7ogwBk2zXU7pMMvRShSU7OA5cVNBTtLRSsUXxo/MZmnOckaRhRLVTacNFU7RdbT5SiKE0w4Yzad6cSZJ8Ok2bYbq1AqPYwRKDBs6zQK0pf/0ZllIsLS8WF9tQiJ+QeE4PYXiaJI1qM8RvaiAUvGnhkMLaG0PiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caC9g4re; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caC9g4re"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888A61F000FF;
	Mon, 28 Sep 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606964;
	bh=322e4Ud5th78Xp+ttkVYbIPyHwxvPBmSAL8qEoITRIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=caC9g4reUEp1A3AnsytNAPbW/YS8rrwaLeRJ3o4Sr8CyJackP/iBxK4Y06JrvBfPi
	 Izegi4z1AhQrGXpUshE9Wjann7t0YBEX7KJaN1+9yC/PqvSpp6vF9Thj2D05UvFoV5
	 PvqmS10DdIaoBLOH5v41AnUP+PJkbeEHzMZMPXCsIGpCD4RwHvWqiWuX/jjv8Cycbf
	 M+JOFAxoHZhzA3hlhCqEqHlW/4BIlr4wXS7sOLsf0OnQ7WayEGo1Kw0MDfEH2bJPVt
	 l1aiNBmsN3mLA/lLaRfToAUeHaaC2bpxnxEzkUdlO5+7r6nMH4X9Meh3c1yYbuq1Qz
	 ug09cB153KRYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot:
 add dsi panel dt overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260928-rzg2-sr-boards-v9-7-5901e0fc9e44@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-7-5901e0fc9e44@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:49:24 +0000
Message-Id: <20260928144924.888A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: workaround for driver bug via incorrect GPIO polarity
--

commit 6728207701dcae1710f79cd19dde291399712ed9
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add dsi panel dt overlay

This commit adds a device tree overlay for the Winstar WJ70N3TYJHMNG0 1024x=
600
DSI panel used on the SolidRun HummingBoard IIoT. The overlay is enabled in=
 the
build system for multiple RZ SoMs.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-ds=
i-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot=
-panel-dsi-WJ70N3TYJHMNG0.dtso
> new file mode 100644
> index 0000000000000..f8584c473fafe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-panel-dsi-WJ70N=
3TYJHMNG0.dtso
[ ... ]
> +&dsi {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	panel@0 {
> +		/* This is a Winstar panel, but the ronbo panel uses same controls. */
> +		compatible =3D "ronbo,rb070d30";
> +		reg =3D <0>;
> +		/* reset is active-low but driver inverts it internally */
> +		reset-gpios =3D <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this overlay rely on a workaround for a driver bug by specifying an
incorrect GPIO polarity?

The comment explicitly notes that the physical hardware reset is active-low,
but it is described as active-high (GPIO_ACTIVE_HIGH) here in panel@0. Devi=
ce
trees should accurately describe the physical hardware rather than software
configurations or driver bugs.

If the underlying ronbo,rb070d30 driver is eventually fixed to handle
standard gpiod semantics correctly, won't this hardcoded polarity break the
overlay?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rzg2-sr-bo=
ards-v9-0-5901e0fc9e44@solid-run.com?part=3D7
