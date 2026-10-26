Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793002889;
	b=4HC6/z+BEnNmtfOw1bkKM3NZ4xyO0p/s9fL7XwX4WikaF6bt8qGSm/qd2kOtfhTJ9iI9
	 Ol5LhZILnSxjU7j4+mvxfsg7aq769bynWBgfzbwfdIj4Q74kVGnCU3gpR/qVCaAEBDKwI
	 q9v2t0RoEgvoefTvhWyjYgQzTuzfqzEZl+G8XKxClmK4AJ2Zk53d4R+LVRDU9p8gjRY1y
	 k/N7MIgkcXyvZE8nCDR1Du4BaqTdouFC/R/1xqZIHYmrRVaC1x2FyLIox0VHLY0tSc7+j
	 jCa1PH+IEaaCZiVlqxcfFz3eWtMYKRy1ec98J1MjyZUTvLo2ASm8Z3Cgz5uFBbeQTVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
	b=w6ntVntkE4nKhj67FCRf9VTFiFJ73nzaifwTKRM6e3C8IFeMCnqG7ygWW5s2k3q1Jher
	 wsmTQgYwCK9r0K61TARO19fWH5NOQcjE9kPJkCQdmkZk3hFQCKoibkSlNtj1Za5qiC9os
	 IHig53iQWtuyy1G7QNlN17q5Qci7GrWJLSC0VDZ9vEddMmfee5eO9Ta2Cxkle3ZvzVrmJ
	 n3ty14IjRhoaK4u45zhrRgVSf19L4f+mbDlzlshuz9LIMlEQVz3xveFtYIU9hvYlb4zBl
	 lIRNV2/92w2ESM4V/9uqpvmSC/QBpTOfgSwFBQZM271/kKonUJeAXFLvyz+oZMdoz2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtbFCSID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DB606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtbFCSID
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1189328b3a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793002888; cv=none;
        d=google.com; s=arc-20260327;
        b=NYaat8m4cq2kbrsdvRdHxTkxrp92wFecH3Tu4+kRWJqUQau5XA2NYB/CAjFkWRHkGw
         nh01nz01r4O1XWAh5wvJFG8k0VOM6GN5XvQNidoroTJ5TyaqWdUoACAa2iWyD50tkSxr
         6xrA2Qy6PTfZnGdYBEoeLxmwg06fjs6Mgk2Xygf2Kjqdsjje2w5GUsld7cc0jKudJ7GW
         2OhVcSaEWLFKx/Wpf0yYUxlPNx/khh/2Cv/q27l2th3PAm1/dmv/OAsEiUGRptsI8dE6
         sES1891bp+yzfIWpuePA8Mp2LxtokKblUfQ7Rwn/Dlidmfy2oBiWLhsN1a6K72wW1maW
         mYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        fh=ahUgYqNbSZ0m8E6XTiaHJmf+hqMzLfBqxNYd3YI0VLk=;
        b=NC7upFLc82cO6Wg8ILelg3bFG4/COq2vUFFT4beFplimu6epCZJXDTh8KUrNfiL8WD
         v9hKz8i3YO6jhPI6yBVkkdaSM5zMte7FsfspMG04Cyspf1EaGgSVKwQ0DYDpeewxkjBo
         3fO2ssHfHdj/CxZ6rPeoiw61EC5Orsd0JLOVanLaFW+mX1OAOUv9orsxsi53xx3xzURV
         i833Bk1VCa2jbwymMg82Uz7dlQ4skyJUX4gXvW//aDRgYuIrjoyt1YavmmX5x459RBkx
         X3G4J3yoyE82vEBkBp0lqHcwxX2beTvrjciaDW0NN/WFL6v5EdlVWOOWZB8Q6ht1Ck9L
         bNdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002888; x=1793607688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=AtbFCSIDCp6OV4Vh9wQP04MNBYkf0e9/ExwlrbRocYr2B1yABRWZ2GjGOn4OjNBwhT
         oquX/CzpObnyxuwGW05om9z8mtUS1qTjwRVy5pX3hlivQZwFIJvJZ9kg2vOG9DbgQtWN
         ptGBva+NqrndKfctGb67McZTaDdg/8/WF3gbaAcBkxDtycxK9qjrDLF6VqHvKZCXtFda
         0aakJnTvsDo61HBiDnxb+4NOPnI3UlF8uAlhXqE33B/t9X4r+IaCeaL8KNi5wGksdo5s
         wI8jHnYsZmU1MhubUVFSVgPD/JG4Ar3dZrqcZ+S/qb7si5Nrgews1AQTDd//PWyQS8/l
         n7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002888; x=1793607688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=WJFtvmt9sLdl5xqHnxuH+LHQFIYqK1clMNW2X4UwJuzRnLckeVy3ue3a7kBiTMc+F9
         FviExYCpGbm234Ll9Qs92NhDy/ZuSdjX7VGIMUIncub4t8KA5UoBjNCcAxxtu2QSHzeV
         lPMyw+b9lsVeF5McpM8ef3S1eQ1TNHS94uFLDJqEJHTdOGEVJ5PqGzO8mItxFg9U+Ise
         jMOvXhFbs6IhC0ewK5QQRqHCsNYCUqlK5GQznO1p723+nDBX1Ybu1PJVUIZUawhqt0IE
         MQgVjAUN1ZZwznbUrrVhnVTkBvKjGHarNl2HK4mz/8pMvcp2hsqzzl2vRtdlybyXFx73
         hHHQ==
X-Forwarded-Encrypted: i=1; AKwUvByoG3nON3eVI5Yie403RuFWxPKj/0XBlPYVZEbYLBhx3DYQAdwqVr1yBmsRXwmIZu1B1pQuwF6SHzuu@vger.kernel.org
X-Gm-Message-State: AFq9FYIXCOYdg0qsC1uFthEUQN/T6OKe8gq2NKzzGyzmuB3yDvoxzYjt
	LV3iuRgOqjs6iSV/OQKJWkFOaePfRReRIpStKZ4CcnPFj7QGCvpzCUjH6/VtuP56kVv7n3L+pKk
	+aSn6tw6skCIxihnOYntmhIslLlmL5S4=
X-Gm-Gg: AYBFou300BKhB5fHZ6GgbVar2KSYnwj9RShnZjUf5f2U0JNN2FM3bI1hyzqgrrlRZuo
	p/9isJre7hKJ+KqeExEtDqoiqBts3vvMCjg7mHfxknnq+RoslESWNdtD/f4LKhQ7XVqFiBh/j3d
	X8LZ/dbqCBuIIZfjvMxoebIdLk6QjLhY9kUWMvQEeQl1pX2e+q+JYgq7z/NVBobwtj+52TMABV5
	0IURmlrJq8IKnQj0JiqCIcrGQAngtzI2AaHY682Psb9p0U2F+2VqUk+rjYvl8lA/1Jho6dHdOw6
	OwOLNp2H/qlc3ZFSra+JNeDNYTCur3l/j2vBty/xn3ylVxgTlHbBsCuWy0CYFPpar6JMxqMLs8r
	47CCr9bu+1SjWV3olCo2ACPhDi/PH6MJpW0AL3tQ5j500XxOuufw/
X-Received: by 2002:a05:6a20:db8e:b0:3dd:85a8:cad3 with SMTP id
 adf61e73a8af0-3e7bfa95ca3mr4905748637.42.1793002888123; Mon, 26 Oct 2026
 01:21:28 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-2-pmazzini@gmail.com>
 <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026083058.04173f10@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 08:21:18 +0000
X-Gm-Features: AclHuK-pzB2ukAo43D26PIOQvYip4LrlulkX87-Zh2YxM609r20rprIHYc6RIYc
Message-ID: <CAAxh=jvGJVNTU6o9L-8-AeHDVHBcBwJDxwwoNZDwMN3tjRk1pg@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I will drop this patch in v2, so VCOM stays off until a consumer
enables it.

On Mon, Oct 26, 2026 at 7:31=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> > always-on before the driver stops doing it.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/=
nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                       };
> >               };
> >       };
> No, please not. That regulator is in practice used with a not yet upstrea=
med
> driver for the EPDC on that platform used to deal with the current kernel=
s
> fp9931 / tps65185 drivers. So it is very welcome to have it not always tu=
rned
> on.
>
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm=
/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                               regulator-boot-on;
> >                       };
> >               };
>
>
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But
> that might need to learn to deal with regulator enabling/disabling.
>
> Regulator always on is probably not desired here, either.
>
> Regards,
> Andreas
