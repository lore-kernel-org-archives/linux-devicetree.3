Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360A3B9D80
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579154; cv=none; b=mXEirBEzebQISKQmBDPmiOinZ1s/ud05zcVad32G+iV3gDBquUGa2ewNNiTHJIajRRZ3MZ+SYLmnF8goa8O7ul8TbyA7U4KlsnadM27Xe4R0gY0q+GduP3PZw5rMiXcoRQOGvcIsrAaYoQWiQZFH/U29qE7uUd8Avv69eJjaU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579154; c=relaxed/simple;
	bh=dZ191QvS+S/wkP2b884ccleXW1D4GmK1BS0zVkjQ68Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwdTANydSPvDnRd834f+zE73MUC6hCvI1NkXDfJqImskNzit9Y1nfTv7bz51+nhgbsfCkOPf0fAlv8PmjZm0igbunapLgJS/dalf4b5lpb20059huYwby6ZCqlWBSvg5lnwlRP9McZ9yJBufyqVTTID94f/avc9gvtBwqipbgNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZGxIL1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZGxIL1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CEB1F000E9;
	Mon, 20 Jul 2026 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579152;
	bh=PZBQL4meCnOASBcC8eZ5VljtLmPX0/CtqcPRmbo7y4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HZGxIL1AjUD9v9CkFlN+ilkGp9YyVmU/lfw4TLTdTC6DyEWgXf9yA2GnvP10NhBFS
	 37UFtEXXY+5ro8bYItErR953SxWnvOvgHaqNPPh3AoFpJnmr5lJ0WKggtu44mAVTho
	 D+y8V4V3UzP0+BfeCsXBYzUY/Nrp6j6Gx5z3tlZZMc/2aC4LxLYUcpzbxxe9TvLycD
	 wEUZjFURf/EdaKOwzPF9fcc5Y760e8Vu9W+tdw6r7L/tFvfPWEJybMvR2TMLVnkANn
	 skDg2aqqIFmTvLwr9bI4JJ95fenWLmL+krYTBi2ffSi9vThf/Ln5Ujo6kYwr+R4HyD
	 HNlReS/g4fNOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] EDAC/altera: Add support for Agilex5 ECC manager
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720201425.1538771-4-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-4-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:25:52 +0000
Message-Id: <20260720202552.94CEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] A flawed if/else chain causes Agilex5 to incorrectly fall through =
to legacy A10 logic if the optional `global_dbe` interrupt is missing, lead=
ing to probe failure or interrupt hijacking, and prevents registration of t=
he intended panic notifier fallback.

Pre-existing issues:
- [High] Probe error paths fail to unregister the IRQ domain and chained ha=
ndlers, leading to Resource Leaks and Use-After-Free.
- [High] The platform driver lacks a .remove callback, causing severe Use-A=
fter-Frees on module unbind.
--

--- Patch [3]: [PATCH 3/4] EDAC/altera: Add support for Agilex5 ECC manager=
 ---
commit fe27bbb114924237edb349c2779f0fc2899da926
Author: Dinh Nguyen <dinguyen@kernel.org>

EDAC/altera: Add support for Agilex5 ECC manager

This commit adds support for the Agilex5 ECC manager to the Arria10 EDAC
driver. It introduces parsing for up to seven named interrupts, routing the
mandatory global_sbe and optional global_dbe through the chained interrupt
handler.

> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index e833869236914..13abce089ef1c 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
[ ... ]
> @@ -2145,14 +2197,31 @@ static int altr_edac_a10_probe(struct platform_de=
vice *pdev)
>  		return -ENOMEM;
>  	}
> =20
> -	edac->sb_irq =3D platform_get_irq(pdev, 0);
> -	if (edac->sb_irq < 0)
> -		return edac->sb_irq;
> +	if (edac->flag =3D=3D SOCFPGA_AGILEX5) {
> +		rc =3D altr_agilex5_get_named_irqs(pdev, edac);
> +		if (rc)
> +			return rc;

[Severity: High]
This is a pre-existing issue, but if altr_agilex5_get_named_irqs() returns
an error like -EPROBE_DEFER, does this return path leak the IRQ domain
created earlier in altr_edac_a10_probe()?

Because edac is allocated with devres, the memory will be freed, but the
IRQ domain might remain registered and point to the freed edac structure.

Could this lead to a use-after-free if the IRQ subsystem attempts to access
the domain's host_data?

> +
> +		edac->sb_irq =3D edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_SBE];
> +	} else {
> +		edac->sb_irq =3D platform_get_irq(pdev, 0);
> +		if (edac->sb_irq < 0)
> +			return edac->sb_irq;
> +	}
> =20
>  	irq_set_chained_handler_and_data(edac->sb_irq,
>  					 altr_edac_a10_irq_handler,
>  					 edac);
> =20
> +	/*
> +	 * Unlike Stratix10/Agilex7 (which deliver uncorrectable errors as
> +	 * Asynchronous SError), Agilex5 routes the global double-bit error
> +	 * through a dedicated SPI ("global_dbe"). Hook it into the same
> +	 * chained handler so the existing sb_irq/db_irq demux in
> +	 * altr_edac_a10_irq_handler() routes DBE events through the manager's
> +	 * IRQ domain. The panic notifier below is still registered as a
> +	 * fall-back for any DBEs that escape to SError.
> +	 */
>  	if (edac->flag =3D=3D SOCFPGA_S10) {

[Severity: High]
The comment above states the panic notifier is registered as a fallback
for Agilex5. However, this check only matches SOCFPGA_S10. Does this mean
the panic notifier is inadvertently skipped for Agilex5 devices?

>  		int dberror, err_addr;
> =20
[ ... ]
> @@ -2175,6 +2244,12 @@ static int altr_edac_a10_probe(struct platform_dev=
ice *pdev)
>  			regmap_write(edac->ecc_mgr_map,
>  				     S10_SYSMGR_UE_ADDR_OFST, 0);
>  		}
> +	} else if (edac->flag =3D=3D SOCFPGA_AGILEX5 &&
> +		   edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE] >=3D 0) {
> +		edac->db_irq =3D edac->agilex5_irqs[ALTR_AGILEX5_IRQ_GLOBAL_DBE];
> +		irq_set_chained_handler_and_data(edac->db_irq,
> +						 altr_edac_a10_irq_handler,
> +						 edac);
>  	} else {
>  		edac->db_irq =3D platform_get_irq(pdev, 1);
>  		if (edac->db_irq < 0)
>  			return edac->db_irq;

[Severity: High]
If an Agilex5 device omits the optional GLOBAL_DBE interrupt, will it
incorrectly fall through to this else branch?

This would cause it to call platform_get_irq(pdev, 1). If the device has
other optional interrupts, this might incorrectly hijack one of them (like
io96b0) as the chained DBE handler. If it doesn't have other interrupts,
it might fail and abort the probe with -ENXIO.

Also, this is a pre-existing issue, but if platform_get_irq(pdev, 1) fails,
does returning an error here leave the sb_irq chained handler dangling?

Since it was registered earlier in altr_edac_a10_probe(), it could cause a
use-after-free when the interrupt fires and dereferences the devres-freed
edac pointer.

[ ... ]
> @@ -2206,6 +2281,8 @@ static const struct of_device_id altr_edac_a10_of_m=
atch[] =3D {
>  	{ .compatible =3D "altr,socfpga-a10-ecc-manager" },
>  	{ .compatible =3D "altr,socfpga-s10-ecc-manager",
>  	  .data =3D (void *)SOCFPGA_S10 },
> +	{ .compatible =3D "altr,socfpga-agilex5-ecc-manager",
> +	  .data =3D (void *)SOCFPGA_AGILEX5 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);

[Severity: High]
This is a pre-existing issue, but does the platform driver lack a .remove
callback?

drivers/edac/altera_edac.c:
static struct platform_driver altr_edac_a10_driver =3D {
        .probe =3D  altr_edac_a10_probe,
        .driver =3D {
                .name =3D "socfpga_a10_ecc_manager",
                .of_match_table =3D altr_edac_a10_of_match,
        },
};

If the driver is unbound via sysfs, devres will automatically free the
edac struct and unmap MMIO regions. However, the chained IRQ handlers,
IRQ domain, and panic notifier remain registered.

Could this cause a use-after-free if a hardware interrupt or kernel panic
occurs after the module is unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720201425.1538=
771-1-dinguyen@kernel.org?part=3D3
