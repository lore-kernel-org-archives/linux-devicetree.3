Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BF3612F3
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843919; cv=none; b=Kc6aeQ7jwJQPhlc37jVJjsO4G1LuA0Dj1H6eIPgOxTXTBMmKgXcBSqs72pK1IizhT+Nwj0kX0jMltUgZXopTCdkIH6WHj8hSh8PImOGs5K5PxxmOzZ8cPOlMYIYDyPkfZNxOZd3Wq5XFx+4/Ax3gpfntEz5rWVniZMuP3iGiJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843919; c=relaxed/simple;
	bh=jsoI4qB5UoqkcaxFChxNdmXl+HZtTqaZ2I58D66j6Jo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DIK32Q2PIE1/x/WGl6IPx45JBXjr7bYc+jNgOQU2Wbej3X87asun2n7YTVF3c6/1GNvZbKwLP+UyydrOeOo6kGgfoB4I9ABLcbSp1uiNpFQ5VE/5tLETF0SsYomSLdnGKBuj2MyQ3+7HGDJyfFTv9TgTQfK0tQ/8YHHB1ZJ5jCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwP5buPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwP5buPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314E91F00A3D;
	Thu, 27 Aug 2026 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843916;
	bh=OHrW6R88LfWn4IVdrseAnIFYAfRXrkwzS1/tw9hFIQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PwP5buPdXVkBQajZ2vajhcWgbV6sQiY4xDFra8onpOiiu035SVQviBszOZlxj5Its
	 y3yeTtytYLC12VBqah9UR4FzjCgTTKI8MQ9kKTOIjv/2UZAHmiFfq9Au6k0TfVeWqK
	 GkJUjekmF4Yk0sM1CkLVUrgPMCLB7Lzth/qpAAlvYAzcmpcMtd5EG+2xTXxf8Qnh97
	 xrQzqY24YdPNXFVGS6on/e7APx4MiLo/nIMrqXVifNPSYUk1fHzRFfAxjFnrESpu3k
	 s49I1Lqjw64rbhZhFjtlpeC/h8gEbUwaZ1YIImqgDE30RWLridpKJ9/t07R1F6nRS7
	 xTtIraibj9WPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: tegra: Add PWM fan on Jetson AGX Orin DevKit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-tegra264-fan-v1-1-3c55f0c748b1@nvidia.com>
References: <20260827-tegra264-fan-v1-0-3c55f0c748b1@nvidia.com>
 <20260827-tegra264-fan-v1-1-3c55f0c748b1@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:18:35 +0000
Message-Id: <20260827151836.314E91F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces a platform mismatch by modifying the device=
 tree for the Jetson AGX Thor (Tegra264) while the commit message targets t=
he Jetson AGX Orin (Tegra234). This causes a fatal Device Tree compilation =
error because the `&pwm4` phandle is not defined in the Tegra264 base tree.=
 Additionally, it maps a PWM node at `0xc6a0000`, which collides with the e=
xisting `i2c9` controller's MMIO region in Tegra264.
--

commit 5abc2fdc061c1ce5d90cefc286641978583847de
Author: Thierry Reding <treding@nvidia.com>

arm64: tegra: Add PWM fan on Jetson AGX Orin DevKit

This commit adds a PWM fan device node to actively control the PWM,
preventing the fan from either stopping or running at full speed during boo=
t.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/=
arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> index 45f8df9bbfd62..4550e843f513c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
> @@ -9,4 +9,17 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	bus@0 {
> +		pwm@c6a0000 {

[Severity: Medium]
The commit message targets the Jetson AGX Orin (Tegra234) platform, but this
patch modifies the device tree for the Jetson AGX Thor (Tegra264) in
arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi.

Does this unit address assignment correctly overlay the bus@0/pwm@c6a0000 n=
ode?
In the Tegra264 platform, the 0xc6a0000 address is already allocated to the
i2c9 controller (i2c@c6a0000), which creates an MMIO region collision.

> +			status =3D "okay";
> +		};
> +	};
> +
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		cooling-levels =3D <77 102 140 192 255>;
> +		pwms =3D <&pwm4 0 40000>;

[Severity: Medium]
Will this compile when building the device tree for the Tegra264 platform
with make dtbs?

The &pwm4 phandle used here in the pwm-fan node is not defined in the Tegra=
264
base device tree. Referencing an undefined label causes a Device Tree Compi=
ler
(dtc) abort.

> +		#cooling-cells =3D <2>;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-tegra264-f=
an-v1-0-3c55f0c748b1@nvidia.com?part=3D1
