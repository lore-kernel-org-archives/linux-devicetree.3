Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD240B6D4
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851075; cv=pass; b=OS/koHjtic1b6TKCGqmC3HCu5FvMnTjsHkdAWzc5oklC26y8hnkNX10gjt67BCAAlZt9hAq3kwAChabkSgVnaKbWF2PPpKPj77iC4cLo1VRFCPz8SwrPPsB6fJCJBU1oLsWBHNdzj3lcWQJ3A/A+ju1SrLZf2PcUTJljUk7wqR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851075; c=relaxed/simple;
	bh=nx6pzOW5pT8Lijs8fAgCGx8cLsTrEkgcyr1BexTuz+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEj7SynJyIQSgSvO7jj7WWw1JzinxRAbiczmpvbjJkPimYxkvv8pYs5xqHUGe5W3QiPiZuaCw8M4x1tXRlAsVG2ljGNvVEKJD61P/IX7XBVhdeOOQeqWVEDuvtWwi/CH8p4p4W/8mf4LkfrBWr5Nz3wuyRNnc8yduHp07MW9i0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnaunlPV; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnaunlPV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caed617615so837535ad.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851073; cv=none;
        d=google.com; s=arc-20260327;
        b=eqSNIYC00ili3Jcxi9EFRAQFGyFMFxpzLv9D/jsXNjiC6gKRxfbGsAb1mY2VBA1Lqd
         /mr7WyDWfF7yeuNv6XUUmQ/zXzw1zTsREkY+W830/8jMCs6gTYUJ6IrziRwTMepYFHLR
         Jrz8B2CCPQz+n79ryVEWMCWW95m9CMsqlN0W5ywJJUFuwwkaJSNTaX6T0+eaygaOKbBG
         4COo7IQ0OeAEpW07dg8qHC3laiPRISDVF84peGA6KcGmsXyx9tDpWm21nwXO3wbAv0Ob
         qSof6NrAHecQxGK7YuqCTkWM/blJ4+yDSyA0F7RQ+OTx6x5oHoBOm+sTbyHKCnfhe/2k
         uwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M8SDq5h0rGl3va3b86tmLr/VrLxThW4gkkY/ckQ/2dA=;
        fh=8G5FGytzdCENVIjzYpxO/1fSmrMsHLb+9qC7zus5M58=;
        b=nQSuzGb0786d9cV+WRlzcTld17d6QRRcvKXqINIjkIlTH/ZzIpiAndU8+3eg3Ac9ob
         GiXScY39uOhCZiFZLY1dx1kD4Yl1LJOCdGGaVfvmC87i0wjvgGSm3+lT9pGaFt4wTA4E
         nzKr/Votr2l8H7d7gru0GgZnM0+lKu/ViCL9op9SMRWxc9wIV7MNBznU0/o5bz1lxAJU
         nUagY3eV2A0hsEVnEI4ao0h2D0CJ38sQNYYyniSgWL030+rYyyRU/6aoYbry2tSI18L2
         4IoQZTikKIFCrEdBo6JznpxP7bLAi/ahmfjLlx2fvzd7zYLdHeJ9b0arw/KI+LV4/NSc
         7XFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851073; x=1788455873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8SDq5h0rGl3va3b86tmLr/VrLxThW4gkkY/ckQ/2dA=;
        b=PnaunlPVlR9vSA3adN2cXs0v4MY+HMHLDn2/pIypwBIYua3I/ulnZEUMKMQAQPf883
         SpxK+yLnrph0EMCsHuAkUI0LlNxLEy0avxjVucLz+4g9OcZBIairx1PNko8FHw+jmjzZ
         +vE3/vlrwTJCE9xd3Citp+EmaVINBvk6nd0onnvEoRukFcrSe2V75fGL+VJxWK07Y162
         dezI13xM5r9LoXwqGPQq51/1p82bm9LjSCpHHnaqkC/JuyxWrZbJYl9041Pn6ISiLWhG
         r/19omgJZHjuu6gI3Qi4h5qTcXk+0UWOl/ws+7jd2/h2N43zn3LtP13TtBOBuZiTO64K
         N1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851073; x=1788455873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8SDq5h0rGl3va3b86tmLr/VrLxThW4gkkY/ckQ/2dA=;
        b=kdozmyvPveRtcI+s2kn/fijG5hdkWgMaci++jcgoj0T+BwPh94fePLnPvBue/Rkpnl
         zlzMdTFK6pmo1sOPeXl3jmimXOSxzfh42ekXlfMukWxcqjt8v4L7tUNH287+KgMXNz2X
         PU6NsJ0WTnyg3G7vHvVLELTXKEnXMiquTjSdYu4g8shlGp+kiM6VDD2Ci8Rzzw6aW5eF
         UCxcW3xHWbvI184lgJEuPGJOh3+PwT6ePB1pH0eiW1M0yKzFpZZevFlPtltlNROepmdb
         BGAGh9O7Xog7Uur9zQWWfzpyGHBWoJakyTpbC7V4zMe+GvE/9/1cxMdvcBU3PfSMz7TI
         vEHA==
X-Forwarded-Encrypted: i=1; AHgh+RrKg+e+vH56lWN71Tzcygscrv5c2SEpDfm1rOcdVwqCRpuNH6XDXJrdjdGO2wQK0dP3xfr/mduzMYHr@vger.kernel.org
X-Gm-Message-State: AFuF++labERvZsIyVoGedYNWC+yvZ/2i2fvX5YNTue9xswXWRCg3DXck
	r/KbsIpQncqWg1i4DAdqC0zNCsMWp6l3FeTCMKn1ockG9Rur9dDJH66yDtCTyDK0c3pLBAizoE4
	joX+x9TlnKrdKmzcNBe5ptIKPaNzp+8E=
X-Gm-Gg: AR+sD10mwktInBc/lx+Ypmjj1hKSi3QOpPoAtLmG59ThaaWv/1mMfTXWPGdAgxxj38K
	xVh+kt7pipk8bcyAEA8iYgP0elfyI493ZnZlCYkZwT+fHL9W8L9quXNSeWBo2i8fLSBspKPICyw
	SN6h3KXWg6jQ30pzQZBgY+cOwZUA/1MlpzLXYsEiaQaUj2Lq61SUW8ccbCFuN/Gr+MbIRs7ta4y
	PF+gc6ZslyGqgT7bE+fBJaJHuHyazgEkoHdeQbbQaRpa/gpc0EsFOHH1xIMqwF38ELPxE956Tx5
	cf8y+Z+iK7CECgDQSYkJxyiDtAkQIbH9ib43sodpj0T+BZgXSAZaxELt722mOvojkEOsX1PK7sF
	oMg==
X-Received: by 2002:a17:90b:1c0a:b0:396:54ba:8932 with SMTP id
 98e67ed59e1d1-396d104e722mr868167a91.16.1787851073075; Thu, 27 Aug 2026
 10:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <CAPVz0n3u0D=0swsO4n6LROFurO=as1w-ZRwaje08BN9dY=JhXQ@mail.gmail.com>
 <20260827141457.GA2943942@google.com>
In-Reply-To: <20260827141457.GA2943942@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 27 Aug 2026 20:17:41 +0300
X-Gm-Features: AcwNN1WUBCKfKNTF0yfYVgSgr_Ph4Fu9hbLSdLwMiZnrAraJvVZlotiakM6hXUQ
Message-ID: <CAPVz0n03znVtUaO9qo9zoC71NQsiVJK4sMLcyi_TWCUL8V1O9A@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 27 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 17:1=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 19 Aug 2026, Svyatoslav Ryhel wrote:
>
> > =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > The initial goal was only to add support for the CPCAP used in the Mo=
t
> > > Tegra20 board; however, since the documentation was already partially
> > > converted, I decided to complete the conversion to schema too.
> > >
> > > The CPCAP regulator, leds, rtc, pwrbutton and core files were convert=
ed
> > > from TXT to YAML while preserving the original structure. Mot board
> > > compatibility was added to the regulator and core schema. Since these
> > > were one-line patches, they were not separated into dedicated commits=
;
> > > however, the commit message notes this for both cases.
> > >
> > > Finally, the CPCAP MFD was slightly refactored to improve support for
> > > multiple subcell compositions.
> > >
> > > ---
> > > Changes in v2:
> > > - fixed code style
> > > - rtc conversion was picked, so patch dropped
> > > - added audio ports description into mfd schema
> > > - splitted schema conversion and compatible addition
> > > - minor style improvements and typo fixes
> > >
> > > Changes in v3:
> > > - added regulator node names list into pattern
> > > - filled spi_device_id with driver data
> > > - ADC patches were picked, so changes dropped
> > >
> > > Changes in v4:
> > > - dropped regulator patches (applied)
> > >
> > > Changes in v5:
> > > - switched to MFD_CELL_* macros
> > > - switched to use determinator of model
> > > - switched to spi_get_device_match_data
> > >
> > > Changes in v6:
> > > - removed address-cells and size-cells from main node
> > > - changed macros formatting and OF matches
> > > - factored out common devices and made device addition staged
> > > - dropped cpcap->variant check for 0
> > > - EINVAL > ENODEV in variant checking switch
> > >
> > > Changes in v7:
> > > - adjusted spi_device_id entries (name/driver_data)
> > > ---
> > >
> > > Svyatoslav Ryhel (6):
> > >   dt-bindings: leds: leds-cpcap: convert to DT schema
> > >   dt-bindings: input: cpcap-pwrbutton: convert to DT schema
> > >   dt-bindings: mfd: motorola-cpcap: convert to DT schema
> > >   dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
> > >   mfd: motorola-cpcap: diverge configuration per-board
> > >   mfd: motorola-cpcap: add support for Mot CPCAP composition
> > >
> > >  .../bindings/input/cpcap-pwrbutton.txt        |  20 -
> > >  .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
> > >  .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
> > >  .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
> > >  .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++=
++
> > >  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
> > >  drivers/mfd/motorola-cpcap.c                  | 143 +++---
> > >  include/linux/mfd/motorola-cpcap.h            |   7 +
> > >  8 files changed, 571 insertions(+), 188 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwr=
button.txt
> > >  create mode 100644 Documentation/devicetree/bindings/input/motorola,=
cpcap-pwrbutton.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap=
.txt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola,c=
pcap-leds.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cp=
cap.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cp=
cap.txt
> > >
> > > --
> > > 2.53.0
> > >
> >
> > Hello Lee! May you please pick this patch set? I have included changes
> > asked by Rob and Uwe. Thank you!
>
> Nope! =3D:-)
>
> There are still a bunch of unanswered Sashiko reviews and one from Rob's =
bot.
>
> --
> Lee Jones

Hello Rob! May you clarify if those are relevant?
