Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F393CDBD0
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605352; cv=none; b=Vtcwzu8fkCAttSjoDnHTHWdTPQW5LTPnX3eN+3IXypvgBdLl255J6YtDAsaIAkbfbe887x73l1uSvHZs65eEtt8vzNC5dAX4J5ednM5hvMUC6O9G7+HgS+kBA1LG5tGxh0iSJhuljXlTigvX//BiCcjQLOXbEdGnB1ZfptFq5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605352; c=relaxed/simple;
	bh=6zAnmJplbRJHrEYL7JhzTrhZXo7V5OFYFINtTtoTZ2w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhxEWwlz2QGXcIcdsnsp4qS09p+AARbPgBoTjB72oYHkVhfMq39JqmfaME9shrZ2LHRy7A/kd3AMRn13pLlNCTihFxdt+/H5IXREiUr2bOwCM+04Epj6x0275V1qvDvVhcuv4l31ZHidClc5By4A9yROHc8FYPfSEpIH2RwFkhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k50ouChZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k50ouChZ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso4222943e87.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605349; x=1779210149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9km9X8WvuELTJi7qj+7+Noq5bB5jqawSJ9nshPfD98o=;
        b=k50ouChZSvxTZed6wqPYwc0Tt64X94W0HloH1IwzsbXRbaZCLuun2KmzIg1sMwBH+O
         QYgElNqdnQouiay3CWhPpChyGxdJQ5JfwbVOFV+vqwQ9duakW6TAf63q8lF3zQHj7Jrj
         LCkDjfzxZw4P4V3fygTPDuDbMci2mo8aaK3wCL9UWBamPbyx0P/AVlxrNYHY5DYTcJAK
         PfQe/NpnaEQD2OodCfFryrOcCMcjR/P5zgFAUlMY+mSh5Sb9LQhDNQMuXFgkA5oLWGrk
         dhCZZ1xUKwiJsJ1flAuLYZICQhaicQINrXFCgxPpCWRS02XhzA0UgyonX/vJrNFqVMvC
         CPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605349; x=1779210149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9km9X8WvuELTJi7qj+7+Noq5bB5jqawSJ9nshPfD98o=;
        b=rP1uj94BDs2z1ivYUIuZCHkMhCec7zvyqIHk+SQxYqo/KvVszm8yH8DnLJ6D46k/7v
         4a9Hb6aL9VbNmFEgNALG7CySYJkgZthk7Vb/J7jVHXcuHwrzB2xdv0N8wcY9VoZuY73c
         gWlN+WSD4Yabz9g5rXfu8gCGfXVBPy6r+jwnJpGAPazRWq0SXjfQ1/Jl1jsSZEg9TDJ7
         5jlXVoL2/xrAn2lI0yPKBawcU3Q094GTRBtARGpEBBbNoJ9zkwV5Sg4ucCSEmFZTDMLs
         kyakKT01LV/afPxxvVSLFL+QRihBqT6Y2J28RG2T4FBRvFTbNcuGiZC7doWA5jtduq36
         JA3Q==
X-Forwarded-Encrypted: i=1; AFNElJ94vLW5yOgsfP+nqPMcru45V0oYdkiZurXzpSOsPk/cY7DrdRzi1EZ2mopRzVpebMwUt/SctWd8oX2+@vger.kernel.org
X-Gm-Message-State: AOJu0YzsO23Cdc2fPKczn2/TXw/Pu00B/i6obtWDTouEg2iNM1k0B4qe
	uupqvp2e6GxGG9iwrwQQi7aWcuu3sa2V6YYHIfA5BjCFMo/Mb6SNERylqxE2q0aD
X-Gm-Gg: Acq92OFFf9lyFE58uB/egNlxtUCPKz7PsgFw/cvlvxwNXdfSjnfuy9gukcOOCCqtDB/
	gitlad37RPJkyyFy8/ENWfjISG0EcKCuvolzXCIiGISgjbPZrEub8ivENEXIMuxmGGWBLNrZG34
	lAVN3nMdQK0N+Dmj+geUpRxY0zSbBqRVbfqL9flI1n5WzFRumGmtDCYAd2Q59DGCEcqbLFgvQUd
	77vO+/Og5bbC2kN7KZmQAEhoDGMZQ86BsPKbvPPu9w5XsLRTXCdjjXhZLoOfyQOVEtlS+uERlu4
	S34OeKKVLH4h/aF1H/CTOTzdalLVFaMPhIPF2aeoJY+UgqClRxS5c0+kdVFCbabj+OcbVI3pdPG
	YHLIiVsvVoPFcwVDOsXC/2CTw0zI/QIV2mlRXskJ3hiuZZCra3eo0jq9EffX4eeptHw8dVvMrwK
	OGF56kZakhpbFLWis7EMqRZwFwIWcFn+sd7LlZp8eMrfbiZXte7atTCU9YfxY2q07yw6IUq8U/O
	gjnIQcR2aJVTdUnFf6vyZd7nDOpBXyGgQ24DPAuZCyEbEd2tUhm8yn12DY6
X-Received: by 2002:a05:6512:31c3:b0:5a8:84a6:2e34 with SMTP id 2adb3069b0e04-5a8e30d13e6mr1353520e87.14.1778605348704;
        Tue, 12 May 2026 10:02:28 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm33071212f8f.19.2026.05.12.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:02:28 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 18:02:22 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 06/11] iio: test: iio-test-format: add test case for
 decimal format
Message-ID: <zugkmatjsacla7l7nguekmclfdkzsshr3gs434a3liccgokxb4@xg77y5tkts5c>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-6-34af2ed2779f@analog.com>
 <agM7CT4RjzwliKmb@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agM7CT4RjzwliKmb@ashevche-desk.local>

On 26/05/12 05:36PM, Andy Shevchenko wrote:
> On Sun, May 10, 2026 at 01:42:24PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add iio_test_iio_format_value_decimal_64() kunit test case for decimal
> > value formatting, exploring different scales types. Also, the same
> > iio_val_s64_array_populate() macro used to populate local array is used in
> > iio_test_iio_format_value_integer_64().
> 
> ...
> 
> > +	iio_val_s64_array_populate(24, values);
> 
> You want to test this first...
> I think the previous patch needs new test cases.

This is no complex stuff.. those functions are straightforward and
goes into accordance with what the format function does... which is
the opposite, before populating the buffer. The assertion on the buffer
content accounts for that behavior.
 
-- 
Kind regards,

Rodrigo Alencar
