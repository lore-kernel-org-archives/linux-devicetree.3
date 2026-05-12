Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1B3A7F55
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577042; cv=pass; b=RkC4OK4L99jTOy7Mq0Ej2bSZgjEGl/eF1q+aNe6gXWpSeVkjXRRqFn7SFRvfOwp4AbsmrAsiGK72vXfZKfVC1nb5BbOZxEejknxTyO0pICMXwUdBPbr5R8ZQZu7k6bBXLIdhZ2o5sFiUywbNhuIPEM6aT2TQ+9hrmoDI8tjmZi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577042; c=relaxed/simple;
	bh=SldyvNr/n4Wfj4nI29FY5/NOTaJNZ4ScLZjfw6gtFeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zbdr8O1EZML9tiwGFHgbETAv6/YF1bV0+YTXH2u65QWJti9NI/r2GHfsORhB/e34HsxQ0S3YdzxLhx60RCmOlZSYRlIGam7d3Ze6pqbq2I0SZCvvKuvClMW08sqo0CpblghcPLhnZMRauS619RGsogtYTs4rebB2QPGy4oCAY4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VpokuH5M; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VpokuH5M"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a877510541so5493405e87.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778577039; cv=none;
        d=google.com; s=arc-20240605;
        b=Bv1NlknoJsvqq45y1lGwbdsCuJirRsXjNSmapFBfPEYPotHlPRUVX/1A/yPqaQ7Dsk
         8r+1N+iPTi47gLGyu88P+2S+9a5q/CL8MTXOHCwQ8yZx+X43Pvfki8Y3ddlhXjU8dWJC
         3o3tdFJWctrX18fJ3nLs+FxM/c4yKm+TFhBaPz5NZOm5rX9u94EXokk1y+cmEXgfXm4P
         X9ro5PGR6URKbBWuF31taYhpfwpX+el5kRx4D1adEYI7OYHD2cLdC4AoKqTZG4BVEa6U
         t8oYjzkecnxIt7VWkq9NfTPIk5kvEAjm7p0Dh2+8uSjHCuH0Yixf+tM6DQUZOXePXe9F
         NzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        fh=lZO9+vELpdaAwAENYVbB2+avtp9foDB8xtIfUHKMiG0=;
        b=PboMQ0/EAtBIQDyEXSjUu6pU2onjpTwREPnOdPdn1stTgx9SoWaEWalfzV3mgETBX6
         RTnSHAFswTeBSy6EO0tD3gWx6jcL9epzXnkCkNarh7Wjv7ETwaA07Pcj3JsH0+qxDez7
         or9bI9fnKBhObpH1jrORALHQEmVMY5StID/j/Ssk72sMCYRwQBvZPJ60Swp7z4SGyQlS
         4A+0hacVyILa8RhPZOfhf5wE4T6Xl5Ym5wkkpqf+eVv1iSsniMAwglR0HeL+epM8EMjg
         A1FXTH5ToNCqFm5RmN94h9E4GUNasVtRd70mRV1JOGjhU/cBBOE8RorynyEzICQeRwHV
         tm7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778577039; x=1779181839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=VpokuH5Mco8HOKOadwhqWFcpCG7VGfzr7GO9uGE0n7xBXpM0FImQsg7J0MMekSfDtm
         EKscSTPZy0mES8VtXeWeATPPppM+xWbnrcWDo0L53llEJedmBNPnXukUYa5twluMp76Q
         a3sY2kNRGobdGLZQ3nDbHDeQBS2z81WBYmmPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577039; x=1779181839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaQVFSo7/RABUgV7WjxPFRBzBaIOTZlhi7UVYJK3BzI=;
        b=Zt2fu0vHhRgOr+kfIPKSnBDlqmg2U5OaEF+9EVSdH1jVvFO3cMCXNQCwtfxugx1ZsQ
         bOUqRRJvudn1S2Kz1qJ+qGwWjdHwfMvLXbNiazgdBwvl+poU+QOJK36oH6d+onAUtTYc
         Id8CdeCdwh994DX7LBQOt9+IyIfvwdYYVn9ssNo4UH1stNj351QWaUh192ngngAK3yJt
         ryTjzn4gb7Bes5GzahbW/6ombYtQeyzAe5/1raXMM61mhL59p5N0YaMpU5neyWgpTOVd
         8NR/uw2lQ0xUapSqw4Jt0SkxUbxEZAAsAkbFD8Ccoqb4y9wZ4Vj74+V+JpyhQoDA0rHS
         Tnvg==
X-Forwarded-Encrypted: i=1; AFNElJ/oa+PDxIez0efbiVGsrbusRbhlIMb7iZJik6rLiKVn1g9+ICUcto8WMNt3RsTMf9SRgQZHLCoDTNvP@vger.kernel.org
X-Gm-Message-State: AOJu0YyEbGDlOCxmjOSmBfDYYpBuSylhQDSGlv4twUK4QLIC89fspM/N
	zxn3fkFHoJUpR7ZU3/zBifHQJveeYdvCHlCsltO/gYCa1x/9TF4vraIn1OsJ2hOGzZJr8ScaFUC
	BhpCqFEVvKTuGQ+4YG6XBLRenn9bFowu5LOlbxpo3cF8MoWet7ouYMw==
X-Gm-Gg: Acq92OGfYzFhTelhMvgmJg4sypHiM53oKdx/tlwgVT2OK/JA2zqdcZFJgkHpvya4Osl
	4FwsabIZAntu3VThNEbVIXsJ8LKZzzroihzDgKLPkH97vph4hnO1iL3+4GF8bkmNt3nyCZbywsY
	6XvgS+o++1wotlFGCjN37Pv9P1EWHYEBd0K4bnBsU7XxF6REorbPdLEdrjSA8/iPa5jNMW3cMne
	e7jEPavGwOwLrX0KjL71OQEz9Ml6OyM5KllRGDrRMvWVUFy6T2FxU6YJyskK4EfMUMUzfaavBnM
	vgmcEu/W1iEewUKOuX/XzayaikkYbU0luY9IzA==
X-Received: by 2002:ac2:4f03:0:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a8e31e792cmr741475e87.26.1778577038810; Tue, 12 May 2026
 02:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn> <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
 <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
In-Reply-To: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 May 2026 17:10:25 +0800
X-Gm-Features: AVHnY4JpFJ80xfcJKb4R3fVCclO5uQOrLLkEvtBAuF9RxcpiffXxdfYLmlfODZk
Message-ID: <CAGXv+5HFD_8e7odEwXk3vXZThBAor0PvVCbb+=wjR8gxwqwnqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:14=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > The mainline pcie-mediatek-gen3 driver does not have code managing
> > > downstream device power / reset.
> > >
> > > As the Wi-Fi card on ciri is a fixed device, set the related
> > > regulator
> > > to always-on and use GPIO hog to set the status of its reset pin.
> >
> > The plan now is to model it as an M.2 E-key slot (even though the
> > chip
> > is actually soldered on the main board).
>
> Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
> does not support toggling #PERST now -- maybe this should be done and
> used instead? (Well it looks like the driver had existed for some time,
> but it was for "slots" previously)

#PERST currently is still left to the PCI controller drivers, since some
of them have dedicated functions for it, while others use the GPIO API.

If you check the history of the "PCI pwrctrl framework" [1], you will
see the design choice.

[1] https://lore.kernel.org/all/20260115-pci-pwrctrl-rework-v5-0-9d26da3ce9=
03@oss.qualcomm.com/

> Thanks,
> Icenowy
>
> >
> > I have some of the patches ready, but I'm still working out the USB
> > side of it.
> >
> >
> > ChenYu
> >
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > index 8e423504ec052..c25780098103b 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > > @@ -544,6 +544,11 @@ &mt6359codec {
> > >         mediatek,mic-type-2 =3D <2>; /* DMIC */
> > >  };
> > >
> > > +&mt6359_vcn18_ldo_reg {
> > > +       /* Used by WLAN */
> > > +       regulator-always-on;
> > > +};
> > > +
> > >  &mt6359_vcore_buck_reg {
> > >         regulator-always-on;
> > >  };
> > > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > >                         output-low;
> > >                 };
> > >         };
> > > +
> > > +       wlan-reset-hog {
> > > +               gpio-hog;
> > > +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > > +               output-high;
> > > +       };
> > >  };
> > >
> > >  &pmic {
> > > --
> > > 2.52.0
> > >
> > >
>
