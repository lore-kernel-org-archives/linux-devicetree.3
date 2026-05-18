Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF90346AC2
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129713; cv=none; b=b1x1axhHhy+RgsICqmHGjB1/7WpOzmxk5Dkgxp8VBFUAQNtSqIcqhcvIcyzxNf7DlHmAXStBwOn3AicozwVe/fxsJ5f36JkuNzy7K5dLXweqox/8GVv+wtBuMqEdmJ2JpCSmQj1oYAu4MeP6HwRtHP4sj808svXiqv+SShO42PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129713; c=relaxed/simple;
	bh=JNbCHaWL9A4MjehkdwtKJsbWrGA6dxODtuxGwf4j9hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+ONZyFHA5F+Sk0PbHu4Ot6c+T/iiaUM9icFPDArsgmk3FE3YcY2exTdLRnr93Wc1y6MfnszQGwp/NWaDIMNy4A/aDpJ7Jrjqp3jlSLmaV/iGpwUsqdOpTqfo5Ql+8+s1/0ZjlOUFhju4sc45XOIQKZDJtncWtj9u/3Ls5mdjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW1/Fpr4; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW1/Fpr4"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d87c138e1so32455651cf.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129711; x=1779734511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RjcXx1L02D57/85kmr8KRIpyy2DN3BNEA8TDg2cGfrc=;
        b=GW1/Fpr4KJGV1w73HxVUBExobEEqxD+ZVKvNZzM3cODox/lJU6COlP3lO4/CvdOXE0
         JGTY3h0QVkg8jb5TosmM/0YN78pI3JlMqP/USMohv7pasTKsjP63Hm/LGwVKXbMlzSBZ
         w/j8Song2rMtZFCsTw+vocXOrT6AWIPy5Aejr7mexPBS+IixKirRKOD4X0GCN0uyFfdg
         Z/NCQxlwCqF5j9BvU1g+BPsC4lzskgWIq2IK4k80B8UTWN7q8qOHkuYLH0d//Go6Qlcu
         rNsmDX1NxObiej20UaelfHfmGXL49YuHIWN7ijjw8+LpwIE0S40Y0vRtffCXEWEEI69u
         Co6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129711; x=1779734511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjcXx1L02D57/85kmr8KRIpyy2DN3BNEA8TDg2cGfrc=;
        b=g67XUjcpAZgJ4x4BWZ5M8VbFdjEjMUBOQ9UZkemA/AxiyhgCadoWcRBCt3OjFEeIYg
         7aacunx5hZPLnAQzyHGytK7Lejh7g5sEyb04YpTyqT+3oILMC/vnQWQMybtZHSmZPLbU
         gzixWZBkpbzHf7lJSoDH1OTFyav6N9pJJQSNdtWRyCrVMWXafvYdUUTPs9ySWWmQH7PR
         oLae1WMY57c6+Ro4fv0LRhXzBF8ZAbm9M8MfwrylA6XXeghmdcREquIOnB4QU7k8RMDC
         QO/vC+KaFt9JeqLxCsourWpWzVwefV1UW3H4RBgcoZTJdF98TuzzyvJSve8CnFvS5nn3
         lCQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UIxnguUWbhc4J/HpD/w/L6jNugXvoQ0fj7WW1zTuH3bRfUKGjTGjLUoOBLZu3CsaNgoU/xd4zyrlM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5ivCog6WcxztKGcRITfEEPqSzuNN3fmT8JnBo4vfaXC5PFnK
	pSGr7eU0Ol0cVo6Zr2zSt5V1AYKc1vY7zMxA/sUteey33O7QwGKdiN4zbVYoVA0m
X-Gm-Gg: Acq92OF7kRfCHOrqaDYIGG4bVLu+uUBEAelw4d1904cDJCzaMuPUYHXcvKe3QaCnMDh
	aQ1/18i2imrvEpZU7RLgfyS3akFTlzQ2MrWHR/fNE6BuNmtgGbUDFqIXeIq0StIi6j5SVYRdd/R
	oLeoFSTltGp1AaMIkbOAthzMv4Z+UG+X6IFMZnCf8rGfISWtDW+7yhUFWzzDWRg9L3VNo3voF6L
	OYwe6F2nUoPVLRQeIaAJ9g0BaVj6b2fbOTp3ljQg9aeW1gJdjRiwrclNJLyq0BbePp11RMOS/JC
	qANmcdO3NeiG+YQ92FBInPuDhCDjVNA2qU+f12QGgmx+smcC3ygVvHJdz1OVYjJGV5xT0TVICEq
	dGpAKmPuPDmSzW4q/eBaaFX6lDzk+TX5eghPSoDHToz+x57cP6TqW/fFNVnlCJj00MQmhlIDmCq
	R6PfXc0Bk+tDfnsnEvEFlu3mmE1JqJZrtW
X-Received: by 2002:a05:622a:1789:b0:509:3940:30ea with SMTP id d75a77b69052e-5165a255f15mr239848711cf.55.1779129710804;
        Mon, 18 May 2026 11:41:50 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5168c968930sm50529931cf.0.2026.05.18.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:41:50 -0700 (PDT)
Date: Mon, 18 May 2026 15:42:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, dlechner@baylibre.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: Add ltc2378
Message-ID: <agtdfXdUR-zwtFOe@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1779117444.git.marcelo.schmitt1@gmail.com>
 <cf404216011b6972519436c63fcc7c4e2c883c54.1779117444.git.marcelo.schmitt1@gmail.com>
 <20260518-trapped-gauze-ada279af89fc@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-trapped-gauze-ada279af89fc@spud>

Hi Conor,

On 05/18, Conor Dooley wrote:
> On Mon, May 18, 2026 at 12:21:01PM -0300, Marcelo Schmitt wrote:
> > From: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > 
> > Document how to describe LTC2378-20 and similar ADCs in device tree.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
...
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - adi,ltc2338-18
> > +          - adi,ltc2369-18
> > +          - adi,ltc2370-16
> > +          - adi,ltc2379-18
> > +          - adi,ltc2380-16
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2364-18
> > +              - adi,ltc2364-16 # fallback compatible
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2367-18
> > +              - adi,ltc2367-16 # fallback compatible
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2368-18
> > +              - adi,ltc2368-16 # fallback compatible
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2376-18
> > +              - adi,ltc2376-20
> > +              - adi,ltc2376-16 # fallback compatible
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2377-18
> > +              - adi,ltc2377-20
> > +              - adi,ltc2377-16 # fallback compatible
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2378-18
> > +              - adi,ltc2378-20
> > +              - adi,ltc2378-16 # fallback compatible
> 
> All of these are wrong.
> 
> Firstly, your "fallback" setups don't work, because they only permit a
> single compatible. Secondly, if they did work, you still need to define
> the fallback compatible in isolation for it to be permitted for use when
> it isn't a fallback.
> And thirdly, your driver appears to show that these devices aren't
> actually compatible at all, given there's unique match data for each
> one.
...
> 
> Why do you have fallbacks here? Is it because a limited set of channels
> could be used in the fallback case? At the very least, the rationale for
> fallbacks should be explained.
> 
Some devices can be grouped by main number (e.g. ltc2378-16, -18, -20) and
those vary only on the amount of precision bits. I initially thought we could
fallback to reading only 16 or 18 bits if a driver compatible with ltc2378-20 is
not found. Though, I now realize that won't work because the less significant
bits would be missing which would compromise scaling the data to milli volts.
Will make this a unique match list (no separate items lists, no fallbacks).

...
> > +
> > +additionalProperties: false
> 
> As sashiko pointed out, this is not correct if you want to permit spi
> properties other than spi-max-frequency (although I could definitely see
> how this would be correct).

Ack, switching to 'unevaluatedProperties: false'.

Thanks,
Marcelo
