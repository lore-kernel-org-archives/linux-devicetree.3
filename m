Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ADC191F91
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362521; cv=none; b=YTJ7WdD8QMFZv5CwC5q4L5N41OwXC53pprlQ3ErhtcJ/QUH6/18PuHJ9kA/N/YwlGGcGoSGzUh8DYLY2ufY92dR0/5Oz/Ev7dq0MQYhRIC9PT0wMhHxef+o+uiqcmgoHyricPVcAF2tQlSMfm/YFN4PyVd/ZHu3F9+AnvPPxAM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362521; c=relaxed/simple;
	bh=un5vJmKuf9KhDXulQKe/Bn2uSGgatkG8otaxH+Varv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyD4TstqqvfzcLQy1yZ+7z65z82AH2PdTr8z9ZKMChvdN9kYkR3vqCzQ1/hQNwQcLdIuw/38cGWdI1BhODousMOJHQ45PuKdZsgcMIU/tCWcRlAUEB9wzkP4YfoVe7jNj0w7IArCas3PSBiW0n3e3B8UzEDZq7Vfjoqcln9XsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFGqjjSZ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFGqjjSZ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c7212836bso72346c88.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776362518; x=1776967318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60N7vYgebawIQ/IuYOlbRBF7aQ2YJsB3l2hVZCHj0iY=;
        b=lFGqjjSZawaoX9bvO5qtNBgabIeOn0sABdcSph05og/r72pUXZ4O1Ku2t5iqIIPJi8
         IlLvf6F5kDq498QKUJL/vDTLs3Rly7TwJ4NQ5rj+RnTnTAqI8BML2Yn5Mg0GlYI0Q8dR
         oYjVygkUtgI1wLwVkCwQ8jjot+7ozeP1vH81mjO61P0XgctK9p/syF6zPhTsXVM2AsA/
         71RhFKggWWP63JVr6dEngtPOQQCMCIfhNEXLAM/u5DPu8qUe5DVIoPFO5AAd7LpM17M/
         mPbNMbuKkrCBD3nhIwioUiqNcXfqH6OHKYPTt661ERPzrnAnzEgmKLXuX6e3c2yQErL+
         bOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776362518; x=1776967318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60N7vYgebawIQ/IuYOlbRBF7aQ2YJsB3l2hVZCHj0iY=;
        b=Ne/XI4tsdJiEGW06FQ6cSK2uVs5V8azi4jMlKeJf5bqkFCsoeQLSq3hsx27RlHwlfk
         96g56aWqj8Wc3QWRklYt3gIlTuXc/zYpb/BKpt2rDwO8YRLYydh85v0kJsPg469r1W+v
         GKoWKcrbBrnt5KUbCEyfywWIVAX3++/HICyZhOwtoOUPU5j3wjp5n29Ic+eVBi0p+jCA
         AltSX4AIP9ZRtqNL2e2vvVY7sn/76CRt05X8srO03Qnc69F1BN2kRImqRFxwrt53yDQP
         ICD+UCypgfOR4k3In14CeFOHw9kjEhXTljwE8ig+/QeHV0tVeQTPP2MS9zaHs+zOicMd
         UGXw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ap9k6wE3Nbvs7gpjTq7YxEkfV17dvsKxZ9DB/LUxBmbBbqc6psiZIoh+SeA8K96S1wwiMf0BEF2ZS@vger.kernel.org
X-Gm-Message-State: AOJu0YxPH+Rrtl3r8HiK+xHkn4oPzvojGJ7g34AhGzBxU7rEPPctQm1u
	9mnCnOTHl/2AJGxgvVHjkIEotaPHd1TIMiTly8Vfde4VeIiHMqe/6ui6zOvfUg==
X-Gm-Gg: AeBDiethc2+aK5lMgfM9p32wEVe3R22W4975QGkciP17KskBdFCcilRhruw6kjiFBT/
	HX36mZnTXO3zJtPWU4ET0QVEwY7a+4n6LXAtXtzcazUMbayOiLs5M2tYLpkE7ptAIbKPfRTAuJo
	Uur3ouSRRrFczazfDxgGtQDcu7QkSmAz+mLRIAuTnPCnvYbsH9DI+DxEUzRS+mQalOOA0xJf9mz
	dxpPMDEdB5THL1HH3zzxyOr12KPj8w5KTxUvla0qzKClUzy3NMHLTg8iMyHFhr8zYJxyQR3kmJD
	b7BBhjsWeY64ritZnSH7UWoIbBE+w0ED9jb9dy4GEJleU7hrci3j1SOcIZJ/eCqh2Xq1keDK5sY
	ufX5Almfb06n7VA/l3YSaQsqpPeGg26albx3OB9cY8eHJCIUnmu8IEapUnDgBarPK1GYc9YkGce
	Yf4cgr7VX4fsv6CHd3vtrqLNTq72GjwD5K20haQWI9prMG/Cc=
X-Received: by 2002:a05:7022:6b94:b0:12c:4928:e57f with SMTP id a92af1059eb24-12c7285b24dmr66236c88.25.1776362516755;
        Thu, 16 Apr 2026 11:01:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c6e0fc4absm2056544c88.3.2026.04.16.11.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:01:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Apr 2026 11:01:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <84a5154f-1139-425e-94ae-31d7e662cd0e@roeck-us.net>
References: <20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com>
 <20260416-dev_max20830-v2-1-2c7d676dc0bd@analog.com>
 <20260416-diaphragm-corrode-494560404ed4@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-diaphragm-corrode-494560404ed4@spud>

On Thu, Apr 16, 2026 at 04:51:37PM +0100, Conor Dooley wrote:
> On Thu, Apr 16, 2026 at 03:59:10PM +0800, Alexis Czezar Torreno wrote:
> > Add device tree documentation for MAX20830 step-down DC-DC switching
> > regulator with PMBus interface.
> > 
> > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > ---
> >  .../bindings/hwmon/pmbus/adi,max20830.yaml         | 61 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 +++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8b3ec1ffa0c9460de2122f6606ce3dcbcdfbbcc7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20830.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices MAX20830 Step-Down Switching Regulator with PMBus
> > +
> > +maintainers:
> > +  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > +
> > +description: |
> > +  The MAX20830 is a fully integrated step-down DC-DC switching regulator with
> > +  PMBus interface. It provides 2.7V to 16V input, 0.4V to 5.8V adjustable
> > +  output, and up to 30A output current. It allows monitoring of input/output
> > +  voltage, output current and temperature through the PMBus serial interface.
> > +  Datasheet:
> > +    https://www.analog.com/en/products/max20830.html
> > +
> > +allOf:
> > +  - $ref: /schemas/regulator/regulator.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,max20830
> > +
> > +  reg:
> > +    maxItems: 1
> 
> On the previous version, you got an LLM comment about not having the
> interrupts property amongst other things.
> I think the other things got implemented, but I didn't see any reply to
> the bot about that?
> I think the answer is that it shouldn't because the pin it referenced
> doesn't exist, but when looking at the schematic I have to wonder if

I had to look this up in the datasheet. A SMBus chip with no alert pin is
a bit odd, but you are correct.

> there should be an interrupts property for dealing with "pgood"?
> 
FWIW, I have never seen that. Normally such pins are used to take devices
out of reset.

Thanks,
Guenter
