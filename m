Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2C346A1D
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774186770; cv=none; b=ooNvNNUvuNYbbtNrnfVZWqyFxjdDeMkpItJsv8u5393bj/KjLqGPvsQOp1hDt8snYHcV1r+F41KwTeYGXrWN56J59lCj2d1mL7f/KIh+l+f/RNoXZoFnd4NZKztRAQ8vj1Tk2vIJ5KBmi7MJiy6CJmzHT4hk9PNybheeGHPMH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774186770; c=relaxed/simple;
	bh=m3DFLOq8f/rq5Wyza2szchvR0UjBUxMQG1hQfeW+TvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHBjFSuE17y/ev/Hr7gFmZxbXt/J3RLfa5DCbczFWsT6cD43H6Qmd+/RFoZvvEQ6bRojNFnRD/LOracmtrYy3fGFIvX8T/JpHlNGuFFFWBpcBj8ZjRZR0ZmYRGe1Q2/o6ri+NYUIhYmf8oIQCpEFQRMygZiVrr5Ij5hpn3FDQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIa8y76o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIa8y76o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9968AC2BCF7
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774186770;
	bh=m3DFLOq8f/rq5Wyza2szchvR0UjBUxMQG1hQfeW+TvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aIa8y76oIaroKvoVI865SfOL3XDns8ctJ+rbmzQifVRvPhSXTDVsua379xIiy7D/A
	 nnITdWeOzN96YF1k2f9XNr3YVAhU1k9bftiQ61Go9tJClEF5ATA/Om5+hjVteZRnZQ
	 ILlpmQsu7ZEIwJMtyppqhySd2XSGxllO8wDhjELcmVNEGF5jAVvBQtNGUYj/DqNC+S
	 P1H1/0ut4xzYFgOTfez4D0jBPbwjnKdXGLLJK26szBRDnwROJk7ozUxfJrdEr84e72
	 cKUOoGtcy1BUZIk7c+vGumcxuSxxJiwtKkatK/3ZjwSqEXVYUO6zSLAa5lF+XweAo+
	 5yQW3A9mjzYQw==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1274204434bso3422132c88.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 06:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVMxRmhQxEGpzLRNHPSMQ6yuI6kULzEwG0sGgsdMi4cy9fiPPJE8HE2vupmdwW7zQa2IcY8zeotG+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49bIPmMVDEQ2Rsd+uqf5zoX2gUP6cyhlZXPlPMu6uUtIDrPHL
	jlp26u1bp0pXrmcx7Eivk8zS39QVabRaLD+ngdfUPHXT94AJ7DLZST2K1Fb+UexrpS/Dg8g3mBo
	iPDXEKln90bheiV8eXrvrdquABTIElg==
X-Received: by 2002:a05:7022:6628:b0:128:d5bd:3557 with SMTP id
 a92af1059eb24-12a722a15f4mr3801000c88.4.1774186769719; Sun, 22 Mar 2026
 06:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <5f880f1334aa93184afee3e36132ca42628821fb.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <5f880f1334aa93184afee3e36132ca42628821fb.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:39:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8H0fmap_QGqqV27FAEYTvdj=1aBALSX6VME3r7avVCOA@mail.gmail.com>
X-Gm-Features: AaiRm52YGXR86xSZou6nc8shJxbYgOHHf9z-llYwgyJUbBqSHJxUq9frUqd_1_E
Message-ID: <CAAOTY_8H0fmap_QGqqV27FAEYTvdj=1aBALSX6VME3r7avVCOA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpu: drm: mediatek: ovl: add specific entry for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Val Packett <val@packett.cool>
>
> While this configuration is otherwise identical to mt8173, according
> to Android kernel sources, this SoC does need smi_id_en.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index e0236353d499..97a899e4bd99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_dri=
ver_data =3D {
>         .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
> +static const struct mtk_disp_ovl_data mt8167_ovl_driver_data =3D {
> +       .addr =3D DISP_REG_OVL_ADDR_MT8173,
> +       .gmc_bits =3D 8,
> +       .layer_nr =3D 4,
> +       .fmt_rgb565_is_0 =3D true,
> +       .smi_id_en =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
> +};
> +
>  static const struct mtk_disp_ovl_data mt8173_ovl_driver_data =3D {
>         .addr =3D DISP_REG_OVL_ADDR_MT8173,
>         .gmc_bits =3D 8,
> @@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-disp-ovl",
>           .data =3D &mt2701_ovl_driver_data},
> +       { .compatible =3D "mediatek,mt8167-disp-ovl",
> +         .data =3D &mt8167_ovl_driver_data},
>         { .compatible =3D "mediatek,mt8173-disp-ovl",
>           .data =3D &mt8173_ovl_driver_data},
>         { .compatible =3D "mediatek,mt8183-disp-ovl",
> --
> 2.43.0
>
