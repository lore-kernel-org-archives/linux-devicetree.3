Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984543305E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418482; cv=none; b=DfYqAGoPf6Q7GKJ0TTSH6b2nJfRl7TBDXPOFOas9Q9annuR3qD0iN4si1dnvIlAG3IJEJl72bQYf2Laizp2szHlWQYPQMmhGjMEvBN1csX+KUSBZW2J3y/lNaOEw9bPmTWxXHCg98Z4Y+6snFI/oH4aDwO3QtzcHWjmFhwotNLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418482; c=relaxed/simple;
	bh=gKj2z8i6J1B8xTOycATiMjT3WkgB1lOZvy6UqkVhNNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AyCVDk+2bGpOaS+tsX307h9+zCMQlOYgZUlbfzpmqreB2Yt7/HInKtuFT0oA2gd2OzEFdCXNnAoY7pFtHMtmoi1FwoaWU8Zcz+upX/yHayiRktgSazOSoI5RgzyEZssI0w1DRQNVLAyuq2z9V7EP9y0HdrMMDBHlH6nwTAsVQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xn0nKVg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xn0nKVg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE3A1F00A3A;
	Thu, 30 Jul 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418480;
	bh=CE3gZh1rFag3oeXaGxtROYgS4NOrxCjHzlskP2y1oc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xn0nKVg2QgJ9mqf/Pa9ypnN3FmtHd3PJ0mXrYoUZUrCjEwp7i33iIeAzwNmfX5v7z
	 dRzO+ClINdlnV0XGvNGiigwIF730b/hjrK6SkMOKfsuuXazGWmiwnjwLASFqBT6BD5
	 TY2vLi1O5SwXmPndLZryoBJXcsmpjIDLTzAEIPRwgDn5gkSrS48gwdrJtsnbNBWyJu
	 MgwFOu3kUmey9ZHU8UZJwTfi5IQPYocHW4kVwIH1JnzO4yUqCJXYwBjnEuUxjA+bLC
	 GJDcXa3gO/vCRwF5je3QLbvLRrxJzPfVrcMcfJizX3I+ezsZLuuLgyH5D9Wtau+gxx
	 zFAEW1mKpMt9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-jaguar-can-v1-1-9b566bd785da@cherry.de>
References: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
 <20260730-jaguar-can-v1-1-9b566bd785da@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:34:39 +0000
Message-Id: <20260730133440.5CE3A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `pinctrl` pin multiplexing configuration for the CAN0 in=
terface.
- [Low] Undefined device tree label `&can0` causing DTC build failure.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jagu=
ar ---
commit 15a700b1846dc901ddd98173bf7c79852fd78bed
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar

This commit enables the CAN0 interface on the RK3588 Jaguar, which is
exposed on the P5 connector on the SBC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-jaguar.dts
> index 41758fe7d3689..ed6c1162bd821 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
[ ... ]
> @@ -195,6 +195,12 @@ vcc5v0_usb: regulator-vcc5v0-usb {
>  	};
>  };
> =20

[Severity: Low]
Does the can0 label exist in the base rk3588.dtsi or its includes? It appea=
rs
this might cause a Device Tree Compiler (DTC) build failure if the label is
undefined in the current tree.

[Severity: Medium]
Will this interface require an explicit pinctrl-0 property to correctly rou=
te
the CAN signals to the physical pins on the P5 connector? Assuming the can0
node is provided by a prerequisite patch, the CAN interface might fail to
communicate physically if the default pin multiplexing doesn't match this
board's routing.

> +&can0 {
> +	assigned-clocks =3D <&cru CLK_CAN0>;
> +	assigned-clock-rates =3D <300000000>;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-jaguar-can=
-v1-0-9b566bd785da@cherry.de?part=3D1
