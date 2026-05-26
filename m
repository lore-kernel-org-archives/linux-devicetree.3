Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55480388E5A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789854; cv=pass; b=Gq41xIc1ZgiVNQ/bdNSvxBjITFQ2w3XDvOksLYz+gztiRa8Q6g0/f+648AnOT2PAfNG25Z8rWBhe0ANZNIIzxvawxd/p8RjyJbYPxrTy1mLknuyFw0guYMfc8aHoDah0VEIRU8JUMMkxzeWfHWkEevLvH4qOT8H7jVAYW7p+Vqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789854; c=relaxed/simple;
	bh=6JdPCZF7Dk+LCK/fQNMCvQ7TciVuLce0qtseH2AlqEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7DjapCezv1DP5YOcBrcBeXIysDZpDHiepeLt8hLb/u2WiLTyoLshXDOC3Ud8loZLdHNw1ARES9tQ7cVMzzjKR9KjZTOeMMlC/vnxDC17+mZMbYfEEAbCGDV/ibBRc4SmcCi+bFc/DAH3LRnAk6lLFjAReF07PhGvLBd2HGdPMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8kZupkx; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8kZupkx"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304997cdb21so1661549eec.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789852; cv=none;
        d=google.com; s=arc-20240605;
        b=kdMwZTlSwk79JWRkoPlvpntzWkr/IRPj33vSSrbSlOU2jEWbNSZMN8vlEvZLe9eyMa
         3Chg2kVXgT8GqxiBbVtp5GVZKGtlAT1aytatpMh9O5XaAjYiZKD9/L/kcA1vtLbKggAX
         OWFo+Xo8PrXeKxXqQYddOkaQY02gWwsJLfQ1w7t1Bpi6Fg/nT4XNIJVkB6veKiuPenSK
         vZoVTbcKzCicwnuq+71hnKEVGoQi1rLpoo7XoMO/7RGSvAFinXBRZm3LCSa155UEXKXI
         YrQfrQJnFtk+La3zkFievRjoed7jEkXJUhUie/KPWh/hdj4u/OP/pNrR04PKTLeSU+yx
         xhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        fh=3lk0kjozRsnVMl8ErvJMjclzvGP0B76e9ynPPIecupY=;
        b=IN2ZmqaotiME0KPbjaVVIA6F6amFacMQKt44eS921zsGapcohvuuEOXmApYQuVRUHy
         Y8ezGndcDKs//ALpQZB36yaXzZ5E+8McsrtL/6RcvIlOgiK5Wpb0+L1LEo/1Qp931khD
         E2zUsKl0dtIDMRfMdp6/6Pz7rzhQolRIV9C/eOpU8mKFwoJuiaordCWbc2g3QuuaIMxJ
         ltbFFLDnqnsf7TysBXK2/8GNyrkNGGUeVNT6gm4MnHtgaEC9+fjPi3OEGYYkGu5wCVzP
         p7e44k9CRJ4FlAXnCPCLVCAU5cwcalnt6gMHxaep/Lx8SATSKvgXGq4B+/oKL3MjRk2D
         AqXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789852; x=1780394652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        b=V8kZupkxI/vE6LNmfw+m5id719UJZN+8pHBqJQfq9WNiMxBM28M1L7LMN9KFuHxigy
         hwvP1ysr5IjDocyqcfOCI9p8kgJF0t2/fdewG+AOwI5Z0tNbBpgpBNnDOHr5uOjkZZlu
         Qt1aoJGckN/eQsU6r5aosRy2wcH0JcEqtqXI5CjB3IDioRlu7+tUNbAxaOsdw4aMtyIV
         V3c9WaTcDvHh04DcVh+PoD7Uu6orfCRys22cihxrkoDkzQVQdTMAMWYaj2J4rNRFihtb
         lp8qaHB43eNJXbpzW3yQXZRNR0NKdnSbi2gD8RQES9F9NrD/MZKwPRSAotMOASG9YTVs
         2qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789852; x=1780394652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        b=V6sdgfNqzuuoMfU84bcPniWb+qb88cwqEJaCv3UoWVNO+6so9vQJcExkar/rNYiH+c
         41+rZqMVUM4JlkXoT52r4FcsCKonWbcGflLG58S/g8P2TUV6WjhF2mkSr5Yf30ERXltK
         uTYlL0s7i7027SrydLLaCEq1z+Ubc7ZE0mewFlmOKzZm1fgPg61tabUDRlbSQw/qqtk3
         P49eW4Xg9ZTRZ83jz2jcM7rWuNNH+4fbzEyEHqsX5E8UI8gDfxNqfjyvUkHjvYN4IJmQ
         25tSrlWQ5/iTwhZF1phvd8Cbyh0y4LJAJA2XI5qE/JBYEmbYzPKnOqJUBJmkn1D0ACN0
         74Hw==
X-Forwarded-Encrypted: i=1; AFNElJ8RwJ/SIphdQJCLTxEA80yIwbe54uv4xyazophhjq2k9OpF8U01uEfHgBGw0xvvbwtcSydoGkNVeOC0@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzPylFxoi+WHUqxKNuOn7AXb0Yv+e9IInCmsUJGxT/VJ4WiF/
	3XT2fIJp4tURfVxbDRuOmvt4qe3ybkiUd//87plb3t7FnJKiYYb+P9tT/Ky7v9U/ssfVt5IJA+u
	eXxHu2daiSmnFtoA8o4QmNTOYOoENirg=
X-Gm-Gg: Acq92OEzdqbS0JL9Eat/HJz7dYJkRzTnuqxh/YdZV7IKuos9h4QN9/XMIciPHNgRKIZ
	GgcDlDwanAsHc/e595G8o640UyLVIjMhgMsSWTpOTplSa4XyjWxdQWAYMWHfat1MU4/Yr5E9C4M
	bRfkc0GVzkp00Ug6WSpkeMCwqoQngma41ecvb/OKU4/wiI5NIzK8HZgWNwI/Khdif/FHRyOgQEN
	zKXSoijlY0Qnk0TWXzD8oCrq7FBoNILkp1Px8Fkgs8+fylier0j4c0iRsO+e+m91X7WKBim8Wcx
	oq4Ggwb87QCYZPDuJ/c=
X-Received: by 2002:a05:7300:e826:b0:304:8881:b82 with SMTP id
 5a478bee46e88-30488810bd7mr2815420eec.1.1779789852421; Tue, 26 May 2026
 03:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 13:03:59 +0300
X-Gm-Features: AVHnY4JzVg_O8P7k26t8Ze2LsHov-mbPzQTfo6cA9NaMmsFopTOCr3ZbuuFWfFQ
Message-ID: <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:5=
1 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> > Document the Tegra modem pwseq used by various devices based on the Nvi=
dia
> > Tegra SoC, describing its usage. The power sequence provides interactio=
n
> > between the modem and SoC-specific interface configurations.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
>
> ...
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    pwrseq-modem {
> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> > +
> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> > +        power-supply =3D <&vdd_3v3_vbat>;
> > +
> > +        nvidia,usb-bus =3D <&usb2>;
> > +    };
> > --
> > 2.51.0
> >
>
> I assume there's no such component as the tegra modem *pwrseq*?

Hardware component, I assume no.

> What is the relationship between this node and the "infineon,xmm6260"
> compatible node?
>

The xmm6260 has a phandle reference to it. Since there is consumer
matching logic in the pwrseq driver I am leaning towards removing this
node entirely. This patches is still in non-final stage and I would
like to hear any opinions on the way to improving it.

> Bart
