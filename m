Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D113A1D0A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432238; cv=pass; b=ray/AereJKHvP2bb0GImSJDViC2Z0+LS4dS6rbDMJ6MukXOD+CJmBavzAUpnyYHgaKT9xnruOivWmPL2q3AV/OU+n1r2RJrYfvaQDGigBv+Y6WHoLn703uuLQ9mH0SedJVAs3D2SMjJF3RZdUMWuE63tOsxf6bR5XBarZq62xCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432238; c=relaxed/simple;
	bh=aiSVuAMFyzPKAzJTJDYZxW4eA/pbkXu4TdDmr28NT8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2xAIOF2Nc7oNgQKuHxGz5jSGImVnVSt4050nmOYPUgN1bbQNdFYVRKEu2ILxtwWWO2CwxF/G0iB5Wy7FnHNrRprWauELG8kFMtK7MN4cVw1+lSa7fDfQ4JNENZ3n2Tr/lUqoOK/zd3LD/Khe0yqje0GBOAKljemR/cP+bnVhtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqOR5Yi5; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqOR5Yi5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so4159449a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774432234; cv=none;
        d=google.com; s=arc-20240605;
        b=jB5dtGUdk8Nz8f17cEMkNKjsYksAOqptZYt+OEF7+n26aLtXMukTG0rJ3FlF//UF2k
         ODw2oq3GbwwebZD1+TvWSqZNPue9Uw2fG6MxVooYgRPTmMb0Ly2VOdtZ5WOvEBnYV3NX
         tT0hcVj589Db7qt1N191M2xmMPn3BlDu3SaeGIPnCoOpgdLSLse5p4Q3AYh65oSJjuwY
         Q8phTNNpPe72qelocnDZrziqPlmbCKphlXZyrXGgLqpdzVstlfTynjC4y/skVfNOw62T
         /ciXvaU1tmbhSaepQMztm9LuovWQ+wVu0yGy96+ZBhYirE3kpA1SZCdMtZgT0gSz2U5u
         pO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        fh=oUHPpKJJK0ceUObzlEqE4Q2A95rDT2X18TJ94IEU9Xc=;
        b=OCBj2lBhRDa+IXv0A4qk1m2ptMbJNylG1GVkzsQkMTiZ2oP11fyFBwn0iOnq1lFjE5
         47BBqOTSxUPIaKAL8lV0stbott1+9JhWz/mqq/GTMnQpTahF010KgKGsXnx+URgHvAj1
         2oSLvtEYMNaNr+MIydVVkERgNGVB6oflC3670YdmhgCiUKPMMs/bTdLN+LDMrhf2AQSu
         i2rN0EKGGh7fDz+IeQxGYCTnURr+HVpnobU8J3/MtgIjorvRRzL/RneYQWnu6MRhECJ/
         +GhpIubTiy3bf9SIodiAWawQ4mTmEH6U/48uWtXPBdO8TL3xPPKOziY3YDFpCoVQBI7p
         KyFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432234; x=1775037034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=hqOR5Yi5QOah6+kteLEooDf8gErduAQpk0q9lUjCXUdXnGBRPQFcyf0RpJQ8qwvP3L
         2rYxuflye4Yp6NKobnH5DxKDM7FQywHYOWGw2P+Ma48bRzI/j4DiuIE70/gOe0rK9j+W
         VItqIyNBojLF11zW7gYLn3/87sD+NijAu00S1UMp0+EROpoTnGKdhBed9r7cQkGmahx7
         OaKe7LkvxwOO8ovzJ9UEgc9t8ahpzJCV6RWoIblteBYPExLMS6sVJJbFSnggg9dLA1AQ
         dwl3NdWWWndikxNtngtNHZ/zqg91UfAOvJXbfiG+gABtVf2uMkh2bfj50m67X0X3CY95
         ISPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432234; x=1775037034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VP0SehC+D3+hhDWyfoKCodtXephnp1PrBhw2LiSs1TA=;
        b=oAH4tn0PyihxdLg8OZrlYMlja1l6MDHoOomKk8zgY3rrL6WmE8Jo/S/mhMKXyVyiEz
         amIcvMwAdSWSwfiCADldqzi6uJPfQOQ50InV0nhByHalGyRfjyuaKa7ACUFPSzbnf0ns
         00rh8lq5WH+x435xKsCsXF95iIzQBgOSponsQL9I1fSHjXouNlxa2+v3Pw26W5kjmKVC
         D1uEzbF1m/eHucjWWkL4uncx6pFmOWFf8z+hnoeT/a0rbqu3vWQWHgDrdYkjgWE7oYb6
         hFdNkHEK6gXcFNWSjgDJkUXkDdtl+TVP1Jt9rOvH77bkEGJxcBnjFPGyJaE6gFYxahBp
         S/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX0jE/ZksFZOO7mlZ6T3XB8k+XuFSyPbeVAtvE9ApDmIJvmur0YHB6/yb8DB4GegzyHEalOmegv/RLj@vger.kernel.org
X-Gm-Message-State: AOJu0YyydqhCoePe3OK24+eOWvdf1yqoaOv8ExDs/F1/bNR7xRxU5XqX
	svyjc1dyV/Iy7vOfe2o5NCo6rhyPIoS29CU+k9Ch82MxDNPqiXjvnxgHgRG0k1AXyl+AnJ3QtEr
	9ESXFUwFtFi150QN9f+a6LU9i5SDj4m0=
X-Gm-Gg: ATEYQzze3XMdlFOonfrBetHyKCTWkE/wsfCk+gkoQhGeUKJDSpI4NyZUacW+WL2L+vh
	z29q1spUrTeACkz/rkluF8zkGgV0QzT2Sir7I07kXRixAjkmEuWoL5leTCwleULU9bAYR/Yh3de
	UnvlxUfk8j37nKaH7GDEjZReYwfk2+2+qnhOFHdtn6hnghQ2BvY+bdOsWLOPSHOezSRpGh41/z+
	DVJegT6x7LK2eEaLeLkakJcfFSi+l/AET4W6+OgREcukqq5x9W/I6NHXPwP5NocFElGE9yb1pol
	NRjLlMvy
X-Received: by 2002:a17:907:72c7:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b9b0ea7e884mr143299166b.9.1774432233910; Wed, 25 Mar 2026
 02:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310091054.2029912-1-egbostina@gmail.com> <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
In-Reply-To: <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
From: Eddie <egbostina@gmail.com>
Date: Wed, 25 Mar 2026 11:50:22 +0200
X-Gm-Features: AQROBzD-kPMMH1jFoji7rnPnjGOGNLf_VyIguCX0e1QYp30ObYBIhsUdhFbiTf0
Message-ID: <CAEFOc61tNbF+cE0waQpfvuSe7enJkDk_yzcGXZ_-D1Kvj_5G-w@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
To: Frank Li <Frank.li@nxp.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

>> Change 0x41 to 0x40 to leave the reserved bit cleared, as
>> recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>


I have not tested this on hardware with the bit cleared, so
I cannot confirm functional impact for sure, but according to
section 8.2.4.238 of the iMX8MP reference manual, bit 0 of
SW_PAD_CTL_PAD_SAI1_RXD6 is reserved with a reset value of 0.
The only defined fields are PE (bit 8), HYS (bit 7),
PUE (bit 6), ODE (bit 5), FSEL (bit 4), and DSE (bits 2:1).

Both 0x41 and 0x40 should result in identical pad behavior.
Leaving it set probably risks undefined behavior in future
revisions of the silicon.


>> This also allows for
>> easier conversion to symbolic macros.
>
> Can you send this patch also?

Yes, I will send a followup patch soon.

Thanks for the review.

Eduard

=C3=8En mar., 24 mar. 2026 la 17:48, Frank Li <Frank.li@nxp.com> a scris:
>
> On Tue, Mar 10, 2026 at 09:10:53AM +0000, Eduard Bostina wrote:
>
> Remove RFC.
>
> > The i.MX8MP Reference Manual documents bit 0 of the
> > IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
> > IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
> > value 0x41 which sets this reserved bit.
> >
> > Change 0x41 to 0x40 to leave the reserved bit cleared, as
> > recommended by the reference manual.
>
> Any impact if set bit 0 to 1?
>
> > This also allows for
> > easier conversion to symbolic macros.
>
> Can you send this patch also?
>
> Frank
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > index 242fa930b..a78401d11 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> > @@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17                0=
x16 /* DSI_VDDEN */
> >
> >       pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
> >               fsl,pins =3D <
> > -                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x41 /* GPIO_P253 */
> > +                     MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08              0=
x40 /* GPIO_P253 */
> >               >;
> >       };
> >
> > --
> > 2.43.0
> >
