Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628604;
	b=BznaZavyuRZ69ot9beEd9SzjWX9677wh690pWbmArDROsmuGAAI1z+JXaeX9d7JzBIWA
	 +fsbZZPGi6wd+qxDHpzRxmv4CxXz0XXwTA0iVTbJzAe+wu4imDRrANCPxigASv9mkRgME
	 PUkAHXa+ArwjESXucVi3jrAyqowV2vFR7JjuHaz8Qoj+uSxdcTLIhwxEMlUdwffHze9Uc
	 Cqtxw60ARj8/LGy/I7vLkgFYHrZhy9GqSFBWWRmv+Botf8OyOSnFHrI3WbmIzBI98C8RV
	 pSzuns93GBxD49KX9EsuNW3dmw0fA3k6dZKzO9iUC/6BI142AERcX5fOvmh3tIWIYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628604;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
	b=QbGBSx1gYPCa3Ka45VAISSPQZnemTKtKphHyn87FN/nsG4CFUVqQt4GgId4wn8H81bTC
	 TozSrerCyjoEh9bb+zQ3sosYFpFuTo0wyNcVBtkFv4tqyF69YTS99bV8Y6lPRSVOL+VvH
	 CrYRbPPv6xrvWX6qIoVdX8HqR8v6LVIHJ6MJa05C970PMjEawTrewj28pTkw8uHbcSnTW
	 /RnTkx704GL4pUjtiCdKw5bFDSUgRIONaOdmaRt4GUg/+LuOf3NeDvr+r8zreCkvELVDU
	 qirbtfeU+QX+jBzsae2vBqlx4nm6lIISzOcp7AHxzDYtDRMwiq1hXuVzvqlFgRa965w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHLmbNXO;
	arc=none smtp.remote-ip=209.85.222.100
Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7E0606A884
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7E0606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHLmbNXO
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso1930266241.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628603; x=1795233403;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=sSLHmTrEiOg59Sr6bHJdis7OF0mIsdTUAso9/3IWoe0bSuhgaBigbvwiWlsD23SDmA
         eIKwFOS5ce3fPqCONB/SDWpncrlQyhL6TAyKOFmQaXj7T1VNan+DHCxsrmUFTkbLl0R/
         9I+xfaNePlX4do9lPl4MPN3I9OZOVf8YDjFakLqP9eAxfcFZcy6p2H6J/WjgF9dhCZw8
         0lQ1/FnjCDs+DOd6GRQHpr/Up0TDgLllEKVWTolO7P7HuC/iJ+gzj8l0yfout0EQNhLU
         t1ywrAVmydkrsW3Xh7KdjkNj0tOofX++V5x4vNuij5Oodht4yRo5f1tQriBGOmIJ6yAs
         eN5A==
X-Forwarded-Encrypted: i=1; AL+hErEp7vIkY/8LU0UuIVlr2//keAsEQ7VIy+F2D2AXOn1E1Bjjqjh882lSbqCHkG5Qtr6LVWMlzQSBz1lq@vger.kernel.org
X-Gm-Message-State: APuU4Z843/AM9favHNUZKt4/3lAqJfdafLAh++Ryqcr+UfSFNFByP2NI
	8kaOKnjS1Zk3CAN/hKfiic91Y3x0XlzwPnYzWxLHP1U6+6NnLxb3pdezOPfnEkrACaj3NnX2Q5S
	YzQENMZ0WnESFvOE3bT6OIol9BkpBMrFC92cvN88yKCb2q6APtarbGrvbjg8AHrF14Q3BIn93f8
	oMIalJM9P9uffwjBUySCB7p+9Mr+FLc3R1pwvpLBzvt/Ur/An1fpLIl6H0hqNziG1GKIqeQlde4
	zra7gpKpkVuNDDdamYXqQ==
X-Gm-Gg: AYBFou0Unm4dcmzfOo5qFtDNRfEwSHddek/TMsyXyqRWZGw3CDHpJUYU/Q4gCvYKbpm
	hac5+l53FXXL0zKmkuB6ewkXQFyUBXnMqedZA9t5ek5q2h6jSqcOAxzouyVA827DUduzN7rlZUo
	Jvf2/QV6Bta0tqTF5dihYZky5ckpZFX5+Gym72sVNpzPTQ5VJqpoEtKSoAnd+eaS8cOPdo3Xgfq
	gF5pbEAlvqr2KSGLjuYFv4drr5e3QoQa48D3aFQc+oyRJilGfQMt20nKl7zAHon3+770EnHXPC0
	IdbqbS4b9ewXtL46xtPWHxZ/ELFdoG+9Qaqea45ipoUY0Dt9mn0XUTV5dNhDbb39LyCXL58An3v
	Ku1KCxEpntPhZNbgsbbgkzbeh1arDWY06xK4aIni/QuDQDjv1Mgt4OapKbAAo03lMb+FeYahHrZ
	0hhsocgsWo+ZJ1KXuHERKPGwQ9+hSxZC54FYSQXpYp
X-Received: by 2002:a05:6102:f9c:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d64d87d6fdmr1807066137.35.1794628602974;
        Fri, 13 Nov 2026 19:56:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c8d2d10desm622100241.7.2026.11.13.19.56.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so2093663eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628598; x=1795233398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2XZgfFm7s7lrfWCMqmhNREaDDdbn0gp/l+uaRgVa0=;
        b=HHLmbNXOUVbk5kNYhMCzo/6scaEvDQk77zAHvGSPNrDGQ5lrHPYg0WpXzSqPgn0ViW
         sR/yWZQOg9V/HeozJO4SgWn4ipxTS7R8Un6X6Jd7APwAzI0bBXevJJGoHUZcV2TFQVFa
         z0Y9S/nd7IXMIjGh0BSbxm82gVdFU0hDYiCtM=
X-Forwarded-Encrypted: i=1; AL+hErHvVVS4pECdw8Bc7uaNnbH43nqElXz2dhLt/F8IqY35BcbvfLTyeNY74D6D5d1bD2TxOG6RfmhNYzxJ@vger.kernel.org
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008668eec.28.1794628598222;
        Fri, 13 Nov 2026 19:56:38 -0800 (PST)
X-Received: by 2002:a05:7301:428f:b0:369:5583:bf4c with SMTP id 5a478bee46e88-379684ae79dmr4008634eec.28.1794628597487;
        Fri, 13 Nov 2026 19:56:37 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm12194066eec.1.2026.11.13.19.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:56:36 -0800 (PST)
Message-ID: <785b0ee1-a1e2-4f57-bc4f-3119615f8c63@broadcom.com>
Date: Fri, 13 Nov 2026 19:56:35 -0800
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
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
References: <20260907195924.29510-1-rosenp@gmail.com>
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
In-Reply-To: <20260907195924.29510-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/7/2026 12:59 PM, Rosen Penev wrote:
> Add labels to clarify which port is what.
>      
> Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
> having to handle this in userspace.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian

