Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003030FC27
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289479; cv=none; b=LhX+wHmIjwv/HKLfDC5M5ShTDGW6KYQHy+86PYqyO9wogkMa/fGc59W/ko6+R47bYMH2CV0fYwbdd2EdICF8IL9ksxZHbIex97yEZxsoxKWMoH3fo+HpnGmGMqVULBwzODtWW0HqiNYv7pdQ6B/IzUkNLHO6mjhALe3CX4SAWng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289479; c=relaxed/simple;
	bh=8W82XfJlWTHi8WogjndTXsNhr3mflN5J8U4YIyKuno4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NYkkBjUyH2NYqtmitnVW5ADnqF8xgJDeqYaZGH9DPgG0Yk875NMCpqhjKF/bSWd+kLwb8YDSEJBEa/VKHpCYasVCjmyH9pPxOw2NWIWxMveRw5NNpbYvlQjtCC4PH4xSz93CEMf8XYpwe3e/uY7XQl+ISbeQ00XtxJgIswH8wb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBHEfEZ9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBHEfEZ9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1538234f8f.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781289476; x=1781894276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NlvWl3EekWEv/GN0PGro1ZAvKhVNdp0JgdzZJ2rkTtc=;
        b=PBHEfEZ9aZJIyxjhHa5Tuog2byM8RF0QKhJdqDCDsGD/v51mepjiHjnnU5urPcLPo3
         lA+WGs5RYb3pZlQlcB2WY5L7MNrnTua/T1vMvDDKfqm9qNwm7QRjuq+o2d4cEeKUkpZ1
         6GEQp+GefQEkrVcTLtMaUCGjscFTdKhCwNBKH2PtxgdfiU9K+QlIO8fhobSq0dOFHkGN
         UiJAH3iaPrVVR3BWNliIb8MBZ1MJImc7ZKtGgXhAt4LgFzwUKO167w/DN6woENltOgmW
         GMgVdU2PZYFf+ytBgtGOXTJn7Lyp0Wf2NgaYDRAzvV3uknQ6p58hPNftR4JVvMUwFqiq
         4eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289476; x=1781894276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlvWl3EekWEv/GN0PGro1ZAvKhVNdp0JgdzZJ2rkTtc=;
        b=ORlMMk2WXz7Qvc0FooBhWs0Y+UjsgD2LUhup2OHmm7I2lEEuU8q8LDqjOfAWn58FzX
         0bQLKqtCNUSfypklGO43Pn8lX8wf1GSlpEkCkBXiP6PwdGQo/B+Aw9VdZkQpuhNr2CXr
         P30QDQIeEvUDjEMPXC+d1lbXJHnxy+gXosH1ZK8Mb156lDtX74EYB/APYz9YBQGt4oTK
         7TtpVMgbpRE9q6WWaLM5xcsQ2VD2bEEWFaD8O1lk4OBLlJoZxWNPI0mJ/r4LcqlHlRKD
         hLO0g4UDUZhNz62BEh0bufNk8Yyd1lGaN87qSpmzO1Qvs5HGl1kg2wHXdv9WbeXyJ48B
         /jmw==
X-Forwarded-Encrypted: i=1; AFNElJ+WE84xN+AhhJQOW2o0eO/WGZa/RQ8BDYfCJQW76notSOuMs79b25xeSYlMltaCJea8uWF6ZWtd8L9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9PUTKWRJ+Snpv3u53g9TqfB43W/uyFLXEOoaozSokEByWeiWz
	BdNHV7Aw/w2bQaapglWPXqSuMxyqUFwiEn9l4cOI+9y/HJp5BMbtkO2j
X-Gm-Gg: Acq92OHje1bxClvPr0RmKR1Wqg7qf8TR53aSgTGUmARvV6L8dZnY/y/Q5UfrRDVG9Vh
	4g77pkwtj85DLNi3iwZPXO1W2WwT4up8XJMY+0fejVPYfCbMI2mBtg738LRPAYwe87zT9WOCcJ2
	77hfn53lRBnpkQ8BJw5o/Ju4Zfdl1dicvxaDU7+/F9h8hSeFXFa1urL4Uf8XjExnsEE+CsW+o0N
	NVUhqwH251reIAq/NzR6rEuSaENp4peWPILjqWlQ0xT/ad1hhPLl0aMvM0ooR/zMad8l1cZztpo
	U2a6suxb5FElAL2XJTYe/AYwTTBHBC7LC+GxfI1LSrBjtHDLpBHblgqL61HjO2OcBBBGgOJMc/B
	TxiQT3d3OAhHoOHywRMO3Xpq0i3SFrspuGKm2FMjgzAoaFcYxo+MNjtlTpfoyi5xgqM0Zk7Xa+L
	NEPUUCnLaR/7uavoROVCdr6a4TaopCBs970wO0JpYEFR9W1xlvkpS+N8qJb3n0l/yKAPRIAK2j4
	2F88ceZmzyT6A==
X-Received: by 2002:a5d:64e4:0:b0:45e:f387:77a0 with SMTP id ffacd0b85a97d-4606d143d7cmr5783680f8f.31.1781289476293;
        Fri, 12 Jun 2026 11:37:56 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm8427698f8f.8.2026.06.12.11.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:37:55 -0700 (PDT)
Message-ID: <3e0dd665-bd60-4a70-aab2-44ffd3ffce08@gmail.com>
Date: Fri, 12 Jun 2026 21:37:52 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 8/9] dt-bindings: net: renesas,etheravb: Add optional
 gPTP phandle for Gen4
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
 <20260610102432.3538432-9-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-9-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> The RAVB module on Gen4 have no gPTP clock as part of the RAVB module
> itself, instead it relies on an external system wide gPTP clock. The
> gPTP clock is shared with RTSN on V4H and RSWITCH on S4.
> 
> Add an optional phandle so that the RAVB driver can find and use the
> gPTP clock. Ideally this should have been an mandatory property but for

   s/an/a/.

> backward compatible it is optional. The RAVB module is capable of
> functioning without it, but can in such cases not provided PTP
> functionality.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index 1e00ef5b3acd..7bc910ab3ae0 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -122,6 +122,13 @@ properties:
>        Specify when the AVB_LINK signal is active-low instead of normal
>        active-high.
>  
> +  renesas,gptp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to an external gPTP clock for Gen4 platforms. The property is

   You're sure wa can't handle that with the usual "clocks" prop?

> +      optional for backwards compatibility, but without it gPTP timestamps are
> +      disabled as Gen4 have no gPTP as part of the RAVB module itself.

   Again, I'd prefer EtherAVB -- to comply with the binding file name...

[...]

MBR, Sergey

