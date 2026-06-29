Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D733ACA58
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716846; cv=none; b=eRdr60IPzMPvhy1swHSEBC3/gkYlpCNQMc1a5VQF16Owvz+zCWwY7EQN93jnmPE7Z/o8mBXd0DpHvUNUJFtbgtfwcgWd+ccPBPmHrr9rZ8bU3ka/aUjYDW2L0bLTjJX6usRmWOLIwx0cF2qpBWKFGIiz+p4qoswuQokStA4QNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716846; c=relaxed/simple;
	bh=Wj8MX3C4aW9weipUZgwtMrVrnPg5Cc6roG/WTW/LRcA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjY7HChtLqYnocTvL5hD1Y20apBfqTThQHoYXXOsCUxlZ1pSgVF03EjsEqh5rpNzqE6m/MEBFzDEeCi8kz9TmrGjJ+gZTKufj5I6CBSHZBDbvsnEOPYt7Gy9INmA3DmzYDiRP7yIoVbbmbZqSnHaE1B1AYF7ZujMGNNIm1rrnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE591F000E9;
	Mon, 29 Jun 2026 07:07:24 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH 2/2] memory: ti-k3-fsas: Add TI FSS_FSAS driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629065517.868418-3-s-k6@ti.com>
References: <20260629065517.868418-1-s-k6@ti.com>
 <20260629065517.868418-3-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:07:23 +0000
Message-Id: <20260629070724.CFE591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver accesses memory-mapped registers without enabling the d=
evice's power domain via runtime PM, causing a synchronous external abort.
- [High] Probe ordering race condition between the FSS wrapper and the OSPI=
 child device can lead to DMA data corruption.
- [Low] The TI_K3_FSS_FSAS driver can be built on architectures without HAS=
_IOMEM via COMPILE_TEST, causing build failures.
--

commit 472a60060ef7ef11966794e0d895b41600560dca
Author: Santhosh Kumar K <s-k6@ti.com>

memory: ti-k3-fsas: Add TI FSS_FSAS driver

Add a platform driver for the TI Flash SubSystem Application Subsystem
(FSS_FSAS_GENREGS) in K3 SoCs. This driver takes care of disabling the
OSPI XIP prefetch which causes DMA transfer data corruption.

> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index e5527020ff337..954e47810e8db 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -125,6 +125,16 @@ config TI_EMIF_SRAM
>  	  sequence so this driver provides several relocatable PM functions
>  	  for the SoC PM code to use.
> =20
> +config TI_K3_FSS_FSAS
> +	tristate "TI K3 Flash Subsystem Application Subsystem (FSAS) support"
> +	depends on ARCH_K3 || COMPILE_TEST

[Severity: Low]
Does this config need to depend on HAS_IOMEM?

If COMPILE_TEST is enabled on architectures that do not support MMIO and do
not select HAS_IOMEM (e.g., s390 or UM), will compiling this driver fail
because devm_platform_ioremap_resource(), readl(), and writel() are not ful=
ly
supported?

> +	help
> +	  Driver for the TI K3 Flash Subsystem Application Subsystem
> +	  (FSS_FSAS_GENREGS) wrapper found on K3 related SoCs.

[ ... ]

> diff --git a/drivers/memory/ti-k3-fsas.c b/drivers/memory/ti-k3-fsas.c
> new file mode 100644
> index 0000000000000..9ff109b8d96fd
> --- /dev/null
> +++ b/drivers/memory/ti-k3-fsas.c

[ ... ]

> +static int k3_fsas_probe(struct platform_device *pdev)
> +{
> +	struct k3_fsas *fsas;
> +
> +	fsas =3D devm_kzalloc(&pdev->dev, sizeof(*fsas), GFP_KERNEL);
> +	if (!fsas)
> +		return -ENOMEM;
> +
> +	fsas->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fsas->base))
> +		return PTR_ERR(fsas->base);
> +
> +	platform_set_drvdata(pdev, fsas);
> +
> +	k3_fsas_disable_xip_prefetch(fsas);

[Severity: High]
Will this register access cause a synchronous external abort (bus fault) by
accessing memory-mapped registers before the device's power domain is enabl=
ed?

On TI K3 platforms, power domains and clocks are managed by the
ti_sci_pm_domain driver, and the hardware domain remains power-gated until
explicitly enabled.

Should this driver call pm_runtime_enable() and pm_runtime_resume_and_get()
before calling k3_fsas_disable_xip_prefetch()?

> +
> +	return 0;
> +}

[Severity: High]
Does this driver need to explicitly populate its child nodes using
devm_of_platform_populate() to prevent a probe ordering race with the OSPI
child device?

Since the driver core allows a child device to probe even if its parent dev=
ice
is not yet bound, could the spi-cadence-quadspi driver probe first due to
module load ordering?

If the child initiates DMA transfers before this wrapper has probed and
disabled the prefetch, wouldn't it trigger the exact data corruption this
patch aims to fix?

> +
> +static int k3_fsas_resume(struct device *dev)
> +{
> +	k3_fsas_disable_xip_prefetch(dev_get_drvdata(dev));

[Severity: High]
Will this register access crash the system during resume?

Since this driver acts as a parent to the OSPI child device, it resumes bef=
ore
the child. If the shared hardware power domain is completely powered off
at this point, accessing FSAS_GENREGS_SYSCONFIG here would cause a bus faul=
t.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629065517.8684=
18-1-s-k6@ti.com?part=3D2
