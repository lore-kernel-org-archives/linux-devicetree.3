Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782389;
	b=UOpqKpTZgRpUP3+mm2JuE+/fSl7DQwf+pX4rZon95Tyz+HPj8/wDcB6AmthBeh96b3dt
	 U+gtQNYYiMoNrYykNSo8M4r0MGB7zYDPWvgzJCWbvSVXFZnWpqk7lPwG/UiGz4fL0f/mj
	 gAx7T8MdCpKEB8tazpaPYCDeVlEliEG2qAYY3/filMzyuEVdpv+I6dzcH2BrjaaJNpzz5
	 C1iGPbbAJoraAXRb1ydqfndB6Vg3MgMqAjd2kXGjFpQ1JZDmwEqlL87wQ54uV0z3VVGXP
	 VUJzAkaLByhvnqNkGbV28QHNZTUametSKvsQc6uPOmHYFrrKmKJfw3/OCnJbxTc7k5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
	b=MYI6wOVBTXJWJ5+oq/Fpcp5l/zN3+vX1ucPTr9gwVai2BxnHSsZKq/F2cm/C6LEnMTAf
	 GGR888Y3yjvG3dhkLe6TnUHR1/j04EFgJxBYoNRKzeCdySh3116qScAEbILAziNLy1VXV
	 NtSZ6fCjEnFDO17NnTv5BZtR3Xm9wVangH7icSUH6IpYMDbKL9kDw0R/uJirFZ0GDDn1v
	 7ooKD0yRYjaS0D44p6DqsDcs12/OQKvI0zgjTCWg/OwMUe4KdP4E3mxDIMBapcErZFDZ1
	 /pE44Nap7Rlz7iKmD7Xm6XVBpzSLzGaYce+CmaEycAZpJWVVhSr5zusF5y0s04YqD2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W7PuJ7T+;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C732606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C732606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W7PuJ7T+
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f05b465cd1so2639195ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795782388; x=1796387188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=W7PuJ7T+oMHV5KfbDUO1lyyW5477gvpzXTYXLZI+yDPY8dl2c4A+kpcADxkfY+4tGi
         TiHPqlz8mT1yZRqEvhDF0wNDej1k83FAk8LTDvBWLs/8t8nVOzHYsK5MT/rKaouM249y
         /5/LnUrtWtDCL9k7Yrs5QZkLYFp4AoXQc2I+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782388; x=1796387188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=e8DswE8wKdbhGIXTw6TiCrDqDwu5qQWpBUIB00YXqZkhYjIajPGJGdta/+Ndvghq5H
         aWuUYyhJyTw7MXji4kDAEQHDBYQiWnAIsAvhhDs5KrrmYEFxl+axkL54AbdHXa7xLBwc
         88UqmzDZicK2n0xzJOZZy8cXkeQuPiasaC4LNHTibeUyXXc+K1cSp1ofPlB4rNl9E9c/
         QZJWiIjK416F4NqtE4CP5oT5O7F1wgyFkqhaZlwcbjfiK1KQ1xfY7/2L1j+WiWmmV00a
         imQnDl455d6QUIkuph8tIZPN4dQoeMcGRkFyI44a7w4RYhrvs6Z3wYtsxNxv0G3KSR/a
         DvkQ==
X-Forwarded-Encrypted: i=1; AL+hErEq+guMFoIiCNgDfzip4ArRkfp87SqvGQFsooj8OqDdYPhTCl9WGwTFR/iPDJhn8LoSQjlBT8XIaDHw@vger.kernel.org
X-Gm-Message-State: APuU4Z96CEqR5RJS8pOXNLEebnLHrObNISLMe/xQszFl6P/lOSuZDowd
	hVTxoBXtjb66kmwI9EyICz0dJTEkXjnuN9zzBrD56m1MXGzSvE0j5XEkq/B+3lqs/n8AJuOl71v
	P8xbAGQ==
X-Gm-Gg: AZFdTZd/wlrbX14yzO/KNp9oP6GnfoopJ174xyOeW56PNUQu4TBcL10sujPLXH8iza6
	t18qcv42IoSGhRA04NLwfWCwKy4F1iKGwNxK8il8G/cxJ6bTyWfgbMd9E6Klk7Y/bQKtDmINHJ9
	p2FZ228O2KUql3Comr77CprT/a0vvz2EKZX3jQBctQqAxvROvxjRI5E5z2nBUpm1JTYjN3dK797
	NKK/naN5AnvwX3gRhcwWOVsMQNrrST8FLewtP0St2qkhjX53+QjDr/aknSeJh1wHNohQthh2yCA
	0AnXAYGVVk632+Q3kZdXE7D/+/8RzZe03qU2jTxMMsxX9a/2OwCnx8xSfsNuoZWEQxzlhH+NQQ0
	rUM1oRaHPHeX9Akir79KmBc6zWQuWmLeOzN3auOnBrHF1OaimJb3AWRcyRumOrpwdzrwqYOF6/9
	Uclz7Ci4KLxWhdvhKRbBUb8wDNB5ABQaapD15CbFWnUTOq7wfkF3l3hsbFwnQpeCXDiAafpopoL
	/xdaDSz5fX/TqaBMtJorrWlw+6D3teWn4KIMifeciljtKUAXhw0G0TnBABR4ba5wFX1o1wgbmio
	V4MASPTACMIFNj9CXaAghmLg5wcOvGMFfS7GfERFSmzdt/u3yBzkymtP1SbaohvMcj0=
X-Received: by 2002:a17:903:350f:b0:2ef:e285:7086 with SMTP id d9443c01a7336-2f04eebfe91mr217780685ad.13.1795782387946;
        Fri, 27 Nov 2026 04:26:27 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm116342985ad.65.2026.11.27.04.26.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:26:27 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38692f62b22so10827047eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHcbddQ9jOWdXJh03fzNrkOQYa310uYEIQ2gMGCBg2REAWppq/OGJqhjI9Yuf6Rp2pVaLvCkoiX0ize@vger.kernel.org
X-Received: by 2002:a05:7301:4d0c:b0:376:a6d7:8f6f with SMTP id
 5a478bee46e88-3856ec3ec8bmr25649718eec.17.1795782385135; Fri, 27 Nov 2026
 04:26:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:25:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
X-Gm-Features: Aa3M54p-uqcPZ0BTjnlZ-C4P_vANwYAAc7cv53pfujMjetYD2ahEumQx7Kd9jG4
Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all
 paths are invalid
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
> Up until now, if not all display controller paths were valid, the
> driver would fail probing and refuse to bind components: while
> that was a good idea before, now that mediatek-drm gained much
> more flexibility, it is finally possible to gracefully handle
> this situation and register only the valid paths while leaving
> the invalid ones unregistered, without any crash.
>
> Count how many output paths are found, and then count how many
> have failed probing: if there is at least one valid path, avoid
> erroring out, so that at least some outputs will just work.
>
> Of course, any path failing is not a clean situation and must be
> resolved: in this case, function mtk_crtc_create() still prints
> error messages so, even though some output works, that will not
> go unnoticed, as a quick check in kmsg will show the errors that
> made a certain path not to register.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 82d844b6abf7..7c9cb50909c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
>         struct drm_crtc *crtc;
> +       int num_failed =3D 0;
> +       int num_paths =3D 0;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                         if (!priv_n->data->output_paths[i].len)
>                                 continue;
>
> +                       num_paths++;
> +
> +                       dev_vdbg(drm->dev,
> +                                "[CTRL%d-CRTC%d] Path Len:%d, Controller=
 Order:%u\n",
> +                                j, i, priv_n->data->output_paths[i].len,
> +                                priv_n->data->output_paths[i].order);
> +
>                         ret =3D mtk_crtc_create(drm, i, j,
>                                               priv_n->data->conn_routes,
>                                               priv_n->data->num_conn_rout=
es);
> +                       if (ret =3D=3D 0)
> +                               break;

Since patch 38/46, mtk_crtc_create() already combines all controllers
(`order 0..N`) for `output_paths[i]` into one CRTC, so only the leader
(`order =3D=3D 0`) should call it.

Relying on `if (ret =3D=3D 0) break;` instead of filtering `order =3D=3D 0`=
 has
a few issues:
- If a follower (`order > 0`) appears before the leader in
  `all_drm_private[]`, `mtk_crtc_create()` gets the follower's `j` as
  `priv_data_index` (setting `mmsys_dev`, CMDQ, and `conn_routes` from
  the follower) and breaks before reaching the leader.
- If `mtk_crtc_create()` fails, the loop retries it on every remaining
  follower for the same CRTC.
- Patches 38/46..45/46 don't have this `break;` yet and register
  duplicate CRTCs for each follower.

Skip `priv_n->data->output_paths[i].order > 0` in the loop (starting
in patch 38/46) instead of breaking on `ret =3D=3D 0`.

Regards,
Fei

>
> -                       if (ret)
> -                               goto err_component_unbind;
> +                       num_failed++;
>                 }
>         }
>
> +       if (num_failed =3D=3D num_paths) {
> +               dev_err(drm->dev, "No valid Display Controller path! Goin=
g out.\n");
> +               ret =3D -ENODEV;
> +               goto err_component_unbind;
> +       }
> +
>         /* IGT will check if the cursor size is configured */
>         drm->mode_config.cursor_width =3D 512;
>         drm->mode_config.cursor_height =3D 512;
> --
> 2.54.0
>
>
