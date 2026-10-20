Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490220;
	b=Sxh3eXkrU9AuHxqjrtVXIbh6KTjuX+2bXG54NcgxtVCWHa120Arcs7eA1HgTcZ89Xkgz
	 rr3/ASE5SzPAGzUjgfVWKpR8/yaItOVwPDYUpTkKMaJqNZNbozrnyIjYa9Msj6I2gdAM3
	 VzmeJzqIis0aTNci7Dz4nCuiHEBQ98eE1TS8NWnxRni96MwhXihlwL4MoeC60xcQ+EXwP
	 6PhalMKyOY2EgHMAhDq7z7IzoVJiKQvFdhFwCvpy2m/EAYv6ae+wvklLHNV9ysNScmbzb
	 +nWth+ltYBgB4RxKybaggBhjzQWfzYvJT+3iNZtm8ZlSey58fn3uceSvnklRBMuJkZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490220;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ChcyiZ5QX3Gi7QwiG9OeiOwQvMYYaQJ5AesOQ7M+OfA=;
	b=igkskGqLMOZ/oMEHt8a/RhkzIjsfTrVupFKDhJkWHCfVX0PSE4HNmYOEs1kgEwp1oEnb
	 TSMh0/ait+1lzCcrJVStMuLCuHtVdLwVJNWiQYrWjIAIVxXftXnSwfRqppSLcn/Rq+JKN
	 UDJHV3t8S0Lhf9pMu26IyV7vI/FFIESJ8xWtBbyE3TL4A8/MsDdCGYs5QDzTaSkgGiFcl
	 Zo4DH5AYXxGYbrOTUqqmJMejbOS/dnzZlPltZ/lpL51bbAQzwby8h2SkxB57NnyNEFXDO
	 ISH1FtSG1FkBQkOcNZbpCON2UrXYRHVqnxEUb7ZfCABd7JzeITU21SKxOa76lfmiW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mR63jmZD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5E606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mR63jmZD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D481F000C4;
	Tue, 20 Oct 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490219;
	bh=ChcyiZ5QX3Gi7QwiG9OeiOwQvMYYaQJ5AesOQ7M+OfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mR63jmZDIUO12dpYH56ZFpj9DMuKYHsG1fLCJ5iwMNSqr/zzWj6AYIY4Ayei/6Yjs
	 ATvThsrQTRJG5pxXTuUhL6GHerhX4pWgZ75NsLRXAyrT6H33SjWYPQ7B7sVTl4QagD
	 uD977vFI9dJamZb8o0NWXnkHFcqJohtIPBQRmyNqccIBlcupndO2PVHNzUqo+7g1/V
	 FeweWdcUjFv90REtW25Vk7Jdbq5MYdaUNjYSA0I48WGv5toXwjsdOX8z7//9cjYwth
	 DWQI4U4SdTQBA6ScACIV7gTUPgtSZc6Sps+/zFleHrJTH0mv67/Zobvwa7iy3TGHZi
	 N5Dqgkdluzh3A==
Message-ID: <sashiko-outbox-178775@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/17] media: v4l2: Add Apple interchange pixel
 formats
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 09:56:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: v4l2: missing uAPI documentation for V4L2_PIX_FMT_APPLE_AX* =
formats
--

commit d684a5929494768cf0717a93efaa873095757868
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: v4l2: Add Apple interchange pixel formats

This commit adds six Apple Interchange compressed and tiled pixel format
identifiers to videodev2.h along with their descriptions in v4l_fill_fmtdes=
c()
and format info entries in v4l2_format_info().

[ ... ]

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5472e433ed06e..f218f4fb26a42 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -842,6 +842,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B') /* =
PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M') /* =
PiSP 8-bit mode 2 compressed monochrome */
> =20
> +/* Apple Interchange, compressed and tiled formats */
> +#define V4L2_PIX_FMT_APPLE_AX12	v4l2_fourcc('A', 'X', '1', '2') /* Apple=
 Interchange NV12 */
> +#define V4L2_PIX_FMT_APPLE_AX16	v4l2_fourcc('A', 'X', '1', '6') /* Apple=
 Interchange NV16 */
> +#define V4L2_PIX_FMT_APPLE_AX24	v4l2_fourcc('A', 'X', '2', '4') /* Apple=
 Interchange NV24 */
> +#define V4L2_PIX_FMT_APPLE_AX03	v4l2_fourcc('A', 'X', '0', '3') /* Apple=
 Interchange P030 */
> +#define V4L2_PIX_FMT_APPLE_AX23	v4l2_fourcc('A', 'X', '2', '3') /* Apple=
 Interchange P230 */
> +#define V4L2_PIX_FMT_APPLE_AX43	v4l2_fourcc('A', 'X', '4', '3') /* Apple=
 Interchange P430 */

[Severity: Low]
Documentation/userspace-api/media/v4l/videodev.rst includes
include/uapi/linux/videodev2.h with:

.. kernel-include:: include/uapi/linux/videodev2.h
    :generate-cross-refs:
    :exception-file: videodev2.h.rst.exceptions
    :toc:
    :warn-broken:

When building the documentation (make htmldocs),
ParseDataStructs.parse_file() in tools/lib/python/kdoc/parse_data_structs.py
generates :ref: cross-references for every #define macro in
include/uapi/linux/videodev2.h unless exempted in
videodev2.h.rst.exceptions, and check_missing_refs() in
Documentation/sphinx/kernel_include.py warns on unresolved references.

Should these six new V4L2_PIX_FMT_APPLE_AX* formats also be documented in
Documentation/userspace-api/media/v4l/ (for example, in
pixfmt-reserved.rst) so that building htmldocs does not emit broken
cross-reference warnings for v4l2-pix-fmt-apple-ax12,
v4l2-pix-fmt-apple-ax16, v4l2-pix-fmt-apple-ax24, v4l2-pix-fmt-apple-ax03,
v4l2-pix-fmt-apple-ax23, and v4l2-pix-fmt-apple-ax43?

> +
>  /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixel=
s */
>  #define V4L2_PIX_FMT_RAW_CRU10	v4l2_fourcc('C', 'R', '1', '0')
>  #define V4L2_PIX_FMT_RAW_CRU12	v4l2_fourcc('C', 'R', '1', '2')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D3
