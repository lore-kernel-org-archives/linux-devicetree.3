Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30F3EFFD0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876748; cv=pass; b=rCqEPdGTnh/zjK6GW4QFCAKesa3igThGrA/ELx5/+SB/eyzVDAkxI54kU1zfV1Rab7XWvUE/P8CfkAJlvDQt4oWAjqVm2yvtP+ERPAEfNzdUUwY9ZSgZ8hTgtM01OFBbJInex/3Ji0HqNS3T9KfXNeD8HTTzd0Dztntg6jHTwQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876748; c=relaxed/simple;
	bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrGP9PubXyy2FurmTvTlTq1bAMYl1oriSzfjd8xom8h15CoiEHVfG5zbefIF8rMwBBZ6FY/iptuNG05DGD0yDGRZ9yG4xQRwt0cnm7AbAC9wyowP8AIL/O7ITcLBAjMqN/G56sJyTdBX45RzeyuF5Qa2EKsiYXRWQg7pvyZR6Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF/+WQDv; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF/+WQDv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3044857f09aso7106378eec.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876738; cv=none;
        d=google.com; s=arc-20240605;
        b=VJVS4onQaCFR1YwtDGSJb+QvatRKqwBhYWUJj2iLkqmi9SrIVl3vPbYSG12ggd9eTC
         g2SQxjds4VvI+08y49lFFUkQS2PgW56cNc6zSyRAg1phj24Ydr/E8z9EZh9ZJ+gDp9F1
         J3Mxf3VZe8LGvxb2sCLp7So3eDrpb784qGZbF3g+KpnjhmquT/iLkEiKxhDMiQ2Zczzp
         Zf3w9gWBn/NUmG+2He/DfmjT6p6v+PIYOuj3bJOT+CyFAmWuaHowp4mMpcTxlx9evx6Z
         zF7CCCG3OEUY++hlCMPrwskIpHarhVd/f32H4tem/D9Q0onrIpqJWyjRyZfGcNBkHzfR
         9yIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        fh=vxnvFwwTA+ZFkzUhpbehCg0UMFkEg2QUdTgf40h2ET0=;
        b=NM2ZOqZWMFGp4cUONcDUZA8MdaFs/GllprdaD+Xqz2aMa1WPyJmx9dd6isLMpteUk3
         n+2o2IUFiCkSdoaH1bMiNfH08lNLSXYRE0JNUr7xsEBBszpGrtTfgLMcdAV2kpkxzGol
         KWFbTmmcYVbta/IRlZdejj9vWQVN2m1q7tWYGLyvJ2CI5nnouzjfmWvzK3oX4bGinwCy
         nnChZ2Y7+HFWINQgyD7GrknvaQtt9WJ+00imW3kQ2Jpx4rlg22jUqFCAs+MTE5hZqOeP
         rGvITQbVipNq/bHOAoDC+6e2hAvpoiUM3b4fporM5lpWJ8saLAPU89paO2aP5xPGb76+
         42gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876738; x=1780481538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        b=qF/+WQDvehovBfLN/fdTMiOVeDCzPvU2g5K09E8CULiQusXbmdCOg5Vas1wTfTWOyO
         VKv3Lp8VNz8bcqunlx0DjMytCHNQ2ebGiV8gTGkJ/EEQykom3fWHqpj5XwdkqLXROe73
         2rBonfqNVQ1gzlC+eqp4a2i3T2KltGx+9EzZHNL9cvAGcNc92sq0bX3tLtuQ0Bl1y9Ly
         38vsEvDcJcG/lzoqewR98H4/Z2x+xRPZ1gfPmhqk1iRtJpomcZsFANhRurHYu5zlB13S
         JdGpXVZOUv54NztdpLt6Nd1hXShPrHKw2zQKW+0lyPWJOHllWqFhcaJqAs76vWFwFMQJ
         iyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876738; x=1780481538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wg+/hg7+nyKZCEjWmGG1RgGiKovcVUPAwnl36vyVNXw=;
        b=Cx8F3+PX6cXXlH9oIOxGVyPvShrUn6gjKZhx1pD3O7VD5W5WhX+aOA7OZ2tnyAHW9U
         Th5as20HwJOT8A1E89Hd7ezz4SkydhavNAxC7+hkNbnrA69/t9dci3ii4voZ5hf6HxfA
         BZQmVeFnelr2y8BlC5c5Jq8FTNcJmnMUCGkkDStbXaga/SzRsOveCqJTjwTKvMIcxQu0
         FYuTYbSwJBahzw+0gpigEoOMzdMDCscwLtHd+MvjKZIpJtIQymb9umJydZbUKntbIarz
         0PU0ewHCOyD9CkVt73y24n8PKbKpleSiZExEOz/KcxrH0SIZfNp6z6aWxhzPH2U0XNtL
         BItw==
X-Forwarded-Encrypted: i=1; AFNElJ/vTNj5laqseoZZgMzoxeBuLwEFBPtiHpY7IRGu3tg0p9e00G+2eHUjRQ9ue0MFCdoD9JdaDXxVQu2e@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTg7AIaHWIeDBaGkcSonAz3X3FfFLw/Vndkgx8JvGbBl45BcA
	s5fX5qMwl8l/72+4pa8tmUQCcXITw8S5mLl7enlZQYVc0+MYNBER2GR6XYD6rsEw81Labe5eYN1
	6fyxgfleGfaZmB/xCQmZA/xbcUxXwWtI=
X-Gm-Gg: Acq92OFUrconh5It8jd9KBrF4/ITx04D+ajvKrdzzgBiIg1KWP2QQGYu2MHfjWmaGAQ
	4nqwSWTP3P0qHSbUqzR1nkZqgl3tYi7U8wq6FtO1AcHvA/ZeWKhD/DMN3JxcHXlo9pNOj87Bcp0
	ec3g4cWcE/B0QWVWUUUoHFMfaWoSaNvaDF1C6b4sBuCWnwWCBYCeIp2ZNJSCTbrQ0K04xw3Tw78
	wwJ1AAv2oTVXm5XQ8on4BpHhoR7yKOo+E7VUDNTtvqD9XwxIK13YIv3leTDhrrjiHVgjMqNxlPf
	rsogh+eDrJ6YzoOVw1E=
X-Received: by 2002:a05:7300:8b1f:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-30448f30884mr10881349eec.5.1779876738394; Wed, 27 May 2026
 03:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
 <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
 <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
 <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
 <CAPVz0n2COsDL+fNBAuKr1ty_AVe9sK5yNJithkXex6GNa1T_Tw@mail.gmail.com>
 <CAMRc=Mc9g=yezRtAtRMzh7t-pSoyoKQEtxrb5U0oeFAbcjb6Ew@mail.gmail.com>
 <CAPVz0n3X8Gw2Yo9VgwhV0uAqvArGXbvmzw=cZVJw=4BEH_E7_w@mail.gmail.com>
 <CAMRc=Mf4W9hoP7FAbxQTNLaG3M9W+GmvQSMECbzzdQLU_+5D4A@mail.gmail.com>
 <80e102be-04c3-4591-8e75-ddf859d3a877@kernel.org> <CAPVz0n3_wueX1yeZ=MDfSMy3UaQa80-nGg1b7ZQuCTneOaQDkQ@mail.gmail.com>
 <0c4fe9b9-3ec6-4988-b579-776cf37585ca@kernel.org>
In-Reply-To: <0c4fe9b9-3ec6-4988-b579-776cf37585ca@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 May 2026 13:12:06 +0300
X-Gm-Features: AVHnY4JVHBTAzYKWqKZ1aNYZfr9MQmwwhT7RAGqWEdq99-uTkLrfBBwZV1kiBT8
Message-ID: <CAPVz0n0=u_bObb0Nnf8dH6MBbH7T3hY7V01GHnmnt4pCB4WxSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 27/05/2026 11:06, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 27/05/2026 09:55, Bartosz Golaszewski wrote:
> >>> On Tue, 26 May 2026 15:41:58 +0200, Svyatoslav Ryhel <clamor95@gmail.=
com> said:
> >>>> =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 16:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>
> >>>>> On Tue, May 26, 2026 at 2:55=E2=80=AFPM Svyatoslav Ryhel <clamor95@=
gmail.com> wrote:
> >>>>>>
> >>>>>>>>>
> >>>>>>>>> The node attached to the pwrseq provider device should represen=
t a real
> >>>>>>>>> hardware component. Are the enable-gpios and power-supply lines=
 connected
> >>>>>>>>> to the modem package?
> >>>>>>>>
> >>>>>>>> Yes, enable-gpio is connected to the modem and signals that USB =
is set
> >>>>>>>> and ready to work with the modem, while power-supply is an optio=
nal
> >>>>>>>> supply connected to the modem's vbus input.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The modem is a hard-wired USB device? Do you implement it as a
> >>>>>>> platform driver or a USB driver?
> >>>>>>>
> >>>>>>
> >>>>>> It is not a traditional USB device. XMM6260 is an embedded modem u=
sed
> >>>>>> in the Tegra phones, it is linked with the AP using USB line in HS=
IC
> >>>>>> mode. The driver is implemented as a platform device since it does=
 not
> >>>>>> interacts with the exposed USB device directly, it just ensures th=
at
> >>>>>> USB device is properly configured and is ready for IPC.
> >>>>>>
> >>>>>>> Is there a connector of any kind that could be used as the HW
> >>>>>>> component represented by the pwrseq device?
> >>>>>>
> >>>>>> I assume control over USB line is the HW base, but as I have said,=
 I
> >>>>>> can integrate binding in the modem node itself, and pwrseq can get=
 all
> >>>>>> it needs from the match. Pwrseq framework states "This framework i=
s
> >>>>>> designed to abstract complex power-up sequences that are shared
> >>>>>> between multiple logical devices in the Linux kernel." it does not=
 say
> >>>>>> that it must represent some specific hardware.
> >>>>>>
> >>>>>
> >>>>> No, not at all. We just can't make up any imaginary, logical "pwrse=
q"
> >>>>> devices and describe them in DT bindings.
> >>>>>
> >>>>
> >>>> Ye, ye, sure, pwrseq framework is quite flexible and I am not statin=
g
> >>>> this bindings is mandatory.
> >>>>
> >>>>>> Using pwrseq allows modem driver to be SoC independent since USB l=
ine
> >>>>>> handling is moved into SoC specific power sequence, and this modem=
 is
> >>>>>> used in Exynos and OMAP too with similar setup but they all have
> >>>>>> different USB controllers. Maybe you can point me where SoC specif=
ic
> >>>>>> USB controller handling can be implemented?
> >>>>>>
> >>>>>
> >>>>> I'm not sure I'm following. Can you atrephrase or point me where OM=
AP
> >>>>> and Samsung implement it?
> >>>>>
> >>>>
> >>>> They did not.
> >>>>
> >>>> The XMM6260 modem is used not only in the Tegra phones but in the OM=
AP
> >>>> and Exynos based too. Replicant tried to implement support locally
> >>>> with midas devices and they had some progress. From what I have seen
> >>>> generic implementation I am proposing will work with any of those 3
> >>>> SoCs maybe with some slight tweaks, only part that is totally
> >>>> different and SoC specific is how USB controller used by the modem i=
s
> >>>> handled (well and IPC but that is out of scope of this patchset
> >>>> anyway).
> >>>>
> >>>> Obviously, non of the 3 vendors have submitted any mainline patches,
> >>>> everything is in the downstream forks. I have investigated a bit how
> >>>> this modem works on my Tegra phone and re-implemented it to work wit=
h
> >>>> mainline kernel (I don't have Exynos and OMAP devices to play with).=
 I
> >>>> have come up with generic platform driver which handles modem
> >>>> configuration and a SoC specific part which performs USB controller
> >>>> bind/probe when modem is ready to handle the USB. ATM this SoC
> >>>> specific part is available and tested only for Tegra devices.
> >>>>
> >>>
> >>> Are you familiar with the PCI pwrctrl code that lives under
> >>> drivers/pci/pwrctrl/? It seems to be solving a somewhat similar issue=
 for
> >>> PCI devices that are hardwired and powered externally. Maybe you coul=
d use
> >>> some of that code for your USB use-case?
> >>
> >>
> >> I pointed to PCI already:
> >> https://lore.kernel.org/lkml/20260518-mustard-rabbit-of-ecstasy-eed3b6=
@quoll/
> >>
> >> And emphasized to describe hardware, not drivers. This binding AGAIN
> >> describes drivers, so we did not move forward at all.
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Krzysztof, why are you so mean? Yes, I misunderstood you and sent this
>
> Just to recap:
>
> https://lore.kernel.org/all/CAPVz0n09ZP1i2tasdTvnt8RvjhALvUYjv9u_EGRtnXPO=
YQtuqQ@mail.gmail.com/
>
> And enormous discussion wasting our time here:
> https://lore.kernel.org/all/CAPVz0n0u7uhL8_FQFiuB7DrnL++ecbaEKEoV7N2PgTVR=
BVECkw@mail.gmail.com/
> because you were pushing your solution. I run out of spare time to
> handle endless discussions with you because you reject standard comments
> and expect long discussions with multiple justifications for standard
> (and documented in writing bindings) DT rules.
>
> So here I told you to do like USB and PCI. This patchset is nothing like
> them.
>

You are creating an entire database of discussions we had. I am flattered.

> Best regards,
> Krzysztof
