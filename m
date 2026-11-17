Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936081;
	b=qqfvo4ldVUTNxnVh5s2vaFg62jxIsGt+66DaQZyAwFN6Z3tIUYzD45+HzBgSOIl3i9jh
	 zkZstKqjoSQoxRMLOPYRMR27HsHomvoT9wzBvuJEKOLQjQ+aZdltgnX//zLDPTdTFgRbo
	 9DHdJNBrnduq3VZfyTi+TB/VbdN/UysHOm5U77MRHceUeAHkvQq40fq7xmlY8S1erh9Zt
	 708diMRmGn81kB1WC4jN3frXQ6gvbbCeCZrV2wRYIevrBlJwznqAq9p0DcGcIb/7nN7kD
	 wLBsgC8jyg9Ai5lW/sDuBa9vkSRDRUPkXHpH79/AvsCEwblWNBowZq41sYRDOqJkpDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
	b=d/LO47torhHVznRhkAJD109tUakLO+cMB1tW2m5BmJ6xn7oJRgf29xbspb/oyyDwmiOS
	 dc+RjFqmjGFqMClNakh6hYwglL9QCPBBpfdhmOSIwAyy65bkRT1BLWCVHP9C14H8COp2W
	 90oo4g1tdXd12+maRDfyObHPyE0naU/QZ7GXJGn5tWpbYrrGp+sPHyB4LlTsG4HuaXdtJ
	 nfjBhUz+IIrC70ziB803Wji2aJpaa+82LLcFCcVweSugmqS59LN2RFMPwTr4StUDUfDCs
	 26lMf6NRXIMCOQYZlMhoB/ib48+oGy0r7/+lUAhfzSRr1QDMa2EVmDfi5xB6cbG+Ebw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=A69UnZxS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A460A3803
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3A460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=A69UnZxS
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0dba37a7fso48021157b3.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936079; cv=none;
        d=google.com; s=arc-20260327;
        b=MAoJ7DZ8qqqh7dOpvThiAWEeYXhKAPtLsBX1K/iB2838j38DEKmhXs8bXtRWMeomkc
         3cdxkZGHWCnP6hjir2QXZpEr3WeoyWUYFfN1AI8Tis5cm6mUWdifeXWibV56k+8aYA6Y
         byNbjBX37tDRUylCZb1+Y+++4xYiXbOshqEZwf3TPfSJe/2lhTdjY9Se/RPaHtpM5fUi
         2jy3y3bFWMC/9dI8yt74yCCrxLeAm39JtWAr3OHELEl8QniwvrZtrCDIYZBxI4EeCgll
         0G5dNh/+u7uN10k924uIUTHDkJg7u1XxGxmewf2VdWTt8lf5kAyocCj6ABS1mmsspXFg
         uxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        fh=2Dc4j7leKzplNFEoEZm/Fup4sOg9GAXfaFzVaVct078=;
        b=kHN29fluwgWA+CH5sURxPPgR5oIWOxt4+/U/9FG2/VStueLQne1/PvvFdwKQGHBytm
         YHMJ+Np2jKGN5gT1zfzVY+4F3Et97HBc8z7areJBY9MwojOfrNtglNxvCVxfQlNI2+vM
         7/btrtYZqs8QyB6NhkoytQ+iow1wjrrZtjge4Vw5/nI/YrOu4mG36I4QmwIRs67WsPbK
         rqfCg3s5alar51bJi+KbSiLyTeKTNbeGXWMayOZdY2XEGPgWveqcxfR2+vKYV9Ubfo5T
         ZEXmUzfsovFgfXroSqaWKM7xtspqSNO8xr3bl4Z1BE83088Tjr7k7WvgI/3YOAtVHl+f
         tcfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794936079; x=1795540879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=A69UnZxSgZpATkrI9vIUDUXomeq84m7quw8KG5IeGWevfpiQe291q4HB+eRF5BNk4P
         o6qkn4CNWByuaYVqlf1CCBoqwu+DsnBDXSl5TsO4diuoMk7fN7pjE84nJ+ZWYpCc4R1H
         XlSAxo55M48/aCNDsZ/gdrnx5//BVl6EJJyZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936079; x=1795540879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=r6wG6LBpi4ImpibV1p3SZnT8gQP6h0jHCQ7k3o9W02u3M5mq8OVrF1HbGLyrhgMmBt
         E+dox2pY+2A809ZZbQu/vgDjlRXYgHUUSmYsAul0DxHoj3/Oy4lDwdujIdzWJi44k1rc
         /pVoj66YD2Jq7v1rYFj3DZG7x5tvDkfdqzH6gmWgbMQ14j1mW9fNARY8EenQj5hifzEG
         6qWxmDtHVBwR3lHEKVRDr0TDPdnPECQISTUcGzxaVeAmtbCKbOTgdJ1QPG0gZ/Tg/sgZ
         RrBlnmmqSY7M4j0l3+k8ulJAs4YQX4KR6UwB1eZiqI0u8ik6XNkcyxZafy7FJoi9X6dL
         mQPQ==
X-Forwarded-Encrypted: i=1; AL+hErEicblXUAFjbSLbDkdQAyuFJzATCzRcHIbAn2rO9WcINNiJV/GWnzLu3k8zr4ZU4K4Z0zXi0DadU29P@vger.kernel.org
X-Gm-Message-State: APuU4Z9brn4vBH9pNizWXRNgrryhx3A9oTSKOwCLFKETMZaWbck4W4Nw
	UK6OuHGiytTqMncJrkyfAqsvFC2KP6dx31Q+1F4XIm9/EKzb6erDGuTdfWqQOkBv62AjODS/mZY
	ccTNq27GcTb4BGPti7S0eaA9kwPQ30bktzEti5uATmw==
X-Gm-Gg: AZFdTZcAiQhwhIecjkVl1S5lWr86ZYZ0rYqHsNL4thdpKZJehaFFE5P3EsmUO/z7HAg
	5XhZuyiVh07tTJXdF+3J3Amy6IeK60YUMs9zLczceoS9NxSdPR7G9TPhw7lEaYS36zA5dAc6AjK
	eyREq7UOIYv2dI15qgLChuqGgu7lEHHbH+qgtzIG211RO3NMs9d7XP1ZIfAMn2Bpj7WmVOaHWqG
	mgD+frIXf0pedGnHiYIvOYxCJNGeB8073WN2ELaX6nuNtuWX2//bhwX1BypoOXRCimGurU0CuCu
	WLim7pVwcLjGeyvKzJi4Zz+sA4NQIBmDjKlxqq5xIDWa553boiRGfVlENDMTUVJQvwZZBPv7vdt
	ocY7IN/v/ccXhur9qda7W0AIsxP3PR+27P7jVr4+GgN9B1q/0wGH4DKmLu9H76BE1BQ==
X-Received: by 2002:a53:a201:0:b0:675:b778:a423 with SMTP id
 956f58d0204a3-67dd400fd64mr68936d50.142.1794936078854; Tue, 17 Nov 2026
 09:21:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com> <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
In-Reply-To: <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 17 Nov 2026 18:21:08 +0100
X-Gm-Features: AclHuK9vIKNWUheSbkNa70jfkA0aQPHHOtq4zZIwHrtQ0QLNLTppD-5SEjbbfas
Message-ID: <CABGWkvrnq7Z-nO2LoJw1M833Mqbabn6M_r+okrJ4R-eQ-sR_SQ@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
To: Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Tue, Nov 17, 2026 at 5:58=E2=80=AFPM Christophe KERELLO
<christophe.kerello@foss.st.com> wrote:
>
> Hello Dario,
>
> On 11/15/26 17:34, Dario Binacchi wrote:
> > Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
> > STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
> > the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/bo=
ot/dts/st/stm32mp257f-ev1.dts
> > index 782b4bb843ee..9c38c4fe0c1f 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > @@ -431,6 +431,23 @@ &sdmmc1 {
> >       status =3D "okay";
> >   };
> >
> > +&sdmmc2 {
> > +     pinctrl-names =3D "default", "opendrain", "sleep";
> > +     pinctrl-0 =3D <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-1 =3D <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-2 =3D <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> > +     non-removable;
> > +     no-sd;
> > +     no-sdio;
> > +     st,neg-edge;
> > +     bus-width =3D <8>;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     vmmc-supply =3D <&scmi_vdd_emmc>;
> > +     vqmmc-supply =3D <&scmi_vddio2>;
> > +     status =3D "okay";
> > +};
>
> This source code appears to come from ST's downstream Linux tree. When
> upstreaming from that tree,
> please preserve ST author and Signed-off-by tags.

I started from nodes already in mainline:

  c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
  94911ce62b45 ("arm64: dts: st: enable eMMC on stm32mp257f-dk")

and only adapted the pin groups and supplies to the EV1. The first
one is mine, as are the SDMMC2 controller node and the pin groups
this patch relies on:

  513410ae43bc ("arm64: dts: st: add SDMMC2 support on stm32mp25")
  17d813da1689 ("arm64: dts: st: add sdmmc2 pins for stm32mp25")

Given the hardware, I don't think there is much room for it to look differe=
nt.

Thanks and regards,
Dario

> https://github.com/STMicroelectronics/linux/commit/d00ddc95c630ebf948ebe9=
c22fcbca145d771afc
>
> Regards,
> Christophe Kerello.
>
> > +
> >   &spi3 {
> >       pinctrl-names =3D "default", "sleep";
> >       pinctrl-0 =3D <&spi3_pins_a>;
> > ---
> > base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> > branch: stm32mp257f-ev1-emmc-aliases
> >
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
