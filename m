Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBB3EEAC7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876666; cv=pass; b=FumSTseqMAVCveDopHOM63UmcVkMZrochz3FAA/zYKx7R4LUUSl4rMveL+VabcqohmfdoWvwVCo5bCAhJRiUiuLA9uAMAZyGtFp+VRL5BB6iXXtaoQpL0JW9lNEDpthJDvSq8czI1SGYExEu44ta1UT5R8oeqhNkyvLnOk/qkrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876666; c=relaxed/simple;
	bh=iA7eFj30FwPY+Y6qxChdK9CcYuJg/yF5Xqwa6oQ7PDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrxOV0ht+4qaOMP+jCGGBdlme0RhAIOJYbRLqYVaYEWazMWx9DkD+WGWAXPF/ArPGRfpLF/WjbyI7C6B1nH6ylcJnYMGkDNS3MnBOzdzlw4HT5jg//dsuXlSJFpjuCZAxWNH8pEEXRC4H88XAWyJaFlbpaOyqoLVYYG+/0FAEmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJp2vse5; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJp2vse5"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30455f77e0eso1548892eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876654; cv=none;
        d=google.com; s=arc-20240605;
        b=fLchWgM78eznCfeg92VwR6RYZhW5vsPOn0ye4MF0lDSitXmA0NEJoA9RcqOsjqTG7E
         xudfFqEeYDILZ/u3PIA9F/uJDc8XqQg585nVRNK1bAL9auWhna38LVTU6B1FVIq1Uko7
         uqZmWPa97Aw5fZXpjpyzQt9dQl2QZmCbso7yn+fH40Xe7QJpuxXmS7Q2bYcRVMxyju0Y
         mm62sIc3FJL3ARgF8SjJO6+aCqZR51VgtNKf5Zrlz7jWj2gmGexHyrVX72KGmeJpuBHM
         DYTTeMqOwtO3qyU3V1O4Lr5nCtZFuZriSGKWXDn+6lFRWJdIYHIR4UOXotSFLoSQi8gy
         CG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iA7eFj30FwPY+Y6qxChdK9CcYuJg/yF5Xqwa6oQ7PDQ=;
        fh=+PuFehtW7HsgnmhN6/0WqIz4LeAKet1BVAKrSfvi4qc=;
        b=Yv9/KjboFlCv8NvydAzanHVYLk6Dzk9eNDAS5YGEPgxe/cRzZ1xYHDKKnHBi+Hh4w5
         URMCFLgJv0jb+ThA6Ss5jVFpCqFpIr+zzz4Sbb4YJS8bHf8R5JEKz+Ky8rkZB7S8bJaj
         VlMcdBGY++lvvs8kM3t9U+WYg2j3N6n+jWQF0jlzAeXm58fJinXt9xUvSmq4+zBBfw0l
         mX6OwkrTiHkmM56hwixdzs+fLORdGauvRz7mtRRsAK8VdjfAdYjtVM8NK+GrbBKbDADe
         cedxOU4F1rs9988GTX+ef0wJnncHwucmh5i2sMtB41xizNZPUgZuagHAp+7zAXr8IS+4
         3rSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876654; x=1780481454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA7eFj30FwPY+Y6qxChdK9CcYuJg/yF5Xqwa6oQ7PDQ=;
        b=GJp2vse5YsJVaZxxuX7fCeHJIdJTtvCWs6NHSgCw3wbINK1G57plmcnOvU4Riw8koG
         xXb4LUDkrbZVZxMf0gKXlb+G0fE7BO6rV+E9sKZKxUmcD6L7WMH/XuTWSA/VLkakaaeG
         eTi3nSRu510vCW4qMitn3zaWuqzIs9N0KjpnS53z8LojQRt8b27yYNqd9hhh5Oq8/zGS
         3K5L7PQudGgDC7vtPt8144P9loo2GEhTsN3EYJRw7MmWX+4adjrWlmD1eFrpHoKpEOVx
         QMWaXZn117BqqUnbtF/6ZwY1gobYIqzK4xpuzaz53cit1RXZeMcO53QD7xkhV91opFX9
         ZypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876654; x=1780481454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iA7eFj30FwPY+Y6qxChdK9CcYuJg/yF5Xqwa6oQ7PDQ=;
        b=fvper8xyYRdthydqy6kteArw6E/AzKxGYl02RcH0HctAxMvtNwjqJh2UuxqHUPV4Ij
         bMwhl9d4xOvK3zdFu4ANpyWUVTOXIvZyFY+Hwb/VvookyV7TVnIFnGKpvFGlidvNpCSe
         TsWVhGapORtUmOiwm1kW3Eqi16S0xn48vaM0ruRSZPyn1VSTexesXKJIgFCZg1sDZfBR
         OVKzRQ4YpnuQoBmFYT2jxv5t7nYEavJA5W/X1RleD2uX9aByjo63WsvxL46Z7YdDbIf4
         E124zK4/HimSIqe6G9rrXLIEJdPZARJXHd1wuhDtSagz5t2x8WGhgGab3nywwXuWZWOX
         5yOg==
X-Forwarded-Encrypted: i=1; AFNElJ/P2Me4zn3RevvJ78soHcgH3jlQFuABbiQJ44kDvu/C91Mz7RwW58j5w+e1QIMfq0A7/MKpoxHyRLGL@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjb+VtkGG7PzD7fFLVhfNymTql5IPiFLMkmg8TttghVc1lyJ0
	+joKNAdcVhOrGwQpobEDmMrieI58V1v0UBv4Hq1kTg6Ri4/irYpBlAaqIIWYDEFsyL6YBe3mvp/
	SOg+MDEsNoscbe1Z9hh3lbxTmGp3aSK8=
X-Gm-Gg: Acq92OEIsT+x+Bvq6YSrDLVAcpT4OrSu0uG9Kj3s5kpsgzP730aiL/3RMvp1D+Sx4oz
	uPpZQXVLAvJdt7toSUqnZ+zu0ToJsWL60nNHDTZFAsCzAvRjdoMfrLGok1aohdZqNvFn5dznay9
	S2Mg0ruT/j14KnfDggcNJrw3KELwT0fwE+VDHFDtQhbLY1v1nCZT5e5pmFIEaKmMjYbdb7EM15i
	pvFanCNO/f93BsP57YS9UAiNW+RL3Znvec8MtTkhtRCZTRLWfInY8d9RdHauOh7vnwdvII7O/N3
	fAntcyJy
X-Received: by 2002:a05:7300:e8ae:b0:304:6ee5:634a with SMTP id
 5a478bee46e88-3046ee5933dmr7165588eec.1.1779876653501; Wed, 27 May 2026
 03:10:53 -0700 (PDT)
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
 <CAMRc=Me+o6qo_r3TBUCrhPp1=r-fMq3jaQW1=H91H1mM5LYAnA@mail.gmail.com>
In-Reply-To: <CAMRc=Me+o6qo_r3TBUCrhPp1=r-fMq3jaQW1=H91H1mM5LYAnA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 May 2026 13:10:41 +0300
X-Gm-Features: AVHnY4LLttSZN8UY67Go0DyygvbspMSgWMlZ5vFyfsjMlbcLjpdZvBGh1o3fdfs
Message-ID: <CAPVz0n14vc5NpuoHHX+8HvZ3HWyfELFRr0SYw7NcMmn1LsEttQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
5 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 27 May 2026 11:06:11 +0200, Svyatoslav Ryhel <clamor95@gmail.com>=
 said:
> > =D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 27/05/2026 09:55, Bartosz Golaszewski wrote:
> >> > On Tue, 26 May 2026 15:41:58 +0200, Svyatoslav Ryhel <clamor95@gmail=
.com> said:
> >> >> =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 16:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >> >>>
> >> >>> On Tue, May 26, 2026 at 2:55=E2=80=AFPM Svyatoslav Ryhel <clamor95=
@gmail.com> wrote:
> >> >>>>
> >> >>>>>>>
> >> >>>>>>> The node attached to the pwrseq provider device should represe=
nt a real
> >> >>>>>>> hardware component. Are the enable-gpios and power-supply line=
s connected
> >> >>>>>>> to the modem package?
> >> >>>>>>
> >> >>>>>> Yes, enable-gpio is connected to the modem and signals that USB=
 is set
> >> >>>>>> and ready to work with the modem, while power-supply is an opti=
onal
> >> >>>>>> supply connected to the modem's vbus input.
> >> >>>>>>
> >> >>>>>
> >> >>>>> The modem is a hard-wired USB device? Do you implement it as a
> >> >>>>> platform driver or a USB driver?
> >> >>>>>
> >> >>>>
> >> >>>> It is not a traditional USB device. XMM6260 is an embedded modem =
used
> >> >>>> in the Tegra phones, it is linked with the AP using USB line in H=
SIC
> >> >>>> mode. The driver is implemented as a platform device since it doe=
s not
> >> >>>> interacts with the exposed USB device directly, it just ensures t=
hat
> >> >>>> USB device is properly configured and is ready for IPC.
> >> >>>>
> >> >>>>> Is there a connector of any kind that could be used as the HW
> >> >>>>> component represented by the pwrseq device?
> >> >>>>
> >> >>>> I assume control over USB line is the HW base, but as I have said=
, I
> >> >>>> can integrate binding in the modem node itself, and pwrseq can ge=
t all
> >> >>>> it needs from the match. Pwrseq framework states "This framework =
is
> >> >>>> designed to abstract complex power-up sequences that are shared
> >> >>>> between multiple logical devices in the Linux kernel." it does no=
t say
> >> >>>> that it must represent some specific hardware.
> >> >>>>
> >> >>>
> >> >>> No, not at all. We just can't make up any imaginary, logical "pwrs=
eq"
> >> >>> devices and describe them in DT bindings.
> >> >>>
> >> >>
> >> >> Ye, ye, sure, pwrseq framework is quite flexible and I am not stati=
ng
> >> >> this bindings is mandatory.
> >> >>
> >> >>>> Using pwrseq allows modem driver to be SoC independent since USB =
line
> >> >>>> handling is moved into SoC specific power sequence, and this mode=
m is
> >> >>>> used in Exynos and OMAP too with similar setup but they all have
> >> >>>> different USB controllers. Maybe you can point me where SoC speci=
fic
> >> >>>> USB controller handling can be implemented?
> >> >>>>
> >> >>>
> >> >>> I'm not sure I'm following. Can you atrephrase or point me where O=
MAP
> >> >>> and Samsung implement it?
> >> >>>
> >> >>
> >> >> They did not.
> >> >>
> >> >> The XMM6260 modem is used not only in the Tegra phones but in the O=
MAP
> >> >> and Exynos based too. Replicant tried to implement support locally
> >> >> with midas devices and they had some progress. From what I have see=
n
> >> >> generic implementation I am proposing will work with any of those 3
> >> >> SoCs maybe with some slight tweaks, only part that is totally
> >> >> different and SoC specific is how USB controller used by the modem =
is
> >> >> handled (well and IPC but that is out of scope of this patchset
> >> >> anyway).
> >> >>
> >> >> Obviously, non of the 3 vendors have submitted any mainline patches=
,
> >> >> everything is in the downstream forks. I have investigated a bit ho=
w
> >> >> this modem works on my Tegra phone and re-implemented it to work wi=
th
> >> >> mainline kernel (I don't have Exynos and OMAP devices to play with)=
. I
> >> >> have come up with generic platform driver which handles modem
> >> >> configuration and a SoC specific part which performs USB controller
> >> >> bind/probe when modem is ready to handle the USB. ATM this SoC
> >> >> specific part is available and tested only for Tegra devices.
> >> >>
> >> >
> >> > Are you familiar with the PCI pwrctrl code that lives under
> >> > drivers/pci/pwrctrl/? It seems to be solving a somewhat similar issu=
e for
> >> > PCI devices that are hardwired and powered externally. Maybe you cou=
ld use
> >> > some of that code for your USB use-case?
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
> > schema. However, I am not stating or arguing that it must be applied
> > or whatever. I am just looking for a proper solution to issue I am
> > currently facing.
> >
>
> Krzysztof reviews hundreds of patches so his fuse is quite short, don't t=
ake
> it personally, he's a nice guy in real life. :)
>
> > Anyway. That does not matter, what matters is how to organize
> > everything I have regarding this modem into a logic set. This is why I
> > am looking for maintainer suggestions.
> >
> > How I see it ATM:
> > - I will remove this schema entirely and add usb-gpio (trigger for
> > modem that USB is ready), vbus supply (yes, modem has this line too
> > you can check in the P895 schematic) and infineon,usb-bus which
> > represents HSIC connection to the modem to the modem schema itself.
> > Obviously, I will add detailed descriptions of each component.
> > - I will resent patch 2 of this pwrseq with the modem patchset to have
> > a bigger picture. Pwrseq will obtain needed data from the modem node
> > itself (Bartosz Golaszewski are you fine with this?)
>
> As in: the modem driver will be the pwrseq provider? Sure, sounds good.
>

No, consumer. Modem calls SoC specific pwrseq.

> > - I will try to get control over Tegra USB controller in the pwrseq
> > without need in externally-controlled flag I have proposed for
> > chipidea driver. I hope my idea will work.
> >
> > Will this be acceptable for both of you?
> >
>
> Bart
