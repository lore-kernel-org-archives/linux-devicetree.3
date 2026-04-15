Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33362328B77
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247546; cv=pass; b=tLABifz4kidAlyAkKIRhGRJtgwA1pfH7zjmwHmlVlooCpGIESgM7CJp1IF4xc0rDqSAizSaKCCupyyJZGiYuIQzkK2G9MA4eflpd3lBRAgo2hIl4FDDKigvt3rDDiDZUgcPiVwqre5nMhHmdD6So6/pqm0HjvYmehGV+l14CrRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247546; c=relaxed/simple;
	bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILS/N/w7dRGHbRXbVQO5dp2lJvZazCesaQlNXwcVCgidOloxwrDerAEPwJfhHePzz5fbkPtwV/wwgIPkp0kDP8cz+dwcrhWrebKOQbicaToV5LRYB0MQYuZrgiYpniH7GZFEhxaGiJQV7QgsXQDbkWncM9KyzWXqkMawJzW/8xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVFtfqxC; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVFtfqxC"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-68c048f9c9aso1698064eaf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 03:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776247544; cv=none;
        d=google.com; s=arc-20240605;
        b=IZZ59tOG1uLTGuauSnAFXL44+PzZ8yssejSMJS6yy1mgRJ9fZKZMcaA+Onob1TdBXX
         B5OCTOn943L/d2ajMjC3/czaYyvX/w4weYnsYf9DVaHOWdOPwf7ry1eOITo9+USHK/gS
         bbCMC5QGJvaqz7aD2i4gCrODgBnwF58nGh81bhYLHbVJ2Vwxql9cDb7+B1LLETA9JhA9
         s7tCo/hPH0EthvsoPixN9UATR7U6DJB4iAFdTe3HGoqTOdKwPQ5SPLEEY62pq9Ulosml
         cMXmVViq9IORWM2Jr3YenppjT8Y6CtusVc6pP5BjJWnDBuIXkfyTAze/uIRf/Qznn6WN
         CPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        fh=+2gR3zRSh+qGQps2Geom8hp+jcjK6qS3qvUz9tTC+78=;
        b=PjCCTNuejnvkOItK3FsxaWqx/RXjjd+KLU6RVlAj/YxiqRVSbVKSGzakNsWdfHJKUe
         1STshUccrS13ZH5Fh7piabymW02PkAXFn85xco5eRjs/fkuvicAEqQnpfXuvNnhgDQM8
         aPoK6Upts2VTpwUZUGrMoY9y0qTsKg+gcaXWJBCj9VBrvyXsZY1oJuJSYcwunodesWA6
         mRmugSEfK+sfhl72jnrRfG2A/jrhX2HmXIJHiA+lKlJ+b+7GUaBq/IEDYAbz1QJ4dqOe
         /y2w8pI8A1uJa9KSBDWZZeKMqofbvqovA1Q04q503fulMCWLNx0aYFxoZ0PK5TK+crgg
         o7Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776247544; x=1776852344; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        b=KVFtfqxCjPDaOh3NBLPJPEH/Vj8DFtVF5el0AFNF8dR4odtazinvDHXJmisemZX5y3
         5Xy+cGH4bVpT4sELLE97zVxhqJSO/k1AYne6YBSg5+5or+WqlNTz8JfU6IM/nCY2L79p
         Sy9FZHJwXo4WXk4dIwSNUWvjX62zlJgNBG8JV14Mbbl7IVcKtVuTbPkXxPhnuhOxH50/
         wR9p2URc+A6DaFoiS77XCDkKKrURCEKiQEI1/xJlIu0/BqozvKJbDvaRCLtlAsA4r2ks
         AVopntnLspPa+5M1ngB71q9WJSfvEzdcB8uGYMWTb64bd2DfnBf8TJoErC4/yANRu6F1
         fGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247544; x=1776852344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        b=O/oZcNpB27j+KGFose1Iu6vwiYLYhD9aRmfbDepYxfUfztJe4o4q70u43ZZFJdQ5kY
         dP7hdsI4o3T18tFtRVwR47DW1OQNlLtOW94+E8inaGcecQlEVSkegQhvqCGM4lX3fSv0
         9UuCYWacPS44o3oW25b1G+oQJN6ti7kIA/XAcDHnT7x5kTonSXiIbuIk45Z2I+tADu36
         dyWRLxU/vtZClDAZkVfQyzkN+Jx2SPp5zSwVw7t9f2btl1mJnwwhprqnNOIcxbXksXbv
         i7qARli1ekHZbw/KTr/brZ9ZES+yT1oJdte4ofvKgRlnmtDWKrRdXGY9e5wEdS/lwdSP
         YtnA==
X-Forwarded-Encrypted: i=1; AFNElJ/l8/aGYuzB3+tm/H+/ngqS66TBzMNc5tSDmkS4j47sodnjTtmCBisGEXzLO6UBr1LIRhlgSY5mZgkC@vger.kernel.org
X-Gm-Message-State: AOJu0YzGORccSg1oROzAhbFgQF3+g5swpsdB/9exl4Y6yITF+8IsoRH+
	d2ykC+zCZYKS5ej1afo9VuujAbIOaEvf2ZzcbpYBM/1qgYNL1eARznJynYd0y9mm97rWcQQRZxJ
	wxeX/MUCuV0NIxi45KVSh1lKNKNlpAzs=
X-Gm-Gg: AeBDievix6JS6AwVt7wEevdygoo/A9z30ODYzROKZ9SKLHUiCr5T1f8JSqucFVLbQbp
	aQIq2wR212ItpCrLNqnIIgNFp9BTkRd/YJbBnGg9vd2sSsY1MENwWj7Jl/04VDn3uE6PVVzkA+o
	MlyH+W7+H4o7aalO8+DC1Wsd2rGvdqigv/XOjggW2LxAtgvGwPPRmbp1+1vLjYUahvGodM8+xmE
	sDzGpVFuMDtoedDJ7yKyOJabJh0rqZ2A+R4lWwgVCCg/LGrsgiPaEXt42/JUNNQIVYh3dAdMOq8
	yemcyaTr
X-Received: by 2002:a05:6820:538a:b0:67f:ab29:e2d7 with SMTP id
 006d021491bc7-68be7ee673bmr7560700eaf.32.1776247544096; Wed, 15 Apr 2026
 03:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch> <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
 <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
In-Reply-To: <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Wed, 15 Apr 2026 18:05:32 +0800
X-Gm-Features: AQROBzCKi3mcri0LxIDQl6oKuIIwXm5p7sK3cRsVPkitktyR35BUd8JHeo19VuI
Message-ID: <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"

> > > > > If there are no devices on the bus, why enable it?
> > > >
> > > > We intentionally enable it so user-space tools can access the switch
> > > > registers. I have added a comment in v13 to clarify this.
> > >
> > > Why would user space want to access the switch registers for an
> > > unmanaged switch? It sounds like you are using Marvells SDK in
> > > userspace to manage the switch, rather than using DSA.
> > >
> >
> > We do have a custom user-space daemon that configures the switch
> > registers for our specific use case. Should I remove the &mdio0 node
> > if it is only enabled and has no other configuration in the upstream
> > device tree?
>
> Please just be truthful that you have a user space driver, so need the
> bus enabled.
>
> I also guess you have some other kernel code that allows you to
> actually use the bus from user space? The typical ethernet IOCTL
> handler does not work for you, since you don't have an ethernet device
> using this bus. Such code is unlikely to be accepted into mainline. We
> don't like user space drivers when there is a perfectly good kernel
> driver for this switch.

Since the kernel driver for mv88e6xxx in kernel 6.6 used by this
project does not support LED control, and this feature is only
available starting from kernel 6.13, I had to initialize the LEDs of
the 88E6393X from user space.

In this case, should I remove the &mdio0 node?

P.K. Lee
