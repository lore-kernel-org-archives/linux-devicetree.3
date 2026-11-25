Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634056;
	b=LzBczAdOmnqkLUeYIemUHnoobaPeVbKh9m88RDhrdgWlGbzLB1hPwZsK/BwJZfeB71r/
	 0uh0OesNbX27CiazptgTp74fEQltpBm4kdx59qMet+hFBTMlM5eV2KD33pmjSgF0TVlIq
	 YNideh5v3VOMhHA2uTe2M+KBa3MC3fC4ZyM4xeTGz6VKGSGklj7IKgowMkiP1AeGaeEAl
	 fGmqeICB5rUxF7USeVckbIL6+nDGKllH51ja6wl2VgjjzzKGQJcUs1WLBg1mjRUBKSBuF
	 USh64IGxFjwOLBNoBaWTdKRlZBvGCuHIOpi3Sm8W5xncFN7WESVx2xd3L57dIwEYodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
	b=V9IQItcDTo5HmcMD6AaNENDDCinz24ZMkX2iImF4uW8xT1mgqY1uUBWeNjDHvxAYMRiv
	 c9byh+wiaEPLDE1/S2Bldnxk0mXv4S1SUS/wcPkzQ7nV5enJfeYu4wR0mgx9ob5fnZm9x
	 BcHSp0qqCSVnnbKdPCCLZzSMJhbUZUFzU8MyrOTfkfrb4kuQHTteLvpa7TIbFePnP+M9o
	 ulGPd2AoELSKJl31Me70aIjIahAgqDZZw/pLfikD6IIDEu3UY+2xKBzm8qJ8C0ZbqyURd
	 EYD7nZqY3eBwA5cB3JYtxdCWJ7Wegct02aaEwPNx0YdaxGT6h2WPEArV0Miqr1X5MYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tj6vBlbC;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AC7606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tj6vBlbC
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso3898997a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634055; x=1796238855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
        b=Tj6vBlbC9JMlJyTasmd4zElLY4siTE7WVfPniodB3bH0eHFWeBlwnRZMfB0wF5TQMS
         fhXDLtWSvkWe9uFiAJmuOCK6+HjuJ9xKxDg+RwgRonkVOZlmsUZCZaS0i60CjrA56heE
         aecpd0h9ty6vp2bF83UJG/FJd+GKwHy+WoQv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634055; x=1796238855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Mxaj7MSnWu+9ygVGHzFTKYO5aL6o7ueBK40srZALsk=;
        b=nLEScgd2tVP4mHC/u1c0S0VIZd/JQezVR7WLwO6MObb5amRBb4a6EzamfHcTzQi6E1
         01dXNAU1gk5u7lY46POqSv+RhTKW5ZYXc0cYRBsP4RwiUqn28WzrA4qbJUYcUKJL7qWC
         VXvnpnFgSsLyiNpTbAxn/s3U/3y15K6ircyPWbWH8ca91zVh2Fs6uYaSSvQ1CAuc/XIB
         2t13G5Mn5+pSe/wGcbi9gfNGtK6TAIMvo93u/SU+2QdC94mYUN5xiQsiE0omnMo+c+ef
         UxPH6txhF1FP/41GRN9O9gZSBKK0NnnT98VfSVhT1HwhJJbQXqyu6YYzXJcYEkQ7auDB
         nDEQ==
X-Forwarded-Encrypted: i=1; AL+hErFJmcci5xbmURJmlqi23PQ2Yr5JHHqOcwYMw7RWYhzBgHfdaVdzFSpSDvGAQ8ykEBMD6O9XyOZtaIS6@vger.kernel.org
X-Gm-Message-State: APuU4Z8EJR/GwJpXdxj0W5RrmtlE2d9G+F9GfNKh4P4wFaXKH3zJPvsh
	pfJxoWRtpJjY11VyfxoPSCibi3z6zECqIADs3Az+8H1WOmbQ+QEZkFgycfW23/OE+Y2MraRjcuy
	JM8Q=
X-Gm-Gg: AZFdTZd02QAu/iAXd72ggkWjJvC/A17K6xDS5Ad5nrBv+Gczk05SR31sHvHM0pxH3Yv
	En21hbf7Ttj/C6DbocsAisiGg2JFnFPTutxk77sezN3Uo8JWVeKiY1BViSlg6mHxLJbIuB1n6ar
	WIdihUArldxaleSrf6IvyEXq/msmY1rqEvP4Mo3USGp3NUTwDoAZiOUcgntNLJi4e+VouxV2tLz
	OJgpYNaq6cLExA/twCuZzALyOsLdpWqfFpJU4G04AeAjNd5kPIgeGAg8zNeocOx80h9wE0nAma1
	C8wT8VcoOXn6g4WPswDIU0V9wCjSn2foXY7AtEy4LyqqmA5+2uy5yOVT02Z6P5s+jXf6YGgtDO+
	FGIo7xeFORbJo1DCPYTGeSc6hiblxeOA674bgBnOWuGJKoQboHZMN8w472wP0AEG5bDbgzOO7BD
	4+Q+UZULFPfM5qVGxB7ZpLTIFKLitbHozXbbQTtmpjGw5SA1LeqNr0TzX1hn7Qq3MreafYRwSyq
	zAVPxowJ1+iICDMHSVCDqMgupBpH15xBT2oJc11xOuNjgfn4stwNicARMtzCMuvoHB6WeC9L1bw
	vW/s0G+Ssri6c5aw1iOXw5js1W719GTioX1MVpWFh18EEAp1samkqKpUfbYRsblefLw=
X-Received: by 2002:a17:90a:d607:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b41c97c8acmr18800018a91.67.1795634055227;
        Wed, 25 Nov 2026 11:14:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b40578dca0sm32183592a91.2.2026.11.25.11.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:14:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:14:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <awczhDk20JDpqKqQ@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
 <avZkfg6WMlMzOxpn@google.com>
 <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
 <de65af39-3a9c-4b2e-bb82-2a84b8584731@kernel.org>
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
In-Reply-To: <de65af39-3a9c-4b2e-bb82-2a84b8584731@kernel.org>

On Wed, Nov 25, 2026 at 09:31:54AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2026 08:07, Krzysztof Kozlowski wrote:
> > On 13/11/2026 02:14, Brian Norris wrote:
> >> Hi Krzysztof,
> >>
> >> On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> >>> On 03/11/2026 03:36, Brian Norris wrote:
> >>>> On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> >>>>
> >>>>>> --- /dev/null
> >>>>>> +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> >>>>>> @@ -0,0 +1,16 @@
> >>>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>>> +/*
> >>>>>> + * This header provides constants for CPM IRQ.
> >>>>>> + *
> >>>>>> + * Copyright 2025-2026 Google LLC
> >>>>>> + *
> >>>>>> + */
> >>>>>> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>>>>> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>>>>> +
> >>>>>> +#define CPM_IRQ_RTC_ALARM_NO			0
> >>>>>
> >>>>> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> >>>>> prefix.
> >>>>>
> >>>>>
> >>>>>> +#define CPM_IRQ_AOC_MIN				7
> >>>>>
> >>>>> Anyway, ABI constants should be indexed from 0 and incremented by 1.
> >>>>
> >>>> What do you mean by this? Do I need to make up names for the
> >>>> unused IDs between 0 and 7? On an initial search, I don't believe they
> >>>> have any meaning at all. Does that mean I should make up some kind of
> >>>> "RESERVED_<N>" naming here?
> >>>
> >>> No, I meant CPM_IRQ_AOC_MIN is 1.
> >>>
> >>>>
> >>>> Between 7 and 156, these are just ... 150 different "service numbers"
> >>>> within the AOC (Always On Connectivity) subsystem. I can name them
> >>>> AOC_0, AOC_1, ... AOC_149 if that helps.
> >>>>
> >>>> Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
> >>>> into 0-151? I thought it was valuable to directly use the firmware
> >>>> indexing where possible; if I change those, then the indexing loses its
> >>>> inherent meaning, and we also have to add another layer of translation.
> >>>
> >>> We do not use hardware numbers as bindings and ABI, because that's
> >>> pointless - no benefits, only risks. Similarly you do not define GIC
> >>> interrupt numbers, pinctrl pin numbers, MMIO addresses as bindings. None
> >>> of these bind anything between DTS and software, so not a binding.
> >>
> >> OK, I see your point about the distinction between hardware numbers and
> >> bindings. So are firmware-protocol-defined numbers more like hardware
> >> numbers or bindings?

I'm not sure if you answered this question. I'm inferring "hardware
numbers".

> >>> There are some exceptions like SCMI firmware, but that's not the case here.
> >>
> >> It's funny you mention that, because that's exactly what Jerome compared
> >> this to in the clk, reset, and pmdomain portions.
> >>
> >> These values are used literally in the firmware interface, so I'd
> >> consider them very similar to SCMI firmware protocol IDs (and, not that
> > 
> > Sure, where is the source code of the firmware then?

In case this is a non-rhetorical question: it's proprietary. I have
access, but it's not open source.

> And if you do not have the source code, then not a binding,

To be clear (I added some of this to your other recent reply too):

1) in v2 I dropped LPCM IDs from include/dt-bindings/
2) they're completely gone from the clock DTS (the indirection is in the
   driver now)
3) they remain in the DTS for resets, as naming documentation

So agreed, not a "binding" (if my above "distinction" interpretation was
correct). But the numbers still may be appropriate in the device tree.

And I don't understand where source code has anything to do with it. My
understanding was that we treat firmware very similar to hardware --
it's opaque, and has IDs that we can rely on, if they're part of the ABI
we use to communicate with the remote firmware.

(If those ABI IDs change arbitrarily, e.g., on vendor firmware updates,
that seems like a problem regardless of whether it's mapped directly in
the device tree or in the driver. And I accept that if Google makes such
poor decisions, we live with the damage -- possibly including having to
update device trees. I do not believe Google tends to make such breaking
changes, as it causes difficulties even in a non-upstream-Linux context.)

> so you won't
> have case like:
> https://lore.kernel.org/all/20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org/

I'm not quite sure where that's relevant. To me, that's not much
different than somebody reading the SoC datasheet wrong and getting the
GIC interrupt number wrong. It's not really an argument about ABI
breakage; it was just a simple mistake, where obviously the previous
assignment never worked.

It also has seems to have nothing to do with access to source code. One
doesn't require a public data sheet for every driver either.

Or are you simply concerned about putting such error-prone things in
include/dt-bindings/ ? Because in v2, there are no such HW/FW-assigned
identifiers in include/dt-bindings/ -- all FW numbers are either purely
in DTS (simple mappings like IRQ and resets), or in per-SoC indirection
tables in drivers (clock and pmdomain).

Brian
