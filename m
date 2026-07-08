Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA9341AC7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504429; cv=pass; b=QfdcFldIJs1HCshgy+7NFC5HkmWO53kLIkRAEFuOgHYaKFSGWbf2nLa196xNoE/BnAkxc9jC8g2doecXaaHSwSsyn3iiGTHb2k83MGLZW3NJ5O47WVku4hgvykYG0ahZ4G3upE5pjyeGSM+o3PRX7Bhqe+i8Id4ABOlR6QNFMZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504429; c=relaxed/simple;
	bh=Ks7XzET3IUpoV7ag/TFtxXbJ74oEA/3XNrqevgjNtlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpU9TvdPjeRod98NpDAX5y0hc8XSGhOuRgqrqGIvV81g/i1as4U1xZFs79aR4uzm8Gd1+QCvoXCiFYK5VjjUMHjzhf1Xc2ajJfetbFTnlSlTepE3Rw3uPs+zw/2J+YDNJvBYSbNX/cZKvkfYI+ymzI1NH1oYL58s2X7IvAKO+Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rd2TAGCz; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rd2TAGCz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720d22c94aso448541f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783504426; cv=none;
        d=google.com; s=arc-20260327;
        b=VF/XGMwAxsBMYpVE4acD8AmMk0iwQOT7WFcyeptAxIWafKtIl7uwZJLWrrnCjwlNJX
         oj90al/QrnjNjSc9eF+Z11kMtaYGVfYPxxIglY49dBGsxXjx1ps7iWWqTeROlJO2VOUG
         1hRqFMAzVqDKXg1Sj2OUJhQuRcm+UalqkdnJQ+i7khCa0nRi/BlgPISEmdpwe7S5w3YX
         lWRczi3hwmdjI8UNryjP4fxBt6Wts9Zn1io9zlN8sjfLWwCYJVIPgSagr8bYu9+YTH1t
         LNGJPfs5XeK7WANpzzYyq/FNde3pY/+mLW28v69If7PJI39p817Hw5EoE/hWwSE4207y
         JvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        fh=BxDYL/aCWlbBxsUlj2U6/Uf/V+dG5EXYDnoExV2Kq/E=;
        b=PRwJBNywGLvprVyvzA0f1M59n8z62RUye2+XqAq7mmB3mBMt3HWow2nNHvG7QuFhiv
         nIwfMdCBrBp7GXEq2XRJD2pMK+6gMZ461NJ/c0f1S9SIgcNZFiXmmkKhUBX17UGjPo/4
         Uj4R0d2DNPRWOdKkzPpnGkuqdzba5m7CPW0MkbGT7LW99Mp9cdrrI1bh3pKwcNsxnioc
         CKu7PhpfvWjaGjyuKGDroUqil1QUPaqR4X/fziXoAwRGOA5yUZNSIZrQgUzqxMZ/Oaw5
         royrFpM36xTN5IkMbYxsNG86FkEkWQ/lfBkN9g+Huz1kB02BJOrsHg/N901JlM0+Wa+d
         HxqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783504426; x=1784109226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        b=rd2TAGCzV87CspoATNInvh3X0tk4sCF6Xxd75qlvRY0XEdWqamL96rSUaJThK/jYzi
         uOcGv0gYdqxP6Ld8gktYIOprfufe6Ii6TBG3UsSEQ/c0XZP1cuW7vp+zZitTR1hUNFc6
         VYPalev9Tvt/8E+zX5iReTUestkQjYO0j71qaQUGW0zBaHlINXGJJSD7h1+6W1Zkn8Ow
         LXYxa60K0iQDWnAU1RusOmwwCmbxuNk/iqm5ixspAREEsrXEXVtLWCGuoxawsec97t8j
         bWBSo4gpEoPlNVIEDi0CuOreo+heGVtlOu+dioJTrJktFFHUCUs6lKodWo5gzyDqTMMl
         Oa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504426; x=1784109226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnxwxif0bl4rNG1a1oH1+okVYVcCPb++GJ0NNiWXP3k=;
        b=X3JjHNbGZFYMH7II0XJJD8WHqKPi/jm+4Uro+DJwGo5yI0RwUMjwZCoPY0Gya6OS/G
         UVsRNjots8epuAFf9aoEm32D6W2wjp++HIoFERv8PhGh3VMcwT7B3ABLGDPkoQyQxL/t
         +JN4KZE7YXCZzOwrDn96WaAtmT0eMWZHQP1FAye5GBid1trfRtampDsjjcL42+X/IJst
         z12yzGNxmygAjiZbW4blRjJgl6L0cIM2wwq4bsdkreQrLn//MgPJBkggQ/hzIKzUoiNJ
         +m2XDS3kvTIhf++9rXSiLHAQwTVgMMms07GLlugu5LNj+HPNKANI4q+2BapqGz32PGke
         /otg==
X-Forwarded-Encrypted: i=1; AHgh+RpdJVfoFFmBhJsMbHjvyVVZldzVSghwhk1d7vr9GbmXW+hxPs6+xTbMMoy3UkqkQ83kTn5YpfPY9HZn@vger.kernel.org
X-Gm-Message-State: AOJu0YzRbuYtQTQYx7sPlzSqEvFi2mP6JVNotWIWXdewa1c1QtMIete/
	NLeN//H1/yLZWy4auEdXbrQi0UFR4tCnqZMXbMlQT9kaclyjJ5265qV5bnyJ1ANik5PD/J4u3J9
	uUBHMRWue1sI0b+bYu/bcx0W9OVMF1Dg=
X-Gm-Gg: AfdE7cncLZ1OcXjNLrsB2DxE4TQdQePhR6uCWV5wTDr35Kjg6s87sjNm/VvJOElyXQd
	lXbEYIURjbJflQ4enM6iHS7x/eiuE5JEKzIOIQIClX+WdgEAdQyOeJ6MwrUMOOsY3bTRst/mdA/
	uIXdFc2jtHAKSV1C9sliRafnUxw1d47RK5CKJKq2O1eB3gXO5PGfzimNsCRJHsuCM8uZb0qEe5Q
	PNW2ZSUA7lMRFBHdGFcvWhEf0W616Rooi8sBAKYLJy+r1nhO3zzMZBBeXGXSvHhm+WkZBIihu5V
	noyjcawPeQn7L9nKBJvVg1PZdf1Te0Rw2Dr3/iquXTLt7ewwbUxk98pC/j0jv9tYMJfpSg==
X-Received: by 2002:a5d:588a:0:b0:475:cd6f:721e with SMTP id
 ffacd0b85a97d-47df07a2965mr1747927f8f.44.1783504426013; Wed, 08 Jul 2026
 02:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260602204707.1920839-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUCzxRRK8oZvHmHFHCUN2v_kn69_8pzCVrW9RPk9FRA0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Jul 2026 10:53:19 +0100
X-Gm-Features: AVVi8CcSyjzG9IxRuudHCGVCrhR_ezqolIVqJdOXEOrM4qbZam9rfJ_ksfC5gRs
Message-ID: <CA+V-a8uxm__9pz2iSfdkbfwHFFEUpaY9nG-CzotAATV3U+Dv2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jul 1, 2026 at 3:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 2 Jun 2026 at 22:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the PCIE1 slot which is connected to PCIe0 channel.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
>
> > @@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
> >                          <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
> >         };
> >
> > +       pcie0_pins: pcie {
>
> pcie0
>
Agreed, I will fix this in v2.

Cheers,
Prabhakar

> > +               pins =3D "PCIE0_RSTOUTB";
> > +               slew-rate =3D <0>;
> > +               renesas,output-impedance =3D <2>;
> > +       };
> > +
> >         scif_pins: scif {
> >                 pins =3D "SCIF_TXD", "SCIF_RXD";
> >                 renesas,output-impedance =3D <1>;
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
