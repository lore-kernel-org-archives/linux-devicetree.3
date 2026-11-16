Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870065;
	b=EZf/LdL4PzMVDayXsKHW44kbHft9eYj4vnPVH1SmPFeuybU3vhSSdPQYafh6+W7UAi+p
	 AhJsxHrd7s4vr11zd4ZXKqxYXgshyq9vToAFrsK2OQZCS5wsZc0vFHWRbYPUO0FHtf+ZX
	 XFwaIVsb8tHUE7ydVwzTSwk/DW74ZY2zUIxQgBjOUEw6dNorEL/OIM8vDc3lEJx6Uef6m
	 Eh7UPxxJjm561nYc+bXnmRDM1ZbGSJe60jqm2gFHUEy3KwVXOCo3az3kC4bMhXRbGMsr+
	 ruXtp9D5wSv/TnhlQepGYoXHxHuBrr6SdQginPyESKxVoY9kZWeXM128+fOhfUwdG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870065;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
	b=0e4Ylsp/TelkDTESLbLW218Zf4CPYx5NPLKUD5yFiVFHyBO1dOyoz5Mw48iTCgLsB3rB
	 WmM2sp6FYlPUGdNMbeYOkPKD1zKSDNUjulSuscckWRUDV55nwFpmqcm8EkkCfwKypFK3N
	 rgUrmhW9WMRqHa+U0Qw2fVwxzL36Xh83Y2TA/SUF2wA/0LE4zvYyhe2++lumALRfeAHcK
	 CXWYXQbDEkULGaUrJdNoPVfIkxgzOb7tIoO/f923qDyYNcYZpXuQbr11bha06WQIJtnBS
	 Qgfhl65N502hUR9LKwIFke3ROk/U59cE1UEAIOKy4E7VfylsA71n6QND3VATp2WdvHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VMFGzylH;
	arc=none smtp.remote-ip=209.85.221.226
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D7606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VMFGzylH
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5eae1276409so1486163e0c.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870064; x=1795474864;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=MnxVijwWHWQfXKy5RUvN6UFn1q4z1AIQZ4X6wY76TP+yLkBwiFLc/xTqAQSHhFxAo8
         zut0CJ7zLcnTgfyWEXrqxKQTO5etBKCYwsKDyY6m7VldJatB+RP1z/cZljYHxMJYCyRa
         Js2WMg3OrzKbnirPCNbUNEm9pt8clITA6C/rmXgs30lHR2JymFBumCsJMEwWM5u4VLIa
         wreW32AaYi7s1IvqiFMwRa7wawYWw8TJyg4+jJ3qeLEuQFJBHiwAN4iihlBlhLa85XHe
         d4laKCaRdgHu/inouNlt2nKQGRVx84XaoTukkNUpSzaLnTp1klkFCSip5aQxFdXIzuIx
         9wiQ==
X-Forwarded-Encrypted: i=1; AL+hErEgvX/Y7LdwknEVIFjFMKLyrG/hVTWYgyVjRrBLSI79+sTqDfzMrd3xi/Wn9c0DrApa9a8zADOHIG5A@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gaqa5TXjSxlMMskVS7GXHJS5um54+OKR1770GasuOMxO9yUvc
	f8nfur0dXkmlk8URB0BhUCdVnsgAtj82u8L7RezeJjOrkh7M4zemvU+FXNDC76ZMMeHJbjI5yBW
	SndloikkkcwiWOmJlV8esZ0uPdmHItfaLIttwyK7wIhCRcJFQoh4MGSHKihI4VV7tDLxcfh43Ap
	RbtXYKFmks5vitAQ6Z9NDMcqf9e95y2o71Ef6Lv17QsDfAJTsPSYOXJNNpBOmIxTnQaGlaIRaKB
	U8GDqFhf4aw3TufNoAXHw==
X-Gm-Gg: AYBFou1YAEFhesJElbik6n9Eys2EY5K3NYE6uOcKAsUFRy+YAyvpcq2b0Z+CW3AT8En
	is8QKaewpRzdiEqXxpvTW2MoYf/Nu6QEHfdGRhI8uS3g8A1ugHD0m2vn0eMeLdklaWtFDzmlpkV
	59R0soA8zacQ7zyRSys6BDS0aQ8a6QcZvjHpyqNa1X7whz9EaxXYSLh2hAp1b+GrgKFuq8Yz5Bw
	+XXHN0pglQ6o/HBkkQcLypI2weFK3Nm+pgn+cGndgZGSomDW1ALPxxcszjIp3Dw6YBCNBlfr3KR
	791zHuxnZ4aKwxkK82nVdZgwW8Y9LqcMwuiAHsA3p+HM67vbP38A9Bfijs1bMRtiu5YJ7vVjTIl
	0si3h1Npldpmoi6mSMFdn8g9BaB98idxLcqs8LJ2QP9i/Xqp5RyxZ7CkreoRQ/WeB7LhOUwZyCa
	rcpR+EcPb0e0E9StQ0KWLn+BgXL+VcJFkhY3CCdZXuoo8=
X-Received: by 2002:a05:6122:6189:b0:5ee:3fae:3995 with SMTP id 71dfb90a1353d-5ee3fae3c45mr2253842e0c.22.1794870063190;
        Mon, 16 Nov 2026 15:01:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e337a10dfsm124385241.6.2026.11.16.15.01.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so5529145a91.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870061; x=1795474861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBtuzXAEjW6vvHYbW+dbLkTxqvqdc8L81bE7KOwQSac=;
        b=VMFGzylH3ZtWokwNrEfwF7sqpJCZo9YMu0baqmxZDGGuCxhIay7dGBWbL/0/RP1+2a
         m8RYmxR+hCsrPcWC2BpF9jAiyUizVxatq241oyDJhC4HLFfCJHCdS/bfVAsyroHyTfN7
         7cQaIHu5sXYGTYEzwsL8lcGUF1QNz58rz38MY=
X-Forwarded-Encrypted: i=1; AL+hErEG8EzcgTKdlfeWrPLkULSZA23ckmK2Xy+EcWV9L1dW1xJfzLPWCCpCKmY92jDzu9cCKJ4oELK7hmu/@vger.kernel.org
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853204a91.14.1794870060993;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr11853156a91.14.1794870060381;
        Mon, 16 Nov 2026 15:01:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm1096089a91.0.2026.11.16.15.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:00:58 -0800 (PST)
Message-ID: <d2942f59-d421-4aec-80cf-4c6ac52bac0a@broadcom.com>
Date: Mon, 16 Nov 2026 15:00:55 -0800
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
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its
 clock
To: Nicolai Buchwitz <nb@tipi-net.de>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/20/26 07:58, Nicolai Buchwitz wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
