Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057123FF89B
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339178; cv=none; b=bE2MtC91wyfWK/Myx1Vew3qly47Qhm2fMV+0Y2BP91OhInqmmzdfYu8yLhHeD+VutdKn/oBJYhyKliUzbgFJgdWnPiyxZglFZEN66cDkqeNBoU1ejoTM6pK+js+gCs/BDvHzr2KTWgp71DkAV6Faru3MXzMqqPO7K/lDX0NlRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339178; c=relaxed/simple;
	bh=m8yxeNJjemhMJyl5AhN06xSKKvRjGFYgKUtC3e/ib/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tNn/vzVRBHnQjHMa7awZxZhwXNQYXUwhryZtj7tR8luB943/jOKhz+FsUz1rzrC6p1uh5X5fSGVPr02OsEoGKpqJt3GCi8XbZwLxobtd3pmP4WAf8NJb/LYk63NC+HW+tSv9YVU0SiEJ/zKtndPJ3r2qJ6LhdAi+jJo5qcup67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs3AFqX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs3AFqX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567621F000FF;
	Fri, 25 Sep 2026 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339176;
	bh=6gJehVCWL5fLn5aT9am7Voa5ru91oYpFcrJvLTTTkGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gs3AFqX+HSq77shdj2Fxo3vsFgcRwPjWAePnc0UAgOL6cojxTchstLN3nxdPn26ZA
	 8UBIuGRVyXdFxQ3i4b1dNAU/+E8Y1HQOIjWitYto/fc5CgpGt6Mgy0Qryj8+IXuGKA
	 eiMeheeHhiV7SBIk63yR2xrUkmAhONsyMNhvwqQ6ioZymt+9EnslcLfP96W4kl4pO4
	 0jSP2SE1ZDFB1GW2UR70I9bsOX8IqE4NRuRi67gNScKS/uZMnroLHyyWvKrETimJMx
	 o9symKySatGALhZqX3uJkcSEm3a9JkLb7fd2CO1KRQv0piPuqK6sCttCjv2nMLiT3z
	 sESqkKPrCp4fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amin Gattout" <amin.gattout@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
References: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 12:26:15 +0000
Message-Id: <20260925122616.567621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] rk3576: build failure due to missing base DT nodes in cam4k overlay
- [Low] rk3576: naming inconsistency between cam4k overlay and combined DTB=
 target
--

commit 50b2333d6c79fd8c588df575daaa658568d99a74
Author: Amin Gattout <amin.gattout@gmail.com>

arm64: dts: rockchip: add radxa camera 4k on rock 4d

Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
in full mode.

> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index e7936a21c1185..82b2afd420d53 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
[ ... ]
> @@ -311,6 +312,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10-pci=
e1.dtb
>  rk3576-evb1-v10-pcie1-dtbs :=3D rk3576-evb1-v10.dtb \
>  	rk3576-evb1-v10-pcie1.dtbo
> =20
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-rock-4d-radxa-4k-cam.dtb
> +rk3576-rock-4d-radxa-4k-cam-dtbs :=3D rk3576-rock-4d.dtb \
> +	rk3576-rock-4d-radxa-cam4k.dtbo

[Severity: Low]
Could this naming inconsistency cause confusion? The combined DTB target
uses the suffix '4k-cam' while its constituent overlay file uses 'cam4k'.

It deviates from the typical Kbuild naming convention where the combined
target directly reflects its component names.

> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs :=3D rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso=
 b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
> new file mode 100644
> index 0000000000000..613a3e3515003
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
[ ... ]
> +&csi1 {
> +	status =3D "okay";
> +};
> +
> +&csi1_in {
> +	csi1_input: endpoint {
> +		bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes =3D <1 2 3 4>;
> +		link-frequencies =3D /bits/ 64 <445500000>;
> +		remote-endpoint =3D <&imx415_output>;
> +	};
> +};
> +
> +&csi_dphy0 {
> +	status =3D "okay";
> +};
> +
> +&vicap {
> +	status =3D "okay";
> +};
> +
> +&vicap_mmu {
> +	status =3D "okay";
> +};

[Severity: Low]
Will this compile correctly during `make dtbs`?=20

Since the rk3576 SoC camera subsystem has not been upstreamed yet, it seems
fdtoverlay might fail to resolve these base node labels (&csi1, &csi1_in,
&csi_dphy0, &vicap, &vicap_mmu) against the base rk3576-rock-4d.dtb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-rock4d-cam=
4k-v1-1-c9519c794fb3@gmail.com?part=3D1
