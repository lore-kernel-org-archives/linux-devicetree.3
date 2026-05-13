Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B4F47A0D8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684974; cv=none; b=qs8hmzSuL/7b4/T+l8YpB6G2NkX+sbWyiDNifXEpUsKmuXSU0mJHiGC3gnHO2HK6POyb9Mds5zgs4332r97T6O5Q5ZIcp2+r/WOmgCFj8Ls8oPTpM/o9nh9q4RMDHIdohn/4LXmfbYJ5N6KYaziwdNKMB75mFW+g6D3BzcFgpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684974; c=relaxed/simple;
	bh=6xl1OZ39wivS4tq4DwCHKYc6atV3f69XK8Y07bvYulk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B60ZS1eQvr0IwUyxLp6avFp7GBQMLkIkcxWLKJJXcYLR5UXxudOp85XvdnfoGbv2kZvUEjwJ9QXIL2/cHsgYRrGBqUe7Y4HSmMPIuKPJ95XMsa+hfxRThZnBeqvJOgFRX4KAodZ6FyLBQ2JB+JWYOwX4sHGoHg5KdmpmbdBdUA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKTY2ck6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKTY2ck6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5914262f8f.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778684971; x=1779289771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90qdZzTNiTsSE1LEeRcQYoXszr3HSv7vr/Z4t6wMOgk=;
        b=UKTY2ck6pXR6CIazO9ViC2GBc8u7VlKlZELwDr4XBON+z8O34h4T8RJfuyqqLJkTcE
         5TGtLNllxjZcgjeg/Pn1/z9l42mWqCjd0iTYJHtkhn6k0QY/TyRvxWlWrBdk8ZgSfDnl
         Yc5B8aBaQpyRTi1LThoiuOZu47gkgQCrjvNKplqx4M2jFq9wq1H2TcuE9xbejlXqqaRm
         IIgOSuPdVj1pew/ap8JQ4lM+cVgxfBpDJL/Cn4XpgGkyv13ZLgBN8Y3eYVz/0mlfs6jV
         Mqv0VXQ1ydsNh6N/NY7QPNojx8WVA1So4nzcZfvk0juT5oVcnJu5JFnHVtRFuRytQwcU
         hPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684971; x=1779289771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90qdZzTNiTsSE1LEeRcQYoXszr3HSv7vr/Z4t6wMOgk=;
        b=bHAiS4quoimitmtBiJFLSytZ4tBlat9rZOj18PX86B5nc4F9dgcGSrvLLsfa1MZcm/
         QQXHO2zwgV5h5dhx9xY9Pnt5P0MkI93mUrOj563w6KQEtzVya8WpkjLcNDTSgGlsFSRs
         NxgDNfcuFImO9RjSPLFXVjPvO2A6tcQIPPXKao1+Hb/+REjDfxE9rASNISJxL/ZU8UIB
         bnmgKm6wAFA9sADLRENIimGD8ZX6EkoToJ1pnhdlFCfQOQBPejmdqNH7jbUL80xTySH9
         nf4lTZxlCpE/Cvv8O6+2r7Z3xMil29eRAtSvdf0+mHh84Tvc46ZPkH8Fmc1JBxwdFfI2
         s5Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8fo2pnR/J3/8ssp+0/p2J6qDHed74Gm0t9A0eDswhrPUYAHYwbWw7oqkq9EWlopjGV0unK18Zm6s/r@vger.kernel.org
X-Gm-Message-State: AOJu0YzmDUzenjTv9jvK1EWbXyDAxymGuxuD36j7UYf3V/EEJr5yw8EN
	1MS+/tDMuRIWLqwbm5oHe6FMZRCIIezzTO1wyh5iWvEQyF9DvX/uvkxi
X-Gm-Gg: Acq92OFilcxz3hpW+hYFKCd8SKvCdRED63eh8pgBJhXLbSoyMn2BoLig3P6DoZfUAjY
	csq4+pkomHpwpkhhCRZMmIIugjToq+VrM2Fy0FKf2DQuP0b5fcNDCYFuAQemPy8RplC+U/JCG4C
	wnAbaRz3yox6ePpxxnab631gxM2IxrPubgTsMNRNNkB0cN5OKmdxOQN1GUiJubJQYE/ERuesOGE
	06SvU/NakY2o4aDFtPvjBpYIojeuaf/vdzFpYgLwK31xFaQf+LKSYtFU4fid3we+6j02e+WLePX
	8RkA39MmfktwJu2TrV5KfxlF8jiplsr+l3k5KUhk3c+rYoGhkylEUv48oZkljbxrYEIw3IDHV7X
	uxRwmKaY1eeJMwu6b0kXXho+1qYf9VeUURvXINSPJFhEOg9b+dBACpUy5jYQ4QRBAE6ewGjTvuC
	cUbF+J9auFQQinQxRq3eX8ya1MBr+TkkXk7iEJU1xd2mhEgY7NIWlmXQ7IVIbe9EBlOhdMiXlVe
	EAG2v3odRbO0Vwa7u2omANKYOzn7EFOMJSoGHZ360fDM17kTbe+GVHu5RaQ
X-Received: by 2002:adf:e30c:0:b0:45d:4688:2571 with SMTP id ffacd0b85a97d-45d468825c6mr1533975f8f.41.1778684971053;
        Wed, 13 May 2026 08:09:31 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm39821178f8f.2.2026.05.13.08.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:09:30 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 13 May 2026 16:09:24 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 01/10] dt-bindings: iio: frequency: add ad9910
Message-ID: <vklczsi4vk3sqf53zifslhp5pysdmj3gfyhvdgrwo4bg3wdkxj@lnbftaf5jcbf>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <20260508-ad9910-iio-driver-v4-1-d26bfd20ee3d@analog.com>
 <20260512193129.777d62a8@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512193129.777d62a8@jic23-huawei>

On 26/05/12 07:31PM, Jonathan Cameron wrote:
> On Fri, 08 May 2026 18:00:17 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
> > configurations for clocks, DAC current, reset and basic GPIO control.
> 
> I think this is getting close enough now that for next version you should
> drop the RFC (which is probably gating DT binding folk giving it
> a detailed review!)
> 
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> > +
> > +  adi,dac-output-current-microamp:
> > +    minimum: 8640
> > +    maximum: 31590
> > +    default: 20070
> > +    description:
> > +      DAC full-scale output current in microamps.
> > +
> Can we use generic dac.yaml defined output-range-microamp? The base will be 0 always but
> that shouldn't matter.
>

would that be fine even if we do not have those child channel nodes in the device-tree node? 

-- 
Kind regards,

Rodrigo Alencar
