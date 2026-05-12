Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939264DB55D
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566446; cv=pass; b=kBLi0LdjRVb4a9QjXuwFz0W6Qm3Sqh1W0jaXRjS0Up9MnHQPyQK/EXyXifHfkCvK1dDZuDUvknRdD2Tmt9lpiYAu+s55sxZhNneAXaqz3I3bM9KH06f7fXKK/6w7wjH2BPGyKSGZjOOvcn8ycEM+Es/VXzTViBbmn1k5dCwC5wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566446; c=relaxed/simple;
	bh=3ld4zdEky9JiorADEB2JzKLMGmxL8CZq09SENbVMLTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5FQeAIQlo11apz5RKq30FlmLI/Ob7iTtWrFe1NlO0V3vQEVGkhAEtoeCbV0xAE1hM4/fRHqNI3aK/jYT5fPzfEV4hNHrCJ8bL3I/wAIFHFt3GH0FG3J6UD5oeW0EgDm+imfUXGgNUsdBFA3N7pcp4F93sZfoi2G68ukwf6flc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6JVSg17; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6JVSg17"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso5029029eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778566432; cv=none;
        d=google.com; s=arc-20240605;
        b=ltxmB+6NHoWqDUufKDg2z3RLbWvbunY33gvagUwyFio9Ab39oy2mkCg+eAO10EsXnL
         ZPmQfJtOtj/4TeQ1OqK1C+hdVSAQCWjThF+xDrWDtkAHra1SBl8YyXLpfvG2iLaOVR/z
         Y4NTeFRTJhpgysjD7rFOqeJdSTXkCpYoSo0LLJK1c6OT2SGdfZ+94IjVSwVSTR68WSfm
         41PkseSwwtLpT4YQD4HiamPTRkDB486/M1ELvLxa8gErrDfTJEgDhCPVpCbWrvJM/IZS
         FXW791LncILA0nxuhPwBCcAEqOcrDuwdaxe6/kUR2c8soY2n7xRhNmv7etbDAUy5qOtt
         nRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        fh=oUy8TJUFbLxySLMDbWXqLflOlref1OLYCHQnkYYaU3Q=;
        b=iMVlS25F6960YcLZcy7AkkhtOzpnu4wXEzxLubXHfsFH3AOj1rlfliEXTd7hwFPuRj
         A47XlbS4w2Zxpzm4OlEA6cERRloPQqnXkzqSEvYwAgRTqnz/BOVpZ+qtY/XZjne78nCG
         NexAXDzM1OZhrwkH9a29aE+HvU+SJz9QR+MyvDkYtuNJJ9XE3k8Kw8kJk+8hrilvEMVE
         OJXNQqonWgbVA8FXhGJjrAnkfAkbM36tb43oHR0rJ/6KE17SSRLe3vSZ9pe4lmjcEruX
         KE1IiUScPRG2weI1nBuNeQVjBL+IfcDTqaCsPpDX9BPhImCwZZeFSefJsonSL3w17Ecs
         NGdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566432; x=1779171232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=P6JVSg17mfG3AE++SHupyqKkJLaPPzom6Hym1yhnh9DOVxBji9AnJ3hls5QLmWd2TG
         ULq6zRBIkTtCCKHl/RGgKcP3NwzPXDUGKuv3j9xOZ8IVvN7cTQQtKwh1xBmkhS8Ip/dI
         gwUXG/gIKMWiY/1fAKKkeyuc5gMhyUcg18cf0fLz4gsWYuyey29l/rgRHUkaqPujaeyM
         aTmavwGzzsnO71xErdMSJdx5/+ZnQ5bp+9d/1ZzFEsd8MYd3HdaAOrZhEBJa7d0v7i7+
         vNVEUMU3/83mySnyyEUsL1VgvgozYrJEg2+UG0n2xUEJj733OO0F0x7ngpNZ12iyOWIL
         JZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566432; x=1779171232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yr8QRs98bsPiw0gF0kGFiK+9h78W1fGBBJoeOfjYUCc=;
        b=KQujIDYwq0MTCYWBBxDlyTMsTaq8zDnWHgnN+fGo7MCakA0suZB6u++6wXxWlw9hby
         ggqRwb5Xc2RSnrK0eJy7xWtMdATyS2YYHzDrzGDtQELLJIFWsJCDNxSdV+OtckSe7eQV
         reDnNhjFXsyi6UdkFfL7LJ6WFbEVJxdPfHmqHIEGIDksQdOYr6QkgfwoSAEuhtJfD38Y
         G9Wu0wnjuLFJ29oKzDDZUbziTIGpqsqbkljhaCatv3TvmKuVU/rUZL5mUj0EhrDNDEGX
         AiantGHPhpefmuOrKK93lijOJE1IZTApyjaLlnt4A98SDXpOXXmCWUDTw0Uupp04Dtf4
         sSqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9svmWIjCg6DJHxUv5+P7MnFjIgwa2w/IcKiyWwF+brC+kM6nXzTtcwhRKRP0Qs++iRRDmzeBJKRs2H@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7yuQQTw2oV6pMris9UKIO9GXCwqBoqYqlRKq2sZlwaipOOkP
	shjgykuqQmF+TqcoUVLAP0jZzc+k1mA2FWnS6OTLCR6L8X5PfUV3bawZc+8wY08lpVw0txiKsvZ
	ElqFZqpWbNK/++97eXvVzEnuuRC4/8kE=
X-Gm-Gg: Acq92OFVkPr50n21otXGr+0pfJSHAepIMkP1rZ9BRxqKKQH5unoRfQjxMAB+YCoRywQ
	v9kXz2kivxRBihxUeDvDsUc3OCAvG4d+b6XYuWyDRI8rcKNHu4amFGXg+8ioS3Jl9BM4OqMZEyh
	1xYR5S8miVSkGTkh2TkSu6S6XPBZ8yHZzDf5xfH6CvKkOv6RjIv4m5TW/zVl03tL9T3e4susAxX
	6k5bDkrJvxGWjB2tWuLrrj+9U6TUp3TCzqfFP1z5GDAprjwL4BimdM1hMHXws6aoi1fcVDBzvEF
	EJaxGp+P
X-Received: by 2002:a05:7301:7213:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-2fb4bff2949mr6162640eec.10.1778566431760; Mon, 11 May 2026
 23:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-3-clamor95@gmail.com>
 <agJ/T8nBGWEoblmd@nchen-desktop>
In-Reply-To: <agJ/T8nBGWEoblmd@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:13:40 +0300
X-Gm-Features: AVHnY4L1_bWZXCrp3MmGLMUWBEn-sMyg9m87GKXzm_vHqR-lTAFW3X_ZqIO7y3g
Message-ID: <CAPVz0n173syW9rXy7Qt_N=mChe6WBRLvjRDypcJEC50hPL4OMQ@mail.gmail.com>
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

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 04:1=
6 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> > If the USB controller and PHY are externally controlled, then the
> > registration of the controller and the PHY initialization should be
> > skipped, since these configurations must be done by the device that
> > controls the bus to work correctly.
> >
>
> I find you only control USB controller device add at PHY driver, most of =
USB drivers
> has PHY control, for chipidea, it has PHY control at core.c, would please=
 try to
> adapt for it?
>

Usually yes, but this is not the case for Tegra unfortunately. As you
can see Tegra specific section of Chipidea driver specifically
describes why it has to set PHY manually.

/*
 * USB controller registers shouldn't be touched before PHY is
 * initialized, otherwise CPU will hang because clocks are gated.
 * PHY driver controls gating of internal USB clocks on Tegra.
 */

So in order to provide correct work of USB when set by an external
device, both PHY and controller init/add must be skipped.

> Peter
>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-----------
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipide=
a/ci_hdrc_tegra.c
> > index 372788f0f970..593390a818d1 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -32,6 +32,7 @@ struct tegra_usb {
> >       struct clk *clk;
> >
> >       bool needs_double_reset;
> > +     bool externally_controlled;
> >  };
> >
> >  struct tegra_usb_soc_info {
> > @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (device_property_present(&pdev->dev, "nvidia,needs-double-rese=
t"))
> >               usb->needs_double_reset =3D true;
> >
> > +     if (device_property_present(&pdev->dev, "nvidia,external-control"=
))
> > +             usb->externally_controlled =3D true;
> > +
> >       err =3D tegra_usb_reset_controller(&pdev->dev);
> >       if (err) {
> >               dev_err_probe(&pdev->dev, err, "failed to reset controlle=
r");
> >               goto fail_power_off;
> >       }
> >
> > -     /*
> > -      * USB controller registers shouldn't be touched before PHY is
> > -      * initialized, otherwise CPU will hang because clocks are gated.
> > -      * PHY driver controls gating of internal USB clocks on Tegra.
> > -      */
> > -     err =3D usb_phy_init(usb->phy);
> > -     if (err)
> > -             goto fail_power_off;
> > +     if (!usb->externally_controlled) {
> > +             /*
> > +              * USB controller registers shouldn't be touched before P=
HY is
> > +              * initialized, otherwise CPU will hang because clocks ar=
e gated.
> > +              * PHY driver controls gating of internal USB clocks on T=
egra.
> > +              */
> > +             err =3D usb_phy_init(usb->phy);
> > +             if (err)
> > +                     goto fail_power_off;
> > +     }
> >
> >       /* setup and register ChipIdea HDRC device */
> >       usb->soc =3D soc;
> > @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device=
 *pdev)
> >       if (of_usb_get_phy_mode(pdev->dev.of_node) =3D=3D USBPHY_INTERFAC=
E_MODE_ULPI)
> >               usb->data.flags &=3D ~CI_HDRC_SUPPORTS_RUNTIME_PM;
> >
> > -     usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
> > -                                   pdev->num_resources, &usb->data);
> > -     if (IS_ERR(usb->dev)) {
> > -             err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> > -                                 "failed to add HDRC device");
> > -             goto phy_shutdown;
> > +     if (!usb->externally_controlled) {
> > +             usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resourc=
e,
> > +                                           pdev->num_resources, &usb->=
data);
> > +             if (IS_ERR(usb->dev)) {
> > +                     err =3D dev_err_probe(&pdev->dev, PTR_ERR(usb->de=
v),
> > +                                         "failed to add HDRC device");
> > +                     goto phy_shutdown;
> > +             }
> >       }
> >
> >       return 0;
> > --
> > 2.51.0
> >
>
> --
>
> Best regards,
> Peter
