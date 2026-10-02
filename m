Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80A471414
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932420; cv=none; b=qpXqYHB3kpvz5E4cfcd/QzlEKTyECaXOQL8bCF35UHoSapL2tvZEafwhT1DJuyor8mbg6vX6pt4cm4m224lGGkKcijQpoH1GLcp7p2x4SQnpAwFeDi4Vr7APX9hQW7SvBltug/tiSNJ8V7sWE+QABGPcmkDxFGk5+Mcb3/ZwKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932420; c=relaxed/simple;
	bh=ceEcGeiMlLS6VoRkGuacDV1x891r04VDIM5M8zSXFa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ryfk1TKe6TJ/xXckU8d8s9EAD7HyGjyx4aS31aBQhOJDJb9U195zOcflaXY0jgWcKmhxvQOBBLK2nDqiRJBknK9qS0YlnaziwOketTQP/x+NNHlZ0A3OuP6EkJOaW/TTkdKZ42uJw496wkpHlqIYOVePIx1e2CBiyjiDvjO48+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSwNg7VL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSwNg7VL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12D61F000FF;
	Fri,  2 Oct 2026 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932419;
	bh=lQpHxXrgcHGmPDso1i/PAHUzqg8Z2HyjirRrA/Ae8zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSwNg7VLR/j3w13dQYgKLRQ9WmVytoSIdeVBm2PxwwgcqyRpHdZK0dgfSumPbzJwJ
	 f11gXiNBZUZCId8hNp6Vagi6MOr3cvo7/8/I1eGcGkd8bSiM6uKmElowxwbNfJcut7
	 X+HhHp7je37mH48jy7GFmBeSwEDrqhu+iJL5LhzJ+5WlTbBvxHx4TCe3CpH+SAJsUr
	 neane66/6hr0YhzTwjOs6/f7IoGWwqO7ucqgO3ViGTqRTW7bOxkAJDWR9ypLIC+Y8H
	 o5SvXgUsBkCD+w7TG4V+fBR62zuP76SZajMnW3THKd+eWp7An3V5nnxr63zFaNyFO3
	 xAgebCk0ZDkIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 06/13] dt-bindings: display: add a boot logo node
 under /chosen
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TcOgeGltIFBlZHJhemEgUGFkaWxsYQ==?= <maximpedraza@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20261001195847.141192-7-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
 <20261001195847.141192-7-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:38 +0000
Message-Id: <20261002091338.E12D61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: display: boot-logo memory zeroing leads to spurious=
 drm_err
--

commit 3ef097b6e764420e6247f9d9dcc28aba1f88538d
Author: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>

dt-bindings: display: add a boot logo node under /chosen

Products built on the same board often differ only in branding. On UEFI
systems the firmware hands the operating system its boot logo through
the ACPI BGRT; a device tree system has no such table, so today the logo
is built into the kernel, and each product needs its own kernel image.

> diff --git a/Documentation/devicetree/bindings/display/boot-logo.yaml b/D=
ocumentation/devicetree/bindings/display/boot-logo.yaml
> new file mode 100644
> index 0000000000000..b540a04deb789
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/boot-logo.yaml
> @@ -0,0 +1,151 @@
[ ... ]
> +  memory-region:
> +    maxItems: 1
> +    description: |
> +      Reserved memory region the bootloader loaded the BMP file into, st=
arting
> +      at the beginning of the region. The BMP header says how much of the
> +      region is image.
> +
> +      This keeps the image out of the device tree, so that it can be cha=
nged
> +      without rebuilding the device tree, for instance by loading it fro=
m a
> +      partition of its own that userspace can update.
> +
> +      Memory keeps its contents across a reset, and may even across a sh=
ort
> +      power cycle, so a bootloader that loads no image into the region h=
as to
> +      clear it: the operating system cannot tell a stale image from a fr=
esh
> +      one.

[Severity: Medium]
Does clearing the memory region result in the OS trying to parse zeroed mem=
ory?

If the bootloader follows this documentation and zeroes the memory region w=
hen
there is no image, the kernel will still parse the static /chosen/logo node=
 and
map the memory region.

This causes drm_splash_bmp_to_scanout() in drivers/gpu/drm/clients/drm_spla=
sh.c
to read 0x0000 for the magic bytes:

	bmp_id =3D get_unaligned_le16(&file_header->id);
	if (bmp_id !=3D BMP_FILE_MAGIC_ID) {
		drm_err(client->dev, "splash: invalid BMP magic 0x%04X", bmp_id);
		return -EINVAL;
	}

Because of this, the kernel will emit a spurious error on every boot where =
no
splash is provided.

Would it be better for the bootloader to dynamically inject the /chosen/logo
node or the memory-region property only when an image is successfully loade=
d,
rather than relying on the OS to parse and reject zeroed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001195847.1411=
92-1-maximpedraza@gmail.com?part=3D6
