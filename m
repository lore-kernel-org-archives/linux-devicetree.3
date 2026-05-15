Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462D43636A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843812; cv=none; b=lhWJ/UiWQB1ONRdM2S0u46+HmfzpgNzKIBeBYX1SVUfaXIbhwLFcvnlNGxIGkZbj8ROMm26upH2iNqgJ06wSc2uClXusMQYxMUZOAXxnEB+mkkUBS2O2vZL3b+KRlDf6N9NJEfmWwpP385CD0/e8rXFUQ0giZsRKFy9gWXKxa5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843812; c=relaxed/simple;
	bh=0GSl6TXiKeOZ+ISWobDlgILWREv8/jFaMnr9fGapMe4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYOZHJIhIFagme+QHkl8hvANy41gGU6PkvUEae51IUGKjhr5aM7o4vmhDa+E2F9cFevY+wIrxpC2a+vDD7dWWTnKhQr+z5/VDw32jHrmIq2EOVVvmpvOjEdXROnv/G3bLqvW9aG1c3AUmVp0NeOAeAr0zt1816qDoGhjug+W0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZum67e9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZum67e9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B8C2BCB0;
	Fri, 15 May 2026 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843812;
	bh=0GSl6TXiKeOZ+ISWobDlgILWREv8/jFaMnr9fGapMe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lZum67e9ekcWwi85mFRr1Z0fZ/XQ05LfDnVbA6FBZJHGik4X7Cstp4lCPiEFAqAA/
	 i84PrdUnsksfzmJs2ekGXEIcjNSkbcd4P5bl/b6lcEdUwQjBuHxOAI22G7lpvluojP
	 t18HFBUhqxzyyCFw1SwCCmfhczQ8wvpmzAfhja6E7+NnFqJmYC2MDGbfNubpNlCJuH
	 K+cI2w9m6FUWkrcDm/sU1yW64IrK/Lk2HzUpHgpv+0BTALXyihC3aMdGJnkTmY+hHk
	 WUmHOm4zoGkQ19ZxBhQPWB37puQ9KucR+EKFR7ZD73y7/nMhe+K9/p3VMjafKANrrw
	 kaP0/SyRZt4+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/11] mfd: sec: add support for S2MU005 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-s2mu005-pmic-v6-4-1979106992d4@disroot.org>
References: <20260515-s2mu005-pmic-v6-4-1979106992d4@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:16:51 +0000
Message-Id: <20260515111652.4E1B8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect register access in sec_pmic_dump_rev() due to missing PM=
IC ID handling.
- [High] Missing interrupt acknowledgment for S2MU005 due to ack_base evalu=
ating to 0.
- [Medium] Mismatch between commit message description and actual implement=
ation of IRQ chips.
--

commit ffec6859a51e25188ffb07502f3e1c81cbef3517
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

mfd: sec: add support for S2MU005 PMIC

This commit adds initial driver support for the Samsung S2MU005 PMIC,
mapping its charger, MUIC, and LED sub-devices and initializing its
interrupts.

> S2MU005's interrupt registers can be properly divided into three regmap
> IRQ chips, one each for the charger, flash LEDs, and the MUIC.
>=20
> Add initial support for S2MU005 in the PMIC driver, along with it's three
> interrupt chips.

Is this description accurate regarding the three IRQ chips?

Looking at the implementation in sec-irq.c, there is only a single monolith=
ic
regmap_irq_chip defined for the S2MU005 (s2mu005_irq_chip), which uses the
get_irq_reg callback to multiplex the disjoint register ranges.

Also, this isn't a bug, but there is a typo in the second paragraph ("it's"
instead of "its").

> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index bd8b5f9686892..ad1c7de83a620 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c

[ ... ]

> @@ -250,6 +262,10 @@ int sec_pmic_probe(struct device *dev, int device_ty=
pe, unsigned int irq,
>  		sec_devs =3D s2mpu05_devs;
>  		num_sec_devs =3D ARRAY_SIZE(s2mpu05_devs);
>  		break;
> +	case S2MU005:
> +		sec_devs =3D s2mu005_devs;
> +		num_sec_devs =3D ARRAY_SIZE(s2mu005_devs);
> +		break;
>  	default:
>  		return dev_err_probe(sec_pmic->dev, -EINVAL,

Could this cause unexpected behavior when reading the chip revision?

Later in sec_pmic_probe(), sec_pmic_dump_rev() is called, which
unconditionally reads S2MPS11_REG_ID (0x00) for unhandled device types.
For S2MU005, the register at 0x00 is actually S2MU005_REG_CHGR_INT1.

Does reading this interrupt register outside of an IRQ context clear pending
hardware interrupts and cause the driver to lose initial state events?

I note that this regression was fixed later in the patch series by commit
f26ef88e98392 ("mfd: sec: resolve PMIC revision in S2MU005").

> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 133188391f7c2..91a2922463fb6 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c

[ ... ]

> @@ -337,6 +397,17 @@ static const struct regmap_irq_chip s2mpu05_irq_chip=
 =3D {
>  	.ack_base =3D S2MPU05_REG_INT1,
>  };
> =20
> +static const struct regmap_irq_chip s2mu005_irq_chip =3D {
> +	.name =3D "s2mu005",
> +	.irqs =3D s2mu005_irqs,
> +	.num_irqs =3D ARRAY_SIZE(s2mu005_irqs),
> +	.num_regs =3D 4,
> +	.status_base =3D S2MU005_REG_CHGR_INT1,
> +	.mask_base =3D S2MU005_REG_CHGR_INT1M,
> +	.ack_base =3D S2MU005_REG_CHGR_INT1,
> +	.get_irq_reg =3D s2mu005_irq_get_reg,
> +};

Could this configuration bypass the interrupt acknowledgment phase?

Because S2MU005_REG_CHGR_INT1 is the first element in enum s2mu005_reg, it
evaluates to 0.

Looking at the regmap_irq framework, it executes:

    if (chip->ack_base || chip->use_ack)

Since ack_base is 0 and use_ack is omitted (defaulting to false), will the
framework fail to acknowledge level-triggered PMIC interrupts, leaving the
hardware asserting the IRQ line constantly and potentially resulting in an
unhandled interrupt storm?

Would explicitly adding .use_ack =3D true to the irq_chip configuration saf=
ely
resolve this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-s2mu005-pm=
ic-v6-0-1979106992d4@disroot.org?part=3D4
