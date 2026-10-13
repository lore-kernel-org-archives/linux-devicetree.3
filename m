Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A3538D94
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917777; cv=pass; b=ER11GmfxSXgvPUv9wb8ulc/kEy1Ir415vgIBlRNKeSG0lheE8y9bP1IWobt+jdVrZjRNEIu4fhAuRSNBg09qmmwBV2lNWOeMU4nSwlz6TE4VManU7RtEK1I1uTSNDekUvGOWFkXM+/XzPnktscJrWDa03OZhL0uzpNYzf40Tu5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917777; c=relaxed/simple;
	bh=Npz6MJpL4OKnNkDARrkMIsl8yNRoSsqdy7nWQsZF4+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5h3/faFE56PVQcLQKYqFrOnUtOfzczFFUAqD/UeUaCzAIy/KuDaZz2gH3dk4448GRcEiRUmPTUaZwj19TgnhpoDok2/nZHUmmJrLrAQjxKs+eBxIdSC+nZfgNFbQblEFAhCRJApJhrO01z//sFkiQ3cKC8YQqHbhcWBy1pSl2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3lQaqLb; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3lQaqLb"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so299424eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917776; cv=none;
        d=google.com; s=arc-20260327;
        b=bjBwnN6XbHXmrzPy9MRYTM1tv4zEFNGT/d5o/s2/6AB7JLFUdvaTcNSEqMG2f/b2jE
         rb6hQRL2SIn2Cf0BxPce8Mc5+nkmDMrg0LcQqRV0JGfJ93We5xaypjhdST0Iv3TuzQ2O
         6ZOvIKo4Gr7vslQeZ2F5qgQ4Q4SRxACdhnpmO5b9OLtoPrs7C9tyzzfA4PaBoEEn4O2n
         oDgcxVGE4V/1WNwCi7UJWQ8orrS/2kW46l6IkSWCfxAVDC1yVpZfBe/9DDO0hP5Jm4Jl
         j1UK2kuUotTOfbhfkMs2xpoc3Ou25FbLb0UgCpw8us7CkF/IekfNMLd0A8g8PV3oa7eM
         SIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        fh=oe/SsKWEcGLofRn3VUPUImohVqIPTPuQPO9FjEVkGfg=;
        b=cp3Bvqf4UXYR9IIRcImSoYTEmaIALJPp9UievnYNwPJ7/by1oHZSquLG9Ak7686aZR
         ymXN6dOMve2Lq6qDEHJKWD3l+MLKtd/StoSK/SYcJlwugGLUv0CyS30MrAvv0eRDw4BQ
         7gvRwMx5wtbtWpnLo5vu2FU0aghUMjC5w7ljur32OoB3JuJ5+dx9sOIUohiZSSJWx/h/
         sj7SyR83LNwpqT2R62FLfA+lCHvBXaZlLxHf3nonoWs2AnctdSkWDGQUjviYJFUKo/4R
         Ff9cCmMjDOUyEsgMXS9GqloweLH9vxj8545H8Gb1KC1io7F/hGUQJ1FiN4PxzwhDF0ph
         riGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917776; x=1792522576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=e3lQaqLb6B5aGi4qjkf7UDw3znnRWVPNZ/Xi+a/e49uRYul0g8nN3D+HFHfop7vbjL
         SUpnXHSx/ai8Clo9ZQZyGwK/BduRM55DGLUUFwuUfa7uKEmFbozcNJktf4WZYxBj9Wdp
         Sru/3KWrKuUurJ2O4T8SfucLWJvHrmhCf2J9BxbTGuR+e8KKU+5CjHCo/KoqWMLVosWz
         0ufpIlt4gYUzVkR7df1yx97L7SfuujTjvqhLZsw6akRiUJfRjO1e7Gkx+u2C1Yra2mvv
         FskhKDm1Oot32W6RsNRW0IgWfoKtIZT9g204eWHvYRquz7zcQD58g8vMh9V2Frh5QBTs
         5u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917776; x=1792522576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=ZZJA1D/ibkBp4wwcEPWmNHUV9h2F8s9o2LFikOMEXO0Kfhrvc9SlOHlauChMtCHl9L
         8Nh7sS0TLkzlY4k8LYXcOBkwsudXDZmv4HDlPbTHthtv6LjXDA4R6NhgFK0irW7f9qEt
         Cqvc2d+EX/OQcl5WRFlwXg17Hd2tzsieEhwiW8EUjpX21M1PoHTSJgOCnMHjkmVBoqty
         joVE84PsMdZyIGmrSVesaN+a92gMGC1NdV/QYNFaMeZ3UWBy3iSqgrRc8osBZpBhC4p1
         MwZy+yzitVfMkLMO6vpeWLtS/CmP3gAlRWOXOTohv5kl+CpZfjtk1Wh36f/FlEKFA2JZ
         HgyA==
X-Forwarded-Encrypted: i=1; AKwUvBx9s3dIUqHvC5jb20s9CLYARftt0ISm9LhiClwKG5tOz+BezXC/Fg8mIaJNI60i5fN9WqQ3+sMwwcsS@vger.kernel.org
X-Gm-Message-State: AFq9FYKGw3Z6/W/Q+lycJ24v22suoF8g5TBuoKNBDNFlDJzSFtyt3hIp
	ZE/qEuftowseh7gJBSYQ0V3VOEKUkGNv2SahqrEwfRNP95u+2uUj4pBk3oTCcRe0M8LSZfBzYFi
	j8tDOu8w6otN7JMFrJJtmgilbR/Gt6IQ=
X-Gm-Gg: AYBFou0MCZ6kCU9+Jvb1AAvSOLBrkNUxFotksYV5ESFXPeKBUlPnlQyAg4yLsLJYoxC
	255i/LwX1T922CSeg4AKgnfnH6eRnvU0944Pig06drYHjByLySlAy35SNYJ/2IoY840RfSo+hTW
	+jyd5139hi21+NrbMc+fxyQko+O6PTRsWACN5IyAt1K/8qzs+Zh+TuPkG6haXHbL2xjuudePErg
	r0HeMQTX+zXUBMh71OcniuE2JfymPpT3XrUEvBl0g2g1SczgYUUh/3bVKF0WUICdHqZAAUcCZvr
	Ixtguj30C2ginFJ/G8V/4Ce5yJRMyQsDhO95HuYMDUPLGQ8RxNRbrmoFiNGQxQocI0GN+iinDMm
	+SE1Nai+lHwFX
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id
 5a478bee46e88-359d728ec5amr11295040eec.25.1791917775546; Tue, 13 Oct 2026
 11:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
In-Reply-To: <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:03 +0300
X-Gm-Features: AclHuK_OtQxv-lLSRNaI0a5fKQ3a0f0GrZurL_z_b4XMUDM8898Nfx1Ak8Ju-Do
Message-ID: <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
2 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:32:26PM +0300, Svyatoslav Ryhel wrote:
> > Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> > machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> > (P990/star) and Samsung Captivate Glide (SGH-i927).
>
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 =
codec.
>
> Please make the entire comment a C++ one so things look more
> intentional.
>
> > +static const struct snd_kcontrol_new tegra_wm8994_controls[] =3D {
> > +     SOC_DAPM_PIN_SWITCH("Int Spk"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > +};
>
> There's no Line Out or FM Radio widgets, you should get errors during
> probe.

These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
used by LG Optimus 2X P990 (star) for FM Radio.
