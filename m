Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFA342C9E
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782907; cv=none; b=IynHkSnevcjefvr7cRuPMQDgpeip610DEW4ZGkGwe2b6OqbQy9gc+j3qsm6S6gZf8Ex3/7gHjd7r+rbvY+dy7Py9MJaT9wh4yPOAGyGCiYK8oY050+yLoGnXJm68vP4zbGfl4v/8TNHArpuF6tdYLpRQQRB0Pope50vBc1rF+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782907; c=relaxed/simple;
	bh=xiyGdQ++U1UtqkatYJgGm/qOcY3HlzvZUVAL6dPWzuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mu0hX7y/TRomn4/BbfScA9E3LS+dARmwzJ1KciHu6FNk5V9OTpE8DODwCphXH4h3cyjqMVxNXH/xmh3oPTPWMjGSQRmy//BJyKt5/kX3bVnEGqw1m7t8TLgNjhU0qi8A00M5gBOWDB62CgTfBw2jPsunew5ecdfoNOml/1LJr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzW/vyoa; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzW/vyoa"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85e68bdbcc1so9846487b3.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789782905; x=1790387705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yG1RrdsL5LeS0VTnmrMa/hvpkQZLLQkLYZHcn7XLtk=;
        b=kzW/vyoaxSIxOIcZB/PMhwIb8x1091jiRNZ4yDhr+Q1Ug52ulLDE+0obzw88nbfLbZ
         ubiIgmBNpO0QOqnQCt7dUYQAVhNIzUF4CQ8p1Yok0ImclafL5W0eOD34QYJa6aZn2jWX
         FuMOjSkqH7kexXO/d1ewIwJDUxDTtseV37Z6VxImFmnpzUNFoKd2NS8EYL8GJ7p67mVx
         IwRhEMXjKqKmnNpNVaAA/teL+m/wW8mYWFOP1W9FjoPc2pdXpPynrQ5wqy//VaLBnQW9
         sGZu5Cg2irotiZgXGy98SsOYqqYLMWJH9HNQQlA8DCIB1KG4VSBKnuywVz2EfaDx7TVG
         o5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789782905; x=1790387705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yG1RrdsL5LeS0VTnmrMa/hvpkQZLLQkLYZHcn7XLtk=;
        b=zhF8yFy3dxk88Vj90bA+F6WMicHe53DhzOV4QOIkmAu3UZ0nF7DPUYx6kuuclXO7xW
         oB4ktjMF8eVuordoOw+oZm4VcVKXh9AVmo05jdi+6tNI4hdHYR6dopF+l5GFmc35M5wR
         l5zfm46i7XBGI6St3MZB0ETB+3tCzz7HyTV8GPy6ME0SVE0PNNDoQ7vdRJYTqYG1UR0D
         7iluEVKtJdx4gKNFqekESrv8L1PxYbjeRhAivwIw0KOLakqghm5QKmGVP31oqXNw0d6O
         xDZ8jBnQJnjC+ccPbryd9wiQr2dVlYDO6O/NzDHdeU2JsO+YPnHDn56PmMhXheOB2+i6
         tU0w==
X-Forwarded-Encrypted: i=1; AKwUvByT5lxu17xIhA8LmyY0MVQDQogbUlZlGRW1Ex+XUeMUCWBQeilVOBRhMt/+WdMczS/qhf+1HF+Q0zo+@vger.kernel.org
X-Gm-Message-State: AFuF++kJxr32154M9BC7VUkfaUivQocaMjHQG/EQ91Ga1agv+awRwsNU
	QFUIG6dkw/tb7MIrKm2UKkvy1Q0XHzjyWt3/b1Cs8xUab6OriLDpy+My
X-Gm-Gg: AYBFou2+6Ci/kbEPP8Goz3DxMucdBGYMWP13quUi69bl27ROzmgB7TInTqp+ew1gSQI
	mLFi8QKFqy2e3y84G9CCLWnkZC2EO/0Xq1+zWPqBZWr+n7MeKoMcVC8PQjpqnVk33pKxvIqIriR
	b/3Q34f2411XimtD8W7fJOkZuqQhMJTSTGXeh+OiK8ymobRA9itRra+k+GQYp1AtJFEPupMTb6O
	TEpt5YEqd34host8g9xCAu8NtlkAyUIj8lx/CbrYVIsP0ffRb7BO+YFr5r5Nb1A1JD02oKWJEFb
	aF0bFf/8rXwR87i72qzqTpbz/qRZEz9amWZDQwzUIeeQEG3aEkFnkUZ3IuwqJYoIuPcqRXQJfKm
	6GH0x3r+NjB33GUI4+QXfS8jaqS+GBcYOY7ULOf/6qyIN2oAHgsGHkp1S7FBRbjzsbHT8BP23un
	1QFcKPqDNLLMeDHxe9NQbnv/90B620imam3UmK7bYnQ4khCPKi3XCpCQ==
X-Received: by 2002:a05:690e:1919:b0:671:70e4:5181 with SMTP id 956f58d0204a3-6717fe00f0dmr1107824d50.107.1789782904827;
        Fri, 18 Sep 2026 18:55:04 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67299071d4dsm710656d50.4.2026.09.18.18.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:55:04 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:55:00 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Chang Yu <marcus.yu.56@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: light: add as7343
Message-ID: <aq3rdBcMw1XcHnkL@gmail.com>
References: <20260907210042.32552-1-marcus.yu.56@gmail.com>
 <20260907210042.32552-2-marcus.yu.56@gmail.com>
 <20260908-dinner-shelve-1d61e19ee3b7@spud>
 <20260913014203.2bae2222@jic23-hlaptop>
 <20260915-gleeful-jester-c8114edf28ff@spud>
 <20260917034823.03940ac4@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917034823.03940ac4@jic23-hlaptop>

On Thu, Sep 17, 2026 at 03:48:23AM +0100, Jonathan Cameron wrote:
> On Tue, 15 Sep 2026 18:11:17 +0100
> Conor Dooley <conor@kernel.org> wrote:
> 
> > On Sun, Sep 13, 2026 at 01:42:03AM +0100, Jonathan Cameron wrote:
> > > On Tue, 8 Sep 2026 19:13:55 +0100
> > > Conor Dooley <conor@kernel.org> wrote:
> > >   
> > > > On Mon, Sep 07, 2026 at 02:00:41PM -0700, Chang Yu wrote:  
> > > > > Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
> > > > > with i2c address of 0x39.
> > > > > 
> > > > > The GPIO pin is described as a generic GPIO for now. Binding design for the
> > > > > more advanced measurement/LED synchronization use cases are deferred to
> > > > > future patches.    
> > > > 
> > > > Unfortunately, you can't change what you document, so picking something
> > > > correct now is needed - even if the driver doesn't use it yet.  
> > > 
> > > Definitely needs an outline of how it would be backwards compatible and
> > > an explanation of why not now.  Sometimes a portion of the binding is
> > > so uncertain that we do kick it back from initial version but we 'must'
> > > be sure we can extend the binding to new configurations.  Normally this
> > > is one of those we are fairly sure, but not entirely sure cases - or
> > > picking between two options where consensus isn't being reached.
> > > 
> > > Chang Yu: This sort of things needs discussion and is one of the reasons to
> > > go slowly.  
> > 
> > Ye, I note that there are 2 more versions of this since I left this
> > comment, but you seem to be on top of that.
> > 
> > > > > Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> > > > > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> > > > > ---
> > > > > Changes in v2:
> > > > >   - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
> > > > >   - Fix node name and unit address mismatch.
> > > > >   - Include MAINTAINERS changes.
> > > > > 
> > > > >  .../bindings/iio/light/ams,as7343.yaml        | 69 +++++++++++++++++++
> > > > >  MAINTAINERS                                   |  6 ++
> > > > >  2 files changed, 75 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..b06d445b92b3
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> > > > > @@ -0,0 +1,69 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: AMS AS7343 14-Channel Multi-Spectral Sensor
> > > > > +
> > > > > +maintainers:
> > > > > +  - Chang Yu <marcus.yu.56@gmail.com>
> > > > > +
> > > > > +description: |
> > > > > +  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
> > > > > +  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - ams,as7343
> > > > > +
> > > > > +  reg:
> > > > > +    description:
> > > > > +      I2C address of the device (0x39).
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    description:
> > > > > +      Open drain output active low interrupt pin.
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  vdd-supply: true
> > > > > +
> > > > > +  ams,led-current-microamp:
> > > > > +    description:
> > > > > +      The driver current for the external LED connected to the LDR pin.
> > > > > +    minimum: 4000
> > > > > +    maximum: 258000
> > > > > +    multipleOf: 2000
> > > > > +    default: 12000    
> > > > 
> > > > Rather than a custom property, the tsl2772 uses led-max-microamp:
> > > > tsl2772.yaml
> > > > 46:  led-max-microamp:
> > > > 81:                led-max-microamp = <100000>;
> > > > 
> > > > I wonder if the same should be done here, or if there should be an leds
> > > > subnode? Perhaps the IIO folks can comment on that.  
> > > 
> > > I don't think we've ever bothered with a subnode as there only tends
> > > to be one of them.  Given the enabling etc is all hardware controlled
> > > I'm not sure a more generic LED binding makes sense. I don't know that
> > > much about the led bindings though so maybe it is worth doing a subnode
> > > just to use the leds/common.yaml definition of led-max-microamp?  
> > 
> > Could always just put a ref in to leds/common.yaml and not bother with a
> > child node. I'd stick with the additionalProperties: false, since
> > there's lots of leds properties that probably don't apply to a device
> > like this.
> > 
> Sounds good to me.
> 
> > Cheers,
> > Conor.
> 
A quick heads up, adding a ref produces the following error when running
dt_binding_check:

properties:led-max-microamp: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml

So it looks like we can just put led-max-microamp, and not add the $ref.
