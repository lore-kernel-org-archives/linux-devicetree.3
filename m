Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795002256;
	b=W6HBBJAA6uKsagMx5HzF+yv9tjt92kuR3GriKdyYfqYxm3mjuDkjvf7vuO27Hr2opFtU
	 +RJbDiq1lBQjj0i05Z41pjfdzuesWoMbXsL6TfTJj0nkFC4tDzo+ZtmO3QXqTTDsmgOXI
	 nVDCClRjkcucNXllJUKMa/0IGwIj5l333hgApSz+dxD5fAuBSGRzjUvqPAsUO3Y6Baoq2
	 OusRsjOxkZpM4ggtFEsPyqWPHCK8wENT6PBFb5RthFvRUW5J+FwJK2Tb3pCYwQSOXHSN/
	 7PZpyM1vwSpcj18lGespusQcrwWrR02Kh+kVi8x9j5HZ4sao2o3Yy+5nUAgZQeVtAhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
	b=XZZtuoBtKoO9I0mdoRm78hOBNSsThaIrxp6iBTB1oY7VJEgcEarEIhEREtLx8aMfgmwV
	 LUb5uitTMSmQ+1HEVhYf5i6U4sM4iIw4mCHEy9ky9FZwYnqNjzbEyvN3MpUtbdQln10ri
	 QKZtptYh4lskR9605BBcfvF9j9yv0JFtSZJpIs7eFCfqHQPjMQ0OjaDjU4LDDt5jWdipD
	 fQKJDO1nHEuENC5I/0OlbymPXwa6vIvvCHY9GN6wiJEPW4XVzEYu8o+Mk00GriC2VolvP
	 bhUFjoKhCvbEl7p496GIneO2dY1tybjdtH0McfZKH6RNJ9vs645ZHlk1kjJLMSXEEcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN7BU0u6;
	arc=fail smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27210606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27210606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jN7BU0u6
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so115249466b.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002254; cv=none;
        d=google.com; s=arc-20260327;
        b=ayZ2AUu/NcKdykXLcPB6ER+hKef518rfW/o4Qr6dkVJlwjM/Bbmv+Cu/WhnUJbttxo
         YFhxmmVlees4ms44ksQC0TrQs+HeNPNrtWlg9XsXYOmHuLIYP20VU4b6JEticyOSBpvl
         ZV/l4HEfGI7v/+lSoQoJ/3rafxnBpDOSRjFUI+vyyFCMjNq6nDZZlKsO9GveUhEOVu1p
         neJWtlb3w+ehCaw00hMbcZDhRsMFPNICdF3Cs07epRj/3BHE+1dqEfKBQamGTPJTqjc4
         /o8Hdu5wD7x+jhOQbwsXi3ZxIoWOh432KVJGk+64yxbEuWKdLrqw01yhuIQALfNhR7eT
         ZezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        fh=fRbI4M3tGVdpRpK1HWyvWAq9B7h2Ro+M3W6SPXToVbo=;
        b=Phh0T3br5gWRSUk4dL4r3K1U1gbzDHyTiP4eWJRaKDJOxPV9r//Je2XTGtKZO6k6cO
         IrH4v4JXj+tX4f3IyEhOaaFL5ymqJ0CZhCYUN8HOCnUEbvxSF9EdDLJbe8ooiY11lG6s
         cHnhZqXgHe2T5QfRFpbW0YC/C07lg68nVjjQhgQVTa0Hwtf+/oznfPDQvP/w2p29QWLi
         oKGXhUv0f8hMlO99XRT74RJHEbMB7PWQZBnZQsqTmvf7lq0iCQuKgBoBfTLY0oxJvmiu
         oAs3gzFsz0i/cm+0o1Bi+fmhza99vkT8K163eolO905mHNyLEh0Ec72BfcQJv1HG+j7Z
         3SHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002254; x=1795607054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        b=jN7BU0u6VeM5zSAfAgsDJ9IyShENVOOHKCcCU6Tj6O5lMwlQz+dubJKsJAYbwPU7yJ
         6hsznruHd45cPNEkXsTvlDysvzMk2ZekMgtQWKk54R/4tCebZc41mm6s7okNdb5m/NZl
         Q3VkLw7qfhudVbmDNpoB/D9KEr+jg17v8jaaPzVjx7sRtQgGFWTP7hF6eAPFz4h6Umj5
         YoRqzs5n7yRe9aXS6QamGXu9HojILioBaDIJl5DvivDrY1HkkgGMLnJeAzGKpOmrxinI
         sH/qNInFGi/hCvH9VZ84h3bTKkzH/RRvY0dutglXPcJEJriQ0Pwm++QTnPDizZkEh1S6
         QjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002254; x=1795607054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wxyVYogwlbLITEcqMPp6Ab4ibF5XqXtt1YOnFTe6FI=;
        b=xqfyAFn9+ss38chbE7CtVZ8wwqqWt0FUT485/ugdCXiBPYkPB4jI7Wm/jz3bP0QQ10
         +995gT528/6JuR6sHswbU6m9+zGEj4Zf7+F0C8R0PKeKY4rmDhGyT+n+y5GwwPbdTSVb
         MHTlBNcReCu4Y7gb945V/G54y6gtQ+GxrUOyytdZeXDpOtPM9mqft9+HqQC8xL6N9Tx2
         0Qj9zQneDjBhy6P/luwzenLgDeTA1Zqf3X8Gf+vAJrEMfAIqPQLm4fRhY+PhYSvveBmV
         ME4xspwlJxCdPBNjybvGPB0pfMxWM/1TLUjqgq2b7UiIiXqxzn9dnf6diEO6NAB7xKuZ
         5+/A==
X-Forwarded-Encrypted: i=1; AL+hErGKP6fskNuAIuNgmlm1R2DmKkZpPmirt+xf3IEHjQ1/IgXdlz+QKkJSZu42QRT8aay00Q3aAwncxlR4@vger.kernel.org
X-Gm-Message-State: APuU4Z9pJORs1aLEIdon5GOhrtXgOSbGGL7sUws3CCFR7nbicmnACK76
	BUb8OXR+bmrIKOIcB20tnBPVWZn65xDk32AN+4Xa6RZN48066RDL8ojFgNhxQu/wBaT3as/Je2U
	e6hqAYPgzayR7sbmLGUtg/yad4braNruDPQ==
X-Gm-Gg: AYBFou1P8gQukdq9ac6LqwF/8/S35fQLqruwkuaz6BMsl/KX2U2RuYuwLNhcBFWQDQ4
	keDA2/BXV0c/56FBUO/yPIvxLD1J9Ji0tVg0RZV/NW6nDu6+w1WwmQMJR++laQn/R5qmxzbVzDX
	GzWrBUCZDSuIu+U7Qbrd20idnNEVO47dErVZ6okILLfQt9JdUpQiZaid2uI+A4W5uCy2WVzMnHP
	AWgWmBav3meciDh/zIf1JXsRcVc2I1HeksWNJ0NdlFocCcbF5UiVrQwrQl3Y3w/vtk8nXBsk6K+
	JHQ/e0Q2z/ZWeDy8MLVIP89lgkQcSYq3mhQ9i6yb1CkLjgXn1UD+rPFeMx8ZQn6lBGg32HJN6Hv
	OKWgjWEeUmwS/rKJD6qZSNyBKiBWJsCd09h2PM7ZEW6nNjdNzkmmUlF48v5bGqHowf2mrcACqcM
	M8fBPu05cQyOG51Ygm84s+WvCSJ3+Rlw==
X-Received: by 2002:a17:907:2d08:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c510e4c7b01mr203942866b.32.1795002254458; Wed, 18 Nov 2026
 03:44:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro> <20251021132529.GA4133357-robh@kernel.org>
 <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com>
 <20261118091334.3d51a5f0@bootlin.com> <CAPVz0n3=rL9jVc7DtG9FmcH0zs11+LXg1+HRRf9aagUqZf=+_g@mail.gmail.com>
 <av2Nb_likDLz1u2c@shikoro>
In-Reply-To: <av2Nb_likDLz1u2c@shikoro>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 13:44:00 +0200
X-Gm-Features: AclHuK96an4qc5B-PYbtLDwncBYBe2347MxD2hcXG5FWth-Tpd6Gs4iX79m0kGo
Message-ID: <CAPVz0n2rZSRAz2NJsPUXYncgEAi9cFGM0ApfarFq5uMoO9LqsQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Luca Ceresoli <luca@lucaceresoli.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:3=
5 Wolfram Sang
<wsa+renesas@sang-engineering.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav, and Herv=C3=A9, and all,
>
> > > > > > So, if you want upstream supported I2C hot-plugging, you need t=
o wait
> > > > > > for Luca's and Herve's work being accepted. Or provide a superi=
or
> > > > > > solution. Or, if you want, join the ride. You already have expe=
rience in
> > > > > > this field (and hardware plus use case), you would be a very we=
lcome
> > > > > > contributor, I would say.
> > > > >
> > > > > Agreed.
> > > > >
> > > > > What really slows things down is when there is only 1 user of a n=
ew
> > > > > binding. Too many times have I accepted one only for the 2nd user=
 to
> > > > > show up right after accepting it and wanting something different.=
 So
> > > > > now I just require more than 1 user and it is on the submitter(s)=
 to do
> > > > > that. After all, it is their itch, not mine.
>
> For completeness, let me emphasize the above paragraphs again.
>
> > > No new advancements. I moved on a prerequisite: Having support for ad=
don
> > > format in dtb in order to have support for a list of exported symbols
> > > resolution when an dtb is applied on a live devicetree.
>
> Well, I would consider advancements in prerequisites also advancements.
>
> > > Anyway, the v3 series [1] need to be updated and a new iteration need=
 to be
> > > sent. Also, same operations need to be done on the SPI version [2].
>
> Herv=C3=A9, is that the next planned step or are there prerequisites need=
ed
> still?
>
> > Rob, Wolfram, since the DT Addon framework is not mature yet, may
> > i2c-hotplug-gpio be accepted in some form? Maybe a staging driver or
>
> I vote against it. Accepting intermediate solutions will slow down the
> proper solution even more.
>
> > with notes that ABI may be changed and are unstable or maybe as a
> > device specific driver only for transformers like
> > "asus-transformer-dock" etc?
>
> Which kernel are you using? Can't you use your driver downstream instead
> of upstream unless Herve's work is usable?
>

You are very "helpful".

> Happy hacking,
>
>    Wolfram
>
