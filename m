Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675237FF68
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737972; cv=none; b=MCrp8NJ+zDGztHcTAROXxwQSkloJryO8PFu4jXfJrES3i99JdBWPTPurTPclULLTNMEVtF+wKqSooWahsqd2kYct1J7YuiBbAqcEfUu/imgKLs2ZAYlXduP0U1mVSrEmS5tZ07MFPDSlwiKHDaMhB6xZlrXk4vyc40GKmNPT3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737972; c=relaxed/simple;
	bh=Akg3UHI2wwPq7G3HMBSDEB6u5ZX4KBThNeik+q2NV1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LolLgUlahFaeYJuGikwAN4Q6pOCxnhWVZAgv1MtHc0W1Rr2tSNLP7Av/CdIfNwFY4g6BKTYRvc/P8YMEyEPWf12gofK3zga2nbXHkCMOe0fREABkDRZlnmu7oKyjN1i6hQXPPdEH7hvbr6WDzKUfRYu9tXRXfpR78XEYzUZEdAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1nj1x4V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1nj1x4V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30E1F000FF;
	Fri, 18 Sep 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737970;
	bh=IbFC2bZN27V5NLKp6j3q0DiSvXA5P8YgfCAmlxfpYtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1nj1x4VRISZY9uuNR2n35+Ij1WAGI3DhtM2GzKI+JgoclVq3BKzYPbrSFlJjbqsN
	 WiE3e3O8RE7xg1MnD0thlrhkqtY93UQmB0gZG2hM+/PdQOtNsc+VzcvmkciHfVhGGj
	 7xWwGwpIdnlO9KlJzX8TjiZoG9LjcjNu0otBUP6aPgMPrFbYGGX4GSf3IC3C+VNzah
	 f1+IzX15uJTOU/NpLc2pYgvVySr4szarEtRWQqFtdlQuXiLVLka9oVW6JKgElm4k8R
	 XM6xeDUOxWR5WSITmDLk85sgP7hPUAT6dpu/c8L4vn9WR7XiyR4Onb2S48V5/hZPxC
	 SPqCsOoM4m0NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/14] media: v4l2: Add P210 pixel format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260918-avd-v1-1-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-1-49977931f455@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:26:10 +0000
Message-Id: <20260918132610.8F30E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] media: v4l2: incomplete UAPI documentation for P210 format
- [Low] media: v4l2: incorrect bits-per-pixel comment for V4L2_PIX_FMT_P210
- [Low] media: v4l2: reStructuredText underline too short for section title
--

commit babd80a26581f15a410f128ba302cfa3a34c05de
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: v4l2: Add P210 pixel format

This commit adds support for the P210 pixel format. P210 is a YUV format
with 10-bits per component with interleaved UV.

> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 0631919bd667b..8509f2415c9b8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
[ ... ]
> @@ -834,8 +841,9 @@ number of lines as the luma plane.
> =20
>  .. _V4L2_PIX_FMT_P010:
>  .. _V4L2-PIX-FMT-P010-4L4:
> +.. _V4L2-PIX-FMT-P210:
> =20
> -P010 and tiled P010
> +P010, tiled P010 and P210
>  -------------------

[Severity: Low]
Is this underline length still correct? The section title was extended to
include P210, but the underline remains 19 characters, which might cause a
Sphinx documentation build warning.

> =20
>  P010 is like NV12 with 10 bits per component, expanded to 16 bits.

[Severity: Low]
Does this description need an update to cover P210? The section title now
includes P210, but the text exclusively describes the 4:2:0 layout of P010
without clarifying P210's 4:2:2 structure.

> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fae..b5949c378f2eb 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
[ ... ]
> @@ -659,6 +659,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/Cr=
Cb 4:4:4  */
>  #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/Cb=
Cr 4:2:0 10-bit per component */
>  #define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/Cb=
Cr 4:2:0 12-bit per component */
> +#define V4L2_PIX_FMT_P210    v4l2_fourcc('P', '2', '1', '0') /* 24  Y/Cb=
Cr 4:2:2 10-bit per component */

[Severity: Low]
Is the bits-per-pixel comment accurate here? The comment states "24" average
bits per pixel, which is correct for 4:2:0 formats like P010, but shouldn't
a 4:2:2 format like P210 have an average of 32 bits per pixel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-avd-v1-0-4=
9977931f455@icloud.com?part=3D1
