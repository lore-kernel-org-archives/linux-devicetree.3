Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D9361DBC
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269619; cv=none; b=USKP1+z9OweU7QaWfPs+KTAmfOQUGQzU3pVRx0kchFrszwFXo+yXjSyxmVDxfDXL7Lewu66Lh9PPHs/rmcMTL3WMjNhoWgvrWYjmBqGQcden17GQDBZ06TPMOLFEnUQCHSYJW68Yvq4loM4KjxrsiB/GPv4HABRvivRnXEEEs+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269619; c=relaxed/simple;
	bh=9KZs0UYygvtlZqiiY46v13XfYD1TW3A4bwAK3Ql9HF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFHukMPVB7AAwIj+0VthkaY5znHrkw22q8dKU/YNKIy4Wxi1Pyo+9eIaSNRQFP6bHXU2CwqrdYwesVIcirqZG6b/hzkIkmigBSV+V/bzMfnr8aGJvAcz6SBwPEiwuA2em61fCCd7G7GTgORlW7WhEba4R3mNh/Oq89Xzyz9vlpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NymA+JFC; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NymA+JFC"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aae314aso847239d50.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269617; x=1789874417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtWM3qo/7t6qMWYIor0NBu0N8dBe4bjxbzCfvDG8FKg=;
        b=NymA+JFCj1Cqo5ZFogcK9qNTJwcP4M+IFthn1SzVwE7obAxFaq3/Wn7+uhS/fCCZRf
         Nykl01mvrRyrXwLsjIssLz8GcKijlNhqvqHAjpltt0k4tg6reJyd8DPE5Rf23+Cz9lN8
         YGf6R9ewhuBaf6WNoOT8aPDolEdoLDPt1DTvP3G67SL2V20ifmXbmvHplyY/Lm+hRFVK
         C8/pjVM4VeGOR6FrtQ7RbVdK/W3SZleAzkte+zck1eim07ok2Ph8QFXHK14TjGVED/mk
         LbREydgysPSJRjcZ0apQykliS0kEIMZaCfBssCSKYbxd9UtnSmNfk3vUrq9CuqBckBkU
         RklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269617; x=1789874417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtWM3qo/7t6qMWYIor0NBu0N8dBe4bjxbzCfvDG8FKg=;
        b=l8cI6lpsTj6V+QSWbBFv/KeQMVregXH7D9NGsvCTa3zxCKhueOAfNtG2NfiylBgjn5
         6tV0H6yENKswoguQRVrpJLP7dTTrh1LYpAzwI06LoHyqnZUlUC39dB5IrZVjyxsmP2sn
         5OiRDSyL5q5F7fZ2PJzyzVARF2drsTkIHus77FT0Tn3Ia9LZ/4Tdh27VBzSx55JySM7/
         Ds4XiAS+eN8QbURxD2p648rmlWjnilTLKQlZOW3h6keSl4BVocCOczTMNA45xSq965sW
         Kajiu/16HAyTdBsg/VDNcHjfqT0X7ze1hYdQGkExRka3ge2uUJcVeCZG6H+5A4Pwg9af
         R/Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxfz3+c8DBsab/hPKOFPcV7V1A3SRfq1eCit519jasMYGxeijBKz5clWlK3ECx6TBaXKwtqs8ncIN29@vger.kernel.org
X-Gm-Message-State: AFuF++mRxrxRVNd3kCgLr1GnQbN03nMVYJMJpTwO2/KTXM24ir0OnCPd
	lqIA8GrOxKWWb3iFwTGZzMAvYX0L79R1Ty9LJWACdkP0GPmAwV+uEGcu
X-Gm-Gg: AYBFou0ajH17EP/uzFyDFOq5TrLEI3dISEOwvjsqEACr6IbBSfw7J8tR0tp4MpsUiFA
	QxmBkmkBqkCaOIG6JA9NmurdEd8FeLGC7yL4nQpaxFROpd3tAoi6nGJCPfzOQA+sbgeVjsFWSBV
	Lj0stLnPQaCzCOHwFdZ0xRSRHN2gPlava6DcO7Ng7c/0YR8RLiguQwabxef3be5DLqyHHh/3mrW
	xEiu2loQyXzDjHzxjr5sOVaVwlxYa8vPfu8NgH/n14xgRgQmflvIw63BNTDV5V4emgVNyDy0uv6
	GYMVNwAQ7OsbE70hiPlVxDfjtNoKIqiHoNOFIAoYDAVk7iHKWna/Z4kve5UknVmW/Xu3vr9rWGn
	216a9CypShVWWh26PkkXpOy3V+3V2XsYmidJ0vhBAr2LVz7DNdTcyX89NK/p0Se6bOUIXYnfRXw
	peOHaT7hlYDwN1Nyn4sZaKKX0l6RyZaoFBxK/Yui1JfS2BH6NlWtzstwRNg1bgoF0T
X-Received: by 2002:a05:690e:184:b0:66f:7728:b3ce with SMTP id 956f58d0204a3-67124706d9emr3349772d50.30.1789269616679;
        Sat, 12 Sep 2026 20:20:16 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea993asm24920977b3.33.2026.09.12.20.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:20:16 -0700 (PDT)
Date: Sat, 12 Sep 2026 20:20:13 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: light: add as7343
Message-ID: <aqYWbWoBYaDJA9h-@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-2-marcus.yu.56@gmail.com>
 <20260913015652.029475d2@jic23-hlaptop>
 <aqX90oniPRdsu5jp@gmail.com>
 <20260913035132.1fb50e6e@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913035132.1fb50e6e@jic23-hlaptop>

On Sun, Sep 13, 2026 at 03:51:32AM +0100, Jonathan Cameron wrote:
> On Sat, 12 Sep 2026 18:35:14 -0700
> Chang Yu <marcus.yu.56@gmail.com> wrote:
> 
> > Hi Jonathan,
> > 
> > A quick comment inline.
> > 
> > On Sun, Sep 13, 2026 at 01:56:52AM +0100, Jonathan Cameron wrote:
> > > On Fri, 11 Sep 2026 18:39:11 -0700
> > > Chang Yu <marcus.yu.56@gmail.com> wrote:
> > >   
> > > > +    description:
> > > > +      The driver current for the external LED connected to the LDR pin.
> > > > +    minimum: 4000
> > > > +    maximum: 258000
> > > > +    multipleOf: 2000
> > > > +    default: 12000
> > > > +
> > > > +  sync-gpios:
> > > > +    description: |
> > > > +      Optional GPIO pin that can be used either as a synchronization input to
> > > > +      start/stop measurement or as an external start/stop signal for
> > > > +      synchronizing with the connected LED.  
> > > 
> > > So the datasheet starts referring to using this for some level of sync
> > > but then only actually treats it as as a gpio (maybe I'm missing something).
> > > Any idea what that stuff about start/stop is talking about?
> > > 
> > > The only thing I can find about this is the device diagram in figure 13 that has the GPIO
> > > wired to the led driver and the automatic measurement engine.
> > >   
> > That's what I got from the datasheet as well. They don't describe how to
> > use the GPIO pin to perform synchronizations at all.
> > 
> > The adafruit arduino driver
> > (https://github.com/adafruit/Adafruit_AS7343/blob/main/Adafruit_AS7343.cpp)
> > is slightly more helpful - the GPIO in output mode signals when the
> > spectral measurement starts. Unfortunately no information about input
> > mode.
> 
> There is no separate control?  If so we can't use it as a GPIO as whilst
> there is a control to set the state it will randomly get overwritten if
> we do such a read. So to me sounds like that is there for testing the
> connection and similar usecases only and we should not expose this as
> a GPIO. Maybe input is possible but that may also have side effects.
> So I'd be tempted to drop it from the binding - with some description
> of why it is not there in the patch description.
> 

Agreed. What does this mean for the LED then? For all intents and purposes
it's controlled by only 1 register. It may have some interactions with the
GPIO but since they are completely undocumented so we might as well consider
them non-existent. IMO it probably doesn't warrant a LED subnode and
led-max-microamp is enough. Maybe DT folks can also comment on that.

> > 
> > > > +    maxItems: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - vdd-supply
> > > > +
> > > > +additionalProperties: false  
> > > 
> > >   
> > 
> 
