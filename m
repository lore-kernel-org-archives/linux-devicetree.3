Received: from mail-dy2-f32.google.com (mail-dy2-f32.google.com [74.125.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339982D5408
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227834; cv=pass; b=Ho22doJDHemIvzT8UsbzCjeyMozP7EVphn2/Uw93gchI5y7jxFeKBAHqmkIhvICERrgKwknvyntK6aW9N6uebfIOmi0mtjbbGyNrAMOp+xK21qDiXXQV/svo2H35STS/YpKLjsF940U1i0yP0tfHG3RAu/+JE6L2asha532xvzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227834; c=relaxed/simple;
	bh=Y6lfdMzfxBrctx+JVGwRqRWinjsXPeJStQCGnizzDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/q5L5bve24uvQKadb578W7ge9OxZaWveWP46WRrbO3iy8UChEUgSLIxKjEyrlq6TjvrIMtc5o2eSz46P4grkgBSygVAtWEKDuKyKgoHBkjbuER1QrXLfo1zRAHITeOZ8inPeA+gjT1kH4b9RvmSeWjq2NimXcM6efeUhM8D0TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cqKZ32fz; arc=pass smtp.client-ip=74.125.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cqKZ32fz"
Received: by mail-dy2-f32.google.com with SMTP id 5a478bee46e88-33b9e805130so1268526eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227832; cv=none;
        d=google.com; s=arc-20260327;
        b=oLRtJ0Mhls/ReEzJEp6elj/RS51UVTNExcrk4Zm1hCAw6DYaETqkjZp4j5RBLkD+Ht
         f+x6un00Dw3bWurkwVmQorR6Zn569QhgKFVeCTUGiBFAa8MHcoaYNDqULOYHPq9KkaKZ
         Hxw5drklVXv2uSL9q1hr7aKTuvLfKNrXnalBecrjv9drI5oNDa2wu1M+FXGZunqxeNAT
         hjSftNiMiDVlg+M0mchIPI7DJNtdhxMdOBNPWGpufJyhnNjBlCd2YZL+CWICTlrnskQU
         8yFTXRZbGqC50k8mOmg/idE0YKr7Byce+YYPNIVp4dD8KghVeBrzaG/m6wiG8Saem4uv
         y8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        fh=JoFdvdMjv3FxYr3Qvjmvuw9KkMbe2IpU5SwqRA6pKiE=;
        b=hFy9O5ueVewPjXNinl9kVmcbz/yp54IG8M3b1PjxoFBr7EUYTTMKcGiteTdvxpkkJE
         N4gst+Q1/GkAFFtlTHo29H/MTejVFGwfbejMbvykReYhXGxdz660UbwaPA9Zu6ifGIQc
         fbI0hjRimFw5Kx2TmhorE5kChPTu+VbpEd3S31pfgoZqD6/XJfYOjgCmvsqahlRAz0KG
         IVCN6eY7ZoNa3HSAXvD/hJESNfT2eHGan+ebfcMxRhjM9wZIUXDpbmODQ5eHlSLYtMt0
         Pf8zgrAnLfmY0ILf3kFZEdRA0OOfClvDTq05Hy3hqffpm09wouzCUx31/ZIa/ZA/WQqF
         qDBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790227832; x=1790832632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=cqKZ32fzb5+rZNhbvs7BqlbuV+ArnWdl9kU55DykaD4nll5Buwuz2CK1Kpaat0oT4o
         wTF9q0wqkPThmEA3GMsQDdE+ad7P1tAnOssIn22LjC5AtTxG8uvRUi47ztDsDjZ56jqL
         xEUi0M38EotP/ond7iJ4B6hM7WjsDrGK4nO1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227832; x=1790832632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/rW7+9DYBHHx7/UU3/p+sXhhnDN4m/dqMHLzOkRYuw=;
        b=RtkcAkyc6ylvwRlieFKbw8Zl1IVpyqWR/V0ZJLOfvX4afaHktTucBpLrYErm1SPeMD
         UgF0QeaXJOMOcId4Frgp1Fm/xkAQMStJ1FTg7ifsTCiU67CSgHKAvF1dpsggquqUq4rQ
         yCpTrWYeRtx6Q5xWMzhsR0jmidUznmsqz6FBwMqh6CgiXH2W75jh/ej8rKYy4C6F+e5L
         3kgKr7ToLtlehorPE4hnA8v6ljj3LL6tDTOPQKBFiTQpr9CcRMwOTNu0s4n1fpFCVCWo
         RMQNFDLraHI5hPEMUsxbzJDLE6tcrQoy8LWXeywYeT1/JtIbWsyBeQtAcvDSjGUg1Z3P
         naAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkq29XXwxQ2aIrB5lIVLRW3VJpFUYmDzqWu+T+h6O/UgoCKCRKOU34vhZWUcVRpo11EtKX9qn9b071@vger.kernel.org
X-Gm-Message-State: AFuF++lCawz9QX4zBJFCcohcWe9GIRzaXyvlAICsHZT4reRNFKt+PEdA
	FaDW+7mk+hpvtxAOfQ2wNZyj+4KKofAVlNBNXPOO4PvQurUYudKwZmW5K51hew95yk9g5anNy8T
	dffPLntTkOAJFO2CFeoTzJQwTpAc2KexmlklOTzfUiMf0D1PR7na1fbVffg==
X-Gm-Gg: AYBFou3lkISfrANtAItffE97rmogZVQKC+DYaFEDpdF10Lktj8OkOw2QMgLxpzcc9hf
	eO1D7TBm335wTCJSQ9aSlg1EWB/WcbikVotqtk/xOyPkFUcThm2we8En2Gy/XhFxz5t91a0llcx
	CVvcraZEicyu0udE7Y91Yk9hknLDAaa8xy1xu6ZOx3I4Swz4O4wuglsOnrKfJGOOCCeo0wTg2fU
	l0pXog/PlklnIHgblO1ihfTV8mH/yD2y1g/22g2EoSd5xxd8DZFBR7TDmCpGU43+HFSnG59ax/Z
	4TP1LIvdu7FU9GERCFcIWX01Yzne0Fr4SPFyF+dF0Z9aS4WR/bZd7a+7XwlkrKd5SVCKlcOHLRo
	eCRJQ2ZF40g==
X-Received: by 2002:a05:7300:8d14:b0:33b:e264:362a with SMTP id
 5a478bee46e88-34004a89a19mr1123625eec.13.1790227832039; Wed, 23 Sep 2026
 22:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com> <arQxC3DmDyVIGdqq@collins>
In-Reply-To: <arQxC3DmDyVIGdqq@collins>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 24 Sep 2026 07:30:20 +0200
X-Gm-Features: AclHuK9fIcxWA7Sv69t_uK1zMqbihMAU90hONvsInRjWG6YY9lFMwau8XYvA7qg
Message-ID: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul


On Wed, Sep 23, 2026 at 10:05=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Michael,
>
> Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> > I tested on px30 and achieved working H.264 encoding with some small ch=
anges
>
> That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
> (using a modified register layout) while this driver is for the
> Hantro VC8000E, which is a newer generation with very different registers=
.
>
> Maybe you ended up using CPU-based decoding when testing?

Using
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

I have added your patch to gstreamer

v4l2codecs: add the stateless H.264 and VP8 encoder elements

Backport of the encoder work from the branch v4l2codecs/h264enc of
https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
uses.

Generate the right element and encode stream:

gst-launch-1.0 videotestsrc num-buffers=3D100 !
video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
matroskamux ! filesink location=3D/tmp/t2.mkv

And playback over Wayland.

Solve some problem. I have implemented:

const struct hantro_variant px30_vpu_variant =3D {
        .enc_offset =3D 0x0,
        .enc_fmts =3D rockchip_vpu_enc_fmts,
        .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
        .dec_offset =3D 0x400,
        .dec_fmts =3D rockchip_vdpu2_dec_fmts,
        .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
        .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
                 HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
                 HANTRO_H264_DECODER,
        .codec_ops =3D px30_vpu_codec_ops,
        .irqs =3D rockchip_vpu2_irqs,
        .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
        .init =3D rk3036_vpu_hw_init,
        .clk_names =3D rockchip_vpu_clk_names,
        .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
};

I have advertised the:

       {
                .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
                .codec_mode =3D HANTRO_MODE_H264_ENC,
                .max_depth =3D 2,
                .header_size =3D H264_ENC_HEADER_SIZE,
                .frmsize =3D {
                        .min_width =3D FMT_MIN_WIDTH,
                        .max_width =3D FMT_FHD_WIDTH,
                        .step_width =3D MB_DIM,
                        .min_height =3D FMT_MIN_HEIGHT,
                        .max_height =3D FMT_FHD_HEIGHT,
                        .step_height =3D MB_DIM,
                },
        },

Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

I have a small change only in the common part. Hope that it's a bit clear.

Michael
