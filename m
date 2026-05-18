Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BEA3FBEAD
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105992; cv=none; b=ssFYUM+zeuhs+/OWSy0chqAhBuTzMX5XWDe1dqiaPDCqxWd7g6FTtGMJQAwxHgHluTEnFM+kOh2ovsqeEKiRv5WO4b8HmrIVG1RIfwTaeiU20eEebJ/ke3SyTyzQRaqWqrG9BK9tLhtWJu/id3xGTzRo9GckZw5dbon8omkKVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105992; c=relaxed/simple;
	bh=crDGdPDPEw7MAKhN2S5SCV9IoXqEybejBgA+5NIizOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oLXATn53ysq2emgqvdAvFnkeQnmFvHpyCVcfpFglCa1uGhOhVb6kTXU0TKwI5l+mtOAlw/og0t7qCDiWyNQinfseTqxEwSUaB6bypFOYYGX5v8BPwol95rkU3U2I03czJm8FAPy7Ql20/YJbtj4SVFWWdSCFEYz1mR/6WgvPTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbz7sOSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbz7sOSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D96C2BCB7;
	Mon, 18 May 2026 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105991;
	bh=crDGdPDPEw7MAKhN2S5SCV9IoXqEybejBgA+5NIizOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kbz7sOSuEwigpZuWohgTjcMP0PJaSW7ZdkO1RIatGKSSl9I0DOBYLF19XGiGJGabp
	 RMu9yCatwNNJVwQs92LaLRn5zzeX4B8uWxEL6U6Rvm0g/wony/0JlfxLBnp9ChhIAA
	 BCp7nAJfCDvjgFBBNlaH5wCA/YQeMKXy/oiR+Y9qO+Fl/+7pNs/kGDW9lgxuCZ3XTB
	 UCtFoz7Hcj4uE5ZuWrkYehf7d6GCPeGGMpnCqwGl93TqE3caSNdTIP5LXde+oiLqaS
	 gfoZ6BpegcrQM+4/nFdyfIgNtixqCBNeCV+5cDMM/sh+dtByQKoN4fnv+7z7baeTNH
	 gjeskXKuNdJsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add pwm support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-04-k3-pwm-dts-v2-1-c0ccba430abf@kernel.org>
References: <20260518-04-k3-pwm-dts-v2-1-c0ccba430abf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:06:30 +0000
Message-Id: <20260518120631.67D96C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver ignores the `bus` clock, which will lead to a system ha=
ng when accessing registers.
- [Medium] DT binding violation due to undocumented compatible string and p=
roperty constraints.
- [Low] Copy-paste errors in pinctrl sub-node names.
--

commit 4d46fb2ab333b7a733df38e29f0f7c7d23523cee
Author: Yixun Lan <dlan@kernel.org>

riscv: dts: spacemit: k3: Add pwm support
   =20
This patch populates all PWM device tree nodes for the SpacemiT K3 SoC. It
also adds the corresponding pinctrl configurations to easily enable them.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 23899d3f308a0..06abca6d08832 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
[ ... ]
> +	/omit-if-no-ref/
> +	pwm1_1_cfg: pwm1-1-cfg {
> +		pwm0-0-pins {
> +			pinmux =3D <K3_PADCONF(43, 6)>;	/* pwm1 */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <25>;
> +		};
> +	};

This isn't a bug, but it looks like there might be a copy-paste error here.
Should this sub-node be named pwm1-1-pins instead of pwm0-0-pins? This
pattern also appears in other blocks like pwm1_2_cfg and pwm6_1_cfg.

[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index e6faf8d8759e1..e331adbcb11a9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
[ ... ]
> +		pwm0: pwm@d401a000 {
> +			compatible =3D "spacemit,k3-pwm", "marvell,pxa910-pwm";
> +			reg =3D <0x0 0xd401a000 0x0 0x10>;
> +			clocks =3D <&syscon_apbc CLK_APBC_PWM0>,
> +				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
> +			clock-names =3D "func", "bus";
> +			resets =3D <&syscon_apbc RESET_APBC_PWM0>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};

Will this cause make dtbs_check to fail?

The existing schema in marvell,pxa-pwm.yaml restricts clocks to a single
item, forbids clock-names entirely, and enforces #pwm-cells: 1 unless the
compatible is spacemit,k1-pwm. Are there missing schema updates for
spacemit,k3-pwm to allow these new properties?

Could this also lead to a system hang when accessing registers?

The device tree declares two clocks, but the driver in drivers/pwm/pwm-pxa.c
uses devm_clk_get(dev, NULL), which fetches only the first clock.=20

Since the bus clock is never requested or enabled by the driver, won't it
be gated when the clock framework runs clk_disable_unused()? Accessing the
PWM controller's MMIO registers while the APB bus clock is gated usually
triggers a synchronous external abort.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-04-k3-pwm-=
dts-v2-1-c0ccba430abf@kernel.org?part=3D1
