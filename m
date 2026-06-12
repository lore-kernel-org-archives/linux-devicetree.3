Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576F1DDC38
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246854; cv=none; b=Tc07JwvIMfd+8t2JKpsWjH/IDLOFJq2J4uE7Za878AubOJhfiVgAyB0mqBLFZ6qj2BUK1z1srtVES2Cg2ytMU00W8MpvWVrYQiXy0n20aTn4KmgPiOPpzzGl/wNrGDzT3Wo1HC/9/iPo7PTxmyqaoDRpnnDQNZatoYHmxEB81yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246854; c=relaxed/simple;
	bh=4ggz/OPteFyhOkGXbkgMYKAxbmfND+ed1uPg4MohiGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u+xpmVH+1a8Mxxwbvb7qEDvReZzZtzQR4AekX8PxG0JaforkeJfr6eGClIfupZHVNbBobZbAcJVWSnFBQwrjVaXMd41e/nEHelEonTwE/qLNQ+fnRhitbb8zteA9rkVCJbaJh5CX1atB/pbJ98HuNctXO5qkHytFS/PVf70mItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvZpX+st; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvZpX+st"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760D81F000E9;
	Fri, 12 Jun 2026 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781246852;
	bh=qoHE8vA0FRK/tiM2Ch1l6c0H7HjUzkRM79/O6myVYqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvZpX+stxN5lI1LWeXtXFxwXxH7eezU2VrL31cT6MgNId9+hBoDaTpzi5bA9+IuSf
	 tFa4MkDXxF/LyVDK6dLRcxrWoh2I0/8ccxmE8fKY7EkjMd6VhE1DyVLhtkANpSwnVE
	 p0ISWpj8JyLB4dwctC6gTuI3itaalIcSMIPAgShLguomy8avrjzXKhy3Fcgl4V3RM7
	 U8nShUDCEhc3Bnj5EcarxKmc0AZz06Z+Ku4ITrFPodXoo+PV87igM1eFqsfiMhrLTZ
	 R0MaMhhUxgZGhOlMuNOAPqbM6NTvgxQ84mjOSzkhj4ta8vKJb1dFN1552OXEOvZGaX
	 3FXQ/R07qGWfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] drm/tegra: vic: Add Tegra264 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-t264-host1x-v1-6-8d934987de67@nvidia.com>
References: <20260612-t264-host1x-v1-6-8d934987de67@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 06:47:32 +0000
Message-Id: <20260612064732.760D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Out-of-bounds read when parsing the RISC-V firmware descriptor.

Pre-existing issues:
- [High] Out-of-bounds read and potential crash when parsing internal offse=
ts from the loaded firmware image.
- [High] Use-After-Free in error paths of `vic_load_firmware()` due to dang=
ling pointer.
--

commit e93ea0b6d1fe675fec33102f35c8bdffae0a5687
Author: Mikko Perttunen <mperttunen@nvidia.com>

drm/tegra: vic: Add Tegra264 support

Add support for VIC on Tegra264. The Tegra264 VIC uses a RISC-V based
Falcon microcontroller instead of the traditional Falcon previously,
and has the TRANSCFG register in a different place.

> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
[ ... ]
> @@ -85,31 +92,50 @@ static int vic_boot(struct vic *vic)
>  			CG_WAKEUP_DLY_CNT(4),
>  		   NV_PVIC_MISC_PRI_VIC_CG);
[ ... ]
> +	} else {
> +		u32 fce_ucode_size, fce_bin_data_offset;
> +		void *hdr;
> +
> +		hdr =3D vic->falcon.firmware.virt;
> +		fce_bin_data_offset =3D *(u32 *)(hdr + VIC_UCODE_FCE_DATA_OFFSET);
> +
> +		/* Old VIC firmware needs kernel help with setting up FCE microcode. */
> +		if (fce_bin_data_offset !=3D 0x0 && fce_bin_data_offset !=3D 0xa5a5a5a=
5) {
> +			hdr =3D vic->falcon.firmware.virt +
> +				*(u32 *)(hdr + VIC_UCODE_FCE_HEADER_OFFSET);
> +			fce_ucode_size =3D *(u32 *)(hdr + FCE_UCODE_SIZE_OFFSET);

[Severity: High]
This is a pre-existing issue, but does this code perform an out-of-bounds
read when parsing internal offsets from the loaded firmware image?

It appears that nested offsets are read directly from the firmware image
without verifying that the firmware size is large enough, or that the
offsets point within the valid firmware boundaries. If a malformed or
truncated firmware file is provided, could this arbitrary offset lead to an
out-of-bounds read and a kernel page fault?

> +
> +			falcon_execute_method(&vic->falcon, VIC_SET_FCE_UCODE_SIZE,
> +					      fce_ucode_size);
> +			falcon_execute_method(
> +				&vic->falcon, VIC_SET_FCE_UCODE_OFFSET,
> +				(vic->falcon.firmware.iova + fce_bin_data_offset) >> 8);
> +		}
[ ... ]
> @@ -277,6 +303,8 @@ static int vic_load_firmware(struct vic *vic)
> =20
>  	if (!vic->config->supports_sid) {
>  		vic->can_use_context =3D false;
> +	} else if (vic->config->has_riscv) {
> +		vic->can_use_context =3D true;
>  	} else if (fce_bin_data_offset !=3D 0x0 && fce_bin_data_offset !=3D 0xa=
5a5a5a5) {
>  		/*
>  		 * Firmware will access FCE through STREAMID0, so context

[Severity: High]
This is a pre-existing issue, but can the error path in vic_load_firmware()
lead to a use-after-free?

If an error occurs during firmware loading, such as a failure in
falcon_load_firmware(), the cleanup path frees the allocated DMA memory
but seems to leave the firmware pointers dangling:

cleanup:
        if (!client->group)
                dma_free_coherent(vic->dev, size, virt, iova);
        else
                tegra_drm_free(tegra, size, virt, iova);

        mutex_unlock(&lock);
        return err;

If the device attempts to load the firmware again later, it might see
the non-null pointer, return success, and proceed to use the freed DMA
memory. Could this result in IOMMU faults and potential system crashes?

[ ... ]
> @@ -495,6 +537,7 @@ static int vic_probe(struct platform_device *pdev)
> =20
>  	vic->falcon.dev =3D dev;
>  	vic->falcon.regs =3D vic->regs;
> +	vic->falcon.riscv =3D vic->config->has_riscv;
> =20
>  	err =3D falcon_init(&vic->falcon);

[Severity: High]
Does enabling RISC-V support here expose an out-of-bounds read when
parsing the RISC-V firmware descriptor?

In falcon_parse_firmware_desc(), the descriptor data is cast to
struct falcon_fw_riscv_desc and fields at large offsets are read without
a preceding length check on the firmware size:

struct falcon_fw_riscv_desc *desc =3D
        (struct falcon_fw_riscv_desc *)falcon->firmware.desc_firmware->data;

falcon->firmware.code.offset =3D desc->code_offset;

If a truncated descriptor file is provided by userspace, could this
cause a buffer over-read and lead to a kernel page fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-t264-host1=
x-v1-0-8d934987de67@nvidia.com?part=3D6
