Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09558305664
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160435; cv=none; b=iObpFsw/ykxkHOn6ODN+E0enKDaCmArVK3jkNDySCki/lL9rPTOHJSCn01/azt1cr8QOm7pCnjx+fIwqnHULf2zybIIuguLpB7ZP1NRkE+tgkcg3ntI8+ka0RG8l0gb6iFeN+yEVnBzPvddGOC6lnhrvoL/3SxqQB5Gd/JaSiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160435; c=relaxed/simple;
	bh=eihItKd36dnAIU0+WFUetCV9i+FKG3wir8qidj/RqGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpEnKthUYBqSvF76w5iLzacOlmKVbCYeU5XwFwHFWOmeaxtGCRM+9ObAr6gFXZk8tUq22O5pihYJ8s30e/y8ftjC+b4R1xOZvt8kmfWqxcxIMN3EeJOOnQVlZyyXBs+s8XtQX0madov3WIoa9qtd6jIEzFwWHd8zMo3PA/72AGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWSwlsmX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWSwlsmX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B151F000E9;
	Mon, 31 Aug 2026 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788160433;
	bh=GI882zxfyZi/i+ZpUMpUYVhghudrUmvxo/jbywvLWT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWSwlsmXQqBykZ9QQ2C+RtMHYPQAeOd/7ZjHp5JqCiiFHvQU2v6o3iXGHCoEYgo18
	 ig8YtQgL7fHXrrKOM7oTknhXiu67YVWPKRR3ByBgPbOgy7Um7V2CSKOaXGiROhdsqO
	 a9HBBQnFdgVas60D4sM2EmhFBdcr5bVicP+508UuSAxVwB0xNDaa2uW9vfD6Cuoo8T
	 COmx71sLzovK3P3OJEw8EiQ60mabgEjeMn06WXzzwg90LG6qYYPQoS1Pr/874p31iT
	 rMsRiOlXSCja1fwg5LpZzqVoaQgfKZ07hYzJ2RHmX48zNdaQhFwOESoGWNeeTwnUMu
	 0z7RKW02a5r9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Congcong Yao" <congcong.yao@mediatek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
 <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:13:52 +0000
Message-Id: <20260831071353.30B151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array read in mtk_smi_larb_config_port_gen2_general(=
) when accessing mtk_smi_larb_mt8189_ostd.
--

commit 799e65b6a88840741f8de7319f0b544e0e41e3de
Author: Zhengnan Chen <zhengnan.chen@mediatek.com>

memory: mtk-smi: Add MT8189 support
   =20
Add the MT8189 SMI common, sub-common and LARB platform data.
   =20
Enable the GALS clock for the MT8189 SMI sub-common.

> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index aaeba8ab211e9..8c4606cbd73d9 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -401,6 +401,30 @@ static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_=
PORT_NR_MAX] =3D {
>  	[25] =3D {0x01},
>  };
> =20
> +static const u8 mtk_smi_larb_mt8189_ostd[][SMI_LARB_PORT_NR_MAX] =3D {
> +	[0] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
> +	[1] =3D {0x8, 0x20, 0x20, 0x20, 0x20, 0x20, 0x10,},
> +	[2] =3D {0x7, 0x7, 0x4, 0x4, 0x1, 0x1, 0x2, 0x2, 0x7, 0x7,},
> +	[4] =3D {0x2f, 0x1e, 0x9, 0x1, 0x1, 0x1, 0x1, 0x2, 0x2, 0x5, 0x1, 0x17,=
},
> +	[7] =3D {0x20, 0x2, 0x1, 0x1, 0x1, 0x4, 0x2, 0x1, 0x1, 0x2, 0x3, 0x2,
> +	       0xa, 0xf, 0x4, 0x6, 0x5, 0x1,},
> +	[9] =3D {0x6, 0x3, 0xc, 0x6, 0x1, 0x4, 0x3, 0x1, 0x2, 0x4, 0x5, 0x2,
> +	       0x4, 0x2, 0x3, 0xb, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
> +	       0x1, 0x1,},
> +	[11] =3D {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
> +		0x1, 0x1, 0x1, 0xb, 0x1, 0x4, 0x6, 0x5, 0x6, 0x1, 0x5, 0x2,
> +		0x9, 0x5,},
> +	[13] =3D {0x2, 0x8, 0x8, 0x8, 0x4, 0x4, 0x4, 0x4, 0x4, 0xe, 0x4, 0x1,
> +		0x6, 0x6, 0x2,},
> +	[14] =3D {0x1, 0x1, 0x1, 0x20, 0xe, 0x4, 0x8, 0x8, 0x6, 0x4,},
> +	[16] =3D {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
> +		0x2, 0x2, 0x4, 0x2, 0x4,},
> +	[17] =3D {0x1e, 0xc, 0x2, 0x8, 0xe, 0x2, 0x1e, 0x10, 0x4, 0x2, 0x2, 0x2,
> +		0x2, 0x2, 0x4, 0x2, 0x4,},
> +	[19] =3D {0x2, 0x1, 0x3, 0x1,},
> +	[20] =3D {0x7, 0x7, 0x3, 0x3, 0x1, 0x1,},
> +};

[Severity: High]
This is a pre-existing issue, but could this array sizing lead to an
out-of-bounds read and hardware corruption?

Since the array is implicitly sized to 21 elements, what happens if an MT81=
89
device tree supplies a LARB ID greater than 20?=20

The driver appears to bound-check larbid against MTK_LARB_NR_MAX (32)
during probe, which allows an ID up to 31. If larbid is between 21 and 31,
the pre-existing array access in mtk_smi_larb_config_port_gen2_general():

    const u8 *larbostd =3D larb->larb_gen->ostd ? larb->larb_gen->ostd[larb=
->larbid] : NULL;

would read out-of-bounds. This garbage pointer would then be dereferenced a=
nd
written to the hardware registers later in the same function:

    for (i =3D 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i+=
+)
        writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));

Does mtk_smi_larb_mt8189_ostd need an explicit size of [MTK_LARB_NR_MAX]
to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-8189-smi-s=
upport-v4-0-8ae66dd3eeed@mediatek.com?part=3D2
