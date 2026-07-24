Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2D427FA7
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893228; cv=none; b=Bf4e66O7ViR7RKSDs+HBcUfonvrlzP+/vvyeNCqOw4dYOXpQgGyb2TFJVn63q/PFQ0RHiUmOtB0AfsWLay4zVD4HpkL4LjVDcKcKO1H0RXccxL6VnuD0MgIvN2/PN+yoCJa3T8N56scv2o1AgAuWo4VnPhigybHnnsHkjoha3zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893228; c=relaxed/simple;
	bh=vJc/naWHERaXdiMe3vMf9clovKZ6YWAX7RBuXpWy3bY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvuGesIukatkRQgSRLOsTh/FisgUD9nf/J8kXY5vD972LOi5R/CxmltB/awn3ICvS+png9ORb/wQjIuWvzSm9jRzfB0J1A43ODGyELUCUvTUhjCBhBSdi4oXqT51zVheAG7u9BCphE3uCiVMs4pVm5creCJO3tN8RHgEsGvC+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhxazj7W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nhxazj7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BA91F00A3A;
	Fri, 24 Jul 2026 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784893220;
	bh=M4b6iHT1V+5RQz7tJC4GnVQ7LqHVcmnl2ZgJUQDy5Q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nhxazj7WnZDJRSrlup7FeGO2G08fApaPkRqe8kxIXxd3oQMmS0BwfztykD5LR2pA8
	 RSSjUARxPWiOaGP90JkH1gco79UzrM9O5CeAy7WRlg1qUlWaMoxNYsk8bFiB+To69h
	 HTP7ojyCZ0nLhSzzIgiJiPLQdvVDefRTWDAeTofAHhz/gHWEuq1b/N/i9SPw5s+Tcz
	 au+arAGOWRBI5QbejY1Pg9o+27lQaBEhnEHrMAdzUnFDbEHNJY5TymyZ+7WmXPB6P9
	 FDWbEacOzhqzlKDfvrIZ18G5yweocCgYZZaK9Kd8797gUunAZcz849fcrudBRSEyCL
	 7+QH+pVHGC7mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] nvmem: mtk-efuse: add mt6572 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-6572-nvmem-v2-3-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
 <20260724-6572-nvmem-v2-3-e58d16a29621@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:40:19 +0000
Message-Id: <20260724114020.17BA91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Flawed string matching logic in NVMEM cell fixup causes false po=
sitive matches and potential data corruption.
--

--- Patch [3]: [PATCH v2 3/3] nvmem: mtk-efuse: add mt6572 support ---
commit 859e63115931e7de172aeee767133c45a658b170
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: mtk-efuse: add mt6572 support

This commit adds platform data to support the efuse controller on the mt6572
SoC. It configures the controller to use aligned reads and explicitly disab=
les
post-processing for this device.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 178b9d85f813e..99d061eef6e33 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
[ ... ]
> @@ -132,6 +132,11 @@ static int mtk_efuse_probe(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata =3D {
> +	.uses_post_processing =3D false,

[Severity: Medium]
This is a pre-existing issue, but looking at the post-processing logic that
is toggled by this flag, does the string matching logic cause false positive
matches?

drivers/nvmem/mtk-efuse.c:mtk_efuse_fixup_dt_cell_info() {
    ...
    if (cell->nbits <=3D 3 &&
        strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))=
) =3D=3D 0)
        cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
    ...
}

Because strncmp() takes the minimum of the two string lengths, any cell name
that is a prefix of "gpu-speedbin" (such as "gpu" or "gpu-speed") and has
3 or fewer bits will incorrectly match and have its data unintentionally
modified by mtk_efuse_gpu_speedbin_pp() upon read. Can this lead to NVMEM
cell data corruption for unrelated cells?

> +	.needs_aligned_read =3D true,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-6572-nvmem=
-v2-0-e58d16a29621@protonmail.com?part=3D3
