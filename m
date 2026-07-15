Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11063CF204
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784159163; cv=pass; b=bzq1DcrOXMQZ4Tuj+YM5uwH3WcML1O+/ZdE274GDf0dOAY0SVQEQC6eIEGg/AZRNWlbvFYsNyODhLp3Nrk9BFuhvXT8dMI+3ZSmD3YTLnG9ZbuGytGat0mMv9qCNvTeGlDZHppI5JnjZz+o9QeDD8aQQtR5hKu2u6VOZsL4Q4DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784159163; c=relaxed/simple;
	bh=q3mSGuk1T0a5S7+ZIg0LGEQscYiwEWehrfnAcVSEgTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rg/p/kFeu2sH19epHPjIqNf4urDERHCexRoFR2yS2+/2g+6HItkZL0klGMGLig5EtCo+/qUpCifK+J7po2KdNR4lYzdhY6uvYwvm4UrVcJB91L1Qd7erJqJ0cAfrxBP6ca/9CuUI2Fkl99Lg2bgfwV+7/xfSGeREtjGIe33VVf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO3Jrs9A; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO3Jrs9A"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81bffd7daa7so6218917b3.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 16:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784159161; cv=none;
        d=google.com; s=arc-20260327;
        b=GKcJQjs9Y8U74NAVf1x09Gi13R+cbmE1iU3XrlUbWi8DXMlB58pNNusNtFgr9H4AIg
         uz2mdKpVfla0+//Fvpax5vxv4sd/kcFYgprpRIsW+bPPZ2qnJo8JR2jVzdZ+YeGVGENP
         LF20xYbFpeRDQbpddX3bKya4f4ngQIPnIRwJFqjOK63PatdJljdbc7HRnRgrzXZtfteO
         Z8s6oXKt8p6IgfYgxfFIoebCyQZTJMDE6W8y1Iu4P1oPWTxFapgB+qxOPS8o6P85hZjn
         VC2SArqraAqT3Sk+UFqPqmRQ3t8L7vLTne65oKn7j2alorjcXTA7dKSHrZg4RjRdFSF9
         Zi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtcj7bjUvx/7zEMgJ28XClKqpTHr1Cc9dk8ktxaKnI0=;
        fh=ZGn9rCv1HMs39EsduWFfzaKFASQj1zEeLBzBP2EmzpU=;
        b=c+xZQtPE3e0gV2MfNUEQTASan96pTLrDA6kUnuF8tpdsiKX9M5+aqzdhu5485e9jcs
         v6oiqI6z0i24+GIGzykHpGW2QcUj2oGaqKC50PBRkhxLHuJO+ihUdz1lsBv11MM9Pi3d
         d3Ar3CZtSjX9sFVMICm91a/FmN5MnK3snqVUhCTD5DxdodEmoFivk88vagWauzoEOsmp
         IT9PrJgvQudBgSbGguT3ovFxCk5tanNIh9g3Mx5Eqb70p9Fo+Mo7FHVdMquLCLjl2nMc
         TZ49tRC89y+YX0FHpqT4xkyk1eh9A4HU6cwgQrjFo5EpbqyejIgaIW1sJONbTvMXUwcr
         mBQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784159161; x=1784763961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qtcj7bjUvx/7zEMgJ28XClKqpTHr1Cc9dk8ktxaKnI0=;
        b=jO3Jrs9AEtlnC8IgbAlcwgz2urRL3EypW0tcRb1aLnMa/cxmbl4gATAqKnUs6hI4bM
         WjKviayoJ1Ox3Q6K0PnrdL227rtJN5xMiCCX33eO/dSOLu6YjXfTzwD3nzTcsJnXGue1
         brmqxgZZOtgsZDbnXvAAe8eFnBuUer+xaY+At6SW/7FaB2+8wJ8lOyDjscKD/2J4WCpd
         FCRb8F1wGfO/8pK7dJw1ozdXSPRKZaKQrgyOrft8ElErNnTwvWYDX0uM6WVOeb/dKhFC
         gw1pguiase6bUhdsgypNTyNpK/DYQ0UGbktuD37QKW+hdJX8SRvcTIW5bEQtp1fuYhFd
         XvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784159161; x=1784763961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtcj7bjUvx/7zEMgJ28XClKqpTHr1Cc9dk8ktxaKnI0=;
        b=ieCx+/q2ZIInFGX4Ynp3s4TF9Mm9jH4ATriJJYqftBXAjxLbC0Uw61j6uWUFPqEF+B
         thQXU1J4pR/mx4uF/yZai8znm+ytRhu5uOhAdTeU1CAu6TMTmnHafyhmGwNcS22THhMY
         XAG4vabuN2I2AOj215CIMpe2v/0lY6vkPrCIdTGHWQFEH5gfB8fyssUrpo5wSsXrPpYE
         GyxldYjO7d77L/xMS3K80A5XylzX21qEoJ8IoviNWbN3SthuyX3481HuYwqMaRC4z5Gh
         hi3VB7OosBs6j2TWuTN4uwXucbF7CDuKy68el8K87doCVcO3OzocYl8dHFJHNI17ABrF
         emiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWGUAywT3ezoCe+hOmQTzgf7X3mzouyWDaru2KGBNEzoBbSpc9MdgzG3UQ2DRcYC7T/gp6jk5k4IIP@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlAAMlNssa9ShU34ETrR9RiSt3lFNIaoq3QggThP5tnt+fw2C
	pkblHlBAVRiWazRlfgAcJ+LrdGpTlW4PxhFnbDbWle2/VoI2hRN9YkFu7DhgE1G8xTkx+rBDvvP
	7wYiPFLATaP3P+hCAlXtBbs2lU+UNh1g=
X-Gm-Gg: AfdE7ckm37uyT0ZywLfdj8LCoddraPaQDtMcCubY0WpvZpUL4MTO1/UL+LTccP7R0h0
	+2RBFKDSXeFyGwJtx98LzQRcsPxRDN5bZWYIwYlvBgvwEkJFAr5csWlbmXSDFTbvcpab75VHq6j
	yr3/Bayhnmrg2I6at0PueQpkhL1AilkfYRVycSl33vP06h9VZiO3tVLHx3/xwmR5RtzR/hZ9EPe
	6cf/bB65PuR/WcDdgo7phXctPKYVsNVWaqThjmHIo0UsiS0ySkR6oMBgH2KZshWqXxrz4hFrOst
	yWuviknXGkd/aMCGLQ5Uzcz9js3ZHQ==
X-Received: by 2002:a05:690e:438c:b0:664:ae6a:f0c with SMTP id
 956f58d0204a3-667d7cdbfc5mr8414066d50.9.1784159160589; Wed, 15 Jul 2026
 16:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715200834.8486-1-royalnet026@gmail.com> <20260715200834.8486-3-royalnet026@gmail.com>
 <20260715202215.1F6C21F000E9@smtp.kernel.org>
In-Reply-To: <20260715202215.1F6C21F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Thu, 16 Jul 2026 01:45:49 +0200
X-Gm-Features: AUfX_mwqe7gBAVGpG7oJ_d6k_0qQRljfaCttF5nLeBDdypAJn-V9qW1YLtuzmp0
Message-ID: <CAEWPSH7hEuOkhmv4WFgvU8ba5MW44vy9fFT=kYhCV4aLy9m-fA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-media@vger.kernel.org, 
	kernel@collabora.com, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this code incorrectly parse the ACR N and CTS values?

No -- but the variable naming makes it look like it does, so this is
worth cleaning up. The packet decoder stores the ACR subpacket bytes
with packet byte 0 in register bits [7:0], so the byte swap is what
lines the bytes up for extraction: CTS is packet bytes 1-3 (register
PKTDEC_ACR_PB3_0) and N is packet bytes 4-6 (PKTDEC_ACR_PB7_4), and
the masks then take exactly the 20-bit fields. The two locals are
named after the wrong registers (inherited from the vendor driver),
which is confusing but has no functional effect.

The path is also validated on hardware: with a 44.1 kHz source the
card reports 44.1 kHz rather than falling back to the 48 kHz default,
and sample rate switches are followed -- neither would work if the
parsing were broken. I'll rename the locals and add a comment about
the byte packing in the next revision.

> Could this dummy callback simply be removed to allow the core to
> map the reg property to the correct DAI ID naturally?

The #sound-dai-cells path is not affected -- there the DAI index
comes from the phandle cell, so <&hdmirx 1> still reaches the S/PDIF
DAI and gets the intended -EOPNOTSUPP. But you're right that the stub
is unnecessary and would wrongly force DAI 0 for an OF-graph card, so
I'll drop it in the next revision.

Igor

On Wed, Jul 15, 2026 at 10:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Severe logical and mathematical errors in Audio Clock Regenerati=
on (ACR) N and CTS parsing, leading to hardware clock recovery failure.
> - [High] Dummy `hdmirx_audio_get_dai_id` callback unconditionally returns=
 0, breaking S/PDIF DAI OF graph mapping.
> --
>
> --- Patch [2]: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio cap=
ture support ---
> commit c4b60dd6e2a0b110adfab2b5a2ccf3d214ed0d05
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> media: synopsys: hdmirx: add HDMI audio capture support
>
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller, so that a
> simple-audio-card in the device tree can bind the HDMI RX audio DAI.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 25f8ca0d6d946..acabd43664c10 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > @@ -2646,6 +2662,255 @@ static int hdmirx_register_cec(struct snps_hdmi=
rx_dev *hdmirx_dev,
>
> [ ... ]
>
> > +/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS cl=
ock. */
> > +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> > +{
> > +     u64 tmds_clk, fs_audio =3D 0;
> > +     u32 acr_cts, acr_n, tmdsqpclk_freq;
> > +     u32 acr_pb7_4, acr_pb3_0;
> > +
> > +     tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> > +     hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> > +     acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> > +     acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> > +     acr_cts =3D be32_to_cpu((__force __be32)acr_pb7_4) & 0xfffff;
> > +     acr_n =3D (be32_to_cpu((__force __be32)acr_pb3_0) & 0x0fffff00) >=
> 8;
>
> [Severity: High]
> Does this code incorrectly parse the ACR N and CTS values?
>
> The variables acr_pb7_4 and acr_pb3_0 are assigned the swapped register
> contents (PKTDEC_ACR_PB3_0 is assigned to acr_pb7_4, and vice versa).
>
> Additionally, applying be32_to_cpu() to the native-endian result of
> hdmirx_readl() will cause big-endian byte-swapping on little-endian
> architectures. Because of the swapped assignment and byte reversal, the
> bitwise shift operations extract completely incorrect bytes.
>
> Will this cause hardware clock regeneration to fail and silently fall bac=
k
> to the ALSA default sample rate (48kHz)?
>
> > +     tmds_clk =3D tmdsqpclk_freq * 4 * 1000U;
> > +     if (acr_cts !=3D 0) {
> > +             fs_audio =3D div_u64((tmds_clk * acr_n), acr_cts);
> > +             fs_audio /=3D 128;
> > +             fs_audio =3D hdmirx_audio_closest_fs(fs_audio);
> > +     }
> > +     return (u32)fs_audio;
> > +}
>
> [ ... ]
>
> > +static int hdmirx_audio_get_dai_id(struct snd_soc_component *component=
,
> > +                                struct device_node *endpoint,
> > +                                void *data)
> > +{
> > +     return 0;
> > +}
>
> [Severity: High]
> Does this dummy callback break the S/PDIF DAI OF graph mapping?
>
> The driver registers two audio DAIs (0 for I2S, 1 for S/PDIF) to match th=
e
> DT binding. However, this callback unconditionally returns 0, which overr=
ides
> the standard DAI index parsing in the ASoC core.
>
> Consequently, any DT endpoint requesting S/PDIF (reg =3D <1>) will be
> incorrectly forced to map to DAI 0 (I2S). This bypasses the intended
> -EOPNOTSUPP rejection in hdmirx_audio_hw_params() and erroneously configu=
res
> the hardware for I2S when S/PDIF was requested.
>
> Could this dummy callback simply be removed to allow the core to map the =
reg
> property to the correct DAI ID naturally?
>
> > +
> > +static const struct hdmi_codec_ops hdmirx_audio_codec_ops =3D {
> > +     .hw_params =3D hdmirx_audio_hw_params,
> > +     .audio_shutdown =3D hdmirx_audio_shutdown,
> > +     .get_dai_id =3D hdmirx_audio_get_dai_id,
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715200834.84=
86-1-royalnet026@gmail.com?part=3D2
