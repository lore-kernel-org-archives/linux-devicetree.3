Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92B26C3BD
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776628230; cv=none; b=IEmvs2vECh9lCcPG4jzDR9zL+7XrbWT5jbAoTPBRG5I9X/7y+Z5pIRFQrR7j+gKLhIU2LohHyv6Lh2xLYcnViapPSGI76PjTccQ6zf5Y3zpqXLxUVlRFUdrwA6DAHqrfYEo+x8bSuQ/Tk1AYGAYt7xsRg/mMZK7wEyQ1XnITtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776628230; c=relaxed/simple;
	bh=ztIqpItFOoWazoGNtpIkf9nyTLKqENLZA3ssRRj0iig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0UOcJgSGFJNOrNejiaTheSJ2tAihzfxFPrIGGpGNJqdkQdNA/jxQ7lY4Z1N3pk/ecZqhfBAhoOs9Il35GGUqaXA9aM8TvhEraxJoYW/UGzaX8+KoIfhp0Ryc6I1CkQuF5C9k7C6vIYAUJYPmmb+yY+j5u45pQR6uCgjU8Tc2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzxCkJnl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzxCkJnl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so35186345e9.2
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776628227; x=1777233027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vf1i8lfEd9qgZHORwpKMwpv9E0dJlY+ljc+Os3tbA+o=;
        b=KzxCkJnl+83vPIzEI9d+uERVR7RtzCWLEPGM9Z5INX00dKqDFTzprtpTVToHowSHWx
         dXvUvyYpLHT3f3DFeHJm+undXdacyqQCQ05kMKZ8J60fPdasbRrVVLrkG596/zzymCuH
         FGmQCqE3TDVAsxgjP7GpOBThg9iH/gpWcUTXLqfrHY1DDhRFFExHamyYdXxzb1zMN+tP
         mgr8KyQGCuJIBysg+wdCTCM256Bt+lve/gpAY6vMdq6s5nSpSFc0H2XXpDVUm4LFOzbX
         kC5dhjniGpaJWqjd8CRttwhQIBVen7Ob7AmZEKbrcaJ0Fl3li7JjdgneSO6PmLGAxG+Z
         Lp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776628227; x=1777233027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf1i8lfEd9qgZHORwpKMwpv9E0dJlY+ljc+Os3tbA+o=;
        b=F8BRbJhVKq2VkrK7njm0F75q4k+QkDlzzkK8YICF3VbAdTvujxKI7VSTvUY580M2gw
         RcZbZ7aCiwHgi6HDIy6elvPRgHILcePQ/4320iAInED/X3uAuEN5EShNxUviy1Aiumxr
         ueBoBhj7/5uOiXZL/C1yLUEswB2+yMBWDujJin2dIp6OCBeKVhyStBHcxUcy7DOFjGkj
         HzkKb7404wZ42StNL1BB++TtsDvJuPT7AifKbWAdn6t8ST0AbdOhkdjSvvhko+WwzKjZ
         zRNOB9Z1dvismoZLIdvuw9DfPl/482YON/1Vw8nnKwr5rjzMbx4uyA2ZA1UyZsbik8FA
         FPoA==
X-Forwarded-Encrypted: i=1; AFNElJ9un2/XclGyC4rdjYUV9NVzwhdnpInkon42W/XZKTOEQ9HU5dwVYyQw1/Y6I3j1qmTgr2Htpzpygq0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbHoG59aqR6AaT91MX5fqCkjAhGoJ6kNgGBmRLhuzPUNBJBUH
	nTXRVatisivHIptB+OWMHNys4mKmoLCSh0x2JobxpfuFEWIUxE+bYYgJ
X-Gm-Gg: AeBDietKNEG98v1yRFjp1JMUWMYwRe4cjWVW1OmdibXeVbaT/OQVuoqj9Wp9NI728qM
	HqnqEtnDph3HMVTow5/muVqBwxBfjO+UU5ubJ9oaxRTqWaF+J6Jryxl+dvRA62WyZ0wXtPNYw5I
	4hn31Ff1hvE7ASFRl9ho/+K2gWmWMe/5h5OUo7yWMzQMoWxN7fGKjXzs6KM9EDLZilWxobQ61By
	SWRXe0AXVlgM2fxJVhzdpriU8zKeVBEAqQHvT4/yLrughcabKu2w0gpX5ds2Jj7/0ibY2h4TqTF
	Jti7c1sy4OHtq+FCuUwviC4H9ADB7lpTKncNizDWtwWgg7/s4B2L3ICG/lxuX9zUHr0aW3qzrKu
	+PzYiRDX46QM371Vw+dkjS2h4vkZleeTNbv0nL0z1PQ5GCbHUHYUTFfwSXgpSBuvqjRkjrtFY+8
	a4e6+ieatb
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr143695595e9.2.1776628226850;
        Sun, 19 Apr 2026 12:50:26 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::d908])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm102999505e9.3.2026.04.19.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:50:26 -0700 (PDT)
Date: Sun, 19 Apr 2026 21:50:24 +0200
From: Wadim Mueller <wafgo01@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: wbg@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: counter: add gpio-quadrature-encoder
 binding
Message-ID: <rmez26bkescls3qvfdmxkpiooyuxt7vto37gfzyf77dv5rm5eq@er2anppgcuqa>
References: <cover.1776372319.git.wafgo01@gmail.com>
 <1663eb2f4bf4c826cd190fa9974fb55c321e7073.1776372319.git.wafgo01@gmail.com>
 <20260417-banjo-uncross-fbec3af75617@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260417-banjo-uncross-fbec3af75617@spud>

On 2026-04-17 17:13, Conor Dooley wrote:

Thanks for the review

> On Thu, Apr 16, 2026 at 10:48:17PM +0200, Wadim Mueller wrote:
> > Add devicetree binding documentation for the GPIO-based quadrature
> > encoder counter driver. The driver reads A/B quadrature signals and
> > an optional index pulse via edge-triggered GPIO interrupts, supporting
> > X1, X2, X4 quadrature decoding and pulse-direction mode.
> > 
> > This is useful on SoCs that lack a dedicated hardware quadrature
> > decoder or where the encoder is wired to generic GPIO pins.
> > 
> > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > ---
> >  .../counter/gpio-quadrature-encoder.yaml      | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
> > new file mode 100644
> > index 000000000..a52deaab6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/counter/gpio-quadrature-encoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO-based Quadrature Encoder
> > +
> > +maintainers:
> > +  - Wadim Mueller <wadim.mueller@cmblu.de>
> > +
> > +description: |
> > +  A generic GPIO-based quadrature encoder counter.  Reads A/B quadrature
> > +  signals and an optional index pulse via edge-triggered GPIO interrupts.
> > +  Supports X1, X2, X4 quadrature decoding and pulse-direction mode.
> > +
> 
> > +  This driver is useful on SoCs that lack a dedicated hardware quadrature
> > +  decoder (eQEP, QEI, etc.) or where the encoder is wired to generic GPIO
> > +  pins rather than to a dedicated peripheral.
> 
> Idea seems okay to me. Please rephrase this section to avoid talking
> about drivers...

Thanks, will fix that in v2.

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-quadrature-encoder
> > +
> > +  encoder-a-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO connected to the encoder's A (phase A) output.
> > +
> > +  encoder-b-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO connected to the encoder's B (phase B) output.
> > +
> > +  encoder-index-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Optional GPIO connected to the encoder's index (Z) output.
> > +      When the index input is enabled via sysfs, the count resets
> > +      to zero on each index pulse.
> 
> ...and this to stop talking about sysfs and driver behaviour though.
> Bindings are about hardware.
> pw-bot: changes-requested
> 

Agreed, will rephrase to mention hardware signals only

> > +
> > +required:
> > +  - compatible
> > +  - encoder-a-gpios
> > +  - encoder-b-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    quadrature-encoder-0 {
> > +        compatible = "gpio-quadrature-encoder";
> > +        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
> > +        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    quadrature-encoder-1 {
> > +        compatible = "gpio-quadrature-encoder";
> > +        encoder-a-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
> > +        encoder-b-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
> > +        encoder-index-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
> > +    };
> 
> I think this example alone is sufficient btw.
> 

Ack, will drop the first example

> Cheers,
> Conor.
> > +
> > +...
> > -- 
> > 2.52.0
> > 


