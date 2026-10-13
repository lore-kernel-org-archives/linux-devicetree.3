Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF363DDB1C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884598; cv=none; b=nvY3iRU9P70Xc6DfYvOvI3IPyJjrVXU/Umwm3agVh2qhhL2D9/j8aHEMPofaXxfoS1E+F3g0AOwiQN2mgBF07ATxinUvBWKdPk6FfTzFYjT9XmwHh3Bpqm4LPE4zhtwptFEw9PfGkcJ+KbmFQudZ5NAkr7H3h8WmxCxot+h4bLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884598; c=relaxed/simple;
	bh=xDFB1CMvJHv3SmoebI86dksPMjdPMjHS2QaUreo2Mgk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rUkEtk3NQQ3axkz28X/oR4CgXfQS+HBWqQLM1SASI9zlnfmeUpYQCjgwlhTCvlQlPJHvheILlG+2ZUfM9lj9n3zL5yNcPA4bzYqnbVRgb6FdwoPWOJw2ROZaGtCloKJPOTDasOMEwrhAg3JB9Xi9qK/LYsnw/vzst1Gam59lhT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JssDXN1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JssDXN1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62971F00893;
	Tue, 13 Oct 2026 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884596;
	bh=vCxbe98fm8JtqGDRymMMIUXgVhlVpMhs9L7sp1YMgrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JssDXN1WFpnmXOW0aVbDEfvjk7lRxKXMt/i6T/tgwqMPz77Faxt5IwHPBLffdMtj1
	 y0Lxw3bevIgkii98acQ3K8gSc6SmdjYuEQb67IbUObR9Z238Gq115JkyQNt336ag+W
	 2zLOJ6V4Bw2/rnnD2falZ8r1TRu/MEuhP0D69prSk19Qhd56Dh/tBAkVc7LNIB/KS8
	 bjmoMMD8yezA14fHIGiV1BVL8EDAyQ9RqqiNrhHPk4glPo7kWv+3zyZ54xOAaNj/PP
	 QNjNBlVFdJMKY6oYCulz5AeTgNmsjjaxb5VQeRiHYy2jdzGqXSYdrE8hDuGX2ix/Ag
	 Vl2z5ydRE2yVw==
Message-ID: <sashiko-outbox-169372@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TcOgeGltIFBlZHJhemEgUGFkaWxsYQ==?= <maximpedraza@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013093243.505776-4-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
 <20261013093243.505776-4-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:43:13 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm: out-of-bounds read and unaligned access in BMP blitting
- [High] drm: integer overflow in BGRT padding validation allows OOB write
--

commit 099d44ed94a2ad19b8702756f34790d1e8ae5693
Author: Francesco Valla <francesco@valla.it>

drm: client: add splash client

This commit adds a new DRM client to draw a simple splash screen during boo=
t.
It supports displaying an EFI BGRT logo, a static BMP image loaded via
firmware, or a plain background color. The splash can be enabled via kernel
command line parameters.

> diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clien=
ts/drm_splash.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/clients/drm_splash.c
[ ... ]
> +static void drm_splash_blit_pix16(struct iosys_map *map, unsigned int dp=
itch,
> +				  unsigned int x_pad, unsigned int y_pad,
> +				  const u8 *sbuf8, unsigned int spitch,
> +				  unsigned int width, unsigned int height,
> +				  bool invert_y, u32 format)
> +{
> +	unsigned int x, y, src_offset, dst_offset;
> +	u32 scolor, dcolor, wr_off;
> +
> +	for (y =3D 0; y < height; y++) {
> +		src_offset =3D (invert_y ? (height - y - 1) : y) * spitch;
> +		dst_offset =3D (y_pad + y) * dpitch;
> +
> +		for (x =3D 0; x < width; x++) {
> +			scolor =3D *(const u32 *)(&sbuf8[src_offset + 3 * x]);

[Severity: High]
Could this 32-bit cast cause memory safety and endianness issues?

The code casts a byte pointer to a 32-bit integer pointer to read a 3-byte
(24bpp) pixel. This introduces a few potential problems.

First, it performs unaligned memory accesses, which can trigger fatal
alignment exceptions on architectures that do not support hardware unaligned
loads, such as SPARC or some older ARM platforms.

Second, for the last pixel in an image row where there are no padding bytes,
the 4-byte read extends 1 byte beyond the end of the row. On the final row =
of
the image, this reads 1 byte past the end of the mapped memory buffer. This
could trigger a KASAN out-of-bounds read or a fatal page fault if the read
crosses an unmapped page boundary.

Finally, on big-endian architectures, reading the 3 bytes plus an arbitrary
4th byte directly into a u32 will scramble the internal BGR color channels,
resulting in corrupted colors.

Does this same cast pattern need to be addressed in drm_splash_blit_pix24()
and drm_splash_blit_pix32() below as well?

> +			dcolor =3D drm_draw_color_from_xrgb8888(scolor, format);
> +			wr_off =3D dst_offset + (x_pad + x) * sizeof(u16);
> +
> +			iosys_map_wr(map, wr_off, u16, dcolor);
> +		}
> +	}
> +}
[ ... ]
> +	if (splash->use_bgrt) {
> +		x_pad =3D efi_bgrt_image_offset_x();
> +		y_pad =3D efi_bgrt_image_offset_y();
> +
> +		if ((x_pad + bmp_width) > scanout->width ||
> +		    (y_pad + bmp_height) > scanout->height) {

[Severity: High]
Is this bounds check vulnerable to an integer overflow?

The x_pad and y_pad values are sourced directly from the ACPI BGRT table
via efi_bgrt_image_offset_x() and efi_bgrt_image_offset_y(), which return
32-bit unsigned integers. Because x_pad and scanout->width are unsigned int,
and bmp_width is a positive s32, the addition is evaluated as an unsigned
integer.

If an attacker provides an extremely large value for x_pad, such as
0xFFFFFFFF, in a compromised ACPI table, x_pad + bmp_width will wrap around
to a small number. This would bypass the greater-than scanout->width check.

Later during blitting, these wrapped offsets are used to calculate the write
offset. For example, calculating wr_off =3D dst_offset + (x_pad + x) * 3
would result in a massive out-of-bounds write and potential kernel memory
corruption.

Would it be safer to check these bounds using an overflow-safe method, or
perhaps by checking if x_pad > scanout->width - bmp_width?

> +			drm_err(client->dev, "splash: BGRT image would overflow");
> +			return -EINVAL;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013093243.5057=
76-1-maximpedraza@gmail.com?part=3D3
