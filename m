Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F643DA54
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565132; cv=pass; b=G72LOVV9cl8i42+MqghKvPY1PmwlpHaZ7uOlSeehXmPI1zCjHrNaAFjxD67GtmPNBFU3SGkHhmBANkIttTryny9APEc07dv6nFFQsRxqwXiGN2S4JqPCh1IbfxhRs1mLjuuOOeJfCE+CeWxcmAN22Py2SPYYIi6LleeurFh6h5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565132; c=relaxed/simple;
	bh=ZUgVWP+5CRbJcY87dtrGHibty5kK4Hz+ViUR9U1LJr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzEq1lffKk/WbBI+Zhhi9rYKRR4Afvg2qL/7EKhLCK/ZpMqgfYC0/l1pgD8qRy97u2muKdCtGtffVMoXpp6pSgmKTieCn2Jc5GHc85Q502dwbdb9tyGKTuykLnDbnyIPYvlXuUANOh64TX/U793nKBkDIY98C2aqHP6+3MHZw2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=KsIW+2K0; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="KsIW+2K0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f7854678cso529981f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784565128; cv=none;
        d=google.com; s=arc-20260327;
        b=CDInvQM9I83b6mvHn4u/Qho1ZIAViFFDI7fP42eeNM4B8LwX2KJ4V6AQGE03Rno5tj
         MyEEfy3KgT/3iKcfl4Ly4JsLof2Mh+20RkNrCiGy7z7B1iGcMfN6FeIu9x32y97x93un
         LybrsdoFCaDVqzJ8jd2SW4P0rGvJhnjp8yFTahUGwt6Oc1boRLq1MPC3lzHVDAj9Z5WG
         ubX75IFcoWgFi3larFJzgRAPCZeVCYsAB/ELOWphBeNJ73kZYSAfMqrVZWc6OzVFwrEz
         zUWWqJqEjw1hmVJvQCp/ytqjnJZ6gyuajnaSmknAEQzYSZzY7R5nwQ85QwQW4vrpYszx
         IWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        fh=Y1fZGJ5dX/+wghtJ5VkRcPiYPXhgMJOAllyGNJupAwM=;
        b=TWUq1TSwRA0SIxBG+OmQG3Djjbu/OgtGO07Auj2dXJ9KhaSzg397W6oV0JirQ9YHJR
         JZ91sLGmzBa9rJILKW0jxAcB7x/4SdTnWCNVG7YpOpl6F+g0ntiZSDGFOMgmAroFKM/m
         RcgcR65lXTEnL+OYC5I1Doa8QTMF93zZP6RC644smS/mtVNakVTF9NbVnFso0wQc4e97
         i06kSxo/vBbmI32HOFBIdfUOHkIaqjQNbsUCP6cMkI381qpovyOi4PXCU9t1QTOMR3kd
         um6x0Vci3EwCrK+6FYGYDx75hf9/0CClBXDf45s2WKZsnOn/h9ADteKoSEomMEeys/Zf
         oRnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784565128; x=1785169928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        b=KsIW+2K0Qi9j2BgJwXK6DTBiYLdlkMnXYRmd6pMbDgSp5MK52c3r5dY4z4+GJHAP/D
         ofcmMSJn3pq8Gnfr2xyHAAQREL1zHdl5zu0QAqJfRd3DGRcT0waTsFKuA8HdvCcwWCp2
         fEWrSXMncV2q+vrs/gySKl0pfSxf+fo2szQ+zL2LW2MRaUqC77ie6ckCjlFxRehrHfvF
         EfJr34826KmWGeF5T5ZOK3x/JItS5cjlO80cTmsQ3EJ3eBOhYUQa6M43DCVfJXfnC3na
         hN9Y8uVI6aN+3Qaax2k/qvCJK8WIM+dk/mOa1akwAD9sGEsI4UxS5IvJ15QitPGcLjgw
         8oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565128; x=1785169928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3WkDgcpetADVJeebElQRx8U0XE51Xz8V40fvu5HPr8=;
        b=hBLGdAxb6kjZf+rFTn0CpVVosUDcXT6BouqOk+TeNHTPSjfoeIcprmlTC2vSxpo6Ii
         0pfkx/DKNb5ppRHbIIqlpzLYka+TgRwmsI51eGxcYDQYdMkrZarQzHT/CjqIs6CCd1O0
         atxmjCLi2JwVbsaN77fzgdseMtS1yEs+ZsQe+W0W+rPdHTevjDnIcHBwVYeIqgvfScz2
         4tKhmjRcXExhcdE0we3ALveMMClx8slhg1xPXnHKr5zK6A5kNLlo4OSEfIAgzEKuVmiS
         Pf9pZP0WPot0DFxHLD06NYv2zkSYheoIKg6axzK5dkNhK5UrYKrPVdhIrTWvK/It4w3/
         en5w==
X-Forwarded-Encrypted: i=1; AHgh+Ro/yLb6TTCAiFGzx6g4m+rlC9IrJDc5WXeW6xg984PJ1osKZ2Z/qDcvGCTUPQe+oc88TpBn09F+QTAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Zntr2PyZXIz9aywmlmtQih8nlvmE416kCQ8rsaB2ESaS5VGO
	fBZVhdZfia7oCZWJKh5GhHN5DwbDCJHOZ26Cvaw+xf3KopjlbEhfDpm0i5deR4cZ07CN1meb/VT
	IvcfmHVuPeWcNPcgIdrl28TZvDcr7QDg0ZmrnkjxkDA==
X-Gm-Gg: AR+sD11UyCdQ2UjuAAyMboIjS3JWH+3ne1Hc1gY4yvmooKhVBSkIg86Ly+BnwpjpqRP
	s18Yq9qtit9QTLshhEtuRqTbGJQh65UJRRFh0uU6HvbSyz7SpuNKtk0BB9fLiHaPevciaoawqQO
	gzoNLq7wEsNWf6koyJBTF3V97bAEpBeDIr6l3EURehYw0iaiGMe8DDUCqlRWWeJjDI+ghuPhigk
	CzWXLKhEQmRg5ZwK24hSbpH8NmEPrfzR8KG/irjPUxhRgyt2KNjQAakN1X2HF2kiB26M/KXRCNP
	M34fTVq2RWiAJQtVjhXeRleHxLd/0PHhLFRRPQmDZ0quScE=
X-Received: by 2002:a5d:584e:0:b0:47f:2bfd:853b with SMTP id
 ffacd0b85a97d-47f6231c4c7mr17158959f8f.29.1784565128076; Mon, 20 Jul 2026
 09:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
 <178412588365.243141.16731478852761544781.b4-review@b4>
In-Reply-To: <178412588365.243141.16731478852761544781.b4-review@b4>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Mon, 20 Jul 2026 18:31:57 +0200
X-Gm-Features: AUfX_mxLyiPGavSOWwXUG9eFwaMXBwlJv0WvqzHEORsF3kP_VRFIWjF3Kd9aWWM
Message-ID: <CAFi2wKZrya6aHAN9Wtwk43gqQTMPp1BamM9VKKQ+iH1UPzr4HA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dt=
s/aspeed/aspeed-g6.dtsi
> > index 56bb3b0444f7..ac351f01048f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> > @@ -658,6 +658,21 @@ ibt: ibt@140 {
> >                               };
> >                       };
> >
> > +                     pcie_lpc: pcie-lpc@1e789800 {
>
> lpc@1e789000 already maps 0x1e789000-0x1e78a000 and 0x1e789914 falls insi=
de it,

I agree that there is an overlap in address space in my patch.
I will fix this in a new revision.

> so you're describing a second `ast2600-lpc-v2` node which is unnecessary.
>
> Suggestion: Merge pcie_kcs4 into lpc@1e789000 and use 914 as offset. That=
 way
> you don't accidentally cause an overlap for the devices if you describe m=
ore in
> the future.

The 'kcs_bmc_aspeed' driver has the kcs channels address hard-coded.
If the 'reg' property does not contain the three addresses used by one
of the four channels, the driver returns -EINVAL.
So having a pcie-kcs4 with regs 0x914, 0x918 and 0x91c doesn't work.

This is why a second LPC node was added, for the pcie-kcs4 to have
regs 0x114, 0x118 and 0x11c;

I know we should write device tree sources based on hardware rather
than around driver limitations.
Changing how the driver behaves seems excessive for supporting KCS over PCI=
e.
I think a point can be made that the LPC over PCIe is a different LPC bus.

Regards,
Gr=C3=A9goire
