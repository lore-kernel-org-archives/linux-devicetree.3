Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030B3C1091
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713260; cv=none; b=kxuLzifPjzghe1245v4BJhqRnGueUNeQUK/2m/VKqVIne4M4MVyZxeeK5YZyiHSFxXs32zolpdLhrnvjh+sPQoSJDEyfIxbMvSNZe6Ou+BIJFGIn/nwoxyWEzWSnsOR6DTVXuhbSfPO0NfblG0ARnssokQrGrFIjJUfP7rV+1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713260; c=relaxed/simple;
	bh=FkYXR5p/T/cyORXmlXK1IfVQm3kClQE6LLEyj4lczQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qag7bOeS7vMrmoPk+SWLa3UzNyBEw6XZUVpCeTrLOkVKykTHBwB3yWwNyxUk5onlSvmn0IvFXUh5z0FeHa0F2OGwwuuM/upHsQbTeHemJ0Cw9nvi4Ar/jcIzKwI/0TUZYHF3SfOb0UmnI77d8YiATnM6EOp6vu8yz1qNiH/1nFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPpK5e+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPpK5e+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B51F000E9;
	Wed, 22 Jul 2026 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713258;
	bh=82f1ImoS2Fj3dXFsWcquMMm891y9b/9hguSRtP3EiRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GPpK5e+gTFpP9fbTwDUgFFF4rEpU2OtQFnRBimO7UrWaWgdCwB3GfD/iDqkxyeBbF
	 sZ6+Yt3+NhHIpL8ymUFezFbPoiPzc0Neu/TnPzriZXPg+hqPtXC3M4U98HAS3aJrQe
	 zNRDYBG2M49eKEK4XMQw8kiYlxR3LSjXUI2mZmH53o0cA/8w891t236WrELmxIiK6C
	 p77466XTVE1xpqm18XThdAn+fMPjPxjeK4bErZKQFxB4cKPxuPyHdjJhA6k9ub47Os
	 9V/SrLjdIeGCn8YCfHAZ0Ip/9Eg3j+AYiDRnwHYkUPYxFNUDoJ8q6EUhTmGKUOu4ET
	 rz3diZLc5I9TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 1/2] memory: mtk-smi: Add mt8189 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <congcong.yao@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-8189-smi-support-v1-1-b528a4fd878c@mediatek.com>
References: <20260722-8189-smi-support-v1-0-b528a4fd878c@mediatek.com>
 <20260722-8189-smi-support-v1-1-b528a4fd878c@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:40:57 +0000
Message-Id: <20260722094057.E47B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added OSTD array for MT8189 contains 0x0 values in the m=
iddle of port configuration lists, which will cause the initialization loop=
 to prematurely terminate and skip remaining ports.
- [High] The `mtk_smi_larb_mt8189_ostd` array is incorrectly indexed using =
physical LARB IDs instead of the logical `larbid`s, leading to uninitialize=
d (zero) configuration values being used for sparse LARBs.
--

--- Patch [1]: [PATCH RESEND 1/2] memory: mtk-smi: Add mt8189 support ---
commit a0aeb95996d513c82894f215895c9e39ee05a1de
Author: Congcong Yao <congcong.yao@mediatek.com>

memory: mtk-smi: Add mt8189 support

Add the necessary platform data and ostdl setting to enable support
for mt8189 smi.

> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index aaeba8ab211e9..f2d5462af6817 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_=
PORT_NR_MAX] =3D {
>  	[25] =3D {0x01},
>  };
> =20
> +static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] =3D {
> +	[0] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
> +	[1] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10, 0x0,},
> +	[2] =3D {0x7, 0x7, 0x4, 0x4, 0x0, 0x0, 0x2, 0x2, 0x7, 0x7, 0x0,},

[Severity: High]
Does this explicit 0x0 value cause the initialization loop to prematurely
terminate?

During MT8189 SMI LARB initialization, mtk_smi_larb_config_port_gen2_genera=
l()
iterates over the OSTD configurations. The loop uses !!larbostd[i] as a
termination condition:

    for (i =3D 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i+=
+) {
        ...
    }

Because mtk_smi_larb_mt8189_ostd[2] explicitly specifies 0x0 for ports 4 an=
d 5,
the loop will break at port 4, completely skipping the configuration of por=
ts
6 through 9.

> +	[4] =3D {0x2F, 0x1E, 0x9, 0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x5, 0x1, 0x17,=
},

[Severity: High]
Are these indices using physical LARB IDs instead of logical contiguous IDs?

The SMI device tree bindings map sparse physical LARBs to contiguous logical
IDs. The SMI driver populates larb->larbid directly from this logical ID via
the mediatek,larb-id DT property.

If this array uses physical IDs (e.g., [4], [7], [20]), then when probing a
sparse LARB like LARB 4, the driver accesses larb_gen->ostd[3] (its logical
ID), which is empty. This would lead to uninitialized zero configuration va=
lues
being used for all sparse LARBs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-8189-smi-s=
upport-v1-0-b528a4fd878c@mediatek.com?part=3D1
