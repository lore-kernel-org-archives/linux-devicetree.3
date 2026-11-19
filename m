Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120255;
	b=p9BP76kiFAFDP9mCiVRgecbQShyFgwVhGI6JBo7XUT2X8pKp6YGEM07VJqqx99X89Mwd
	 AU9+7SycGAoUaes5qVjQYkAYAgW0r19d3f7xHEL40bPZzidT+qWZlMhuDRhMucGsDfk8E
	 iHiGffOvLyvtxXUVScU9I8RGXlDQREy2X7SI1KYLYMlWabFS2AEJDxbkXjPWLnbIzf5p9
	 HdIhGfIruNCmNXCkXYTa1HQ+Jl1gSYnrt+P6zqo8hsj0+q6NfCQpGIfo4yCEpb2IGot9Q
	 vAZHH21dPEeiegk2upXVjYD6/OUlJdi9DLzJj3rK2hpAinxQ/RQtr1tmsV/8cDAALQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
	b=0234aC7vGPf7/jDhj2tDu0V5+JZhrbVpfgFs9ZfqZJkhRCB7DU/C0tRh+osl+UfT87w+
	 TYc0kdokbQx5hdcwI4j8CNHLuEWAOnlVBMMPz/6zNfj8wH0c+vZzUJ7Hb8hsi7aU0Drxx
	 7rSxczzlkxe6dNvpsaXubd8vsYbleEfTo7YjAXXv24x7fd4NsNFgjYXjSY0MUbge5BGD5
	 F9x0sRnEEN3ZAZBnmmiCTgV7aAHVcJRP2Kl9xfI2BhAH07rJ1CMsm07mQ7Oc5J+FTX/c+
	 l1urDOOTlyPmVb7Spc3LfyvyJe6o+pG4SbhU32xcvFR1O11AWj0NumBZ/YtrUa7lY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K9Py7VFs;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173FA606A332
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K9Py7VFs
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e2ec4b42so1105147b3.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795120254; x=1795725054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
        b=K9Py7VFsp5gYQrQrUGuZZ0yNwck1b/51JNp68XzV/WqcWIeRa6BKAmnBXNY+rpOWwW
         /e3up888WsrMvkvS3QG+8UDCLYAerJi3uJlkbOvO4HlBxriGX0y+LLS1xagKxU1mVNj3
         j1wNyJDeE8VruUmCK+msFNeNDlA+XhcGriMGMh6qGNtpdDEuLHczH+bgCBpouFYBY0+G
         /taobZfgDEWuXuraU82oYy4Bjhm+JnSDITDeEvnGeKDVefdFs1ViX2aaPH5vUXuK+Pt9
         63CJ2aQVSelea5ZWjDpHK5f4SMK+YxJG5FJR2krAgK7ygfevDRvamQrjAdgN+VjIdSWb
         YJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120254; x=1795725054;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8ykn4E5LzByOueGyLMiBc4qBRmllQm4EsarmCaWf3M=;
        b=ue7y2K79Ltxg+xiLotxl83TQTlo3CU6B8NB/9q3tScTk7rnH5EQdue1SUspjOaHDJr
         YZYaBpUjtLd65Rn+HZFQ2KT7fU7JKtFSQPGIg3Yu4WdSg9HurycFKxHLboJsVzGY+UEu
         rrYHXDQjX3VlsVA/WTQBo2OSUXb7zge5uFv6n8sGsc6J9/43VSAMDDULEWEYdyTwPlLZ
         XWnt1AYLidd74c2aJI5IeCKTnXoi3Z6EnY60wxZyPAPc6QLzOtLavCSG8JOFpm+VRyjo
         HKImtCvAboXo34M74CCdPig8AgoZJl2oO4VKWt1/LTGmhoV8wusaoDbrkJnwhs8Qu45y
         ycfg==
X-Forwarded-Encrypted: i=1; AL+hErHUrwywuYn3SormaZ2Vrm8i7YL9Se0ofKxDFCTEpQgcu3ih6JZhkjvVPRJOG9VrXUyjnBosZqAPz3H4@vger.kernel.org
X-Gm-Message-State: APuU4Z9jMOHxmIkz4xvJXJfMKyYZkVpPBCdGj6YFRWG2yhyam4HBV0af
	faojaqI4MRLQZhyg18du3xOOolZv5wfXXcVfOO1h6Lv4Wusd4Wqv5VwkpvN4VGbOJdc=
X-Gm-Gg: AZFdTZdtdBk0mSl5YNNpCgzIu4gn9+rEFm1tVSDmo6qdoqk34NeuhdrRbpWcJdv2LAd
	TW1pgJExL6JZ7uD/xD9YPNxeG+11nm7KST9shFm87/CHcYPPhFNWKjOSA2TTVOFGLLwCQnMaDAC
	tJmrhnsahJXZXBMtBfM8FugrYvt29B2CnGCLeNwV+BArxKe3Bvsz5et9qhE+bsfBQwdmc0fULtp
	SUsQHZvo0tjGyWdub+ICmph4E76eLFagvo7M+73FT7VQANIu0n9NAW5h1D2qnw8x15Yl7OCeYpV
	4yJbiqmeSHSPX0Z6kkda0DOrf6vCwUkrXNk8tHr4exQBdkq+A7XZR3r4Ei/smqo7Si8b9hPj6dB
	aUDBF6vhl47jyuRRHgy6QNz1JW/0axuUElr+RPzk7BUhVgMfJAamYsCCoPYa+jLIxNIlNs8hM8y
	eTiWI7zJzhazCLjyocQW4Vs6rUy+6ZUuzQeFWx0sSCWzId78KUisTLbY0DggM6bPRoMAU6gASuQ
	iHH7Hk88IzS6PvLAf3j7V1gVcVnUqKfb+/7jDMirumT1QoPqHEB3Wtxqlvuu7tNv6PCUOT/EX83
	mK/PuOkMagcmNAKcle3Dl/MXzXzXC582LBzz+IY7rv++xGX6z1aYMeo=
X-Received: by 2002:a05:690c:4491:b0:8b3:8d8:e985 with SMTP id 00721157ae682-8b5204faf4amr4886077b3.57.1795120253872;
        Thu, 19 Nov 2026 12:30:53 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d89csm5068547b3.15.2026.11.19.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:30:53 -0800 (PST)
Message-ID: <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:30:51 -0500
In-Reply-To: <20261119153758.1426673-5-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-5-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x5a1wcjL9jf38bTSf9aZ"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-x5a1wcjL9jf38bTSf9aZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Describe the H.264 OUTPUT format and YUV420M, NV12M and NV21M CAPTURE
> formats supported by Mali-V76, together with its frame-size limits.
>=20
> Add source and destination format state to each decoder session and
> initialize both ports from variant defaults. Add the MVE format identifie=
rs
> required by the format descriptors.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Makefile  |  4 +-
>  .../platform/arm/mali-vpu/mali-vpu-dec.c      | 16 ++++
>  .../platform/arm/mali-vpu/mali-vpu-dec.h      | 13 +++
>  .../platform/arm/mali-vpu/mali-vpu-formats.h  | 27 ++++++
>  .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 51 ++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-session.c  | 83 +++++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-session.h  | 18 ++++
>  .../arm/mali-vpu/mali-vpu-variant-v76.c       | 63 ++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-variant.h  | 30 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  7 ++
>  10 files changed, 311 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.=
h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-protocol=
-def-v3.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.=
c
>=20
> diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media=
/platform/arm/mali-vpu/Makefile
> index e659101bd0eac..0a42c53ae5088 100644
> --- a/drivers/media/platform/arm/mali-vpu/Makefile
> +++ b/drivers/media/platform/arm/mali-vpu/Makefile
> @@ -2,6 +2,8 @@
> =20
>  mali-vpu-objs :=3D mali-vpu-probe.o \
>  =09=09mali-vpu-variant-v76.o \
> -=09=09mali-vpu-vidioc.o
> +=09=09mali-vpu-vidioc.o \
> +=09=09mali-vpu-session.o \
> +=09=09mali-vpu-dec.o
> =20
>  obj-$(CONFIG_VIDEO_MALI_VPU) +=3D mali-vpu.o
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.c
> new file mode 100644
> index 0000000000000..cb6eeee2f04df
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include "mali-vpu-dec.h"
> +#include "mali-vpu-session.h"
> +#include "mali-vpu-variant.h"
> +
> +void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
> +{
> +=09const struct mali_vpu_format_caps *variant_fmts =3D &sess->vpu_dev->v=
ariant->fmt_caps;
> +
> +=09sess->port_src.supported_fmts =3D variant_fmts->dec_src;
> +=09sess->port_dst.supported_fmts =3D variant_fmts->dec_dst;

Why? the variant are constant, you can just read the information from the
variant. Make a getter or point to it.

p.s. is that "port" like in OMX IL?

> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.h
> new file mode 100644
> index 0000000000000..2514c897587c4
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_DEC_H__
> +#define __MALI_VPU_DEC_H__
> +
> +struct mali_vpu_session;
> +
> +void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
> +
> +#endif /* __MALI_VPU_DEC_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> new file mode 100644
> index 0000000000000..13031809fdb4d
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_FORMATS_H__
> +#define __MALI_VPU_FORMATS_H__
> +
> +#include <linux/types.h>
> +
> +enum mali_vpu_codec_fmt {
> +=09MALI_VPU_FORMAT_CODEC_H264,
> +};
> +
> +struct mali_vpu_format_desc {
> +=09u32 fourcc;
> +=09u16 mve_frame_fmt;
> +=09u16 codec_fmt;
> +=09u32 flags;
> +};
> +
> +struct mali_vpu_format_list {
> +=09const struct mali_vpu_format_desc *fmts;
> +=09u32 num_fmts;
> +};
> +
> +#endif /* __MALI_VPU_FORMATS_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3=
.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
> new file mode 100644
> index 0000000000000..aed51eec6ca9c
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#ifndef __MALI_VPU_PROTOCOL_DEF_V3_H__
> +#define __MALI_VPU_PROTOCOL_DEF_V3_H__
> +
> +/***********************************************************************=
******
> + *
> + * Communication protocol between the host/driver and the MVE firmware,
> + * the 'host interface'.
> + *
> + * MVE =3D=3D MALI Video Engine
> + *
> + * Protocol version 3.1
> + *
> + * Note: Message structs may be expanded in the future; the host should
> + * use the 'size' of the message to determine how many bytes to
> + * read from the message queue, rather than a sizeof(struct).
> + *
> + * All multibyte integer fields in the shared-memory interface are littl=
e-endian.
> + * The driver supports only little-endian kernels and therefore accesses=
 these
> + * fields in native byte order.
> + *
> + ***********************************************************************=
*****/
> +
> + #define MVE_CHROMA_FORMAT_420 (0x1)
> +
> +/* format bitfield: */
> +#define MVE_FORMAT_BF_C  (0) /* 3 bits, chroma subsampling   */
> +#define MVE_FORMAT_BF_B  (4) /* 4 bits, max bitdepth minus 8 */
> +#define MVE_FORMAT_BF_N  (8) /* 2 bits, number of planes     */
> +#define MVE_FORMAT_BF_V (12) /* 2 bits, format variant       */
> +/* formats: */
> +#define MVE_FORMAT_YUV420_I420=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(3 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(0 << MVE_FORMAT_BF_V))
> +
> +#define MVE_FORMAT_YUV420_NV12=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(2 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(0 << MVE_FORMAT_BF_V))
> +
> +#define MVE_FORMAT_YUV420_NV21=09((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_=
BF_C) | \
> +=09=09=09=09((8 - 8) << MVE_FORMAT_BF_B) | \
> +=09=09=09=09(2 << MVE_FORMAT_BF_N) | \
> +=09=09=09=09(1 << MVE_FORMAT_BF_V))
> +
> +#endif /* __MALI_VPU_PROTOCOL_DEF_V3_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> new file mode 100644
> index 0000000000000..9bcb3a73a582e
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mm.h>
> +#include <linux/string.h>
> +#include <media/v4l2-common.h>
> +
> +#include "mali-vpu-session.h"
> +#include "mali-vpu-dec.h"
> +#include "mali-vpu-variant.h"
> +
> +static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
> +=09=09=09=09 enum v4l2_buf_type type,
> +=09=09=09=09 u32 width, u32 height)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &port->curr_fmt.fmt.pix_mp;
> +=09const struct mali_vpu_format_desc *fmt_default;
> +=09int ret;
> +
> +=09if (!port->supported_fmts.fmts || !port->supported_fmts.num_fmts)
> +=09=09return -EINVAL;
> +
> +=09fmt_default =3D &port->supported_fmts.fmts[0];
> +
> +=09memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
> +=09port->curr_fmt.type =3D type;
> +
> +=09if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
> +=09=09pix_mp->pixelformat =3D fmt_default->fourcc;
> +=09=09pix_mp->num_planes =3D 1;
> +=09=09pix_mp->width =3D width;
> +=09=09pix_mp->height =3D height;
> +=09=09pix_mp->plane_fmt[0].bytesperline =3D 0;
> +
> +=09=09/*
> +=09=09 * Use one byte per pixel as the default compressed sizeimage,
> +=09=09 * with a minimum of one page, aligned to a page boundary.
> +=09=09 */
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D PAGE_ALIGN(max_t(u32, PAGE_SIZE=
, width * height));
> +=09} else {
> +=09=09ret =3D v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, he=
ight);
> +=09=09if (ret)
> +=09=09=09return ret;

I might have to come back to this code once we have TRY/SET_FMT in place,
meanwhile it seems more like a default setting helper then something that w=
ill
be part of the ioctl interface.

> +=09}
> +
> +=09pix_mp->field =3D V4L2_FIELD_NONE;
> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_set_port_defaults(struct mali_vpu_session *sess)
> +{
> +=09const struct mali_vpu_framesize_caps *fmsz =3D &sess->vpu_dev->varian=
t->frmsz_caps;
> +=09int ret;
> +
> +=09ret =3D mali_vpu_set_port_fmt(&sess->port_src, V4L2_BUF_TYPE_VIDEO_OU=
TPUT_MPLANE,
> +=09=09=09=09    fmsz->width_default, fmsz->height_default);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return mali_vpu_set_port_fmt(&sess->port_dst, V4L2_BUF_TYPE_VIDEO_CAP=
TURE_MPLANE,
> +=09=09=09=09    fmsz->width_default, fmsz->height_default);
> +}
> +
> +int mali_vpu_session_init(struct mali_vpu_session *sess)
> +{
> +=09int ret;
> +
> +=09if (sess->role !=3D MALI_VPU_DECODER)
> +=09=09return -EINVAL;
> +
> +=09mali_vpu_session_init_dec(sess);
> +
> +=09ret =3D mali_vpu_set_port_defaults(sess);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.h
> index 7166c53236f1a..a2778ca496381 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
> @@ -6,21 +6,39 @@
>  #ifndef __MALI_VPU_SESSION_H__
>  #define __MALI_VPU_SESSION_H__
> =20
> +#include <linux/videodev2.h>
>  #include <media/v4l2-fh.h>
> =20
>  #include "mali-vpu-device.h"
> +#include "mali-vpu-formats.h"
> +
> +/**
> + * struct mali_vpu_port - format state of a src/dst queue in a session.
> + * @curr_fmt: V4L2 format currently configured for the port
> + * @supported_fmts: List of format descriptors supported by the queue.
> + */
> +struct mali_vpu_port {
> +=09struct v4l2_format=09=09curr_fmt;
> +=09struct mali_vpu_format_list=09supported_fmts;
> +};
> =20
>  /**
>   * struct mali_vpu_session - holds per session state and resources.
>   * @vpu_dev: Reference to the parent device structure.
>   * @role: Role of this session.
> + * @port_src: Source (OUTPUT) port for this session.
> + * @port_dst: Destination (CAPTURE) port for this session.
>   * @fh: V4L2 file handle for this session.
>   */
>  struct mali_vpu_session {
>  =09struct mali_vpu_dev=09=09*vpu_dev;
>  =09enum mali_vpu_session_role=09role;
> +=09struct mali_vpu_port=09=09port_src;
> +=09struct mali_vpu_port=09=09port_dst;

Ok, its time to comment, src_port and dst_port is a lot easier to read imho=
.

> =20
>  =09struct v4l2_fh=09=09fh;
>  };
> =20
> +int mali_vpu_session_init(struct mali_vpu_session *sess);
> +
>  #endif /* __MALI_VPU_SESSION_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b=
/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> index 36509d6a1c5d5..7b04b51eeedc2 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
> @@ -4,18 +4,81 @@
>   */
> =20
>  #include <linux/array_size.h>
> +#include <linux/videodev2.h>
> =20
> +#include "mali-vpu-formats.h"
> +#include "mali-vpu-protocol-def-v3.h"
>  #include "mali-vpu-variant.h"
> =20
>  #define MALI_VPU_HW_PID_V76 0x56627
> =20
> +#define MALI_V76_MAX_FRAME_WIDTH 8192
> +#define MALI_V76_MAX_FRAME_HEIGHT 8192
> +#define MALI_V76_MIN_FRAME_WIDTH 2
> +#define MALI_V76_MIN_FRAME_HEIGHT 2
> +#define MALI_V76_DEFAULT_FRAME_WIDTH 640
> +#define MALI_V76_DEFAULT_FRAME_HEIGHT 480
> +
>  static const char * const mali_v76_rst_names[] =3D {
>  =09"warm",
>  };
> =20
> +static const struct mali_vpu_format_desc mali_v76_dec_src_fmts[] =3D {
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_H264,
> +=09=09.mve_frame_fmt=09=3D 0,
> +=09=09.codec_fmt=09=3D MALI_VPU_FORMAT_CODEC_H264,
> +=09=09.flags=09=09=3D V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOL=
UTION,
> +=09},
> +};
> +
> +static const struct mali_vpu_format_desc mali_v76_dec_dst_fmts[] =3D {
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_YUV420M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_I420,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_NV12M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_NV12,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=3D V4L2_PIX_FMT_NV21M,
> +=09=09.mve_frame_fmt=09=3D MVE_FORMAT_YUV420_NV21,
> +=09=09.codec_fmt=09=3D 0,
> +=09=09.flags=09=09=3D 0,
> +=09},
> +};
> +
>  const struct mali_vpu_variant mali_vpu_v76_variant =3D {
>  =09.expected_hw_pid =3D MALI_VPU_HW_PID_V76,
> =20
>  =09.rst_names =3D mali_v76_rst_names,
>  =09.num_rsts =3D ARRAY_SIZE(mali_v76_rst_names),
> +
> +=09.fmt_caps =3D {
> +=09=09.dec_src =3D {
> +=09=09=09.fmts =3D mali_v76_dec_src_fmts,
> +=09=09=09.num_fmts =3D ARRAY_SIZE(mali_v76_dec_src_fmts),
> +=09=09},
> +=09=09.dec_dst =3D {
> +=09=09=09.fmts =3D mali_v76_dec_dst_fmts,
> +=09=09=09.num_fmts =3D ARRAY_SIZE(mali_v76_dec_dst_fmts),
> +=09=09},
> +=09},
> +=09.frmsz_caps =3D {
> +=09=09.stepwise =3D {
> +=09=09=09.min_width =3D MALI_V76_MIN_FRAME_WIDTH,
> +=09=09=09.max_width =3D MALI_V76_MAX_FRAME_WIDTH,
> +=09=09=09.step_width =3D 2,
> +=09=09=09.min_height =3D MALI_V76_MIN_FRAME_HEIGHT,
> +=09=09=09.max_height =3D MALI_V76_MAX_FRAME_HEIGHT,
> +=09=09=09.step_height =3D 2,
> +=09=09},

Are you sure this will be the same for all codecs and all formats?

> +=09=09.width_default =3D MALI_V76_DEFAULT_FRAME_WIDTH,
> +=09=09.height_default =3D MALI_V76_DEFAULT_FRAME_HEIGHT,
> +=09},
>  };
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> index dadfd686275db..a46c25a94f18b 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
> @@ -7,17 +7,47 @@
>  #define __MALI_VPU_VARIANT_H__
> =20
>  #include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +#include "mali-vpu-formats.h"
> +
> +/**
> + * struct mali_vpu_framesize_caps - Variant-specific frame size capabili=
ty.
> + * @stepwise: Stepwise frame size limits and increments supported by the=
 hardware.
> + * @width_default: Default width used when userspace does not request on=
e.
> + * @height_default: Default height used when userspace does not request =
one.
> + */
> +struct mali_vpu_framesize_caps {
> +=09struct v4l2_frmsize_stepwise stepwise;
> +=09u32 width_default;
> +=09u32 height_default;
> +};
> +
> +/**
> + * struct mali_vpu_format_caps - Pixel/coded format capability tables.
> + * @dec_src: List of formats supported on decoder OUTPUT queue (compress=
ed bitstream in).
> + * @dec_dst: List of formats supported on decoder CAPTURE queue (decoded=
 raw frames).
> + */
> +struct mali_vpu_format_caps {
> +=09const struct mali_vpu_format_list dec_src;
> +=09const struct mali_vpu_format_list dec_dst;

Strange naming, perhaps src_formats/dst_formats?

> +};
> =20
>  /**
>   * struct mali_vpu_variant - Variant-specific hardware capability descri=
ptor.
>   * @rst_names: Array of reset control names for this variant.
>   * @num_rsts: Number of reset controls for this variant.
>   * @expected_hw_pid: Expected hardware product ID read from the version =
register.
> + * @fmt_caps: Format capability tables for encode/decode paths.
> + * @frmsz_caps: Frame dimension limits and defaults.
>   */
>  struct mali_vpu_variant {
>  =09const char * const *rst_names;
>  =09unsigned int num_rsts;
>  =09u32 expected_hw_pid;
> +
> +=09struct mali_vpu_format_caps=09fmt_caps;
> +=09struct mali_vpu_framesize_caps=09frmsz_caps;
>  };
> =20
>  extern const struct mali_vpu_variant mali_vpu_v76_variant;
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> index 7a169b7b14bf3..13468c6baba76 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> @@ -37,8 +37,15 @@ static int mali_vpu_open(struct file *filp)
>  =09v4l2_fh_init(&sess->fh, vdev);
>  =09v4l2_fh_add(&sess->fh, filp);
> =20
> +=09ret =3D mali_vpu_session_init(sess);
> +=09if (ret)
> +=09=09goto err_v4l2_fh_deinit;
> +
>  =09return 0;
> =20
> +err_v4l2_fh_deinit:
> +=09v4l2_fh_del(&sess->fh, filp);
> +=09v4l2_fh_exit(&sess->fh);
>  err_free_sess:
>  =09kfree(sess);
>  =09return ret;

--=-x5a1wcjL9jf38bTSf9aZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9cewAKCRDZQZRRKWBy
9MSpAP0eSHQ+3hy7zpRxGVr4rQcqja2hn0rjTXuVfuEeMp3buQEAruHvL0WkcAMK
uFbRUCy3Umn8MWJbxN2+mssZsaaRDQM=
=+GQR
-----END PGP SIGNATURE-----

--=-x5a1wcjL9jf38bTSf9aZ--
