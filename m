Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A46222597
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424486; cv=pass; b=iLZqSudn8TBoa0WwmUcR5UmFztluuJDox/+PGYJk+F0ZhgMk6kgVRG7QOHjMcXywDXy5Bz6G3Osu/T1FusqAT9mqF/0F5jf3/iplNrSWTn95TMac/OxT2iE/oX7tPKZw3DUfhKKo7mU75plJy8ZVi1DJlHtyRG1vYuNKVHfPt1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424486; c=relaxed/simple;
	bh=hqstU4KzKDYHzuU5dQ6Scbjj6wb65fKWO7OtTkr8nUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDikRAjBwVDd5DS8AkZRZmIrGG3mgGIn9NI/dhZfJS78cwuW/LyYVUxgw4BtGMlpT+bSQIrpC6QTV08quAzecSNElyMySU+VArKynjPm0uwYlDCt+BNPqd7Dm021i3aP0Dho3XJn2O2ZbYi9bmdXN0VCjH4diIg0cXKTo3q6xbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkttIHHx; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkttIHHx"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6c67361fa3bso2162144137.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781424484; cv=none;
        d=google.com; s=arc-20240605;
        b=dmMhzhar0VJu0NtWoGZII5Xkrf2NCZW4ApLbe3lf0jw2ye+tnnue4O9eAwmeY71FQM
         m+MW782VQOM+zLSp0UCROdHrGi+cjlRo+itdjZb2NQxAV3brx5V0FRfGDHG0LMde0H3y
         CuvPB15wUQeqJ4GhtGJV86dARofN4O8ZAj/zNjrO92zt8wty2P5bReGQBb+QvmEwfyaD
         DxnSGw71IWx3Q6CdJEAV8neGcUSBQ6b1Bmvrzr8gN2xqA/RZnomUg3ruut/3QElabY3S
         PfcO8yB19bLs380Sh/GfS/WbG1ljxU6Xk62ziNs0L86HuXmsbyToanur1qEfjUCO4WPA
         OECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        fh=29SpYOeMYfj28z4Lk/Oh/p7DjM5TbMmdub0cstzLREo=;
        b=WyzNzH+5iAx9+vaiI4jEUiXP22MgqnvKf7wdSh8mNS/EtaTp15pZmUOCJT5Vk0Dwd0
         g+N4GE99Vd1OqSh3qW6betVfLJl/YI4gqfZKhnZw8j66UgBSZTLw0tVMmJlbUreR+8RM
         plCTPS6p97UD9MfGf8Eb07D2nh00KP6ScyVDiTxVwgbgHC8PRcYz1lQFNVJqR4OvJcZp
         wqnUDMY8PzNxXFuAulFTfSp62jH84zW1WuiAg+HuVKUnb1mF3rXIIMw0tzeW19dcToJ2
         1Iiq619HCWVYRXl8jAE1DYNRfmykzPzRt+pKajsBgBbHZVuPNbUhzkMf3pOrKCX7uwPR
         DDug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781424484; x=1782029284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        b=OkttIHHxSMMfh+9HqlHsi22ZgPg4OX6xUneh4E2wEslwg/CUhonfmhPazY7dvtXRPx
         zxJHmqt3VyUbGxS1WcW5LhmbN/gQyGqGwgQz5YppllrU8Do4NW1/PtVpOSm7C1UFYLqF
         gFlij2BADpZ93qE7NuBIyqTJoBjhFqmNbZ2JKQ649L+gpcpwsr2DAw7BrHpn0Y51xKSa
         yLJJ1faCJdehPMZmIt41iRPqDXIA53iM/fcqmIulUBOiKaLgrjYemFQOLyRbyE2a94jI
         ZyNsVclDcFpMQW9dgrDg+SRzxjFDxx0iURqjwgD0ojJC933OR4KyV0F/PU2QJUKU9Sp/
         PJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424484; x=1782029284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        b=WzA9StBaPGFh+bt+22Tpbf1gcWlFln1gdw5c1RnOs2OghTYsRVrqzMbkPMn53Z9Cjk
         r15ReGql3rAjI77LiF5kXa6Jv9B/jb44+go8PxgjaX+znfld/U1q/ni1/irMuoHS+TmP
         Y5RpQuMQpGYztkW+4iDPLaSrqndfB8pmAso8XnLVoRRhzhFEMhhK7hpoVvfz8JQWM/XM
         7FPUD1hZJdQ3kMqapgGka7qcm4TGLxAPfLdydjfU9LcE6szRZCOm4544ei/exENCO7ed
         w9JQbA67lC96HIH3xQD+T77oPXQTqLRgMIJpFphCi5IcRU8SSO3Lek4ozXcZi8+Ovz/5
         lp7w==
X-Forwarded-Encrypted: i=1; AFNElJ8vRtyN4H8HfMkeQ48p/v+zOS2Ef9lvdoUHMFOw2tbK3eNDw6HGR28TyauQ1pA/LIGTmQ3BED+nRpqs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/z3kkN2eDFjC+xNPEyMvzhryWZEiLw4v1HOr6Y1xoeQ91nKq7
	+d+bGt6JyCvNCKfpcuZvD7HbAmxjipB1FtPlO4Mz10F0vJOwG2Y0K04FLvxHNZbupKEEIm7sAbv
	I3fWqedSkb2u4mThXEbgII0cbf0dte6I=
X-Gm-Gg: Acq92OH0hVqRKO/NaASqyDk3p+oXeP3QAXS8zR4Wa+KpRQBVqUB4rgKQLvUcfe392oi
	EOvo1mCgIAfyeNZZInxq/TiQaOGu6RHP2/9jTrKiAX6M7Q1r5BbLxoW5W7UXHBz/wkW4VIX2UZd
	aKX3QOUAMLjkX3inNz2d3CuhOphQ0SKlvFR2BASyF00gBe+lEHQYJhJlfnx6urspnmaFzY6KPuv
	+RQFhNudpiih+76dB4fv+OP6t2dxpj+ymsH5e/onrShE6ru5hBOoazGX7nc7pu9BKteSWnQK6GM
	MHIYHnXT91wvb7FYNo0YOxR70VilVRec8l72ldE=
X-Received: by 2002:a05:6102:3578:b0:6d0:a5a0:ba23 with SMTP id
 ada2fe7eead31-71e64bd44fcmr3173429137.3.1781424484414; Sun, 14 Jun 2026
 01:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4> <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4> <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4> <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com> <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
In-Reply-To: <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 14 Jun 2026 16:06:44 +0800
X-Gm-Features: AVVi8Cc396KgRR5IizLY6o5Eb_6OMt89_a8GwDneaOLTrmVdEvRxrlGjAy8TCxk
Message-ID: <CAH2e8h4nJ=BF3Eq7xPO+ndnOMQoXkGGG0Dc14ECEoGTGg_OSVw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 4:49=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 21:51 +0800=EF=BC=8CPengyu Luo=E5=
=86=99=E9=81=93=EF=BC=9A
> > On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > > > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu=
 Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > > > >
> > > > > > The magnetic keyboard (USB HID) can't be connected somehow,
> > > > > > others
> > > > > > are
> > > > > > fine, such as the spi touchscreen (not upstream yet), which
> > > > > > utilizes
> > > > > > DMA definitely. My config is here
> > > > > > https://pastebin.com/SdjuyJYk
> > > > >
> > > > > Is this a defconfig?
> > > > >
> > > >
> > > > Yes.
> > > >
> > > > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too
> > > > > for
> > > > > exhibiting the problem (because there should be "public" GPI
> > > > > DMA
> > > > > consumers to trigger the stuck/reset).
> > > > >
> > > >
> > > > Is this still necessary? I checked the fedora discussion and your
> > > > GPI
> > > > DMA fix. And GPI DMA is only for the QUP-supported peripherals as
> > > > the
> > > > binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
> > >
> > > The devicetree without this fix seems to be still incorrect,
> > > because
> > > with the device tree fix even if the GPI DMA driver misbehaves the
> > > system won't be stuck (although it will iterate all GPI channels
> > > and
> > > then fail to function at all).
> > >
> >
> > Back to the start. You said some GPI interfaces aren't available to
> > HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick test,
> > and spi6 consumed it, no stuck or reset. Could you give me a
> > unavailable channel?
>
> I think channel 0b10000 of gpi_dma2 could be an example?
>
> It seems that 4 channels are tried on gpi_dma2 before hang on my
> gaokun3, but as gaokun3 has no known serial access, it's possible that
> 0b100000 or 0b1000 is problematic.
>
> (The reason gpi_dma2 is checked first is because it's the GPI DMA
> controller with the smallest address)
>

Sad to say, I cannot test gpi_dma2, only the stylus is under qup2
(spi20) which consumes gpi_dma2, but it is unsupported. So I have
tested gpi_dma0 with BIT(3)/BIT(4)/BIT(5) as you mentioned. No crash.

```
cat /sys/kernel/debug/dmaengine/summary
dma0 (800000.dma-controller): number of channels: 24

dma1 (900000.dma-controller): number of channels: 2
dma1chan0    | 998000.spi:tx
dma1chan1    | 998000.spi:rx

dma2 (a00000.dma-controller): number of channels: 24
```
Best wishes,
Pengyu
