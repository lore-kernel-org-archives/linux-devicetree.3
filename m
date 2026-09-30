Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D644C4FE
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764049; cv=none; b=C8nREY1W3Cug+PI0ORr/8q0GcEDNxi0sCoJ+hnwrElij/RHwA2giJix5UzJowRmeLOfpWx1ej3C/JBvxVVRRlB9B2MPzCFQ9lwMlgbpNLsSbFUzNmcRa8FpqZgAHCmm37bTyZcoEcpSqBcx0C9ofgotneZMpDZyFnkD/mIeB/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764049; c=relaxed/simple;
	bh=LcKxqu1rqCHiSYtgY8S6WP4xj7V72irSnEUj08hg+lA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nwEVeN8W092DYLfRZ9/8NK8InfVfHohVIVCk02Lb5vRvk9L1DWHUgdpOBfpJuk8orHkaapnvVhrVorsNuX3xpl3eK4p111zf95jhldCeD89aQwXq2L4jQWdiEc8/6OMn04rHg0ipBUhZS2/rKhhT5rQem5fg1HcZ3ekGzZ8c3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5OrEPz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5OrEPz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E831F000FF;
	Wed, 30 Sep 2026 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764045;
	bh=4hD/cDqYV5ltDSh6L9vHYZEMIn98wkWB80uakQmXSBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X5OrEPz+0MeFWhOWUT+JfNmwebGnCu/rG2tAJjyujN7TttFgnpjoBzAnDEgr0N8ik
	 M+Dqg/vfBNcg1JGW2eT3clKiEB6h2xJVwNi+SiOgzpDNkRVNPIYGjQ4eXWOZ+Q6X/h
	 hc25Ycxp3Kxj5Cy/SMCrxNZy6aJy9Hg6ufnAco9jl7SnFCYbkkEqYgjqeZ6tXNmI18
	 vyrXUqnMaxFHMxW/AYrFceZeRr60kU7xZKOJy/i+sWB31sKri5sUPOPPksSHbo2NgL
	 WDl0F/U4XsFNc8xT7q+P7dPyD9v316vjDtdtUdsvy/Mq/8KrxOrA5C3nNmukX8aucm
	 z7WvpZDjpGJKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-6572-nvmem-v5-3-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
 <20260930-6572-nvmem-v5-3-384d2a3a1770@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 10:27:24 +0000
Message-Id: <20260930102725.57E831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] nvmem: flawed string matching applies cpu-speedbin hook to uninten=
ded prefixes
- [High] nvmem: out-of-bounds access on zero-length cell in mtk_efuse_cpu_s=
peedbin_pp()
--

commit 6fd2c8ebf274a3effe09809dbfe826b5c25b063f
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: mtk-efuse: add CPU speedbin post-processing

This commit adds support for converting CPU speedbin values stored in efuse
into a bitmask for opp-supported-hw usage in device trees on mobile SoCs.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 980c29d013375..d2e5c69c580e3 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, co=
nst char *id, int index,
>  	return 0;
>  }
> =20
> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int =
index,
> +				     unsigned int offset, void *data, size_t bytes)
> +{
> +	u8 *val =3D data;
> +
> +	if (val[0] >=3D 8)

[Severity: High]
If a device tree defines a matching nvmem cell with a length of 0 bytes
(e.g., reg =3D <0x0 0x0>), the nvmem core allocates an empty buffer using
kzalloc(0, GFP_KERNEL), which returns the ZERO_SIZE_PTR macro.

Could this unconditionally dereference that ZERO_SIZE_PTR and cause a
kernel panic when reading the cell?

> +		return -EINVAL;
> +
> +	val[0] =3D BIT(val[0]);
> +	return 0;
> +}
> +
>  static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  					 struct nvmem_cell_info *cell)
>  {

[ ... ]

> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_=
device *nvmem,
>  	if (cell->nbits <=3D 3 &&
>  	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))=
) =3D=3D 0)
>  		cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
> +
> +	/*
> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
> +	 * a bitmask for supported-hw usage.
> +	 */
> +	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))=
) =3D=3D 0)

[Severity: High]
Does this string comparison correctly restrict the match to just the
"cpu-speedbin" cell?

Since the comparison length uses min(sz, strlen("cpu-speedbin")), if a
device tree contains a cell with a name that is a shorter prefix of
"cpu-speedbin" (like "cpu" or "c"), the min() function will select the
shorter string's length.

Could this result in strncmp returning 0 for unrelated cell prefixes,
incorrectly applying the post-processing hook and silently corrupting
their data?

> +		cell->read_post_process =3D mtk_efuse_cpu_speedbin_pp;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-6572-nvmem=
-v5-0-384d2a3a1770@protonmail.com?part=3D3
