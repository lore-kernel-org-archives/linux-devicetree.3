Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1863D813F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246679; cv=none; b=drDWXSQrrg0jGeDtu2Ultgugsgf9OjLvCrpolQptTNPtbebjxeFyA6O5A4X4DY9xkfWk26uXmnnm+7hWUbsQJEtIh90VMSUdQwVR/XDFhk6UW9t5Yp+O9Jzcs55w40BNYVaRDJhTRxo9ecfi/deBikSFWnhQ841KSZT9W2+kuKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246679; c=relaxed/simple;
	bh=tMFjQcYVuvAyg4OxNLiudTobzj2+lojeqi++e1QJpNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uCfIiC3AbVhmixB87NVf+qUwi/jodGS9iRdgOX764s3GJ7h9FyNgrY9KepeXMEKtVAHH+wqDjeBM6HGKzhsKRvV/A7vl0x/fOB64Q23AhhtjjBq7qpaIhv18TXqb1a6xMFTy/lBXgcXYCtBkmmo2wXvgzPCe/mVGzo+7Lq64BfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KF0sA6pS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KF0sA6pS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC701F00A3A;
	Fri, 12 Jun 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781246678;
	bh=eTErHePYoLyGkrZLddn9Cyf5hPUTgyi1F17SqUCOu5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KF0sA6pSUUnE2elvhCgH5juRmutyxl4yhstp0gJe8Z5lkCVnl3Npvc5wlcu81a1Qq
	 Ty5is8lWrlf87sBzpIL3meKQthvrtRYpJZRFsWBa3Xyp7StlEjdwl5yH8xEMnh3ljo
	 m+vHm0CYGCF0qaG3J2S9T8L0tlhjW5sg6xrfRdhq9ihA1z8xtb++WQ0GM9W7qeTqgd
	 tVpT9e5++mrvS0sfrDrbabGXLb1u4x3Pq+Djl3cNBaFwS6AbvABLsC8XH58sW5LNqE
	 gDNu12GiWMKdrmJpfyvS3F0Y4hb/yWeLkYhGtvN80vvqlCu1YIHACGHUxrreFEPhxa
	 nD4RWrchoQQ9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] drm/tegra: falcon: Add support for RISC-V external
 boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-t264-host1x-v1-5-8d934987de67@nvidia.com>
References: <20260612-t264-host1x-v1-5-8d934987de67@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 06:44:37 +0000
Message-Id: <20260612064438.0EC701F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing size validation for the `.desc` firmware file allows an ou=
t-of-bounds read of the firmware descriptor buffer.
- [High] Inverted condition in `falcon_wait_idle()` for RISC-V incorrectly =
waits for the CPU to become active rather than idle, causing premature retu=
rn.
- [High] Firmware segment offsets and sizes from the `.desc` file are not v=
alidated against the main firmware buffer size, leading to out-of-bounds DM=
A reads.
- [Medium] Missing endianness conversion when reading `u32` fields from the=
 `.desc` firmware descriptor breaks on big-endian architectures.
--

commit 9b921eae84dc7cacf7c324bd76e166d6a5d942be
Author: Mikko Perttunen <mperttunen@nvidia.com>

drm/tegra: falcon: Add support for RISC-V external boot

This commit adds support for loading and booting RISC-V firmwares on Falcons
with RISC-V hardware. It introduces a new firmware layout and uses different
registers for the boot flow compared to traditional Falcons.

> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falco=
n.c
> index 17f616bbcb45b..1172356b6af3b 100644
> --- a/drivers/gpu/drm/tegra/falcon.c
> +++ b/drivers/gpu/drm/tegra/falcon.c
> @@ -26,8 +26,12 @@ int falcon_wait_idle(struct falcon *falcon)
>  {
>  	u32 value;
> =20
> -	return readl_poll_timeout(falcon->regs + FALCON_IDLESTATE, value,
> -				  (value =3D=3D 0), 10, 100000);
> +	if (falcon->riscv)
> +		return readl_poll_timeout(falcon->regs + RISCV_CPUCTL, value,
> +					  (value & RISCV_CPUCTL_ACTIVE_STAT_ACTIVE), 10, 100000);

[Severity: High]
Does this condition successfully terminate when the CPU is active rather th=
an
idle?

If falcon_boot() calls this immediately after issuing the STARTCPU command,
the processor will instantly become active, and the wait will return
immediately instead of waiting for the processor to go idle. Would negating
the condition to !(value & RISCV_CPUCTL_ACTIVE_STAT_ACTIVE) correctly wait
for the firmware boot sequence to finish?

> +	else
> +		return readl_poll_timeout(falcon->regs + FALCON_IDLESTATE, value,
> +					  (value =3D=3D 0), 10, 100000);
>  }

[ ... ]

> @@ -122,6 +126,17 @@ static int falcon_parse_firmware_image(struct falcon=
 *falcon)
>  	return 0;
>  }
> =20
> +static void falcon_parse_firmware_desc(struct falcon *falcon)
> +{
> +	struct falcon_fw_riscv_desc *desc =3D
> +		(struct falcon_fw_riscv_desc *)falcon->firmware.desc_firmware->data;

[Severity: High]
Is it possible for the loaded firmware file to be smaller than
sizeof(struct falcon_fw_riscv_desc)?

If a truncated or malformed .desc file is loaded from userspace, could
casting and reading desc_firmware->data here result in an out-of-bounds
memory read of the allocated buffer?

> +
> +	falcon->firmware.code.offset =3D desc->code_offset;
> +	falcon->firmware.code.size =3D desc->code_size;
> +	falcon->firmware.data.offset =3D desc->data_offset;
> +	falcon->firmware.data.size =3D desc->data_size;

[Severity: Medium]
Do these assignments need endianness conversion, such as le32_to_cpu()?

The older .bin parsing path safely copies and byte-swaps the firmware via
falcon_copy_firmware_image(). Since this RISC-V path appears to perform
no conversions, could reading these fields directly from the raw byte
array produce incorrect, byte-swapped values on big-endian architectures?

[Severity: High]
Are these offsets and sizes validated against the main firmware buffer size?

In falcon_boot(), these sizes are used to calculate bounds and program
the Falcon hardware DMA engine via falcon_copy_chunk():

falcon_boot() {
    ...
    for (offset =3D 0; offset < falcon->firmware.data.size; offset +=3D 256)
        falcon_copy_chunk(falcon,
                          falcon->firmware.data.offset + offset,
                          offset, FALCON_MEMORY_DATA);
    ...
}

If the values are not checked to ensure
offset + size <=3D falcon->firmware.size, could a maliciously crafted .desc
file instruct the DMA controller to read out-of-bounds physical memory?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-t264-host1=
x-v1-0-8d934987de67@nvidia.com?part=3D5
