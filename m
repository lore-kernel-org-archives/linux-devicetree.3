Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F239D3C0
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 03:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780458003; cv=none; b=X/5L/ziw4/5uXz1wBCQ7YA9nw4/DJqBDYWwtjMhXyCPKeuvI7fv8/S+CmIx7Y9Jo4EyVPdr1lKZrVpbVkJl2hn+BNqwTu/zlAC7JjR35v+nICsqslOOLBx9XlhDO7V0UHfW+kXhIuIpJj9jwhMKaBQD4xHHwHYr58zmUXeL6Yqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780458003; c=relaxed/simple;
	bh=LayMpiGRMeQK20rJ/0tmtlvyB5yYGKIx5W84HZbKAhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWq++U4gJvI1nwdQ3jUZEPkC9kpGsCyjUtOJHkfUAWxMn0EHrjkHklkuzugJsE2WxWb5lfDYfEyQVkXmi7cCjnntHl7APriOtbbFiif8JqMepLDiZtzViRqvJLGndqa9ZzCiDlbksNIfRdBX9zFs+I3FYaKRfeMqTUXrFmSfy0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CbWPv36k; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CbWPv36k"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so2189581a91.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 20:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780458002; x=1781062802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=mul/mro4LbL1WqrT4s7wC/EUOnu5O1+n6N5SEY/4UO+6OXcL/gKNJw6y93KqDDIDqO
         Da+GK98gcmInX3W3f6TiIgxaXyU7f2j27IlHbc+YW1viWBOjB7bkjZOZbvLZ7O0VRzH1
         w3IX8ojKQKGmYwMDnSmnPIR09ANLkVD667IBv+mGuASX+1ZkVeCpxGjYiiC+KFS/vCZz
         pyuVVOFuEyDauo0ZWmhq4ucJYm155lhdz461o5OF5lqDP5fqyzov8BWilssFkvLMTdAD
         glvhs27jEYsRUOfGj0Q1z4N1ba4JOiSneg5eEHahNbOzRRnAAZR+Eg5qiBvHJXgMWKfp
         fAkw==
X-Forwarded-Encrypted: i=1; AFNElJ8H8sc0D80pjGRuPcsJ02Ln18t8Cm4MqP+60wX5blaj2eikUZJocjt1KhADdwaX73jpGEYp1ARgnR22@vger.kernel.org
X-Gm-Message-State: AOJu0YxyMi4NdKQrrY4kicUCeJk+Xd1jHCoEQep8VvdvKqCKGf8WuXAU
	jfNUrtZ3Iv8VmeGUgycKO6XV1EDlM+G2X+lbhtCMx+5M5At0bnoHl7FH+Mo9MOQO+I/eDgrKaC6
	P+Z3tV9VryP/LMwMBSI++G1JhT0ERBSStjLe3W43sQEGTbzHs6ATHAMkQZFi8Lf6A8PtYv2P5fA
	U2hqz9y4Rk9MeQ12pJEVLqGD8NsVqk39V/i+yKmckls4/yD/IrkzhRB1dTgNKP1Hjw09WMhNnWh
	9/h0FAaShqe/csvGzRvRQ==
X-Gm-Gg: Acq92OFATrARvcDrqUQ5ftVXM7FodIOR6G7LWVMfBsQ+OJBF3HTw+V0j7a22C00CHf8
	Sv2xONCVWCBGZnNqkIXVXGBbqA1+wNH+cbrT2Ggjudcc2TnOETmRp7QvGpMYaTpz4GN53nmPwcL
	SDJW6UlxpvZxRNc3H0Fr0shb5xKWMC8TO6kOwtXlw39xEPgevVn3QQM60H4Kp/Q8XFl99EJCDw0
	oF9v3ya6TXDInJrvQbNHFqr0Zipvv1fq3pNqbSRVjl3QZ2PDyhFp9YLi7UAHdjrIhem6vZZ1DSp
	JTfEkJ8odT4elTlr0WNHXJSh5FLsCUCBaOg/B90OHBvneLDPVsq5EPf5jW3k8G7dYMrjyj/ae0X
	M7Wj3Qo4Meq2T9/50gv1r9b6r9aFxeiDGEjcqkbMsTex+tP5CdHzTeFbhW4DXHc+CInb/Xv8xTB
	XcKTlDEW96fRJ87x4c+IhkrDYp5YD/B0lUm58r7TL5n/nSmn3uKFu9X8TFNU+v0R2ws0S8N1YU
X-Received: by 2002:a05:6a21:6009:b0:39b:dea7:5624 with SMTP id adf61e73a8af0-3b497a4a347mr1926377637.47.1780458001437;
        Tue, 02 Jun 2026 20:40:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c85df03619dsm76438a12.4.2026.06.02.20.40.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:40:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304f23c55b2so4770467eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780457999; x=1781062799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X9JI8nlQhsgi6jVORje76ie+FBqkJZd2ksOQfkbJQkE=;
        b=CbWPv36ktMUCUl2wny02UhA4YWevDbCbROU0nWQuxCS2mR9vCVVDQWduicvpuL0g6e
         dY30TJkSb8WCZc1qVPLSd02mG63NWyML3j+MP4EnjG/+SdjxTTxpExUwgXI0jNIIvR8W
         ViBfeJ/FHfJgNi5qRCzhTJLGBuhVA899r/FuQ=
X-Forwarded-Encrypted: i=1; AFNElJ9fJS1vfyNU2JvaRneGhawErlsMuPolgd5VI4oa600Yj6jV7LFG7PUL/Mvo8jNM5uJxrrA7I0XUl0DI@vger.kernel.org
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883765eec.2.1780457999585;
        Tue, 02 Jun 2026 20:39:59 -0700 (PDT)
X-Received: by 2002:a05:7300:371e:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-3074fa3d73cmr883739eec.2.1780457998957;
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm1109950eec.25.2026.06.02.20.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 20:39:58 -0700 (PDT)
Message-ID: <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
Date: Tue, 2 Jun 2026 20:39:56 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 robh@kernel.org, baolin.wang@linux.alibaba.com
Cc: krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Bjorn, Baolin,

On 4/27/2026 1:12 PM, Kamal Dasu wrote:
> This series adds hardware semaphore support for Broadcom set-top SoCs
> via the generic hwspinlock framework.
> 
> The semaphore registers live in the sundry block; the DT binding
> describes only the semaphore register range. The compatible is
> brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
> appeared on set-top chips).
> 
> The driver has been tested built-in and as a module.

Is there anything else you would want to see being done differently here 
or is this ready for being merged into your tree?

Thanks!
-- 
Florian

