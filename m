Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA313B83FC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912728; cv=none; b=Bskqi0yeSGJYvRP8CrxCGqfvxajzRaHp15T4kj86raCw7DEFAAZmmThckcjZ6+DMCy6I/rFHC0EXll9zvkF0koDD1LWSk+a3Pp6muwJA6n84kZ7Gm2U7TzpXXvQrVtgVwp3Etf9lqeh8F3JTKLJ8VDRqpZ+pq/0F89J3fcB2tPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912728; c=relaxed/simple;
	bh=6GS24k9EhBxgc6wpwENKioGXT2q89VYCgYNAye5Mcmw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rjtW0t8Itg0rCaQ3ac97GqiUdEjUBseWDLM9MmDu81AghCVQ2o1bStE1bqCoMy05EkHvMjrt8XwtgnUW57HNP5Nqnhkf7NF4T/OzJUQ+PEu5HY7fr4hR/BVOZJJNpwr2XVzjvX79NZ0oFluuKm/E1Uzjq28Ri+4qcYZZJcqQ72I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNLJMg+w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNLJMg+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFF61F00893;
	Mon,  8 Jun 2026 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780912726;
	bh=GyHyz1eRPLke+BO3FyV0drOiBdYU7EMl59gW94ctkFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNLJMg+wgAtHU2kAnSf6udAtfeJ9VAry5oXlhdMXw72zJkgSm2C9x+7efLqp7OJHv
	 WzU4mK3oqa0+JjdMaHdOC+8cK1FrsG25N7lAx1c1IlXz+lM+x4XrJZ+EYDPdXPyUd8
	 FBZtPWLd5ZTv1+iZquRLsrv8VQrKUQ3k6I8n0/96hLlKXuIowyPjy4CeXqFME7JbQ2
	 vr0SKuqD7LRKb9eKTy2zHxbYtEyg+hU/MDIUsp3FOY8lBPJ2cAc3g4NaDvVoIIL2Xi
	 gIulL0bo9a+W09yGjxPoJIxT4iPb5oDr1jItVaAWX/QXqL+Nem4yP2TzXPgpaZV0X2
	 tftkxCmRhBSjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: tegra238: add missing AON pin
 groups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prathamesh Shete" <pshete@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608094122.1245189-1-pshete@nvidia.com>
References: <20260608094122.1245189-1-pshete@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 09:58:46 +0000
Message-Id: <20260608095846.9DFF61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added drive groups are completely unsorted, directly cont=
radicting the explicit ordering constraint defined in the YAML comment.
--

commit 5b9124b6ede7db6d75188db397f7ab63141b1fc6
Author: Prathamesh Shete <pshete@nvidia.com>

dt-bindings: pinctrl: tegra238: add missing AON pin groups

Add 24 pin groups, and their matching drive groups, on ports EE, FF,
GG and HH to the Tegra238 AON pinmux binding. These groups are present
on the AON pin controller, so device trees that mux these pins through
it validate against the schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pi=
nmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-p=
inmux-aon.yaml
> index ab9264d87c88e..2b2e1a82880e0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-ao=
n.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-ao=
n.yaml
> @@ -38,8 +38,16 @@ patternProperties:
[ ... ]
> -                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE)
> +                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE, PFF=
, PGG, PHH)
>                      drive_bootv_ctl_n_paa0, drive_soc_gpio00_paa1,
>                      drive_vcomp_alert_paa2, drive_pwm1_paa3,
[ ... ]
> @@ -53,7 +61,19 @@ patternProperties:
>                      drive_gen8_i2c_sda_pdd2, drive_touch_clk_pdd3,
>                      drive_dmic1_clk_pdd4, drive_dmic1_dat_pdd5,
>                      drive_soc_gpio19_pdd6, drive_pwm2_pdd7,
> -                    drive_pwm3_pee0, drive_pwm7_pee1 ]
> +                    drive_pwm3_pee0, drive_pwm7_pee1,
> +                    drive_soc_gpio49_pee2, drive_soc_gpio50_pee4,
> +                    drive_soc_gpio82_pee3, drive_soc_gpio71_pff2,
> +                    drive_soc_gpio76_pff7, drive_soc_gpio74_pff5,
> +                    drive_soc_gpio86_phh3, drive_soc_gpio72_pff3,

[Severity: Low]
Does this order violate the comment preceding the drive groups?

The comment explicitly specifies that the drive groups should be ordered by
port (PAA, PBB, PCC, PDD, PEE, PFF, PGG, PHH).

However, the newly added drive groups appear to be jumbled and not ordered
by port. For example, drive_soc_gpio86_phh3 appears before
drive_soc_gpio72_pff3, and drive_soc_gpio76_pff7 appears before
drive_soc_gpio74_pff5.

Should these be sorted sequentially by port to match the documented
formatting constraint?

> +                    drive_soc_gpio77_pgg0, drive_soc_gpio80_pff6,
> +                    drive_soc_gpio84_pgg1, drive_soc_gpio83_pee5,
> +                    drive_soc_gpio73_pff4, drive_soc_gpio70_pff1,
> +                    drive_soc_gpio85_pgg6, drive_soc_gpio69_pff0,
> +                    drive_uart5_tx_pgg7, drive_uart5_rx_phh0,
> +                    drive_uart2_tx_pgg2, drive_uart2_rx_pgg3,
> +                    drive_uart2_cts_pgg5, drive_uart2_rts_pgg4,
> +                    drive_uart5_cts_phh2, drive_uart5_rts_phh1 ]
> =20
>  required:
>    - compatible

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608094122.1245=
189-1-pshete@nvidia.com?part=3D1
