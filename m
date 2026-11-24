Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506147;
	b=HZpPaN7lCRYTzUtwFbF+Z9VS6WlfMVuGOWWHvtDz4AlB7QnOW6S8edj2x6lgImfhIzao
	 6jo0IZEMyy0CXuQPU0f7eUm34J6F7Xpl5MlonTMPO+pHFe8GEGURmhbb44lac5mZRwysB
	 W2T42PqLjSbZEEebttFRUcTyUb73+v3aUC2VMSYsS8aDxVZOMfnuXb/hymaqdp2Ogodx7
	 FqXgE0aI8/DaUu9u10oS7lxiy50C5Y9QQA/8H4WdbqLq3mymfZyP8+JUIZPMMDw2tr11G
	 /gCCt6Byv47JGQvUkQ8LURNEbqJwr+jR140tXdkIx2U4rU83pgvZkM3xl2MEf6KdfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506147;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NGM8sWwmSXy2bJTNv8B4+e5mZkb7EV+I251JBAcptHg=;
	b=CP9C7yymh8QFXl6xcHmTh7d0Ur9Fdcgfh5+E9aV3Xzse47qiTHQJoztth+9mP6B6eD+b
	 4g4HzwVgX0VD5nf4IL9FGm3hRP4pZvZ5nRLebH7il4m2ZPmbXCmDciqp1uoVasj1Dlpv2
	 YWuPINk1tMSPqt2goR0NALDQgYnn0KmHSIMx55qq/c+vBETMyQwLT2yNzCXWx2WuBmToH
	 R3V7VvD5/wGetS3lTPzgSpi2AkPNqWm0RCpShLBw6ttdQXPe4vmkf2jVcpgAl7aX/kGXW
	 zTAZJgGAe4EGouOMQndprTplf7U+kN0aHrlIkhnQV9hxZFCh2ecsAbjj7pj3K1nxbcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp+GlE6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B9606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp+GlE6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02B51F000CA;
	Tue, 24 Nov 2026 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506147;
	bh=NGM8sWwmSXy2bJTNv8B4+e5mZkb7EV+I251JBAcptHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gp+GlE6v14H52hOpxJC+MoEbinUapfdkkwf+1BPQwemnFq6kTLfiPRmYmu7A4I4XR
	 0oxwE5XRZf7891DxOAVrrE4QoQ2M9AgI5UGpKc63o2z6VZOtZW0Y1CNEJyzeOSwrCX
	 AfRQZbtYmogWDweaAOBmkYUdCGlCe3SPlvr3hq4JUlhQ/WpLWuCKm7hWtvYO6GEian
	 L58hjI7PmbFqST0deIeAFxpxDvPE8tPZpQ5ybLR0zUb9AetpQem1U8yLTpEBEN4HDu
	 PfYx+sj/ozNnhJy6TKUEQyzY/qSF3FgOV2wCpbAwlPKo15OFT7Uz1gxE/RzrJ2EpZg
	 j3d0IvMtCC/bQ==
Message-ID: <sashiko-outbox-230660@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124072924.556678-3-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
 <20261124072924.556678-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 07:42:26 +0000
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
- [Low] nvmem: sophgo-efuse: unnecessary add_legacy_fixed_of_cells in
  probe
- [Low] nvmem: sophgo-efuse: commit message misdescribes indirect
  register read
--

commit 35eaad0514f43d8079e979919f4e2f5fc25d9f4a
Author: Inochi Amaoto <inochiama@gmail.com>

nvmem: Add Sophgo SG2044 eFuse driver

This commit adds an NVMEM provider driver for the eFuse controller on
Sophgo SG2044 SoCs.

> As for SG2044, HW automatically loads the eFuse content
> into shadow registers which are organized as 32bit values
> exposed as MMIO.

[Severity: Low]
Does the commit message match how the driver accesses the hardware?
Instead of reading a bank of MMIO shadow registers directly,
sg2044_efuses_read_strip() writes the word address to SG2044_EFUSE_ADR,
triggers a read command in SG2044_EFUSE_MD, polls for completion, and
reads the result from SG2044_EFUSE_RD_DATA.

> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> new file mode 100644
> index 0000000000000..d42f18f368285
> --- /dev/null
> +++ b/drivers/nvmem/sophgo-efuse.c

[ ... ]

> +static int sophgo_efuses_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sophgo_efuses *efuse;
> +	struct nvmem_config config =3D {
> +		.dev =3D &pdev->dev,
> +		.add_legacy_fixed_of_cells =3D true,
> +		.read_only =3D true,

[Severity: Low]
Should a new driver set add_legacy_fixed_of_cells =3D true?  That option
was introduced in 2cc3b37f5b6d ("nvmem: add explicit config option to
read old syntax fixed OF cells") for legacy bindings that reference
nvmem-deprecated-cells.yaml#, whereas the sophgo,sg2044-efuse.yaml
binding only allows nvmem-layout cells via nvmem.yaml#.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124072924.5566=
78-1-inochiama@gmail.com?part=3D2
