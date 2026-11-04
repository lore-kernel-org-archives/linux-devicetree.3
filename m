Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818774;
	b=GrTrRGc0iGuFFVaPpXW3LH8ujU5QZ/XqgNesIeCJdN0qM9pttJUCkYaS0ZArP0Iodf/t
	 GwsEo04jckbg6S2BatETV/jrnKDIvUm8uhKM7OBqdXHN++4co5CQzd5Nu5g7lrkYJsAry
	 JVgR0WZpd4dOICpouvf74Q5sejKcvMyb8fJYl0N5FZYjjEjnbobSDgInHxjL7c3/r29QN
	 TuRnBTQKSk9FkrZItyrA5l4oOKwolRp7R8ewdfg/QOImU4ZF7GLqpbJffRmV/pdmZm7mY
	 ghNnBYjE4CTr85qge/Gu3/SrDsKpwHK/IiWIeubsj9RXpBGUPUD7bOubLmSr4261qLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818774;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=;
	b=gMBSSoaXrH/CKZ45YrB0s49P6l/5XR6n3TDkCPEnRO3x6H9SgTSf0xhMPvEJgSXR2OSH
	 x6Sr18xqp+dTJhaApNF0Zrj/dYtA0o6xLnI0/47Nr+Q6AGYQrcoNz7PfnJCC3UtmpAFs+
	 BBsJv22GwBUjeZEBwTIVZED8hKmcailzlAbnfQAlMC1nfWBSMCHZ6LNws7UhBAxx2fVpP
	 rjm7tTwKQNEpbLvYZXL3wDjIWEAF4uKqEHIlH2tQ/10j2UtYJH3aPR4wY0YtmKZwGkPeI
	 U1XIEqpWOpdZCpXG98xgb2cY0hYrxjaYoGFOq3Ekho7e3Uziy7t8TIU5Tpb0XDPyD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZSXPcTro;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5366606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5366606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZSXPcTro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793818771; x=1794077971;
	bh=m7rHPBwaK2QnFjTfM9iOAm57zKhbpBduzc8crhMuhp8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZSXPcTrojU0nKPQ7wcqHAeV2ZoLT12SqXlgU//5hc5rMpnCKKFRMAFllbrCF3LYKP
	 domxctA98X0SMSPXMMr+ueDPRlpjGteXvhusWkTNx0BQdCrF6z0OIYSHy19BKbo2/n
	 4WY32gq8Bt6OFUNVd0afx9nmUf9ghE7koNV5hU0DZFZUuWkzDKTxb276tKL/9kpUXl
	 p1Uj1O6l6Phlho0PoqcNnU5Fw/tlyKRcIU7IgmLrpWA92LNgFS66GvgLwMZ8E1Wxk+
	 nhise5dBgYi7BLOHE5EeVKAq9r/0xzkf84V/k+3nRBX8Nm/TfF9eGcuzipcZkIJ3Se
	 mgZ8pcy0DVPyw==
Date: Wed, 04 Nov 2026 18:59:25 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v9 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Message-ID: <F0G_dANYlJ1-UIb2SYBfD3M-Lf0LDESQ3_gls5cGALE1EXYHhZXJHfAibDIjbFR9Rc_rfmce8tk8vBoevtJ94X3inG6HVIVzzBBtWCyPTW0=@protonmail.com>
In-Reply-To: <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com> <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 72767cc76342ad316c8bf2f0e9abda7edd262961
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 16th, 2026 at 2:09 PM, AngeloGioacchino Del Regno <=
angelogioacchino.delregno@collabora.com> wrote:

> Enable PM Runtime at the end of mtk_dsi_probe() so that the
> mediatek-drm mtk_ddp_comp_power_on() function is able to do
> pm_runtime_resume_and_get() and, analogously, the function
> mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
> device.
>=20
> This makes sure that the power domains for the DSI IP are
> turned on and off when necessary.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

No regressions on mt6595 or mt6768 platform.

Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6595, mt6768

Best regards,
Roman

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 3b33419aee2d..4863d910511e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1735,6 +1735,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n=
");
>=20
> +=09ret =3D devm_pm_runtime_enable(dev);
> +=09if (ret)
> +=09=09return ret;
> +
>  =09ret =3D mipi_dsi_host_register(&dsi->host);
>  =09if (ret < 0)
>  =09=09return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> --
> 2.55.0
>=20
>=20
> 
