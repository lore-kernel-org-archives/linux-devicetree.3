Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993639;
	b=hHNKuxF5B1+N2mw1czfp5MIEefkX1yByL4JXBHP8u8smVCyWctm3BvcTOlq+QHa6qP14
	 RXKW1sinvPUKLzvPseZ33ey7kDTgV6Xz6XDA5q9BCa7waeIxS8hiGErB6zIEDOKB+oR3Q
	 DyDmvzjreh8i4DqMd7yRalHgmgrabCwslzAZ17KKoiuboEVOE/Caut/ZKRH0/nvUYFt+w
	 4pfTqhMbN2i76BMhwj4WHD2F0Dj8wR8nXU7fGLeQ8O8CmlQ4hDDrEVqwqAEv3eWM0Y9YT
	 hPtD9c8xRYDcq44x5g8/wHehuKjU4M/aEo9jbLN+Zripy+++NDU+LqKN7Hl+ppniUAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QzWMkLujLwLkRNonfBtT/pz8dmueWZN87UmDpqx+9mU=;
	b=rLX3s780lGHA6fu9Ca/aEizziVGsZDs7zjT9gQV7FT1TF8Wp70XFPtqYl4HmKB5SgN1u
	 McSBQuJuHd7G3Sw5hcnx3+7xrmsAsXQfYk6z2MPptP+adlUVX8LD9a8s2yo4BZHhIxyLB
	 kLNgb03VzuglxJ5QTZpqtshpJYb0NRf3WuF6tiwiqHz8+mLZsZH/h3T16p8v24vX5GtFb
	 X4Mtx/gFlCJoAvqpTnNBPdDTCX3a1KUJgeWXGeHUFUP2EK5JQuLGj1Illm8XFsr1rZNB0
	 dUjZUzkduJdvYsP8Hyu25afDj+/38y7UyHheZFGk6ayo00eyjwmTovTqcj+cgQgRs/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuMUTa3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD5606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuMUTa3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF4D1F000C5;
	Wed, 18 Nov 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993638;
	bh=QzWMkLujLwLkRNonfBtT/pz8dmueWZN87UmDpqx+9mU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AuMUTa3R+eOEkCzx8zI6AwubN3txos7VzulyDITGEDkB/jy7e9pAsAv8jxsaCuFGC
	 eFPijseUijX7FmwzOPXCKpkyfDpNbk6HS+wSAgv97kWKZHrXd79BmHDmbOalmC710y
	 Alvg3ny3kigubBS5KaLxPEIqvbsZAWSdYvyTY02W0FHanWFsFm+4eAFpG1ybi6vzIk
	 M+VDKtwkjSDOIUYYpyAehjpfJaIgZoCJZFlxFqFOJgOdGZ1szQF+l0qa2d7F4ttnaY
	 /6WQflElOXk4QxolxS4fBTMRK4amIJ6wPQ1QwQhMlFwW3n1uxtheukcxAdaVs5lgm1
	 Ob+C78JvWXBfQ==
Message-ID: <sashiko-outbox-220542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] riscv: dts: spacemit: Enable the FML13V05 EC
 keyboard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-9-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-9-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:20:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] riscv: dts: spacemit: espi0_2_cfg uses bare bias-pull-up
  instead of <0>
--

commit 032746cb10950441af76e89d1f8e24310fb7d057
Author: Wang Yang <yang.wang@deepcomputing.io>

riscv: dts: spacemit: Enable the FML13V05 EC keyboard

This commit enables the eSPI controller and adds the embedded controller
and keyboard matrix node to the DeepComputing FML13V05 board device tree.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index b5d5112de3581..214c8bbb52f06 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2026 DeepComputing (HK) Limited
>   */
> =20
> +#include <dt-bindings/input/input.h>
> +
>  #include "k3.dtsi"
>  #include "k3-pinctrl.dtsi"
> =20
> @@ -29,3 +31,138 @@ &uart0 {
>  	pinctrl-0 =3D <&uart0_0_cfg>;
>  	status =3D "okay";
>  };
> +
> +&espi0 {
> +	pinctrl-0 =3D <&espi0_2_cfg>;

[Severity: Medium]
Does selecting espi0_2_cfg program a strong pull-up on the eSPI pins
instead of the intended normal pull-up?

arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi:
	espi0_2_cfg: espi0-2-cfg {
		espi0-0-pins {
			...
			bias-pull-up;			/* normal pull-up */

Unlike the other normal pull-up groups in k3-pinctrl.dtsi that specify
bias-pull-up =3D <0>, espi0-0-pins omits the cell value.  When no value is
given, parse_fw_cfg() supplies the default argument 1 for
PIN_CONFIG_BIAS_PULL_UP, which causes spacemit_pinconf_generate_config()
in drivers/pinctrl/spacemit/pinctrl-k1.c to set PAD_STRONG_PULL (and
fails dtbs_check against spacemit,k1-pinctrl.yaml, which requires 0 or
1).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D8
