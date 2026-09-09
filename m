Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397D5437CD
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953323; cv=none; b=UuOOaLoQrtpCSoYgybY2ErOLAFhO++2AnpgyPwzaYFg7xTmiAxMSA3KLOTZ/sUMxlX/Cwv5rv4EgE/TbMczDyh8s8wGPkN6bZDcvm/+ZADfzpInnGvtZIe/QE0SCqa+t4rilOpXMrAGN7wdZKKRAqchsCSvwe+fLQTMFzo1IcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953323; c=relaxed/simple;
	bh=uA0rX1Hd/dM/Wr/7O55MDGFaNqohsTXQCJB+14CkuKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMhbJx+QKNmsfOtvA9N8g7TZv0GdmUuHnTE6iH3kHIYUMTk2GlRuuPgLb2IcKkIXBBZlhXUDnNWCvZfSSH9gXJtILxXj8bFAkFQSwOgsqpAMbsMuQk94h7a9OOBUTNne0IOBN5AgqcxeLnSgwIPgIP8hcvth5kFz45GBew/8VgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3UGcrBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3UGcrBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A241F00A3D;
	Wed,  9 Sep 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953321;
	bh=tMMeFeB3upQYHEmlPCeIqq+gZWgBLspluTrrDFLMmDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H3UGcrBTd+CyIM8LDdROsqlr4+3uO6qYc2lwvhADyO48TZJSxBGH6tUrm2OU0g2Xy
	 18FZYvYmVkzHLLOC7eHsRxiVXOvDhHCEiAx94xxCyMZdiU2nJR0kmfaz6GZ99VrtQ6
	 cygHXrR8Ep8AALvhi8ymplix9b4E2wgSEAZswQ6bX7/ONFf9mn+CO0gzMJI65CDW0Y
	 Aq3iApW7d88ShPJvLtQBZWu6Byr4hW/E4sfOtJXbPIxw2aQriNepZ27/MDRBp11vr2
	 m083Lr8F2rNlNYDu2hyWLw46ahw/+DhwermkjsS5lSFuseaV9pN/Ik/yaeVM2Cb5U4
	 GWoYxHzba8V0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] nvmem: mtk-efuse: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-6572-nvmem-v3-3-c0c441656431@protonmail.com>
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
 <20260909-6572-nvmem-v3-3-c0c441656431@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 11:28:41 +0000
Message-Id: <20260909112841.A0A241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Flawed string comparison logic in `mtk_efuse_fixup_dt_cell_info` a=
llows unintentional prefix matching.
--

commit a7b90ac028ac0c3f0279ff49927a48455c13bc74
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: mtk-efuse: add mt6572 support
   =20
This commit adds a platform data struct for the efuse controller to support
the MediaTek MT6572 SoC, configuring read alignment and post-processing
behavior.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 178b9d85f813e..99d061eef6e33 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -132,6 +132,11 @@ static int mtk_efuse_probe(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata =3D {
> +	.uses_post_processing =3D false,

[Severity: High]
This is a pre-existing issue, but while reviewing the post-processing logic
controlled by this flag, I noticed a potential flaw in how cell names are
matched.

In mtk_efuse_fixup_dt_cell_info(), the string comparison allows shorter str=
ings
to falsely match as a prefix:

drivers/nvmem/mtk-efuse.c:mtk_efuse_fixup_dt_cell_info() {
    ...
	if (cell->nbits <=3D 3 &&
	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) =
=3D=3D 0)
		cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
    ...
}

Because it uses min(sz, strlen("gpu-speedbin")), wouldn't this incorrectly
apply GPU speedbin post-processing to any NVMEM cell whose name is merely a
prefix of "gpu-speedbin" (e.g., "gpu" or "gp") as long as it has nbits <=3D=
 3?

Could this lead to unintended data corruption by incorrectly modifying the
hardware read value for those unrelated NVMEM cells?

> +	.needs_aligned_read =3D true,
> +};
> +
>  static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata =3D {
>  	.uses_post_processing =3D true,
>  	.needs_aligned_read =3D false,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-6572-nvmem=
-v3-0-c0c441656431@protonmail.com?part=3D3
