Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415017;
	b=kRfdCQ4kpKHWbHF+wFN1Fe+jLkFASEN3pq/OshB9Ye7Dq4DBc54w3Yz8NP37GWbhc+70
	 Ih4iQi/lJxewYwWwg65TF8qZb3HRIfCyYJLvinvtDxQ+2ntYFip8lhRnHqVfCYWRLV3nk
	 PAD4fi//cxtYJgNT+coqorpMSbltsBt5q++pbGQq8v9xpiHj0Tij/mfFmKLMVIBfSGK5L
	 xR4rE39R7mf98YhhQfDFT1WfI/vaeBLMXJjezqL+TI7QcADF4+7XVGtLy3G6ltzzGanm6
	 +eaJ7f5kOV5UoYXXKyQUXRgTEDDo9hqtV7Tx1EaO1CU0F2nAXs19w4TuUJ6RTtYczaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
	b=Dsv+LfhGjMEZPxeIb0KiJrpB6scR660ZrREOG5UwUJhidTTYcqPYxS93PkRzQiDy5nQa
	 mTsvOJizgmCfSowL3tGUS3ISxRzWp/q00a/F9H34g+uNSun6DhGAtZPIEZI+Ue9O+Tjae
	 MhDNqJKj9OuVSRLCUVUw7UnZNLBayt4Vl36OH6xhd73nocj77dec0Uu08HLyiad/rYWXE
	 8zKOhHlyeihZApsIlyhc47AJUmhFZ7qR9adDt8XzeCTybSUXGDWpY9BmfecOzyGY7cPre
	 jUjfXn1bVmzGQKkzPdLc13B1rGjgy2szP40wBhwP9U4HNSO0xFo/LOnSfn8tFxYJ9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NVVRQ9P1;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F79606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NVVRQ9P1
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so2055387f8f.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794415015; x=1795019815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
        b=NVVRQ9P16CXgV3Rn9LfdLqeDkcwKuFW9CvQWJMM61A/TjSAfpj0hOk2t4R4aOuR8+T
         qa3B0fr5p4lZvPX3eDvN1BZsIpv/wkLTEglrnZKAed5fa706+KycFJSZCDMgEe+1QLXQ
         C5fI52zyileK3Dp8VDAfGYllNyaDGUQC6SVMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415015; x=1795019815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7J+7rXZagAMwYFsd0caewFjx827wQhm990FgyJyWk9M=;
        b=d5dN4sq+Luoqf4mW7JLvN3lWegrFqoENzPAxiduDecx23mWnGFJjLNcBqeucQX6zL1
         aHJbunqh+aWeDhlO97tXygS35tRB/MmguA8inwpOGgleG4y2W9J12gcz2pCud3pgnAeW
         L7NiHxcPLCZlmGdPdlQ8fpVDjy2q6UKCxNaZZ/Akw8U66NRnNuVOKjAF247TI6FzlXt6
         5YkufZR4TmbsAhHmnpy4Tgy/FKmTRFb5r0IakoA1F0Rvs1qoDb/MumgX34oPoiHoXcYQ
         5Tig2DSXTEUVaCji2OFqxUovDvKdIcW4T6DOnvfB5etUbsxhEN1PxMbAfKyKEkGsaIQV
         p4/Q==
X-Forwarded-Encrypted: i=1; AL+hErEnLSKTdFzVu8uF6wyyT64eFqY29GOqFrbLY4T9K01UtajQtJd+ICQrRX/kw8YbPAnoDA4lC07rYlfb@vger.kernel.org
X-Gm-Message-State: APuU4Z/R5OWPRYzNHcLcp1gjW9As6qLuLPXrAmwP1RBvpIm67RviSIsk
	yn+N9rHs2FhCIm7U14x9NpflzFrCKGQHSlkMRRiPz7sKrdUPxpuURQ51FBGarkF91g4=
X-Gm-Gg: AYBFou3sM4UKrt0fiigQwaoEKeHrmCkLCgDsZFVcXvpuel/xEZklMLHhtOy06hwe9xN
	IsxqHr6l56/ZtJZNRhQOf1a8G1TqDPl8PF92ADvXgFjAIiKQlR20ZY0b5Z9JBz7rzwVu3QmVB16
	iCgG2/v40lsLniV4JYcI6W5GKK6475FDyoQ0bGDrpLmOI1nKfXSQWPIEK3qdO++hqUM3YXaczvj
	iwXaDGaQSHu3uIItD/SAubEP30XDppDEI8/Pa72xL+LmNq5FiHCLiK1zGvus0etgqWhXyt+10c5
	WSHN8XCiZMP8SYtdFHFuyTUbON0NpkEx+MRwGOivCColbrBux8bEgqxwVqHwPBcG8/ToRL09eAn
	5IRfbcr2He3uWZ0FS7HCxjhK8HZ0HFveEF5Nz0LLPv5w+zVDsb+5uJdCl8YJ3sGDo4IPj9dydAA
	JSQgvk0fWfCMDAXbWDR/cdTTGHaqFmtaNFs/wBN1/XmIa/U5DMmU1z7RC9XLrziAKRB3+iXvCVY
	PdH5mCNuQJYDA0cYkKyW7UIZQ8M8Xe3v08CYtPATflXgRdIIIr7BDAOCv5eEyxCC8ixtZkfvUfH
	fFapGhM/lRvpYktS2Yl02orF+HeNp6RqWq2er307QO66o6NHLiwLH1L2NRS5TH1/KBmdojpfewy
	AvfSGqC75jA==
X-Received: by 2002:a05:6000:2007:b0:490:1358:2265 with SMTP id ffacd0b85a97d-499c80de903mr5102934f8f.34.1794415015066;
        Wed, 11 Nov 2026 08:36:55 -0800 (PST)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0a68.ipv6.o2.cz. [2a00:1028:8382:206::a68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm11933974f8f.50.2026.11.11.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:36:54 -0800 (PST)
Date: Wed, 11 Nov 2026 17:36:53 +0100
From: Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v2 5/5] ASoC: pcm179x: Add support for pcm1975
Message-ID: <avSZpeqgC9Nh7ax4@garnet.lan>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
 <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
 <179304174310.199157.17471232393944903445.b4-review@b4>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179304174310.199157.17471232393944903445.b4-review@b4>

On Mon, Oct 26, 2026 at 07:09:03PM +0000, Mark Brown wrote:
> > The PCM1795 is register compatible with the PCM1792A, but it encodes two
> > of the register 18 FMT[2:0] values differently: code 001 selects 32-bit
> > standard data instead of 20-bit, and code 100 selects 32-bit I2S instead
> > of 16-bit I2S. It has no 20-bit format at all. The PCM1796 shares the
> > PCM1792A encoding.
> 
> > +	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
> > +	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
> >  	{ }
> >  };
> 
> >  static const struct spi_device_id pcm179x_spi_ids[] = {
> >  	{ "pcm1792a", 0 },
> > +	{ "pcm1795", 0 },
> 
> Don't we need to set the driver data to PCM1795 like we do for the other
> DT based entries?

Yes, I'll fix that.

> > +static const struct pcm179x_fmt_table pcm1795_fmt[] = {
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
> > +	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
> > +	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
> > +	{ SND_SOC_DAIFMT_I2S,     24, 5 },
> > +	{ SND_SOC_DAIFMT_I2S,     32, 4 },
> 
> Does this line up with the constraints advertised by the driver?  LEFT_J
> and S32 isn't here, but S16 is?  We're also not handling big endian.

Yes, the 32bit variant for LEFT_J should be here as well. But what
should be handled for big endian here? As far as I've understood,
the bit stream on wire would be the same regardless of byte order in
memory.

> > @@ -191,7 +241,7 @@ static struct snd_soc_dai_driver pcm179x_dai = {
> >  		.rates = SNDRV_PCM_RATE_CONTINUOUS,
> >  		.rate_min = 10000,
> >  		.rate_max = 200000,
> > -		.formats = PCM1792A_FORMATS, },
> > +		.formats = PCM179X_FORMATS, },
> 
> It'd probably be easier to just register different constraints depending
> on the device rather than having constraints in startup, you'd get much
> better reuse of the core code that way.  Dynamic updates are usually
> done for things that can vary at runtime like clock rates.

After rechecking the format list, all the supported variants should have
the same "formats" field, so I can remove the distinction for that point
altogether.

Best Regrads
	Roman Smrž
