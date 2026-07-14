Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511542BC2F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061886; cv=none; b=h9WxyFMkFAbAQ0gO6ZV2UkSSf15xVdgbKjUt5dOk0Shfw3mGdC9mXkODxQJwJrJ5kehu/g/AypZPveDLxahPev4wAkldEei/UmQYGuE1FvmhpPaRh+sUyg1dTbHwISqgx5KxKraMZob+NcYa1JhgrnE5thaqya1/UWjHySrE1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061886; c=relaxed/simple;
	bh=vgxQTpxo264w53PGhi4VcYbIRsxqOe1w+H1pSpY0ALE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sjvA8YEFLVBQt4GXy8ILy15ZCMRfMQZ9255VqCk3DfwUpnyCVN56phmE0HM/sC/vUvcs2ylGuatm4PP/NY2Tlo0JJsr602vHk/4ODmLq4WRWQO2kweMtFvNu1bUN68ZiXQ09lTXnMUdgfx5Z3V90/YP37naNTHL0xFMcIHGDdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnkSQXtK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnkSQXtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB9D1F00A3A;
	Tue, 14 Jul 2026 20:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784061881;
	bh=FZh6+Q10GtYntiCEjqSce5vAUyV8Ghhh5lP/K4ZPS7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KnkSQXtKOiMFAGxkngi08+YbE6XYlVDI2z792w2lplshfcWaPPPw/tza3h+OWXnAf
	 qi86Ra0fbjBkn8XSQb1cQFckEMVo1y+GlbEET6W3lpiBhDqRCWbRl8SJVsh4snWe+N
	 fGBYcSb3lwXMNS49sttbqhRc1jj4K5SH/dGbnPlccoNO9x7HS4ZdeQJUAOYHtE+kWO
	 Ahv8rGXbWidPWSlUIkaDKhQebiRNyOhj36DSu72FsYEaHv0NY72h6qceWQbn9dFnrT
	 nyeU4pFgbd31aEDkX2Fi3IqmOu+N6Fvndz7tmGp60pQuKetEPIjQG+SUk/gqtB6Uw+
	 nYBL5LdjNoNeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based
 remote processor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714202441.554065-3-ben.levinsky@amd.com>
References: <20260714202441.554065-1-ben.levinsky@amd.com>
 <20260714202441.554065-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:44:40 +0000
Message-Id: <20260714204441.0CB9D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Format string vulnerability due to passing `dev_name(priv->dev)`=
 directly as a format string to `rproc_mem_entry_init`.
- [Medium] Clock enable count and remoteproc resource leak on the error pat=
h in `amd_bram_rproc_stop()`.
- [Low] The driver references undefined functions (`rproc_mem_entry_ioremap=
_wc`, `rproc_mem_entry_iounmap`, and `rproc_elf_load_rsc_table_optional`), =
leading to immediate compilation failures.
--

--- Patch [2]: [PATCH v6 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based r=
emote processor driver ---
commit 86b0a2cc7621606c7e9542f2f1f85e8f3f1d960a
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver

Add a remoteproc driver for AMD MicroBlaze/V soft-core processor
subsystems instantiated in programmable logic and using dual-port BRAM
for firmware storage and execution.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> new file mode 100644
> index 0000000000000..e4a103cf84558
> --- /dev/null
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c

[ ... ]

> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv =3D rproc->priv;

[ ... ]

> +	mem =3D rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> +				   resource_size(&res), da,
> +				   rproc_mem_entry_ioremap_wc,
> +				   rproc_mem_entry_iounmap,

[Severity: Low]
Are rproc_mem_entry_ioremap_wc and rproc_mem_entry_iounmap declared?

It looks like referencing these undefined functions causes a compilation
failure when building with CONFIG_AMD_MBV_BRAM_REMOTEPROC.

> +				   dev_name(priv->dev));

[Severity: Medium]
Could this lead to a format string vulnerability?

rproc_mem_entry_init() is a variadic function that uses its name argument
as a format string in a call to vsnprintf(). By passing dev_name(priv->dev)
directly as the format string, an uninitialized stack read regression could
occur if a maliciously crafted device tree overlay contains a '%' character
in the node name.

Would it be safer to pass "%s", dev_name(priv->dev) instead?

> +	if (!mem)
> +		return -ENOMEM;
> +
> +	rproc_add_carveout(rproc, mem);
> +	rproc_coredump_add_segment(rproc, da, resource_size(&res));
> +
> +	return 0;
> +}

[ ... ]

> +static int amd_bram_rproc_stop(struct rproc *rproc)
> +{
> +	struct amd_bram_rproc *priv =3D rproc->priv;
> +	int ret;
> +
> +	/* Assert reset before disabling the processor clock. */
> +	ret =3D gpiod_set_value_cansleep(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		return ret;

[Severity: Medium]
Does this error path leak the clock enable count by returning early
before calling clk_disable_unprepare(priv->clk)?

Also, if this early return occurs, the remoteproc core's rproc_shutdown()
aborts before calling rproc_resource_cleanup(). Does this cause the
rproc_mem_entry objects on the carveouts list to leak when the device
is later removed via rproc_del()?

> +	}
> +
> +	/* Disable clock after asserting reset */
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}
> +
> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> +				   const struct firmware *fw)
> +{
> +	rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
> +					  "no resource table found\n");

[Severity: Low]
Is rproc_elf_load_rsc_table_optional() declared?

Similar to the callbacks in amd_bram_rproc_prepare(), this appears to be
an undefined function that triggers a build failure.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714202441.5540=
65-1-ben.levinsky@amd.com?part=3D2
