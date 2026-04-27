Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD33ACA4B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301670; cv=none; b=fUjgG6hIsEKsmdGF6mBgX3RISjAzN82lAIeFwmeCmYcdU73QoxtYlvu0UwmPCF6R58PMPMLt6oNneGFeZIrRU7wfKX0d9eS/ZnBEUjLi6LY53MYu3axVddWvQf8630V9H1DqKnJHCRIeJRPFegRIz3esMZCZNGlqZUkbXbGvomA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301670; c=relaxed/simple;
	bh=Ip6nIFEnAAxUuakAAg65nChKDrC5qKd6KGqNiKTpTrQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ummr5A8Y9jXNDYRpDWI0VBvUtgzIkIgWAGeiLh1KcGCGY9hEvGzd23L0hJheiFgrEg371yrL2j85I3cPliuHdxwHLBR2bbJ26xvyO2/AgwLdzVRQn1X8gZbkFFXbB6HzLZ9BAJR8jNDXHiVDQz2qA6pCIEaXXBwSrsyxyOZvjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUrZFRZr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUrZFRZr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso145272405e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777301662; x=1777906462; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/JETeUbjFQm9odeqE/VInNt162gHxV6mtash7vYRFPU=;
        b=QUrZFRZrpzFPuteS49V7dONeCDamj0mPB5f+OMHtWHXy6YV057BmnyPldI3NmaOP9m
         OwCBqfoiUQS1E21EXYcT1Wp9TI2fZl/8+lb669+kqzI0V39ijtMpR+5h3tdrglnJmFW6
         yQE4W2UU3qJ3Xy1Pp7+1OyjZDsb//TAmLHbT91V3DpBv8T72pJISK0swkagQ3hTUrBcA
         0DYKPvUR9AsjOuGstCr0vbPqFp4517lON83na77IyQl+Tefhzs2X2g91HyGroq6rJYKK
         0WYD0BhAnle5122tPbf3jQ/h8uINVlGzsKRPY4yA6JnwXCpvHz5CHEEgv6LZNfrohJMb
         ta2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301662; x=1777906462;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JETeUbjFQm9odeqE/VInNt162gHxV6mtash7vYRFPU=;
        b=MtRAIlvY4M/C5xAOxzDLWFT6MZuIEPsnJ+xS36TDrgGaWckYjxfj9U9NrZiZLSKuS2
         zpJK3LF2VxDTF4mbTIFjfqTBFvQDidlFn0K76gETLRE8SYP72+z01U55VRowjkTwrUEi
         XmUjUx1hQaZDXqDPfja6ZkSfqOssu2pTW+c5PL/8aFlZMruNfAlsugAduYu5weSql3lG
         cbz+q8wimZb/ZHm07p1BBkazmTRoBzTG63cfXMOanvhEYFOAIS68Ruq2wiNd/1l02pk7
         sfZZj6M+T8RuxQGe2mgA8WMHjQkMeEUtJ9v7+KADb/pqwzxA7GlPDcB6XagQai2N5V9o
         WGEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ex/vOgVfp+FlCdsjX6bzAnnhjPmrpe0zU145HDevBLO1aGXdr/6t/Psv3t+C1CE5QU7HqGCgWh6AY@vger.kernel.org
X-Gm-Message-State: AOJu0YzwqyHyvDL1Tj7OtN1x+besveEdHxkXG0XvfzBIE9r3cH9e7GE+
	S9iHHEliL6oh6u2hV/rc4ZI/q3YMTw2IpY9Km61jVsD0hSkJ09cc98wz
X-Gm-Gg: AeBDieto+KcJgaZKflYhbWRWrr3xz+PDqJapVi610h495bKmmO04tpPcHGwZNnuw3fn
	PCV62uQ0IW8hQhHuyf1xFWlL3FcnYzRB9NEDUXO0hiCmnMqlNNeEwYklQCkoJ7Pmly/0nBMJv6W
	1bzOMHR8xTQ+nckDak83lf7LpCDhd3PvTPcKiW+twxu/XysExulfD1laCz7KV3M01pm4c3gb7Dn
	VwZ4AUUET6wio+/7Vuam2xeQ8CG2X0v1WH0jpMbqXT+8a7awulW16IkGtb4gWHS2zBszJLx6sfI
	ycmwyzZlhUfvLD39wNcWwu/xF2bpMTPgQd8ADK6t5vrBmkmWFYTfudqv8ffQ+aXdkpIuwclGRKD
	quR7a8n5MppDU7rrOMFG51QcCWtPd6qdqTZzDTgXhmJUFvMBrSKiQ3YwQJ4P6W0rB4VkOAh9FUE
	XvaoYBv2lbVK8bYqFqFx06fCLNiDt4RQdKDF7lO0ZPKrWCY4GzMwGI15R6kCGyBYRZEWnfvSL2j
	TimYJNzfr8A0FoAQ1sldQZ85h/wW6kgTXQFHV3d73Pei/Ev5k3ketOTyEtxbQ==
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr344587045e9.6.1777301661761;
        Mon, 27 Apr 2026 07:54:21 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a575d531esm144632665e9.13.2026.04.27.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:54:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 27 Apr 2026 15:54:14 +0100
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v3 9/9] docs: iio: add documentation for ad9910 driver
Message-ID: <acpq4fyekssspgche7q6g5ns57y25alalooorybqfz2fzdr2yu@wj6seookj4ip>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
 <20260417-ad9910-iio-driver-v3-9-29b93712a228@analog.com>
 <20260426141007.345c76e4@jic23-huawei>
 <lkvrmc6y2z45b4qsmaxg3c2iaiar6hjmim3hdbkxqx3536yx3p@o6h7de4ire2d>
 <20260427104608.7819a134@jic23-huawei>
 <ae84112jP9UcsHYG@nsa>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae84112jP9UcsHYG@nsa>

On 26/04/27 11:31AM, Nuno Sá wrote:
> On Mon, Apr 27, 2026 at 10:46:08AM +0100, Jonathan Cameron wrote:
> > On Sun, 26 Apr 2026 21:42:15 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/04/26 02:10PM, Jonathan Cameron wrote:
> > > > On Fri, 17 Apr 2026 09:17:38 +0100
> > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > > >   
> > > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > > 
> > > > > Add documentation for the AD9910 DDS IIO driver, which describes channels,
> > > > > DDS modes, attributes and ABI usage examples.
> > > > > 
> > > > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> > > > 
> > > > Hi Rodrigo,
> > > > 
> > > > I think this is getting close to something workable subject to some tweaks
> > > > to not make the priority thing visible and use rate of change parameters
> > > > so /Sec rather than steps.  
> > > 
> > > I am not sure about this one. Getting the value into units per seconds will
> > > increase the range of values by a lot, e.g., for the frequency case the step
> > > size can range from a few Hz up to the entire supported range (hundreds of
> > > MHz), and if you consider that one would often have the sampling_frequency
> > > at 250 MHz... an attribute frequency_roc could have an order of 10^17 Hz/s,
> > > and I am not sure how practical is that, although it can have a physical meaning,
> > > like a "chirp slope".
> > 
> > That scaling is indeed a bit of a pain though it will go in a 64 bit int
> > however, seems likely we'll get higher frequency devices one day that will
> > limb even faster.
> > 
> > Maybe wait and see if anyone else has input on this.	
> 
> If we think things like RF DACs (which internally - typically - make use
> of things like DDS), we can already go to the GHz "world".
> 
> Not saying we already have such a device that would map the new ABI with
> bigger values (we might have but nothing I'm aware of from the top of my
> head) but just saying the above is, indeed, very likely to pop up at some
> time.
> 
> Just something to bear in mind :)
> 
> - Nuno Sá

under this Documentation/ABI/testing/sysfs-bus-iio-impedance-analyzer-ad5933,
there is ABI: /sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_increment

which seems to be a similar concept to the step used here.

-- 
Kind regards,

Rodrigo Alencar
