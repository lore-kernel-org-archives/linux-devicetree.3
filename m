Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15A448D19
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918743; cv=none; b=rb4+ErzOAaNO9aFE5eUAhxQKKaqI0XAjKOX528D98Ra1ZH6CaaVS1EmUuygnEQaYYRK8gWaP7cOLfmWBXOMjhYKf2pMKq6mUKKEUCVbDN8e6cRE8oZXPpjTgTWVx8nQA6zde32f/WOHIV1ZYbVfL6/TcoMssADKQPHHd1OEbrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918743; c=relaxed/simple;
	bh=+tAhIfhSVmX3w/RQYLgYH12NNKwud+ebUOxkiW2Th5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NP92bEmB5YrH510fzOwz92Xm8XoA50ksgfxqTei9Zu6mZFqbUxNnJaH5Co7dqqTV5XiuThtBeKcG8iAm1SacfsL5lSTX0tjcn/8R5PKwsw+hPeCnz5zTwtQjM1ynqBwBZy6pVCDo3ldknN2zVBPp2sq26J6xhLmumvTAGe/UG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itYvGKqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itYvGKqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDDA1F000E9;
	Fri, 28 Aug 2026 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787918731;
	bh=BX75IaPasdemQMcxCdNLIYecB/VRYWe16/8imQUNtqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=itYvGKqQhLZGWVL0uoGvLc4apvtmpyuc13yCHB8v51b2/XN2KPwflVdWFAZhnu2hw
	 08a7aB2fJrLYMf6iAhYrL+aNu7ppLjiKJ39u+fhDwMG62yovIP2qgcT8iXDHDzawRU
	 cBwN6RcfjJhbR+siw64o7cnV8hL6m9KSQHUYA6pi+rwE15c8PVvRMep/SJ3iYQxMZF
	 ueiKdjlt5BoZBoUHJ0EgOyDQv0HAFqzSttWEzkFWF1VL3uZRaxMZRF6UnHBGGBBw2K
	 oZaXYnssEK/l9OR3eavVDy0TlTPh+VJDmqtrjG86vYEGxBUlWBQRLq9YO9ilxBOb3O
	 4TZem/n9+/ebA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: tegra: Add cooling device on Jetson AGX
 Thor DevKit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828-tegra264-fan-v2-3-a460389d8ef5@nvidia.com>
References: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
 <20260828-tegra264-fan-v2-3-a460389d8ef5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:05:30 +0000
Message-Id: <20260828120530.EBDDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'pwm@c6a0000' node incorrectly reuses the unit address of th=
e 'i2c9' ('i2c@c6a0000') node defined in the base SoC dtsi, and lacks requi=
red compatible/reg properties.
- [Low] The device tree references an undefined label '&pwm4' in the 'pwms'=
 property of the 'pwm-fan' node, causing a DTC compilation failure.
--

commit 73950943498e73365e307610b1d8975ecc5959a4
Author: Thierry Reding <treding@nvidia.com>

arm64: tegra: Add cooling device on Jetson AGX Thor DevKit

Monitor the TJ thermal zone and use the main PWM fan of the Jetson AGX
Thor Developer Kit to actively cool the device if needed.

[ ... ]
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/=
arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> index 4550e843f513c..dd042e57839a5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi

[Severity: Medium]
Will the pwm@c6a0000 node in this file create a node name collision at unit
address @c6a0000?

Looking at the node definition in this file:

	bus@0 {
		pwm@c6a0000 {
			status =3D "okay";
		};
	};

Could this incorrectly reuse the unit address of the i2c9 (i2c@c6a0000) node
defined in the base SoC dtsi?

Additionally, this node lacks the compatible and reg properties. Will this
prevent the PWM hardware from probing, leaving the newly added fan feature
unconfigured?

> @@ -22,4 +22,56 @@ fan: pwm-fan {
>  		pwms =3D <&pwm4 0 40000>;

[Severity: Low]
Can this undefined label cause a DTC compilation failure?

Since the base tegra264.dtsi does not define a pwm4 label, will this break
the kernel build with a "Reference to non-existent node or label" error
when building the DTB?

>  		#cooling-cells =3D <2>;
>  	};
> +
> +	thermal-zones {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-tegra264-f=
an-v2-0-a460389d8ef5@nvidia.com?part=3D3
