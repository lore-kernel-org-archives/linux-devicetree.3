Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239F3BF660
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212226; cv=pass; b=JOKmTKWmXMPQ6j9hhegemPz32E5zvnS0fFww3LmKAXrHHeejWVS0aQRQPXJvhLUBdy56TKtNmM/olNqxe/F+WZQcKYaVnCR5q2NsYPTGh+tifA4fzkeHgmAn4Y0tVxeqK5gdEeznxxJFhvvq5ubTfHZ2kENNuQ+xCY0Js4a0ffQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212226; c=relaxed/simple;
	bh=/xEwob/gybZt/V2Uua4aPALijOLg3lbe/x/lAhgXJ5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJZD+9X2Y5EltFd3EoA4mUbev+NwmgzIFPHGQARw9JtVcwPNNKgQbAtCFvaKq92TZnlo4znfpLERZoe29+Uf22GrjmV8n5A+zab8tMF9wkizxAFrZd1qdaADw76nqpr3rnTTJ1sbfruCoxEeTD6a6KHNG4KJU6Ba539Vpmtcovc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+NozPVT; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+NozPVT"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so17357911fa.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 00:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787212223; cv=none;
        d=google.com; s=arc-20260327;
        b=r7U78XFiDAfqTpkEKJueV7kagaSd++r7ESmPGZ7U7vGlOev5DgGtket1PqIaK5mhuG
         sGFAkS9yuYiMFQKuFAtab/2brsVP9VepJlTVmcRaPNWcjUSIBgLmDiue3DgY0OTw5imv
         pQEvMaXOaf2sXB+9bv3sDZSBtua8NMtPSkjLxdEm8LlWfNuqrwgBEH22T3lN9+2mNkAU
         JTDxkGZHCer5U9zFVVGb2ZJh8ZnskSFdkMdfJKKb3KGgVjmqAJzKrK+oQlx3GuQOI0Hv
         2S1/eoRI5D7XRet/nk8eJz7uGd0HO3VoINzWgPgz02iWyjCbvg/HMaf9aeXSS9sn8+kZ
         PtZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        fh=QsCURNwg/G63fa1wpk5QDuS0Exq7Y024FXvaqyDwPTI=;
        b=WbXjoany/j0pJZdwEG7KtABN+5rgMLm8+oDIfKVkKf9phbs/gGtsmdr+lEMdJFU7Of
         TgLDhkYVCkyMOjZE/iSfXabzX6XTcuVN8Oppx4vvRr5+Uvbeca6uWvNUVlab6QbxlDOL
         4aM/FHKGsTH1jes2MsK+BZXP+MZAx3ajsWAd5G//S/EG4/18Snu4DSvF23NfpfKUJ+6n
         RvBZDR7JYsQCmEiAUCibUncwaJ8dLh6X+n2y/jjQxCngkOvhxdYQ3oPbYGsBMs0Ud/Ws
         xOl0mT4qPuR1DJsbAhb5LWOE2nQFs+TNHPhtdzI+P+NbvQ49OC0810de7MWSRZZd1N0t
         PDBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212223; x=1787817023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        b=X+NozPVThnjNcOMBrbFHG4dbjIRWL3hwUxoinz/yUAvk5BcVnYnO+RFqmEIg6O4sNZ
         dV/V0PhANjitd3hWX8YeX6AGcFlG7LkLrs48R8CPDkOeRTqkjCfdNkKg7OFjEzkWabg7
         bHGcfQSSCOTqSL40ew7j/V7YNa+a2sBjZ54c8qlCHFGDyRJx5lcZ0nj0cZ0qWggeGsk1
         T1uOqy/xehSxEeA7enyke3rTS5i47u5Mu5oMWZHC0N2c+MWW6LQX4DFW3P5uhdc+4mUL
         0BoFYC/R5PnkZzHolGT/Swon1fzFDfPoEOt5edA013XiI9L73vWYwbXopEsdCJsG6s5j
         WFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212223; x=1787817023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TAyv372/LEkCsLr0cT5JC02uRbKUvvVi2UV1V38EE0=;
        b=qDj0GPUxAqQr85a79LhEu3zzulWjBalAYGZPqRJaUC9Az1R8YDGE+SKisCJC6MZ6SR
         TNYwfyLIzF87ll1wmaYsCH8Jlo5JNnl/kEDJ+vQZJTLjzjg11u1xYcTgZYiTgW/GHTSv
         ADIAzvcth8f1av47sU3tUnOZqxpfAKYZYHBGr+4R1g/xdDmCxCZkCk0UmQcxb66sQndA
         epJWIHsOMHNsU/ZWdNq5VhUTeE+6R4bnzwivBuWbHn5UGg9jgnn2C5VdVGuI8F1K993N
         fFetczChxZcGgBZCJGccH5QZFx5bBCCdEziAZkEdIGunfyZLkX562F2lH6j3lCoXEus4
         YOtw==
X-Forwarded-Encrypted: i=1; AHgh+RqQmoaNfUEjRdp9clLwC0mykIKrmkhCQ8Jdjail/thImfilT5gNPTdStI7ViHYnMeyyE69U1kFe8lPk@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfJSlFl216cBFkdPsQ/b2wnR/aB4CISC/5vEhsrSFGYQCKC6w
	jkkcG38Ls3k803SxB3+uqlnaqjTc9JUU+/ZLTXoE2ZqLBmlBahE6DS8Sj5Fy503lMng1VrXro0g
	3prmPJqm7raCPpy7SInUKjPM+h1L2kbA=
X-Gm-Gg: AR+sD12H5FJTxw9Gg1j1a2DyG0P2xRZsfblX80K8XhbOrHS/XxrNUSMhtGvmOKKedZA
	UJABeriUfj9OdC8PZamvpC/dv00lcAvbb0rXP/Ipw04Ana3Zft9Z1ekryJ5bqn49EIGK3/VLzWb
	3YJQi/P2pCS5xH0algeHvZ0HC7emFFxr9JaLP+O014PfaDo/6iiAIIe8cjVThkUmPyMSBBx7wjD
	LNIlYUduE1XK4ZsuAO9hNOVPLmVqCevpRdTYEEpnQdU/jxgEL65rmA5g7VyWm7V/sDDYsA0de0E
	Q/fvtAvql1mMLMz+l5glAbstR3ZTAdQtW/emlICOZyz8gPukWhsLlG0HLmk4v8Xf51lgHRYCD7N
	lRnmI9Y/yyjbHYr3wOHEkKvZqPw==
X-Received: by 2002:a05:651c:199f:b0:3a1:1d3b:67f1 with SMTP id
 38308e7fff4ca-3a1896d9d67mr21587801fa.7.1787212223022; Thu, 20 Aug 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org> <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org>
In-Reply-To: <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 20 Aug 2026 10:50:10 +0300
X-Gm-Features: AcwNN1UED2d-bg9Uini4u4mWy-mvYyG-FuFnU3Li4w7hQPYNR666nZuf3FB7ICo
Message-ID: <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, rafael.beims@toradex.com, 
	avraham.stern@intel.com, error27@gmail.com, s.kerkmann@pengutronix.de, 
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Aug 2026 at 09:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/08/2026 08:42, Chen-Yu Tsai wrote:
> > On Wed, Aug 19, 2026 at 8:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 13:42, George Valkov wrote:
> >>> On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >>>>
> >>>> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell=
,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd878=
7.yaml
> >>>>> index 930b700b73d0..5f235cb9f3e5 100644
> >>>>> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787=
.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787=
.yaml
> >>>>> @@ -59,6 +59,12 @@ properties:
> >>>>>      description: Calibration data for sub-band 3 in the 5GHz band.
> >>>>>      maxItems: 502
> >>>>>
> >>>>> +  marvell,ignore-regulatory-hint:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>>>> +    description:
> >>>>> +      Ignore an incorrect regulatory hint from ROM,
> >>>>> +      so userspace can set the correct regulatory domain.
> >>>>> +
> >>>>
> >>>> Same comments, so you just ignored entire feedback?
> >>>
> >>> Do you mean this feedback? I already replied to it:
> >>>>> Anyway, property looks like SW choice. You must describe hardware
> >>>>> instead.
> >>>>
> >>>> I am sorry, I do not understand what you want me to do?
> >>>> Can you please send a diff or a clear description suitable for peopl=
e
> >>>> who have way less experience than you?
> >>>
> >>>
> >>>> Again: you need to describe the hardware, in commit msg, in property
> >>>> name and in description. You cannot tell SW what to do, that's not t=
he
> >>>> purpose of bindings.
> >>>
> >>> I still don't understand what I should do?
> >>> Can you please show me an example of the changes you want?
> >>> Else I'm likely to make a wrong guess and implement it. That obviousl=
y
> >>> won't help.
> >>>
> >>> The commit message already describes the issue with WRT3200ACM and WR=
T32x.
> >>>
> >>> About the description, do you want me to do something like this?
> >>>     description:
> >>>       Ignore an incorrect regulatory hint from ROM,
> >>>       so userspace can set the correct regulatory domain.
> >>> +    WRT3200ACM and WRT32x are known to need this.
> >>>
> >>> About the property name or flag, do you want me to add a separate fla=
g
> >>> for each affected hardware device?
> >>> - wrt3200acm,ignore-regulatory-hint
> >>> - wrt3200x,ignore-regulatory-hint
> >>> - the list may grow if someone decides to add other devices
> >>> - and the driver will need to support all of them
> >>> - that doesn't make sense, because it isn't scalable
> >>
> >> You need to describe the actual problem in the hardware or firmware, a=
nd
> >> then name the property and description accordingly. "Ignore regulatory
> >> hint" is clear instruction to the OS what it should do - ignore the
> >> wireless-regdb package/instruction etc.
> >
> ChenYu:
> > You probably have it backwards. The driver is taking the hint from the
> > hardware ROM, which is fixed and thus wrong once someone carries the
> > device to a different country. I.e. it is a quirk saying the _hardware_
> > region should not be used.

Almost. I bought the router in Bulgaria and I am in Bulgaria.
The ROM hint is US. More details below.


Krzysztof:
> regulatory-hint for me means usually regdb, but even with your meaning
> you tell SW what to do - ignore hardware regulatory information.
> Property should not tell what SW should do with hardware. Property
> should tell what is happening here in the hardware. In this case: what
> is the reason behind.
>
> IOW, why user of a board in country X, where regulatory data says X,
> should have the correct regulatory data ignored?

Because users in X buy a board for X and the regulatory data says U.

Indeed when the ROM regulatory hint is set to US and the driver
reports this to the OS, the wireless-regdb restrictions for US are
applied. This would normally be fine, however the third radio in
WRT3200ACM and WRT32x, reports US on all models including those sold
in the EU and other non US markets. This creates a conflict with
radios 0 and 1, which report FR and also with my correct setting: BG.
With the wireless-regdb restrictions for US, FR and BG applied, radio
0 refuses to start.

Would you approve any of these or suggest a better name for the flag?
Should ROM be in upper or lower case?
I omitted 'in-ROM' to keep it short, because the driver check line is
already longer than 80 characters.
- marvell,ignore-regulatory-hint (current)
- marvell,ignore-regulatory-hint-in-ROM
- marvell,invalid-regulatory-hint-in-ROM
- marvell,invalid-regulatory-hint
- marvell,invalid-regulatory-ROM
- marvell,invalid-reg-hint-in-ROM

Krzysztof:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

I used these flags to keep everything in the same conversation:
--thread --in-reply-to
The documentation states I should always start a new thread for
multi-patch series. Note taken. Thank you for the links!

Kind regards,
Georgi Valkov
