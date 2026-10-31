Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464629;
	b=LX6x3cZx2XGgNSGIb8Gjs+K9SqFiC4/63pNU1rs3GZjcQmSGA9RIZbeXYZD9yPStMxcP
	 hGm06cPx+Q8AjQYHH7hzYk99SU/uVp4hnky/tMI49/EM7FGBFwj1UsnrUkwlLWBo16SHR
	 JQqPHkxKr/T5iigMue9sXpA3dHfp1EHW/p2cfGZC9wYGG4/QH6ESZRW4dWcneOYh82YNd
	 g3/8P2ongbmkxC32ulNk184uZ6FCDW/B/bG6ebqr7foQ4R9BdyDfP1ybGHKlwrRXCfOxD
	 LU7H53TAN18S1GfZX8C7Y7T3WSZH9yJVFX65cTPtZL/2uDlNDT+JodF3I40+TJgp1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
	b=hHISgG8TRzpOGlt8+/nNBYNBft4fWhMoYt9cY0akvqQ+/fSPZz4mMICHVdSokMnyOrGR
	 KZY8LpMljT6UY6yj2dAXuocs2mjefeDQ0jKh22gcFdT3jRskXLEtFZhC4Po19Hnl9qn6r
	 Ux6frVsEL84B8IbsEMX3gngxb4HVN3drCeppq/eO78+5xg73GliWxU1kDC0LeX+7CMAP9
	 rS/VM52ziMJw6QWgAxKvDzn38sYjx8epcEypOuSFPbGA5InYQxpPChG6i/Gp4JUs865V2
	 1YlETpSde4DUl6ZbLwoVPJQIj+IgMcFMyMF39Syx+POnzjU1J2l0h5hUn5oAN2jW0Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryQtlJXu;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD29606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryQtlJXu
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ea929b2933so95141e0c.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464628; x=1794069428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
        b=ryQtlJXuGOLY277F7JKl/5lVPrcSb4rXBnbEpO3itGx+1xjXisTz3mTMXT9bkdFlkv
         hLI9uz8ndz8i3smEGsFroNxgiT+XanUm0Ph1IlH67k5Ue1KuQRwS7EXQgAbJJa+np22k
         q0rrP9zbSxB29xD8T/+chHxZuU8uTRjYnEiQVjPLACCI38+RoawfwzpfVuQwad2+Cksk
         fi3I4k3ipvbnxAS0FehI70nvEIjGfWMatOQQieM+oioIcQYcrkwkX9JmyE7xij6W6G0N
         RB2OSw8PZzskWvAgY2IngyouO75X26t6vU4Gv6ggyPMQeY6wVgllKZD8Def5hxf3eLIR
         jq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464628; x=1794069428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
        b=DLi4U5q7//leK/M/j6PoYMq3v/8z/ggRBC0vmTDecFF5OXP0CXvkvPa0tEFdywSU59
         cFJitO24xdUKp4RU2c6sQymzDl/LTPokTNQmQvkASIYLpbjE0/H6OtLCL04Q7tSNyZg/
         hfUUYm1IjKF1Wg0AcqnWM6BMN6zemcsjV8pAYkkoda07QMN86n+VAnSvnY5l5kiUvQEd
         MJ/XhP190Pu16KyUb0rvzpdTHPwEqiqhM8AtMMjMwTOchwGSMPNlmqfHqKLFOD6Ag+6T
         hhuTOxRg9zsrMHnZH2MFfCIvbTpKE31178QexRfcHcTNBDd2XQ4BszmNXbutQn+CWjxv
         /YZA==
X-Forwarded-Encrypted: i=1; AKwUvBzQ70niXYOY1lWUe7bmMsUwkJbDSbZ4LVsa5mAv7+oTHcTYz1oiNr/dxLuJz+giv33mI8kWAthCdvxN@vger.kernel.org
X-Gm-Message-State: AFq9FYKphAjcM51Gm61m8zfvuobrS28QEH3yrVv+6woDbNOuWTNXhFg2
	/l70kL91F0EWqp9Qq6gh+UDbVisvFtWSxck5+Kau8+KfBIamLRkM0BEU
X-Gm-Gg: AYBFou3w0Bf1IA0z1Yp+30nEgcVTnX2FCWVFktTPRLp3w8yRExM/izq8+pOgL8jd4xd
	4rtVBWlWxwtjTCH7WhrFDQ5OIWkcJroDbAbvzJ6Lmsadc5bjDKjTPTN7gYoZhqnMsZTlVD+lfky
	G024QGvyyEpTLCdf3PMPoELTiJSl8/QPV5lVr472UT3A+EG8Sc1lIAjOoaRPBwYEMc+RNuoIKZ0
	tE0h6oX3BHEl9cRDLbLcCA45belpwlrJp4IIP/amWzgtusqleKm2hVbVvtRNNnNuY1UwMYCPla5
	9e58XsVbYLAWxS1z3JSvyFcwB+26uMopIE6MKvWd09pJMuKaN/qvIGNYXcx9NaYMI/ieGcqOUqN
	XxPdQu0E35wzgnr7NZVjcWkZcE79bQPrVQDQ/dV1G4lq2vQhmRcick327229hYgS35aow/7SjJB
	YkDdBlSZCGZuNxCXt3Xp7TBNuunJ3Ocxi8as5aq/uT274u9YE64a0UEeOD/NJfhXTq8x0r9cgja
	gAZ3fWxF0f7ghvDndL/2GdhjLqWtvp+JihnsaHMz65f6B1PJdYM5A9zE4ZUnm29k30SA/wwaPQj
	23ge+IouyLiBesptVmfWHC0v9oyE+CDNFNT8lC2KuTfUb8NUeRMMnJVNGlXhLnR+doioVQ==
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr2989151e0c.4.1793464627977;
        Sat, 31 Oct 2026 09:37:07 -0700 (PDT)
Received: from JSANTO12-L01.ad.analog.com ([177.112.152.97])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf220esm5989015e0c.7.2026.10.31.09.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:37:06 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:28:06 -0300
From: Jonathan Santos <jonath4nns@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Santos <Jonathan.Santos@analog.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux@analog.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/9] dt-bindings: iio: adc: ad7768-1: Document
 multidevice support
Message-ID: <auWKdiIzL1Gykxkk@JSANTO12-L01.ad.analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <6e2176d5547c59c39bb692e9768d7ac079b40f71.1792435248.git.Jonathan.Santos@analog.com>
 <20261026020500.6c13c0e6@jic23-hlaptop>
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
In-Reply-To: <20261026020500.6c13c0e6@jic23-hlaptop>

On 10/26, Jonathan Cameron wrote:
> On Tue, 20 Oct 2026 22:56:56 -0300
> Jonathan Santos <Jonathan.Santos@analog.com> wrote:
> 
> > The AD7768-1 family supports aggregating up to four devices on a single
> > SPI controller, with each device occupying a dedicated CS line and a
> > single data lane.
> > 
> > Extend the `reg` property to accept up to 4 entries (one per device).
> > 
> > Add `spi-rx-bus-width` property to declare the per-device lane count.
> > Since each lane is bound to one CS, the number of entries must match
> > `reg`. Make it required when `reg` has more than one entry, along with
> > `spi-cs-composite` property.
> > 
> > Add an example for a four ADAQ7768-1 aggregation, with shared DRDY and
> > SYNC_IN pin.
> > 
> > Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> > ---
> 
> I'd suggest some asci art might make it more obvious what you mean here.
> 

Ok! in the commit message, right?

> > Changes in v4:
> > * Include spi-cs-composite property to the bindings. The reason for going
> >   this route is stated in the cover letter.
> > * We decided to keep the spi-rx-bus-width property because assuming 1-lane
> >   per CS would break controllers that don't support multiple lanes.
> > 
> > Changes in v3:
> > * New patch.
> > ---
> >  .../bindings/iio/adc/adi,ad7768-1.yaml        | 80 ++++++++++++++++++-
> >  1 file changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > index 7b72d14e104c..64c1cbeaa576 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > @@ -26,7 +26,10 @@ properties:
> >        - adi,adaq7769-1
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 4
> > +    description:
> > +      Chip select number. For multi-device setups, one entry per device.
> >  
> >    clocks:
> >      maxItems: 1
> > @@ -109,6 +112,12 @@ properties:
> >    reset-gpios:
> >      maxItems: 1
> >  
> > +  spi-rx-bus-width:
> > +    description:
> > +      Bus width per CS. For multi-device setups (multiple reg entries), one
> > +      entry per device must be provided. Required when reg has more than
> > +      one entry.
> > +
> >    spi-cpol: true
> >  
> >    spi-cpha: true
> > @@ -203,6 +212,16 @@ allOf:
> >        properties:
> >          pga-gpios: false
> >  
> > +  # Required properties for multi-device setups
> > +  - if:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +    then:
> > +      required:
> > +        - spi-rx-bus-width
> > +        - spi-cs-composite
> > +
> >  unevaluatedProperties: false
> >  
> >  examples:
> > @@ -244,4 +263,63 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/iio/adc/adi,ad7768-1.h>
> > +    /*
> > +     * Four ADAQ7768-1 devices aggregated on a single SPI controller.
> > +     * Each device occupies one CS and one data lane; DRDY and SYNC_IN
> > +     * pins are wired together across all four devices.
> 
> For DRDY, wired together how?   I assume that only gets set when
> they are all ready?
> 

They are combined through an AND gate, so yes, it only gets set when
they are all ready. We make sure by using the SYNC_IN to synchronize
them.

> > +     */
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        adc@0 {
> > +            compatible = "adi,adaq7768-1";
> > +            reg = <0>, <1>, <2>, <3>;
> > +            spi-rx-bus-width = <1>, <1>, <1>, <1>;
> > +            spi-cs-composite;
> > +            spi-max-frequency = <2000000>;
> > +            spi-cpol;
> > +            spi-cpha;
> > +            vref-supply = <&adc_vref>;
> > +            pga-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>,
> > +                        <&gpio 11 GPIO_ACTIVE_HIGH>,
> > +                        <&gpio 12 GPIO_ACTIVE_HIGH>;
> > +            interrupts = <25 IRQ_TYPE_EDGE_RISING>;
> > +            interrupt-parent = <&gpio>;
> > +            #trigger-source-cells = <1>;
> > +            adi,sync-in-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
> > +            clocks = <&ad7768_mclk>;
> > +            clock-names = "mclk";
> > +            gpio-controller;
> > +            #gpio-cells = <2>;
> > +            #io-channel-cells = <1>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            channel@0 {
> > +                reg = <0>;
> > +                label = "channel_0";
> > +            };
> > +
> > +            channel@1 {
> > +                reg = <1>;
> > +                label = "channel_1";
> > +            };
> > +
> > +            channel@2 {
> > +                reg = <2>;
> > +                label = "channel_2";
> > +            };
> > +
> > +            channel@3 {
> > +                reg = <3>;
> > +                label = "channel_3";
> > +            };
> > +        };
> > +    };
> >  ...
