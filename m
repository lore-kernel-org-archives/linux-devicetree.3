Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042235;
	b=N66Yo44PpeNEQZTnenYs44IId7C05F5CWZ4l8j9WIu6cFLki3IGPe4MGc5W/Ljowz2kK
	 ZlM8EpTD9oppcWLfWvJpCKIgRmBy3efZTpYqUU/zvUqdkofHjY/Wsipbv+OSNYW+1/rOc
	 OsJ9oyN8htM0Y2J2anneZFArOtQYqn7lYMLIvDS58YNXEYjEVFYuk0zjTlVbNN2psxJaF
	 ZHVCYOrjD05+/B/3UoQemxXW3mz1YLcnbB71bQNBfAi3PTLiQmpV1qHdzmAgpHrYU45nA
	 RY+FT4ghEQLAQhn+M4r3DdPKnaMY7S0cLN5gw7RaElD4LRl9oP7MmcZ7dyuZsbCJxuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042235;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
	b=MpdQoAPK0Btt/dR/g7J7O8vfHjz8w3Vp7QLtlL29sYWE8r3psJMF4lA96HA9FCc/Hf0n
	 K2DvOzpnLmyty3LLLS9QhoM3U6pSPgQJJJq5ps5BY/2Ui0kJi/+PXsI58zVPsuxOXPTAT
	 iglEyqUZqdE0eiBzJyTxWf6f3T8InSqnrUTZWq7oafD8kDgiMqMnTnBpajvB/HRvgyONI
	 DpDhbtKMIcx6l/6nYvFumO7RZJzjJ8CdbaTIVAIMlJsvBXhobEOok80Luqx+W9Chp8e9j
	 LFBT272R9VMz3mveD0rggGWborhXINUsSH2AQNBf4d+Qle28wdvlyVY/fAqWLDO5t4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aM+IXJXa;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79924606A333
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79924606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aM+IXJXa
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2429144a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042235; x=1793647035;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
        b=I/7kOdPPuzjq6XKKUiiuyaax5kJ2niebhahWjjHifxYy5JG4lCY6+ZAW+wjDBAaCfa
         mpcU3S3rzs4WWMxpVxcgwzTOm2Y2PD0E0YaYhsDCrMzHEQeakc2xu7T2a3FCyl4qapjt
         9ku3av2f15fPIlP5B9Qg8pI3giKDe0u6WFlp+FC+E0jlO4uh5AmJ1dHVyUfFS5wheqRs
         L906yzuF672iNVPAmAusIA7NJ2OUR9J9HitYIKU/7+BTpCnfvLxBB9wbbiJfICuOCYy2
         4ba7YaoilKncJV/90mOTLBGX8KZV/J3ekcAZ68MWU8qIBMvfV61rQx1B7NGIZDp1d0O8
         PoJg==
X-Forwarded-Encrypted: i=1; AKwUvByVuYNysqcqWcMzGg7aKPSj9ZdvR6n1e6ZmBIMGTrdqx5snPWIm6HG1odGQ9oxvirdBqYOfKaU3Jkt/@vger.kernel.org
X-Gm-Message-State: AFq9FYKNvMnfyVo9LvKvEyEM6ugU2w6r6ZKvbTdussdWJbeNE4BpXs3s
	+SXBE27PlJ6AKY8zP5Jg8+hxfFxc8P3GXPaHLM78vDx8lIw2gNgV9el0hQjZuWEwiT7jY+3XfVA
	g2sheCijJkJuZA0tRXChQY44aKSQYe1Qq71NEWRKuClI/sSsAkZnXV49xOMyrDwIHT/+0ORosUJ
	4M0nBFL7dnTOL+vDi2hc+snjkuYMudggF0EbihQoolqjmV+80aphaF1mMYYBc9EnQnLRuzph4WY
	JR66HcnzGk9Luhpp4AfCrWv
X-Gm-Gg: AYBFou04IoJx+r8pO+89pLRz+R9bdKrtsyB7yl8f7vweQYHr+2N38Nz4HbJ2LiF1FgO
	sFyV81VHMWim6HKDeRAgfWprzTWg8Rz8qUnq4uIp20riRJuQ6cfDa/3xGVeOP+pnpvbLmcFHZEp
	VIW1j9PiUBntt8DA8FFjl5gpGNbPYwRmXPZpqn1UELhKeIIwsxSTFYW8TLWlfjMuImQAtRenTmu
	/bS8YQ0AsuxzeYpGmVwj9AEdpGJV8iqCZ2ow7Imr5NZTXlmAIgHi/zf3mzfLAbzj7qA9KOQMC2f
	7L7Gf1GAKUh4CMRs3sdwI+87mfs/gpqVjNDJ9w7fPBUURuFD1Djwaig68UNUT1sfpHTZ/b5Ze4O
	BFKN8zCoYatyV4BHvWLMzLcWm6qdWYCFwuLkrmagD5vf1S3A+yGbwEPfJAG4SX8O1USESE/Tite
	bCxolsm7t5iCLq/Q17vtaRRiu8S2MTcOIUQzcxslAB
X-Received: by 2002:a17:90b:5744:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3adea1ad770mr6676649a91.3.1793042234731;
        Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dc8fbsm318821a91.1.2026.10.26.12.17.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bb074ed1aso73681606d6.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042234; x=1793647034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdfLZ3+TQnhk/1R/dKHjB/gyQ9lcXQ2fJWw3eaIlqVQ=;
        b=aM+IXJXac6CJ5CGxs+BvxuyY24csh55cQFvWlWkVW0zFn2RfMVeOlFgAq/OOrNuA6Q
         mYRtDFZZy5LKddOfCGZIjo/B7Ud2II+yTfwRvQTLtrNVBU6DqA8cUPKbbuA/98wDF9cR
         BzJK0uBEjdOPf45t3CVMqgrbhyOFldQCYsYG0=
X-Forwarded-Encrypted: i=1; AKwUvBwnrxqIwWmnZ71Ql6OJMVmP7hQj+7LShRXcAq5DaEP8Yv2FUvpdTvsGFGtEcVpBl+nNLHmwfZX3sM8e@vger.kernel.org
X-Received: by 2002:a05:6214:2602:b0:91b:83b7:b9c3 with SMTP id 6a1803df08f44-91c48cefde5mr132806766d6.5.1793042232880;
        Mon, 26 Oct 2026 12:17:12 -0700 (PDT)
X-Received: by 2002:a05:6214:2602:b0:91b:83b7:b9c3 with SMTP id 6a1803df08f44-91c48cefde5mr132806056d6.5.1793042232303;
        Mon, 26 Oct 2026 12:17:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47ce49d9sm80619336d6.45.2026.10.26.12.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:17:11 -0700 (PDT)
Message-ID: <6cf34238-ed4e-477c-938f-f5d6910fda1d@broadcom.com>
Date: Mon, 26 Oct 2026 12:17:08 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ata: ahci_brcm: Initialize the NSP interface clock
 and reset
To: linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
 <20261026182856.3168686-4-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261026182856.3168686-4-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 11:28, Florian Fainelli wrote:
> The NSP probe path assumes firmware has enabled the SATA IDM interface
> clock and released the core reset. The downstream iProc config_AHCI()
> sequence explicitly performs both operations before accessing AHCI.
> Without that setup, a cold boot can access an inactive controller.
> 
> Map the optional NSP IDM register region and enable the interface clock
> before releasing reset, retaining the downstream settling intervals.
> Perform the sequence at probe and resume before reconfiguring SATA.
> 
> Keep the resource optional so older device trees continue to rely on
> firmware initialization.
> 
> Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Apologies, this is the same as v1, I will resubmit in a short while.
-- 
Florian
