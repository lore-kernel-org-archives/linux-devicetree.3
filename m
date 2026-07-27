Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76341D4C0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165196; cv=pass; b=n95AduohXy7RDV9in+i7CyWOL1bYQ21HhHaYspYiWPB2Def51J6vhNDKGzggrYDKauHnaH7nuD9glSUhOr3w5q1AYiyCIdyJusK34+br1ZnRIVFdYqRbyd6v/xRZoUvnxJk13OV0AqKc8QiDCSXmRxfXvur3zZTqJT9NNu1/9d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165196; c=relaxed/simple;
	bh=X/1YQWHS1YWIl/VLOLyKf7CQ4vT036DJZca6VjRH9aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtFxD7HJ1KEi0ZNFFSjPw5WchExdvSizv7LOf9+nNBPHy8G6OIkNyAT4YxhNEFu/eZBJJ0xQLXQ/+RHdmF5rXY15J3vPgFUJfYupoR5CpThlphcGAFfrD9y0Z8+4tc5iJOHIjh825jLtTrEiOkUCc3TdGKcjv//B5rNuV786anE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IphhxzPL; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IphhxzPL"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-738bcf9a573so1026821137.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165193; cv=none;
        d=google.com; s=arc-20260327;
        b=YZjd6FfS6h+UYaKoBoy3XIwC/cWqPVSLYXU8GN4Dyz71CMEhx3MPwmhOaLDFu+PGv9
         ebvgptL4F7gdjQ6TjYuiGmbv4whi7+z/mslWgX1WeiTMzl5ojHuNZM/5Mrxg+nHulCwu
         JnKcHWVBYsJaQjJfIhsEm3lav61KSZo9Wgkcim1JxXNYozu/4Z+MhTXyxr46rQgdPvDd
         uTlxFhm4/YEXaMxFk2sPO8U2s2Fii2wMba3jCNrFiwOBlO2qflLASgqYPmwanJE/C6ZU
         Ug+xGeCR0DeV8AVSAVenoUyyxsmd4paqQUz/NLpYbAtZGzmcsfTsNmmop3oWi7tWGRBE
         uJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDikwiMkMAAgsHKM4lx4YneiEjkLzGkxjbQ15QGq3lY=;
        fh=YEcQGIQ0aCWIFGj+sq3TUeirB7EYqu7nVamcQaADEOg=;
        b=DeDm5xNaByFV100ha5SPig49siQHZH2ik0rPsWE4ADaf1A6DjNJeyBA6o/+5soEeOh
         4s+BJeyz6Ujer2VkYNSlLyeoEA+oEaKxOArpBeBLNNn8C/XIzFpKSs6/0LAhkksTL+vY
         /TGIzCrBdI//EXZQoGHdkmYEe/YUsyHbuIfIypETkEQLcS09Ifnomp2hxsjBM8+xAkfu
         TGOQo3f6RiSstXhA9rHf6eCQOVxXe3X6LZNQVX83/xCKEjoYUgx9vrW5JlgXM4ZeaJzg
         Gh6SXWk1CHnD0Q2xr45uwMH6w0O20h+rslak+BviOSDGJyLemTdhvfd8SHhZAy1fmahH
         4Lng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165193; x=1785769993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDikwiMkMAAgsHKM4lx4YneiEjkLzGkxjbQ15QGq3lY=;
        b=IphhxzPLppdCu677UrWdnk6NLgkOvKutU0xKnPpf1Y/Dnpu6zaR86Vvr2SfkHVXNY8
         xXvSr10dmrZXsZ9cjuf8SdjHWWri4YxVeBaqAuymV2p9iqtG8iSsUdk2JjXwxshfmdH6
         7WUToYJPboEu3hPaJ1m8e4FokluYan6v6d79SEWay3tdrmeej/HQE6K/odvyazI7n7pF
         QxkAFygOA08NUhbt4N+FMVqY5wkCRG2t9ThPghIMTW8/yS9A4oEFtbguaDQgSblOpWTZ
         CHriRgoMLjt28hI/pmRE7lwRR0mwnNAaGsHvaaREuJiVqGbGKWCQNbZe1i8sPSTREl5a
         +exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165193; x=1785769993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDikwiMkMAAgsHKM4lx4YneiEjkLzGkxjbQ15QGq3lY=;
        b=GhQg+lRmyabexfrlma2Le2xQpLU01Yfuxc24vEUM2lCowpLkhT7psdbsndPYoCi7a2
         7yQtSXIwYy2tySsRsPmrjJ9jFCVSShNf3OOb2scRI3tr+BXIGYVw5vYCKWBtqtxck+o5
         yKnw6vbBvqA8Hd9SZTzgVNf0iJ3c5ttV29G+3Rff0ehVy7ioVS7eJzk9rkP1TDHCAsSD
         69yfLB0kcdrFZ7kFmLcOW4MkQ50MvpO3PzK1zIxeem/wJuOFAIRTr7gik9dzbiwKArql
         bVqZucNmUcMMS6xHZWzGMGYVXzxeGLTLCqNagb5Z+mHWNSeq89AlKg5TaeNFVYoDJq2C
         UZ0g==
X-Forwarded-Encrypted: i=1; AHgh+RokjdpKq2qOJITTdKoWerLL5oZfg26TKyHAEUMX8vGAWzb2XHL4BW6O7M1PF/9SEXBJMHYZrD/c2qDE@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0LgmvvvAx1/AI7EX9WrYifHBrf10uelCe1apdyHQdFZxWw+Z
	GIUiwxq1Wt5vBo2oPa1IT11Qw1/5hyrrnyZoEcXmX0FuDmNaBBThlQ4M6h6ynlB/FrXfoisCP3U
	P2KUFTPCd8YDKHUqEdDdJXVEwxBvEkdaIUIleEZ0=
X-Gm-Gg: AR+sD13SYmi435OiFii6QmLKj15M/QXIgRuZpupq1z3V8RhA352kdaFmiNq549s5nBg
	IBd5TqMKBBi6vlI8yhm64RwVp8U4YlH5WwQiP8gxgOur3spjDm8UwFK7SdiYfwDkesIFO/Ci1fl
	C09isnBWPXuXPpBDHY8+BspeO7TbDz4UFsWfCWE9i/Mqmi0vNBMQb0FknAGYijL1s23uWj+MJtQ
	gSHXlOCQ3hP14GtWzQX3pYyWXAqPymdySDIRnHFxlNTEUrTwIHPhlUiJC5GEh+IDKs2Dt8GszpF
	CtUB2rnXSqihufNP
X-Received: by 2002:a05:6102:50a7:b0:73a:2195:4386 with SMTP id
 ada2fe7eead31-75040abec47mr4460698137.24.1785165193013; Mon, 27 Jul 2026
 08:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
 <20260726143048.130116-3-mitltlatltl@gmail.com> <24pphoosegiuoyn7nvsf4jkdpb6dwafx5t3lqk5endu7chstab@i3nmri5t5pzz>
In-Reply-To: <24pphoosegiuoyn7nvsf4jkdpb6dwafx5t3lqk5endu7chstab@i3nmri5t5pzz>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 27 Jul 2026 23:11:33 +0800
X-Gm-Features: AUfX_mxwGsmP8EQtpoM8QW_YO40Ee5c8b-9P43GEIBZzXj0dc_CAJbqyyHa2yHI
Message-ID: <CAH2e8h50740mZB5taWBiF1bm+2=8JZrZoE-q1HmEFDC6Sz5OUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:19=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
>
> On 26-07-26 22:30:48, Pengyu Luo wrote:
> > Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
> > based on sm8750-qrd.
> >
> > Supported features:
> > - Altmode
> > - Backlight
> > - Battery & Charge (Full speed)
> > - Buttons
> > - Framebuffer (Require mdss and dispcc to be disabled)
>
> And yet you enable mdss below, while dispcc is already enabled.
>

If one user wants to use the fb, then please disable them manually,
besides, that requires `splash-region` to be renamed to
`splash_region` too, the latter naming style is inappropriate for
upstream. So disabling the nodes would not make fb work, in that case,
I kept them as enabled, then we can use altmode.

> > - USB (Two ports)
> >
> > Downstream supported features:
> > - Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel=
)
> > - GPU
> > - Touchscreen
> >
> > Unsupported features:
> > - BT & WIFI
> > - Cameras & Flash
> > - Microphones & Speakers (Downstream available, pending test [1])
> > - Sensors (Downstream available, pending test [2])
> > - Vibrators (Downstream available, pending test [1])
> >
> > [1]: https://github.com/GUF296/linux/commits/codex/tb321fu-full-remedia=
tion-20260715
> > [2]: https://github.com/linux-msm/hexagonrpc
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> > Changes in v2:
> > - Add the dsi panel node, since the panel driver is upstreamed.
> > - Use consistent name for fixed regulators. (Krzysztof)
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >  .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1170 +++++++++++++++++
> >  2 files changed, 1171 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index e05414290d8e..cb93708e0415 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -405,6 +405,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-hdk-rear-came=
ra-card.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-hdk.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8650-qrd.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8750-lenovo-elden.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8750-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D sm8750-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      +=3D talos-evk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/ar=
m64/boot/dts/qcom/sm8750-lenovo-elden.dts
> > new file mode 100644
> > index 000000000000..c64a1d8c65c1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> > @@ -0,0 +1,1170 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights rese=
rved.
> > + * Copyright (c) 2025-2026 Pengyu Luo <mitltlatltl@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/phy/phy.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include "sm8750.dtsi"
> > +#include "pm8550.dtsi"
> > +#define PMK8550VE_SID 8
> > +#include "pm8550ve.dtsi"
> > +#include "pmih0108.dtsi"
> > +#include "pmk8550.dtsi"
> > +#include "sm8750-pmics.dtsi"
> > +
>
> [...]
>
> > +
> > +     backlight: backlight@76 {
> > +             compatible =3D "awinic,aw99706";
> > +             reg =3D <0x76>;
> > +
> > +             enable-gpio =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
>
> I wonder if this actually passes dtb_check. I think you meant
> enable-gpios here.
>

TBH, no. Thanks for mentioning. I did the compilation test, bringup
test, and the format checking that I can recall. I also followed
submitting-patches.rst, but I did not read writing-schema.rst in which
dtbs_check is mentioned there.

I will do this in the next version.

Best wishes,
Pengyu

> > +
> > +             pinctrl-0 =3D <&aw99706_bl_active>;
> > +             pinctrl-names =3D "default";
> > +
> > +             default-brightness =3D <511>;
> > +             max-brightness =3D <4095>;
> > +
> > +             awinic,dim-mode =3D <1>;
> > +             awinic,sw-freq-hz =3D <750000>;
> > +             awinic,sw-ilmt-microamp =3D <3000000>;
> > +             awinic,uvlo-thres-microvolt =3D <2200000>;
> > +             awinic,iled-max-microamp =3D <30000>;
> > +             awinic,ramp-ctl =3D <3>;
> > +     };
> > +};
> > +
> > +&mdss {
> > +     status =3D "okay";
>
> Commit message disagrees.
>
> > +};
> > +
> > +&mdss_dp0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +     remote-endpoint =3D <&usb_dp_qmpphy_dp_in>;
> > +};
> > +
