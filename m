Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269434;
	b=0UdYPKhLtY8WpdqwaDyo11RrABhta0Tdec6PPluhEEL47BscdZHEqWEaneQaVC0Fd0j9
	 NZy9q7/OWhRqNOkjW5HTCo9frR3rU60AyXGyw200wXGcvPWDt1HNEq/xQjALg0i4z72Wm
	 X00x9emWTXdn4Oi4roNa1EMtCkAUtbyMei04OUOITZ1N6bF4j9KUqAo+5pcImKfOdxyBD
	 oNhfKTy2MZc69pwa1fYBpAOG2wwiZ1GIZLNYbFHMJfozOV6dTpvM9vdSScYMfy3sRM+E9
	 0V3fCFEhAvptHZ+9J735xNL3kh48Ea2CYYq2S6Oo1EbmA7VVjQcll6r1J6J6lHpwZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269434;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=26yG4eXWQUuRwTEMaMGincq8OXRaC7BKnOkTFxcAKtI=;
	b=PBCDBraevi1hfEO6UB9tNBvdhSq4PBrPTITHIWrSgovID5MyXj8bHbi+Uyic7tJ1hpPi
	 8rSnbRJu6RjEYmBZN2mFJ2ugsKLAfP2CJ/tU7awetoBBXG0wh+se8jKW/B50mwFGYbGit
	 e5FIs1YxypY3+zxD8t+Gie3CTY4RV2/0KvgvDo+hPpY+ZCWE5gbbkhnhmRzRXArd+tJJp
	 J3pXjpGlBxYyLKV3Uq6ersnewXuFNo2YITyWccrQ/v9Mqb/0R6MGReDXhc6AouZDbb04W
	 ppoOFaGrKbQoVIQGUPabJ5KJhjHjCTFa7OVA28wEIcDz5Q4b2p4sfXTSATTcf1N3iyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1EHMp+Zv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81889606A33B
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81889606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1EHMp+Zv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67685C49F41;
	Thu, 29 Oct 2026 10:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06E7560360;
	Thu, 29 Oct 2026 10:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D69DF10329104;
	Thu, 29 Oct 2026 11:23:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793269423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=26yG4eXWQUuRwTEMaMGincq8OXRaC7BKnOkTFxcAKtI=;
	b=1EHMp+ZvIZYUiY0Fs+NQ34l+xN9Aa85DGUxDMkpVM+qBPKo78H5FoqAiT2z7MnI4VpJHP6
	bQIpXzpHh7c0SP5+HghUNK4LwwdREjXPgOT6/8bdVUJtolx0KulDYttcoZ1KljrRN89whF
	xWIRGxe/Qj/RvZeMzLZf+2RjkUhr3qCJ8BaSR8XbTHLNzA/MguOk9airmBS4wB10/q+vu6
	h+1xcPoHWeMampabcBvw2YvzucrPJLkQiGwmNbA6TdltVtdSfDrTYK5p3MXxToXBxRiKqx
	Rm75b1vlDK8cekIvT2/fXsIn0BFABuoqmrXH2nOSzyNpqj8x1yoXFkSr2M5iIg==
Date: Thu, 29 Oct 2026 11:23:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Markus Probst <markus.probst@posteo.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/6] rtc: s35390a: Allow use of output pin for
 interrupt signal 1 for wakealarm
Message-ID: <179326901959.870466.10617976319707000854.b4-ty@b4>
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
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
In-Reply-To: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 30 Sep 2026 15:31:45 +0000, Markus Probst wrote:
> Add pinctrl to allow the use of output pin for interrupt signal 1
> for wakealarm. This is needed for wakealarms to work on Synology NAS
> devices.
> 
> I could only partially test the pinctrl patch. My testing system runs
> ACPI, which makes it impossible for me to configure pinctrl there. I did
> however verify that with missing pinctrl configuration in the devicetree,
> the register were correctly set. So there should be no regressions.
> Every other function than ignore, disable and wakeup should also be
> considered untested.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: rtc: Add pinctrl for S35390A
      https://git.kernel.org/abelloni/c/2166aaa173cd
[2/6] rtc: s35390a: Add missing newline to dev_err
      https://git.kernel.org/abelloni/c/a27b25bb9b42
[3/6] rtc: s35390a: Fix alarm not disabling
      https://git.kernel.org/abelloni/c/d93f29e41089
[4/6] rtc: s35390a: Read 24-hour mode on access
      https://git.kernel.org/abelloni/c/6199051016cd
[5/6] rtc: s35390a: Add pinctrl
      https://git.kernel.org/abelloni/c/cb4e92b15114
[6/6] rtc: s35390a: Add synology quirk
      https://git.kernel.org/abelloni/c/f6550426f21e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
