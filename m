Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F023F104F
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152656; cv=pass; b=W+02jSvLuSVfJmpCUtiWTfLTyS482Tn7OyUpxY+Cw12O6eR26bBE2H3qSNJBrlcRpu0VJM8wsYQHOfov7kwtzy2ix1/RtUVll2Obt8PEMLEWRT1PwzxE+qs6IZpR46eR2Oh/WDui7ZeRIKxOQn4x8cPJ5g0bSqezE2oeJ1Au7vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152656; c=relaxed/simple;
	bh=RtqsMSgbSK0DoXzM/jOKS0u9JMf6ypFVGoks8rGZP34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjmjsA3N1pjW35RUP+Wjuk83mEvySp6Dv+NJ8ARcVjitbti60gUwZ5Xv/55oEqByFf7V+64dYoMD48E68zkqpEe17wQc2PneMEEDfjROBgNaSkglYTRIQ1i0QZBeJDm+lBN/L1lYUofT7+Gqpc/bD+EF8dyQke0O34eV9PDCWKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z67J7PON; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z67J7PON"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso43391166b.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789152653; cv=none;
        d=google.com; s=arc-20260327;
        b=qSuM8EO9ZlLWE7TwC9qdon0kIYjbbxchzWSEViEr+x3fz/GLOuYlPh6je+E6TZqLa5
         hhDm4AObislDdJ6x20cj/Vfes/jlyurnbxoOgXDKn2EqNhEbJePcHE/PvjCo+vcleSlY
         0FaIlfu2IUxBUXk5XL3l5+BWeMupz52h2e2M8+9eh8PHJE10NTLDDFkYgqbBQh6aBjq7
         FyXnCe9w504NKVo/1OB73jTFTbbBt5LFf/dSgvryz37b3wg96IK3JTGVcMjPbYdOjxq1
         6vyzbRZ0BSDtrZnyd5n1mAWsbKtV8CKceK1ot8UyUL4H5ZtyennT+2moBIWwangxLW76
         pZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        fh=LUDUp6kystYAd6+sGXHHcom8a6eah/CeGcyBUouT6j4=;
        b=mIeH0sGYWv1pYWhowbq2FVoapTvZwwizsYcz+DQiVSlvzTFKLfIVcwd0jes11/SLmR
         EVDwewhbb5AY+EsodX47T28W9fm86vskcpLlFmoqfJVPtMIHFOxOYpvtr03CcwtUlv8y
         ZJOOC8ZOZ7MiYMYFPinfIGoeZsqeJkMLXglkg6bjZzbux8TPthPkHcgAjmK8NaBXi5EW
         YhRI680yFcJbCmngkgI0keqwkSzZedU0jHuIwetqxeIfRVAZZFvv9Yf2eWDlK2WGVl2O
         QpoMIpHC5iN6pD6tIAySxIfdPbFUzP3+yB1vOcTGkS+aaVnouHPcHXcZbJAp5gV5p6sK
         Ae5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152653; x=1789757453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=Z67J7PONtf4j90DVRuIUDXP1J+SojR1pWnezXkF8esU1lwCUc/BQMoBFPuBwRrCJdO
         xjpH53Y+SYsEL74cXMUEhjqb7wCR1tYlsWRuTsp1LmZclofVXQ2uPBFJ2wpBpkQxbmEH
         uC6UsLiUaZPuKURFv9rku4t2XjNNSZHtjrQUl0dWix0wm3RCFOGYDrFFfkY1tyx852ip
         WxNMv8siY3637rcO+OSP/lUPndtusgAvaF7Mt528SW4fwE+FFcpJh9WmRk/vwwuOyRSv
         KrxgpuB9JwK5WnBkVmTisFg8wmlLovMznmAotZG9Ts/RAwI+oq2rffyRXaBhL5bH4KZu
         tucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152653; x=1789757453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=n6Xd4s2Sc/06JVX0fflVeNPiF+vfsSm0guWa8gKBDOHPoEW643/GXHEUqoNyy/T+Ib
         GegKwqRCcDDI0nqj3hWqHXVzy11QLuNc8Qz7Kayg763fWVFySeNb0vdEtyES2DllIq9N
         HpbjfI8PtCcK7ucKXSIP0w2Nigut9e4QAEKGtNaqn3pSj8KJRKMpLYpJoz3fiCn8T0kD
         5CkMo6dB5NQEggeXOOQdXojdd1tUy0ce8ADYcdUQL8OblLdid93zF0QvLBilS3lLQlYx
         tqj4CPrKXqstf9PTwCxiEwSXg65ZkMZ/Yz8IM/IK5Y3KpoPZ+wWWeslpduODuyIGhAoA
         vB4w==
X-Gm-Message-State: AFuF++kf7WWpTg/Ch8rVI0MTaIQm74lN7HuXgXWNWo1sdnbNyS+RZkG5
	ENQbyZarfADBjmaEsNFx54uPAoDQG+Y1ot25Rpdmy+60L2Qlnf4RCM+6IQdTFmPItPICfIM3LUd
	51BSw7UsqKx3NzaYx/bElGhyqBGVDZEk=
X-Gm-Gg: AYBFou1XDpPycQ1+H1W2IRZtRcY4yJgqvCxNcfBNOKT/WgWXOLhSCybNT+3bbroeNIg
	GN43tB64zGTED9B1XpSmZGBgYg3d0cY73UDWdcIHD7qkUhgDOLzCnZd63g3wRmKwK3eqsKplTjN
	P/7jF4ewOkNhis+eK4tQ/33xZ8UFwzvWpdRodfdrVEwxFZKTrhXPDlWNpDCcrcE54eiqbzcI+tG
	A7yp0Q4rHw/uQ8oXfFQ9nLWok7SZ65V12/0EPD5nvIDOHtgXz5oHuBSwrG1ehTBT94NvWVC4Bjz
	xJALVpCqLXgzR1qc/OjL6GlqGBodRY/VZ1uGmnuSDOSha+cv7MycdRV9R5c9jL+hjNayvyTmYUr
	A5YrANFt3kCvMWMZ02vuTAybvOaAPkny4HKWCcFhz0raMNIKV37UnMZVqaiLsL9Crflftp+Ur6Y
	36BzN9S2rs7f6Sh7qZWFBMDl/NYTT+vMno2MFUJXS43P+D5TlGrZJippqy3NBvx8LxTljNpZX4e
	OLf
X-Received: by 2002:a17:907:7211:b0:c29:53ba:a4cd with SMTP id
 a640c23a62f3a-c29666f90fdmr483569066b.11.1789152653082; Fri, 11 Sep 2026
 11:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
 <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
In-Reply-To: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Sep 2026 11:50:42 -0700
X-Gm-Features: AcwNN1UBWpQbvDkHrDHhG5kJOPM-dImHVyKgKakwlCkD2k7qVSn-bXfs2dvbyzk
Message-ID: <CAKxU2N_Z9OHUx4LBmxU+8GZ3_vFYTVuCt04P4XwjyfkRBZ8AOQ@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:56=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > On 9/9/26 17:12, Rosen Penev wrote:
> > > Add it and set for gmac0, which is the only GMAC used on this board.
> > >
> > > nvram size found from a random bootlog online.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >   v2: fix typo.
> > >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++=
+++
> > >   1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/a=
rch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > index c80ac16ad949..9ab618a097b1 100644
> > > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > @@ -25,6 +25,15 @@ memory@0 {
> > >                     <0x88000000 0x08000000>;
> > >       };
> > >
> > > +     nvram@1c080000 {
> > > +             compatible =3D "brcm,nvram";
> > > +             reg =3D <0x1c080000 0x180000>;
> >
> > Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> > all of the chips?
> To avoid probe errors on hardware where sizes are unknown.
I looked at this again. It makes no sense to centralize:

+       nvram@1c080000 {
+               compatible =3D "brcm,nvram";
+               reg =3D <0x1c080000 0x180000>;

The reg and @ values are correct here but not for all devices. There's
also nvram@1e3f0000 and nvram@1e1f0000 as examples.
> > --
> > Florian
