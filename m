Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA53B5850
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065766; cv=none; b=SrWlAJOY205sAZ/wEZe4vbw5rEHFsf+dvmF9KcOknvagLtfIGrgZoHZ571RT19DN1t9QlrjbjyNC+9XT+UtnEYUmDBqN6atXl103z9FX22a4jqPUudZ7N6fRrC/Sn2C6h7Oxn26lSqkgiUtYfgqBBuhfOfmRAngdyuqrDzUDbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065766; c=relaxed/simple;
	bh=XjGaOIjQ/+IIGGxhFw+k+Tln3i2AhkheoPEyCqqCrug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRhabBc4Od8vUhVhpVlTwVSf19bnVluxDylR/73gR3Dr8WEX42VSRHBZBRvP7UDroB2GmUytZj428IrbVF9IV/IrWlTqrTb0tuh3VCbUq94C++oGvf4pIulrmayWqrfocKi5SfyYzX5BqM5NwwSJooVEvp9q80GfZeM8PjCi4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpcGQEWx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpcGQEWx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2074710751so755809566b.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065760; x=1787670560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Azjl3irT73V/koc25uPISYBKISfWZZT+yRNGdczt0Kk=;
        b=gpcGQEWx0DIri5vx9fOyVxr/ZHf//ax/xWkqmxy0M3GU6AW5LJqAru35z+xRV6VbBD
         V8MF0SIfRT1CvAJk7CzGGKg/wS2g2Wzhq2k30TVe2hAzKYXYRxjqd7XmVkQPuPOurC1r
         OquVPqXohx7S2q8OJWhBhj9Lpt4rETlz5cAjvlBdBmJR1Bw9jEzkETYKDd5DRG6oK1Pf
         7JEiRrpr4PsT10qu8wkNqUHILawhaTuO3Dn91j6TbpbRz11wqhwe8qfbf1comUOlAuB4
         OK5YJYg4Jp00Po17u4hL/CGVU9vWWahAWPXzUgttrc+K8L6ENLtAqqDckZGXeOB5sKz1
         MWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065760; x=1787670560;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Azjl3irT73V/koc25uPISYBKISfWZZT+yRNGdczt0Kk=;
        b=C4LKO8ew6EB/Q0Qg3HhSWDeS6EGyih2XnB3qJ0UkGl5oDp8oPkkeqLxpWgegBtQInw
         qfj6hFdc+Qv6sn1Y3ivw3y9A2+jz3iDlgCy5sdyDiOxXQC7a8BQP6YL0ONdciNyuzGqG
         r45U+wpHIy4MGPZ8IkRlboucxiduenAsU08kAhOaSAzrWg1DMG3qBrmFAd2ZIp8+LOob
         GQ/A/7RVn0Lr+4fBXbtWm1t4EkrQoq3vAHqs8265Y7WgAODwOlV/s9bPNm8LlrbrsHkl
         STGxCoQTndoInaD4tdc3wR/ahplanOAlgr9iqRjQT8D1eZf2YN7T27Mgm8vg+jZG87HK
         hVnA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1n3qKyUDVr4JiZH2TEVXy4mLZYoKi0d8fIDRRKWcpjjUnvQ0vf7LGoUFPEj2JqvAPoCz1ewPGKFTy@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCwxmm4ZctHWbz00CuCx7TfurxcdC6xsnVhttCmuFy00Vt0Tt
	TYxF1kGFlLJTmE5W+Vw5Gxi6QrPgQXP21ISojdy3F/LFBzGhQP10mI3/
X-Gm-Gg: AR+sD13ZB3ub7iUYgSBZKEFXL14eRTnOWH5YUnIjcksvggeNOXmChyUmifnVOtRnxcA
	7567bHq1vwzGbEtd04fZmDSkvesjn1TFr6TCTG2TATW5r8+iOeuJFqG1RgqPe+t+MLN7Rr9IA5q
	xciEK4AtEzONYQ217MwOgClZqMdPyf2WI4a2knoyJWMMg3qEm6R2R9xlgjtgW+OnBuSia5hQhF+
	kjyW6mJs63S0l4cjaA3hJQgJhBMjDQ/k5xjAp6oRiXBJYCMURpx/J+DhURT4atY1sipwBstt/7z
	KAO6KCn4e8n6ZZo1cZu4/QfsVkTIY6GOq1f3W394VuIMvPzqvRPQPOnsUL68udkYceJPXjcZJO/
	OY8Gu09Asa2+NIipcKPaZLT2TAA+VsmtA19RZr/mobdctM6m9Vrjp8hY1wimPUfsyL9PRIwp3CG
	n9Ct4teT23ufITzkKJZdEptCRjRMUMwk+DXl+lu7jSPKCfhKlpeSi9lp+ytawmPQ3mdjiaB9z1H
	3DY/VSHoxsVLvlSJPARp4MZfIjM3utzyvwiWPLvfg==
X-Received: by 2002:a17:907:928c:b0:bf0:b39:dcc8 with SMTP id a640c23a62f3a-c212a1da2bamr1863469766b.26.1787065760375;
        Tue, 18 Aug 2026 08:09:20 -0700 (PDT)
Received: from [192.168.255.3] (249-9-142-46.pool.kielnet.net. [46.142.9.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c219e360887sm26417666b.61.2026.08.18.08.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 08:09:19 -0700 (PDT)
Message-ID: <9a880656-db90-41ea-bb40-658a878af12f@gmail.com>
Date: Tue, 18 Aug 2026 17:09:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 0/4] net: pse-pd: add Realtek PSE MCU support
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org, bjorn@mork.no,
 sander@svanheule.net
References: <20260813222036.873930-1-jelonek.jonas@gmail.com>
 <178705861416.2079194.11658601794072677702.git-patchwork-notify@kernel.org>
 <20260818075920.4580f583@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260818075920.4580f583@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18.08.26 16:59, Jakub Kicinski wrote:
> On Tue, 18 Aug 2026 13:10:14 +0000 patchwork-bot+netdevbpf@kernel.org
> wrote:
>>   - [net-next,v14,1/4] dt-bindings: net: pse-pd: add bindings for Realtek PSE MCU
>>     https://git.kernel.org/netdev/net-next/c/368990e9f6c6
> Was this reviewed by device tree maintainers?

v8 was reviewed by Conor. Since I slightly changed the bindings after
that (dropped a '-supply' property, added a '-gpios' property), I dropped
his Reviewed-by again in v9. No major changes but still a change which
usually requires the trailers to be dropped.


Best,
Jonas
