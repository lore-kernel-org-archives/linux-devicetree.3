Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD43537EB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248245; cv=none; b=geVjPFrcN7mGYgBPoXWcvwPLC41Ndm7l24M3eSSU5YW8db2M4EjQU/Ujr+ve6rqsGNXEAV2uTvXUZv80QdMQHCO9SKkH22dscso2TuPujrGXtvNENUl4C1d1FvtKmeKOkBObUDpqWE22mV3dveg2nIjWxGd+XFbAXeCr3XASBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248245; c=relaxed/simple;
	bh=/DW9ChJ+Z4lvrI/8m+Gj6NNDh8t2JT26OuVxVi091XM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stSBx3hL8AAnkiILh61bURQv8lnZGjePd95x5RHLi9fpN4j4bVOzbVz6H8jFfEIFHssuJLlcydTk8coeUV6g7vRp96qq3MoXgrL9iTg3U0j1LAEbyjj8lbUQ0gJf2jg4AbNfJEnCkSk4EwEQk7TGt+MNbH/5w7Mlbm/90Y+Du4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHPxm/4p; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHPxm/4p"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1222671f8f.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778248243; x=1778853043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHRSS+oWN6kCe7LyNpMRwfm45OI0qk2PQL4/WD6qye0=;
        b=BHPxm/4pS4YovEdzHEHLVKHBImFvDhZ1oyMnUatu+PEv0Spif1inby1u27Smy5CCUn
         stxKS0zYBstWwwjDaFXgCtVydU/hXRblaVgmiAjKNOGtPgsOW1wjL+El/YfcBVcLA7pv
         AqiWDSIB4ZCos26/RFL1gYdCbgnQTi3VGcgxQabPavrFND1nzAUtC+KVB2/Ph+qyl4rQ
         AEJC2UAwG9gCHX9E+aRTafcNN6ky2+ZxW3s5Jk5log9VR59v/62b7Fnvx2kyiUAeG+Kn
         CZaANAo67HUXD6aAxA1eIdVR9wLqGMR1Dh9dBqmNj1ZtV3uCtcWjhJpWAn4z0nz2d9jC
         0EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248243; x=1778853043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHRSS+oWN6kCe7LyNpMRwfm45OI0qk2PQL4/WD6qye0=;
        b=ahHeEv8sk1GVHSftfgqLHIF4SKhw5xg2XCIiDkzZ/pATeExv26h9AhzB8QkzZ4YjTH
         32/OrRld7/yoojGXjNcgBSQdZ5OcBXFFQ9RDCJL+lcOrv2HhbXg3TQkW2i87Mg0i/zR3
         5jNXy4wZpFmJXjS/N68jIStoivIS8hQIrnCqqYda5hnURrvKQhhlE1eY72FMbUh53yuS
         A73BWINNC4inCb2k0BxUYA0pe9U/AyxgG/lHrJFbnBmV+N8PkyFWnIPYagvRSD2eeODT
         EMHCs1LcfxZfm1/ox4K/I61VcA59el4ETAIb6dzbU1mUArv3oCCP1DQhAlJZXYeiOSBH
         NgVw==
X-Forwarded-Encrypted: i=1; AFNElJ93IGmtETFSy4clWmK0SR56XFX7Qd/RBvDSOEeSJOTWswYwKSwNjpCObVnhZzg8CaOZT10RpkgiYAAr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9y403l46H8x6tviHaYXTV0FJwJ+VotZDoO3OIn+puYc5LkCd3
	1OdptHw0fHHdtaMXsI1/HUGlZHpnxSQ1Ao3jc63GWga3mUamBeygRJvN
X-Gm-Gg: Acq92OHiqd2GnwMmsji81bVOtsgcqDTxAvy/PMuEQ7mhH1RicGAyxHC/vH5M+pq6dDu
	cUfKXxZqi54xtWMD3MTHosYM6BBdW90bt4V56pGaPH0YBPeIwKAC/mxGg65Qy2BPMDmLCxqPKXp
	n1SUGYSK/L49OXB8ztaaiRw2kbPQx/zD91Oiv+Fl1VXfNBa1GUrVE/Vl1I9I3OzHyy96Pdzhr1a
	g8qhq7uMRtKlxl+h2TwxHRLLgK614JdUo09IRb9ZHHvUC4rmD9oCGlNUKyvmEMXkiLA7PixH4xV
	B3ZLSt2tDsaVaPz6xsiamApKjM1d+STIuOOpa+n0aIeRGhr0BtoVsJ6awBGPlUfoa1pJkaz8GW0
	3WKD6j2VDiZz2J/nNqFkE7DC0E33F65mz/MAjpMan3+47hoGHn8AEsP17/wU4SI7gJjB8ZdzmOI
	r7BXpgp9Tc+LKim1IIQ868vacYlnONDUZN/EzzKDPvxVPOqdLPiu3W3Aw45ErUkjz+pEegNeG+F
	LNRqLYj6/CraPhDZIueiLaaRzLmGzphojHVQgRPWYL74An33pQTId6eqCsO
X-Received: by 2002:a05:6000:2882:b0:452:c246:ab7a with SMTP id ffacd0b85a97d-452c246ac5cmr13022901f8f.14.1778248242599;
        Fri, 08 May 2026 06:50:42 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm4657716f8f.29.2026.05.08.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:50:41 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 8 May 2026 14:50:37 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>, 
	rodrigo.alencar@analog.com
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
Message-ID: <zh7iqytpkrfonxv4mup5fcyo7z2ymnizobdu5smxevax2isge6@zug2y6e7rdj5>
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508134843.7646c4f5@jic23-huawei>

On 26/05/08 01:48PM, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:55:47 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:

...

> > +  Specifications:
> > +  * 16 independent 12-bit or 16-bit DAC channels
> > +  * Independently programmable output ranges: 0V to 5V, 0V to 10V, 0V to 20V,
> > +    0V to 40V, ±5V, ±10V, ±15V, and ±20V
> > +  * The device supports SPI communication with Mode 0 and Mode 3.
> > +  * 4.096V precision reference, 12ppm/°C maximum
> > +  * Built-in function generation: Toggle, Sinusoidal Dither, and Ramp waveforms
> 
> Interesting - so this is a DDS, be it a simple one. +CC Rodrigo who has been
> wrestling with one of those recently.  Rodrigo, can you take a look at this
> driver and see if it fits in the ABI etc you've been hammering out? Thanks!

I am not sure how this is a DDS as it does really generate frequencies, so it does
not seem to act as an oscillator. I'd say the minimum for a DDS is an NCO + DAC.
The function generation seem to act only on the voltage levels. There is the step
size and ramp limits configuration that are similar to a DDS with a digital ramp
generator. I suppose that users have some use cases that are often integrated into
the products so they can do less (and the overall system becomes more efficient).
However, those products end up solving too many problems at once and they get too
complex!

-- 
Kind regards,

Rodrigo Alencar
