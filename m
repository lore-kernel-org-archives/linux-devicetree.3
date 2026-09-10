Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59D3B1EEF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066614; cv=pass; b=lPrGpZG1ii5y7Lz3skZPNNL+If5QAgeNSSA85FJgJCHQbpacYn9fXi+RJCw2WgPZj7eyckNzrLAfB1I5XtNQs9x8BkCSiPcRZoe6LzieprOCkc304S6jWG+mTZplviNyb9foAXKsD/7L1srnOrgwDAi6N5MsbzXw8a39vYf5n0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066614; c=relaxed/simple;
	bh=KYzmAlHaz7Clc/Y0Jls+1V6fGOjaYyOAWFoPDWex4WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8agoJAHYhhwQHr79zd3p9Zy9GTIrituCQcv4UZ+vZ5EsO5afywK2UsE8GoTboOGaOpiNuPFAzvEHTUlaVBvPAJpEVnMMJ3tnfLJSFSn9OczLg9iKw1q76y/fArMmzFLBSFzyejkgKSfKpXyVdDqFS2fvOng6ZtvmGQPt366YDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhyIEhiy; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhyIEhiy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2946dc8dbfso20795466b.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066611; cv=none;
        d=google.com; s=arc-20260327;
        b=Ms5FyM2MFzG92MrMuCXp60Vo9jGN2Gmal8i3/tJKnapgeSk4J1FQw92PYKdTNR26em
         PD4M4u9POLKt3x5ZDIiufa5FWofFUDzhGxPdzqtCPyP/B2t7QNI+8e1nlxO8FyOLours
         8ZQj7Az/HvCBwLx29ixu1pESup2gcB3EwWjmhPsi4/7SC407jR5xDEdqGLx1wjqj6KLs
         +ffM6vtB2S9xoRRtgGaZj3R8i9zRuZkf3kDh3gMeWumBsVkyUn5VBw8MyP8+HfGIhMDR
         oze1+Bq1xQqxpfNaNGX7J0oghsNAMMAhSs2/5pjda5Yay1vmb4tFdcEgO4qm5+IaPF5M
         gi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        fh=LUDUp6kystYAd6+sGXHHcom8a6eah/CeGcyBUouT6j4=;
        b=oOfLbs7gYiz2UWunXLJFaS140Vw8s+KSDH5qvDyZEJOeSvYd0GpY0+z4mu6WNZyPRm
         umzAu/h+TmwGNJx2K2qc/1gLRMmUV7+YV7ZCMav3oJvI5CoRwF8RoXhX5H2qzmDD3nRM
         uVbsKAM3Sc4RmpGGpsb/dSP8IhpSqGlyf3/dPrWBRPgilHcXFmnmTHT4z7Nu484l8Zyv
         qRM38bpDLA4cQgMWlfHVHV4ptxMMMitFWCvdjbgSmEgnH+WakmlsRzeVqOFEpX37uiZ2
         5i0S41kJEa/7L3z01dIIX8zjjkH6RfnGUz48R8aDlz/XHrj5a2cVrJj8DWMo3r5o1MdD
         lPVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066611; x=1789671411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=XhyIEhiye/PryYCft1Q3UIsTvAEO/LDR3QJ0eXsVi5VGaVLXWYjVlMWVpcK0oj/BFI
         T6UyeHHGz1UXty4xmtJCOwR4arM5KdrXuanUmEgWPOL6Dnc5fkQ4ZIcvKt6PemcpCPQT
         1BuhoaEkqYNm/UZbYQPW1HWbXWAznI3Z99eiM3HWb6/T83hbjggR0OaQB9pLpDoqpNz2
         7VBlzw7X+OUekiMmhbkk1WMAvFxnSBOtKuNcgsETgBS3AT+/qYr7u+rlq4WivoI0efUd
         R6HKGfLteQbO9v8p2nKLFwxDVE4d8TE3MnweXQFLCQDfR+SZ+sWDU9dEmRGehNVsHQB1
         ZMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066611; x=1789671411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=oeOVhGRMc2my4NjG6VOA+wbwWG2ZHsK6vtg6Q0XHcAy+G/iSkV+lAs+eQYXqHhvTOJ
         f07zxFOy+x1ExlmsHL2bOwDDC9XtEgkjYSyJwv1WLUVnbXyvYVsuSSp5YhY0f1QFOpti
         rexESpXQx98GqQz03P/CJzfl7D2FlQn8+d4JKN2HIbcoVzHSODp+u+BhqLQOzH0pXgo7
         ljSUVwce6n5eef/FH4QS5Hi7mSCOzTDurRsvxwi/FZBP81JvVdQEtFaQ1Qe8cyM0LsVQ
         R3azQU14GZTd3+tB01cNeLTvW5QMEgSatvPWm0yVRaWwF4euDJnefr35eMB6KyYxgo9w
         w+DA==
X-Gm-Message-State: AFuF++lO687ZB74SUff33IRWejVIHYPuSZkHIXcNMaLPwuEkDJTCWWJ5
	Ij/SqjEwjxP0QEE7SXHe3e832QBH4uLiYhkYrJyw+Mk8Psr+0n5AFkIMDVdeav/TH81oJB9XPHe
	RtAePv7hWHk9QU6QIe/UFNZq7yt6di9w=
X-Gm-Gg: AYBFou2gC6AYJfgPVQxbnMcm+MgSWM7z93EO06gScXkig4iKDprL202eeOnAW9gya0S
	L4NjRdfIBtcFQVuQPgUyjqRzzCkPeCKTWo+Dsm6gHOdxBhVG0Ds6hntIRt+QLhwUSSD4m9VDdcE
	VERuyBIzJk1eDIJ0DECGPe4VInZf9LwHDHhDlpDcUa84XBZ1aISNDF5HrNKWDvCYvvlCQ75V2Sl
	TExi2tmrGCQSoz1Jbb8A/TAZNHhOXCpl0/8b4/HdV9SVSbBb5CY0dODWCiF65ZicmNyohm02KYB
	stDwtBXcTaOYlIlul/XCRxE54QW38vrlvqMXQF+Oqp6JYAT4zws4toM/KQoi8SLbO4hH3p3G2fR
	o59aQmpT8lXVXW73igE/POAKwL6D7SSW6wn/oCNxfz7yuw0KUrd10x39Zo3nH9PnNidpNJr1utP
	gXTyUSPk7Y6Eb+zFfHvfv45DB+w+kEw7lmxxBLNZqc54zXqIg+aBxEL/ZA3UFifuvheQ==
X-Received: by 2002:a17:907:3e87:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c296668deb5mr944166b.30.1789066610568; Thu, 10 Sep 2026
 11:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
In-Reply-To: <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Sep 2026 11:56:39 -0700
X-Gm-Features: AcwNN1V6aaA1o2c79sKoypMBaKIL_zofsrFDIKG1O8uwY83YC9Mz1J-mEf9e4HU
Message-ID: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/9/26 17:12, Rosen Penev wrote:
> > Add it and set for gmac0, which is the only GMAC used on this board.
> >
> > nvram size found from a random bootlog online.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   v2: fix typo.
> >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++++=
+
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arc=
h/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > index c80ac16ad949..9ab618a097b1 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > @@ -25,6 +25,15 @@ memory@0 {
> >                     <0x88000000 0x08000000>;
> >       };
> >
> > +     nvram@1c080000 {
> > +             compatible =3D "brcm,nvram";
> > +             reg =3D <0x1c080000 0x180000>;
>
> Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> all of the chips?
To avoid probe errors on hardware where sizes are unknown.
> --
> Florian
