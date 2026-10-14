Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1339190462
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014509; cv=none; b=MY7J291IufdUCVa6zsOtHkN3tR2gVtQY79+pnTIABASpRp4GPLAEqzWW+rJtds5i2ClbUu+z8P2BcH4/kpUQeEfoL83AQ1L05jesKkRG0g48CPx+z0bpwuoipo9X2rRmhZVC9LORoiZpj8CAstbTSG5NdeSi6jzyT3hOuAx71BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014509; c=relaxed/simple;
	bh=n+LmNjfM7/bObakBcuSaeNIVw/Y3M0ZKlDAw32Lj438=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=trruTTT+UfJDiQZroo6gWDEr1kexO6UOjyHsbMbX+VWgIKbu9SPSMBLBRx+T/1YvRf5XezYm6YnRXQQCskfTkVzeDAtK2iPMvX7TqbzHHZ2tyE5S3zaPmRCEMZNLPKWEyOC1cs6K7IDHdeuArtFUWZmD2BTel9Q+YNkCjOD2W+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLEmHPF1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLEmHPF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0474C1F000C4;
	Wed, 14 Oct 2026 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014508;
	bh=5g+VtGhlbyeLyHYgNRZs6nJ+giFT9fcMAM0DtjsZj9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLEmHPF1H1NDoRc8NjY71QkQvDx1EzUQ61OMCjdDSsgAiJTPKjj0uItE1y5oB95xf
	 WwOLkEV3puFdLJ/x+fMFI7lYGfvR6Ia/o+Mzc+KU2aIso8U+l5ND2No7T0uYZ2m7x0
	 UILCFmxOv2m5YWyaHdpiEVRNAjXqc2S3psJsbgNRtgma/JtOHVKCBGb4L0GRPsbQo7
	 gSO0Mxo8V3FR05/jFXysTl3ghvPIRi1UiMFu3sB9o9rB9P6s1xKvY/knylfxNchYIj
	 OHa5t9NvGuNmY+0o5RwOSj/PE8a48+oe/UTzNNP1PUAS5lBrTAQtqqZD7QHySJl7zU
	 NJR11mb3/MDNg==
Message-ID: <sashiko-outbox-171938@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014213426.2957480-2-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-2-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:48:27 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] remoteproc: carveout memory leak on rproc_parse_fw() failure
--

commit bb5382f10341b400baaa921ca1112dc728aa259e
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: amd_mbv_bram: Bound device name formatting

Pass the device name through a constant format string to prevent percent
conversions in the device name from consuming nonexistent variadic argument=
s,
and bound it to 31 characters.

> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc=
/amd_mbv_bram_rproc.c
> index e4a103cf84558..6cf33c7b7e641 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
>  				   rproc_mem_entry_iounmap,
> -				   dev_name(priv->dev));
> +				   "%.31s", dev_name(priv->dev));
>  	if (!mem)
>  		return -ENOMEM;
> =20

[Severity: Medium]
Could this introduce a regression where the carveout memory leaks?

If rproc_parse_fw() fails during boot (for instance, due to a memory
allocation failure in rproc_elf_load_rsc_table()), the error path in
rproc_fw_boot() bypasses rproc_resource_cleanup():

drivers/remoteproc/remoteproc_core.c:rproc_fw_boot() {
    ...
	ret =3D rproc_parse_fw(rproc, fw);
	if (ret)
		goto unprepare_rproc;
    ...
clean_up_resources:
	rproc_resource_cleanup(rproc);
    ...
unprepare_rproc:
	rproc_unprepare_device(rproc);
    ...
}

Because the driver adds the carveout to rproc->carveouts shortly after this
allocation:

	mem =3D rproc_mem_entry_init(...);
	if (!mem)
		return -ENOMEM;

	rproc_add_carveout(rproc, mem);

And relies on the core's rproc_resource_cleanup() for cleanup, the carveout
would remain on the list if parsing fails.

Subsequent rproc_boot() attempts would then call prepare() again, potential=
ly
adding duplicate carveouts and causing unbounded list growth.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014213426.2957=
480-1-ben.levinsky@amd.com?part=3D1
