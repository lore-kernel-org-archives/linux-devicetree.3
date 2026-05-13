Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD64DBD6B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693424; cv=pass; b=epn1FVh0zw04gurkqfTo+uL1RMD1sdEGvC1sqge/doF2VRnHNeoogo4mu3aKhaTZVCTFBJO2gCAfFj7H5kzSvXMZPBBMiR8MH1SGSinWsyymCzPHQ8wRBMGvAHEkC6gJCSYOFb9J3ZIX2+g7I9A+vvs762mxX2XtQ8FXaRURXM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693424; c=relaxed/simple;
	bh=JPLT6FMeldEbFhJ09K/mL4agPV0DXAvQaThe6y1REcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9oY64XKXDvvr0UJYY28qSp47EmLIrpo4mj8QG2QFWLeIkUVp/jNS/WqLQrSM/LdlNWOx6CKhCC49aPiR7UdratEQiLgLR1Jjq7iY5mDjGxh2HHrRMqf1fgsKc0bBb4iT8pF5l3p0ZZVPHoViix35el4pDbL56R5UtIFX9LFAiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Myb2qtmm; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Myb2qtmm"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10376533eec.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693422; cv=none;
        d=google.com; s=arc-20240605;
        b=VT9vUcNppJg8qCcKs23W5QdXTNh1XEGqMAB9gQcbRj30fD65m0aPUHeub65vv6yHCF
         wLXDVCxV8T8HCR1empKbaE+oDvF7JJ0dqdVMEswqrQTGWbzV1J56rHK8ucHIfGGdN5CB
         zpJBcRkSEsyPbN4z7mpxmrHaIVmB4rmaNPPs+rdLnA+VbxMajxzgTgC0G+XQVhcFrjw2
         t12hrHACXPintYVKDAuOe9q5eLIQhag5VBuCmcT5J7OiS12qYSbHmfwJ8oLlrKNYbXLn
         kzKULUnY0rPxHRZnD2oMiukelVGF62estHqvRHYAQlbAnU99u4mtotJvppBWw616Wjcw
         s/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        fh=GINv9TV4iKleSV2vl0wEFWScu6SJ1e+Phy8wYFG31fI=;
        b=ThS4xrCfqgSgOMZRg8Lw0eIEwgXO5svJDMHhNx/Ct0Fw+A2UVoU5Gtb/P0rYzDRe2A
         dDplHXsptza1ZkfnKvXXqR62EtAjDPNEQB34C1NNVVY9demObg2SSAdhpBmxV9CmAiac
         AS6AidSeQwtK1DmZLhAt4xeB0Jby/TOR4cYLCV/I5M87EZlcTqMRQW9+z8qvaJCuN7rs
         lmhmxy/sx6emZn15qBNYHcRnRX9GKqwX1IlPDj0RLa7zgW0m2Utjy44FJuor41ojdhou
         MXE+RWvSzmFhADSZ1FoTwQYMuXCqYSTXxnsQOrLizpVTk61ZyIDmqknhp4thSgfMzU+L
         PfEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693422; x=1779298222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        b=Myb2qtmmEWFHOlXmcUwS8JtGLmsuI7inrmcQU+iPTH42mxnoa1ZxH9YLyLmmoPoVac
         pTB+UbXzRJ9vMcAYAcvh7XMp8mWMm+QAX6m2+HZKbXJk6pSNXB1rA5D5HpHpvI+XMj3Q
         /Ai7ZLztC6F9LvQUrKNwk11s+jjCqsWpuddo0O+K4vlBS0xLHZu1b4/I9yK8Aj6Hqey2
         94SKVCluyhtdUv0ezOIkw9yj+cGUpOrs9Zrp3Ut8bo05fMomAOF9qoBpaujprOYUMmtp
         gI+KIN9inWDtqC9bxQKllgKE0p7uf9EoUCakd48EApwwOBJCCplAWHdiRy/GNfgsk5wd
         7jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693422; x=1779298222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDUAur+XoWH6JFWlom4UBKGDg0H33xYVizwbBkMvANo=;
        b=iTZJY1Be663MqtpuZGPwVWIFpyZ0bbLvbYKqMGvHaoR4iLr4apD9sTYQh0bJ2DvhgA
         rU3d7DRruMpqRc2LBPdWxEMLQGAR+yXoIUDddzZlacayg5e9quJSZ5lDaZhlXaHfStGi
         2RRZvnI0E8dnruTOXsUvJBoMJqqwI3iRtgCdxEM4POsw/soCa63MN/hVfvz3Jp5YrsJO
         Xwtiob7ND9FH7ufUTh3rT9XCfXpx8Xz3RV5/XzNQMVRf4M7W7eJJcxcy6T2fJFj69CxD
         29NvricNMrqssG8AadGVi5AG3AEMQ8wTV60WLOpaeEDGkJfRbuWn2zRDjZu+RKUtiVVX
         qppQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZYDOwNLcU4BABWKbAE2ki+qL1JzQ0PVwARBGsk4/bZb/wjlnZQP/qGIzi4AjEFeXfRDrJNoLqOE00@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXIuDJY9SwqKxejYUBVjkElkXm7Cn48hVvRTWYaRQebYLOAgM
	2/GnhDTfjU49veUgpiCInYJe4c6L4tR6D6ScApapFtBEO7c6QpScGGNuAezJVf6n4rSk+MItwmW
	PEWE+aSjaQgA+6jsJQ2V4eu73GGl7ONc=
X-Gm-Gg: Acq92OHQ3nuSchMU1Km1s7icQhXP1exmhG9MYPFj0O98/pdK7lLpLkcS6dBurPs3KNT
	otKA883Ad28nxTJ++fzkzcJmFUTcBuL15CgJPUx40j5XSZZiHNslKUKiD1WI6Zsmra4LW4tEvqg
	j1gxEGvB0fZUsgNFix81A4cGKD60vCpU+SIMX5urut0uwXGuymJ+TFTQs99JIhBFzxui/f8Un/8
	TfMIKbyXSRBhQzqsBDikkhQC1eNx2lQKwzcEj3bl46WmctHqToNPvIKeCzZplqz1AH5kCIKSbw/
	8oH2yLGks9g5sy/WAK8=
X-Received: by 2002:a05:693c:2b08:b0:2f3:c3d4:382f with SMTP id
 5a478bee46e88-301181aa331mr2513866eec.8.1778693422110; Wed, 13 May 2026
 10:30:22 -0700 (PDT)
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
Date: Wed, 13 May 2026 20:30:10 +0300
X-Gm-Features: AVHnY4LbEcLazP490SpFW2HazY7KluRMMma2mmpgzBcW68oL5O3KVQGdtgY1RmI
Message-ID: <CAPVz0n2yGALm1Z0j0j6_MaqAOZGL+a8EgCWYQpW0QN1YVf96EQ@mail.gmail.com>
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

I was tinkering with Chipidea driver for Tegra a bit. If you meant to
use flag only to control usb controller device init and leave PHY to
be handled by controller, then yes, that is possible and that is
better approach.

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
