Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02D49EC60
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968446; cv=pass; b=Yp5F5QtE1WT+k9rhGqb0Cjcl1mVSBNmoRzifBQ5lpV9KYc4kAizJLfB3XfD9PpZUEgTv5iBI3AoT8LpLEeUl2hNNn6DcHhBDmKqVQ5admdMAJn42M6my8nEgJ6ejSAOm2qXXE1H6fwP+a7oB537vCp4tau5XEygWPN7dTk6N9KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968446; c=relaxed/simple;
	bh=tLFxslh9baVvXmIpYm9o+POl3faCnXysDmFb2JzF7bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG/gTRE+vqL6fS4+HC+ZibIqmOo5DtXiC1cZqEGc8U+EWn9cPYYaintjzpROTUa1oXRcez5kGify7DnqC8wGiUZOVRxlZ8RaFbT5WgxI3YYtlc4coiVxb0XOu6ccW7qlgZJcyr4t5xP10zSP4RbjWgaK3KWRwE2W3VidKdFbUu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn4pgo0x; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn4pgo0x"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3653165eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 02:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791968443; cv=none;
        d=google.com; s=arc-20260327;
        b=lBL3+ArelGnpuSs0BlwQX6TxUJJn8FP/A1OlrVeLD6UIY0eBANzoVlG8uxptOyjrqt
         ZsVvvN39y8I6prTBsgdF1PFjDbNTPMF2Ps0zYoh/uOcHfYNUJoL48t+KT9muXil3ZkHu
         HY11yUkgRQy9lME7Z+NgsJgl54fH5epsFCofgpm3gb/tj6/J8ghA1e/5nxd7vZP1sdeq
         Kgy0cpz+ag4SFtzRtY5hOMn8+2xTDbBZAxPXyAvKRTL4N1o6riCjRR/nqts+4HWXFjeN
         2VEJt6po0ajpx0RUXEth7jtFsU5T0vQsiqEMZ8FRgixSJfCGuRMw8h1t2gMDC06zmN0m
         QBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        fh=Ml1zcEnKqEvu3WKBZ0NyVlLFx0zaLl4v5BZ1BBIKw6Y=;
        b=jejWqgzkt1943BtN0ItLp9B7+6XDNs8Zh879obTMbRSjYGSCnDiJ+SSwBKXUNhWM+F
         WKPaEkmn34InrDEu9NDIWdnpF8bohZYqdfn2i8VJRH4ziVN50kezYlNDp19hahOPz2+v
         Haa5/M+nRVVcVn6EpbvWv0Yf+UgOBMA/8LkFqLrmQMR1OpfzHKsKkUO2LnQWvmIqtOvl
         YC9zTh45so4Y48kXhGfnOMpuP7EBIA3Uw3k62PVeO2CgaI04Ngrdi/S9e41R3gAiXmZo
         wab3c0/3ZhfT0kihB+AgIAefzlw2rEjTWTCU0Euu1MNWu2P7TS/X3ScQYhMNi00TZ0/2
         Ux9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968443; x=1792573243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=dn4pgo0xHtSUKgUFKsL31ZRID9HudJwxvdKau/+p/4ayiXhPQ5paiDSZP6t/9jjHmc
         d/omFrVGUKCMKwvlIRp+nZ9mCceUM5c+IEu/cwSf0bU68i4yYHzZWIoP1xyFsz4G6oTV
         0R26qzCL3fJZk1t+lYLX1uvBMP7iiOfhd7pbPP0/sBBWh1onTAtNtf3tEUoz+xYImUwQ
         15R179ZvljmfPR77ebjef1Ll3pd9j+RR4Q7oa7GNfl3aBBAWWCpI4V7H8CBn6KtGEX/O
         hvM/MRYJkOIL1rHYPV/0Fd4sUJBDm9c8AFWYrkbAenpJM4AhFqRIybzKVnCN4yi+3MKH
         FLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968443; x=1792573243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=mT07/uUpCrRwXxFb7TQiaoRbM/wV+r20wVUvGPkwPRP+TNtcHSXNBfRTnfkGMUdBMM
         nVbRRDT5Kn1Ypvid8caj4eL5fz6KNhdjBSyQ3mTj58WIpUJLOSr28oZmjDZ+zU2GsHUT
         1IfDqtGvfRb3BhHVph8eaZWRH8BwsHfPe9zE2Q5sUoAdb6H+sSJizoqqEJRnPQro/H7i
         oWYY/l2TdwnN3AR9sOEBdDtf0YFMKast0q+ghIdXvwTMNrVuedibVQ8Ku6kNe8mwIZXR
         1sKprnj/ZtmxbRWBXT81bs2p43DjpEjy/p42c9Aw/Mgm3giCgAv60/pUTjs0si95jRxK
         E+Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxruYKy3IIf8FKVKiulshDpXYsrv7S8KeRz1iVlr1VWc1lBScwU6A7HOVryHdxFJ2v28JVGlXo/mXyy@vger.kernel.org
X-Gm-Message-State: AFq9FYJBF9yO15K77DpemYoyGRr7ZpLE0CJx7I0fgn5g0CbAj+ZmQpzt
	iV0pmCrF26fv3IizbT6qHWxiUYX2lSqmTRgpg04Ju9ygenVP1rDzSR+/p743jAFuBb1yOco86yE
	7vZBP+QRKUwrzyNa9iv6M88uLZtoUsW4=
X-Gm-Gg: AYBFou0F5dR0TrJijdNhSKgJXZ5Ae1di81Q9N+PTB/p+QtODgJ5H2mL+Ik3UKgPWYoH
	twy8Cr16fAu/oOoy3W8VFvHy6elGk6+aVLNd7Q6F1P8I/F9In8GsctVFxBT9OL8aDu9RiLCnGFS
	nx2OAdUknT00LwF40AmHxXg2veOD7D0FTBTPKaH09WS61+DjYSoixw4aDIHzjHlnZUIGv041dG5
	qiLq2py3ZCVNIyR6ZymNJCCJqnAZkb4AGzL1uEc7d0XXf8kAw/U268aWmaZWu6KoF/PQlfTgPZ+
	KMRWa/f5i3B1ILSr8BMX4zHsKrFFO/aYvlcgda+3BN8g2cZypI9U+QVvZWCNJT32JxYN1XH+SZ3
	30k5eIccC6IKK
X-Received: by 2002:a05:693c:8819:10b0:35e:7bfd:4613 with SMTP id
 5a478bee46e88-35e7bfd4881mr73051eec.40.1791968443288; Wed, 14 Oct 2026
 02:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk> <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
 <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
In-Reply-To: <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:00:31 +0300
X-Gm-Features: AclHuK_kokY8VK1sVn_A_0bMv0Bn9Zibgf0bMX5rADMwX9GRUM7_tx62sAWh914
Message-ID: <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
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

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Please make the entire comment a C++ one so things look more intentional.
>

May you please be more specific how the title comment should look?
Just to be sure we are on the same page here.

>
> > > > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > > > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > > > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > > > +};
>
> > > There's no Line Out or FM Radio widgets, you should get errors during
> > > probe.
>
> > These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
> > used by LG Optimus 2X P990 (star) for FM Radio.
>
> Those are reasons why someone might want to create Line Out or FM Radio
> for a system, but the fact remains that the machine driver uses those
> widgets without creating them.

Ohh, you are right. There is a missing asoc_machine fragment that adds

SND_SOC_DAPM_LINE("Line Out", NULL),
SND_SOC_DAPM_INPUT("FM Radio"),

If these are all required changes and you are ok with picking this
patch, may I reload it without delays?
