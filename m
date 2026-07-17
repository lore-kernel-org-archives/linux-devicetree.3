Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813C3AC0C0
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784269729; cv=pass; b=c4HD73p3G4+DFSkL0LgtM8MDXxhSmkz6WYN7bbXcUU5XRZcAM7KS9mxzzLu0VqUEMcyPpuQEv9FFFV03BF5Ve5ruWk3VUM+yc+WIYDtsxD9DP61ZC89jZLKzA4CTzYu+SmPRRc0Q3HwAxnFLN8kGzexE0+Uubgi4+UPEoEDVzKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784269729; c=relaxed/simple;
	bh=bhRgODpHz+FKT0ULr5bfkIJQG5tlEx/n40to0ZYuwaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEYohqG/g+FrBPFuwRmMFlIL8NHuHbUZYmgvXdPwmRHkzcrnVKH5dYZNJh6u6TD9OAs8nYoPDET8Z35XQGmBYD9WH1L02U3x5l3nYg5wNS6Y0Tac9bJ+ZN6pVcXQnS/bYKlFrnQSbUIjFH02uWP4J2fasgO+XaKiOMr22nRSVG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIPRUvrD; arc=pass smtp.client-ip=74.125.228.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIPRUvrD"
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-69c13c316ffso1074048a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784269725; cv=none;
        d=google.com; s=arc-20260327;
        b=ks7uNVkjgxo0LqDmOv5u1NsarmeNgy1SnzJ3m+tNgPQtuLkBQfhdFPDhxDm56GXbnc
         OuorIxsPHN4ypmHgIPlsfjcBiLMX79R/JWxwY/6MCbyvUCjt+Kk1CHrwNkW/oDY6BQOQ
         YeExXlsB4DehaC7NGsY68rb3se9M1rK2svTNIQRfO2cbVTumhAA4wfBNDWZoFBFtJwQg
         Q21NbW+Px47zftfTPzt7rqqMV3gsAWmVxVRiOcSYyPnTy75mwBbPQfy1PDRxJG7Y3enr
         FS1T3z5J0ssBlctuQJtgEJhVjSmhAEzQYEtQyNwqfSid4Hp+SG/L07NFNfxVrTrdtdJ7
         q+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        fh=08YXqcdBnCU3oSfMAehCDdc8WN/SqKW8PmbtLqtXedI=;
        b=W1xBxQNfHmXR+l2e8CxCj9vvywyITOTHEtYP+/97WS+KQa3OjpyqqNaeb1rsm2eWWd
         +u1g2MxBQU0MwssN88LKOO5EIIQLkoa1JLhcLXa9MfZpGR4+kLymq11bXnj4XN3S4pzV
         zyp0l4oi1vDBcEjJ90jRm0XtgRfZZvoA2YzaQkAqmr6cvx6xshibS3+AxELSTRpVyI3D
         EiCDVVknEpp4M0QrSYoGHKknSEmttosKE1VB4zOAFGNto7D/LCduZPPjVSlXLTefH4ta
         G/W04quAmYugPUldyyp8zmaAK7vi+sKCrTDh122s/ZjDI5Efm9NjxC0I942pRTIB07ze
         99Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784269725; x=1784874525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        b=dIPRUvrDMeow4KC2lew6MhHrPpECEFpTuYNDm3MGDg+WAmwgu/Bwa6e3eP1H7R18ZN
         5Gl0t6w+V5eHQjPR7KpJ1eGmDDm//FZ7jyoCCI4qOw0zknK+R+2vCVoOHWbCFN6I0Wv3
         uOvUmM9y58g8GfqaQLCSZj+F232jpJGTVxCT1rA9x3uHnr5S8EYHQVRsOf4oWlmtzuoT
         ukfOHL/bIv71VX28QmI9xWJXHfq522R60jfGVPs9FTPugBoZnIauy8RjZ8utQL6zJxIi
         4hexyzzH8e9be3cs11OH4aIRI3kijnfheXzEL2pFPUABemUERiHVssRUBQqCy9CAwO5x
         iAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784269725; x=1784874525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHiP6evwjPbQqK8L1EQutQLTUMUz7gccfKbMReIBbck=;
        b=TKFa2PLPNCYGa28FeLpPASbdMzn3HeTVhOXdVEXBIWBj8A8J/m4xxa/ebhnARYm8lv
         p0vartGd/jEG9IvL+amasyMyOfJBpcKjrqwzxlckfFS1rYKc7GZSZjbML7Wu9TtGEJ89
         kXohmvgNXcdI1QCWY86Jp0FjIPc/1WZadC7rNJ+6GIr/umhhyd42+l6O/ub2XZxjqNuw
         eFMYIQ8/b+dSF0TXFLPHFKWZ1OnhNU/wOS1myet/MgX4KWyDjv02ldBALGUxDUpvh3ry
         p7i7wqld/MYjlwxmonCmKlzmQKV0gW3vwyViyo0ePQQ68yInBRh5mvjyQi5S9F1tzbzC
         Avkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8g6nXCTdhatQ8jWzQ49q+3RTh/V0qRnHaYK7kABxiduoWXKiclkJihpgN4KmNB9i5SMSJF86e/3w+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13DjQNzbuqpvHFQFA68TjpX47THo78bhMWT1tbQkjpvag7tdY
	HJDxpT2O/ag2apYEwNfX+G1B62bl4ptms0PFHkKWLn1MMPXeqngOOl9vl6D1mrU2o/G6DHvCaM6
	C/vL7kilOG9pwAFBKowvXKfQtBX13J6M=
X-Gm-Gg: AfdE7ck73X4N8FIxj5q3+DMkThoSAH/cE4GkCMG3C1samYKP58e8LB19d9tAQ8of6E+
	WFkl0XMVXLFG6GpIJRjAP6k+v1p0rdozPSIsu+CrUIx36QPhUeENsfbfqg6L6qh65J0+7vTY5D2
	JJJEL0/V+QATcGwe2RfMeSEH4tOaLeDyz4wBjRtWv9FuwuiH0FS97NW/PioLujWxL8hp9x43JQY
	w2j/pZeONQj95nXc2WJq0Fc+mBUDxV6uo0E4SZ2njk26EpRDq/59rbRRerlM3dZ
X-Received: by 2002:a17:907:c248:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c16b4002edbmr59028266b.2.1784269724589; Thu, 16 Jul 2026
 23:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch> <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
 <000c01dd1593$2ac0b0f0$804212d0$@trustnetic.com>
In-Reply-To: <000c01dd1593$2ac0b0f0$804212d0$@trustnetic.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 17 Jul 2026 14:28:33 +0800
X-Gm-Features: AUfX_myHBcwddy6Oo5pOOK0tb7eS6ZkIgRUXXggid3ZrYcHNKgmGXLOcuUDQTlg
Message-ID: <CALj3r0hH=mF+8oVbisoECYo6HRuSdfSt_nuhFunHowyPsw2srQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Andrew Lunn <andrew@lunn.ch>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Mengyuan Lou <mengyuanlou@net-swift.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiawen Wu <jiawenwu@trustnetic.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=94 10:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jul 15, 2026 7:05 AM, Coia Prant wrote:
> > Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=B8=89 06:44=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> > > > Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> > >
> > > You do not appear to Cc: the Wangxun NIC people. It would be good to
> > > have there comments on this change.
> >
> > I apologize; the output from get_maintainer.pl is very long. I=E2=80=99=
ve
> > heard that having too many recipients can cause the PATCH to be
> > rejected by the LKML mail server.
> >
> > I have added Wangxun maintainer (Jiawen Wu <jiawenwu@trustnetic.com>
> > and Mengyuan Lou <mengyuanlou@net-swift.com>) to the CC list.
> >
> > > > Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII =
mode")
> > > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > >
> > > Please don't mix fixed and new code. Is this a real fix? Should it be
> > > back ported to stable?
> >
> > I am not sure if this is a specific characteristic of Wangxun NICs, as
> > I do not have any available for testing.
> >
> > The behavior of the Rockchip DW XPCS IP core matches what is described
> > in the commit message (even though phylink brings the link to down
> > based on the phydev link status).
> >
> > This appears to be a bug (at least on Rockchip platforms) or Wangxun
> > NICs features.
> >
> > However, I cannot confirm whether Wangxun NICs behave the same way.
> > Therefore, I have kept their code as is for now.
> >
> > Could a Wangxun NICs maintainer provide some feedback based on testing?
> >
> > If we can confirm that this is indeed a bug, I can submit a separate fi=
x.
> >
> > I would greatly appreciate it.
> >
> > Thanks.
>
> Hi Coia,
>
> I have tested this patch and it works on Wangxun NICs, thanks.
>
> The commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mo=
de")
> is too long ago for me to recall exactly what that thought was.
>
> The log shows:
>
> "On this device, CL37_ANSGM_STS (bit[4:1] of VR_MII_AN_INTR_STS) indicate=
s
> the status received from remote link during the auto-negotiation, and
> self-clear after the auto-negotiation is complete.
> Meanwhile, CL37_ANCMPLT_INTR will be set to 1, to indicate CL37 AN is
> complete. So add another way to get the state for CL37 SGMII."
>
> I tried to reproduce this issue, but it didn't seem to exist.
> In the current logic:
>
> link up -> read status from CL37_ANSGM_STS -> CL37_ANCMPLT_INTR not clear
> link down -> read status from BMCR -> CL37_ANCMPLT_INTR clear
>
> It also works, although CL37_ANCMPLT_INTR is not cleared every time, and =
AN
> restart is absent. But BMCR looks like it only wants to be return as 0, i=
t is
> weird.
>
> So I think Wangxun NICs also can be applied to general code as well, for
> getting state in C37 SGMII mode.

Hi Jiawen,

Thanks so much for testing and confirming that the patch works on Wangxun
NICs. That's a huge relief.

You're right to ask about the CL37_ANCMPLT_INTR clear and ANRESTART. Let
me explain what I observed on RK3568.

The key difference is that on RK3568's XPCS, we're working in the MAC
side (TX_CONFIG =3D 0), whereas on Wangxun it seems you're in the PHY side
(TX_CONFIG =3D 1). This is based on the commit 2a22b7ae2fa3 where you set
TX_CONFIG =3D 1.

> However, I am wondering whether CL37_ANCMPLT_INTR clear and ANRESTART are
> necessary.

On the RK3568 (MAC side), according to the DesignWare XPCS TRM, the
hardware behavior is as follows:

- After a software reset (BMCR_RESET), ANENABLE is automatically set to 1
  (the hardware reset value). So auto-negotiation starts automatically.

- When the link is up, CL37_ANSGM_STS contains the negotiated speed/duplex
  and the link status.

- When the link goes down, CL37_ANSGM_STS becomes all zero, but
  CL37_ANCMPLT_INTR remains set to 1.

- Crucially, the PCS does **not** automatically restart AN when the link
  comes back up. Without an explicit ANRESTART, the link stays down
  forever.

So on RK3568, the ANRESTART is mandatory to recover from a link-down
event. Without it, the link never comes back up after a cable disconnect.

In my current logic:

1. If CL37_ANSGM_STS has valid speed/duplex bits, report the link as up
   and return.

2. If CL37_ANSGM_STS is zero but CL37_ANCMPLT_INTR is set, the link is
   down. We clear the interrupt and issue an ANRESTART to start a new
   negotiation.

This works reliably on RK3568 in SGMII MAC side mode.

Since you confirmed that the general code path also works on Wangxun, I
wonder: does the ANRESTART also work on your side? If yes, perhaps we can
make this the common path for all hardware, not just RK3568.

If you can test the ANRESTART logic on Wangxun and it works, I'd be happy
to submit a standalone fix that makes this the common code path.

Otherwise, the current approach (skipping the ANRESTART trigger on
Wangxun NICs in c37_sgmii_get_state) remains safe.

If you're comfortable with the change, I'd appreciate it if you could add
your Tested-by tag to the commit. I'll also make sure to include you on
the CC list for any future revisions or related fixes.

Thanks again for testing!
