Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684698;
	b=lm4hjuQY2YPExZD1dUKKqyU0ISKdBpZvLZEE7JORU6KUAeW2aAPNiKNZeLshsARrB/j/
	 zqNmwYfGkLvvP4+8Mu2PGu2cRAHFL1rtfNj1sXQubnU1DA+MoG+z1KGL1i70PwQDIJjGk
	 wCeK8KjhzYZ+PQ/daxmvOImesVuw/LiUzyBwr79QTJ4NuwXuWpQlHvY6jY4prbAV2rOtJ
	 lZcczd78KZYS8r0MnJobuXGNCgGrDBxoca2BajkTdLtfY2JHdxNxMNy9RqHzxC+MYrBvd
	 nECPLAma7A11pH3KDH25FhVQdI49janxG1OXLR69u3RCXU45jtJuIHet+1wgwElRdkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
	b=1yFKJ7uN2Ja7623VhGmyczA08cnjmqpSiOye5UwJ4DCo7llB/0tYdfN4rmX7FrKbDnDw
	 RoIfpzQEvmaevre7+9rWB8Smbm2YdritEKUseAGcPa56ENaLolb1P754hhCyds9WFbKfi
	 hcWzuxvZ+lcZPdMNGQHxiihlzkwEwBFUaN+V8J9i+ek//SlYvAsFkRsHlYSb/Uv/75Znd
	 XFzokKjzgFkXj5McK+aombQ6fkvLMA/H8/jE9+5wO22nKs2152isK0NXrv8rXV4l8rl9c
	 +SWYfPXskV46F3qnTHgNi5bbPHIIetxERXeo+yDqryigRREu7/VSFH9XCJbeNAzbSeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=azU5cKZy;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07215606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07215606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=azU5cKZy
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4587232a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795684697; x=1796289497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=azU5cKZyEwg0mxkzjC28P8LBW/Y7JJO+mqQCOAjI1k/WLltH3t8wRk1ESoXCkzjBqo
         9yUT5JMkbic3pway3vrcxW8vtzlxt/1PoM2RkxxbOD4hPa94sFIXxuuknaaxlg82Utpr
         xp9hqIHHbwZaXOXRheBXlkaRybMuiBlDc78mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684697; x=1796289497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=RNbFayQdhqgwqmPQq9xo7UIdzQrICahUmDYElgy1QzAcjXGUkWT7rDgcb52HzRfMGH
         K+05ND4ZOzqvg55k7dqwhe9BW36m4YlLAb5E2P3PokN6gzlUw/bd5Rv+6PXFSzrpGMc+
         ZcpR21GrgqCal4d2j70FpOI7+1i0JG9jjIvtE2XVZq+RnBka6iKN/nXzc5G+KGUKhUgQ
         C+VJCpTitvqON+JWPUolYIxrEkJ6pdafjuMjVml+TjNvh4c23ysgZxhbwmyjYJ6DDffW
         gcUKONXsbpVDdIX+xsNM3oP/mY19a3rFQntOd4aKLFfRITw8jrKFnPDnolpkeOdLH8ZN
         219Q==
X-Forwarded-Encrypted: i=1; AL+hErE2pTMIhrohkuc1r7tmlrzV5o/Gjf9y04WOr1rIIFjQT2dSbOI6FvM8nyt320U9jdEq7kdbLpeN3CUS@vger.kernel.org
X-Gm-Message-State: APuU4Z+e/oYK7x8SbmaWOCYYbJcFyhkdJek31gsyu9oUz8R/Kp5k+6jD
	ntjJcB/vlfJjYmD71o/o2buzfrXg7z/usb/qWTLnWxo1nVaE7BVsZaAa12rOsm1UIjclTCPqVeS
	KvCPWlA==
X-Gm-Gg: AZFdTZf4IuJ68k64upzRv1B+JR4Gl3eC0DokCrABPzMe95wjNbq9xBdlG9Qi2o3bpO7
	oRpTTnni7pR96S+blwNxGRiTPZgZ1Evqmh9T8yq7FTeOkYgLdd324lL/nEele2fbJaHx7GZg1YM
	Q46GL5APWBeTVa1djETsNojqtti0puiZ/uwqQ4jaPirzaEOHUv73Ka1J+PgdUgjOISaDMyq0qMk
	f22lhIVixxyAlIV8KhD2bDjPrZj73SMtpk0or4BjTN8MCO3EmFNLWkoc5Fesns9XdYiDfzaZKsk
	qb2emf1TUdql2HEK48J7SoHt/Kd6Gy/v5Cmv/4Cht07/bgrCMjARXI8zopRt2vq5B0X4zA6Hz9M
	T/d2QaM7yFLGkkY85mpChaqdJX+KXdGnGl4ZzT8Wz74FbwVRJYA36Ibp2qY+0yNZ8PCJnG4kyVi
	Jn//GnfGxn9SSPclPeplClUDNNJlmKQREU51CTshK++8WfO8CPtv30TBmPNsmNl3h63IrwQzVWq
	5biCdU+ELuFfztlT+3n1CIKzjstKnpIsUSuMEFLWWbJbZUPM3dcQHAy5jIDzcpy+jDxDn67IzZ4
	O88Ae618mPyh1mDsHctmfGAHoQ3R+YzhQgL9Ci1xCMrN6zqGtzQgvk/UF0zw7TzcrlQ=
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr21748767a91.15.1795684697276;
        Thu, 26 Nov 2026 01:18:17 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm32444827a91.6.2026.11.26.01.18.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2092187eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEtCDOhus6SaRnJe/774b+nuQDtQfyDGInmeGOQlqMBMLQ21weHa1ByfvlSfyaf5PzSldCKilU33zOS@vger.kernel.org
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id
 5a478bee46e88-386b82605b9mr10045446eec.7.1795684694765; Thu, 26 Nov 2026
 01:18:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 17:17:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
X-Gm-Features: Aa3M54qPRICfCIh7RUjjGiJ_0TC4b-0YY-WXywPDgZZ0L82ERU6OYtXByrL3V2k
Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
Subject: Re: [PATCH v2 22/46] soc: mediatek: mtk-mmsys: Migrate to new
 Multimedia DDP HW indexing
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
> The mediatek-drm driver is ready to switch to the new Multimedia
> Subsystem Display Controller HW indexing.
>
> Perform the switch by:
>  - Adding new "from_comp_inst" and "to_comp_inst" members in the
>    Multimedia Subsystem HW Routes structure (mtk_mmsys_routes);
>  - Changing the MMSYS_ROUTE() macro to use those, which performs
>    the migration of all SoCs in one go (as all of them use this
>    macro to declare their route entries);
>  - Adding new mtk_mmsys_hw_connect() and mtk_mmsys_hw_disconnect()
>    functions, making use of the new HW Component Type-Instance
>    indexing.
>
> Unfortunately, this change needs to go along with the related one
> in the mediatek-drm driver, otherwise functionality of the Display
> Controller will regress.
>
> The only way to make this possible in two steps is to duplicate
> all of the routes structure arrays for all of the SoCs, which
> would result in a total of around ~1200 lines changed twice, and
> that ignores the big increase in size for this driver during the
> migration process so, in order to avoid useless bloat, I opted
> for an inter-dependency between the two changes: mediatek-drm
> and mtk-mmsys.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 99 ++++++++++++++++++++------
>  drivers/soc/mediatek/mtk-mmsys.h       | 15 ++--
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 ++---
>  3 files changed, 90 insertions(+), 40 deletions(-)
>
[snip]
> +void mtk_mmsys_hw_connect(struct device *dev,
> +                         enum mtk_ddp_comp_type src_type, u8 src_hw_inst=
_id,
> +                         enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst=
_id)
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       int i;
>
> -       for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> -                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask,
> -                                             routes[i].val, NULL);
> +       for (int i =3D 0; i < mmsys->data->num_routes; i++) {
> +               if (src_type !=3D routes[i].from_comp_type ||
> +                   src_hw_inst_id !=3D routes[i].from_comp_inst ||
> +                   dst_type !=3D routes[i].to_comp_type ||
> +                   dst_hw_inst_id !=3D routes[i].to_comp_inst)
> +                       continue;
>
> -       if (mmsys->data->vsync_len)
> -               mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN,=
 GENMASK(31, 0),
> -                                     mmsys->data->vsync_len, NULL);

The refactor drops this vsync_len register write block, leaving MT8188
VDOSYS1 unconfigured.
Is this intentional? Otherwise please mention it in the commit message.

Regards,
Fei

> +               mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].ma=
sk, routes[i].val, NULL);
> +               dev_dbg(dev, "Connected %u-%u to %u-%u\n",
> +                       src_type, src_hw_inst_id, dst_type, dst_hw_inst_i=
d);
> +       }
