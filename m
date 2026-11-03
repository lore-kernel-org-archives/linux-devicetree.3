Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673383;
	b=20UVP97e7rhVf3JclgFoX5JpDFR7qkiM2Gq3LOP9V4/uYfMsb/MlbWFsWZ6M8++9iIBv
	 iKNlEBIYCWn9LvIcv7/0uJZHs820A3a/nv/FWnzp3M6mbN0DhbFz49i9VmF5Uwwc/OHSU
	 d3pDhyYAR62h5u0/yFFAIZNgv+k7zEGr0c5B6vR76VJ7JYkmnWZG+NEojnqxkixNrjGgC
	 vRQY5HcHdCGkxEYbnEUHoKEpjIGWMjv33lb9VqZCOA/P8GnOSt3tittErpz6Um/igMaUQ
	 jcldQgfG11avWVX3qUe8UErr4GXSRTTAsaSawBzTdFGlpcdokdlbawluVNQAX2lYk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
	b=VYxWvBdPQ2V2fP4iDERO4vNOcPmax2zBqKPTQNhnsgCapJFEkvyqshNUvD5jEVMh2IZ0
	 mPhWvJdFIZ9coIhsP6ncJ6mvNyN2k8YEY1ysV3cdDEoxoC2oyDGrb7ZrHIt/A5lXFR2bc
	 Tshm3B7gfLuizlKd/vdL5bYuTB0/mbWNVNArysHW7Tsb4ppvImNgKDZLR5sCnVU7GAC9r
	 B/NCTO+DupYSImPU8hRd/f6L0RJSmW+58ijCtgmywWU8jpNzmZeUOJsVjrwWiyObj+ZSJ
	 +KVjAV59W2hajJN0vtl0VBq9Z7MOcW/8Egtk6/wr0Bq99CJICfLCEooYdy+6/lIRJHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DkWPyLYl;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A583606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 02:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A583606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DkWPyLYl
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso6048874c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 18:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793673382; x=1794278182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=DkWPyLYllsX8F9+zQfC/3k0f0U/ZXIWnnK0l4RWtnzGRXTFQx23lYizRBzclJKYzak
         zKwbG3jUzjz7dLCCWrOEePoLecvuwaUTU6IV7K2/w8w0iUV53/STEFHeYqThhFkolZYx
         UxHMGZby9xe0cedTKCDXGgRryw1uzxDJegxZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673382; x=1794278182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jlikt+rNAof8xPAw+Y9FynKuu4c36ojLvpof3Ekays=;
        b=HSHzRZZDkd0wUH3Rz1fek7AZYzKS1w/TbBfWB+0MDt1ZUKuTN5kW0DUSac2aHHWYqo
         l8xm8iVcDoyR92iN5KFpP02+VCeZ+2Uw9zm3GzE49r66ObUiGnd/pcRQ1dvCbYGVQx46
         fqKonZeyPiQNcTMg1pw/f/EN8SyiN58lbwvi0QtNUPpEGQPlFkYzfXXYB2xvlsaRmFAP
         zTHl0D2so3oe2CzMCMoZ+SWQoZ03Qg+Zu25j8fD2LhGQwQjmRXD35jOTP1XZqvIl9zuG
         9bXvlm0k6SbHUMgKv5v5DqvV/Js4qgc9rYqnscll//6FYLxOb2ZWCNvm26HzUtHenJdb
         qGkA==
X-Forwarded-Encrypted: i=1; AKwUvByRx7I7kKjoPF6y/xeH4jXpUk3b6GNh0SrR9ulor3HN6473tBhEIAeNRZeviw+wX9VgeLe8w9TF3sf7@vger.kernel.org
X-Gm-Message-State: AFq9FYJcF5JgoVzEob0Vz2xxiJNcIdJLN6drMwFrEe6hK0H4drgemaqP
	K9K84rUA3NvM4fgmaERHmvDCikctWCU+2+2UnGETlURImrki5Xy2535MCrc6u2wBcg==
X-Gm-Gg: AYBFou0HQvgb2AwHERGO6kuMuu5Knje2iaiCPRgt0trIjO8OZ5yklrX9XxEK35L8PrW
	GQlruDfiAVL0d4WZ3h/XDxMz3ui1uyw+7+DaQixQo+b+gOfspiNsjkymQNPtUawMVVM3EVCcP3O
	4f2V9luaHlkJ4O2YiAeU732WrfZTwBp4SxoMw0eWqba2i0un1uBOJ21vHn4gEGDhIcuoi2t7IMD
	VHxrsDS2nrQOhR9JqPUlSXkBVcXY3Y6IC6W9n9NaxpBSy+AnEuCdCEv9e9kn3YNpnfvY7ATn7eT
	wuBit4INygLnpV0ncaRre46HJ/MbUfBpEk1qx/X3J481sGDZhzzMlGE4YGaQ+LIdMMM8pUSUS7y
	W1X8s7M6VY76HnHSq44w8sL/hMUoDEEhNgBtswnuVOFMQf/rXgweLHj5dKQ55EB3Zt3VaqJDBqk
	DG0CZFzRPzSMF+9GJglr42pYlo6kOtHjd0Sz5ywbStZwIJ7NnyqpaGzh4c1sR7d8l41wxnIM0xH
	fr8iJQKaZTbIPLpjTbvqfvI4XkzTGLNtUBiFIctej+LGLwPyoTZj4FrjdKMZMjoWqytHM7qGQyF
	1NlppDqK/lxhcpdKKahhUxgQcp9nvrvaVhImaNFgXo0ArW2DgmSVwRZCGzH/kl2vgM0=
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1ac59dd07f5mr17524614c88.12.1793673381373;
        Mon, 02 Nov 2026 18:36:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1ac1abcd6f1sm37000499c88.20.2026.11.02.18.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:36:20 -0800 (PST)
Date: Mon, 2 Nov 2026 18:36:18 -0800
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
Message-ID: <aulIoq2oVjJ3DVzL@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
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
In-Reply-To: <20261028-rapid-daffodil-rat-0adc6a@quoll>

On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for CPM IRQ.
> > + *
> > + * Copyright 2025-2026 Google LLC
> > + *
> > + */
> > +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> > +
> > +#define CPM_IRQ_RTC_ALARM_NO			0
> 
> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> prefix.
> 
> 
> > +#define CPM_IRQ_AOC_MIN				7
> 
> Anyway, ABI constants should be indexed from 0 and incremented by 1.

What do you mean by this? Do I need to make up names for the
unused IDs between 0 and 7? On an initial search, I don't believe they
have any meaning at all. Does that mean I should make up some kind of
"RESERVED_<N>" naming here?

Between 7 and 156, these are just ... 150 different "service numbers"
within the AOC (Always On Connectivity) subsystem. I can name them
AOC_0, AOC_1, ... AOC_149 if that helps.

Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
into 0-151? I thought it was valuable to directly use the firmware
indexing where possible; if I change those, then the indexing loses its
inherent meaning, and we also have to add another layer of translation.

> > +#define CPM_IRQ_AOC_MAX				156
> > +#define CPM_IRQ_AP_GDMC_WAKE			157
> > +
> > +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */


> > --- /dev/null
> > +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +
> > +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> > +
> > +/*
> > + * LPCM IDs of each SSWRP.
> > + */
> > +#define LGA_LPCM_CPM			0
> 
> What are all these?

The binding doc says:

      Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
      See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.

and

      Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
      2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
      <dt-bindings/clock/google,lga-cpm.h> for clock IDs.

These are the IDs used in the firmware interface to talk about these
things, as many of the SoC resources involved (clocks, resets, power
domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
with indexing within each subsystem).

In reading again, I see that the definitions and explanation of these
terms and the SoC organization are split a bit between the pmdomain
commit message and the binding doc. Where would you prefer I elaborate
more? In the binding doc, the comments here, or both?

Or are you suggesting these IDs should be allocated/structured
differently?

Brian

> Best regards,
> Krzysztof
