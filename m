Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D03C278A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319661; cv=none; b=DrHLX9GFgSrUdeqFCX9aDyIr8xaYIiTodRliSjrqVwE/Qj+ccyA32OMoTCDzTfYnjbZvUHbeQZg728v5onvk6DLC0ZY6daMv77xoA1SNJLVrg4yJdyuOuG57v2aA0jAsp8xrl50w41yWI9HwC+id5qMRSdIMoZ/7Q67aLhtgEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319661; c=relaxed/simple;
	bh=aw8yW6nfwtV8ufaQFlt4TslrhtmMvx840dj6B9p30cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oswcQ3dVkOYEOhBW2a6joCRyUHc5jrqRrQ/0OmoNuCQcjLDVsEE20a1+DKbEy0QIXZC6FL+VEhYUyMDNJItkQjFmaG2ougexjP7cpicYiV0x/KWGsjTei1sXmG6z+ENXcFWyfjRo/hvxwFapdb0l/Lx7NzgDi0ZIB46q3i9gzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ocl+HERs; arc=none smtp.client-ip=209.85.160.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ocl+HERs"
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-439bdb1d75bso3555409fac.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319659; x=1779924459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3A6KecpmtrAbT/I3Gx73+8JY/faMGZWGqkIjOiEJenI=;
        b=Z4GLR6zZB85Hpc3OEb2SBqj0dusswgBtNCOjK0/hWn+qiLWnKOOObJB2qpleVDNSJy
         N8FU4K4cCHRNshNTRrWUt4dhKt0ffuVe/ebviQIVxoiVyvQyz75cgI2GDjW6cIWAKYB6
         EsywUVe2lF/HV03c9XVa1rjLqVH5NHnWzl4a6V2aNxbHATUKZXbegS2ll0UuHmD0mE7s
         W6FGFqFrkhih+mrnNousMHdn5ib3IJDVqDwMDGUNnvbNLdTDXb1/DVvARf3KZhjjP/lq
         IpQSLSLSNY+cTvEOr0X4iWphawtlukXt+8SwXS5dXOTNhYphj8BIiHSI6Xevh/X4w0nS
         aiPg==
X-Forwarded-Encrypted: i=1; AFNElJ86cB4iu+KZAwTQ4ASmmg/ihI78iuypFchBV+KBihU5yNf+Jex3FP2rKxI+WKy0LOLKZvIyBFOCf45C@vger.kernel.org
X-Gm-Message-State: AOJu0YyboknE+CgaNmHDKwGBuCgO7kdOgJw4NHpiKAg4ZWThvqONaDNV
	tvVVHtFMQaJtAYflgVtlpCrVxmexSgvmtuqA1PYriy5P81sY/Np4Gcd8HlnP3Ggd6zCENHtPBwW
	oBWfnLmjkkG7i3z6Cpp8O/Po1wna7ufkX3arXTtZP1TE0/IL5rSKyt2uvBwrzVwKVfzQCh+0bnp
	8bwfnBPvxGWnKMVQyz4S0fKZwXZyfwrBAgblBuiqIYIGiKrlbJMeovgrubHZTRWg24dLnyPvBG/
	Z7EAvkW82LqMwqr9zueaw==
X-Gm-Gg: Acq92OF/Z4we97MQ64/RVi9aOinnPEcP/RASEiDvF+DqiotUPoa+Cu/60PIb34MYB+j
	pwXV7scvNIZocWkmxeE+wgX4j6HnmUC9ShtwjlfA0Us2LRnurhC7qFTNbIZyrTktx+dZm0Z9+oD
	dII6XPXHTmWYsO4qgTSZ3pkgStPlsvS4HSbKmYDwPHjPs3DRnoux6AB4THtEkIDfMUOtmT7oaQn
	Mnvnq1psTHN3mjChzz/HzEuyDkp/Rsp40p2qpnvUd4qsccUoLdtDc99DMBlWKEUGX+5m4EAwu/8
	rG1mNr9RpDmgcShHLlIpOzPPPkZ/ay+xQNnUPzRxpn2pXsRxuB2RKft6TS8mb4539muZ0/ZYZHF
	udDlrRkKa3syXL8glu4pgvjt/VvdBSwEMzAsGPp7/6ATo1CSZ/psGXsh4u9xbuNOJ0G+Fvv+6M5
	TOARFRdwkJ23CIoWkX0fKRS3SjpH1VUg/EBxNYlk6uIi9MxPgSbO/wySNbsPZc6mfW
X-Received: by 2002:a05:6871:4b87:b0:42c:1ba9:c1bc with SMTP id 586e51a60fabf-43b2e78d8cdmr487358fac.1.1779319659426;
        Wed, 20 May 2026 16:27:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-43a94f94194sm1600261fac.3.2026.05.20.16.27.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:27:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-13537722193so7123086c88.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319657; x=1779924457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3A6KecpmtrAbT/I3Gx73+8JY/faMGZWGqkIjOiEJenI=;
        b=Ocl+HERsCVzrrzsuLZuJaFroIvHnTMNIJdBt/8bxY+thMPy8MBQ5yxpMKtFs6+XVEn
         2Bp3FLux0M/69KVV6EKe3A2yGhgsonF0X2DbdS/NF35Tq3rLlKNtQmwgdoL89XTYKoJd
         Fh/WCT857OJcYvZtm2Uje6tHDVrZOdOFpeuhE=
X-Forwarded-Encrypted: i=1; AFNElJ/QWrcYFkxe/lp79ZmorAgSN77qyHr3WC33SdnWSpHdPNXnQqRbjkt4jx3OUTqDOLqAAj6RIGw3pf/E@vger.kernel.org
X-Received: by 2002:a05:701b:220b:b0:135:d104:3612 with SMTP id a92af1059eb24-13632d47372mr203976c88.24.1779319657077;
        Wed, 20 May 2026 16:27:37 -0700 (PDT)
X-Received: by 2002:a05:701b:220b:b0:135:d104:3612 with SMTP id a92af1059eb24-13632d47372mr203962c88.24.1779319656503;
        Wed, 20 May 2026 16:27:36 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm28333258c88.1.2026.05.20.16.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:27:36 -0700 (PDT)
Message-ID: <a3985948-ef14-4998-a632-ee50a5b34ce1@broadcom.com>
Date: Wed, 20 May 2026 16:27:33 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA6500v2: fix USB3
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260406220603.101494-1-rosenp@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260406220603.101494-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 4/6/26 15:06, Rosen Penev wrote:
> USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
> to do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, thanks!
-- 
Florian
