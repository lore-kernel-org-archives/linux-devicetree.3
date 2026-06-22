Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02007233149
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782112122; cv=none; b=gyccA4ybyEUzaHR+2kw9JBnemu3E5jxyFpa5K869jx43jEZbx1GFLnrN7U/oTzwJ1/hZX1BOpYrkzX/nCvObdV4zIkrF7K9kEuFbZH5ZwrYavdt0bRk3+SyxtvTKHoFAHBFwCAKe4GSfm8w862beifspdaqEurjkHp7HjmgnTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782112122; c=relaxed/simple;
	bh=hg6wwFd1SPbkWY6GKmFTgTGW9bkdn1AHpduohE/CoqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lu7EaAU0GO3aQFGrRFDKnQBjVAUYKceqVlJB/hl65xIsQ9ZNH3aOlJLTX18TgAxD3VS/Djqiy7LDBi7yD38okzVX4NzqBYhaSjtTY7HZqWIQz1LhwXxhANsXb552Aj842wTkzjW3UMZazB8Xk8XQqpXT63S18Jc1oEKYhbubtBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqEKGAV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqEKGAV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567391F000E9;
	Mon, 22 Jun 2026 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782112120;
	bh=V31gL4OYl0/uRXC4ZDNPMdp1oUQ0/6DdvCPuDgOUckI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TqEKGAV3+rEKVpj4FkdH4p3Re96FiJ3EgZNONAQKod5nxeISmjtbYNOfIwkd1o5E/
	 Tryx6Napukgz4+ND62s+vi0RRYG2caqN+EZCOgZPQRQxTZRirXeN59PZia/s8cmoTt
	 o6x5XukV4ZLd28VkfUpKwm8vyP1RLI5j1F/nHjPE2+LJ35KipzcNh8nEWqAMe0bNBc
	 ceTEsmikZEqmbYX969qXn9qA4dkRx7g1WV90I5LyOL1d+nCepnmegSxvJDQc94+avZ
	 6mBGEqenEG+LaaEHwU8e0GceVAntIMKsYyOPOGFhPLQnZdqoWYAezdpnwwUhhNfkt5
	 xFbq3jL4hH64Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] drm/tegra: falcon: Add support for RISC-V
 external boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260622-t264-host1x-v2-5-ff7364d9ff7b@nvidia.com>
References: <20260622-t264-host1x-v2-0-ff7364d9ff7b@nvidia.com>
 <20260622-t264-host1x-v2-5-ff7364d9ff7b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 07:08:39 +0000
Message-Id: <20260622070840.567391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing bounds check, endianness conversion, and size validation o=
f the RISC-V firmware descriptor leads to out-of-bounds memory accesses and=
 unbounded DMA.
--

commit ce83e1285215f11b260dbf628363fe352ce09b78
Author: Mikko Perttunen <mperttunen@nvidia.com>

drm/tegra: falcon: Add support for RISC-V external boot

Add support for loading and booting RISC-V firmwares on Falcons with
RISC-V hardware.

> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falco=
n.c
> index 17f616bbcb45b..1172356b6af3b 100644
> --- a/drivers/gpu/drm/tegra/falcon.c
> +++ b/drivers/gpu/drm/tegra/falcon.c

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
> +
> +	falcon->firmware.code.offset =3D desc->code_offset;
> +	falcon->firmware.code.size =3D desc->code_size;
> +	falcon->firmware.data.offset =3D desc->data_offset;
> +	falcon->firmware.data.size =3D desc->data_size;

[Severity: High]
Does this code need to validate the size of desc_firmware before casting its
data to struct falcon_fw_riscv_desc? If the firmware file is smaller than t=
he
struct size, this could lead to an out-of-bounds read.

Also, do these fields need le32_to_cpu() conversion for big-endian systems,
similar to how the main firmware is handled in falcon_copy_firmware_image()?

Finally, are the parsed sizes and offsets validated against the main firmwa=
re's
size? If not, these unchecked values could cause out-of-bounds host memory
accesses later in falcon_boot() when they are used in the falcon_copy_chunk=
()
DMA loops:

    for (offset =3D 0; offset < falcon->firmware.data.size; offset +=3D 256)
        falcon_copy_chunk(falcon,
                          falcon->firmware.data.offset + offset,
                          offset, FALCON_MEMORY_DATA);

> +}
> +
>  int falcon_read_firmware(struct falcon *falcon, const char *name)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-t264-host1=
x-v2-0-ff7364d9ff7b@nvidia.com?part=3D5
