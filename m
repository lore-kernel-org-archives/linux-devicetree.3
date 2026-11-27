Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771988;
	b=zVVTSrYiOTxK6/xd/mrgShHPcZouHzme5euJISfCQneHWm9PBjlaywJwHw5Nfx5omtB5
	 pGerPxfFaLC2yp5kzlAnGXaT12wYsc3ckKSO7qLLZoWd6+phe2/VoXj15aSxUs8GkTwMk
	 +x/ibG4qeW3wm7QIfsYAXNJm8EKKVCXaCvX6Q8B7JmQduh9WRC5xfTymtl5E27AJ7tDqu
	 cKzfltjHODhulB98upO4m9Wj9SJ324V6OsiHOLeqeTQR9FCV8eIbP91lgh5syXXTZO2lr
	 cv9PqT9OUHlxZx1TyO13dDVS7MLwM1KMM4tTbiBiAdSxSLTYFu56dIT+I9GCqgiV/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
	b=hitWOFRcTkt5OUNteB9vZAnZLpeR/jT7mOKxn/CXx1H00V5pyORcpVrmGrNGU9tmAJxF
	 UBswwkFMDH6vo6tfMgWV8k9K/OFKLSccmwzrUBEzoWltMIG/6sfeKzNh4sj3i6DXsrlix
	 6KDrvKbx404pN/WeuUU41LZC4tWQYcUtaQVcoorRiZWZCcY+gPGIc732IxLV+Lop/9802
	 jnpReZfGA4WrGWK51h5hwGWWm/z8WTKASco66DTY04QopGNps2OT/L/CtI2C4HFRP3LG9
	 q7J9S7dR4n8zDCPl3Hymq0u/XdggYKpDKd/q/uRxY7+qgYpJHO4fE3C9B6gRnna7J0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NJQYqT06;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6C606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C6C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NJQYqT06
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso5565160a12.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795771988; x=1796376788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=NJQYqT06QI3WDOOkjOyAttrx1U60LpgMP9aZXjzm9Tc995xd5iC1EDjOSmE48Y3tsg
         YuuotDnsksXWr6xfUYBRRlItBOF057t/orqoeTOWHcsTKXkNkg/bA+GbdCS7Jd+pM4E1
         Hq4pKEKA7Xnwig6hKc95/lbRBrxmbwjC3iOM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771988; x=1796376788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=ozrEPfVIxnKOrWkQ+pxEV7sbYu8kiglHe981Ou9jTeXko7mlyAqnRA6XWSA48g5u0T
         zYCPQEY2CrKLKxwTOztqGHhs9OEWB/fxkxKlp2/ymQMoWt6t6rsS21Yywie/aNm36A9a
         yg1lCwl73igKWgFJ7s3OOsV1SbC/HyPkRZV0xuCoIoug4bCqZ/FSTvanXIombjuZ8pqJ
         K2DTa7IPgxrZodWVmV94i7AD0+Q97Z4ine4bP4pd5TGAMrhuMKN0bMI6yx7zvsuKd3TQ
         aJctqkNDG3hFy7eLYxVsZrpY6dGeLTPlu06/IIl6h0cCYkj+m5Ckch5Fm4p9qTa9F29h
         KDVw==
X-Forwarded-Encrypted: i=1; AL+hErEtOYDrdfboeBA941FxfHnqv9PzI/o6iOMd+nRlGwbX7HIBCCDNve739GgmB5acZtqo6peMUmWvYNAF@vger.kernel.org
X-Gm-Message-State: APuU4Z92PE3VF7zSfxiz4nErLBRLA66aSCRf4VaOWTwWZa+S31T6IMyw
	1UUZCo+BUd6b9s1ucwL0kBDDS+XuPtFiGm5o7piiX4I60LE8AHlQ6QAdCRCFIqyY9CRQxP5rzmo
	8vIibuw==
X-Gm-Gg: AZFdTZef0P3Xr8J0JFTr584Hanm1baGBmEsoWPMWUm9OE7yiLiZapaLPXfvBEcmfRtv
	mMAQwd58phtotTObitLfY2QDKf5AvBFFWG1EyugiwIPleyimxWHuC7drUUvB21/0TF98RDWuWub
	W7PFJtgCYwjgjMKS6gInhx8EH4UJ1eiUbGWWFf5050k0abPeLLoz3GJS9grZ4cvbgnMKlafbUb/
	WvcjTslq0XzqUyfJWvDPErxnXKLG/zQeLfbTfzGCoYJe3m/Y17s/G5FbV3thj5fERL4NwkBkPKH
	4d4X4feu1MAVAiH0JlJMiVZ6aYNAmaD2gytMfsNfAXU42WVyzUQBVC9yT9uduWfek46I3Yv9LKH
	I69V4gFpZs0DU3YX3kuxSxqiNBGDb56ZcAHFGPdkWZOYEPZeV6DntlZftqglzECF5n3MiM/FYC7
	aFYDw3RsE9dz1DKNJDbnvNuixVKiN4sGkwcB4LMfXAOTUyjnbrAj+QdVQ0WfcGc2bW5WxSE0MPO
	k3klBp/KFbvWROTilQO89bAa7HmsZFrmxSRAbcJb++wWTmdAJB+dk5Rw9yUwK75ii6pnMBmVzFc
	9jHiFG+X6RsIAr5SigyAiY+Ff1yxC5oZoEhkY3PvXhJgLfZhXYMa11SOlMwTPYxIoWA=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr19582728a91.7.1795771987804;
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm17896870a91.4.2026.11.27.01.33.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so7535466eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEA8UYE9sW49USyD7P+MzxiM+VFDYPIyPvXUEmsuiTHswWxS0CaB40F/gPQxCkygN8rv3XodNAVCqOh@vger.kernel.org
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id
 5a478bee46e88-386a1ae6d5fmr20784587eec.36.1795771985456; Fri, 27 Nov 2026
 01:33:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 17:32:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
X-Gm-Features: Aa3M54pRArGKHVMgeqwG1e8L5StTOP94fleg1U4pb_vICTi6qu6Nmly90U-l36k
Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
Subject: Re: [PATCH v2 37/46] drm/mediatek: Prepare path builder for
 multi-controller architecture
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

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding support for the new display controllers
> featuring multi-controller w/DirectLink architecture, expand the
> path builder to recognize whether a hardware component in display
> controller related output path is getting its input from internal
> or from any external (to itself, but still internal to the SoC)
> display controller component.
>
> When an output path is found, it is also necessary to understand
> the enablement order (in terms of mmsys/mutex other than PM) of
> the controllers, as that cannot be done randomly: for this, the
> initial path builder will start storing an indication to whether
> a component is either in a leader or in a follower controller,
> and then a new function mtk_drm_set_path_orders(), called when
> binding all components, when initializing KMS, takes care of the
> looping through the path and setting up the order between all
> of the follower display controllers.
>
> As of this point, no multi-controller SoCs are introduced yet,
> so this code will not bring any functional change on any of the
> currently supported SoCs / display controllers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 374 ++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_legacy.c |   3 +-
>  5 files changed, 351 insertions(+), 32 deletions(-)
>
[snip]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cccdd58b848a..75b3fd56d6af 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -185,17 +185,26 @@ static int mtk_drm_match(struct device *dev, const =
void *data)
>  static bool mtk_drm_get_all_drm_priv(struct device *dev)
>  {
>         struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> -       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       struct mtk_drm_private **all_drm_priv;
>         struct mtk_drm_private *temp_drm_priv;
>         struct device_node *phandle =3D dev->parent->of_node;
>         const struct of_device_id *of_id;
>         struct device_node *node;
>         struct device *drm_dev;
>         unsigned int cnt =3D 0;
> +       bool all_privs_found;
>         int i, j;
>
> +       dev_vdbg(dev, "Populating private data for all controllers on ID%=
u\n",
> +                drm_priv->data->mmsys_id);
> +
> +       /* Avoid variable length arrays and allocate an array of pointers=
 to privs */
> +       all_drm_priv =3D kmalloc_array(drm_priv->data->mmsys_dev_num,
> +                                    sizeof(struct mtk_drm_private *), GF=
P_KERNEL);
> +       if (!all_drm_priv)
> +               return -ENOMEM;

mtk_drm_get_all_drm_priv() returns bool. Return false here or change
it to return an int instead.

> +static void mtk_drm_set_path_orders(struct mtk_drm_private **all_drm_pri=
vate)
> +{
[snip]
> +                               /*
> +                                * Paths are per-output: set order for th=
e new output
> +                                * by finding the order of the same outpu=
t number of
> +                                * the previous controller and incrementi=
ng it by one
> +                                */
> +                               src_path =3D &src_priv->data->output_path=
s[i];
> +                               src_order =3D src_path->len ? src_path->o=
rder : 0;
> +                               if (cur_path->order <=3D src_order) {
> +                                       cur_path->order =3D src_order + 1=
;
> +
> +                                       /* Order found: check next CRTC n=
ow! */
> +                                       order_found =3D true;
> +                                       break;
> +                               }
> +                       }
> +               } while (!order_found && max_iterations--);

IIUC, this only works for up to a 3-controller chain, which needs at
most 1 update (0, 1, 1 -> 0, 1, 2). When there are 4 or more
controllers in a chain, it needs at least 2 updates (0, 1, 1, 1 -> 0,
1, 2, 3), but the loop stops after the first update (`break` +
`!order_found`), leaving the orders as (0, 1, 2, 1). On the other
hand, when no updates are needed, `!order_found` spins
`max_iterations` times unnecessarily.
We need a loop that stops only when no more updates are needed, i.e.,
drop `break;` and loop `while (order_found && max_iterations--)`.

Regards,
Fei
