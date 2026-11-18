Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998269;
	b=jLKY30zDG4PWRN8o3OIxpM6zuQZ3lOLM87rcDUAWBz0VNYCmcoGotph9+52tB8vYYCuD
	 yHEMNQkmLDP061Tgp4PKFdBodhueUf8CWPdTnlRJj+O8zOTnmZaSeDZu1TRdRRl5LsNML
	 FDX3knU4UGvFgRk/brjzfeE3HvMEA7USILl14FgMetlIyUDKo4RGreoItCck/q93528qc
	 nZb2xujF47zw/W3KLs/5LPbK4YBzERFbIhxSwsF/JUwNHdc7nBaEiuxOCgh/L5ND+3WcR
	 tij7F9xQX434T9UW5BLkZEShJstWoeXejMgVUKSXTibEAATxLel/UsKpRoR/AqzSPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998269;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AUc/aWqjfy+x7+1G544wdZ17hqcM38kwLCl4C3DOAac=;
	b=ZsBBc3HyBfPkRIXVswtl/Gm3g49RUfdYGF9vzw0IvVN5mzcF9gda5JyXrwT3J7rUISEM
	 6yCrYHAVjIOo8qXo+UJzxA9lAi8zBBbGs4Ayo4b+TxxTJT7v24t6YCo3tcNGg2LC77L7y
	 IW8OO/fJ8hfPYc83fUufxnUPP0a8plQe794/ZCXd43TNwUVwEVfNyQNh5D/s9P314Roz1
	 rc/jrdaBVbavUhDZiXP10CpqZ7P9MyPWaXBLFb+SKsew7FLQwQJpt8VQfxBYI9fomvWTV
	 hs+9A5QfEnw81bVEQYBfcKP6vs1diB3xoz3yFVjT96/1KUmKlPrlmDMVkWZsly8scjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSYd5HTA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB9606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSYd5HTA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE0B1F000C4;
	Wed, 18 Nov 2026 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998268;
	bh=AUc/aWqjfy+x7+1G544wdZ17hqcM38kwLCl4C3DOAac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSYd5HTAyVgRwaZ++T1h363iiBmvhA3o/G/vmtZcLoCQfumN+yqZqwrCdZaGfMaYR
	 GAdEsCCpyOSpVHVXQ7FKwFs/Ln9iLx9K/Xm8tLMFNQZyDDuWdH+ftr1gxapUGkDYOF
	 v7MrYoWO3BmuVDjdsJ3LN/PVt+1Zq5w/ZxN68q0NPDYT9SUDfwd6YBbeED/FboYJzG
	 muYG0wde/THLwOfraVYJDFrO18aDDr4qGKKDVJG19U+EFm91Umpx3NMu105qmrM5ao
	 vfwLoUsCR3Q2oeCs3MWIccaMjpArJEZQLpJjg3InO3lcN8oLcHwIXlbz/U1CufNObq
	 SrAZWOGbtLsxA==
Message-ID: <sashiko-outbox-220720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-2-ed791084cc19@bootlin.com>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
 <20261118-paul-v7-3-rc1-edac-v8-2-ed791084cc19@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 10:37:48 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] EDAC/cadence: cdns_setup_mc() reports SECDED mode when ECC is
  disabled
- [Medium] EDAC/cadence: missing memory base PFN offset in
  cdns_mc_err_handler()
--

commit 75a0021a276efa3f6b0c9a800bd2617eb0141dff
Author: Paul Louvel <paul.louvel@bootlin.com>

EDAC/cadence: Add Cadence DDR EDAC driver

This commit adds an EDAC driver for the Cadence DDR memory controller on
Renesas RZ/N1x SoCs, supporting SECDED error reporting, software
scrubbing, and debugfs error injection.

> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 0000000000000..a3b72116ba129
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c
[ ... ]
> +static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
> +{
> +	struct mem_ctl_info *mci =3D dev_id;
> +	struct mc_priv *priv =3D mci->pvt_info;
> +	u32 status, err_addr, syndrome, reg;
> +
> +	status =3D readl(priv->io_base + CDNS_ECC_INT_STAT);
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	/*
> +	 * Hardware is not exposing how many CE / UE occurred since last ACK in
> +	 * case of multiple errors. Always set the error count to 1.
> +	 */
> +
> +	if (status & (CDNS_ECC_INT_STAT_UE | CDNS_ECC_INT_STAT_MULTIPLE_UE)) {
> +		reg =3D readl(priv->io_base + CDNS_ECC_U_ERR_STAT);
> +		syndrome =3D CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
> +
> +		err_addr =3D readl(priv->io_base + CDNS_ECC_U_ERR_ADDR);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PAG=
E_SHIFT,
> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> +	}
> +
> +	if (status & (CDNS_ECC_INT_STAT_CE | CDNS_ECC_INT_STAT_MULTIPLE_CE)) {
> +		reg =3D readl(priv->io_base + CDNS_ECC_C_ERR_STAT);
> +		syndrome =3D CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
> +
> +		err_addr =3D readl(priv->io_base + CDNS_ECC_C_ERR_ADDR);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE_=
SHIFT,
> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> +	}

[Severity: Medium]
Does passing err_addr >> PAGE_SHIFT directly to edac_mc_handle_error()
miss the physical memory base offset?

On Renesas RZ/N1 (r9a06g032), system DDR starts at physical address
0x80000000, while the Cadence/Denali controller logs 0-based DRAM offsets
in CDNS_ECC_U_ERR_ADDR and CDNS_ECC_C_ERR_ADDR.  cdns_setup_mc() fetches
the /memory resource into res and enables SCRUB_SW_SRC, but discards
res.start and leaves mci->ctl_page_to_phys unset.  Without adding
PHYS_PFN(res.start), edac_mc_handle_error() reports a 0-based PFN and
edac_mc_scrub_block() fails pfn_valid(), silently skipping software ECC
scrubbing.

[ ... ]
> +	reg =3D readl(priv->io_base + CDNS_ECC_STAT);
> +	if (!CDNS_ECC_STAT_IS_ENABLED(reg))
> +		mci->edac_cap =3D EDAC_FLAG_NONE;
> +	else
> +		mci->edac_cap =3D EDAC_FLAG_SECDED;
> +
> +	mci->mtype_cap =3D MEM_FLAG_DDR2 | MEM_FLAG_DDR3;
> +	mci->edac_ctl_cap =3D EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
> +	mci->mod_name =3D pdev->dev.driver->name;
> +	mci->ctl_name =3D "cdns-ddr-ctrl";
> +	mci->dev_name =3D dev_name(&pdev->dev);
> +	mci->scrub_mode =3D SCRUB_SW_SRC;
> +
> +	dimm =3D *mci->dimms;
> +	dimm->nr_pages =3D PFN_UP(mem_sz);
> +	dimm->grain =3D 4;
> +	dimm->edac_mode =3D EDAC_SECDED;

[Severity: Medium]
Should cdns_setup_mc() set dimm->edac_mode to EDAC_SECDED and continue
probing when CDNS_ECC_STAT_IS_ENABLED(reg) is false?

When the bootloader has not enabled ECC, mci->edac_cap is set to
EDAC_FLAG_NONE, but dimm->edac_mode is still hardcoded to EDAC_SECDED.
Because EDAC sysfs exposes dimm->edac_mode via dimm_edac_mode, userspace
monitoring tools will see SECDED reported as active while the driver also
requests the ECC interrupt, unmasks CDNS_ECC_INT_EDAC, and exposes debugfs
error injection on a controller with ECC disabled.  Failing probe with
-ENODEV (as documented in Kconfig that ECC must be configured by the
bootloader) or setting dimm->edac_mode =3D EDAC_NONE would avoid reporting
active ECC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-paul-v7-3-=
rc1-edac-v8-0-ed791084cc19@bootlin.com?part=3D2
