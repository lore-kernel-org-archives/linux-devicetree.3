Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B421ADC7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323906; cv=none; b=TJO6jgq2AdVxBLCNrhXTdlOTUFoki+eRT33v9rd/FREelNu85No2snzDSPCSyhpK7urlA3LvQuGL+UDd9tFcWTdQ400XAaeY0XaKM7PFcSYsgsQIUH6v5nIncEfwuxjP6+e91khFc9+VViH3kARcwzW2fs5aSwgkdO0BL38Q+bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323906; c=relaxed/simple;
	bh=g5QHDfqiN4zNZH6h9j6f6Ni2N5gA7WiUkqcKCRg+WD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ViBVfnR6M2O3aivqM/N03rXlMXa6Ja/ynpNLqRz3b8EdsIHiexGg4b5nzpukCjY1dvqPOkcP5ufCH3oJy2lJd8N7urfNICniLjgb+0PxeLXH9+SNChkjBH1IKfSzKMeh4N0xO72yz5XrFwDld+Dyiit5fhwfLbzhxKljC75aXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEgk7ZaF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEgk7ZaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A7A1F000E9;
	Thu, 21 May 2026 00:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779323902;
	bh=XSyj7iSEX53fk3m8m55UkT9eqygONQ5DQhW8rbl/Lr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XEgk7ZaFr5f05cgWJNEOpq5yITw0HgAPLs//xKe641wYiXoMBn2/q0MrLE4OUWjPK
	 DCQGUxvJtq1TiGyC7LOU2g5n0I79nK6xgzyRuCUOytRFyLlwO7teQ2uBflMECLpOn8
	 1zYR1MeIdc837pLgLwKOMd8U6TgOEH+dqcHZ2h63D9V6M2I26QZOixcYl77RTQN88t
	 I8N9X6SRpl86VSBF0ykqPnkD/2QyhMVUZeQ7Ky+zk7NNNt50SGKb60GDv0P0i+eS/f
	 +6DyLcP9DGMQxGh0HmOT0MSvjbNERSR0yVkNJLUzbu77oT3ZaKC137EDr9bZj2Owd9
	 P/d5KmG0XPkyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] riscv: dts: spacemit: k3: Add pwm support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-04-k3-pwm-dts-v4-1-04d4de0f2fc8@kernel.org>
References: <20260521-04-k3-pwm-dts-v4-1-04d4de0f2fc8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:38:21 +0000
Message-Id: <20260521003822.50A7A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Driver / Hardware Incompatibility: missing bus clock enablement
- [Low] Device Tree Binding Violation
--

commit f7883419536e0a4960f561b1aeeafa28fb5d31cf
Author: Yixun Lan <dlan@kernel.org>

riscv: dts: spacemit: k3: Add pwm support

This commit populates the PWM device tree nodes for the SpacemiT K3 SoC.
It also adds the corresponding pin control configurations to help enable
them in the future.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index e6faf8d8759e1..e331adbcb11a9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
[ ... ]
> @@ -797,6 +797,226 @@ i2c8: i2c@d401d800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pwm0: pwm@d401a000 {
> +			compatible =3D "spacemit,k3-pwm", "marvell,pxa910-pwm";
> +			reg =3D <0x0 0xd401a000 0x0 0x10>;
> +			clocks =3D <&syscon_apbc CLK_APBC_PWM0>,
> +				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
> +			clock-names =3D "func", "bus";
> +			resets =3D <&syscon_apbc RESET_APBC_PWM0>;
> +			#pwm-cells =3D <3>;

[Severity: Low]
Will this trigger make dtbs_check errors?

The newly added PWM nodes use the undocumented spacemit,k3-pwm compatible
string and specify two clocks with clock-names. This appears to violate the
marvell,pxa-pwm.yaml schema which restricts clocks to a single item.

Additionally, it defines #pwm-cells =3D <3>, which is currently only allowed
for spacemit,k1-pwm in the schema.

[Severity: High]
Will accessing this device cause an imprecise external abort or AXI bus han=
g?

The K3 PWM nodes define two clocks (func and bus), but they bind to the
marvell,pxa910-pwm fallback. Looking at the pwm-pxa driver, it only retriev=
es
a single clock via devm_clk_get(dev, NULL) and completely ignores the APB
bus clock.

Because the functional and bus clocks are separate on K3, failing to enable
the bus clock leaves the APB interface gated. Register accesses (such as
writel() in pxa_pwm_config()) will fail when the PWM is first accessed.

Does the driver need to be updated to handle both clocks, or should the bus
clock be managed by a generic PM domain?

> +			status =3D "disabled";
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-04-k3-pwm-=
dts-v4-1-04d4de0f2fc8@kernel.org?part=3D1
