Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4CB40FD9B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554433; cv=none; b=npmNXbVs0SN5hsXrVGvAzmjbmOFzvRP+xiPEZm9mgOIiVwXMmPcE6XMJ15kha5iD/Qhq4oy69OxqFdFLmu5JYiL3W9ofe3ehjloJYmXJRbedAWDUvmdX6OUeOXvceH5W77O2XX0ZthKKsEL/h+orCl7tFLlp3bYPgISpKl+V+XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554433; c=relaxed/simple;
	bh=6SCXzXl5uLu/RVhNh0tCVk0BGzLMLGknKpPGfx6B6e4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XG5S68cuuzaubah4Tc2YQoAIyysso7iuWxMWZLAdSfwzEENKNuHfAbO6UrwW7C2EW5KGRhkw2RvwjJXmtQ9Zs2gK8RWaAKcpSk2X/1EsvdeD0LPJIauNY9d3pAo6FRn88HRIHf9OM1Xx1Ej7HfAZ1BfKXFihz04y8ukhMocUWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=r8sHuiwm; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="r8sHuiwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784554422; x=1784813622;
	bh=MVVLvE90fQ7WmoELEjqp4sHIFe3nRrj87JvQ3rAea0k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r8sHuiwmmwgjaayUilvtsFIMfdeUlI09w2ctFtoG5E29SALjpYYgHvQrMPHMwD4Zo
	 mWh3MXVoclvO9WUqjZunx55+knaivwf3GuHO1GiuK84Xqkb6Drz0mBEfxjGzWc6byc
	 DFltL3byxRQXRd4Kp2yg3ZnCQnMUzRWgzxPXxIkwkR6/Oxl6E2QXDrdXzhepCcFDiW
	 kysVZq4BGraWN3k/Y0a/L3CtOhIf9fGVManvMX28kyvejLMs4XxTrkTtWTlKGCSdH/
	 xLrRzKghqvSlDluxOgwXMaTd47VoXaKwKmoDKmA2fVwFeLjsEUl1bOLQ9prY/735Aw
	 96rheXJVrVpLQ==
Date: Mon, 20 Jul 2026 13:33:36 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Message-ID: <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
In-Reply-To: <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com> <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 0ec302920432415fdca89990ad31f8fe4c975042
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Monday, July 20th, 2026 at 3:48 PM, AngeloGioacchino Del Regno <angelogi=
oacchino.delregno@collabora.com> wrote:

> On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Add a platform data struct for the efuse controller.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/nvmem/mtk-efuse.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index 1462f2760818..a79434608465 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device =
*pdev)
> >   =09return 0;
> >   }
> >
> > +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata =3D {
> > +=09.uses_post_processing =3D false,
>
> Are you sure this SoC (or any other compatible with it) doesn't have any =
GPU speed
> binning?
>
> If you're really sure
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

It does, but we can't really rely on it. The GPU is complicated here...

Something like this:
- mfgcfg
  ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
     ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
=09         for crashes)
        ^- whpll (or any other parent, but downstream uses WHPLL as GPU
                  clock source)

There is GPU speedbin, but it means either GPU scaling is fine and mfg
mux is safe (0, unfused) or that the GPU must stay at UNIVPLL divider
(1, fused off).

My current solution is using assigned-clocks and assigned-clock-parents
in the each board which we've tested manually.
&gpu {
        /* Switch to WHPLL */
        assigned-clocks =3D <&topckgen CLK_TOP_MFG_SEL>,
                          <&topckgen CLK_TOP_MFG_PRE_SEL>;
        assigned-clock-parents =3D <&topckgen CLK_TOP_MFG_PRE_500M>,
                                 <&topckgen CLK_TOP_MFG_SEL>;

        operating-points-v2 =3D <&gpu_opp_table>;
        nvmem-cells =3D <&gpu_speedbin>;
        nvmem-cell-names =3D "speedbin";
=09=09status =3D "okay";
};

On boards with GPU frequency fused off the entire setup is omitted
except status =3D "okay";

Let me know if you have some other idea how this should be handled.

Best regards,
Roman
