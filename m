Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742D3C65FD
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102282; cv=pass; b=TojQ6oShUQX1XNzCItY2cVT0afufXgkFhtRM41MSZkQK9WTNtBHKQu3ZDHWFHxMGuqtsjoRfS3c9/L0CLFN3FAVhfXrDd5vWj3gRhHPeupfevrHP4/IeXoat55nd9KAmmkJ7L6BuhwgWKN67E3kscnq1OJbFhtB28nBzeaa3jWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102282; c=relaxed/simple;
	bh=4EV96JQm9dcVbfWRPQAuM7LuZkxzfemPOuDAZdxRrMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmmEg2YmN/doRtXlmwSlIU+92XlzRKPUaALMj/lGbVQDg3bIHbpQ82okctX1+7k2Qx32ZocnFwbSQoc3M/5ZJsSohIgbAfvvzCm8XOJ6Tq5tFYd87bKFdCWMc63COwNVtcAhHqznS/gmihliDpTtR3Zn3Vb4gadBEz7PldZTceA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5VZ30UP; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5VZ30UP"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15e0279316so85336066b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784102279; cv=none;
        d=google.com; s=arc-20260327;
        b=MVJUH9P31/JhWFSY+RWe1aLFNt2lGYVwzgzDSlnN+U2YnjdGt66dAC7ZX5KdliSEbg
         ZroFPy4Z23XTR+eVCe1bqfHWJlsN9JPQ0p2qUlV5o6dcrPG3Dhf8tByfqPsUxLpuvIKu
         oY3JP2MvbMAmpahb4vJ38AloLcKIHlbzxOPWx+LQbrlDvYQW6POgHYPtR8wv1tUpvWUx
         asea9/hhErwwd4gVShvO9jWJsks6ycNL95qgkeOIaM2mdH0dRFoy8zdxZ9dcYKXz52C6
         PkALtpjQHbdJM894bO4XYYPgscC6akB8gnJmFjFDqRb2SvNshis8xdNffhwTJRFFrl37
         tgbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        fh=WNyKI07wX410TBODGdS83ZdJgrQjAwj+pNXqCP60Yvg=;
        b=H7tpM+wMVSNKSxdnEKSkbj8pvlm6w3ytEYbGsyBFlMlpvmDpiEfuwWZJ1QTi/V1Nbp
         1lFGzd9AKCfULT8o9J7YyyCYbga0e5UWzE5CQVa8IKPN0OHVUWLaGv3tuaAf/mf1i3uo
         Lo4QD4yMr/7kTnMggf6BUvEaJ5C/mKXxT9oOQL+Me/c9XSD/401OflVvcmclDarq1CVi
         10uOuaiq/ioHx66tv6lk+IvBYYonVyfJLgmx0btZZktjELst3M/Abpr1KuwBvExlocCl
         FiC9VTMRO/p+H7WAAV/uMK9uT0FvYI6gFQBtBOgp/6yZ8oJIfwLCiQC94xhGaYtbDf9D
         rsKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784102279; x=1784707079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        b=S5VZ30UPxaQOYzUrF3XdoqpygIlSrwBPpYFNpJMZnpITfpEW/J5pSNZkmY670sMQ0F
         Yu+hxWsPMwnXklkamy7Cu7nZwKvOoTkJQo+k0BFn7i3HMoYrFqhfhXoUnFms5Ago141C
         HT7CL2baNN4o1xHMTgbEfCNdy9jbC+H+RZsodCqmxP9ED65um8AP/JX8YqZVZeCsYJHM
         6zblf2fG//PqTFOwBoBnFiq1zrre8SGhU51mYzXWuUg4egpSvidTTIY36YLaaYFZMiBo
         wDdsod+SkbPqSQlk7E0h/S8JJw/+kF48AddhTsGfWJPaDcU1HJn7uzMOtasaKKsbLXAQ
         gUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102279; x=1784707079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJj9Wc7Rwy3gTAMQK9yQ4wfZtHEgVyepO/YIt/wDURE=;
        b=Q7SxD0b/xUNOj7YhPeqjJv+qp+xSecNVHIBZRX6lSB3Prz8TAgWE8WsDBARoptLTRF
         E3Q+drqKTk0RXxie+NIse2LxdO+qciGX3wM4y1yKoOad2Tqmo0WLrUHtLXz+xX4HKYuw
         qraF/4P2OkfEz9FZ6bTVEO/YHM5hboWdS0j2xdmTh/PsM07ZR8kSaRQYql5fPJOHE2dH
         e40+fqTrI7aoZ2lMIEhEIuJYrvr4Q5ZbXc3TXV4v6mMi7VCDzHODQKhW5ElNRq4D/anM
         jtvPyf2HphMLEUWod/bwASCfDqG3RIiSczIbM6qCt0Si2B1oPnMutffRZ6xe6exTeqrq
         TfSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHHk8v0IZPZp2hWxOriB5LK7ZJKVa70Im6Rus+R9XVIeD6GmIrDGsjF55M6jTngcuGz7ccSZ8yxE01@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZjsjpPV6GR5Qil6LGs/flHQPjRRXpkncAohC+hDYY/t0ZgF2
	1LpGSvb4Zte+tCVT6j9npAeQ/ned3RsoVDvEYwQUrJSHbEl4GYzDGzmZeEA0GOVgoULm01z3JfX
	AzUz5veaoYh6nIFMP8GgCaPzW4Qi/6zs=
X-Gm-Gg: AfdE7cnlS9BN3wGBlgvq3yj9k3JcRHvSOzLoK6hE3pVGmiDMklzYUDN+DlVv6VutUFX
	gL7W22XjiOCaRtBUmWQ4FYs9jVpyPyn792NBRfN/ShLd+xMbJ7oUT0gYqPgvbenQJUn7hFa/tyQ
	eQK/TXCx++2oGOAm7phq2ae7MOzMcZtqANP7TfqxpVqF5TdEYCqDGAty+NmtjiGfl5/XUlL4bpT
	uSIWrhAqnhLZ4Vc6DwnL7UCljbYNo/576ygxB9FTKse4FG2NhU0Ku26DMGIobETBegeg8pjdGGs
	FCVODZGjAFSRoZvPd7xCKw==
X-Received: by 2002:a17:906:9fce:b0:c16:11b2:ae9b with SMTP id
 a640c23a62f3a-c161e98c3ecmr826018266b.17.1784102278649; Wed, 15 Jul 2026
 00:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com>
In-Reply-To: <4823c1d9-51d9-45fa-a96c-f2caab1cb29e@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 15:57:47 +0800
X-Gm-Features: AUfX_mz1XbF_hj8SltUaP6VQCiYz735WcPjxUivwpVyatqEOGiO47eZKOAvcnaA
Message-ID: <CALj3r0h4cFd-tp9-UVxihL9-a1W7_4nvnKoXW_cP5WECKc66Hw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B47=
=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 15:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 7/14/26 21:08, Coia Prant wrote:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that is accessed
> > via APB3 memory-mapped registers.
> > This driver provides the glue logic to make the XPCS accessible to
> > the generic pcs-xpcs core.
> >
> > The XPCS block contains four MII ports (0..3), each of which can be
> > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> > The hardware maps these ports to different MMDs:
> >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
> >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
> >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
> >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
> >
> > This driver creates a virtual MDIO bus that translates MDIO operations
> > to APB3 register accesses, with proper address remapping for each port.
> > The generic xpcs driver then creates a phylink_pcs instance on top of
> > this bus, allowing the MAC to use the PCS via the standard phylink API.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part2%20V1.1-20210301.pdf (Page 2078)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> [...]
>
> > +static int xpcs_rk_probe(struct platform_device *pdev)
> > +{
> > +     struct dw_xpcs_rk *pxpcs;
> > +     int ret;
> > +
> > +     pxpcs =3D xpcs_rk_create_data(pdev);
> > +     if (IS_ERR(pxpcs))
> > +             return PTR_ERR(pxpcs);
> > +
> > +     /*
> > +      * The XPCS may be attached to a power domain (e.g. PD_PIPE). The=
 domain
> > +      * must be powered on before any register access, otherwise the S=
oC will
> > +      * trigger a synchronous external abort (SError).
> > +      *
> > +      * Accessing the XPCS registers also requires a TX clock from the=
 SerDes,
> > +      * which is needed for the soft reset.
> > +      */
> > +     ret =3D xpcs_rk_serdes_phy_init(pxpcs);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D xpcs_rk_serdes_phy_poweron(pxpcs);
> > +     if (ret)
> > +             return ret;
> >
> There are 2 unusual things here.
>
> The first one is that you manage the serdes phy from the PCS driver, usua=
lly it's
> the MAC driver doing so. In stmmac, we have the serdes_poweron and serdes=
_poweroff
> callbacks to hook into for Serdes control.
>
> The second thing is that you're setting the serdes ON at probe time, ther=
e's no
> dynamic control of it. Usually we try to only power this on at admin-up t=
ime.
>
> Can you explain the rationale behind controlling the serdes here directly=
, and not
> from the MAC driver ? I don't see any mention of that in the commit log, =
and I'm not
> convinced this is the correct approach.
>
> Maxime

Hi Maxime,

Thanks for the review.

This is intentional. The SerDes is attached to the XPCS node because
on RK3568, a single SerDes serves all four XPCS MII ports in QSGMII
mode. If we managed it from dwmac-rk, we would need complex
refcounting across multiple MAC instances. Keeping it at the XPCS
level simplifies the design and prepares for future QSGMII support.

The probe-time power-on is a one-time initialization (mode selection),
not a runtime power toggle. The actual power is controlled by the
PD_PIPE domain via PM runtime. Also, phy_power_on() on this PHY is
effectively a no-op; only phy_init() is required.

I considered the stmmac serdes_poweron/serdes_poweroff callbacks, but
they do not handle shared SerDes well. I am happy to rework if the
community prefers otherwise, but this approach seems cleaner for
multi-port setups.

Thanks,
Coia
