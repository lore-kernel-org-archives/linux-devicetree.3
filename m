Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5D46D2D9
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 13:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233390; cv=none; b=BVvPLZ+MIwV7ckTW7ieZJfxquUJafX/NG8Imht57HXFOUoRBOWMeg0Xw7jl9ddk/cnodtznJWxMbB3yEfPS2HkhE9DyxsblCoFKWgMJThSK1KMnGerP4vutHp5q3s5N0aPcHpjQVS1fkLWTAjq6E4mfsk8pxxdZiIOJwxJD7P2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233390; c=relaxed/simple;
	bh=yK+wZbXQu/G1gGZ2JimIg/eTq3xFt5d5WNmpUmWAW08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SeT3pU0qag9/+BahCLSCah9MeTOgkjqr7xxMir2c6CzmldcNgbZcgzgRV3On1jfKLSCbkx8rsNSCaFsMRAFt5/d+gunx0RNwDwkmx1ecBSYb9Ov8iv9edTpI7790Va7Tj3nnMoq0//1XZEEaIlghJs/RKPP+WxlYipSLNOI8B/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpcOi8jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpcOi8jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15641F000E9;
	Thu, 20 Aug 2026 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787233386;
	bh=wbWu0iK8SHtXWV/kQkRy9e58oYGnbFoWbbXXHVcAh/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JpcOi8jdGqbKOERZqhkwkTswab1jEDiptivmEVxtlYXrS88V/il718Goin4wq+7iU
	 hAXGO4duqERxfsMsdJJmOFcT5aDqZ3YBWq18s9gx+Uv7HFqMygswUxsv6Id4fqyZj1
	 ERV5TKeQjXEKYscVujRjCDvhxZt9+etV2hNhTM6eFyoxZFiPMAU0f/eAOWPX+9eYN6
	 Z5u7YJMcHgMVNl2LzYfTA14CjJ2kt0nGl1QsAoimCylJFsbqwaJtxPIDJ77gBZhLcK
	 +syJmbWbTIlk+fQigB96fHOyxwB25NO4+/8wJj/iopy/W4aVbovRET7rDeH+hjZQAL
	 rGxURmvnE9qEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Turner" <tturner@lineageos.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820133556.76300-1-tturner@lineageos.org>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820133556.76300-1-tturner@lineageos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:43:05 +0000
Message-Id: <20260820134305.C15641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced compatible string 'samsung,exynos850-mali' is =
not documented in the device tree bindings schema.
--

--- Patch [1]: [PATCH] arm64: dts: exynos850: Add GPU/Mali Bifrost node ---
commit 358cd68635088d124d51d9f2284625ff11e03e28
Author: Thomas Turner <tturner@lineageos.org>

arm64: dts: exynos850: Add GPU/Mali Bifrost node

This commit adds a GPU node for the Exynos850 platform to provide basic GPU
functionality. The panfrost driver can probe the Mali-G52 GPU with core
clocks set up, though advanced power management features are not yet
supported.

> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08d..8ed85c125030a 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -296,6 +296,18 @@ cmu_g3d: clock-controller@11400000 {
>  			clock-names =3D "oscclk", "dout_g3d_switch";
>  		};
> =20
> +		gpu: gpu@11500000 {
> +			compatible =3D "samsung,exynos850-mali", "arm,mali-bifrost";

[Severity: Low]
Is the new compatible string samsung,exynos850-mali documented in the
device tree bindings schema?

It appears this SoC-specific compatible string lacks a corresponding entry =
in
the dt-bindings documentation (e.g.
Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml). This will
likely cause make dtbs_check to emit warnings or fail validation for this
device tree file.

> +			reg =3D <0x11500000 0x5000>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820133556.7630=
0-1-tturner@lineageos.org?part=3D1
