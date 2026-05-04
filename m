Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5722853FD
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929351; cv=none; b=eIKJi8zzXzN6vEEJEEXdNfoMNbRwCV2n0ccyPUyNBdSCb7vrXgmyiaqSCMNpkBWa7qRpPN92ioOUXgSktyrAbvCYqm27F7X2nS4HH8Zrquzg18x3lxaw06Zk0TD2JVGsjc8vQQwtLAqnUzrH9NQvCJQ0XAwfFZ/Xt32e466WjYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929351; c=relaxed/simple;
	bh=PMvtpnmp5yOkDY712QScKMotZ2I63fR9kFEe20CL+Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srIJmiquvpgpNx30OgK4863nw4IsaT6i/qJhxHySsE7PChKoS6Sj2XbDbLKRWlfUVijZSvBQ5OTiMIcHQyyDfps0qJbmzjcVOQGTniiYWy5/YGiJs8opicsgkKeMGuY0fSMNDiFv+Pu8Tu59NNJbKRr7C3mwCsJgcUCPE3zFpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgLRGLFx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgLRGLFx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0046078so37751655e9.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 14:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777929349; x=1778534149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jm2/WU3TD9w2C3ftifLOADZ/IEWPc9PZc1Qq2j29MHw=;
        b=LgLRGLFxUpaHeL1BtJWAN7xcWQXqZfUn0DHeOE5M0R3P54wTbo+2SytHT07e90KXoq
         IrdZtT6SqfNqmYuq0uCZuHBnuha6QBmq/2++c7fzRRQUZzJZBzbkp5RS84ji9uP/Z49w
         XiPwbNyKxaTTLPd57lcLCRt1/pMdS1lwMoV/UyKWClROR8gBoe/6J+fhI1Dfv0w/FTxO
         E+F9kg/VDklDdgWCcaUeZb0U1BQswf1UfTD3zCWwCweA66L9dvvdrM2ZF5Nn8p0suM9G
         UBXVz5L91g2vdQojTZ+N5RlaEw/RcGkUt1TGdAZFZ0iuK+/x+pIOtSjOH43SEgTXDMW4
         JY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929349; x=1778534149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm2/WU3TD9w2C3ftifLOADZ/IEWPc9PZc1Qq2j29MHw=;
        b=queqai/mHmvrhh3uNhVW8Hu/m97V/xTAkRmGLOjBm/Bg5aevW+uiQ8ZFrxiFtuqK6/
         HcDgB9sg4ooeacY2b5vg+jR5oUy7+njt52thM4PBGHb9z14Aiov/0z47w83kIPC0SNTE
         rYZR+7+igNH3sG9iKcmuq8FLO+LOAtRpqBnbESzkRr8LVaLTO3mbQlWAXjT+DMYs3CE7
         uRUpX7osvaZbFjfbgJbXW85yHd0wJLjcH+5FPDXKbov+1YIXSLDpJ0DXfZUDbUfSTwmJ
         kdAiM0/JCRSe5MYKy+4ZOH7Ir6tqva18t/GDWHAdFmZAeKjsSwbSLnfqVfHfuIL2O0kX
         2R9Q==
X-Forwarded-Encrypted: i=1; AFNElJ//kUbmm0NcLA33L0lzg6zccv8YHNiPTTB5z/10QufP8rBekpbn08K5p/631F80Qe+w/EP6iwdFSowk@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5tbZfJDHBrTN/F7Hl7VR7E7EjO+zC/1ddBIj4ybo+dlEzYK5
	99BAgWhi7Jhhfo4VboBK8I5BnZ+vFZD5VjqjznKPEmkkqP0btlgxBB3lCXmwHpqaqWw=
X-Gm-Gg: AeBDiesQnas4KielFM0Da5cGQiL7eHZXW8GMuDXpafCrDgO/Iu1l5Li+NhsSu3sSexd
	poO4Kw0l/oMcP0K6wvobFiYyNp9pXrKPOjzlJbFPl0ygPNyxuwXkjpzvrlwEew+xILdaXKuLvtE
	toKcE5fQagJiW52KWtPKoAG1zg/j6n8i31fCQCEaqUaEAjpIgIdDC5Mw2f3c0ODz0mQuqzyNWPm
	Ib1HwIYhfJ2/ot//WYyCPPI5YvIshA0ucfdL9avgwgNeQvCjY/VwKnIaomRyt1oEcj+2LidRE9S
	Sl19TH4KDyEw+rvm6LlNCw8iTvfrfWJS+rzRG3MkHC4Hf3KNL+uQG9C7D+ENsE3KRxxlrBCqRDh
	HE9xh5+p5e0YIsDo1djjI531AOMeIFZKAYcJXKcx9wl//LGjXyTNCODaLj4R64CPN/ZYKEVH4U4
	tgHXiwdV3r
X-Received: by 2002:a05:600c:698d:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48a9866e8a5mr187115145e9.24.1777929348805;
        Mon, 04 May 2026 14:15:48 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::3323])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm291470615e9.2.2026.05.04.14.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:15:48 -0700 (PDT)
Date: Mon, 4 May 2026 23:15:46 +0200
From: Wadim Mueller <wafgo01@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wbg@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, conor.dooley@microchip.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] counter: add GPIO-based quadrature encoder driver
Message-ID: <y7wnanmz6jl5tudexz3xcqdc2lfijck7amqeaxx5xgq5fx2tnk@afuvjbgyan7v>
References: <20260501200749.20029-1-wafgo01@gmail.com>
 <20260501200749.20029-3-wafgo01@gmail.com>
 <de521e17-95e3-4b45-9575-f6190f8f5ccf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de521e17-95e3-4b45-9575-f6190f8f5ccf@kernel.org>

On 2026-05-04 22:54, Krzysztof Kozlowski wrote:
> On 01/05/2026 22:07, Wadim Mueller wrote:
> > +
> > +static int gpio_qenc_count_read(struct counter_device *counter,
> > +				struct counter_count *count, u64 *val)
> > +{
> > +	struct gpio_qenc_priv *priv = counter_priv(counter);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&priv->lock, flags);
> > +	*val = (u64)priv->count;
> > +	spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int gpio_qenc_count_write(struct counter_device *counter,
> > +				 struct counter_count *count, const u64 val)
> 
> Please don't continue this broken 'const scalar' pattern. You probably
> copied this code, but no such new code should be ever added.
> 
> It's not necessary - compiler/preprocessor does not care from function
> signature point of view. It's not helping - it's scalar and no sane code
> modifies such argument, thus there is no single need to protect it. It's
> not making code easier to read. Quite opposite: raises eyebrows for no
> real reason.
> 
> Same in few other places.
> 

You're right -- I picked it up from the existing counter callbacks
without thinking. I'll drop the const from the two scalar callbacks
(count_write and ceiling_write) for v4.

> Best regards,
> Krzysztof
