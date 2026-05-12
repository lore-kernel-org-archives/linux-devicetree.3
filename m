Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07BD3ACF16
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577257; cv=pass; b=gAUCUQ9n7xNHiLgYQ9C1lWW00loHonldLPZqw2J+SnU5m6vb+Vahs761z8MzaoS9AZSqnr8z/t5S0Plx9B/2bSQrQTxf0DpsNakcEYu1d+O16USpAQINXbyYlxMtWR/tDMGdC59AR/e+fvyXmBzl+QDLHVO5ut0ANFEmT+33lRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577257; c=relaxed/simple;
	bh=U5Mj/jS6IBak6dPGMQzKnxIz7rYyqJxSv4wWkZocyPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrC2vUjC16Q+cL7DVkIUxXJ50pIQ0M+Ma4BwfC2j+5pCDx8G3P0nd10j3jVxrmzGdLmZ56iWYGmDNNDHGmIVygltX+N6Y/S+sHB3XqYFqcrzlRcDe+uWOu0kvM4/ZITKlLLdz2Pu/lhaUMmcWTFWYL+VoMy0WNl79TAt/PIGIoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSPEDZuu; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSPEDZuu"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so8049978eec.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577255; cv=none;
        d=google.com; s=arc-20240605;
        b=Y13dhCFFst/0dq3n7w/4NYDnKWENnal3LybY67rwPJ45xH9Ajlq2CTnN5vn1lrRxm2
         FT5B7Ljv72THXbTPvQ1yVlfHtzSYeXyjg6RazZzk8nSneo0tjr98kCO6WyE/Yy6svYe/
         csaeLxQ58/bKgyok1MBvzgq9hwHH7uSjvK+qsHesljxaPPGSfdgEx0Wtjbt32pvKsMCi
         x4p4yuNzQBe5ZDaSs6se2YzRzZ1KTC+SFsFsQpaDb0Y8i6uPfoFOSvKaLt2HD3Y8Tf0d
         seOiTEmFIMpkVXlPNY9hYXMO8QQyP2XqB0NKXPgDwbv4eQhpa37F33TEJZttlxlrbalv
         amfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        fh=mBzrmx15WkDZ777i+dcPl2cOiSzINX/mApdsoyvsLXI=;
        b=It9v/P+Eh+TTkm6u9ZtiCanogJAPqT2Y5KsTKSNoszPrCGi1AihudjfXLMrrlhhW2W
         tCaIbNw48OIVCLv5DRNztBO0xE/vdxwPcLZZ9g2BlEkm7/jf1TJmIzrR0lcK31Jkl+dO
         ab88fPtwdgIcUcUN883ii2hdREGf8m2LAQiajRgcWq7TGLXMAsvksY1/WDWwxt4rdKDh
         tazj+laD0AKmTrw2eID73NYLJzZDK4gLl/GnzkABXDzYaURLqgIihw+fUgy0/mip0ezh
         8HaMcUmYQ1pRCk9PHHVCQaIg0shrSO+POV2qqgvN4sZX5aoqcncYBKGf836GZoumJ43x
         q5yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577255; x=1779182055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=GSPEDZuuZ31Z+22dTEDRByST0/vCvq68t1D91nerRwYoArdfxg7W5/Mme1qiOlepi6
         FRLzMnKPG/Tt1+YCHHImv/D0RmhNeMBfJA+SPH2lm2AQx8od/5IOkc1WOOQSXCgCHnrg
         1W4k710vYtjIOut8/9X6vWP3IUF/jy6semioFVQLKlJFCtnqht/jwnhEojw1Uc0KO5qh
         9Faqalbmk2+j/2LIIS2sYCblIukJuzBWESC+v/pAVADwfvDL8XmurbTCugzhCXJfSa39
         AawmXB2O1sSVRGAPCtVNnFmiJL49ZELzH+vIfuxXTjdtp+wWLOLutDHoXOdJqJ8PaQsc
         dz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577255; x=1779182055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLpXl5QYagjlZCBE/xNrRjwHqn2mCjrPyJN9NfCIzLY=;
        b=ScDr+vb80/HN4UcQ0jcIT5nqWxi4b6wSrthCOaMyx0fnD7wsfQlOEWdgIlUJjRBTx5
         lIq+HFTFdWgLRrPJgKK0a0MkNvHavmNsG81ZAH7ZXOvrquah0lCC15CcJUvH5pjyefi/
         FzjuCTPsm2JBlM/Oemk2Nd4jocFSe+itKc7Rj0jSXrc0iYgRSS3m7FaapFlLwTQR2Jsy
         HWERsGPNICR0Pp7VDx8/pLjK0t/ca3DyNRXqr+CY/Id+qFtIIdVv+tUMKDMw9z7m9Pwt
         3VKOQbyhmTo3D9Fnvyii6kF7o6U2nU70eB1yTp19e0BK4//prAljPLQlLtYDyjwC75+9
         BxWw==
X-Forwarded-Encrypted: i=1; AFNElJ8Qw5mrqLOFF+uR8u7ufpqNFHGAoIodMTTlqMd2kn6II8D11ssq7BCjCVu5LGudY0m8df1vjmcOH8ab@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0i0EE+tMJ1beNDYsnzk+hC3w+doa61hkQFFtlzRKBEcVMFYxR
	PaHvh32oG3OX6/FoT7zwaZutG6LCZELK0CSb86w9LsdX7jCp1i+RV7SjdHlxMS4RC3OOtlA3gVf
	WmaLJB2ZULDfgkxRscxCOElD6o9KIEdE=
X-Gm-Gg: Acq92OGBikhgSHGbhN5O4kiIJfPJTXStte9DwrWe/eq8UjFltV6uWVPcHgyKEId9tLG
	s5fRaIuiCkSOMXR/Eir9c7g9usdeJl1joTrq0Wh8x6nbH9gCli8JulxEL8TV6pHED5az1ab8lQZ
	USBCMQvMcNrz85JITSemr2IJNzXJcLc2e7PN2JTWiqu+Gg1MTkCikat0KOcZW1ySF9Ts4WZuwaF
	lZREsDb1eKQnjaF3++hJ3m2G+Un6IE74t6kxAJ1wBQpJW3LQomlU08wHKM31JWcNuwg+QFVicaB
	5k2h4yNl
X-Received: by 2002:a05:7300:6da2:b0:2c5:50fe:c795 with SMTP id
 5a478bee46e88-2fb4bffa2c9mr6829180eec.29.1778577254951; Tue, 12 May 2026
 02:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop> <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
 <agLb6mgP45jHjvNt@nchen-desktop>
In-Reply-To: <agLb6mgP45jHjvNt@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 12:14:03 +0300
X-Gm-Features: AVHnY4Ll14i93n_o4smARXMAmGSl_VWfrjFQ8sVQ8lXsJQoJqBmOJp3dhjRuJ_8
Message-ID: <CAPVz0n1Cgbik1_HvKO9i7ATr4OkS6yE_bwMw__yY_pNi0gQJNw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
1 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-12 09:13:40, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
04:16 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > > > If the USB controller and PHY are externally controlled, then the
> > > > registration of the controller and the PHY initialization should be
> > > > skipped, since these configurations must be done by the device that
> > > > controls the bus to work correctly.
> > > >
> > >
> > > I find you only control USB controller device add at PHY driver, most=
 of USB drivers
> > > has PHY control, for chipidea, it has PHY control at core.c, would pl=
ease try to
> > > adapt for it?
> > >
> >
> > Usually yes, but this is not the case for Tegra unfortunately. As you
> > can see Tegra specific section of Chipidea driver specifically
> > describes why it has to set PHY manually.
> >
> > /*
> >  * USB controller registers shouldn't be touched before PHY is
> >  * initialized, otherwise CPU will hang because clocks are gated.
> >  * PHY driver controls gating of internal USB clocks on Tegra.
> >  */
> >
> > So in order to provide correct work of USB when set by an external
> > device, both PHY and controller init/add must be skipped.
>
> You could call generic PHY APIs at ci_hdrc_tegra.c, after PHY init or pow=
er on,
> call controller initialization.
>

And what it will give? Modem used in Tegra devices exposes its output
as USB device on an HSIC line. At the same time modem requires a
precise control when USB should be registered, to be able to register
and unregister it. This cannot be done by linking modem's phy to usb
controller, quite the opposite, controller must be linked to modem's
phy.

> >
> > > Peter
> > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-------=
----
> > > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chi=
pidea/ci_hdrc_tegra.c
> > > > index 372788f0f970..593390a818d1 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > > @@ -32,6 +32,7 @@ struct tegra_usb {
> > > >       struct clk *clk;
> > > >
> > > >       bool needs_double_reset;
> > > > +     bool externally_controlled;
> > > >  };
> > > >
> > > >  struct tegra_usb_soc_info {
> > > > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (device_property_present(&pdev->dev, "nvidia,needs-double-=
reset"))
> > > >               usb->needs_double_reset =3D true;
> > > >
> > > > +     if (device_property_present(&pdev->dev, "nvidia,external-cont=
rol"))
> > > > +             usb->externally_controlled =3D true;
> > > > +
> > > >       err =3D tegra_usb_reset_controller(&pdev->dev);
> > > >       if (err) {
> > > >               dev_err_probe(&pdev->dev, err, "failed to reset contr=
oller");
> > > >               goto fail_power_off;
> > > >       }
> > > >
> > > > -     /*
> > > > -      * USB controller registers shouldn't be touched before PHY i=
s
> > > > -      * initialized, otherwise CPU will hang because clocks are ga=
ted.
> > > > -      * PHY driver controls gating of internal USB clocks on Tegra=
.
> > > > -      */
> > > > -     err =3D usb_phy_init(usb->phy);
> > > > -     if (err)
> > > > -             goto fail_power_off;
> > > > +     if (!usb->externally_controlled) {
> > > > +             /*
> > > > +              * USB controller registers shouldn't be touched befo=
re PHY is
> > > > +              * initialized, otherwise CPU will hang because clock=
s are gated.
> > > > +              * PHY driver controls gating of internal USB clocks =
on Tegra.
> > > > +              */
> > > > +             err =3D usb_phy_init(usb->phy);
> > > > +             if (err)
> > > > +                     goto fail_power_off;
> > > > +     }
> > > >
> > > >       /* setup and register ChipIdea HDRC device */
> > > >       usb->soc =3D soc;
> > > > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_de=
vice *pdev)
> > > >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTE=
RFACE_MODE_ULPI)
> > > >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> > > >
> > > > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > > > -                                   pdev->num_resources, &usb->data=
);
> > > > -     if (IS_ERR(usb->dev)) {
> > > > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > > > -                                 "failed to add HDRC device");
> > > > -             goto phy_shutdown;
> > > > +     if (!usb->externally_controlled) {
> > > > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->res=
ource,
> > > > +                                           pdev->num_resources, &u=
sb->data);
> > > > +             if (IS_ERR(usb->dev)) {
> > > > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb=
->dev),
> > > > +                                         "failed to add HDRC devic=
e");
> > > > +                     goto phy_shutdown;
> > > > +             }
> > > >       }
> > > >
> > > >       return 0;
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > >
> > > Best regards,
> > > Peter
>
> --
>
> Best regards,
> Peter
