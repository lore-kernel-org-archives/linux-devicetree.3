Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532484;
	b=SQOOCxBQMIJmF09YKCJ57i3KcTk68rZi/W0MYGlc3Pjcyv8eU+0vm/6MC+ycLOHssfML
	 I1l61YhZEKj9XXd1MebcRDVQgeftvBDOFHmhlYPhzXbUv+Em1x8lgmHM8wWf50l7atQli
	 fVZ6rgvugZJwhtlpgFQankyE8OqWi/A9cJs8l3KBkSXaKFURxPWHL5LRTTrvF6aJgLDIR
	 XMuQz6sz63lHZPhf7mtiRX5BVFBUATNQtFHNJzn0wgVk6qRX/n3/X5DCohL/FeKe3KAqk
	 eha2JT0PHHIQ/fYkQ6xTF13BZOrqrQ1zN0xWnTl5eJ9klX6+RY6baPsho18Imknskfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=;
	b=lO5/uD6lq0Azh8H+Xma2UiSHm5b5G3gGV/rx2nN/30mmFxgPQyMSRmWAUJCsG4GMECcq
	 Dtwh1zNtYhG4hlvuaUy6dmeOEos3Z3nhbdPg0TJrUDJzGOJYKA25gOYNV/2kubvyQPrma
	 XTecwOYHvd/THgybfr1r+X/slRfiN8cv5ThtqQSz3YqbQpeTglKUlDHyt8h05lIzHdn1G
	 2NgGsJ/T6U6eNHUg2o839oQ/ZoTSoJjuh8eNDwfoBZzxa8WAFQQWak32+JjzcaLZlO5OJ
	 lca6+zbPG3lyHhzDFxHBNFOXeCNpk/kQ+fsEEYPlpVU2YL/S0TP/LUkQDZ2NePwG5xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QRPrL000;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D06606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QRPrL000
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so491061c88.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 17:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794532482; x=1795137282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=;
        b=QRPrL0000yqqXjBWHqNbRcWasjWbFOVo9y3hyLWAJfY5LWYvqk7Wu6LE0XENCCaS2a
         2gDKt9Tmj+gDju+E4i8Ox0fY6gAs66i9q++F5eYp07XycK2OqpdK+ddESitSF1AQz2BC
         1fy3zZ1rbxWPfFY32jKlkMebj26wY+vxNJZuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532482; x=1795137282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=;
        b=DGD+n7Pz+Rx8jzLXM/cD4WLaQOMQfsfTBTM+YtUDKz2zsfGI4PD3av1gudoJotzGnP
         9JMzla8WlqeEbafIRIP5FBy9hWOaMNsJRAL2T3n9JlCeBM/baTRxDyJxPP3NF3MbJeaS
         hphYu7S7FlPVrpJr1sAu+Eb/8kppfu4GEV+pwVA7InMR+H3yNgCV2p8zUZY4j3PxmFQS
         c0FCxPFzCj49m52iQ7PLoOufmQ2Pf93Ks9xUlwjjGcTara5flog7UMhMmpiiss3AaM8a
         JC1Xt6v+qlYZ77t13YLhmlDVUuO65V9q3dJdatha32kPmk9PNkrZyRFnFdpaqEJWyJQ+
         f5BA==
X-Forwarded-Encrypted: i=1; AL+hErE+3sVqbLqN7X76nB1ddHfH8R15lxT9+lqarEXhg6X5XQBEGroOiWmXsAh8PeH8wyDB+arXZNOKqDi7@vger.kernel.org
X-Gm-Message-State: APuU4Z9encuvYqWfQ1W5FWZBTLhbrEITYQ1N1EtzNt1rKlSOeZfrWYO4
	oe1Edhr/AYQJNxmkOHXnbUwjJ16wgSemLHt/fXGp5MttJQcCUa4fu050lsFlgWULyg==
X-Gm-Gg: AYBFou3iyTvfMSx6abQhGmJr9bu8oX4Eo+IC+xO5r0ggqS4Ny6JJ4BIBMhsknr9Qss/
	sRfA/U/RBBtx6jj1FpdxdRiwfyfEDNmce45rORi2I0iZlXABSysooIfFlXpHfnnqIzRauxNnWKX
	ftcEb7diey2Glrnrsut4nvsnIVGMgsLMXnlK3oXuZfcEoGZa/RnaHOlZ/syO+ZhwHK1S6J6USeY
	g+PxhGBlunZqThwSIlYTQjVw6UdIfWW6koZnJ57OyprdWsNn+N/4LMbVp+c5MrqiGioZqqHuT+g
	61iKJDdc21QWy5mC/AW1egLVu0w1r93EpP/qR4vZks6dxLQl7BrPzCHbl5rKujcP6XFhWnE7AiT
	D9WOYYv4K9INSNb4h2QkpdHs/qXx/2cgk27acZEosPzJ/X1cuzzjETjv4PzbYKTv+Y+u4IgJKdK
	eGbjtDxo+CW3FeOlFLt4vbvbfreDJRceK1JlHFmqSsFexjgmv7HS7hPE7xObEPFc9PeOrzr/Ol3
	ORr/aByQvAcHE+T4YakFOE94Qs0JhXj9nJucYd1e2+0pWIWKbY2PQJr+3D0bpI8PnIbcveC38Y9
	Q8nsjj8U6QF3O3gDTGZteijsOxwxWVVGj2Xay7M3DQGDsie0EkNBM9M4tZEm9rI35NU9yjM4OU0
	yBUqOZt1l+FHYPw==
X-Received: by 2002:a05:7023:a41:b0:183:e993:7901 with SMTP id a92af1059eb24-1b5030abd48mr1019806c88.17.1794532482087;
        Thu, 12 Nov 2026 17:14:42 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:616b:3e06:cec4:c2f9])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b50309b2b5sm2265698c88.1.2026.11.12.17.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:14:41 -0800 (PST)
Date: Thu, 12 Nov 2026 17:14:38 -0800
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
Message-ID: <avZkfg6WMlMzOxpn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
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
In-Reply-To: <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>

Hi Krzysztof,

On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2026 03:36, Brian Norris wrote:
> > On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> > 
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> >>> @@ -0,0 +1,16 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * This header provides constants for CPM IRQ.
> >>> + *
> >>> + * Copyright 2025-2026 Google LLC
> >>> + *
> >>> + */
> >>> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>> +
> >>> +#define CPM_IRQ_RTC_ALARM_NO			0
> >>
> >> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> >> prefix.
> >>
> >>
> >>> +#define CPM_IRQ_AOC_MIN				7
> >>
> >> Anyway, ABI constants should be indexed from 0 and incremented by 1.
> > 
> > What do you mean by this? Do I need to make up names for the
> > unused IDs between 0 and 7? On an initial search, I don't believe they
> > have any meaning at all. Does that mean I should make up some kind of
> > "RESERVED_<N>" naming here?
> 
> No, I meant CPM_IRQ_AOC_MIN is 1.
> 
> > 
> > Between 7 and 156, these are just ... 150 different "service numbers"
> > within the AOC (Always On Connectivity) subsystem. I can name them
> > AOC_0, AOC_1, ... AOC_149 if that helps.
> > 
> > Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
> > into 0-151? I thought it was valuable to directly use the firmware
> > indexing where possible; if I change those, then the indexing loses its
> > inherent meaning, and we also have to add another layer of translation.
> 
> We do not use hardware numbers as bindings and ABI, because that's
> pointless - no benefits, only risks. Similarly you do not define GIC
> interrupt numbers, pinctrl pin numbers, MMIO addresses as bindings. None
> of these bind anything between DTS and software, so not a binding.

OK, I see your point about the distinction between hardware numbers and
bindings. So are firmware-protocol-defined numbers more like hardware
numbers or bindings?

> There are some exceptions like SCMI firmware, but that's not the case here.

It's funny you mention that, because that's exactly what Jerome compared
this to in the clk, reset, and pmdomain portions.

These values are used literally in the firmware interface, so I'd
consider them very similar to SCMI firmware protocol IDs (and, not that
different to hardware IDs, if you consider the "firmware" as essentially
unchangeable). And if I change this to *not* be literal firmware IDs,
then Jerome's suggestions on patch 5 (to imitate SCMI, and to defer more
control to the firmware) become more difficult.

If I do keep these as literal firmware IDs: does that mean you'd prefer
these not be in dt-bindings/? Many of them (especially the IRQ IDs
you're pointing at) are not needed at all in the kernel side; they serve
more as naming documentation than anything else. I can just inline them
into the DTS. But I'd prefer having macro names for LPCM IDs and
similar, as it vastly helps DTS readability.

> > 
> >>> +#define CPM_IRQ_AOC_MAX				156
> >>> +#define CPM_IRQ_AP_GDMC_WAKE			157
> >>> +
> >>> +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */
> > 
> > 
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> >>> @@ -0,0 +1,54 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +
> >>> +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>> +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>> +
> >>> +/*
> >>> + * LPCM IDs of each SSWRP.
> >>> + */
> >>> +#define LGA_LPCM_CPM			0
> >>
> >> What are all these?
> > 
> > The binding doc says:
> > 
> >       Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
> >       See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >       <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.
> > 
> > and
> > 
> >       Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
> >       2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >       <dt-bindings/clock/google,lga-cpm.h> for clock IDs.
> > 
> > These are the IDs used in the firmware interface to talk about these
> > things, as many of the SoC resources involved (clocks, resets, power
> > domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
> > with indexing within each subsystem).
> > 
> > In reading again, I see that the definitions and explanation of these
> > terms and the SoC organization are split a bit between the pmdomain
> > commit message and the binding doc. Where would you prefer I elaborate
> > more? In the binding doc, the comments here, or both?
> 
> I just try to understand their placement. Bindings should not be in the
> soc directory, except a few things without clear subsystem owner. If
> this applies for both clocks and resets, maybe this could be firmware,

Maybe firmware, maybe power? LPCM is "Local Power and Clock Manager",
and I believe there's essentially 1 LPCM (microcontroller) within each
top-level power domain.

Brian

> but another point is that you should not need these in DTS. Somehow you
> split one clock/reset ID into two - LPCM ID and clock/reset ID. Just
> don't, unless you want to say that for example LSION_CLI16_UART_CLK is
> in multiple LPCM places?
