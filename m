Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681410;
	b=tYASa69K1mh3XL6CW1WP51cf0PgGRCIPheD+mNL/fk9VIUC8b7PAmya7L7ZzAnHR/nSt
	 jX/GR4Fj+r0HQooIUPCMnnBxXJnN4sxR6URNp8Tt8SaUc3Oes0kgR2CWSqOsHcMF0VQuX
	 A/n0tr8BCnjjXvf8pltSXS3B+bzM+KmCIcHyN+76O8aK9j3qZoVNYK6sztowKrlyhAZMa
	 4IZm73x7YoZ/aBhq6eTB8Ud9Qay8S3diDEerx/Lqu8O3TGQt5iq1juamJR0fROSWq0W67
	 WZZ712wGpfRwLfYjvMQiomtsuEZpWNGJFRQ5B7rMDQf0Z0LOhNXDAh9EIigvjN/fhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
	b=H0JhhoMp6VirG9BMNbl/3WQ1WG7AZ9vyuQfICOGaoyapTQ1RtQoTmSk1Wu4AyEdHjW6M
	 +vw8FGBWyfiD6NplDMCjcScUVPIfhX28JWnl2jgWC055z8C1s0rVjUipdWxbemudGo+pt
	 wV25YW8SjoUQN3YPqpAnB8AJ2vV5BIP26SfNht7338XS2lYRtSU2j24d5Jr350CWU0gj3
	 +v2VlMId8F2AnfwFuyfZCdkM5mJeJ4sv86TfLzP10Iv6mWQBd1ymiVDlKwkMuA1rbzIo3
	 mUNMkPuXljM0I+p/VStj/aq6/dKPJmlpV0J1LkdwRyBehs2wizVuECMg+lJdjT/zEQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jHeAog1z;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577E606A33A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A577E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jHeAog1z
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3378984b3a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795681407; x=1796286207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=jHeAog1zMgDnWkFecSJzxo5h5l83jlIlWAtdUJt6MU71fUD6Qy6OA7grdcYYu4nLdi
         udjwlR0pic5ZYPP24doevBWlbQgipPhFGLRoK7ywfFRPQ1HB0AZd4fDHRlLuUrQSHgX3
         rrfN00D4ktT0gcjCcO38o55KsoWU0OYf3gTNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681407; x=1796286207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=hjsAmy+/QWZxy16PNhT6vzgYwyM+d+zDAXiKbrJA175YGu6wnd00ymAXkf//gJZhgF
         nqLRyAv1UL+aYzamCpjGfkLR6KlriyulgLby93IEImUuPTb5/RdKOKbi5n6wwvxsZYIu
         4Hmu2NTGHaEjRZK3HDCmVlwd/9jhoI5uHUHmBwFinXuvqri/fA5bpa22B1/VBrmLnfj2
         XNrgwQCdt9Jm/Y8mUCsMJsFU3dshDU6lzrK5DLjij74l7ySkQfPp2WhHxPujIA0fzbCi
         xVZxaP4JGGkHLhLxdNcLMcBQni6y/8MXGlLNArEcz0iUZYLX9NF+hhCWtIl6TfhG1oFH
         RLxw==
X-Forwarded-Encrypted: i=1; AL+hErEwImIzVBlTMd1TCBC4x+M2zriItb2GgDwRyBXV6GiUPDOy0tmoSE7cKwAyWVw6t07x8zmDn/77C0Ax@vger.kernel.org
X-Gm-Message-State: APuU4Z+aCxMjsjcI1kSOeVIEwrLsO7nhFDf3gjz+TzGXnGmkfpCfprM2
	V1pHAXfVxfisXGTKmEbCxFAGRSwBSdV0oxcEPO3EAZpfFA2f67aHsDF7k/JhR4Twj9HpG9NNAY5
	SI84bcw==
X-Gm-Gg: AZFdTZcxyS/wAEgsk5uKzZ00gD6rgPXNw7UCk2TKdzu6+bD4Pyc703XQbaJVMw1OSvI
	tPb8ul0jJ8cbvBluN91EJRV6Tj+/bdD/nkkNtzh46cA7UTDwTWhzBOURdG5mqR48HN0Yrz5VIXe
	ndlXaqG3/XXqJasoQq6mDc4Xzd3NRd6KDx2du759KyG6UNsfq1Jmt2QWaLdH7MkWHnITP2h6vTJ
	3FjgRHOiZhJH4C7XO+PZXhlgHuvgaPGG68fEcQk54Fgb4Fx9BvhrsjozRz30pxcHkZ/TvDnqZhG
	jsqndPW0z4v+hkVDmS1+rpc6xklkFcN/691o1XmwfotJyQSu2DJDuupuUj8a4XpfG6bXUYwNdE6
	QS85IskBbj+oqIL/NAkhCxypTHUaVydEsObG0gFrKHxyOaacLmw89KZ1EXGGUwL2gbVQz5tnH0X
	UIX+tfX4ZbEmbugaTDdXebS4YkmLzosMif1bWi00a6d2Vrej4h1PQYrQdsgmQui60rzaNNoEyth
	STOXxW2FG1cwbhC3Eq28OYFcNqZZJGj3wtnEnZ65NS9RgU7U5YzcwJR3B9OEg17+gYA2z9DT+qo
	d+Qw0MBzugnxeMSL+4oHr3sAW5/4q4lEs+dtbJXh6venlayqZYOPNAGPi53siSjIJdg=
X-Received: by 2002:a05:6a20:cf57:b0:40a:54cd:8531 with SMTP id adf61e73a8af0-40a54cd8699mr752104637.0.1795681406861;
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm10624639b3a.0.2026.11.26.00.23.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386b8f2f671so3664546eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:23:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3rSsRf9Buu87ub7dyJV7WZatrUxTjZLfXqnCFKS5Y+53MEsBfq/yEcv2BwA+ZuTSVLOsJ3J9j9XJm@vger.kernel.org
X-Received: by 2002:a05:7300:a986:b0:386:c6e4:5732 with SMTP id
 5a478bee46e88-386c6e458eamr8946070eec.3.1795681404503; Thu, 26 Nov 2026
 00:23:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 16:22:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
X-Gm-Features: Aa3M54rE91WEZuEtmgUF0iLv3_PtSqqif-lCGzmC6rPCZG5AI3LqYIpHVgEKyRo
Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
Subject: Re: [PATCH v2 21/46] soc: mediatek: mtk-mutex: Add new functions to
 add/remove triggers
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

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add new mtk_mutex_add_trigger() and mtk_mutex_remove_trigger() to
> replace, in the near future, their older style equivalents such as
> mtk_mutex_add_comp() and mtk_mutex_remove_comp() for the Display
> Controller related MuteX triggers.
>
> The same functions will be used to also replace the Media Data
> Path 3 (MDP3) specific mtk_mutex_write_mod(), unifying the MuteX
> handling across all of the currently supported multimedia-related
> drivers for MediaTek SoCs.
>
> While at it, this also takes into account the upcoming refactoring
> of mtk_mmsys and mediatek-drm, which are about to migrate to a new
> Component "Type -> Hardware ID" mapping, by adding a new function
> parameter "hw_inst_id" to support that.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 60 ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index eb5d381ff5af..ef8e77f7e2f6 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -887,6 +887,65 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
>
> +static enum mtk_mutex_sof_id mtk_mutex_get_sof_trig(enum mtk_ddp_comp_ty=
pe type,
> +                                                   unsigned int hw_inst_=
id)
> +{
> +       switch (type) {
> +       case MTK_DISP_DSI:
> +               return MUTEX_SOF_DSI0 + hw_inst_id;

Unfortunately, DPI / DSI IDs are not continuous in enum
mtk_mutex_sof_id. There are MUTEX_SOF_DPI0 and MUTEX_SOF_DPI1 between
MUTEX_SOF_DSI1 and MUTEX_SOF_DSI2, so this may point to an unrelated
SOF ID, Also, an out-of-range hw_inst_id (if ever possible) can also
map to a wrong SOF ID.
You might need to explicitly enumerate and map each valid (type,
hw_inst_id) pair and return DDP_MUTEX_SOF_MAX otherwise. I don't know
if there are easier way to work around this as reordering
mtk_mutex_sof_id breaks older SoCs.

Regards,
Fei

> +       case MTK_DISP_DPI:
> +               return MUTEX_SOF_DPI0 + hw_inst_id;
> +       case MTK_DISP_DP_INTF:
> +               return MUTEX_SOF_DP_INTF0 + hw_inst_id;
> +       default:
> +               break;
> +       }
> +
> +       return DDP_MUTEX_SOF_MAX;
> +}
