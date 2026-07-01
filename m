Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564143C1F57
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892803; cv=none; b=TOznb+s2i4MZbAL8YpQly3JiRTt2jCWS6ozFMA1oWM3fUW+BzRkjQ1rgvLjeaMZX7xcq8gMUujy1G06DnI279njf02y64j1uY3N+9i8Fj0Swslevn4+OpSpym5A3gmbLH81jjZY+aLLZY76Oqd24ILsKu1NhXh/7GbxuDZA5NNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892803; c=relaxed/simple;
	bh=sffcHTZduUF2ZKI2/zpUcgd26fGNA+XB6+s/XDT+T8E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=loayP5qlFyIY/DI+K4x+iiG3RDWOrZv+uGkmlYGCrICBekIV3hM5DdyFv3qhLwQVR1bSvFvLp+C1ZVjkyTZx4A877OecIPzxyQMgNT4BzC2QeWpP9CaqxJCgw/HDGu3Ib+CYX32sO9dOZANCqw2YOX/oWS4LWeOKkjKt9A6U5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt6tm51E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt6tm51E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEB81F000E9;
	Wed,  1 Jul 2026 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892801;
	bh=nMLagygw1bb2Sxs2fLFyZQ2havsGHDSZbNGd0mrFq4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dt6tm51EveAbZBbaCF1AE7TLBMhcpsAMRdxFVSm4g1h90+SAgR66pNilM5gNa5HC0
	 NTh75NqmyG4Vx/UQ/JMdiNKFAxL4YgxNPLaChkaBHjLHFw14EUd69vW04VteKPMkJA
	 E/dwOhUodKgTcPpfFFgE9TdwqiUism4/vOvRb76GHBn58vd6+T+NGpRn/VQ6tv/FLi
	 gZ3vTfmk/60PkZRt3nFSMydCKkHvVxQuXNAaAY+7j3sWYf/7G+P7FjSciN25Z5XUS5
	 z8MrpTU8T2maedzpB49xvoi4Aqgq0SknxeTSvNVtF1+68XpI/ldgeEE/4JGF7APBRJ
	 fNaup7KEzzZ6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] memory: mtk-smi: Add mt8189 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <Congcong.Yao@mediatek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701074533.175803-3-Congcong.Yao@mediatek.com>
References: <20260701074533.175803-1-Congcong.Yao@mediatek.com>
 <20260701074533.175803-3-Congcong.Yao@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:00:00 +0000
Message-Id: <20260701080001.9AEB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Implicitly sized array mtk_smi_larb_mt8189_ostd may be accessed ou=
t of bounds for LARB IDs >=3D 21.
- [High] Explicit 0x0 values in mtk_smi_larb_mt8189_ostd cause premature lo=
op termination.
--

commit 34a5ce3e55a813425dbbd1c5607a1ed17951862b
Author: Zhengnan Chen <zhengnan.chen@mediatek.com>

memory: mtk-smi: Add mt8189 support
   =20
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
Does the inclusion of 0x0 values in this array cause valid hardware ports
to be left uninitialized?

The initialization loop in mtk_smi_larb_config_port_gen2_general() treats
a 0 value as the end of the array:

    for (i =3D 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i+=
+)
        writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));

When it encounters the 0x0 at the fifth element of LARB 2, the loop will
terminate immediately, ignoring the remaining configurations like 0x2 and 0=
x7.

[ ... ]

> +	[19] =3D {0x2, 0x1, 0x3, 0x1,},
> +	[20] =3D {0x7, 0x7, 0x3, 0x3, 0x1, 0x1,},
> +};

[Severity: High]
Will this implicitly sized array lead to an out-of-bounds read if the
device tree probes a LARB with an ID of 21 or 22?

Because the largest index provided is 20, the array has exactly 21 elements.
However, mtk_smi_larb_config_port_gen2_general() blindly accesses the array
using the LARB ID:

    const u8 *larbostd =3D larb->larb_gen->ostd ?
                         larb->larb_gen->ostd[larb->larbid] : NULL;

If MT8189 defines LARB IDs up to at least 22, accessing index 21 or 22 will
read past the end of the array and could write garbage data from read-only
memory into hardware limit registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701074533.1758=
03-1-Congcong.Yao@mediatek.com?part=3D2
