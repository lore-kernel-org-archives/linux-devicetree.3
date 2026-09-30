Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE843E49D7
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761578; cv=none; b=DEa/Ww2rbOgmFXN5Kxiz+GE25nt+LX7ev3rb4almXJHgPzdO43RBKYG7ILpqjmFI4oBlph1mKvAzcaIuFPYFHnkfR/8O/03vWbUao0THf1LpccF14clDEeohruNjK5mFNItYxqFo1kcNP/PsXv5oV7aWYo61aOrVOKkTV4iKd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761578; c=relaxed/simple;
	bh=Oivy4cLxL/w6qMPueWUSo76MAxr1OKoxJnOp0J+CJd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j45t2TIl4t8S7zeNoEzn6wBQxlAbduT3H+YUcDcIus6CtEGJRWvlu+KkshuCfAeAqTZ6U+ueGd5BYKqypXMGbOjBsGcLWvmFQLBe2Vlzvu1tcfnvk0kAa9LNTnOtPRQYPYbf3lp1CsMH3KUo36NWY90EwRrCfQBN0SGKy5ahIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMJNjux9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMJNjux9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573E81F000FF;
	Wed, 30 Sep 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790761574;
	bh=E/+8l6X+2yBm12Ji/GHc3YXg/NrEGewdUgFbGgja3os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMJNjux9C+t4gGjlJmb5r0d8Xk+l91BWGyTH8deuMOob0U3x7tNk3RXgg6O5Icere
	 O3ugOpEhRuvcXCubwraC02pCQBrpQWk+DNgCd3OQYD+upezZuUvxl3TLRy8bEIuBLi
	 e0yaWnVLT4tE5Pqctef/OChOFzKmwynEEi3+sZMwzFdOiJELxxTPHdHzgfvIMjKWCR
	 wggZ6D7wFwOaR6INe9SfNrgpqd0POG2WQG8b/9iGwO67sK5vLbYh0xYNs4n6HKO9Dx
	 QGVWLsPJlDMi93J+fcjkJb4SmKyPIRNmgBXBz02/5SSYQIkdvTYEl92PX5G8bKBUfg
	 ToGaYehxucGRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: add Forlinx FET3568-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Yashin" <dmt.yashin@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930-ok3568-c-v1-2-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-2-a0ffd55f5c95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 09:46:13 +0000
Message-Id: <20260930094614.573E81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: missing dt-bindings/leds/common.h include in rk3568-fet3568-c.d=
tsi
--

commit ad3d32e56e87934cf5904354535bfdac90366416
Author: Dmitry Yashin <dmt.yashin@gmail.com>

arm64: dts: rockchip: add Forlinx FET3568-C

This commit adds the device tree source for the Forlinx FET3568-C System on
Module based on the Rockchip RK3568 SoC. It configures the CPU, GPU, I2C,
PMIC, eMMC, and basic LED nodes for the SoM.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
> new file mode 100644
> index 0000000000000..258e7591063fb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "rk3568.dtsi"
> +
> +/ {
> +	compatible =3D "forlinx,fet3568-c", "rockchip,rk3568";

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			default-state =3D "on";
> +			function =3D LED_FUNCTION_HEARTBEAT;

[Severity: Low]
This file uses LED_COLOR_ID_BLUE and LED_FUNCTION_HEARTBEAT but doesn't
include <dt-bindings/leds/common.h>. Could we include the header directly
in this .dtsi file so it is fully self-contained? Relying on parent .dts
files to include it can cause build failures if this file is included by
other boards.

> +			gpios =3D <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&led0_pin>;
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-ok3568-c-v=
1-0-a0ffd55f5c95@gmail.com?part=3D2
