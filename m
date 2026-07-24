Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CBA42AF88
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893229; cv=none; b=DYE155VsKhdTtFSAuQFg0XYEYUFPyn4YlbctSBz9p/TsqmL03wRWGCJgjOCYLY1Dv+5Wrpgs1RKpXMa2wtolg8+qNeX0mZxi0ohFo2aFBqlC8qNqoqD3pc2vHR7KDLFoBJXFSjuBavjLOC3u4ItZ6P6Zf7xDz0J3iVm6SXN1Vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893229; c=relaxed/simple;
	bh=5PS8npergZe8SWZbMOm1Su1xQyodigGRNnpRdKhta+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I6Pv1c+DvkSQq1/zg/haz+l1NkT0NJWCT+wqtl4uK+k2XUNDIRGB5Iw353giY0rRaH2RFGflHkNQG4n3an/mOz8LBrUBIOE68tW03+0uMXZcuuedfXqaEb/cf+SJXLcKjrjb82d+k/1I4taaarJAyRPzmmzYjNgB86OqRadZqCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfdigGeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfdigGeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF161F000E9;
	Fri, 24 Jul 2026 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784893219;
	bh=aucQrjRrWIF4jp+CkbLyCZ0F/Ocn5RmQckwEGNext4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FfdigGeQIdJ0XC0DGcs8zFv27embrm36rwfZiR4zWM7hBw+QAvE+vCkSH1my5ZdV6
	 HskfVJ/TQNCyji29lmzPq+DF2FxRKK44rora2AMDRjBKUdbwp9uMLlbI5OVRzaQH6n
	 8GwCw8gDX3OcGxaKZPCytEaPqdxrDnEeZg7DdhPgXCW31y5YATECDkhl77OzPuDV/L
	 +EmRozTT9cYO2w3VyFyjnO3SpSC5Z6/z6wC0Wy3NZtgO2t+q72g7uOD6I1uwnlVVtV
	 tRuS+eZooZUrADKOy90wQ3tTAGk3GjsBUEDDv9b34vePJJA6skY5cn5sx7Mh5w3SP1
	 a8a8dZL7Cur8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: mtk-efuse: add support for 32-bit aligned
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-6572-nvmem-v2-2-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
 <20260724-6572-nvmem-v2-2-e58d16a29621@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:40:18 +0000
Message-Id: <20260724114019.1DF161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The mt6572 configuration and OF match entries are missing, rende=
ring `mtk_reg_read_aligned` dead code.

Pre-existing issues:
- [High] Dereference of `pdata` without a NULL pointer check causes a kerne=
l panic if `device_get_match_data()` returns NULL.
--

--- Patch [2]: [PATCH v2 2/3] nvmem: mtk-efuse: add support for 32-bit alig=
ned reads ---
commit 9dba40bd7cf45894283042b51926cffdb798412f
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: mtk-efuse: add support for 32-bit aligned reads

This commit introduces a helper mtk_reg_read_aligned to enforce 32-bit
aligned register access for MediaTek SoCs like mt6572 that do not support
8-bit reads. It conditionally uses this new read function based on the
needs_aligned_read flag in the device's platform data.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index af953e1d92302..178b9d85f813e 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
[ ... ]
> @@ -82,7 +108,12 @@ static int mtk_efuse_probe(struct platform_device *pd=
ev)
>  	econfig.add_legacy_fixed_of_cells =3D true;
>  	econfig.stride =3D 1;
>  	econfig.word_size =3D 1;
> -	econfig.reg_read =3D mtk_reg_read;
> +
> +	if (pdata->needs_aligned_read)

[Severity: High]
This is a pre-existing issue, but it appears pdata can be NULL if the
device is instantiated without an OF/ACPI node (e.g., via sysfs manual
binding).

Since pdata is acquired via device_get_match_data(), won't unconditionally
dereferencing it here cause a kernel panic when matched by name instead of
device tree?

> +		econfig.reg_read =3D mtk_reg_read_aligned;
> +	else
> +		econfig.reg_read =3D mtk_reg_read;
> +
>  	econfig.size =3D resource_size(res);
>  	econfig.priv =3D priv;
>  	econfig.dev =3D dev;
> @@ -103,10 +134,12 @@ static int mtk_efuse_probe(struct platform_device *=
pdev)
> =20
>  static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata =3D {
>  	.uses_post_processing =3D true,
> +	.needs_aligned_read =3D false,
>  };
> =20
>  static const struct mtk_efuse_pdata mtk_efuse_pdata =3D {
>  	.uses_post_processing =3D false,
> +	.needs_aligned_read =3D false,
>  };
> =20
>  static const struct of_device_id mtk_efuse_of_match[] =3D {

[Severity: Medium]
The commit message mentions adding support for the mt6572 SoC, but are the
mtk_mt6572_efuse_pdata struct and the mediatek,mt6572-efuse compatible stri=
ng
missing from mtk_efuse_of_match[]?

Without these entries, will mtk_reg_read_aligned() remain unreachable dead
code since needs_aligned_read is never true?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-6572-nvmem=
-v2-0-e58d16a29621@protonmail.com?part=3D2
