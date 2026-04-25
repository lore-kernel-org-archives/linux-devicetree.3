Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD33112BC
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153477; cv=none; b=q7dgZLWMhLRexS7K7psojulLIHHmsm/0i43Q+z9LBKm4R54fheCL+YQoteqbGmWKmCIsVzM9CPmsz7iW7iO4VZZO2c7jT0ToX77n6ZyvMg/37Ns4kkfRx/Eb/v7bXn1esRDf5Wpw/KGOsOzo+Y8rOHbomhfswen6/Pol4TgfOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153477; c=relaxed/simple;
	bh=vtdsiym4Y2IGQQwewhHUQFHiy2pQQPMwFhKuEcdkJpI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+MvItKWQg05pOE1DHhiEpSA9ftdSUleBo4WgElNu8kTloa1q6MteY6ORfYa4Uu4IqLtKfLBk1NQ6nv/ALtRxvrw3JNhVpUKKKKCpAo8tTFeoK/9yJONaX/UqBQVkr2phAjcrdo/V1+U5HZvamy7y6hjV2KvZ3ZJGWRo8HoFWhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8y9lmKj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8y9lmKj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so81731265e9.0
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777153474; x=1777758274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/ED0Y4PmfOedW8XVTz2ekjmiBfYIa5o8q7WIKYBzL4=;
        b=T8y9lmKj7LncWlHTqeJXg1T6vERQHQfDn1q2MCzw+L3ukIndOYFCwz8BItQZAJoZfE
         zqzueV5Ytssqa6LM+UCfJdJRievS+p9s5ZZmHt2I92JjL1HNPehoW/09LXk9RUam0v+w
         LR7U7cOjIdjGSqxSdpVfFQlyY19Hrgn1zIdiFFBDeTE0vWVm+HY1qPTOCjhDXasFb37d
         jLdiASJszW7ldqJhc8y4Jm17I5n3E4OUWpnty+K1CZ28XUjj5UkYaZf0tvPFpCzDxZC5
         0T9Ic9mRgjqe8gQv+AugVBifWGrw+a+UVfQPspY2irIyCDPoAbn7kSNTJjRfpspLJ1fr
         V1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777153474; x=1777758274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/ED0Y4PmfOedW8XVTz2ekjmiBfYIa5o8q7WIKYBzL4=;
        b=D/keUCmfaRxK21JrLkIGpXuhXLHPtdm/VGmunt4ggXiyPaxERd5eIc8jz7eRXMlNXY
         vQaKNwgM4ZXZpJSz/cWPRkWIa4LXfsBHxyBDytX+hn165Gugj3KMrce3BQ1z/HF8PPpj
         arXV9UuzpFLWEdARza8iqKbH/z/BXc/sYPD/iknirQD+wZzGUxJ8kvo1US45WljhvdQj
         /1S/hPOvMxMTECw7oTlyTBDDA8Go5rPhNQsaXWRFJ3VOrC6BoCGWxI7kZEzSfdhvawEX
         fOsHHc7ZZxgrjDtW3dfIViP43J59rEBbVTsGYBTpSrA4gzBO/cfZWPEeZlxwJZHoljVY
         Zj1w==
X-Forwarded-Encrypted: i=1; AFNElJ/m7pA5gNFV4QlgAL6DR0/P2f5lS6xOcSpM3s9FiWGS8g78FkgzjE9T5epO8wHJfHO7X154s+L08ETX@vger.kernel.org
X-Gm-Message-State: AOJu0YzueQb9AaALEblOaKkRXEmEjfHkl5ygGfCfOWt0GeTeki1UneJh
	Jnxhe2nzRerealWtWBok1rIyLeB/Q81aebroZjqnixof+P6Frd5hCpfx9yoDmrD3
X-Gm-Gg: AeBDievKwwJ6Ap2YfKvg+MQSa9dQb/fQbgtC8VRnqMzAt/0akF2xtIGKE4PO4e314Bp
	dxpGkmyY4Vd0mYbVPruwQdSBVKevwYEnP6xuWuoOHom+GNcOIsDxMFiFYKGtDIn1h3cHWwK3eok
	2rNfSJt/vTCeld8kpZwhmh+NgwHHxoqF+DPkMbXCL7h/fCu0Hr9m3E1Rj4iBC4+D+N3KLNm20P4
	FsDveKWv7BWlfLA2RTyfx/GKh9Gac+CfiZG60/gRxsJAj2gFJc6gAm9Uo3RNYvfV9KwPGlicIpE
	xI7gCxefaj8QfnagilIdVXsgrF7pNFlkO7nfm481mR8YLC/1bCLGAgajm0FSMq2/UCW7ns1f4/O
	xUzYxFyuz/2ArSLccXxJoQWpnBdOf2HCwNVJvTGAU1SLh90Ce7eGxfr+Jx4sSBUXuzyo74NRGQh
	1B+GnAX70Uzb41rqnjDOjfrRXVN7EXvVSF9zh3+eevnTCSx+0QHlMLYEtG14uT1XMUI2Fy8R39f
	HHfpqA+iOAnhlVxXUHSZbmHyr2AtRA4u/j8MGMsygnOLE8T/dPZc4fiZoxHbA==
X-Received: by 2002:a05:600c:5295:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488fb77d0fdmr526610895e9.17.1777153473832;
        Sat, 25 Apr 2026 14:44:33 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10777csm770862455e9.8.2026.04.25.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 14:44:33 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sat, 25 Apr 2026 22:44:28 +0100
To: Alexey Dobriyan <adobriyan@gmail.com>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <7ytjm7q4noyhofptadss6r5f6ibrvntdtafntj6yjuaegnvjzc@j3lrtcj2lje3>
References: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>

On 26/04/25 09:57PM, Alexey Dobriyan wrote:
> Rodrigo Alencar wrote:
> 
> > kstrtoudec64
> > kstrtodec64
> 
> The only comment I have is to maybe sneak in "fixed point" into names
> somehow. Or change to kstrtou64_scaled() because return type is not real
> fixed point type.
> 
> 	A.lexey

I understand that a decimal number is inherently a fixed precision number
with pre-defined scale. The "64" in "dec64" tells that we are storing it in
a 64-bit variable.

kstrtou64_scaled() does not tell me anything about a decimal point handling,
or that the base 10 is taken for granted. Maybe a typedef on u64/s64 to udec64
or dec64 can make things clearer?
I suppose the documentation header of the function would be enough for that.
As it is clear, the function intent is not to return a "fixed point type",
but its scaled representation in u64/s64.

-- 
Kind regards,

Rodrigo Alencar
