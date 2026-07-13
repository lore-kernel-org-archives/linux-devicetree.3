Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB4288505
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907797; cv=pass; b=m7j/4xfpxSCEv6OL5wyxjgGhyYJgW19Ru6/MGVGEewXJHmCzuKoTHpF5dj4VFQmQme1M5BQutBB/MQKbolsOGHQhm7UNHZ00B7okdq/U2/JbSt4wJd0y5T6lr+ByZffqcM1vJTVioerD7TOXck+Pzq04PsTEh69wWC9kmlLEPQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907797; c=relaxed/simple;
	bh=gJ4WNWsxraY4gds4mU7edhwvBZ5gKQnfXCYxM9uPV/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlqyDZqvHzoOekdQgjtxzaV5v/eCtrgPy+Ibh4CnUlO2QI10aCBjsEppJNiTUzY9pX6q0WwILlsrorqUuoLx4HH3199yeWiNJCDWPyPwj/uea7Yt5GzL5/Bh6RWMCv+frhqiN0N0MJn4MPvYguz2uk3Lymbt6j7rczdwa/xPMis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBNOSB+i; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBNOSB+i"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb906d6c6so413099e87.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 18:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783907793; cv=none;
        d=google.com; s=arc-20260327;
        b=F78ZabCsL2D6YAvAuRx5eXhHuZ8FeGV53yaxD0JUuXCFaxlLz91lVqZ/cFH49p85ig
         lopZglOtOPTKVWzjzlrPJehSA1+uaiskkTBIeuHOJnJSL30T5hGC8SXvs4rM52fmKlMU
         LR/MABMbTBVncfFvWXmAJRdTy/9GRPdEi3bPYw+1TfuwTSbwK1p0uX5yXciCLZ+SF/6o
         pB8xrM84fAQDpeBUUJXAy/Bee0x7ebynlcJwXKZ35H5BAiRPkbwoZjXJuHAQ01Oi+Hgp
         StobdFbYLehkVHBM988fVFek+b4eEu1v9BO3BLyi9ySlSHjWBZi8bG6rNERaCiMiHuHN
         8wdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        fh=3juEiafton7v81p2I5ENByagOhgqiNFpvLnqFyg7b74=;
        b=s/WoUYF/glvwrvQ77Wu11gxNuvgzGcRYqqYvN9R1tp49fW3OZ8ve78tgu19pxJkmnt
         kuCNdGIwWkVM0g4P0pqiozHWet4WZH0MCjsBFkraOU61spGpWIwCIe/Z4eJBy4R4oAA2
         Zzv2Otve09bZ4ZSvPagd+NL8g9PDPONxkGFSa2oiXR1l9dLFcu53RFb89Exdnw7gqCUq
         8pGistB0xzkBJFAi+al3t1n8vNhx4sqbaNNJ3ot246rzP1+zHwOkcxzmCpZI+sfbKqte
         K8C1ur3PnpX/60K+3k1WzHflW+MSpS4g6rUDJYmQWTwfudpen9RL7+L94Y3QnMt7//Q2
         g9lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783907793; x=1784512593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=UBNOSB+ilX6o7XjxkdWoZmFRkFAf+gXVP4yORxJKTbfsImSMnkB3zvxLR5/jyjvrBa
         VmAb4X0Wbi8fE7Tu2stNgQ6MwX29lq0cJArqr9e5fL9NCFhE/Dpgy8QXJLomB7Gih76M
         xYHqjRwIqa08VIqYwbU5E2O+1RPwQP48kProYe7QpDaSs1rB1sYTaaPatN0pmY5UAhVF
         llLBLwAwu4Rge2JK+hIusNKo4qeTrFVCCh9O7qro2A3ALsOFR9YVM/D/I9AGPrkHGMNm
         T21rTdw4gLzOjYQHqlOt5qvOBPG9QMtVX9QYHWd3hMgfeug0BcBP1jAj37E378thiDWW
         tfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783907793; x=1784512593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUItlZ1U8huwaHjPN09ycPTspoOfanWPZUQOpXtc2EQ=;
        b=PWlT03RmZJwqZpek6qZ+LNwEyccjt6VvzsBqhLuhfSa8PcwXNO9bWnMJznAGVvNl3l
         knf+7a9jo5osrmsf11sJz2PsHgdmrvgtvNejCgL02gPrcj7UqAasVMOrFtyCya7ifRhS
         7WDf/D068iNw/rWk6X78BXrIPcqt2yLqB5b08deChL7AA95rgEtakvKcbM1nnteXzGjW
         KrM0ZTunlE6N+WOKpfJpRIExfIx0Jq8/0rnqj0t0JudOF/7K3OymgBzNFeG6jkJngj8M
         1v7FwT+RFvRkbc9HXtKn0vn2iPTQaLal7ucJNEYtjOzGX91z9qGDwKjikpb2dnOHjwvK
         LDYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoauJ8EYqzjdq7GRkiUD5PjODctK32z1NPwwbHJEANZf5U13XOIaPcXlWITckett8uXGsFAbouh+Pk7@vger.kernel.org
X-Gm-Message-State: AOJu0YyapG3jBFKUULHWKs2OmVFcHJE11A+ZJCdQOqXooX5zQanfcN3I
	5aGV6JFUpHRA8VPGaUQj3YYYjtV7ju/tgOVe42eVl8PMqni1lCmuhtB4mm6q/eWziYSercQcI5t
	TT4r7ooKGiWSM3SRr/GaRP3cF0WqSNkM=
X-Gm-Gg: AfdE7clCfU18TjIYoySpZhs4Lr9tNJXr45rNlpIdrRnGF5u7gEJyHT2H4bT64NP5pY0
	ok9ahmV+G0Od3mn/lgcUbHa8KqXVVfMdGVl7K2R7eWpE/qv8EnCtO3xd6xEfwi0GkHjX+Gnq6Re
	bp97Dl1WeTsj3aamar0MULqmhtTLjpOMUKEvanqrQVv+Nnkwwn5OSUEn+TxZXdjXv+/lX1Kjtm2
	LAbqQ0rw1Gy+TFNo/7j4HgmFx2kIgSxlm3itzdaRfdd7mV1uuWRutPxdbB8S/Ylqaf/WskrslWl
	ucGjAs4EG/r54QFFwXBM/Kn9GM+D/Sqozhvo42ZnUs32BP0AQnUD9NY=
X-Received: by 2002:a05:6512:6690:20b0:5b0:312:21ca with SMTP id
 2adb3069b0e04-5b0235618d0mr532700e87.2.1783907793142; Sun, 12 Jul 2026
 18:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-3-chenyou910331@gmail.com> <alQ3mqUPItCP2CVT@inochi.infowork>
In-Reply-To: <alQ3mqUPItCP2CVT@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 09:56:21 +0800
X-Gm-Features: AVVi8Cc9hd60uzXZYaT-84HPNgylmi-obZShd-I5Pge22kY3ToKnXYlACPAQfyQ
Message-ID: <CAKspUhLzgYPAxTTnUPsPyoa0Pp3519qFpXxmjXEwCAOHkihFEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You should follow the device address order. not by the device name.

Right, I placed it next to the other GPIO nodes by type. Will move it
to the correct position by unit address in v4.

Inochi Amaoto <inochiama@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=8813=E6=
=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 10, 2026 at 03:59:16PM +0800, Chen-Yu Yeh wrote:
> > The CV180x/CV181x family has an additional DesignWare APB GPIO
> > controller (PWR_GPIO) located in the always-on power domain at
> > 0x5021000. Add the node so that boards can reference GPIOs in this
> > bank, such as status LEDs.
> >
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> > The base address and interrupt number match the vendor SDK device
> > tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
> > i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
> > via the onboard status LED on porte 2.
> >
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/d=
ts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..25ad2bd265d7 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
> >                       };
> >               };
> >
> > +             gpio4: gpio@5021000 {
> > +                     compatible =3D "snps,dw-apb-gpio";
> > +                     reg =3D <0x5021000 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     porte: gpio-controller@0 {
> > +                             compatible =3D "snps,dw-apb-gpio-port";
> > +                             gpio-controller;
> > +                             #gpio-cells =3D <2>;
> > +                             ngpios =3D <32>;
> > +                             reg =3D <0>;
> > +                             interrupt-controller;
> > +                             #interrupt-cells =3D <2>;
> > +                             interrupts =3D <SOC_PERIPHERAL_IRQ(54) IR=
Q_TYPE_LEVEL_HIGH>;
> > +                     };
> > +             };
> > +
>
> You should follow the device address order. not by the device name.
>
> >               saradc: adc@30f0000 {
> >                       compatible =3D "sophgo,cv1800b-saradc";
> >                       reg =3D <0x030f0000 0x1000>;
> > --
> > 2.43.0
> >
