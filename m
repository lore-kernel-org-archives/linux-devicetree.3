Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00C3B0AD8
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717512; cv=none; b=g/jxHtw+4oiJqG9rRIwmCc/JelOxVcAfoiadRI+BBHfyIFitFuiGcoRTBU+pL9DfhmJ4m6GOlpTBpGkyzzSUverYbo+iCPo5WDxOO6jeQTFlqUaxOnyeSnaukbQeNsbAR1KGGklyvZZbTK8l3pK78HyEQXN7P+CE0vJVWn4pG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717512; c=relaxed/simple;
	bh=Y9rY2Jlt8TiJA0r8ECXZFgh0+xgm/s59QnNRstAJBNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXb87lPrjm9nJjIcx12o37pef7YlPilHlefo7IyCpRYpl6in6A9pdXsw2N3vqUA9Vy0BKjmXzL61AywQ2SI8hTUTfqG9ogCz7RgkDh6sOmasWCt8IteMl8GmXgRCroYhgnsiq8FwzNeDDotTxUHANXwm7y9FlpPslI45/9NV4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOp72ia8; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOp72ia8"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81d152c1c39so8283917b3.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783717510; x=1784322310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0UXVSR/LU6AV+D3rGjC+/aVuDb79zOp9N6li87nFI8=;
        b=HOp72ia8/rRz1Ya57uUOK7yPR1YGuv29tFprq5Od66AeXE29baFOA6hqftRtCqkbkK
         taltdbX14uFAdNAD90DXokn+KrjbmBotmWrwv8P19F7R9gy20ZqFR0WruLT4olgBLzMV
         wZOmbzyvKMFNYV+r0luQd2eHb/c20VFfqsZeqfqDW7G/jptR0UVm5FCHrwqdlHZPtHj+
         pnSuhQ4YamNi7abS9+IS7+qEJ8IaZa/TgPdWl9dE6b2IId8ZMZ9W2BIIYbIKymvQ4TLA
         BKOqJSi6WVOz1T+oxsnfnJulW45Qs/tQsn2Kadh3wcr0TygMIj02gOjlglgLpuPLQwzb
         plZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717510; x=1784322310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0UXVSR/LU6AV+D3rGjC+/aVuDb79zOp9N6li87nFI8=;
        b=swFA3b1+odHnAgjvko7L5b4GjxA2kjauPIftAxGd8nwie+qEWmC6KZFow5VdGMRIAI
         hWzo4lqvb+8ST3O0H8Zs1gH/gK7uzYET8eb8BzNRLynaXVi4ZJwRYR85BUNPs2deDPV+
         g9izfEv2flei/4kPm4IvD2IJq57mxild9TXXe3tb2lS08A2BpgvwqajD7T1TDztsnOWJ
         au3D7qG72fPFlFuY+/IxvgSPLvd85hu1xnUynfg9Gm+km6L4H7cdLalDvA7k3+Mk1Ol3
         /wzeC8SsQI2vBpHiRV92QJP4KiR3Qi1CQIzBiqFt7nRVXUz4GJSv2scvCEBhgn819l/v
         8seA==
X-Forwarded-Encrypted: i=1; AHgh+Ror0zg9IMxsOx53TOsUFE1h/w73kLpuFUm7jIxTiU+vh6FhOhPokmmemLW8hXigkRP8Dh97FKQ288nc@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9KpnXqoItkwAlWFVTDihMFvbGI1tTgoSkutHUvtRARCWBglP
	WA4oxqXyMU4IrTtPOKDlT3Bg0nKQEyXh58Xce0fGjxczj7cEyruVJsR7PqO17A==
X-Gm-Gg: AfdE7cnihSgKL9FiNS8EezkAO1OzdAtBQgfINyJD/qO/iaW/VklEyxbmpvm7ws+ogfL
	WrDsdDdXdMqCKlxIqTNGo1PNMCvHD6+CgMnaMEM+qHK8vVP8Bt5fgwHjiCszPLjh0aPPiOkxLgP
	SMi1oPrWzYUTa7QJLxbHV4hOOH1AGjBv+SBYxofthIDqt58Y1zQamZJfG6L3q23+YrYdurfjRRW
	LEw2DPMGFvQIBZjbMAeBJo1g5y+QX3sp+qj/tF89ekvJ25qnkzniYlUEAca/2lHz/Rw5tEeENHO
	r7JOxF0k1k4DJi6hCEzXl31Oc8ZD3Az9gZL4bREycDlFQmxSPKaFhVBclTPzNHj+M5BLboS17QD
	0YVZ/K1OKfX14fvDznzs+ktS/NMk8yTd6gXYwCeC+pfMtLhY12VZdBD3D9Nlu1u/t5abFoHLAIo
	dwamfo7gEgQGhWSK7bgR0Ddg==
X-Received: by 2002:a05:690c:6e88:b0:81e:3eba:b10 with SMTP id 00721157ae682-81e90139b71mr4451707b3.43.1783717510313;
        Fri, 10 Jul 2026 14:05:10 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf58f85sm56549997b3.18.2026.07.10.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:09 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:06:04 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: Add ltc2378
Message-ID: <alFevGBn9N-9tUZK@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <1a3259037ac87539490c8e070487703614e41e62.1783629101.git.marcelo.schmitt@analog.com>
 <20260709205853.20F921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709205853.20F921F000E9@smtp.kernel.org>

On 07/09, sashiko-bot@kernel.org wrote:
> > +allOf:
> > +  # Except for LTC2338, all designs require a voltage reference input
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - adi,ltc2338-18
> > +    then:
> > +      required:
> > +        - ref-supply
> > +      properties:
> > +        refin-supply: false
> > +    else:
> > +      properties:
> > +        ref-supply: false
> 
> [Severity: Medium]
> Could these constraints cause a validation regression for valid hardware
> configurations?
> 
> For example, if the LTC2378 uses an internal reference without an external
LTC2378 doesn't have internal reference and requires an external one.

> supply, forcing ref-supply to be mandatory (while forbidding refin-supply)
> might cause valid device trees to fail validation unless a dummy regulator is
> instantiated.
> 
> Similarly, does the LTC2338-18 support overdriving the internal reference
> buffer? If so, forbidding ref-supply for adi,ltc2338-18 could prevent accurate
> hardware descriptions when an external reference is applied.
LTC2338-18 has no 'ref' pin. LTC2338-18 external reference supply is provided
through refin pin.
