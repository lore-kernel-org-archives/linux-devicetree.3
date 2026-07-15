Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB513D332C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151596; cv=pass; b=bPVJ9vIE7wYu2ru9lOh3HV5i1iHYmUci41l5JgjjV8vu4nH6W4jYcuPJSkKj+HOl5pJEIgyKjvNIwqc6r8jXaUuwsJP1SgOiov526owIppfWh5CheX07IIuZ7MAxEbA2sjK8G0oKVzONb3A/iMvPGRNp5GHMnLjBQCAym+PNf1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151596; c=relaxed/simple;
	bh=CsvwPucuw+Ke8ThpJVLG/Iaipb3NGCgmvRxgL3GovcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2G40B0n/FGcKEhL6m80gBsnoaD9I8vlrwBJquzKV141ANIqt/y/xnIZXutj9Lt6nCLCCR762lrfuga7wAmU4ofET01vIIqCZBnzPj0ct6n4e0Tw8ZTOE4FWyoltNVcQnEBzPaqSBOwAjtYhClBQf/arZppGVM5c/9Tw5lT7skQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okhixzm1; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okhixzm1"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c00c21c58b2so91720066b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784151591; cv=none;
        d=google.com; s=arc-20260327;
        b=DiIF2EL2Y5WhEmuTDlo81B6kFcZmpZGYyC+nRT8ACgBAPO7g6CSlh1CNrnYZ3ls43g
         /sNEdoTWa7sak02Pg/+RUH1VTMOD2TNviwEJMIslGEGXAfFuX8IgbDbkYAGWUGz40+Wi
         CwoFTuL+UuOHi6AmZqW3vRF7ExdH66QEjTkxcvBaiRKDkA6FBViSp3F0zijVp6WN3oya
         T0aSOPOhiwGirh06sp4naIt4UIR1ucZf4X/CHvTsSUSJlPA+y+/X3aouGa8A5JSKdyAI
         N4Ukk0j5O5BeQJ3VBieepD/zqdchQCgSQzUtlNnVHR6wyIbdNybcdOEJ8O61xc883xiw
         0Vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        fh=+KqYGaAT42wNq8EocZN3OnFwmkXKRmmi58UwJtffrIQ=;
        b=cDHOmyr6C6KzDpqEFcJXjEsu86tQleomJFBcCHOq4vlSzIxHphe/8NK1OZ1S4JrMqy
         whitoUZle3VWO8WDH4PNGmmyEUJpSXPTMEzpTLPyJQD5YZFbEIIIA737HJ9lAfNf2AKK
         K+d8GrN6dmqJcxvlc60lqdV61RXnUL7UdAc0b9Ow6M6bzKEvfBq9etFn5pBG6OemHWIU
         S9pROuNgD8mgy1KUPBWDrnB5ZWk+lCTtomLrEEPUDecMvVa9S26T52rx3QeVD1/VCsTy
         Ql0C7Fc/B/KAUdkNdNjL/uB9NgRKQic5s2SPr+zM3TK0Sx5WNkcPfDwM8Zp3dKtgd9/C
         JNHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151591; x=1784756391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        b=okhixzm1cL/f45isRHCKp1QMBkP2YxDR/GGV+FoOjdW6JayvVmeIaA+BWX1/bHk6UX
         g0soFqMhJdoWLq4ianFiSjm9alDpFm4ppk4P28FOz6W8TKyeq95vBySP4WC7oaE8upSJ
         8VUnZNrSB0b3P5kraBKa+xfuoBvPnHkTOESwbGC3E+9K8aEsiHfw45LDeRyOvU+SJMow
         gfM6xHM7t8WIfjBW2qJIr8aKFdy288yZOH7bMp9Zuye/o1CCwvpgGUZULXH9QQXOIvCv
         tkD9VsYE24vWFdtYGWDPCaME2pNH/V4Q2pu9JZTRPeKhiAcKIoOYqAN01xiigVGFpNiV
         bHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151591; x=1784756391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        b=S3nJhJN4fX4A2IVu27SiA6aWXrUSAVdGnuwMl/qWfEOC3q4ZrdjAeR/IsnyeyjK5YL
         o0c+eWp1xFOswp9KWblX7lIhntovl008JA2YzT7b8n8YGp+O4w/XEpswhvJmbqVYwH4R
         gpX674w3xuMRQj5TFQA8uOdyqr0rOufyv4cxbe9MwYDEvxaBRwCr8td8oSg5ALA1coN+
         C4N6kgeqX1iprlSzymYFbk46OoZbV5+9toYUZlzmfWMqYGAcjpLpHjE1zzW7RWnvoEyZ
         oObAPfmkZ3+DFauEgY/d+82K/Ux/X4nNiVi/wlC2mGLikSYwUzwZ++mQ5Xud1wRyZsnZ
         4wLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrADSL/FaIp1JvmhtWRch14MUuRQ/bDjV8rlJ+kdYJJjfy+l3EBcRcdEbc1QUMARq6wDqyiGJV+Dpij@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhFY+YR1AEao1h5u3Dv5FsBdFgdKE74B2yufxgkHhig/jc+Oe
	neKwkcBRIt+JQ0jc9oC8jZj1w39Rv47slTPI68Py09zoJRF2py2snupAoSwbJv0fE/8dbvghO0p
	SYDDdOMMnbQdOAy+3jcAtkgnSM8QYNMg=
X-Gm-Gg: AfdE7cnbonImgpoDLVawnyxgi+QgOwyQYTShM6Rt8eq0UXQZBy83QMJCZqyc7gPkh76
	bNNlmEzh/n5k/FU9qEydB7x9426J0JxfNeSo+RDb2Mh82S1+3pIV0gmv+raF+WcHz6CarojVfH9
	8SrqPicvZ8tzpZO2mcfovPzsag/kYmZ+5SSCNqWAdTDiKTTDafjOJfG1hfjdvB9nb+iF+baFphi
	tNGSggwS03ggc8+MfhNiS18XAWUROe9ptqoq3G/tA1R4ykbVxqtxCWSk94Wcwq7
X-Received: by 2002:a17:907:c317:b0:c12:68f5:e083 with SMTP id
 a640c23a62f3a-c16794fbce8mr296353766b.64.1784151591115; Wed, 15 Jul 2026
 14:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com> <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
 <685d91a3-be6f-42c6-9e23-07629e21bcee@lunn.ch>
In-Reply-To: <685d91a3-be6f-42c6-9e23-07629e21bcee@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 05:39:39 +0800
X-Gm-Features: AUfX_myJ66lYjr_Qz6cecGRXkAPSo59po4VpMAdHmLlPvDjxBLGd-D-lw51lYoE
Message-ID: <CALj3r0hrKt7T6_aZJ_cOJ=akPgShsau6-whcrrWekJE6H-z05w@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> > I actually spent all night debugging call traces caused by the current
> > stmmac PCS lifetime management, and it was not a pleasant experience.
> > The code feels like accumulated technical debt that should be cleaned
> > up.
>
> Russell King will strongly agree with you, if he was around. The
> phylink integration into stmmac causes a lot of pain, and he wanted to
> rip it all out and start again. But doing that without breaking stuff
> is going to be interesting.
>
> If you feel up to it, have a go. But take a good look around first,
> make sure you understand the different variant, internal vs external
> PCS.
>
>         Andrew

Hi Andrew,

Thanks for sharing this. It's reassuring to know that I'm not alone in
finding this code painful.

I fully agree that ripping it out and starting over would be a huge
undertaking, and I'm definitely not confident enough to take that on
right now - especially given the risk of breaking existing platforms.
My current focus is on getting this RK3568 SGMII support into a
mergeable state, rather than attempting a full redesign of the
stmmac PCS layer.

That said, I'll keep this in mind. Once my current series lands and I
have a better understanding of the different PCS variants, maybe I'll
be in a better position to contribute to that long-term effort.

For now, I'll stick to the incremental fix that this series provides.

Thanks,
Coia
