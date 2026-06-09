Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143F3AEF47
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022535; cv=pass; b=QuGE8EYv/aPGzAFmZ4MgkbJnlfteIysfKiiAdExLSLlWbV9x9mBrzKLXM2lb8V1voS4K+8/O3OlBaxQ6yfp3fF6wDZbeIyDseAf4CUb/zWrOJHVdZ/zcX/x1MsVrDOoCj4Tf8oWGUK5KlKUNnVzRd5xB3YHtDePUh8ywjw2Nbdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022535; c=relaxed/simple;
	bh=H83i8Cb+cpZkV/IEBmS/QlZKHgw/PIb9DZ6YI97XEFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5CYC++vKLavMdsuCQWndALe9YcRMV3mfrCfY4nSpx90Ok67LUS+Ffu29EpozARun4FJvIetVrg9id5Re6x/9IWXNXdvGAXfrBJe5+SZiwT1yVL16sVO9U8f2ifswpWPxCVTqeIN4MpDMAyZ4TyfT3KFCLgxCriviOsSjuy+490=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KadJilbx; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KadJilbx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2983003f8f.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022533; cv=none;
        d=google.com; s=arc-20240605;
        b=Nk0uq5t6jCDxQedbAJU6xxhA+XvZf1h1j3ybEgpWDH6rGxNL6julQTgnK2qhXBncBb
         z+yje3P0SQ7WXhUUwDWPBi3eokHU2OOl1ZSNT7l7hqQ5yDFWSVUI7VPyKky91jTNyMrs
         AmHSXmro5BMfm0PngBaoeCf8sgiA0zFD81Nqnu6Azi/DfppSXPotS+RaQRSR+erLlrk/
         b7wqOyCQAP5SYte+S42ksiMBqoa17T8QszmTT2sNhkneFVmOI6hJFlI1nQ+83N/nZVrk
         wF3676DDsX7+VWHpG7Npj41SFZZ5o02G8dw7/HjGR+rMLqhayQktMXjLrgSVXueOdxLP
         pKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        fh=+NKecnUFglTk64TYUDP7rIsF11cyiXGnJhQ0GUjwiUM=;
        b=DWEiv6cs7wx3fcdQ3yKoQUq8JiLM9R6krIXlaAE7tWqXki8x7Q3LHrqj0cJqc13x/T
         L/TNcH/WHZOxtJt5Vrx0vrLKrfYUoH6JCK9104EdAat6G8dDJ8ZalYBo5k9JkDfDHrUZ
         snxU6cbam+wuazkX6Xn+sJfVd99X52fOpvBFmcjG0wyTvO8u8w4l8OC7BXfad5nrIarb
         VILM+mQ9e0joF0YLj5uwG8oKu/zc6MI6PZmd8aK0imsoi8+2bFwzqEDIjNEqkolGNjAD
         Cm2hW0Jxc0akIDGCyZ3hA3A25sqcFQ2YGfu6oT75ii/RdGvKYBxYS50ZjSNhfK1pHsoR
         20JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022533; x=1781627333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=KadJilbx1aKNqhtjc4c4+KTRdxo/d7Sn8Y7E4FVOqkhAc+G/UHFFNpXQuFII3qQJRW
         LLJg0WRDZNmTvk0EKayKaULt/ueWDRMyYq8HeG+d5aNq3KHvQYdyHKuYGAWI0sb1X4Y2
         vJxEMJSnlDgFhksIK1JNpIWchzfR1uZafoL+BqihuzbclUGmCq4tEPvaV6ErjsSHReQ4
         Aybh9gGxSC6xsTtjYGxetdsjS4jx7Rwo1H1tWpV5CWycgJtboEA9WfTWcRw/uQQ9+G/k
         0uqMPQyNeDcvadPyEaMQNfNY88DvFjQs/1XMMPfaSJghtF3terY5YFDOSW+GHWoZuE8m
         Te/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022533; x=1781627333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=HdkdZxNaGZtG23fup5GH/UDxJDHWpbt9cbBi8kyHdYXQ/e3MMmVb2tIZx68C8TzdD7
         Q5KsoIvtqgQHGz7WOMBIUUaK2d/rv3iyQ+Kjdzj8QE9e3wCRpdXYRrjl6wZ6sRIBAnzO
         /3sryhXyHrN7a1qC+jMLpndJGNCZDkZGaN5UQpRXjLwhsh+Y7uC7DOwmgrR7dTXWkd0d
         V5BP9NOQFwAx5mSwJOwscz/KbsoJ1mLTEN0kArbFqyWuvm0qJnONRUV7ry0aY49SuuEH
         EvKku5uztQR8WTF4MeauINEZvmcoU/gEjGCzDSNas+Me7eymqAaJG6QIbTYXY8+ccqVD
         Vhrw==
X-Forwarded-Encrypted: i=1; AFNElJ8p1I5Sx0aMB/zSMl+nCDDsMERJ9KU8lQZSTkHVTLRc5SqZVD30GLJxqZ73GQsbsr+PIO5zYRiprdEj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dE+0suK7AVAmDtIeVOuztA1l0HISSkPGdhlc9p2S8cP9YHqM
	IkPyUdne7K0Y9NmszF0mLCtnxHbOvHPsj8bINfX9MYn6hpLLhUKJcut8pu8YdDofIzliF4zUFNx
	e5w3QEfVparrzDwEwOrvBNoQ9oc1tQzI=
X-Gm-Gg: Acq92OH2brNbWIjDQ4JkddI/A0hxmbSJm427rEG7I4f0Ek3F/1hehpKsvD9YfcGbTKH
	USbZW8Lz4H7tdLSCVoqPCVinibBl17ydtxvAA5WRTrl4d5JQ2mGkTJ0ZsAqINueIe5mLy08wspZ
	2oGXfxTJHnkpIMUlATc9HotDnloaahuW6tsEvQQP+BE/3rqWCssUz1pFMHYXjD0Ar207o/t5Csu
	jZQzhFyW1jwzVXfKHaGnBPeTY4nZAoA5YOQkyHjyVqQIZIKsr19NsxES1bMRwcpSu4KmqiyUTAG
	otgHLsYvaLxLnajCfM7k6gt8ZjQjb3Xa73RHjMGp8Fxr21+wbaEcwMnSLuXUnW8t0t+o5xB/x2L
	zGVChkFISzEJIPg==
X-Received: by 2002:adf:f250:0:b0:45e:f271:5019 with SMTP id
 ffacd0b85a97d-46030506f41mr23775351f8f.14.1781022532357; Tue, 09 Jun 2026
 09:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260609143048.8B0DE1F00898@smtp.kernel.org>
In-Reply-To: <20260609143048.8B0DE1F00898@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 9 Jun 2026 17:28:26 +0100
X-Gm-Features: AVVi8CfbvHgFCCNC6XekzrLzABrskwBcGCTqQD_mJN6zpisSCK3G7k2nfPZ4W5E
Message-ID: <CA+V-a8vxP6vPx2T+3s7ObVwifx9FqnLfLdq9OpYGFWNu=8oxOQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and
 RZ/N2H EVKs with ADV7513
To: sashiko-reviews@lists.linux.dev
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 3:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The RZ/N2H overlay fails to disable conflicting devices (`led-=
7`, `key-1`, and `sdhi1`), causing pinctrl and physical hardware collisions=
.
> - [Low] Typo in the Makefile causes the composite DTB for the RZ/N2H EVK =
to be incorrectly named with 'rzt2h' instead of 'rzn2h'.
> --
>
> commit efe0a5ca8f3fdb36ded9b05e9b5a45260bb5135a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with AD=
V7513
>
> This commit adds device tree overlay support to enable the DU/LCDC pipeli=
ne
> on the RZ/T2H and RZ/N2H evaluation kits. It configures the overlays for =
use
> with a CN15/CN20 ADV7513 HDMI transmitter.
>
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts=
/renesas/Makefile
> > index ca45d2857ea7f..0f64a8820e374 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> [ ... ]
> > @@ -215,8 +215,14 @@ r9a09g057h48-kakip-pixpaper-dtbs :=3D r9a09g057h48=
-kakip.dtb r9a09g057h48-kakip-pi
> >  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h48-kakip-pixpaper.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-evk-cn15-lcdc.dtbo
> > +r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs :=3D r9a09g077m44-rzt2h-evk.dtb =
r9a09g077m44-evk-cn15-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
> > +r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb =
r9a09g087m44-evk-cn20-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb
>
> [Severity: Low]
> Does this code contain a copy-paste typo? The target is the RZ/N2H EVK, b=
ut
> the variables use rzt2h instead of rzn2h for the composite DTB names.
>
Yes you are right, this hunk should be like this:
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb
r9a09g087m44-evk-cn20-lcdc.dtbo
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb


> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dts=
o b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> > new file mode 100644
> > index 0000000000000..bc8a91278920e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> [ ... ]
> > +&{/leds/led-4} {
> > +     /* P18_1 is used for DU function LCDC_DATB2. */
> > +     status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "disabled";
> > +};
>
> [Severity: Medium]
> Does this overlay omit disabling conflicting devices like led-7, key-1, a=
nd
> sdhi1?
>
Agreed, led-7 and key-1 need to be explicitly disabled. Regarding
SDHI1 the manual had a typo so just dropping the comment should be OK.

Cheers,
Prabhakar
