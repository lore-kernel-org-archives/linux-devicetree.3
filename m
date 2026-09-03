Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F943B4B6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433721; cv=none; b=PwODQnYdndvGtSSz4mC8oearN6dwlBSi6q9HfEoyNhJiU3gsQYohr/tJXKhzQg3bCnuvwTW8rbAlDxkitggT2ybgVEFSRbn3fKc1bd2w6BOtUpKyKBO/8B3ytbp+VMFgMTy1K7XQh97iyJtiLww+XchNaXxIUUNU3igVS9oRFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433721; c=relaxed/simple;
	bh=+Skie+Ctzy/vwJso7w0xQxXsPtTldkh/pbc0+XR7nWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oZx1BRZ/tO/X6UzAGQ3vn5bUjXtuoa8HMQxtfaBS3gdrrpPx5aqTc2Nx+bxEE/rRZyFCQI9IvN0PsIJBd/9Y+sKsOPlQKlGko5wcecCmGXcZ0ZoHNzMHFzIvpIpfqvUGda0F7UqjPLv94ZAOCKw/5Q4OM42twv6BHPffT0h0BEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNsDiZAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNsDiZAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FE91F000E9;
	Thu,  3 Sep 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433720;
	bh=w643/YGZpy4UOGEWIzkNqKfuM5fKPqs0Qm/lDoZCrWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KNsDiZACPv7ArkZiOf6m9dQF+NMpup2LiHqefzGxbRWCEhf2POwkvipy4MhJIfVe/
	 u4iTMAkM1SF63foYTGXIRDlBcb/Q0uC0bcf0SvGzjfeIhRoffANk51EBxcLW8w2U8y
	 +x2EyMn//epBX5a7GpvcNX3NOIi5n5tl2qxtKk/3JipsnDyeRZ37Bqwb8ChBcSjFO5
	 u+uiB6ZGrTsryGViizSpbkOspIbprcBOb4Y3NBWAI513N+kNFo5NkeBUpWlPJ8ASCp
	 44PqEYxx1tEEPBIixuDC+QRUlClmi/xBv7S/7USlu0ygPEIsb8IWoTfAAYNFHXvcnQ
	 9JD7CZje2MnFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: msx4: describe the I2C5 mux tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ender Hsieh" <andhsieh@nvidia.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903105956.1709114-1-andhsieh@nvidia.com>
References: <20260903105956.1709114-1-andhsieh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:08:39 +0000
Message-Id: <20260903110839.B3FE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using an exclusive `reset-gpios` on a single multiplexer to contro=
l a shared hardware reset line causes dangerous out-of-band resets and I2C =
bus corruption.
--

commit 39e083fdd7c46105075bf4c6a524145f3ff70845
Author: Ender Hsieh <andhsieh@nvidia.com>

ARM: dts: aspeed: msx4: describe the I2C5 mux tree

This commit describes the I2C5 multiplexer topology on the MSX4 BMC, explic=
itly
mapping out four PCA9548 8-channel muxes and downstream PCA9546 4-channel
muxes. It also defines aliases to ensure stable bus numbering and assigns an
exclusive reset GPIO to the first mux to allow driver recovery.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts b/ar=
ch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
> index 29f56176e2cae..a9a491a873129 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts
[ ... ]
> @@ -151,6 +200,364 @@ eeprom@51 {
> =20
>  &i2c5 {
>  	status =3D "okay";
> +
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		i2c-mux-idle-disconnect;
> +		/*
> +		 * The reset is described on this mux alone. The driver claims
> +		 * the line exclusively, and this node is probed before the
> +		 * others on the bus.
> +		 */
> +		reset-gpios =3D <&gpio0 ASPEED_GPIO(S, 2) GPIO_ACTIVE_LOW>;

[Severity: High]
Does assigning an exclusive reset-gpios to a single multiplexer to control a
shared hardware reset line risk out-of-band resets and I2C bus corruption?

If i2c-mux@70 defers probe (for example, while waiting for the GPIO
controller) or is manually unbound via sysfs, sibling muxes like i2c-mux@71
could probe successfully because they lack the reset-gpios property. Their
downstream devices might then begin active transactions.

If i2c-mux@70 probes later and toggles the shared reset line, could this
disrupt the state of the active sibling muxes and wedge the I2C bus if a
downstream device holds SDA low because a read was interrupted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903105956.1709=
114-1-andhsieh@nvidia.com?part=3D1
