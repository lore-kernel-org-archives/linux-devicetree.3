Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51293624B2
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781290140; cv=none; b=NLiNNicTWarwLycPS/cGmiEBnPusMduWQAW51mGQOz9C4DYgdJmppT2k2nQNn7CqPrsVDvk7738Cva1XR7KbYJtUpny208bEaNSMrDbHUfDJSI6OOBbPSMZ3xaaWKRa1MvAiwdpqBWmVwAvq46RZJeomlvu6dR7t0p3mR5X/RtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781290140; c=relaxed/simple;
	bh=y+YFgf2hGWUgiLxOKrTXIYTGrKlqIDDKqbWS8HcgkYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CX8qVc9E/ahbvGKoSVySlP7FqmFAm2Vpwk8c7PGgo6dwkU1a/klZsphOaowWEOvqgH0ZwRkSu4OWaz+pllDitdq4iIuaRrWf3R8KuOYx6OHjsdVXfXyzdqpdfDA2coWEZdpwDHZ8RbtQaOhAPJYWpPW+Iso2kCQO+WRGhjGDdDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtirE67P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtirE67P"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1158415f8f.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781290137; x=1781894937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jeq0BZdLYCausYeWCmY16Fj4+VhF2lVSQzlnxtNub48=;
        b=QtirE67PxKj4QQmYf7+NBiGK7L6s4ik45OrqtM3YTB3PrBxJpXPBa9aYNtshJcM8DY
         9r+++mAmxeAvbVc0cHgZIoc6IvfGZz1yfzFRbgQJ/+idGGdxGKIdV2ANn6SLsWByuctC
         FlJrE8tQ/nRjw8iPXD/VQLcvXxbKGeNVsVbh0nky/A4r+yAIoTjNHQuGFDO2xg0Qfx7B
         IxpooTZ9c+4k3/VAcnNvM3q5Q+3yK1MVXjDBfTnRs7KyMYsO6gqUSGoIljQ+dPf5XQjL
         jPe4BcdSPcKqud+VVzdVLOWVqA/WU/l2/ZYml9jTTULwBe5Nnd247LcDRFQ+3d2+6TtT
         AZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290137; x=1781894937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jeq0BZdLYCausYeWCmY16Fj4+VhF2lVSQzlnxtNub48=;
        b=H2s4nvAhhAsK0sx9VWKfiD5HjJ4e61s0pi9mmTBk7G1S8C4WxuMvk7hS0pOFnAOmT6
         i461ECcuz7nbYVaRe/DUpTFCRaqDxs5RiXLvyUmPea9rAusc2CzkrlKiS0LiIl5rEyR2
         AZZYexUw4jPfh9M8RThgZCAJ/v5s7wiOgU4gnx2CWmklwKRqb8eSChAkUs4RIe3Ek0zq
         tJ3hrVpQH2hxTNexswbRiNt6WZJWwXx3OnfF7mzJrL6i6rojv8dRlrWRxpN+QDu2HrqM
         wkaMkVKFUgnsDwlPUm2OA8ZVwbqqjLrg9P7WIuTFsq+v9rZGmuEkRGYzkItxD4rN0HFt
         hFlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e8pwr+hQTWtolGOanNQSac6GCtT8Qn+PojUUDYNCIkyWxB68ayoWe4Bp8FcHsRo7ilw3IdHii7vWr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7waWLm2Q4nnlDjBaAWpxRaP5qO/lkwxc3KRd54yweOIFpuMx8
	Q8TKJnqJFvi6MUQkQMLobhzh9fGXzgYxoc2N/L50VR9loK9RbvFIN6WI
X-Gm-Gg: Acq92OHM3BHVcebi7gIPDJLAmeXZQkomlCLq+LuOXaiHM6Xh7gRigI8rqXVyHasac++
	rPYgocaqczZj01OmYJ+FdO+PT59poSxrL4TbwxsCs2EDgCb9WeCNDRACxjDY1NUNKJ2IXWUTL5j
	4ow9E8/wslIN/Ysni9oy/iEbixjAD7k8siZLFmlnZPRtNSOH6SE7W267H+vf8eJPDOVdIlEwgkY
	NuKIUamTyclek/nwUJgqWBX9sltKEE5rqUCNlNb0eSM6QK6SjgLUSzEENHXbGn+bn9q/2pVIvzf
	f8FI+UtXdztAyn0xHRbkutKPnfQtwp4EwSQARntQge4FkGHxFnxNz6Z3hfiqyp9QtNKFNxbwDPE
	Ysanej6l3QRW1jbLm4AhtjBh4NBaYh1MrKqhPBN+x2lVrYRDLj1BO/cXypNgKnRWV6XsMohkoY3
	JGWvOdgwFYdr9tKxKOUv9wyZBdnKLcdM2zwgMjR0Zs69IwMd9kT/npF+ipxUbdD/yTLE+qmvWpz
	nE=
X-Received: by 2002:a5d:5d83:0:b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-46074a87c47mr532655f8f.2.1781290136967;
        Fri, 12 Jun 2026 11:48:56 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0bbfsm8064894f8f.23.2026.06.12.11.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:48:56 -0700 (PDT)
Message-ID: <edbdee99-3cfb-48e6-8fb9-bb8418c4e852@gmail.com>
Date: Fri, 12 Jun 2026 21:48:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 6/9] net: ethernet: ravb: Add callback for gPTP probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-7-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Different generations of the RAVB IP have different needs when it probes
> the gPTP timer clock. Add a callback in the PTP information to allow
> each generation to probe its own way.
> 
> With this the last gPTP specific flag (gptp_ref_clk) can be removed.
> However the primary motivation for the change is to prepare for Gen4
> support, which compared to other generations with gPTP support does not
> have the clock as part of the IP itself.
> 
> Gen4 will not need to compute GTI value as it have no where to write it,

   Nowhere.

> as the gPTP clock is external. For this reason move the computation of
> it into the newly gPTP probe specific callbacks for the RAVB IP's that
> support it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey

