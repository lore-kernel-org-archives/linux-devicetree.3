Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F226B08F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778310444; cv=none; b=eKwDyUWsuODYPa4FfI7zGGzvWcu+wfxiBXlgI0OMH+iVkjs/MZ4ENhSmkjiZVdcfItx8g5mrkURTJutEDJ4xjOj1Izzh6qaFo+cAcNudFYYR3tfgwipkjlNJoZjcB521QYUqANV5+dWDKxe9odeyBfNcHPz/86ASq/ZcXx00GOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778310444; c=relaxed/simple;
	bh=Y8svnOmPBdsCg6BShN1LcJIbLNiohOhJoqdCu/4wOYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kBy/oBtgnBZqyzU6N3HLgR3W/TIpvFqdP2yMlX8Sjlfj8ZiNicqqx5dr0pyWhvFymYuXtNo9rZ3tyaocuPiLkPz+cdMlMlmrLPhZJeyv6GlB21qsuE658RsxvR1+tsxcQSX6SxZSTVFamogGpe6c8bqNX2EyNM3ORqysb6u7aRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEIK3N6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEIK3N6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDBAC2BCB2;
	Sat,  9 May 2026 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778310443;
	bh=Y8svnOmPBdsCg6BShN1LcJIbLNiohOhJoqdCu/4wOYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MEIK3N6hyY3SS4IZj/7aCFE/3KoDv/Gst3dLwnpj+CdXSt02eAEIw+V3wvvl08dLf
	 w0UQXMSzf85pfWtYhd3TtSdvfE62lrjfAGbWfKSPEHn/X6kYWVMJimM7bpaR0RIL25
	 Rl9gM4wZZLfXg5onOnsG9oOEhYsoRpV+wPjHK1i4UCJJP3bhQhU2AlH3EV1dyLIN7B
	 E1BqGOqPwLeC4yXXrxdcbY/zTO/ies8IUlUAhKP6Cjxd5s764yxrstrzYa8NFFneu4
	 Q4hOL6ecWQifm3jFZpoog4qWkgTE18sk1/gwxQ2edHSA6DDz+AWymRCs8pIsXbzAQi
	 mfAuAYPawUWhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] scsi: ufs: starfive: Add UFS support for
 StarFive JHB100 SoC
Reply-To: sashiko@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260509062759.125472-4-minda.chen@starfivetech.com>
References: <20260509062759.125472-4-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 07:07:23 +0000
Message-Id: <20260509070723.9BDBAC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing PM runtime cleanup in the driver's remove callback.
- [Medium] Unconditional assignment of `dev_pm_ops` structure without `pm_p=
tr()` wrapper.
- [Medium] Hardware reset lines are deasserted during probe but never asser=
ted on removal.
- [Low] Inappropriate delay function used for microsecond delay.
- [Low] Shared DWC library directly appended to multiple host drivers' Kbui=
ld targets.
--

commit 7c7e2d539310c77f484d7f514058888be54a8ddf
Author: Minda Chen <minda.chen@starfivetech.com>

scsi: ufs: starfive: Add UFS support for StarFive JHB100 SoC

This commit adds support for the UFS host controller on JHB100 SoC, built on
the Synopsys DWC UFS controller and using the UFSHCD platform driver.

> diff --git a/drivers/ufs/host/Makefile b/drivers/ufs/host/Makefile
> index 65d8bb23ab7b3..adfee2ae3b486 100644
> --- a/drivers/ufs/host/Makefile
> +++ b/drivers/ufs/host/Makefile
> @@ -14,3 +14,4 @@ obj-$(CONFIG_SCSI_UFS_ROCKCHIP) +=3D ufs-rockchip.o
>  obj-$(CONFIG_SCSI_UFS_SPRD) +=3D ufs-sprd.o
>  obj-$(CONFIG_SCSI_UFS_TI_J721E) +=3D ti-j721e-ufs.o
>  obj-$(CONFIG_SCSI_UFS_AMD_VERSAL2) +=3D ufs-amd-versal2.o ufshcd-dwc.o
> +obj-$(CONFIG_SCSI_UFS_STARFIVE) +=3D ufs-starfive.o ufshcd-dwc.o

This isn't a bug, but is it safe to append ufshcd-dwc.o directly to multiple
independent Kconfig targets?

If one driver is configured as =3Dy and another as =3Dm, could this cause
unexpected linking behavior for the exported symbols in ufshcd-dwc.c?
Would a dedicated Kconfig symbol to manage the shared DWC library be safer?

> diff --git a/drivers/ufs/host/ufs-starfive.c b/drivers/ufs/host/ufs-starf=
ive.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/ufs/host/ufs-starfive.c
[ ... ]
> +static int ufs_starfive_init(struct ufs_hba *hba)
> +{
[ ... ]
> +	regmap_update_bits(host->syscon, UFS_REFCLK,
> +			   REFCLK_OEN | RESET_OEN, 0);
> +	usleep_range(2, 3);

This isn't a bug, but should udelay(2) be used here instead? For delays
shorter than 10us, the context switching and timer setup overhead for
usleep_range() usually heavily outweighs the tiny interval.

> +	regmap_update_bits(host->syscon, UFS_REFCLK, RESET_I, RESET_I);
> +
> +	ret =3D reset_control_deassert(host->core_reset);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to reset core clock");
[ ... ]
> +static void ufs_starfive_remove(struct platform_device *pdev)
> +{
> +	struct ufs_hba *hba =3D  platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&(pdev)->dev);
> +	ufshcd_remove(hba);
> +}

Does this code leak the PM runtime usage counter?

The driver calls pm_runtime_get_sync() to wake the device before calling
ufshcd_remove(), but fails to subsequently call pm_runtime_put_noidle() or
pm_runtime_disable(). Could this permanently leak the usage counter and lea=
ve
PM runtime active after the device is unbound?

Additionally, should the hardware reset lines (core_reset and phy_reset)
be asserted here during removal?

While devm_reset_control_get_exclusive() frees the handles on unbind, it
does not automatically assert the hardware reset lines, which might leave t=
he
hardware permanently active after the driver is unloaded.

[ ... ]
> +static struct platform_driver ufs_starfive_driver =3D {
> +	.probe		=3D ufs_starfive_probe,
> +	.remove		=3D ufs_starfive_remove,
> +	.driver		=3D {
> +		.name	=3D "ufs-starfive",
> +		.pm	=3D &ufs_starfive_pm_ops,

Should ufs_starfive_pm_ops be wrapped with the pm_ptr() macro?

Assigning it unconditionally forces the dev_pm_ops structure and its refere=
nced
callbacks to be compiled into the binary as dead code when CONFIG_PM is
disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509062759.1254=
72-1-minda.chen@starfivetech.com?part=3D3
