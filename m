Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B73672A5
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401040; cv=pass; b=dhhcjCLcK+gjzesMnnMMigmHtEBLEaR2DttwchOZoyJc+n25luM5oUUBhcwXcVp+CLJzRlJ3Xus4bFrCox5FDI488+TIgp+LOyFcUGkMCDEYJ6gDbqpGD6/fipBDvgpSK6SV8XI0XeU5J5K9iz2P771gcY6GbBORho1ZebsIY18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401040; c=relaxed/simple;
	bh=Ru71+WFlJWFBpbdTm3eIOQ17TUmrQj82u/YmVjINnrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKTM/eMBBa0huQve25uK5K1UpR7vxl+ot2sI84tBrVuhxv4cw2/N9tzVRM/wCvUdX2c5pgPbXHLSCUg8M0w5BERXGUzMTCqKVeLis1w0SKpVs9w2ny4e8lq6XVqM0tDaeaRt54dUrEuhxU3ZHKI5noTgdsqRXY2z5Auh3lUJ/UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zY8XM9Eu; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zY8XM9Eu"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66896892b6cso2374060d50.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785401038; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7j8JKsMqNFy/EOFzJDpy+0SlJZ8Rjvn75I26fCrdxoQHrh8JhlXda78OJC88FGre7
         K0UOKH65i84tgmHP9810CxzdaDWUMU9VQ+0ZFLuP6QS8yQtapPzk8oXkc1Ans5+iwm+n
         AOL4IrStOfCqGLrK+deKV3OaIwVkuDWZPJ0XtOdy/cPSvlwNmK0B3WYfhD4UyPMn7ktD
         qCsP+Zv+4TMWcaK+cov9RcMOJ6Def+91lUQw19y644D5eKSgeM/Wc5Rhmj9S4gj1g103
         WzFbhz6/e1FL+4dz2RgEfiGc79gzAM/hK54dHdFOI8FBvK46iSvjvIeXN+yl2LG02eet
         lXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        fh=vaR5xVEN42DGePcSLYAz2MKaxsOFM8UxFiU+W1v5X3k=;
        b=CLTNBSs9G0P8iA9rVIRy5vb1+IqWjCaj/OXt6Dj3LcezlgOkfT15gO/J961atZg81g
         8jKmCI4tRp+MTNEgZS1r157qcb+IJhUNKpeuhDPdd8t4DYwrDo0c4HUqbVvO+xPPTrjE
         D2uI3pFAcyeKUkx/kWDgVF4zCvF5UUYiLE/TIrrMWoERpAB8bQyTxKnzLAI/aAmr+Us1
         o8cNIsbB8u01vmUKx2p5KOkmq4QPvB1ONBPoguIpx458JHtxqml+fSHEJk6XXV0ipI7I
         s8dquk0IlbGudsGet2FGDrDrY3WZ019YuZK9sr3Tnw0ijoL4jCWHdEIbsKGh2BahllIL
         8mfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785401038; x=1786005838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        b=zY8XM9Eugrq3TJEuk/BPqPktcd6NntdzL7kWQrIjghcAkvBgf6MTwNEdZpUrxCHPDL
         VrZNyl8MMR87mZ8PeRxl44rQNxHuKzBQHHfWyecrMK/jC4xXfWsDNrs1ghOlhcx46exA
         nVo3TESVsr2B6SxNShXVQG/3dDMEab8v4Z5o6nVChpymQ58UceueqdUOSQn4z+qq08cD
         sDz/W3nTAgCDeb6uimw3HTRdpMOAtM45orvsYYi5QM2HUPmvcqZ3VO3B/w4pQKVjBfHw
         esl6R/r8/nCenN8JOfVVK1eSyLs4BqLm8GE7hcJrF3aALfjxcdmEdY2/IGcDX6eCR9Aa
         uZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401038; x=1786005838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        b=AGKOZLgw4HlsxoBTZcZJ1poIi/I0hBaH+qccH0olNdbhl+niGUBIu7yK/NxxykmpvA
         m9+DqlfkRIb/oXhcMwTeVoHCEdzTJufe+djXSFJg9yVD718fuFCUZLQjwK/jMlpvvSv9
         EytbVso5SAcf0rl0TBPL53WSkzJG5V+WO/qj03lntPizMBJpv1bJhwIpDy5hnDJs/kKo
         /lkDFahQNTLsLVIWI0xdLPqytLK/WFV77Jlhx7BWxpBaOFDek9vQiNj/YboDJWbG9Rk4
         /MzQfPoPOd1yn4U8qUz6qcq24YlDt5GjEmDbtzbvAgscsJAqgXY0h9qpH1pfHepqTepq
         rPGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZbg3XcjlvYrvM1tzbGhCJU2jsWYnEjNoM2S1QyVE0UaWFPJLXDIAF0I4b+BBEKPqeVKUs7nTtfHpL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6md6j2a7oVIuh3J4jPH+qRFVZXV5kCQYC++WMMpf5H442u5P
	Qp4nLey6oFOIg7XOzMjgVPUv6Tk2nj02nJRhy6ph4oQesISQtVVz9rqOBVMDCDstTI3PxO3lY+r
	eQKJgwhUsZLa5+qqQglzp5gmwIZ50fR5gwNbzYVMk+A==
X-Gm-Gg: AR+sD10BkrdVbjrr71okuCmh00C6F6WEGErKqHfTgjxYlnYCG19AtcNOGQHdUvu7Csf
	nD8UDig7iOLyHfKMP0SEOKxJPTBg0p+Af814BmyAfwnIKBaxwS1n9zFkdI8GvdG1Jl5n7DGUopK
	P71sSGaPGRWSdhB/EMkzLAPnv4JVoqQyXETFmTj/G7/temVx84xKw7Gor9T3ALYk556OHHiCD1w
	SyxQ93TO3D0GOfZQXCowBhedkGmqWxGp+JkHstGMsG9Wrg84seo0IVEbNlnlWgBfHmEv0GoL/MU
	viKFbs5hDCD0zBkhNpCWriCFsv9une3OZcuvqyuNaJRwd7QO
X-Received: by 2002:a05:690e:e83:b0:668:15d6:8fd9 with SMTP id
 956f58d0204a3-6692f4a9ed7mr1128538d50.24.1785401037357; Thu, 30 Jul 2026
 01:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org> <20260727082018.2E7221F000E9@smtp.kernel.org>
In-Reply-To: <20260727082018.2E7221F000E9@smtp.kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 Jul 2026 16:43:45 +0800
X-Gm-Features: AUfX_mzmu9T7jWwyxv5TKXdZNOp5IckU0GRtjEnl3MBaxtLZhEgB4Ber3zbb-JE
Message-ID: <CABymUCN9Dft18JZW9NtP_pu_UxEWWpdr-cLhgAN=_3f4AY8A7Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8827=E6=97=A5=E5=91=
=A8=E4=B8=80 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 8 potential issu=
e(s) to consider:
> - [High] A copy-paste error in the BOE panel initialization sequence dupl=
icates command bytes, corrupting the DSI payload.
> - [High] Concurrent non-atomic read-modify-write operations on DSI `mode_=
flags` can corrupt the transmission mode state.
> - [High] Missing IS_ERR() check on the return value of devm_drm_panel_all=
oc() leads to an immediate dereference of an error pointer.
> - [High] The backlight sysfs interface is exposed to userspace before the=
 DSI device is fully configured and attached.
> - [Medium] The macros LE16_BYTE0/1 and BE16_BYTE0/1 use endianness conver=
sion functions before bitwise masking, causing incorrect byte order on Big =
Endian architectures.
> - [Medium] Returning PTR_ERR() on a valid pointer when the GPIO array siz=
e is incorrect leaks a kernel heap address and produces a positive error co=
de.
> - [Medium] The backlight update_status callback blindly sends DCS command=
s without checking the panel's power state.
> - [Low] An early return in the panel disable path on DSI command failure =
skips disabling the backlight.
> --
>
> --- Patch [6]: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 =
DSI panel ---
> commit 89f5e4df3241a9188e302ee5028a24a7b0bc9542
> Author: Jun Nie <jun.nie@linaro.org>
> Subject: drm/panel: Add driver for Synaptics R63455 DSI panel
>
> This commit adds support for the Synaptics R63455 DSI panel used in virtu=
al
> reality devices. It exposes a dual-panel configuration as a single logica=
l
> panel to the DRM framework.
>
> > --- a/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> > +++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> [ ... ]
> > +/*
> > + * Extract the low byte and high byte of the 16bit number converted
> > + * to the cpu endianness.
> > + */
> > +#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
> > +#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)
> > +#define BE16_BYTE0(val) (be16_to_cpu(val) & 0xff)
> > +#define BE16_BYTE1(val) ((be16_to_cpu(val) >> 8) & 0xff)
>
> [Severity: Medium]
> Will this generate the correct byte order on Big Endian architectures?
>
> Since be16_to_cpu is a no-op on Big Endian systems, applying the bitwise
> shift and mask afterward will extract the bytes in Little Endian order
> rather than Big Endian. This will cause the panel initialization sequence=
 to
> receive payload bytes in reversed order.
>
> Could we directly shift and mask without the endian conversion macros to
> safely serialize CPU-native integers across all architectures?

From Neil:
No we extract the low byte and high byte of the 16bit number converted
to the cpu endianness,
so it's the right code here.

>
> [ ... ]
> > +static int r63455_panel_on_boe_vs026c4m_n52_26000(struct drm_panel *pa=
nel)
> > +{
> [ ... ]
> > +     r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> > +                          0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > +                          0xf, 0xb2,
> > +                          0xf, 0xb2, 0x00, 0x64);
>
> [Severity: High]
> Does this sequence intentionally send the 0xf, 0xb2 bytes twice for the B=
OE
> panel initialization?
>
> This looks like it could be a copy-paste error that sends 14 bytes instea=
d
> of the expected 12 bytes. Could this transmit malformed configuration dat=
a
> to the display controller and cause initialization failures?

Yes, the sequence is send twice intentionally. As there are 2 panel control=
lers
as 1 logic panel in DRM high level system.
>
> [ ... ]
> > +static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightnes=
s,
> > +                               u16 pulse_offset_rows)
> > +{
> [ ... ]
> > +     ctx->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +     ctx->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> [Severity: High]
> Are these bitwise operations on mode_flags safe from race conditions?
>
> Since r63455_set_brightness executes under the backlight sysfs lock, it c=
an
> run concurrently with DRM atomic commit handlers like r63455_enable or
> r63455_disable which use independent locks.
>
> Could a concurrent read-modify-write here corrupt the transmission mode s=
tate,
> such as unintentionally dropping the MIPI_DSI_MODE_VIDEO flag?

It's very improbable this happens, panel cmds and backlight are called
at very different times.
>
> [ ... ]
> > +static int r63455_disable(struct drm_panel *panel)
> > +{
> [ ... ]
> > +     r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 200);
> > +
> > +     if (dsi_ctx.accum_err)
> > +             return dsi_ctx.accum_err;
> > +
> > +     /* required by hardware to be after MIPI_DCS_ENTER_SLEEP_MODE */
> > +     return backlight_disable(ctx->backlight);
>
> [Severity: Low]
> Does returning early here leave the backlight subsystem in an active stat=
e?
>
> If the DSI ENTER_SLEEP_MODE sequence fails, the driver skips calling
> backlight_disable. While the physical regulators are disabled later in
> r63455_unprepare, could this leave the backlight framework out of sync?

Technically yes, but practically it is an unrecoverable hardware state. So =
it is
a low risk issue and can be ignored.

>
> [ ... ]
> > +static int r63455_bl_update_status(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     struct r63455_ctx *r63455_ctx =3D mipi_dsi_get_drvdata(dsi);
> > +
> > +     return r63455_set_brightness(r63455_ctx, bl->props.brightness,
> > +                                  bl->props.pulse_offset_rows);
> > +}
>
> [Severity: Medium]
> Does this function need to verify the panel power state before sending DC=
S
> commands?
>
> Userspace can modify the brightness via sysfs while the DRM display is
> disabled. If this occurs, it might trigger MIPI DSI transmissions to a
> powered-off panel or unclocked DSI host.
>
> Could this lead to hardware lockups or DSI timeouts?

Yes, I will add below logic in next version.

+++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
@@ -456,6 +456,9 @@ static int r63455_bl_update_status(struct
backlight_device *bl)
        struct mipi_dsi_device *dsi =3D bl_get_data(bl);
        struct r63455_ctx *r63455_ctx =3D mipi_dsi_get_drvdata(dsi);

+       if (!r63455_ctx->panel.enabled)
+               return 0;
+

>
> [ ... ]
> > +static int r63455_panel_add(struct r63455_ctx *ctx)
> > +{
> [ ... ]
> > +     ctx->reset_gpios =3D devm_gpiod_get_array(dev, "reset", GPIOD_OUT=
_LOW);
> > +     if (IS_ERR(ctx->reset_gpios) || ctx->reset_gpios->ndescs !=3D 2)
> > +             return PTR_ERR(ctx->reset_gpios);
>
> [Severity: Medium]
> If the GPIO array has a count other than 2, will this return a positive v=
alue
> derived from a valid heap pointer?
>
> When devm_gpiod_get_array succeeds but returns an unexpected number of
> descriptors, ctx->reset_gpios is a valid pointer rather than an error poi=
nter.
>
> Could we return an explicit error code like -EINVAL here instead of leaki=
ng
> the pointer address through PTR_ERR?

Right, -EINVAL is proper value to return.
>
> [ ... ]
> > +static int r63455_probe(struct mipi_dsi_device *dsi)
> > +{
> [ ... ]
> > +     ctx =3D devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), panel,
> > +                                &r63455_drm_funcs, DRM_MODE_CONNECTOR_=
DSI);
> > +
> > +     ctx->dsi_init_seq =3D of_device_get_match_data(dev);
>
> [Severity: High]
> Should we check the return value of devm_drm_panel_alloc for an error poi=
nter?
>
> If memory allocation fails during driver probe, devm_drm_panel_alloc retu=
rns
> ERR_PTR(-ENOMEM). Dereferencing ctx on the very next line to assign
> dsi_init_seq will result in a kernel panic.
>
Right, a check shall be added in next version.

> [ ... ]
> > +     ret =3D r63455_panel_add(ctx);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(dev, "failed to add panel %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             dsi_dev =3D ctx->dsi[i];
> > +             dsi_dev->lanes =3D 3;
> > +             dsi_dev->format =3D MIPI_DSI_FMT_RGB888;
> > +             dsi_dev->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MO=
DE_LPM |
> > +                     MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +             ret =3D devm_mipi_dsi_attach(dev, dsi_dev);
>
> [Severity: High]
> Is it safe to register the backlight device before the DSI host is config=
ured
> and attached?
>
> Calling r63455_panel_add exposes the backlight sysfs interface to userspa=
ce.
> However, the lanes, format, mode_flags, and devm_mipi_dsi_attach are not
> set up until the loop that follows.
>
> If a udev rule writes to the brightness node during this window, could it
> trigger DSI transmissions on an unattached device and lock up the host?

It is OK per Neil's answer.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7=
-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D6
