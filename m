Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31E29B77C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782688881; cv=none; b=aCTdRSAV/ahnWWdsiSSM1H42V2d+X9y9pCcQ1pdaoQN7yldYTJ5rHeLSXvKXSvixt8ojkb+mJPUZllIwwlRz6LrFj73at/aAtwIOy0JuInXkXtu7CvWWZcD7hQ+uf9KkQbQyq3LUFRWfqkK1dfAOYg6aIyREKs1x9Mu74vV56jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782688881; c=relaxed/simple;
	bh=XJ/xTB44Gf22mE0t/RePhO91jTTLUW+XA9tPlIz1jzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rPpmBt+J00ytkjPiHJ6Ry7yvKUWTdgmTY1Wqr/712FxJ4tr80PYh+d7YLEpkjzOXFY0nlNsjDJYLWrlhAhLi4qXT/WaDMU4gUok9smKRgUzesMUimkdBTrRhyzo1uGdNaey227jswPVdJPpVjA2yesRp9/r9HwiWR8vI2oTBWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsLD4MF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsLD4MF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0511A1F000E9;
	Sun, 28 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782688880;
	bh=0w/jXflKk4mNuY1d5U/4ZfwLPlTKFOIDmbsV6jxfyKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsLD4MF8VALHlg3atzInAc0gf3cvR8isZ4mMq5zMqwRalZucoFCn8t15Yv16Rlql6
	 VJdVlJhAd/F6enVUZdGFZGFhw+0Smfw2xLOfZuiWGfEnuojYEc3OxDMSQlOKEBtFyd
	 lJdW95fr/WLGQRB5/iPjTYxl8XhKBDky2kiRidRUyxmLJ1MNDGG2oEG+Mp9Z73bGPm
	 kFGtyvro0lbzUR3d5T0UFU5lcHxky/2Qx6qdJrNV9aKkdQn5Uhyv6cgN508G5noLV4
	 OmugI14nIk6GwJy+IH65S+d9sE3PvUcHo7YDke9DE6G2TLOSZgv4n6nYMt72JKf8cs
	 wSIaFB+HQJ1sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628231049.1248899-1-rosenp@gmail.com>
References: <20260628231049.1248899-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 23:21:19 +0000
Message-Id: <20260628232120.0511A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Heap out-of-bounds read and write in `brcm_nvram_add_cells` du=
e to mismatched logical length validation.
- [High] Fatal page fault due to `ZERO_SIZE_PTR` dereference if the NVRAM p=
artition contains only padding bytes.
--

commit f8d0bb1af13fdcf08114311cb9160479fcd6bdb5
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: EA9200: fix nvram size
   =20
Fixes:
   =20
[ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_nv=
ram_probe+0x400/0x480
[ 0.182159] Unexpected (big) NVRAM size: 1056112 B
   =20
Signed-off-by: Rosen Penev <rosenp@gmail.com>

> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch=
/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> index 5bbc2ba0f9598..87569408bb695 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> @@ -26,7 +26,7 @@ memory@0 {
> =20
>  	nvram@1c080000 {
>  		compatible =3D "brcm,nvram";
> -		reg =3D <0x1c080000 0x180000>;
> +		reg =3D <0x1c080000 0x100000>;

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential out-of-bounds heap
read and write in drivers/nvmem/brcm_nvram.c when parsing NVRAM partitions.

In brcm_nvram_parse(), the length check validates the logical length defined
in the header against the total partition size rather than the allocated da=
ta
length:

drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
    ...
    if (len > priv->nvmem_size) {
    ...
}

If the flash data defines a header->len larger than the non-padding data
size but smaller than the total partition size (priv->nvmem_size), the driv=
er
calls brcm_nvram_add_cells() with a len larger than the allocation:

drivers/nvmem/brcm_nvram.c:brcm_nvram_add_cells() {
    ...
    tmp =3D priv->data[len - 1];
    priv->data[len - 1] =3D '\0';
    ...
}

Can this lead to memory corruption if reading from a malformed flash
partition?

[Severity: High]
This is a pre-existing issue, but I also noticed a potential page fault
if the NVRAM partition is completely empty.

In drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data(), if the partition only
contains padding bytes, priv->data_len becomes 0. devm_kzalloc() will return
the ZERO_SIZE_PTR token (0x10) which bypasses the NULL check:

drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data() {
    ...
    priv->data =3D devm_kzalloc(priv->dev, priv->data_len, GFP_KERNEL);
    if (!priv->data)
        return -ENOMEM;
    ...
}

The ZERO_SIZE_PTR is then cast and dereferenced in brcm_nvram_parse():

drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
    ...
    if (memcmp(header->magic, NVRAM_MAGIC, 4)) {
    ...
}

Could this cause a kernel panic due to dereferencing address 0x10 when
probing an erased flash partition?

> =20
>  		et2macaddr: et2macaddr {
>  			#nvmem-cell-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231049.1248=
899-1-rosenp@gmail.com?part=3D1
