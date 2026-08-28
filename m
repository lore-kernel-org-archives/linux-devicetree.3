Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30E3D3D0C
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918638; cv=none; b=UciJtkYwOwYCdthM8/UakuqbMJJ3TJK0LrVoZr4hv6bjasFjNKSQK911B6laEPKqgkO6U0YYZ/f3Cy/p2F71pN9TZQpWbKYpzgh7Bxt2bx9Q5paOYPRauLfWua4O+iRt/i9OD50V+lGorvnkAQnqiUpg/JjeqQbsbjZNpzvtIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918638; c=relaxed/simple;
	bh=wURO0pk0COUFf3KjhYGql7qqr5jh0NjN4A0RKHwFxWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LVLv/PRjRC5oPAf4WYJoorbulrWsL9EBWiSOJRtHdz4s9gbRb+feTZzgtaEyFiGMo3uv4RGD5WR+NyNdvRvnzRjvivlJT79klPWJqKEB974lPHC/pmrtI5Uvvc7Z7Qm7+Q8aMqQYDyxUEFYm24/o9B/qznTjiXrgH9lV3/ffmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmmj+1z7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmmj+1z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C3F1F000E9;
	Fri, 28 Aug 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787918629;
	bh=6vUj2bqvfmV3uPdOQ7vdyxXWfLgvn3AxohLEWLDvthI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wmmj+1z70ThaQ+RVh/NRsUs91VSQbnl7RpWSNER9vcJytoX3bW706dWry4TPpCbUI
	 w5TIiqVXJH069sC+Tjj/DWiX0/M5mGYZ74JbJ3g1EkHPnLP4wdAbTVpFGKfpFJSYKu
	 DtGEBHeIusDtCi2jHMiAyDda4Kqdmgxg01/ZHpwleL1pmMa5byAOQM7dmWZ8ndlc9v
	 CxQRuB8auyCdzTLbTCnBy+9BjElVH/1Rt9PbxTVUrIwtG6OqV85NHrUPmc9mAQH6fX
	 VxyNDd+uB3O7MKghMj+eZaBk11bV4uEqB45DVynQ8EH9WL4d52S26YtjtsMF2IbxLs
	 h4njn2Mg/mq3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: tegra: Add PWM fan on Jetson AGX Thor
 DevKit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-tegra264-fan-v2-1-a460389d8ef5@nvidia.com>
References: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
 <20260828-tegra264-fan-v2-1-a460389d8ef5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 12:03:48 +0000
Message-Id: <20260828120349.08C3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete `pwm@c6a0000` node and unit address collision
- [Low] Missing phandle `&pwm4` causes a fatal DTC build error
--

commit 896b2e4dbdcbabef8cf82b66c7dcabdbec8e9800
Author: Thierry Reding <treding@nvidia.com>

arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit

Add a PWM fan device node to actively control the PWM, preventing it from
stopping or running at full speed during boot when the controller's clock
is turned off.

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
> +			status =3D "okay";
> +		};

[Severity: Medium]
Will this node fail to bind the PWM driver? Because the base tegra264.dtsi
does not define this node, it lacks essential properties like compatible,
reg, and #pwm-cells.

Also, does this cause a unit-address collision warning? The base tree alrea=
dy
defines i2c9: i2c@c6a0000 at the exact same address:

arch/arm64/boot/dts/nvidia/tegra264.dtsi:bus@0 {
	...
	i2c9: i2c@c6a0000 {
		compatible =3D "nvidia,tegra264-i2c";
	...
}

> +	};
> +
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		cooling-levels =3D <77 102 140 192 255>;
> +		pwms =3D <&pwm4 0 40000>;

[Severity: Low]
Does this cause a fatal DTC build error? The label &pwm4 is unresolved
because it is referenced but never defined in tegra264.dtsi or any included
file, resulting in a 'label or path not found' syntax error.

> +		#cooling-cells =3D <2>;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-tegra264-f=
an-v2-0-a460389d8ef5@nvidia.com?part=3D1
