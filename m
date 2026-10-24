Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792835002;
	b=KMRjx7bb4yv17n8lsPg3ovEeHu3tQbtY6BmR7jV9NG/SmnVhVns4FfPgoHpAhbJ4LUd1
	 zRxTjdWkYwAqUGqATTJeRH96WVMO5QeOFGWFdgOvI9Y46hsBSFbNtGaUJ7pc5GuhbtpEX
	 pvNjXmdmDlbC+KA8Z+GFB9CJ7H51v2Iu6nqeOxNi1ON1TC61oUE6tY7qWk6R845k1rnPu
	 MAwUbF5DuHhlGwDdl4ySGWsCBq8IVqoXRtJE09+ibqxt38CUlyquwAFjAZwnXDz/j1gUB
	 JfPUh1bY2npwiGBQhEDQA+kE/6cMtZSd6dah2+S9sFtUjdzLPdjASjnGmdSdH4Eo1Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792835002;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A7azV5uLU4FMr+J4e+zMGdB823xNGjMoVPnugt2NTrc=;
	b=oKX+IBykOOIiLV0JduX8ZPsqpuheCyk6etXl0CrSYUSxyvdawBX13Fn5LUQKk/2tHB8Q
	 VYjLyH0daXkgJPYDWt77TQj8ckGjHWD9bhPOS2e+6vkrL6uKFQYplWy+FNeVMXnBHslcw
	 Y/ABLZkzaFVwDAl3ii9qF3/4e653Q246LQHoDgcZHHV0RlyfTarHNwEolehL+w1QADKlq
	 o4ENR5Z4X7UTetmYDKtUWUL3c926qINjrbDuMlwKc85IdilwAkCinAFW2AcWeSK4HKknh
	 3Q7unxJ0djZrGRpz50AKIWzWyYl5MDBfTX1g5qFVp5zGhPAC0ZUNTiChs6L48Bf8+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrC6469w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57576606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrC6469w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E3D1F01825;
	Sat, 24 Oct 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792835002;
	bh=A7azV5uLU4FMr+J4e+zMGdB823xNGjMoVPnugt2NTrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrC6469wXzpe3eVonRTojs1Pwkx+otj4/OWG8RvtWe2Ht2OCuIl82I2lxCRBqsgIT
	 QG+NmqCDZBs+D4n14m+ByTZ1eC70qlebBLwwRNvrhuCQkCDjDfdFDcx4wCBAwWj0Q9
	 BBx42ZNOi/wYobJK/28o5va//f0aC0Av3xjSD8/QQ3N52MSJ4WeJoidvK9EXRYonfV
	 bx0nnqlqMPGePrkxzDGgewrv/qwAkjI75KpShhN0kkJmxvAkV84Nu/dKRN7Bnq+LGL
	 f5XrATUWD/gZhopldmMHG6FUB/vAWJckLCwFIZIFqPdp7Qov9iD2PEb30iL6V64jc8
	 cTk+NK5PDDXAA==
Message-ID: <sashiko-outbox-183627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024-ultrarisc-dts-v6-5-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
 <20261024-ultrarisc-dts-v6-5-c62994d8a114@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:43:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] riscv: dts: ultrarisc: duplicate unit-address in dp1000.dtsi plic n=
ode name
--

commit 65da27c69d1760ac79d94c2145794b0d0a24ad1f
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000

This commit adds the initial base device tree for the UltraRISC DP1000 SoC,
describing the eight CP100 CPU cores, cache hierarchy, and core peripherals.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 0000000000000..f8f29df1801f4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,865 @@

[ ... ]

> +	soc {
> +		compatible =3D "simple-bus";
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;

[ ... ]

> +		plic: interrupt-controller@9000000@9000000 {
> +			compatible =3D "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> +			reg =3D <0x0 0x9000000 0x0 0x4000000>;

[Severity: Low]
Should the plic node name be interrupt-controller@9000000 instead of
interrupt-controller@9000000@9000000?

The duplicated @9000000 suffix causes dtc to fail compilation in
scripts/dtc/checks.c:check_node_name_format() when building any board
device tree that includes dp1000.dtsi:

    if (strchr(get_unitname(node), '@'))
        FAIL(c, dti, node, "multiple '@' characters in node name");

It also causes check_simple_bus_reg() and dtbs_check validation to fail
because the unit-address does not match the reg property address.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-ultrarisc-=
dts-v6-0-c62994d8a114@ultrarisc.com?part=3D5
