Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132633793CA
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609990; cv=none; b=lAJ6IqHlFLhFVMmwKvQARUekoSxvLH2TmrdDmtKS5o/644ZzOdy66WeHZmQQDlFzFUtwQiFmNhIRAfyxyqNyXOrj+bd/ozgSjadS665BHyCGurBGsx3VRawSBQB3oaBI6Lu4859G8UEIJm2O8CeOJjqykQLYDkoYSxKm7Qc8/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609990; c=relaxed/simple;
	bh=ymX5oEikYhzr5+6FuCfmOJJgFCCxZXjJk1nvFN7Rers=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAxYEEjyh3ZPcydphMN/K6zx8CbIE51XzjqioaVGAtG+c2SXZJl3SAmOzYO8/cVa03lMcODVkKtg4rTkmVLtPi4YX/B2K+/W2af5m+FANMW2AMY2vmJzJ07kMu51TYptzyfCUwXRX/XRiEHp5lR2LvBqFUS0FlKapM62cb9DnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3+3ttQe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3+3ttQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9B11F000E9;
	Thu,  9 Jul 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783609988;
	bh=CkRKgnDNTsY1RZgwV+UII0M72+1aDbfB7xfJcldm7Eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3+3ttQeQ/B3j5Bu2rZ48YkzccYisMaVIzSjjhXO7lqMbnfql8crZ/l0HPhFyDsEo
	 /OozqJRtzEGsbDMwE4lo1Y8oVDWWC8UTRlyUOCef1KekmsJVbWbu36uh5B1pi2ZDBl
	 MF8oVEYBPF6DvCbmDQ0bnzXg2e6VEvaEZfY/Pxv/MjvfYL49D+UNjo6236I4emw1Jo
	 G8PWmKFps+BMAwsNQm0W/wl0tawX1u5ibSbtX5jqmV5lPeHkksQg8VfQuqhpWUmdXw
	 FZO3W9NGmL0eHq5h9faR1zXywwhs2nxS4vxlgesnOML1la8zHgV2MymEAyz2iM6P/R
	 CslQ4nN096psg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based
 remote processor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709145712.951146-3-ben.levinsky@amd.com>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:13:07 +0000
Message-Id: <20260709151308.5C9B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The driver references multiple non-existent functions (`rproc_mem_e=
ntry_ioremap_wc`, `rproc_mem_entry_iounmap`, and `rproc_elf_load_rsc_table_=
optional`) and illegally passes a variadic macro as an argument, causing a =
build failure.
--

--- Patch [2]: [PATCH v5 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based r=
emote processor driver ---
commit fa5c15f78fe1b684bd57e7c11e3674d5ed2661ce
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver

Add a remoteproc driver for AMD MicroBlaze/V soft-core processor
subsystems instantiated in programmable logic and using dual-port BRAM
for firmware storage and execution.

> diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd=
_bram_rproc.c
> new file mode 100644
> index 0000000000000..e4a103cf84558
> --- /dev/null
> +++ b/drivers/remoteproc/amd_bram_rproc.c
[ ... ]
> +static int amd_bram_rproc_prepare(struct rproc *rproc)
> +{
[ ... ]
> +	ret =3D of_address_to_resource(priv->dev->of_node, 0, &res);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to translate executable memory reg\n");
> +		return ret;
> +	}
> +
> +	mem =3D rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> +				   resource_size(&res), da,
> +				   rproc_mem_entry_ioremap_wc,
> +				   rproc_mem_entry_iounmap,
> +				   dev_name(priv->dev));

[Severity: Low]
Do the callback functions rproc_mem_entry_ioremap_wc() and
rproc_mem_entry_iounmap() exist in the tree? Passing undefined symbols here
will cause build failures.

[ ... ]
> +static int amd_bram_rproc_parse_fw(struct rproc *rproc,
> +				   const struct firmware *fw)
> +{
> +	rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
> +					  "no resource table found\n");
> +	return 0;
> +}

[Severity: Low]
Is rproc_elf_load_rsc_table_optional() defined in the kernel tree?

Additionally, because dev_dbg is a variadic macro, passing it as a function
pointer argument will result in preprocessor errors. Should this use a
different logging function or wrapper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709145712.9511=
46-1-ben.levinsky@amd.com?part=3D2
