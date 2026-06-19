Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5473932E3
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875024; cv=none; b=IJv9l+n0JJ4okaL59qMdklE9x0h63CUCBdyiflm42agJ+ioHzRlyeeGLvvnuPlupQURejaUYIVp7N9PkNlnB7tbb9eHGJadvs+xIF1Vh1VEEYM2Bunpt810ssDq9kw0/PeIjjxCAH8EV6ofrnDVc3ouVKA20QoWDJ0XSktzTQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875024; c=relaxed/simple;
	bh=iPVKEaL/sDhtjxjiJ4ovC7cycjNBtMDP+R44lrz4ljQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amde6tmGX4vUgartiskvX3XZxKWmIrtDbc4cdKXqp4hstHCCfedPCgC8A2eClES79REDW5mZSEXUvxd14T4soyWd3BQAWFb71cOT7D+H2JzumsyCr8ft5V0WbUGxh1rQ7BmWBJW6zEi/kqRbxDpGX7jR7+NWaRPByOpvbNAHLJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwp3A8uA; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwp3A8uA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66061993121so2231221d50.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781875022; x=1782479822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccV2VXwAWn79HMfOu8BYWCMbmbtC3czR+CKDR5g5+lg=;
        b=iwp3A8uAiIvAF9lIpLMisywqTS+JzhsXpCWltqej+lYc/vGtWHa/KuO4p2ahcxhPL9
         SNPMleaBBqc+bM+ggfaFpdrE74phjj5irxTzGUkoOvzpLMqZQm/FGuL6hYO0Z4KkNaRU
         HKFz4w+H+LWhtjAaeMjnJvtQ1I4jZNROenVeja38lQpnpDs25cb03y6Ezdseeiwva5XF
         4gCyhVHQOYq++BLgnWjcJPFoe/DtKLo1SVswA5ODTlkbLNOCe6NmHNNa9plCW5pj4zBk
         JwFALsd9kNf09zgmG/VQ/Ao/Qx/HqqjQxVMBVjOIDnHq6oWVZAlfPTsgGbTDnCHV00nC
         vocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875022; x=1782479822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccV2VXwAWn79HMfOu8BYWCMbmbtC3czR+CKDR5g5+lg=;
        b=N4eGPqmeDsM7tXefkPaW/Ihf0KprAY3GNr1Cq3ybm0NnRgd5NWfErJwgfc9HT4xs/q
         lqbsTZHjYqPomEdvAPb1JD6c7q9eLa2w3j5AIeIDJnQaP4SJg65BC65s/luGvFzCrtGi
         epwy6tpUevPTEFtyp0BbfNM5+eLn1oATbrue86Mpc4fcdJRQPhyXKfWzzyHwesfNznPE
         O5cc2u/DKtNjYSCQIg2Xwc58NRyrRAS5OiWT80xou2oaj9KLERhJpUVZ2a3E0ZQP1pZ+
         J61G81qgay5Q4c/TjOYx0YQ0D16/pCCZIetHVejwV6bsuYKPVzhtZKc/1BmURJ8FLJBL
         wihQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hS6qB6Bhnb8+1TVsskF4zvPG8t6RJfm+ezREFKPVnl7xXraIcvl6n1jkPRYClUmVe0ABFvzb2I/WO@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTchs6aq2er2Vi687LhtyT8W2e+UJPabmaQBb6GJd6TLQqOMj
	XtLwPKe9eY2R/QRjvbHVhIXUxwL5lKK1kbuciE92+G87SLDcXbPzGw5SLE/R/NpmTD8=
X-Gm-Gg: AfdE7clwkasftuIP1VJ1ZgKP/hqlJhbBq5QQ6lDOlt9cfTpf8y9bC0aT7tSLg0mqWjJ
	eS/4QW6dW/lf03/ZAKjjLbLoU7COBPpmVflNZxyux28gO/g2+amzQ2gYLS1h19PndIDlQxzj5YP
	2XpGV0+KgFCljw3wB3lmFLkw9OjDBn9OonJn/KkMAoqPHoLE+l7i+9GPGR+FgzMSoTBPQm3pWNk
	dxbAO2FqmBU2LJjxHdAcwGdJD2SDOUvTANniHFdMQggBouJT4DslFFBWQo4tD+q48kFzaZX3gZ1
	LRe/x+l/WgHYvLNGyANDRTaGFR93ZqHUcFuFZl4UztYUFqJBwS/u/fdXdom/mFfgvXJ7xKG4a11
	MPN6n609OqBA1Q95nDu+WgkadHyq/kkfZS3ywkJJu2UkdLur2p50QbsqsbZ/IiPySsmjc5Ze7ZE
	UfxWHLCv21GVYhvfB09p1kdj+Tm9HxXHFg
X-Received: by 2002:a05:690e:1553:10b0:662:d8cc:6b2c with SMTP id 956f58d0204a3-662fc91fe6cmr3377503d50.25.1781875022447;
        Fri, 19 Jun 2026 06:17:02 -0700 (PDT)
Received: from localhost ([2804:30c:1f0a:b600:e457:1a16:4082:3e0a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de61d36f0dsm22122186d6.27.2026.06.19.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:17:01 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:17:40 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v3 1/5] dt-bindings: iio: adc: Add ltc2378
Message-ID: <ajVBdImL-S-YEx9O@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <f9e88abdbd23df8039282497a81d3c8698a10665.1781661028.git.marcelo.schmitt@analog.com>
 <76d39d2a-051d-4706-8433-3d3eb97e7f2a@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76d39d2a-051d-4706-8433-3d3eb97e7f2a@baylibre.com>

On 06/17, David Lechner wrote:
> On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
> > Document how to describe LTC2378-20 and similar ADCs in device tree.
> > 
> 
> ...
> 
> > +  vdd-supply:
> > +    description: A 2.5V supply that powers the chip (VDD).
> > +
> > +  ovdd-supply:
> > +    description:
> > +      A 1.71V to 5.25V supply that sets the logic level for digital interface.
> > +
> > +  ref-supply:
> > +    description:
> > +      A 2.5V to 5.1V supply for the reference input (REF).
> > +
> > +  cnv-gpios:
> > +    description:
> > +      When provided, this property indicates the GPIO that is connected to the
> > +      CNV pin.
> > +    maxItems: 1
> 
> Missing pwms property for when CNV pin is connected to PWM.

Ah, thanks for pointing that out. Will add that in v4.

> 
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt for signaling the completion of conversion results. The active
> > +      low signal provided on the BUSY pin asserts when ADC conversions finish.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +  - ovdd-supply
> > +  - ref-supply
> 
> I only looked at LTC2338-18, but it has a REFIN, which is optional.
> Nothing named REF that is required.
> 
Hmm, I think that's the only device that has it differently. Will add allOf/if
properties to differentiate these.

Thanks,
Marcelo
