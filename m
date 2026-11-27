Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776623;
	b=mteSr+napDnHJGGu+fC2xG+qhypz6uX3vGrdQl60eVA4pzEPB98RUqxHUcXGTuSfiqVc
	 ZRKTVQe3W1kz0Iqu8gaSjzwxBPlD/LeXzhD+fE+Pl0/1wmQqfszuLNwF/hfEbyB8q7Fwp
	 24BPBq468lILDx5JWdXoSJ350wDn6oC7mDLYRnBI0YVE84XuYDGDhzdz9ilyAZc3KouOF
	 jekfYVXA2F+fQirJEfV/PldWQ+s5cV4ZU56AAVob5c1BeHY09Ui6+iarQqzm5TnsYJQQt
	 vFqD2mryCRB3AmL9kzM9xP5Hk6c4ZClsmlrvURpTyS9qFU7/yRIeUZbCVdUD+ScHqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
	b=2N1MtOcJ+Xi7eLmgaBcXbbBYncdV973T5hp4PGgeGXZ6qXnpXnFeVa2uikQheMyM1dAg
	 EBxZqN4PQvydXr9HnRhk/dYPX76SIG6IGGgOLLZtwF+IlzwkhO7Y9h44Og+RaN4Lyoeu6
	 tLZ0agKasa1l/diO0/KiMHcmNeW4xwZvTRInnY4BjnUa+HgECSes1iwMG9uwWEALjhhJP
	 fxdimBxBNbVtDxUSoyzEM/8M1MpXC4NkbCpxtIta/mdu56Ny4XpUMrUDhb2/1Fi+TARBz
	 Sen6Z/qD2QVVvdeOL4qwjojG4yJN+jRT9/sRFX82c4Xf9Jx8ijGP+NDczorqLszInGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D045+Osx;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3668606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3668606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D045+Osx
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3255845a12.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795776622; x=1796381422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=D045+OsxbZxZvabIvRm0TJaIFwolOL991tedU265BD8JLNDzAzbXS3HvslGTQZgUiV
         CcZkwAQlz42QJ3zc0mXABa/eCuj3D+HgaVcYaOeyejBK9qdidrphTYpSC+0uUj8WiNIJ
         KS/ZUSWz9U+JR1E+BFlvAgLa5Dfk+2QU8GJZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776622; x=1796381422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=ax04l27BMVdjExGfvS9uWLizFLg6qlqHCfV24hRL3a1bmxShW0zq52Wy3hU1DMvrDl
         IIrKmI1TE4I3nwJE/BATGBQ/boWlLsNz/NxwnqmkX5DAE8FAEZ9Uw7WT8iQ6BCQgrZl2
         3P5+VTlF7PN74pF1yKhEEX97nP94DSA2+KGcvNDf3Edyqr3QQ63NH+k7PxWyP2G19JSc
         ZHV5Ta4JmxiNkijGvhgPp+I6YUCbLSSKC4zaneVA69HkQyQytekQAOGRXkJ/PFWIR/Ij
         rE8ktgog7HC9jYHWksVVaeR0nNQOF7zN3+ka82SsXMVebhpxFA91ccEHv7AeXQosj/hr
         aHzg==
X-Forwarded-Encrypted: i=1; AL+hErE7mbUcifKSjVuBNMg9U5K+cusgZgk51Gv3pX02HVb1K0cUR8F/vZ2f/lsGPLscXjIPzcArHt/YtIsX@vger.kernel.org
X-Gm-Message-State: APuU4Z9284lGKr13Oe357w9TrlERwY3d/m7iEAvt4QwV8USJ2c4OtAHG
	peIRa28ocYiQIZ2AEQJVawOT6+GLnnY6lEQFCofX7c0YyV5t+bT8alCRrPzZH/xkDORaQWY7Inp
	DoDpsog==
X-Gm-Gg: AZFdTZcsZOfJLqqQqwvWhJurFpwH+eQChNjMATn6pJ3rbosSg6ohPe6FD4xOij7r6gf
	wWDoryyr7LC767GMDy/jT2nWwx8YFmVz/3YWRP64QXuDp2m7Jo/IkIZIaaiP7Kux1JEsdRYA6Lv
	PaGGz684KvX6xvit6/P5ych3K86g62jZqwtP3bCBYHpZ3fyaLp4zsaFcUzZ5OccMDNy+CS1xCQc
	bd5nsYFoWhM/IqnIumsD4+m+pPX5+DhhETgKmN7hX9PDOdJdmNLUr0uyqGqCe5QAEdrKheqOMWl
	2shrdg8vn8vDhYTu83/fX3dBPPWevIR2mQM9BJWx0iSw5bjwAUAY+0RnNthE2I1TwuUjIvBD+IO
	ykma1VZwu8vTckNvvxvysYtL6ynOS9y6vaPfhspg5v2xu61az6HShbN2I4t/SzoNbusaE/p62tI
	jIN9MwdGtO3ga740G2u8FKR1HErHsKGR/YyGWBExj0LAIi7lae+IOfBEHz6USdk2B7GK+WOUyfJ
	Kuy0TcISXOj/OA64t5M5Vqc2T/sqsWoXEf6N4b9N3r9vp7GxmHxo+yXLDnmP64gc6hhH9TF3JYH
	qxkUwpyImXeEJWHBC3EAAftikqZN7b+M545nu5/hk9W9UMHArWAk6o1u5f5e9uCBOvo=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3b41c938c77mr22995849a91.34.1795776621975;
        Fri, 27 Nov 2026 02:50:21 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm27807363a91.9.2026.11.27.02.50.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:50:21 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16916928eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDvndOGO+NJzFa1TbYITJmrW2tcmqZdRofGBlzMVtS0yJWLbp/MTwylTYUhusfm3KFYe1Mch3Rhf/k@vger.kernel.org
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id
 5a478bee46e88-3869c6a3f0fmr19991102eec.15.1795776620365; Fri, 27 Nov 2026
 02:50:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 18:49:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
X-Gm-Features: Aa3M54rQkdVsbW33JjuQjGjC9MCiVwfA-JMszG-a0o7TcRXKKUJN-zbdfm4qHSM
Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/46] drm/mediatek: Enable bring-up of
 multi-controller CRTC paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Introduce support for actaully bringing up a full crtc path that
> features multiple display controllers: this enables acquisition
> and writing to multiple MMSYS and MuteX instances to connect the
> multiple display controllers and enable trigger signals from the
> various hardware sub-components at the same time.
>
> This currently only works for rather rare display pipelines that
> can make use of multi-controller without DirectLink architecture.
>
> This change is also the final preparation to introduce support
> for handling DirectLink Display Controller paths, found in the
> MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894 and also
> in the Dimensity 9400 MT6991, Dimensity 9500 MT6993 SoCs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 513 ++++++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   6 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   4 +
>  3 files changed, 398 insertions(+), 125 deletions(-)
>
[snip]
> +static int mtk_crtc_init_multi_controller_properties(struct device *dev,
> +                                                    struct mtk_crtc *mtk=
_crtc)
> +{
> +       struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long controllers_mask =3D 0;
> +       struct mtk_drm_private *priv;
> +       unsigned int i, j, k, z;
[snip]
> +                       mtk_crtc->controller_idmap[z] =3D mtk_crtc->ddp_c=
omp[j]->controller_id;
> +                       z++;

`z` is uninitialized.

> +       for (i =3D 0; i < mtk_crtc->num_controllers; i++) {
> +               u8 controller_num =3D mtk_crtc->controller_idmap[i];
> +               struct mtk_drm_private *priv =3D mtk_crtc_get_controller_=
priv(mtk_crtc, controller_num);
> +
> +               if (!priv)
> +                       return -ENODEV;
> +
> +               mtk_crtc->mutex[i] =3D mtk_mutex_get(priv->mutex_dev);
> +               if (IS_ERR(mtk_crtc->mutex[i])) {
> +                       ret =3D PTR_ERR(mtk_crtc->mutex[i]);
> +                       dev_err(dev, "Failed to get Controller %u MuteX: =
%d\n", i, ret);
> +                       return ret;

If a later iteration fails, the mutexes claimed in earlier iterations
are leaked. Unwind them with mtk_mutex_put() on error.

> -       ret =3D mtk_crtc_find_suitable_dma_dev(priv, mtk_crtc, output_pat=
h);
> +       ret =3D mtk_crtc_find_suitable_dma_dev(mtk_crtc);
>         if (ret) {
>                 dev_err(dev, "Could not find appropriate DMA device!\n");
>                 return -EINVAL;

This is a legacy direct return. It needs to jump to a cleanup path below.

> @@ -1446,4 +1700,19 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         }
>
>         return 0;
> +
> +err_free_idmap:
> +       devm_kfree(dev, mtk_crtc->controller_idmap);
> +err_free_layer_stages:
> +       for (i =3D 0; i < num_comp_planes; i++) {
> +               struct mtk_crtc_hw_layer *comp_plane =3D &mtk_crtc->hwlay=
ers[i];
> +
> +               if (comp_plane->layer_stages)
> +                       devm_kfree(dev, comp_plane->layer_stages);
> +       }
> +       devm_kfree(dev, mtk_crtc->hwlayers);
> +err_free_crtc:
> +       devm_kfree(dev, mtk_crtc);

Before these error jumps, mtk_crtc_init_comp_planes() and
mtk_crtc_init_drm_crtc() have already linked `drm_plane` / `drm_crtc`
structs into `.plane_list` / `.crtc_list` under `drm_dev->mode_config`
(via drm_universal_plane_init() / drm_crtc_init_with_planes()), so
freeing `mtk_crtc->hwlayers` and `mtk_crtc` without calling
drm_plane_cleanup() and drm_crtc_cleanup() can cause UAF. Please clean
up the registered planes and CRTC before freeing them.

Regards,
Fei
