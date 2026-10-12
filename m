Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B13B9922
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832592; cv=none; b=avd7+3PLy3cy+F1Fco3m9B6ESQc00T1WnAcj7kjTnSv/AZWvROvdAABY7WH437G6zAniBpZMRy5+JgqPo1YkqvHqN1DCC1R39RHXhSIRWdrHQwdYQ3fvFJkKIuuxj4TXaES8QMrSCLHEBD8UcyTLmX+8Z6H0/wRuEK/g04aXQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832592; c=relaxed/simple;
	bh=MxQjFIb4asoEi2lmMq0X5uwou2wdvP/Owo2LYQs7EcE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LCSx7K9YlhA+ymX/DxoTZKxR6t/UfxGXyc2H55fA/dBomOwF5fw5XC6a0T4xWyZ0LPTmh1HRJ0195XkWk18AoDaD7q4PL/YHmWHW/vEjlmzcQLTmDAY67qsY9BgdZ3gAdMZtJyEYLN8VfIkJoSQ4EOp8XDLOf4s9MyoTdhT8Zjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcNlX8gq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcNlX8gq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC181F0089B;
	Mon, 12 Oct 2026 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832591;
	bh=EXoyDQZU/Dg291Rtk7nEzckgUzXrz9j+ldY58T6l7tM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcNlX8gqtqefd68Tokp7tiiVX8Ovn856iSu5zvmLwFs+aE9IalkXrdDjLg5MqOCig
	 qFyoFpY1bBN0xI2jLz2Se3eWh+M5JUvGCNd8uZEjRyvnzZD5yiDCvy6oY1OPgGpmUC
	 nWkAtP4WysywcO84JDESclHZJT149XcMY3F4Ol7YWoHoyMriaFCEooPQi9drDZHx9K
	 1MAiGgqgKDdYo+KRX1dmmXbc6vOmPmw7zH/CCEYjZsWU+rY6AaZML2Fjl5b6EPKjld
	 pKi26jX/HhkQ+zbY3b9HVOaXv9O++1Z1R6jtKE+XaVdwTuVhwCXy0MSOs6dZkjZb2c
	 dh2s3Pk4XJdYQ==
Message-ID: <sashiko-outbox-168574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] irqchip: introduce TC9564 SoC MSIGEN support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261012190245.3988619-3-elder@riscstar.com>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 19:16:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] irqchip/tc9564: uninitialized stack variables info and dgc_info
- [High] irqchip/tc9564-msigen: Use-After-Free in handler during module rem=
oval
- [Low] kconfig: TC9564_MSIGEN depends on hidden symbol GENERIC_IRQ_CHIP
--

commit 3dfc2bc2208f270b240c50f9b867c34c54af58e0
Author: Daniel Thompson <daniel@riscstar.com>

irqchip: introduce TC9564 SoC MSIGEN support
   =20
Define a new irqchip platform driver that represents the MSIGEN
functionality present in the TC9564 SoC.

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index a8f8c423b7957..205b5a167c805 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
[ ... ]
> +config TC9564_MSIGEN
> +	tristate "Toshiba TC9564 MSI distributor"
> +	depends on TC9564_PCI
> +	depends on GENERIC_IRQ_CHIP

[Severity: Low]
Is it intentional to use "depends on" instead of "select" for this hidden
symbol?

Since GENERIC_IRQ_CHIP is a hidden boolean symbol (without a prompt), using
"depends on" makes TC9564_MSIGEN impossible to enable on architectures or
platforms that do not already natively select GENERIC_IRQ_CHIP.

> +	default TC9564_PCI
> +	help
> +	  This enables support for the "MSIGEN" MSI distributor embedded
> +	  in the Toshiba TC9564.  This device receives wired interrupts
> +	  within the TC9564 and raises them to the host using MSI.
> +
>  endmenu
> diff --git a/drivers/irqchip/irq-tc9564-msigen.c b/drivers/irqchip/irq-tc=
9564-msigen.c
> new file mode 100644
> index 0000000000000..a27edd5859e43
> --- /dev/null
> +++ b/drivers/irqchip/irq-tc9564-msigen.c
[ ... ]
> +static void tc9564_msigen_irq_domain_exit(struct irq_domain *irq_domain)
> +{
> +	struct tc9564_msigen *msigen =3D irq_domain->host_data;
> +
> +	irq_set_chained_handler_and_data(msigen->irq, NULL, NULL);

[Severity: High]
Does this missing synchronization lead to a use-after-free?

When the chained handler is set to NULL during module removal, it doesn't w=
ait
for currently executing handlers to finish. If tc9564_msigen_irq_handler() =
is
running concurrently on another CPU, it might access the irq_domain, generic
chip, and unmapped register memory after they are freed by the removal path.

Should this call synchronize_irq() to ensure the concurrent handler has
finished?

> +}
[ ... ]
> +static int tc9564_msigen_probe(struct platform_device *pdev)
> +{
> +	struct irq_domain_chip_generic_info dgc_info;
> +	struct device *dev =3D &pdev->dev;
> +	struct irq_domain *irq_domain;
> +	struct tc9564_msigen *msigen;
> +	struct irq_domain_info info;

[Severity: High]
Could these uninitialized stack variables cause a crash?

If info is not zero-initialized (e.g., using =3D {}), fields like info.pare=
nt
will contain stack garbage. When passed to devm_irq_domain_instantiate(),
could this result in dereferencing a wild pointer in __irq_domain_instantia=
te()
if CONFIG_IRQ_DOMAIN_HIERARCHY is enabled?

> +	struct reset_control *reset;
> +	struct pci_dev *pci_dev;
> +	struct clk *clk;
> +	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012190245.3988=
619-1-elder@riscstar.com?part=3D2
