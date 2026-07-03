Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1A1D9A5F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098246; cv=none; b=Uw8V27Z+VB8fuuBg0CnCKnHVGZ7dF6mb0LBlclYpBhGa5a2RHyvQTx++aYx2vgc6Z/pLRIPib797dVnyol0BiCen6Inor9G4Mlp3QO1aR/O5c9R72mdVYWCdRpe/v6JE8KX+/4T1dNfGDSNGLKJz4aq+b+utE03QidY7eHM3yuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098246; c=relaxed/simple;
	bh=xfVxg6gl5w+u7tV6leMRJg88uDbrZR+IfArPfW8E5/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZBMeXWboadjDZCvkL+YuDtGZ2p77CXMrWbkomK7gnnhNa7G4WlnjuHUBDpDfh7Rol8Af7MSBpRMFax7YVnMMtCNGYP+nBFIBK+RsZXovp3oHszwiLEhxxAPq1CFh68p3efG7xRL3xFiJgNQaGjF4xLoyTb9HkdHdY3OB8z6KrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCUn/T8i; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCUn/T8i"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so594735a34.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098244; x=1783703044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dmaz70Zg8+nbLWCKBtz/pZ0mkbLi/T/8RKd4bWX5wQs=;
        b=eCUn/T8i+nUhnmBbIaXGoCrMjMcwxuPIEPKdoN/ryD0hGyeiFdm4he9hehPIOirGLw
         igfsJbvHXbNLz5lz38nhkHIiYNLIthb7xBs9FlHTBVw/axNUqLX7/xIHppw+W8lna+db
         H2ePAkmj1IW1PVtFF5g437w3H+CqBa2D4QN3DBPoj0Pffz4he3NKCJtZ2mQG4OaAsevU
         FCflTZoLWR6+GUpp/dajMeqAHYc1O8HJ4z7HXglTBaUWSvdBXxgp+1w/pM0dgTHeO+c0
         ES1TdYYd1u9ukidgREwXYNWbpHr/WAq9ZoSu+PPW3D09TtNoup6pm9nSiF2lBGrSZEue
         l+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098244; x=1783703044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dmaz70Zg8+nbLWCKBtz/pZ0mkbLi/T/8RKd4bWX5wQs=;
        b=ojcb52JKsWSgH9KoZHkeSm8Ghyt8Uaa4N+8L41qWyo30lx0u9L9ljAETIyPqxReLCn
         3jWFBOi2V3avhlP17zyuqbwDL4fYmrH50V+Nu4wvxfv+IiZHJhPQ5iqMWGObV9zC/FeP
         y+nM5c7UCPxaMTGSPi8KZnsZmFCibfY/H9+ZRI2N8YKYm/ot0coTXeYXnY2gmqxmkgZ8
         2qAlVmXUjjHhtrrKLF20lOnAvjrUNANtPodq6mflL9ntS+LsGLXdyEO04IzP4OfCGy80
         31RxlPTb5ClBkLCpbpqn0tJUo7uOW25D5ydnPzeeQOVmDReeqsMh5E+Sq+pdz26HFcne
         qaAw==
X-Forwarded-Encrypted: i=1; AFNElJ+72Sr1kSvcYiza7QaX7eNuns3AsUkM68Ir9erRANf3Cg+mG9MCyUm1IP7w5XhD2/5Q6nlFNpwuh72x@vger.kernel.org
X-Gm-Message-State: AOJu0YzVrX5ARwTSDKki6f4at7LL8TV0oQI8URnH+HBMu5rql8qrl2+d
	HKZVofxvJUHDPEZw7VS96fhYj+JbBlCnwyel77I+ymmvJYGGFiy06Giz
X-Gm-Gg: AfdE7clqn7nsLfpj7GHn2VgX5353A/yRuWffg4VLbQ4Q6ntXdnYZCAfOmye0UDJmkEJ
	oyuu+Pt3uLt5542oW5eDjcNJ8pTtbPJv7CgVh2MTkUs1C64hVqVWI2aaMsMrUu0B6RGiDnYTc19
	O2SrXnGGGU4RmqOGYiViveOI+sS6ednED+ATuiRu1cWCjFKs8uijm00pcnbGc606G+VAzZYyWIN
	xxDMFagPRvDJ3oZbQJ/uJp/Ul37z31AD0RoUaeQ44EgCQYTUy4FluugvxQSlRe3S3g0wYz3vfJS
	BopTDDCb6hU4fJn1mK/tZfGQY5xqJZMq5VzGiRjCtKyInwZaM34OBOvsuoLLNKWvGcuZX6ASM32
	oEORjiDy7qQ0sHvkeNSsZo6/brVq/WIKHY1jFd3s51JGkvuByqQ+hatAPTcf2OAuDvhtgS54nMO
	E4W+JPL8dKrCF/AkEWNqbv3w==
X-Received: by 2002:a05:6830:838d:b0:7eb:3af8:8c1a with SMTP id 46e09a7af769-7eb7fda9ef3mr199373a34.9.1783098243743;
        Fri, 03 Jul 2026 10:04:03 -0700 (PDT)
Received: from localhost ([2804:30c:1618:8400:e838:86ad:21d4:de00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb54534789sm5378744a34.26.2026.07.03.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:04:02 -0700 (PDT)
Date: Fri, 3 Jul 2026 14:04:51 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: adc: Add ltc2378
Message-ID: <akfrs7OtamEIoVxE@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <fa15b8fe33541fa2e8c7a3f124b2482872fdcf26.1783028033.git.marcelo.schmitt@analog.com>
 <20260702215235.517FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702215235.517FC1F000E9@smtp.kernel.org>

On 07/02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Compatible strings with required fallbacks are incorrectly allowed as standalone strings.
> --
> 
> commit fff47614872c95c6a481f63da8b14dfcedd0bb53
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> dt-bindings: iio: adc: Add ltc2378
> 
> Document how to describe LTC2378-20 and similar ADCs in device tree.
> 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> [ ... ]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      # Single compatible string match.
> > +      - enum:
> > +          - adi,ltc2338-18
> > +          - adi,ltc2364-16
> > +          - adi,ltc2364-18
> > +          - adi,ltc2367-16
> > +          - adi,ltc2367-18
> > +          - adi,ltc2368-16
> > +          - adi,ltc2368-18
> > +          - adi,ltc2369-18
> > +          - adi,ltc2370-16
> 
> [Severity: Low]
> Does this standalone enum allow devices that should require a fallback
> to pass schema validation with only a single compatible string?
> 
> Because parts like "adi,ltc2370-16" and "adi,ltc2367-16" are listed here in
> the single enum match, a device tree node specifying only
> compatible = "adi,ltc2370-16" will satisfy this block and successfully pass
> schema validation.
> 
> This seems to bypass the fallback requirements defined below in the items
> blocks:
> 
> [ ... ]
> > +      # Low sample rate fallback for 16-bit unipolar sensors.
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2370-16 # 2 MSPS
> > +              - adi,ltc2368-16 # 1 MSPS
> > +              - adi,ltc2367-16 # 500 kSPS
> > +          - const: adi,ltc2364-16 # fallback (250 kSPS)
> 
> Should the parts that require a fallback be removed from the single
> compatible string enum so the schema correctly enforces the fallback?

Why? Should users be prevented to specify a single specific compatible string?

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783028033.git.marcelo.schmitt@analog.com?part=1
