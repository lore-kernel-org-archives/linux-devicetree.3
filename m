Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754121;
	b=uLbUdDuMBxdMY5ctKHqQrIwb9zx7kf+i8o4ndLtL6z1rm7imyZNq18Ls9bk/udpEzMiV
	 i2Ts0jg9RYk4jtdBX+N3Z+SWvzNHyJb/OaYtGRVkfD+DJsAr3+PFxp60Q53+pCHcgWQlm
	 pf1VAAOHHMsU0rkuPfkE0GCcQH23RHSZUOkm5CzgOIsskuT9IcMJgqHw79rAeVxIEigXr
	 YwElqo+pi2uSfwtpKPg7e9AOgrb+9YHcWqhS0ppXUYTty4xFZdfc0y/jBpo5mCbetKW6P
	 DqdnNk+yB92sE7zjw7USHDQh0yrGuoX6vpGlgJsdVs0QqFUpsEEdSfahAqIoVUnbnqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
	b=ax/Gu/Oly/28cRj+4d3K/Ord6I3C1L/dIOcnZ/1MuEcY6kHoRDdw1SNp0jdN6D+TUqqY
	 fC9NRhKPJpeT6Cox8j8Onry/E7Y8wuffEae8PFRA1cqHMCmyJOMQQCG4jcm91is00gUt9
	 WDg/C0tOba/0kle6h9mspv/ckrKn3rLiGKiM50wu+Ap7hNld86kggiv2fPQMWwv70SkVU
	 CStHhyAbH1wQObn6103hmQYEierDGbKIV/Bw3CqWSgrtgUPrSCurTyjDISHluEB6SGh2A
	 PzKV/CNwzLvICWvDmd9SS0ntG1yeEwXV5lgsqGpvooJBztNIInQfbXg75VEeSDuA59g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FE606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so685945a91.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754120; x=1793358920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=gB7ZU72TlDrjtJg2VoknUpiMrc5WLYdiqf4lkuMe3uifTtYoe7UpNL2lsmXJmD9kvH
         SsLAi0bz0acbuZguvc/MJxABOwXflROvoJ8fXKuCex/V5dfSWnupFH2RRwK3EOJ/0Bge
         6F4Y3MDGJP6oj474/IOPZ1XnA9Bd43ACAeZzQ9CAx/aKusmx4s3DpnEIg1st86GSMR6o
         S2TXN+ak0DiSPieJLTyV8uyQ3co2B/kCLvqlJA3wcwQFQFtCjjXuv6dX1SqYeofFleQD
         vgTpIYXMp/KtAvZtXa3YCiB2P4VG66t2hbESu+Ea3WYI63IPpSbD6lJiuDhV+6rcB48z
         AkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754120; x=1793358920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=vblFyNhUonSzNndSq5HYpT8M/gfAIJ+eLZRzdDHm9c6lZRpfmmHA6TrsbAEnRzqeBU
         FdXAxJ2QpNNH6u9LL1Z2Su2jwvE9qssLWbEqvxRGnzJJ9WSyR/IypenRi3qOFjtTGHuo
         UmwkjbI25jV14y14m7YapikYeOo6jkz5uf1nDOVuna8YtqgL3sGh9Uo7WA6UbRts+gxk
         T0yCtryzqIkV62ZOZgCX9eQbAcQ5+4vCQrGlgxvtNyP3Xdt229O9+P98FCJIZM3nNtiE
         7kwZWMFmMxxsaGHoVlDtzbR9cbodKQT4ODU/fNNgh3VtXXl1YyyKzaLEslyIh/DKVnHW
         o1Bg==
X-Forwarded-Encrypted: i=1; AKwUvByp7TzlEI4TNSagUom3Tm4EqatAFfP6OIPR05Hk3oLlSui7iUS0bz8zHB6NmR1YsharBaFiEgUs+PoX@vger.kernel.org
X-Gm-Message-State: AFq9FYK4ggQHnI2YMmLSu62GhzlioYH1wzKJly66t3XHfbrZfIDdvkF8
	4tVbkqVgnhaJ5KVIJSQRzFrU/U4pxyWwdHTBf9mPXwJ97HvUCWQSEA/x
X-Gm-Gg: AYBFou3gyTricrAzrQa/xPB1iu94APBMHKlH91rp2QNIs+Pq/65TOOsHhYcyolBb/0z
	q6SnIDpIxsi1qx3x1JVW3H2SWHgvr82ycXbK5NFcKxK+GwikTtdPqfsNwqT2dpqWVqxgOG4anvu
	c9jXHNes8KDQbrKoZIZ8jmpTrcssR06KY+/CFpssHB1hKIIKNlaz6u4c7mj7ldsen49Hlps+Y5r
	veWxbqRKbHee5bRN3gbVItuRuHjxt+H2kXECeXX3t7X/PKu2MUCdT16AbU416KuyhHcv6JD1Lhc
	2ym7gxKNzLVf4MHW9oVs0fjoBK1xmesy7eHFJcGbjp9w9WebC2nKIn5Btb4J3NVMrRTcarefQ/d
	uhH49Lu6+HPqK6RuHI/kR8wT5ThWSth5QVAWKts017SRhv/gensswmVoF5+VTRX0e/vVJEsA5H2
	t4VsyPN11ZABuYt9g+0tm2HuUbWjs1kas1NdNfPRVL9dSS7oPLJrPxjSIGIQSEbfxWyC/EsSkfa
	strkNzWGFJ15LLGtjyefwd2bzRd7aSCLOMDPy5I4DACTmaBWOiALspN2VQ79wnlDQ1rTGLBzFS8
	MKtenD2N06qBBE0PiCQljpSngyH9W/PayfCu14xqwJlCr6iHxtY=
X-Received: by 2002:a17:90b:3f8d:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3adce7a5a5amr1475790a91.19.1792754120415;
        Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2ae880fsm1037959a91.3.2026.10.23.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:15:19 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 08:15:07 -0300
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: iio: frequency: add
 adi,ad9910-axi-backend
Message-ID: <hx6lt2u5j5yh3iez5zimolukip4a6ak36rdqridrvaz7bb25hw@6blwtzy2iuat>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-3-0ff7f0bff326@analog.com>
 <20261022-banish-scenic-030717ca503e@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-banish-scenic-030717ca503e@spud>

On 22/10/26 19:38, Conor Dooley wrote:
> On Thu, Oct 22, 2026 at 12:19:01PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add bindings for the AD9910 AXI backend IP core. The FPGA IP core
> > interfaces with the data and control pins of the AD9910 DDS, streaming
> > data from memory via DMA into the 18-bit parallel data port (F[1:0] and
> > D[15:0] pins), which is clocked by the PDCLK output of the device. It
> > also drives the PROFILE[2:0] pins and the DRCTL pin, which controls the
> > slope direction of the digital ramp generator (DRG). The DRCTL pin is
> > driven by a PWM generator, so the IP core is described both as an IIO
> > backend and as a PWM provider.

...

> > +  '#io-backend-cells':
> > +    const: 0
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +    description:
> > +      The first cell must be 0, as only the DRCTL PWM output is available.
> 
> I was about to ack this, but the wording here caught my eye. Are there
> other PWMs that are unavailable?

Not for this version of this core. Other signals to control the DDS could be
modeled as PWM, e.g. DRHOLD, PROFILE0, OSK... but that is not being considered
at this stage.

> 
> > +      The second cell is the PWM period in nanoseconds and the third cell
> > +      holds the PWM flags.

-- 
Kind regards,

Rodrigo Alencar
