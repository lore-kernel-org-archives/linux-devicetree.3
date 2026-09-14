Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF623ACF16
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369406; cv=none; b=Qq/agV6MC2urZRc7pBVt8NoxIQKlNtCtUq0p9LCUgT+NGt6IiZ6Ar+mjVrj6Ta363z+aOjkifC6GkalxCIxmduovtdvTFh2MufbgSddK/WK1A0vMIUSUPl/lqUR0GneYkvVMaToVN95hPhHeH/SOrvf7cxD/14A0raMPcF1pXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369406; c=relaxed/simple;
	bh=11zg8/r+0QBPjLsB5RGonK72IG7VbS3MdP3WKMp3GJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xbcb5qxDwODSv4zl3qWmQ0n/HMBirMcQKH05+vriYi8ee/02R5PSnlJnUx4zvj8SmVycY2Ib4C6cA56J/cYnskBnLUpTSAuNULrSJQu0BuptSFe1pBz0yLLtLysx7OigQZETtBtSJq+DqtDbvUEgrWWmRvPVbHXhnYy9DrV36nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jV6Cx0wl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jV6Cx0wl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96A91F00898;
	Mon, 14 Sep 2026 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789369404;
	bh=MNDEbD3PBiTuILUKpMA0Eunq754Tmd1WKuWEhcycQg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jV6Cx0wl4U1W7/JV8BiOsNeGmbMcyEAsNMHqGn9+LevZQ2fC0VGdFDR3aekpWFB9C
	 1hji7RIlyj6VrAaVQXuXJWszgldGjd7+2Ayd5eju/N9lDRtZ2qLIfr9zDIF47ms2rx
	 9IQQsq4cK/XW0H8niktGM2lYKDkfMPv7nMUcz9Pgt+NEYFP2Fml/Fny/f4+kGuy9yB
	 4BPWbGc0+slxjv64P1j2htKqOQisc8JgY6sNyQmgcTb9TE8H8D7eUV1hpdhiQOp9q4
	 FHnnm1OjGmgawZysX7ImJNBy9GkSGqy6UyIBqQDKO6AE+EOoFePqD/G2tZMbrcK3EA
	 hTfkjtYTIqAeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: st: add imx335/csi/dcmipp nodes on
 stm32mp257f-dk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-stm32mp2-dk-camera-v1-1-2f2bd719bb63@foss.st.com>
References: <20260914-stm32mp2-dk-camera-v1-0-2f2bd719bb63@foss.st.com>
 <20260914-stm32mp2-dk-camera-v1-1-2f2bd719bb63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:03:24 +0000
Message-Id: <20260914070324.A96A91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using a `gpio-hog` to enable the IMX335 power line circumvents t=
he camera driver's runtime power management.
--

commit 933d75b3c84530835787fe0315d18eced64336b3
Author: Alain Volmat <alain.volmat@foss.st.com>

arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk

This commit adds all nodes necessary for the imx335 camera capture via CSI
and DCMIPP on the stm32mp257f discovery board.

> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/=
dts/st/stm32mp257f-dk.dts
> index 8daf3dfd51339..39ad23d95069c 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts

[ ... ]

> @@ -160,6 +205,16 @@ phy1_eth1: ethernet-phy@1 {
>  	};
>  };
> =20
> +&gpiob {
> +	/* Enable the IMX335 power line */
> +	imx335-en-hog {
> +		gpio-hog;

[Severity: Medium]
Does using a gpio-hog to enable the IMX335 power line circumvent the camera
driver's runtime power management?

By permanently asserting the power line upon boot, the IMX335 camera sensor
remains fully powered at all times, preventing the system from reducing pow=
er
draw when the camera is not active. This wastes energy and breaks the expec=
ted
runtime power management.

> +		gpios =3D <11 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "imx335_en";
> +	};
> +};
> =20
>  &i2c2 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-stm32mp2-d=
k-camera-v1-0-2f2bd719bb63@foss.st.com?part=3D1
