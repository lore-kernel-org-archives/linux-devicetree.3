Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064C3AFAE2
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247735; cv=pass; b=TM0grIMbyw5W6NdE7IKzepzMfribCBgMQzww1Oko/vtm3HiyUmQMOzYub5BKbOP/y3ERcXYA7QJ8Gj1gYDEvar8y25c7xf7mKivDoIUwXJMm2pB8SReL1mEnTPcsqjVGr+KUjwjfLAJbi4XjpyUe7zcYRpImTWOyc5rKZ9EUZ1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247735; c=relaxed/simple;
	bh=D0cjfPz6srUzSK27LXqvU0HcL0VPKUNdNkRh/tXIT7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qicu/U1fioNwy/dfKaRE8WWDX5b4Q6ZCG2+N7zN4pghqAs36NMdQbVvM6/FjukwL1D6QQGc6qJQ/wnKcgOkv6Ap1i0WXWXmVXcIDfUUEnzg35L1Z7hcpIOZtIJNnbpw2u8/BsU44QoMkNw0t/4BSTuVW1lJRJEjIPtbt+3HcMfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLlT4EqD; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLlT4EqD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2054742a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247733; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbLXLsx8/aHQMCP+jK9ujfOfhWmb4BQGUCYdkuY0PoPxeflQPleLdFXaJHSolZUHfZ
         qNhBeIaDTnAxBem72n6nDoeEqWsu5XVj1GodVTsrhTI6QW1S7j6Nhniiz18Cn5Ueab1U
         wMATbbVLDKzR+DzkjBKmjYiKjOynnddwS8IZsLYxwl9ls5BCGITAKkkyzmhcIvbjpB6B
         KtPTcUoRR0AVHqeiP8GUW4en+hy27wmT11evQMXEC/578r3pvhl9q6rab2Mvlb4W6yeU
         QuOyzYsUCVu6fyLHOg1kv/DCff6FNXF30SYsFdTsbCudFsZ9v3Ze6NAX7HQ8cMn0zWRb
         Vl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        fh=M4WHEqCw21ib8qG8EPyu1r0Qh0bsRi0/6XP9ED0sFG4=;
        b=fvF0uUUOWfTo4vnGnLLR/xImuuiPoDS8gvgWOwuF9yaezYRhQtg9g1P1utnoqgXgCR
         0nxdFjSDT/Pnhx9AohmpJ+xksPl9F3GnIdm2s6rwS++IZvTFaG314yB2dy/Z8Rcx7hA3
         radvbeAlBu9WXqxC4gChOYTU2Wk/CDrfnQBUalNRqERBVefv9DAtJ+8OTl5sBanQjLdm
         CAJtcBABSTEStQo2aQ799uGIvspH9Yvk1tKkLaE5/Jd85LNv2xS9pARS7NK1RyZEX+d5
         TxTrR+jupyoGHeS+U/O3k5K0rEOpVs3L43jLkr4yHn5YiIlgZgqsDacbBuOpOxQEXC9O
         ijaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785247733; x=1785852533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        b=hLlT4EqDaH/VpkxeXh31FbrSDv6X7l7bBgOkiJw4+OoM6c9wph1AEqnxXsk8hhKivU
         00v7j0A2dcdOsl+q/kBUNgcQMn0JQkSUXPtVbwavkeTaRlu5HeC91vttI5kY/uj6gPgH
         VOrFFkxdfzP6QPyMAac0gdaRU/CNa3WhEGh8+XctSFW2xvRIasn4fdQ/cx9M/00RvibH
         EntCtym5OmvrmP0bc8YXkflfum8Sj5UhWgQ1qvLAaAnn3JyivzJ6sRXreaYIuJc1xG0w
         PHjCIcWfA1+AWW5+i5bnjo5vRLJ0yPvIPq3QP0gqalr5OsrwBi3Xyhey4JsRVSeVFE5j
         WWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247733; x=1785852533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        b=RgFZo02QTou1MVt8CthCxa4YAFLbQ+0dNFTAh32UmbnGt8SqEgHSIHqmGl02tcZXJL
         O90f1MTPmBS3U2H1uzQNpcdNNgFcj63tvLH7Dyahx3qJeWRoUkVUCg8m1murwc4VyNPu
         pkkbOwidpyP3H74sJb5YeYW/a9m06rhrWPWJHWmzW+7YdFen25MsXd21CNb6j5dPDt+P
         6rOs5pkLO6/QVh0xgRUqqPWKgud5tA03AQbpUGgdpdA8LTo8cwhX0igfUk7wkcLt7Ey0
         iYhCIwN2IqTqM90n+oZoJjQ2SYpIFHJPuBiWVAV/SwgWzP4XywwT28/01o4julmGzews
         lU4g==
X-Forwarded-Encrypted: i=1; AHgh+RqacB8Mb4WRnIqZY2zahQNaM97cKQp2RVqPwI7qIUbu+xH29BVW7dkhKmERYXPCmB4vkKXa78KhZTwe@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBPqrkN9AguUttDduF47gquBUPkLn+6fm+HLVLP2cpulmUzY4
	5SjuR0VpgbLGztPheR3ssDg0aM4sS/Mit5+skbFbCnSZ6c8IcRTCEMKBZtSB9nEg/yqMBIZ3fWi
	ONnSnvNvHi47nbuORK1u8NmR1zHgLV0Q=
X-Gm-Gg: AR+sD11KIapmOrN0BgIakP98cpNImAQZYfOJGzID2I8ywv1eZx5TH3eSmebnwSXPvb8
	6sIQEAm0qFJteJdLdKMAECItx+wk5qRknGHyA8hwZlABvyG02Jlj8kNxnt62pOlYxsfrQ34Zx5i
	TL0zSnXbpZQ0lnUpWySfOi4NEnZFEzbc3wRGwU3CPXFcWtlyOg/Xb4m7eqD/Kns7TFPb2okkbfu
	LInMNt7NsthTV5zPVWzhT0ZhcONfdbSNKseAuvsiIIGQzHOoNlTrXvXqls463HYJI4K1fxofh4n
	7aptBV4VvgS4o4p/PeI=
X-Received: by 2002:a05:6a21:9cc9:b0:3c0:9c1a:8948 with SMTP id
 adf61e73a8af0-3c8ba668f1amr3171832637.64.1785247732505; Tue, 28 Jul 2026
 07:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-8-clamor95@gmail.com>
 <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
In-Reply-To: <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Jul 2026 17:08:40 +0300
X-Gm-Features: AUfX_my91r_8AyL2NlRyX8o1lr0nAHWwEheckgkyWCy-xUMglRmkyv41JrQXKdg
Message-ID: <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> > bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> > 'brcm,bcm4329-fmac' remains as fallback.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/a=
rm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > index 3de5c84d5f009..b71a02b3fd86f 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > @@ -1300,8 +1300,9 @@ bluetooth {
> >                       compatible =3D "brcm,bcm4334-bt";
> >                       max-speed =3D <4000000>;
> >
> > -                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > -                     clock-names =3D "txco";
> > +                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> > +                              <&palmas_clk32k>;
> > +                     clock-names =3D "txco", "lpo";
> >
> >                       interrupt-parent =3D <&gpio>;
> >                       interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RI=
SING>;
> > @@ -1309,7 +1310,6 @@ bluetooth {
> >
> >                       device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE, 1) =
GPIO_ACTIVE_HIGH>;
> >                       shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GPIO_A=
CTIVE_HIGH>;
> > -                     reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTI=
VE_LOW>;
>
> I'd appreciate a note in the commit message on why this is dropped.
>

It does not comply schema for "brcm,bcm4334-bt", further testing with
this reset gpio removed confirmed that it has nothing to do with
bluetooth and bluetooth works just fine without it.

> >
> >                       vbat-supply =3D <&vdd_3v3_com>;
> >                       vddio-supply =3D <&vdd_1v8_vio>;
> > @@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
> >                               #gpio-cells =3D <2>;
> >                       };
> >
> > -                     palmas_clk32kg@0 {
> > +                     palmas_clk32k: palmas_clk32kg@0 {
> >                               compatible =3D "ti,palmas-clk32kg";
> >                               #clock-cells =3D <0>;
> >                       };
> > @@ -2382,9 +2382,12 @@ mmc@78000000 {
> >               vqmmc-supply =3D <&vdd_1v8_vio>;
> >
> >               wifi@1 {
> > -                     compatible =3D "brcm,bcm4329-fmac";
> > +                     compatible =3D "brcm,bcm43340-fmac", "brcm,bcm432=
9-fmac";
> >                       reg =3D <1>;
> >
> > +                     clocks =3D <&palmas_clk32k>;
> > +                     clock-names =3D "lpo";
> > +
> >                       interrupt-parent =3D <&gpio>;
> >                       interrupts =3D <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_H=
IGH>;
> >                       interrupt-names =3D "host-wake";
> > --
> > 2.53.0
> >
> >
