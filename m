Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12821385D83
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126761; cv=none; b=tjAZnm2FWSt2CPGLA0l1rMZ1VTsYv530y0L6Pxi2Qm8jQ6ZnHFkl9nBsd5m3xE1BwEbkT+rxLcF1TUT3oU07p5IgP9mirBpMjl5yDT9yP+xzFT7K/L9YDk+UwZsl0AsSrW6rHz9S0LrhSoAH3RVgSyiB048On8OKTSRwz4NxbTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126761; c=relaxed/simple;
	bh=mUD3u8i6smcWBVkviQnocRqbgcVANEswDQMAu4e9B0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvraF5Hme15z1X9HP/k0VWLy4xFOpOQ8SiEfXLa84qfjXSp1zaq3CjVYr0WjcSF080QRGi7vvEde4lmW/jt7KA829K+2xNJ6f/OJzf0iRoiY0YAEh/Xndtq+O+Yw3xMmwp+gGqhtRikqi2eeSoP6K5t+fCkfXk1pZ5ozuf/6WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSRjfHqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSRjfHqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8351F1F000E9;
	Wed, 15 Jul 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126759;
	bh=PRrwPzwNMVzfFatirbKKEknv8qYs9emneI+4+7Gsr6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSRjfHqWbF1XZ/pQ6jpvBOObZaWPJi82CgUXh1QyUcwT9IHfFMSnDmuU9m2tE7Iyd
	 88tc1E7Gm3ifC4yeMpxd+6lUQzj+WFt4/KOvZC6ZRDV0x8cfZQT5GgTMko+Lflwa1Q
	 k3afmb54xyOLdDYbSWJmjSKagmiSaJhOdlMf+SdakhXdWlsIW1BEYqSaadtQDvUHhW
	 B3ezVz+mTYHjm+/aomzMjZNj2Sx6m5kzBSrSSV8Y3Gdx1/K7XOQSkkLRqqsjpBlFTB
	 URk9EJFnxV1BARJjdvZEmaNLXwqAfGRxO7sKhn2cHXwU0pPp9bLTwlrAlm1CSbufuK
	 78GEJIPBupMcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:45:59 +0000
Message-Id: <20260715144559.8351F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect string comparison logic erroneously matches any nvmem ce=
ll name that is a prefix of 'gpu-speedbin'.
--

--- Patch [3]: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support ---
commit 2c71c19eb8895343bae32ea1c4c07b25c01cd56c
Author: Roman Vivchar <rva333@protonmail.com>

    nvmem: mtk-efuse: add mt6572 support
   =20
    Add a platform data struct for the efuse controller.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 1462f27608184..a794346084658 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata =3D {
> +	.uses_post_processing =3D false,

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing issue
with the post-processing logic in this driver.

Looking at mtk_efuse_fixup_dt_cell_info(), the string comparison logic
erroneously matches any nvmem cell name that is a prefix of "gpu-speedbin":

drivers/nvmem/mtk-efuse.c:mtk_efuse_fixup_dt_cell_info() {
    ...
	if (cell->nbits <=3D 3 &&
	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) =
=3D=3D 0)
		cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
    ...
}

Because strncmp() uses min(strlen(cell->name), strlen("gpu-speedbin")) for
the comparison length, it restricts the comparison to the shorter length.

If a device tree defines a cell with a name that is a substring of
"gpu-speedbin" (e.g., "gpu" or "gpu-speed") and has 3 or fewer bits, this
will evaluate to 0.

This incorrectly applies the post-processing fixup to completely unrelated
cells, which could cause silent data corruption.

Would it be possible to change this comparison to prevent short-prefix
matches?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-6572-nvmem=
-v1-0-9c13be99d077@protonmail.com?part=3D3
