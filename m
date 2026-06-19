Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A13BBA1E
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884399; cv=none; b=B51gMX4PzFBgNKuCO1mtbyQxUMPQv8LtuJtym+9L7KU9W3NSodOdObq8Z7Azeg+cEkVfvaC2iOjfUl0eHAm1PyJ/IHPnyx3I3nzNfDq1o2yDg6daz3KSrpZ3vRcnBcEJpAj5BYt7qviR1AFc2ofjfThbwNfVzbqdKQoRDCd6YGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884399; c=relaxed/simple;
	bh=bb+cUcj7HQuwpnFQDNO7rItSBV5fu/hsjtqa7E0WUUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP0eG7M9LlZrj5VF+dFFPPSDFwScU0qk2JZ8Xci6jhFhiSsNI8rkw9vbtFquj0ZQOUx4araM6Q6HKY0iI4ZRUWgeP4WNciQDTVMRDBLNI1VUjFFdo5lESyxm/zdCXjUuGOzk3NBrfsl3pdbeNt0dXX3Ns83OVuVCGCs/qMP6enE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkNA05hw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkNA05hw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so17167585e9.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781884391; x=1782489191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0CgMpW9yG1iq8S4CDVlww4fITpPQ7sSOHilePzQBMw=;
        b=PkNA05hwFi9CALCM3FvA9MUdfRVKK2tJt106PYn541LqUwzE+zi2L9lnGEYp0SKLjv
         La3O8/Z659vMkSNhu2a95t8hnKS/vuClhY8W6Usd+Asky0viJ9R3cr0wZE5dOW08u4wF
         dIpNwIWzJlDz3WdABf4qWAnjPz493g+5kh/WN1BnNPl1viY1mxAFjWxNWLRNEn7baUx4
         Fx6m3CqWgS3SCJw/+kuuWpnjH03COBtJVUt2KgMpHh7zBdyRTCV9ubvLlyAk0PZTySGF
         vNqy2vlh4BSOMWW6z+88uZWOb8gf2skuxOcj27vws3UQyJnqAhNtaDZw28wy4U+eVcwW
         CPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781884391; x=1782489191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0CgMpW9yG1iq8S4CDVlww4fITpPQ7sSOHilePzQBMw=;
        b=HkHFcft5+mBuuvgNnUggEzlJj5/HOjwYXbBlEaQtk0ZoIs4VVQd2lDJRt1j1IsLKgD
         xAE7d6M6LLTYCpymzGb64iwHY8v7sD2AVhXoeKPx3nka9p5KC7NbOhJFRhx/ydr1dS85
         XVtbg4lMkXdW8PTWlOvzzX2W9TxUiZrtR3lmr5HdX8E4DD089U61N848lCY+jwrH3ze3
         cOLJhoeDotSfMttwvNVHvTODPInwL9vp4pY8lZhLQr2RYdthpVWjh9PY1Tdr3wpXzQLv
         rl26MQ2yQxMUkoEzQwdyw4qlfLZyGMOFDbvx/XjbjyXkXgBqmu5G9IyWa59ULLjZtyJx
         AVmw==
X-Forwarded-Encrypted: i=1; AFNElJ/0nsk+auOjCu4+TVUa5JHRQTS/7AYHKQv9/K2lqySTad1wgfd8exuDLOKNC05zXQQ3MgFdY7DPBPSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxwICoeIr2Rl3aKiWGXcqJ7TcOfsirs5eC9su9kyHY8vmyQvlwq
	t1iJSirYGNv7xDznO7CPmCwRYDOXJNJQ9Nlu7ULf0BqfohDtV7mChnha
X-Gm-Gg: AfdE7cnatgB4K9SXTfg8i2dx7qaloQMcBUNRQa2DbZJQuCFs55qhZzqfBdmou7vhxuz
	Ivj2xwLwNWkcJMjv12XCJNcAvrgIoGvpieUkYla1CLOEGXcIbfR7ktq/6JKo9vwB26Mf0PpxSqs
	9JyNtormFs+0R7GQWOifelAdaUsg+K+hKu64AGHI8F6R9ov45khbsoLEVv0W/NuvB1eUWSEVNMd
	pLtlezqvgGQPBz3tHFll1TW5OekO9P1sAb2wuAGwXoANKwfpcLyuR77MUx5O8FRvi4nugdL/+Wb
	o/WuZbGbzszWORODPHslRzXt4stNApYVpUCtZl04oO0Lj039O430ExndXKsejdDmDjqg/HJI273
	Anm5ZRJ6GNYstH1lV61K6+0gzk1mvDFtDXhy+fGKUrtR5XdShJqqTmDjYGPJ9POtc4JthvPCRtp
	XS2n5kCBn6NYcoXKo=
X-Received: by 2002:a05:600c:8b42:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-4923f5944eemr88749815e9.33.1781884390726;
        Fri, 19 Jun 2026 08:53:10 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49246403653sm24433175e9.13.2026.06.19.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 08:53:10 -0700 (PDT)
Date: Fri, 19 Jun 2026 16:54:11 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Janani Sunil <jan.sun97@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <ajVlD-j0nIGrRVow@nsa>
References: <20260519-ad5529r-driver-v3-0-267c0731aa68@analog.com>
 <20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com>
 <25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d>
 <603473ac-30e6-45e5-8a3b-c9902715cc9e@gmail.com>
 <20260614204455.408c4d40@jic23-huawei>
 <076d7d2d-81a0-49c2-af94-bd65ead66c09@gmail.com>
 <20260619-obstinate-polo-a230bef97fda@spud>
 <20260619-bunch-diocese-dd7805cc17ff@spud>
 <ajU73_TkKrSbqD4f@nsa>
 <20260619-concierge-doozy-9c161533c369@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619-concierge-doozy-9c161533c369@spud>

On Fri, Jun 19, 2026 at 03:12:07PM +0100, Conor Dooley wrote:
> On Fri, Jun 19, 2026 at 02:01:08PM +0100, Nuno Sá wrote:
> > On Fri, Jun 19, 2026 at 12:40:54PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 19, 2026 at 12:36:55PM +0100, Conor Dooley wrote:
> > > > On Fri, Jun 19, 2026 at 12:33:11PM +0200, Janani Sunil wrote:
> > > > > 
> > > > > On 6/14/26 21:44, Jonathan Cameron wrote:
> > > > > > On Tue, 9 Jun 2026 16:47:23 +0200
> > > > > > Janani Sunil <jan.sun97@gmail.com> wrote:
> > > > > > 
> > > > > > > On 5/26/26 15:11, Rodrigo Alencar wrote:
> > > > > > > > On 26/05/19 05:42PM, Janani Sunil wrote:
> > > > > > > > > Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> > > > > > > > > buffered voltage output digital-to-analog converter (DAC) with an
> > > > > > > > > integrated precision reference.
> > > > > > > > ...
> > > > > > > > Probably others may comment on that, but...
> > > > > > > > 
> > > > > > > > This parent node may support device addressing for multi-device support through
> > > > > > > > those ID pins. I suppose that each device may have its own power supplies or
> > > > > > > > other resources like the toggle pins or reset and enable.
> > > > > > > > 
> > > > > > > > That way I suppose that an example would look like...
> > > > > > > > > +
> > > > > > > > > +patternProperties:
> > > > > > > > > +  "^channel@([0-9]|1[0-5])$":
> > > > > > > > > +    type: object
> > > > > > > > > +    description: Child nodes for individual channel configuration
> > > > > > > > > +
> > > > > > > > > +    properties:
> > > > > > > > > +      reg:
> > > > > > > > > +        description: Channel number.
> > > > > > > > > +        minimum: 0
> > > > > > > > > +        maximum: 15
> > > > > > > > > +
> > > > > > > > > +      adi,output-range-microvolt:
> > > > > > > > > +        description: |
> > > > > > > > > +          Output voltage range for this channel as [min, max] in microvolts.
> > > > > > > > > +          If not specified, defaults to 0V to 5V range.
> > > > > > > > > +        oneOf:
> > > > > > > > > +          - items:
> > > > > > > > > +              - const: 0
> > > > > > > > > +              - enum: [5000000, 10000000, 20000000, 40000000]
> > > > > > > > > +          - items:
> > > > > > > > > +              - const: -5000000
> > > > > > > > > +              - const: 5000000
> > > > > > > > > +          - items:
> > > > > > > > > +              - const: -10000000
> > > > > > > > > +              - const: 10000000
> > > > > > > > > +          - items:
> > > > > > > > > +              - const: -15000000
> > > > > > > > > +              - const: 15000000
> > > > > > > > > +          - items:
> > > > > > > > > +              - const: -20000000
> > > > > > > > > +              - const: 20000000
> > > > > > > > > +
> > > > > > > > > +    required:
> > > > > > > > > +      - reg
> > > > > > > > > +
> > > > > > > > > +    additionalProperties: false
> > > > > > > > > +
> > > > > > > > > +required:
> > > > > > > > > +  - compatible
> > > > > > > > > +  - reg
> > > > > > > > > +  - vdd-supply
> > > > > > > > > +  - avdd-supply
> > > > > > > > > +  - hvdd-supply
> > > > > > > > > +
> > > > > > > > > +dependencies:
> > > > > > > > > +  spi-cpha: [ spi-cpol ]
> > > > > > > > > +  spi-cpol: [ spi-cpha ]
> > > > > > > > > +
> > > > > > > > > +allOf:
> > > > > > > > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > > > > > > +
> > > > > > > > > +unevaluatedProperties: false
> > > > > > > > > +
> > > > > > > > > +examples:
> > > > > > > > > +  - |
> > > > > > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > > > > > +
> > > > > > > > > +    spi {
> > > > > > > > > +        #address-cells = <1>;
> > > > > > > > > +        #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +        dac@0 {
> > > > > > > > > +            compatible = "adi,ad5529r-16";
> > > > > > > > > +            reg = <0>;
> > > > > > > > > +            spi-max-frequency = <25000000>;
> > > > > > > > > +
> > > > > > > > > +            vdd-supply = <&vdd_regulator>;
> > > > > > > > > +            avdd-supply = <&avdd_regulator>;
> > > > > > > > > +            hvdd-supply = <&hvdd_regulator>;
> > > > > > > > > +            hvss-supply = <&hvss_regulator>;
> > > > > > > > > +
> > > > > > > > > +            reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
> > > > > > > > > +
> > > > > > > > > +            #address-cells = <1>;
> > > > > > > > > +            #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +            channel@0 {
> > > > > > > > > +                reg = <0>;
> > > > > > > > > +                adi,output-range-microvolt = <0 5000000>;
> > > > > > > > > +            };
> > > > > > > > > +
> > > > > > > > > +            channel@1 {
> > > > > > > > > +                reg = <1>;
> > > > > > > > > +                adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > > +            };
> > > > > > > > > +
> > > > > > > > > +            channel@2 {
> > > > > > > > > +                reg = <2>;
> > > > > > > > > +                adi,output-range-microvolt = <0 40000000>;
> > > > > > > > > +            };
> > > > > > > > > +        };
> > > > > > > > > +    };
> > > > > > > > ...
> > > > > > > > 
> > > > > > > > 	spi {
> > > > > > > > 		#address-cells = <1>;
> > > > > > > > 		#size-cells = <0>;
> > > > > > > > 
> > > > > > > > 		multi-dac@0 {
> > > > > > > > 			compatible = "adi,ad5529r-16";
> > > > > > > > 			reg = <0>;
> > > > > > > > 			spi-max-frequency = <25000000>;
> > > > > > > > 
> > > > > > > > 			#address-cells = <1>;
> > > > > > > > 			#size-cells = <0>;
> > > > > > > > 
> > > > > > > > 			dac@0 {
> > > > > > > > 				reg = <0>;
> > > > > > > > 				vdd-supply = <&vdd_regulator>;
> > > > > > > > 				avdd-supply = <&avdd_regulator>;
> > > > > > > > 				hvdd-supply = <&hvdd_regulator>;
> > > > > > > > 				hvss-supply = <&hvss_regulator>;
> > > > > > > > 
> > > > > > > > 				reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
> > > > > > > > 
> > > > > > > > 				#address-cells = <1>;
> > > > > > > > 				#size-cells = <0>;
> > > > > > > > 
> > > > > > > > 				channel@0 {
> > > > > > > > 					reg = <0>;
> > > > > > > > 					adi,output-range-microvolt = <0 5000000>;
> > > > > > > > 				};
> > > > > > > > 
> > > > > > > > 				channel@1 {
> > > > > > > > 					reg = <1>;
> > > > > > > > 					adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > 				};
> > > > > > > > 
> > > > > > > > 				channel@2 {
> > > > > > > > 					reg = <2>;
> > > > > > > > 					adi,output-range-microvolt = <0 40000000>;
> > > > > > > > 				};
> > > > > > > > 			}
> > > > > > > > 
> > > > > > > > 			dac@1 {
> > > > > > > > 				reg = <1>;
> > > > > > > > 				vdd-supply = <&vdd_regulator>;
> > > > > > > > 				avdd-supply = <&avdd_regulator>;
> > > > > > > > 				hvdd-supply = <&hvdd_regulator>;
> > > > > > > > 				hvss-supply = <&hvss_regulator>;
> > > > > > > > 
> > > > > > > > 				reset-gpios = <&gpio0 88 GPIO_ACTIVE_LOW>;
> > > > > > > > 
> > > > > > > > 				#address-cells = <1>;
> > > > > > > > 				#size-cells = <0>;
> > > > > > > > 
> > > > > > > > 				channel@0 {
> > > > > > > > 					reg = <0>;
> > > > > > > > 					adi,output-range-microvolt = <0 5000000>;
> > > > > > > > 				};
> > > > > > > > 
> > > > > > > > 				channel@1 {
> > > > > > > > 					reg = <1>;
> > > > > > > > 					adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > 				};
> > > > > > > > 			}
> > > > > > > > 		};
> > > > > > > > 	};
> > > > > > > > 
> > > > > > > > then you might need something like:
> > > > > > > > 
> > > > > > > > 	patternProperties:
> > > > > > > > 		"^dac@[0-3]$":
> > > > > > > > 
> > > > > > > > and put most of the things under this node pattern.
> > > > > > > > 
> > > > > > > > So the main driver that you're putting together might need to handle up to four instances.
> > > > > > > > Even if your current driver cannot handle this, the dt-bindings might need cover that.
> > > > > > > > 
> > > > > > > > Need to double check if each dac node needs a separate compatible, so you would maybe populate
> > > > > > > > a platform data to be shared with the child nodes, which would be a separate driver.
> > > > > > > > (not sure if it would make sense to mix and match ad5529r-16 and ad5529r-12).
> > > > > > > Hi Rodrigo,
> > > > > > > 
> > > > > > > Thank you for looking at this.
> > > > > > > 
> > > > > > > For now, I would prefer to keep the binding scoped to a single AD5529R device instance. The current
> > > > > > > hardware/use case we have only needs one device node and the driver is written around that model as well.
> > > > > > > While the device addressing pins could allow multi-device topology, we do not have an actual platform using
> > > > > > > that configuration at the moment, so I would prefer not to introduce an extra parent/child binding structure
> > > > > > > speculatively without a validating use case.
> > > > > > Interesting feature - kind of similar to address control on a typical i2c bus device, or
> > > > > > looking at it another way a kind of distributed SPI mux.
> > > > > > 
> > > > > > Challenge of a binding is we need to anticipate the future.  So I think we do need something
> > > > > > like Rodrigo is suggesting even if we only (for now) support a single instance in the driver.
> > > > > > That would leave the path open to supporting the addressing at a later date.
> > > > > > An alternative might be to look at it like a chained device setup. In those we pretend there
> > > > > > is just one device with a lot of channels etc.  The snag is that here things are more loosely
> > > > > > coupled whereas for those devices it tends to be you have to read / write the same register
> > > > > > in all devices in the chain as one big SPI message.
> > > > > > 
> > > > > > +CC Mark Brown as he may know of some precedence for this feature. For his reference..
> > > > > > - Each of these device has 2 ID pins.  The SPI transfers have to contain the 2 bit
> > > > > > value that matches that or they are ignored.  Thus a single bus + 1 chip select can
> > > > > > be used to talk to 4 devices.  Question is what that looks like in device tree + I guess
> > > > > > longer term how to support it cleanly in SPI.
> > > > 
> > > > I'd swear I have seen this before, from some Microchip devices. Let me
> > > > see if I can find what I am thinking of...
> > > 
> > > 
> > > microchip,mcp3911 and microchip,mcp3564 both seem to do this with
> > > slightly different properties.
> > > 
> > >   microchip,device-addr:
> > >     description: Device address when multiple MCP3911 chips are present on the same SPI bus.
> > >     $ref: /schemas/types.yaml#/definitions/uint32
> > >     enum: [0, 1, 2, 3]
> > >     default: 0
> > > 
> > > and
> > > 
> > > 
> > >   microchip,hw-device-address:
> > >     $ref: /schemas/types.yaml#/definitions/uint32
> > >     minimum: 0
> > >     maximum: 3
> > >     description:
> > >       The address is set on a per-device basis by fuses in the factory,
> > >       configured on request. If not requested, the fuses are set for 0x1.
> > >       The device address is part of the device markings to avoid
> > >       potential confusion. This address is coded on two bits, so four possible
> > >       addresses are available when multiple devices are present on the same
> > >       SPI bus with only one Chip Select line for all devices.
> > >       Each device communication starts by a CS falling edge, followed by the
> > >       clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
> > >       which is first one on the wire).
> > > 
> > > This sounds exactly like the sort of feature that you're dealing with
> > > here?
> > > 
> > 
> > The core idea yes but for this chip, things are a bit more annoying (but
> > Janani can correct me if I'm wrong). Here, each device can, in theory,
> > have it's own supplies, pins and at the very least, channels with maybe
> > different scales. That is why Janani is proposing dac nodes. Given I
> > honestly don't like much of that "adi,ad5529r-bus" compatible I wondered
> > about solving this at the spi level.
> > 
> > Ah and to make it more annoying, we can also mix 12 and 16 bits variants
> > together in the same bus.
> 
> I'm definitely missing something, because that property for the
> microchip devices is not impacted what else is on the bus. AFAICT, you
> could have an mcp3911 and an mcp3564 on the same bus even though both
> are completely different devices with different drivers. They have
> individual device nodes and their own supplies etc etc. These aren't
> per-channel properties on an adc or dac, they're per child device on a
> spi bus.

Maybe I'm the one missing something :). IIRC, spi would not allow two
devices on the same CS right? Because for this chip we would need
something like:

spi {
	dac@0 {
		reg = <0>;
		adi,pin-id = <0>;
	};

	dac@1 {
		reg = <0>; // which seems already problematic?
		adi,pin-id <1>;
	};

	...

	//up to 4
};

- Nuno Sá

