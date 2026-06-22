Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82E3A6EE3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130781; cv=none; b=PkkMqFhqzyrdyilRWrVX+KXjPVUV8tDf/kgRbRS985RHAyfcYD5cq+geuKrJwLybwzDQ6D/DF2699vIqYWSg/48PsGoxuMAXDgC1eupdIVgfZIqdF78ZktgCkas0bsAY4S04W85UZHODma0wBXzNhlqtcLoopWE4ZVUSh3N/uec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130781; c=relaxed/simple;
	bh=fsLs56oznHUectStk8BimDSOp5O7M8E7YzKxNLbEzS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7e/2R/4cLm6NcGtDbFQIG5ks+bDFLMey73lTLSNuL0CYS3v23cF6s431mwUSmdwEPYRuIjXHb+3U+SsnxPT5xxq46sq4bOCoYuOp1jaoTaHIJWl5W6wd1VpTovOkUXgvns8cX+rjIT0gcIuYo3C1PAhPF8I2HYrx2pgs4Y1faI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDZZsHZM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDZZsHZM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso29634695e9.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782130775; x=1782735575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2keziiHHF64J69kebZLh5D1dug7rsyXTNhahJR6yCY=;
        b=fDZZsHZMmWB1uYvOOJHcKismlclypTnR0jp8ozF9rM0PW0yUrB0D9RN7WHq0UcB6oF
         YmGvh9e4Xjvu5mdFvsxRx1K4C1E91y52UWoQOwuej6vO3KdttaQO5K1lqyRCvTAULluq
         G8dswC9f43o59nQIKiJ3UtJt9YeG+J3KV4ihUH66Y6WxbZCPYv07MgW0GNIZzR/RshWG
         LCeBWs9YDypv0mk7aAGxV6ava+uGmWYSVSwVGnsH7YiHfzjb5srsTJ6hMI+Yujqf5IIr
         Zsll2CSfgBIoo6D0rRI+TuCz/m0fjJ3T5fxslDdyeyH9zavIVmVoaed2HY66eVm/gkwe
         DB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130775; x=1782735575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2keziiHHF64J69kebZLh5D1dug7rsyXTNhahJR6yCY=;
        b=QHj1R/qL9u9g/f2qh1P1Y8lMCptIDM3/+E/lu3ABr41fuWt+LtcaXxRLA2Xvy3l4mK
         Dcxy3LfY2DRu71TPYcuRuw5MtlxCoBhLy2yvpCV8BgvzaUCDz2LFXMv7PgV0u9eypeKr
         zayCNUDcFriHAbkQDZPkcfl7iAwIj6OeNENCZvqS8IxZm0NdNf65XRalT4GiIkbD+S3k
         tuS9BAJfy4v2O3mFykujcHo4eNDkoWK4V8142kMpz0VacZ+0wd2zm5iFr5mSaRUidT76
         u02Mw0x9ucBgitAqEMyKoHpwxE0+l0OQ2Q8hW8lNR7fbGdxS8LrjN1SqZ8uWp1d/3suM
         Vfbw==
X-Forwarded-Encrypted: i=1; AFNElJ8NCDn1r3ie0qt9KX2GBrGyTwRGUAFx7oEax6ourhwqQJJcebWGAf9mBLzh/wfdnRyXOYeVMxr5OfQP@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3JkB6XrcDCqTwf29NFNi5rKEXRmzbk+MvxPEzn3u19WLqSOw
	MhsD21HFc9fJ9YsHU2I5DEceCfPYs5KGXvYrBMHH88hozETnW9vhDfBA
X-Gm-Gg: AfdE7cnTsk+hx7+10jaFYsb8YvfahJR5utHqC8QGz48ybkFYMuPlhANLU736K94coD+
	S9JGDPNSzdDieVSZcPDjDkbhWeWgzN6dORLfgEkuNonF0fbhbonfek8UzaIejjO0WOguaKV+A8c
	R+1At+eEm9WvM5ipPD2Qkgty7ZPOTrAgo8V/DJNCzpPnbVW5lgMkZwyJWlrxLjiiGNO2iNsMYMU
	h/bdPZPgyER5kA1WLRtUGo2HxTyfsSoVDfbtPdfI6xDP6AcUQtDsoew1tT/8nQ74aNSGGTQHNud
	7mkipCIbFBSmXKcJbRNsOfIiCZpYPKSDayywrJY5bvK+YaQf5RfeE8HLkpltdC6kCFItY4MwBs0
	h8DH5yt/l6PKinPjrnjdTt50V0C+AdCZFIkulZQLwuO6tZwmGC9KPGGV7B7X9I5tfVwj3Tr5ftn
	ejwAIT
X-Received: by 2002:a05:600c:2255:b0:490:c024:2eba with SMTP id 5b1f17b1804b1-49240e85de0mr173009545e9.22.1782130774823;
        Mon, 22 Jun 2026 05:19:34 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm25597362f8f.31.2026.06.22.05.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:19:34 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:20:36 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Janani Sunil <jan.sun97@gmail.com>, Janani Sunil <janani.sunil@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <ajklksIDLsj0BZul@nsa>
References: <076d7d2d-81a0-49c2-af94-bd65ead66c09@gmail.com>
 <20260619-obstinate-polo-a230bef97fda@spud>
 <20260619-bunch-diocese-dd7805cc17ff@spud>
 <ajU73_TkKrSbqD4f@nsa>
 <20260619-concierge-doozy-9c161533c369@spud>
 <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <5u4dnsgxwcwie45f24cacyzf3dko4srhyyyhcpom6tsvhqtmpc@y7d7gmex6n7k>
 <ajkMBh-R_7pYaoAn@nsa>
 <pifhwgj3cp2vc7ia4m6penh52iekzjljrp75y5b7j57vvtooad@32wfqruiqqjl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pifhwgj3cp2vc7ia4m6penh52iekzjljrp75y5b7j57vvtooad@32wfqruiqqjl>

On Mon, Jun 22, 2026 at 12:51:20PM +0100, Rodrigo Alencar wrote:
> On 22/06/26 11:29, Nuno Sá wrote:
> > On Mon, Jun 22, 2026 at 10:24:05AM +0100, Rodrigo Alencar wrote:
> > > On 21/06/26 15:33, Jonathan Cameron wrote:
> > > > On Fri, 19 Jun 2026 16:54:11 +0100
> > > > Nuno Sá <noname.nuno@gmail.com> wrote:
> > > > 
> > > > > On Fri, Jun 19, 2026 at 03:12:07PM +0100, Conor Dooley wrote:
> > > > > > On Fri, Jun 19, 2026 at 02:01:08PM +0100, Nuno Sá wrote:  
> > > > > > > On Fri, Jun 19, 2026 at 12:40:54PM +0100, Conor Dooley wrote:  
> > > > > > > > On Fri, Jun 19, 2026 at 12:36:55PM +0100, Conor Dooley wrote:  
> > > > > > > > > On Fri, Jun 19, 2026 at 12:33:11PM +0200, Janani Sunil wrote:  
> > > > > > > > > > 
> > > > > > > > > > On 6/14/26 21:44, Jonathan Cameron wrote:  
> > > > > > > > > > > On Tue, 9 Jun 2026 16:47:23 +0200
> > > > > > > > > > > Janani Sunil <jan.sun97@gmail.com> wrote:
> > > > > > > > > > >   
> > > > > > > > > > > > On 5/26/26 15:11, Rodrigo Alencar wrote:  
> > > > > > > > > > > > > On 26/05/19 05:42PM, Janani Sunil wrote:  
> > > > > > > > > > > > > > Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> > > > > > > > > > > > > > buffered voltage output digital-to-analog converter (DAC) with an
> > > > > > > > > > > > > > integrated precision reference.  
> > > > > > > > > > > > > ...
> > > > > > > > > > > > > Probably others may comment on that, but...
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This parent node may support device addressing for multi-device support through
> > > > > > > > > > > > > those ID pins. I suppose that each device may have its own power supplies or
> > > > > > > > > > > > > other resources like the toggle pins or reset and enable.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > That way I suppose that an example would look like...  
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +patternProperties:
> > > > > > > > > > > > > > +  "^channel@([0-9]|1[0-5])$":
> > > > > > > > > > > > > > +    type: object
> > > > > > > > > > > > > > +    description: Child nodes for individual channel configuration
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +    properties:
> > > > > > > > > > > > > > +      reg:
> > > > > > > > > > > > > > +        description: Channel number.
> > > > > > > > > > > > > > +        minimum: 0
> > > > > > > > > > > > > > +        maximum: 15
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +      adi,output-range-microvolt:
> > > > > > > > > > > > > > +        description: |
> > > > > > > > > > > > > > +          Output voltage range for this channel as [min, max] in microvolts.
> > > > > > > > > > > > > > +          If not specified, defaults to 0V to 5V range.
> > > > > > > > > > > > > > +        oneOf:
> > > > > > > > > > > > > > +          - items:
> > > > > > > > > > > > > > +              - const: 0
> > > > > > > > > > > > > > +              - enum: [5000000, 10000000, 20000000, 40000000]
> > > > > > > > > > > > > > +          - items:
> > > > > > > > > > > > > > +              - const: -5000000
> > > > > > > > > > > > > > +              - const: 5000000
> > > > > > > > > > > > > > +          - items:
> > > > > > > > > > > > > > +              - const: -10000000
> > > > > > > > > > > > > > +              - const: 10000000
> > > > > > > > > > > > > > +          - items:
> > > > > > > > > > > > > > +              - const: -15000000
> > > > > > > > > > > > > > +              - const: 15000000
> > > > > > > > > > > > > > +          - items:
> > > > > > > > > > > > > > +              - const: -20000000
> > > > > > > > > > > > > > +              - const: 20000000
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +    required:
> > > > > > > > > > > > > > +      - reg
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +    additionalProperties: false
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +required:
> > > > > > > > > > > > > > +  - compatible
> > > > > > > > > > > > > > +  - reg
> > > > > > > > > > > > > > +  - vdd-supply
> > > > > > > > > > > > > > +  - avdd-supply
> > > > > > > > > > > > > > +  - hvdd-supply
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +dependencies:
> > > > > > > > > > > > > > +  spi-cpha: [ spi-cpol ]
> > > > > > > > > > > > > > +  spi-cpol: [ spi-cpha ]
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +allOf:
> > > > > > > > > > > > > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +unevaluatedProperties: false
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +examples:
> > > > > > > > > > > > > > +  - |
> > > > > > > > > > > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +    spi {
> > > > > > > > > > > > > > +        #address-cells = <1>;
> > > > > > > > > > > > > > +        #size-cells = <0>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +        dac@0 {
> > > > > > > > > > > > > > +            compatible = "adi,ad5529r-16";
> > > > > > > > > > > > > > +            reg = <0>;
> > > > > > > > > > > > > > +            spi-max-frequency = <25000000>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            vdd-supply = <&vdd_regulator>;
> > > > > > > > > > > > > > +            avdd-supply = <&avdd_regulator>;
> > > > > > > > > > > > > > +            hvdd-supply = <&hvdd_regulator>;
> > > > > > > > > > > > > > +            hvss-supply = <&hvss_regulator>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            #address-cells = <1>;
> > > > > > > > > > > > > > +            #size-cells = <0>;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            channel@0 {
> > > > > > > > > > > > > > +                reg = <0>;
> > > > > > > > > > > > > > +                adi,output-range-microvolt = <0 5000000>;
> > > > > > > > > > > > > > +            };
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            channel@1 {
> > > > > > > > > > > > > > +                reg = <1>;
> > > > > > > > > > > > > > +                adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > > > > > > > +            };
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +            channel@2 {
> > > > > > > > > > > > > > +                reg = <2>;
> > > > > > > > > > > > > > +                adi,output-range-microvolt = <0 40000000>;
> > > > > > > > > > > > > > +            };
> > > > > > > > > > > > > > +        };
> > > > > > > > > > > > > > +    };  
> > > > > > > > > > > > > ...
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 	spi {
> > > > > > > > > > > > > 		#address-cells = <1>;
> > > > > > > > > > > > > 		#size-cells = <0>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 		multi-dac@0 {
> > > > > > > > > > > > > 			compatible = "adi,ad5529r-16";
> > > > > > > > > > > > > 			reg = <0>;
> > > > > > > > > > > > > 			spi-max-frequency = <25000000>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 			#address-cells = <1>;
> > > > > > > > > > > > > 			#size-cells = <0>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 			dac@0 {
> > > > > > > > > > > > > 				reg = <0>;
> > > > > > > > > > > > > 				vdd-supply = <&vdd_regulator>;
> > > > > > > > > > > > > 				avdd-supply = <&avdd_regulator>;
> > > > > > > > > > > > > 				hvdd-supply = <&hvdd_regulator>;
> > > > > > > > > > > > > 				hvss-supply = <&hvss_regulator>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				#address-cells = <1>;
> > > > > > > > > > > > > 				#size-cells = <0>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				channel@0 {
> > > > > > > > > > > > > 					reg = <0>;
> > > > > > > > > > > > > 					adi,output-range-microvolt = <0 5000000>;
> > > > > > > > > > > > > 				};
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				channel@1 {
> > > > > > > > > > > > > 					reg = <1>;
> > > > > > > > > > > > > 					adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > > > > > > 				};
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				channel@2 {
> > > > > > > > > > > > > 					reg = <2>;
> > > > > > > > > > > > > 					adi,output-range-microvolt = <0 40000000>;
> > > > > > > > > > > > > 				};
> > > > > > > > > > > > > 			}
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 			dac@1 {
> > > > > > > > > > > > > 				reg = <1>;
> > > > > > > > > > > > > 				vdd-supply = <&vdd_regulator>;
> > > > > > > > > > > > > 				avdd-supply = <&avdd_regulator>;
> > > > > > > > > > > > > 				hvdd-supply = <&hvdd_regulator>;
> > > > > > > > > > > > > 				hvss-supply = <&hvss_regulator>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				reset-gpios = <&gpio0 88 GPIO_ACTIVE_LOW>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				#address-cells = <1>;
> > > > > > > > > > > > > 				#size-cells = <0>;
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				channel@0 {
> > > > > > > > > > > > > 					reg = <0>;
> > > > > > > > > > > > > 					adi,output-range-microvolt = <0 5000000>;
> > > > > > > > > > > > > 				};
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 				channel@1 {
> > > > > > > > > > > > > 					reg = <1>;
> > > > > > > > > > > > > 					adi,output-range-microvolt = <(-10000000) 10000000>;
> > > > > > > > > > > > > 				};
> > > > > > > > > > > > > 			}
> > > > > > > > > > > > > 		};
> > > > > > > > > > > > > 	};
> > > > > > > > > > > > > 
> > > > > > > > > > > > > then you might need something like:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 	patternProperties:
> > > > > > > > > > > > > 		"^dac@[0-3]$":
> > > > > > > > > > > > > 
> > > > > > > > > > > > > and put most of the things under this node pattern.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > So the main driver that you're putting together might need to handle up to four instances.
> > > > > > > > > > > > > Even if your current driver cannot handle this, the dt-bindings might need cover that.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Need to double check if each dac node needs a separate compatible, so you would maybe populate
> > > > > > > > > > > > > a platform data to be shared with the child nodes, which would be a separate driver.
> > > > > > > > > > > > > (not sure if it would make sense to mix and match ad5529r-16 and ad5529r-12).  
> > > > > > > > > > > > Hi Rodrigo,
> > > > > > > > > > > > 
> > > > > > > > > > > > Thank you for looking at this.
> > > > > > > > > > > > 
> > > > > > > > > > > > For now, I would prefer to keep the binding scoped to a single AD5529R device instance. The current
> > > > > > > > > > > > hardware/use case we have only needs one device node and the driver is written around that model as well.
> > > > > > > > > > > > While the device addressing pins could allow multi-device topology, we do not have an actual platform using
> > > > > > > > > > > > that configuration at the moment, so I would prefer not to introduce an extra parent/child binding structure
> > > > > > > > > > > > speculatively without a validating use case.  
> > > > > > > > > > > Interesting feature - kind of similar to address control on a typical i2c bus device, or
> > > > > > > > > > > looking at it another way a kind of distributed SPI mux.
> > > > > > > > > > > 
> > > > > > > > > > > Challenge of a binding is we need to anticipate the future.  So I think we do need something
> > > > > > > > > > > like Rodrigo is suggesting even if we only (for now) support a single instance in the driver.
> > > > > > > > > > > That would leave the path open to supporting the addressing at a later date.
> > > > > > > > > > > An alternative might be to look at it like a chained device setup. In those we pretend there
> > > > > > > > > > > is just one device with a lot of channels etc.  The snag is that here things are more loosely
> > > > > > > > > > > coupled whereas for those devices it tends to be you have to read / write the same register
> > > > > > > > > > > in all devices in the chain as one big SPI message.
> > > > > > > > > > > 
> > > > > > > > > > > +CC Mark Brown as he may know of some precedence for this feature. For his reference..
> > > > > > > > > > > - Each of these device has 2 ID pins.  The SPI transfers have to contain the 2 bit
> > > > > > > > > > > value that matches that or they are ignored.  Thus a single bus + 1 chip select can
> > > > > > > > > > > be used to talk to 4 devices.  Question is what that looks like in device tree + I guess
> > > > > > > > > > > longer term how to support it cleanly in SPI.  
> > > > > > > > > 
> > > > > > > > > I'd swear I have seen this before, from some Microchip devices. Let me
> > > > > > > > > see if I can find what I am thinking of...  
> > > > > > > > 
> > > > > > > > 
> > > > > > > > microchip,mcp3911 and microchip,mcp3564 both seem to do this with
> > > > > > > > slightly different properties.
> > > > > > > > 
> > > > > > > >   microchip,device-addr:
> > > > > > > >     description: Device address when multiple MCP3911 chips are present on the same SPI bus.
> > > > > > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > >     enum: [0, 1, 2, 3]
> > > > > > > >     default: 0
> > > > > > > > 
> > > > > > > > and
> > > > > > > > 
> > > > > > > > 
> > > > > > > >   microchip,hw-device-address:
> > > > > > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > >     minimum: 0
> > > > > > > >     maximum: 3
> > > > > > > >     description:
> > > > > > > >       The address is set on a per-device basis by fuses in the factory,
> > > > > > > >       configured on request. If not requested, the fuses are set for 0x1.
> > > > > > > >       The device address is part of the device markings to avoid
> > > > > > > >       potential confusion. This address is coded on two bits, so four possible
> > > > > > > >       addresses are available when multiple devices are present on the same
> > > > > > > >       SPI bus with only one Chip Select line for all devices.
> > > > > > > >       Each device communication starts by a CS falling edge, followed by the
> > > > > > > >       clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
> > > > > > > >       which is first one on the wire).
> > > > > > > > 
> > > > > > > > This sounds exactly like the sort of feature that you're dealing with
> > > > > > > > here?
> > > > > > > >   
> > > > > > > 
> > > > > > > The core idea yes but for this chip, things are a bit more annoying (but
> > > > > > > Janani can correct me if I'm wrong). Here, each device can, in theory,
> > > > > > > have it's own supplies, pins and at the very least, channels with maybe
> > > > > > > different scales. That is why Janani is proposing dac nodes. Given I
> > > > > > > honestly don't like much of that "adi,ad5529r-bus" compatible I wondered
> > > > > > > about solving this at the spi level.
> > > > > > > 
> > > > > > > Ah and to make it more annoying, we can also mix 12 and 16 bits variants
> > > > > > > together in the same bus.  
> > > > > > 
> > > > > > I'm definitely missing something, because that property for the
> > > > > > microchip devices is not impacted what else is on the bus. AFAICT, you
> > > > > > could have an mcp3911 and an mcp3564 on the same bus even though both
> > > > > > are completely different devices with different drivers. They have
> > > > > > individual device nodes and their own supplies etc etc. These aren't
> > > > > > per-channel properties on an adc or dac, they're per child device on a
> > > > > > spi bus.  
> > > > > 
> > > > > Maybe I'm the one missing something :). IIRC, spi would not allow two
> > > > > devices on the same CS right? Because for this chip we would need
> > > > > something like:
> > > > > 
> > > > > spi {
> > > > > 	dac@0 {
> > > > > 		reg = <0>;
> > > > > 		adi,pin-id = <0>;
> > > > > 	};
> > > > > 
> > > > > 	dac@1 {
> > > > > 		reg = <0>; // which seems already problematic?
> > > > > 		adi,pin-id <1>;
> > > > > 	};
> > > > > 
> > > > > 	...
> > > > > 
> > > > > 	//up to 4
> > > > > };
> > > > Yeah. It's not clear to me how that works for the microchip devices
> > > > (I suspect it doesn't!)
> > > > 
> > > > Just thinking as I type, but could we do something a bit nasty with
> > > > a gpio mux that doesn't actually switch but represents the GPIO being
> > > > shared?  Given this is all tied to the spi bus that should all happen
> > > > under serializing locks. 
> > > > 
> > > > Agreed though that this would be nicer as an SPI thing that let
> > > > us specify that a single CS is share by multiple devices and their
> > > > is some other signal acting to select which one we are talking to.
> > > > 
> > > 
> > > If the device-addressing on the same chip-select is to be handled
> > > by the spi framework, wouldn't we lose device-specific features?
> > > 
> > > I understand that this multi-device feature is there mostly to extend the
> > > channel count from 16 to 32, 48 or 64. I suppose the command:
> > > 
> > > 	"MULTI DEVICE SW LDAC MODE"
> > > 
> > > exists so that software can update channel values accross multiple devices.
> > 
> > Right! You do have a point! I agree the main driver for a feature like
> > this is likely to extend the channel count and effectively "aggregate"
> > devices.
> > 
> > But I would say that even with the spi solution the MULTI DEVICE stuff
> > should be doable (as we still need a sort of adi,pin-id property). 
> 
> I don't think we can have something like an IIO buffer shared by multiple
> devices. Synchronizing separate devices would be doable with proper hardware
> support for this (probably involving an FGPA).

True!

>  
> > But yes, I do feel that the whole feature is for aggregation so seeing
> > one device with 32 channels is the expectation here? Rather than seeing
> > two devices with 16 channels.
> 
> Yes, I think aggregation is the whole point there... so that the IIO driver
> is multi-device-aware.

Which makes me feel that different pins per device might be possible
from an HW point of view but does not make much sense. For example, for
the buffer example I would expect LDAC to be shared between all the
devices.

- Nuno Sá
