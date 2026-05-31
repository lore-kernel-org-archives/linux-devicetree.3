Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE229B8D0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246289; cv=pass; b=so4WKmjqlEhzWuRjv4Lmq9Zyk4EJ+zCAOFfWbReVYYPKZe2ey2FvoqzoZ5oJ6fljDj3uM4PhOW8tN3ADy1SZa9xlt2Z3zBU5jATYvlGG+0VPzqBRrqLH13Q3J2YRQqTLl2liaffSGAoBdhbgtZFJdpF5a9NrB8w1rK+IkGXMkUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246289; c=relaxed/simple;
	bh=Rq6s90n83xxkJTxEv7NRjVrE+KT9lkAEQf8wwfCtfbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MerMochmEdZAQ9N/wJ5b1ZmT9zH9t0P/ZgVu8SevekOMrOfxeOxp0NhddRoFNfYBwgd0y6oHkBxQP0epCZvUTB3xdgrTmkKRxF4qsIRXhKnBH+0t9TaJAD/D0jCP6nbYsI7muUqAgfQrDrPhuMQGErM9yqCtcBGWhdcY8mBuzOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peeqh5NJ; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peeqh5NJ"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-660323f7b27so3916890d50.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780246287; cv=none;
        d=google.com; s=arc-20240605;
        b=HoDQ+MhQAo7X/GM6a0kVfOT/7nUFqwEg/rU/tzg4JCRNk9BwD4pJx2wNpTHHBXMIX7
         CF7VyzyySV90XUs5U8WjRKH1ohpq3zHECn+M8UVDuyHF9xGvZ6c90NTSFbQxqDcTM4IH
         dr1gR6kcGao/SU6aYDuUDn0p/r5ut255PN74HeXLM29T+1/oigtiFo0tHUC0SLWxutIU
         PloMXUI2HSrGRjqe10S33AJcwrXzO/nYdHtCK9ofE7mi0HNmEISTUVjGXFLEl0/PXJW3
         YImlZBgZ14Dg3z/CmnGSwLz4MDqASFhlI3KtkMfjxD/XdzjFK8FDhBpkTmbSUd3i9qSW
         stdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        fh=Kufgu/e8aSHlvxUnSWf3FiyMtGFJlprC5Lzl8M5BkMA=;
        b=P/bFPQw+exlvFwECjWG8T6idE6BE6jJFVYNuNy08m7Sf+eswLWn6YvAb+KpLzCvJ7Z
         cb6vVI6K+vfOyt4u4wPRBvD0wocS9FmnF4KjaZ146EUOaOERdfn9yHAP+0RP9N2JI+b9
         D0vOCrDtA+QNkkLvsY4wdJgYFPRf7CKpcVWjfiGX0RihxTbqDXuY6s0mRaT8VDw2elGB
         9Ev3U1odh+WDi5y60aU7KUpt07KKCjtCwhx/kzcG0wNUqySX4N4mgjBTzcF+yjIXSoIM
         7HUBTIjKwm0qC+CredDM9v/Sl9gr/YhNln6iOgD86hbS8aiXU+yFetDJXxSSxMnVTHkd
         RWog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246287; x=1780851087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        b=peeqh5NJE4z3m0VYZVzyzFy/kgX99X7+n1cH500CojL4C+mX1jQOUlQaRxHy3IxfKq
         1DFi04GBmXq6H2GPI8U7S0Gsfwm1yNaYuAXZfcfROGCZO0h5Nu3hA/q0gslJ0Zvm7CNf
         CPbXiVSLtUA2eRftOQMGC4YlzJ2mjyJLDFaQPnNhhYrKzSmVK7/+WpSyHEdfvEhSXjbh
         Q57UZmahBC742vow7ONPUxZi4+QQ+YfiHQiIF1OIuDEghsRXRsiozsaWzHODjgXxMCmp
         MZYR8gy1OEa+dUryBHRcI5KOJJxCCMzdxSGP5pEojbfPOUEKuaE459RS0GnS+NE8B4dI
         lbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246287; x=1780851087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD3qH3IJMUeJlTuvpQInOEvbulEnoTmyx72o6iGnBpM=;
        b=WZr92nV6tpMFaNpwBaJGIlGuN3TLOxye6KiICKhvVM9B+ijFitJBARy27+AuaFZMeH
         s0t52ZIemUJwZVU7IhnLnQVTPF6edn4SxooAlyBJi1Nio49JqdX8TIm47CHywJlNj80/
         8sS6JmkpZV0nvHdazhFAeicpSpa3ToflHA8DxPRgR7gWnkzuKoUwYCSX2En/T/icZmzn
         HbjoLz+p4cO9H1bRLmCY9/Hg3X5w675arOIa+UdMnZ74i4OFKAGA0TJNTZWO0IOM0qEl
         ZUv6JAk5MRVJcfy653DPINIt4pGXhOEPzfr9hgozDCSP1O835cHyHUN3Bb42sdHKxAhU
         C0Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9SBybsMo8R4nDUCRSzYHSJFgXLLMh7hUHaZxR4FGLhJLLa/2cv7zcPD5q1R1Z3y2W1fCJ+iQEDYiQW@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFVq2tOpgnmcVChwNvDNUpev/CmT1J8twGgoP1HkFqx5qICWc
	FVlNemuQe10QXzmDmqyJjbLEeplUVvwKyxxBRmw63ntmKc/GXP0c9j1VFZyA6Q58u0ZEut9jp9G
	jSAyqvAyCCUiT4WWhrvThMzw9iq+M8PZ/tPTc
X-Gm-Gg: Acq92OFVO6+nG87ECHPp0Lp9ATp/5U9Y3qadeJzoiYbY2IqmW+QbMdTYkuvcFz5kGiG
	ewJQjmYYmMDR1pEghxWjBcX1249cF/TStEG503OEKirVbE3IhQs1h/5e9nd43l5p/Iy9r/JelKi
	2mh1HwtLUa5oMZt56Ov2HEOIBHN4CrKfD0hhZ/EPSZyRTUIryfOe9W4V4BW6NTE5Ky5fKQJGSj7
	qfWqZv0Y3ivE4fJ5EkgYH25lEPAyVezC5eJI3H7J8P/IMMJNPxDIVYe75sVZxjx8dgkLVMwjqCL
	KtPRiEjI2cQP6tUDEQ==
X-Received: by 2002:a05:690e:4843:b0:65e:41a4:54d2 with SMTP id
 956f58d0204a3-6605f4b3bc3mr4092648d50.32.1780246287521; Sun, 31 May 2026
 09:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524110047.37590-1-challauday369@gmail.com> <20260530-devious-magnificent-jackdaw-cc48c1@quoll>
In-Reply-To: <20260530-devious-magnificent-jackdaw-cc48c1@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 31 May 2026 22:21:15 +0530
X-Gm-Features: AVHnY4JuA3xNsJwo3RGuS42nPmcJ6QBLOR3huKxUD2Jd3JIeqE8md7vxSzw9-ME
Message-ID: <CAAj-GBnDiiKPwCQz1KDp6kMx9mQzmxSJpAuanbWsjt4iSzoZQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux@prisktech.co.nz, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +properties:
> > +  compatible:
> > +    const: via,vt8500-pmc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    type: object
> > +    additionalProperties: true
>
> No, binding must be constrained. See writing-bindings or any other
> binding. If you are unsure how to do something - open other existing
> bindings. Do you see anywhere such syntax?

Agreed. The clocks child node is now fully constrained: #address-cells and
#size-cells are declared with fixed values and marked required.
additionalProperties: true is retained only because the child clock nodes
inside have their own schema (via,vt8500-clock.yaml) with
additionalProperties: false, which is the pattern described in
example-schema.yaml for child nodes with their own device schema.

Regards,
Udaya Kiran Challa
