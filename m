Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E5572681
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194457; cv=pass; b=FC1aYJ2gFHJkvRdPBfnun3Ec81TcRYCK5bb2Iub+nyME7TLGii9G1AmZnMdiDFSk+AG9tIIFLE7/t79yz/jrd/F1Ot7DaXPRMtMnhiCIpK7SyHIZIL0dNLhKZamF+Dppgohtf3qT4wQ8aXBZsehQjzoVrhVqJ3MLzy7Iw6sWGPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194457; c=relaxed/simple;
	bh=qOYwtCPr1PxjrvDGfh2AOArCnIzBjh0iMMKj+uLMXjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKoB6UBmoR81yQdxl6i7Hhf0peFDGsog+jQPACNlljuTKVOhCUtvpv9DTDQ7knTl9hfEwWfquG1P18280CF1vySrZAYBKs3DBn3H6YMVpjAjvUn6qKexyzPZ/b5KE/X4p+lXP/LOUxSNfpCqpYGB+WCoRgHrr9foAs42T21iIwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saSnNjWQ; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saSnNjWQ"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so449049241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194440; cv=none;
        d=google.com; s=arc-20260327;
        b=cZ/joUZzOdsPVOoT9isrth9s95MwtvHOywq3dvOxdqp8F+AkEwkSDOH8Z8FCJIQ1AT
         nJ6TKqqkshyff8V1GkXf82MKxaNUj2loW+cV5pskgUHfuaBdCaj9I4lgUK67O8z8XEK5
         1oeTmanh5Gnj1G+EiL1YAgnowJrYUuNHVi+j6o83N6vpJH27TF5M74jEzA1TUUIDIp0e
         /Vl4bIr3NYa/40YMP9TX+6/jt7ogBIWVCNms/DEwPBGtZXW5PQdJ3G0d3ioCX2EB3IZB
         FoIn18Otz61SL/G8jzQzxa+6JOSMxBbmkYUy2+VMGNTqf2t7TAX/PERRiQdbjmU17opU
         h7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        fh=loZEnjaslOwzHthcOTDZhv0P6Ar71tTIPaI2iRcYbBE=;
        b=TrXi6wCHf/AClOCHoRM9ucvtWSCF83TCQAa5Org7JPpibJ70aGw0h9FeGENz9ZztQO
         LrYFQf6u/843BW3YLqQVz3zPbq64hlUmTk3WmsFiKE21YvlZfarlGagIE0w0nJwZNgAa
         KWnwKRTHHaA6qGdJqouLeRgiDJTkOTo2UWtoyoPD38hrxvC7Ly6UwHv4HR40J1pRjYXX
         T5MJJ8J05Ek57y2RaLqdQISrCH7VfW5sHadaFfyrTe8xFH7X7OCGkdg9Rflcydi6zQJG
         VjWMgQbj7Fje78B4zD6oP7u0rdVs126JuPRlMSNaGRp5KG3XOGzUKTTiQsQS8NL5o0Ji
         CwLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194440; x=1790799240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=saSnNjWQniJW2lT8LE9/W3Df2C1igopjCUZcnweu2hnNSFCjmSo9YjkPxILgLV9Vw2
         +c3F87QwQBrPQ/p5wq6bo5IkasgYRye/lmGoz+bosXL4ZqsgZtX2Yotbti4RgXMr6nMK
         WNt/AR5Wi46NelCfGZAvxniaWKCFDY8QvmnV8LgQtj79RL+oZZ2llbjMd17u1xvWBKDj
         Kwr7G/bT5qF07iofvMg2Vw9b6Tj37U7ybl78FyreZDOoAwI7n7MGXoC8+P5TgCwnE8WQ
         vlifTAoJCHCxO02zvxPRk4Oc6Zn6U46nGpWFJK5/0iLJPjuM1s/ou87hsMxVTZ/fybvK
         IG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194440; x=1790799240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=oydIdG4IgtMi9tr0YDHv9dTZMyhb1j5T47dNDsNj0u8J/PlXhFjTXODDUQCFXnUjes
         kz3YR1grj9wEuOpADIvnM9dLULik0QUHjjD9ljdQb2vmLpFUxYBPubTueUjXdUn8hcEc
         hoKXGDVteVmr3g5fNVXzDmJEumnlQxwdcN0/iBphSfEEGHduWKRaY1kLhB0XW42fJFz6
         ON4PsMGaM+q4M1iaUEe6h3Sh7Lsr4+MHvE3Ybd3JjfsHbuBXoe3HvgGhh+8B5qWMmfJk
         12w0MC2luUJ7EQYiYhgcSAsUC0i+o/QnBuQt+EJjzOGMasQO/86rmMAKglDaQuIu/Z1j
         iXWg==
X-Forwarded-Encrypted: i=1; AKwUvBzxSWuoDc9e1CrvQ2fLKLp2OKlcgysROWlrLB7/dQjKnYMjDpLuOXxCJlmzUxaaU4O14paUfpINRRYc@vger.kernel.org
X-Gm-Message-State: AFuF++n9syCjgBEHBRcxZXlyUNLeZGB7aja+tDdBMfwHz3gc8y4C+Brp
	vthWNSlVT8aX4yybeSTMWoDu9wC3cbaFjVuS7+1FP9ymK7r4gAgIX60sYB3AnY3b2WLPvpy/+xb
	Bm8oiC0ncNYQ70o2HjvwgbICQW2CCE6I=
X-Gm-Gg: AYBFou1JxoVl7w7qaEs7z2O9YvkBsEGxvR5d8+KGcUM3SILLZErBPSk/dCa+R0wvBEx
	NULuegCe7H3zX8RXOwnS1cH6EeoObtItUm8/SZlKl+cVmfsGEwHCWUhZUv+8vufMIXVFPuqpuNw
	R0RcqT2ayPy75O+QXiF1sWtPv2aymtFrE8HFB6kvlCAdNC6qZnMKJy62i0Wb3afpZkyzauBPV+a
	AclICNn11cOsrWKUXLhy9ioamG6+tNpBgs2S63RqaV9xZzrGK93s75+NuyfrDDZzqEsAWaDdhCL
	dA2bHjPeiXeSr2TL8ZuW0V/+TTVShVYnivowaadkDeMJMO4r+teDHVVhP52E44RDIARuqnkFksm
	mOFldZqN4GKe200D2adi0ATHCLSSasG1D6zIlKJ5TFtoI1RVOmxN+t/gjj78KuvWJtKS4Y0nyum
	Jit3eemvljc0fpO8CgobKrWcWsqU0k5XdngvaRGZUOBaxi
X-Received: by 2002:a05:6102:548b:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7af1c7a036amr305798137.6.1790194439982; Wed, 23 Sep 2026
 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
 <20260804-h616-pwm-v8-v8-2-db37ab8624ae@gmail.com> <arFMta6PPwmzSk86@monoceros>
 <CADvTj4r1sFjPko7G5DwrPUw9x1tPzQspJhCUmHSMtrudn7SXEQ@mail.gmail.com>
 <33e760ca-2bb4-4f1d-a736-7e74a97e60c4@bootlin.com> <CADvTj4rBUNF6EaKXbsy5t1cS0iakpWVdpQ5sQF2qLS4YyHM2aQ@mail.gmail.com>
 <58145d8f-dd16-4cc2-b2ea-d475462241ab@bootlin.com> <arOif-bN6JgLeWd3@monoceros>
In-Reply-To: <arOif-bN6JgLeWd3@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Sep 2026 14:13:48 -0600
X-Gm-Features: AclHuK9uNvVaV2VJoRguaZ7pkecy04Hwe0dR9Nt2OWuOrBNW9SpmIsO_os_jzFg
Message-ID: <CADvTj4q4G5doa-br_SvvcuSF0sMA6Vb3K8ogZL7xe=auEd_s+g@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard GENOUD <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> On Wed, Sep 23, 2026 at 09:16:28AM +0200, Richard GENOUD wrote:
> > Le 22/09/2026 =C3=A0 17:46, James Hilliard a =C3=A9crit :
> > > The resolution tradeoff is real, but the waveform API currently speci=
fies
> > > the ordering: choose the largest period not exceeding the request, th=
en
> > > the largest compatible duty length not exceeding the request, then th=
e
> > > offset. That's the ordering implemented in v9.
> >
> > The ordering stated by pwm_round_waveform_might_sleep() documentation i=
s
> > period_length_ns, duty_length_ns and then duty_offset_ns, but what abou=
t
> > duty steps?
> > It's not stated in there because it's not a user input, but still, it's=
 a
> > quite important value for a pulse width *modulator*.
>
> From my POV as someone who cares about many PWM lowlevel drivers, it
> would be ideal if there would be a generic function that only relies on
> conforming and ideally simple lowlevel drivers and work out a good
> period that makes the required amount of duty steps available.
>
> When I designed the requirements for the round-to-hw function I had in
> mind that it should be possible to find the next higher possible period
> for a given lower bound (and that works, only lacks implementation).
> Working out a period that has finegrained duty steps is harder but
> doable:
>
> But something like that should work:
>
>  - Pick a period P
>  - P*, D*, _ =3D round_to_hw(period=3DP, duty_cycle=3DP-1, duty_offset=3D=
0)
>  - Either take P* - D* as a measure for the finegrainedness, or continue
>    to research available steps using round_to_hw(period=3DP*,
>    duty_cycle=3DP*-1, duty_offset=3D0)
>  - If there are too little steps pick a different P and retry.

Thanks, that makes sense. A generic helper could build on the existing
rounding contract to select a period with the required duty resolution.

That looks fairly involved to get right across different controllers,
particularly defining the resolution requirement and keeping the search
bounded. I'd prefer to tackle it as a separate follow-up after the H616
series is merged, if that separation sounds reasonable to you.

For this series, I'll keep the driver following the existing period,
duty-length and offset rounding rules. Do you see any remaining issues
with v10 that need to be addressed before it can be merged?

>
> Best regards
> Uwe
