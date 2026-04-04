Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266EA3A543E
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775292781; cv=none; b=blgDjo1bNmGQpwsHOdvas/GTmX/m6Q5xsUtkkEr+NKtxZDFtepEWOTc7sD/gdsDeTVjGBF49EmTwuHnecp/nQAftuA0WalYKWu7bqyDhmGszzzsMJeogXtSpvGXdRjtWpZUfmn8x9/NjG1G6oTGUKGPTm/go3fjpS0Zk9dyIA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775292781; c=relaxed/simple;
	bh=r1C3lzsUtmiKNwW2H1WNOIIKo2YXJF/eTqmy+2rXq2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzmI8CfijBCjJrQC0B284BLiOLlNMuievrvejVSBBLsISiwLEKqYzhnEU/BB2kiyOsPZqM8qROEzNXWCPFZZu0faMlcwJCAsLNKvY4TuMYzZxiQFPv+K0rCy8ZdydlIE2arvsN6/RbtQqP7tPEV9QTSWPSHxJh2Nh1vK0cVCHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilHZxwiS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilHZxwiS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1538657a91.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775292777; x=1775897577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2aER+v8jW6q498vOyMse8nH8+3QEx9bRFbFB8BhKt0=;
        b=ilHZxwiSdG8X9hUGqDHJeS75iaqdyDoR/FhFXcsofIBQQUaHkczvlkMvhCSiWN7vLt
         OFn3P+F0jGS98EpPUx0CUSPjNZAlzLDAzsK89WyDIghGrxPzHQ3In7+eFhtHfRJYHuPx
         vVZhhrGtO4rMGoWxOnpvVVs3Xj+g+AS2zEbmQYhC7QbhUKb4NtrPATb49B8kPnJJfw8O
         c9wyFlo+EJWTkF1F8d7LnSAv5dcyftRHKrOK3XHTw+C+zQSUwQUCPoysZrD7Scm1zAOH
         sTLqSoF/iOUM4xHFqR28tUgJ68qUAtomDJVuvsx0y3JOYi0B1H0LgPEOSRMtBKuGovpA
         r6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775292777; x=1775897577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2aER+v8jW6q498vOyMse8nH8+3QEx9bRFbFB8BhKt0=;
        b=rVbflOQ4FIXq5XaoQLYpLBvHUllQzWIppobJsXfQhh0pxF1aIXuxMWm6AR84OqnRGt
         Y1LF6rf5sTkvPalE+wsPcUVaLIw/Rvc6S83AkQHCPAg+HmZzj+IvbkAldj2S83g1cLdO
         jhC5nokKbtyRqSbN3zDI7vj5D1KD/VsJXdyF6f7NeUysXXKn8D9P0IiKv9P4NnR7jNGi
         oh2YZ+FvRzhf+tZUGMXEUzD3Lfs1UQVDHbNFyAqOzT4EiaadzwaBjAABlk9Q/vT/MxRO
         nWNLtRnhVkHIsslPlQObeUsWf65BXiHCxi3iNnjlaBB+aG0VygoQES0uueAjChMrm349
         ma0A==
X-Forwarded-Encrypted: i=1; AJvYcCV+gjOEGIIpsi1Ex4MAHmRYS1HOI+JfyOnK+5Z8oJyylo02o2yPtwVbwh7PK1uFko+ncfHYIix3Vufy@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgS0qXup7xPgMhlWtPRcuooSXz8JqNhQbM6+y6DCN7cJYiLs/
	0bG2PR8o3QRwE1q1xjcVlw3LagtCz5gLnvRhGHY3mKUhqR2/Eh2EOdvKKqmDpgTA
X-Gm-Gg: AeBDievn3awPfpNhe2aVtWHGA+1/8AHro0bCSMqbMnQrxDj6FzeDXxkt7nI2CBauKHa
	WM6joRvWZySAqC/4ADfmebVvLPj/yAwVWMNhslugtisuanczGGT8XJTbfWhEH2B+yn3wbAMXP26
	u7gxiMVEmzJ99L4f5a3BfrqnN6bj+pWee19DECnLR8lZq09+Vt4kFw3wqGQBFjiVW2LbZZzfw83
	JyHia5sqYt/NQ9mgx8nRY1+DCIaXGF2mKTVOPDoC0y2RNJmRGVDawbLYvDpiXyxi0JdWLXqX6GL
	SOigGYBl/ev2RagK6FPaAGkGAwuMjcQ1bJY4TtaMqNB8nHMpa0WaGjQXzJT8A27C1SIsUJMM11V
	jnxZYUzgHg4SE97TLlSnm11s8G/yCdP4lkXV6HiAToK85VRjC+R2+DqOXMD+YEg8y6SGR2Unu/E
	FUF9Leuvgr9MFWZf5llEgQ
X-Received: by 2002:a17:90b:5348:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-35de69d2217mr4814877a91.25.1775292777269;
        Sat, 04 Apr 2026 01:52:57 -0700 (PDT)
Received: from fedora ([122.173.28.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367bfb1sm7954011a91.10.2026.04.04.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:52:56 -0700 (PDT)
Date: Sat, 4 Apr 2026 14:22:17 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rric@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: Re: [PATCH v2] dt-bindings: gpio: cavium,thunder-8890: Convert to DT
 schema
Message-ID: <adDRQbpl1lBinbij@fedora>
References: <20260330080108.24294-1-i.shihao.999@gmail.com>
 <20260331-invisible-certain-albatross-844cff@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-invisible-certain-albatross-844cff@quoll>

On Tue, Mar 31, 2026 at 09:30:56AM +0200, Krzysztof Kozlowski wrote:
>
> This binding is odd and not used, so you should follow guidelines I gave
> more than a year ago and updated recently and NOT convert it.
> 
> Or rather answer - why this cannot be removed instead? What is the
> benefit of this binding? Is any other project using it?
> 
> 
> Best regards,
> Krzysztof
> 

Indeed this binding has no active user and i think it is good to be removed
entirely because no driver no dts sources are using it , it seems abandoned.
Please let me know if I need to resend it if it needs to be removed.Thanks
for your time.

Best regards,
 Seihae no driver no dts sources are using it , it seens abandoned.
 Please let me know if i need to resend it if it neeeds to be removed.Thanks
 for your time.


