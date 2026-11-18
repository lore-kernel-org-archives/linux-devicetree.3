Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027000;
	b=DprXOTleZmOURtCt5ZcFUtvbKCh5VUwBO5he6wEn+kwJz+W5rZF7wGR57jNdTPZOSzKI
	 KzFBdQhRShoRItmaxr+UkqQMNzLx8DkwC1YKHjvwBWn2emBe4gbWqz8TfJ/UDRDpVU1dp
	 FCFmQPzw0Kns68/f4UsuFdpY7sUrye08yZ/Orv3msJDTyvXZPC9krGQor9sFGvpSTBjWp
	 TPcdFyb5u29AEJWSsRvBQtjHhE0LfldBTmlVkvVjRYDZH6l0pQ9g8ZmoRc7EGHz6TaBP3
	 OaUwu0BBVRgeAk6qE24ZIkSoK+KiHeBUObq05rhRQE8a7H55AlR+7SrGfRfRj4xHujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027000;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=;
	b=0mA87/v6ZoW0qp5z0ls7joS1tDLEIOEWexeXtv7XIAleSF5k1Pe+rCOBqy1Hb1NQzSYt
	 3udJR/ambQvbZ4PZr4lDcq8M1nsDsL8BESTRKkfSsHnDSz/x2wfr46cQMyC+Edd350iOq
	 Ht6tAzSmSgS0ZycsyXdKmB1k1ArcnHuwKYFmijpTh6A/HDxn60xNuxoPOzTMcXk+ThJcx
	 hStRIbwVhHCW7CW3R1wT2SHzqRmOTbw4R/ShHZZrn/6fJ2BC4pmW85898oVyKxEX7uvEy
	 xcP7Esp9Ui0dcwGaj0T/Yt44uZFhQl7wVs38JgeycapOPUI3F43GtHHOjxdO5lQZnnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HlWIyKox;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63232606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63232606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HlWIyKox
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso721033a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027000; x=1795631800;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=;
        b=fi9CQSETQBB0hEm7lTyWSdsuOeufiXcswiEWNVoYnV+we1HZmqBExveaM7ExTLU8uv
         TDCagJTGsI+jrjcLcMLWEW3bU0LP5nlFFfSCK3OYRmWSWIRJYy5SKLQT+Kbptoj26ho2
         UWkL4BxJAaybaqyHsNQuSob1zbEFdcbE7c7RZLCouQvvGYKuO30cZUL6DerFINfziZH2
         XraYEaBNxiNpf9p3eZiAwUhq0OZJaL1i9P0CjJ7Zsqddrf7zDND30aUOMJxEY+DvYuiN
         a7+7yCW7WAHY4lV9LPKRTSuNrU9Fj0IBFCqZ6qp9CrcPowBAEGTA4I6p5U2rE3+1LAlD
         abKg==
X-Forwarded-Encrypted: i=1; AL+hErE6z/ScP7HEUO7BmF2qmsiACVH0AwFtc7Rk+Vutp/5mq3e40zrCDFzDTwWeL5Poahd0rMuGojnB/D0v@vger.kernel.org
X-Gm-Message-State: APuU4Z9Md63qBhWfE+u0W6Kzd/BWRKAbL1krYeva/nedIkCrcieT/wft
	Rdyq1P2zDvpr+UKhHOz+ljyOhVgC/ezqoFbStmZQNqfD6OWtOBKr5hu16EC7RHJtj7cNaFgVEkI
	Qu2BAlOzZWp/C7eG4q0r4F8Wt246amInkaGwgowDvfbDI3Rv9X61uyFUeqzQLje2gHdX7eBkotj
	VVNmGY1R/Zdq7jnseHKLusVbmpuvYje1lEdlYMzK364+M5jrQYGyC3CAahHZKKe61KTQ+R7P09w
	AEKmIgskgwT50U0pwW7Og==
X-Gm-Gg: AZFdTZdFR8741/fm1n+MIEbxbipo34l7IojM+AokK1ftjeTuWN47FZrIFL89uw0Sn+o
	FediaVeS0FRHcH1vmDdifGGp5h5ddzx7rdpqbbZ98ctNJ5MRsssTJ+ce3cRnt6p2NRP5RsFsIpK
	83/I/m8bjhzegn30zlHuyf1+TmNicQXyw5FLOB6eOqN6Tv0OWccVJk64/eXUgnNSYZaAoSUVYDD
	YbIEuikRzk/VbYi5lQMQaRkcgH+1xhhfWwvHBTayihotj5qMggkO5h6n6V0FCsboVZpfo4Wbkxz
	jiU+5KjkwsfTQPvCcXkHrJxI3Tm0T/YVBEO3Rgq4VRJiHVfaKEyDaK48ZKXebOk+OGr83PO7ozr
	4q9bB6oCJNYKFh527Avb1DUSkcfVwOr8RC+3uhZOLfcBv+fSn2/8GRK97lLGG9gBlWd6rVAdMf9
	eXnCHslc82Gv3FhDyZvPbhWqOyESNQ/rZbpKy/xg+6SFw=
X-Received: by 2002:a17:90b:2784:b0:3b3:b632:7f2b with SMTP id 98e67ed59e1d1-3b3d07e3cbemr3318208a91.51.1795026999624;
        Wed, 18 Nov 2026 10:36:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6be27ecsm199755a91.8.2026.11.18.10.36.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:36:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92106c98714so22031226d6.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795026998; x=1795631798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v0NAGB4VnBF6v0XxG5lhUKzrvvsFu4Apq5hfrdz+f4=;
        b=HlWIyKoxn3yfrhv1PF+uLbqFtJnZYZ6nN1I6TvNeRh7a23xh07JBuLO5hXuQk3Vr8m
         rOMSlu0bghxJ2w8u+Gq3I00OkQeWRRJ8S6sxpXMIoS491Ev/Ur1H0E2EWgL8eQuWsind
         yhdC+OVJqqnkZITuH/NqEQI0XEQ68YY4B5w5g=
X-Forwarded-Encrypted: i=1; AL+hErE4Eake+nKePypZeWlIjzSIdo6Dzt3u9yHfnfrPb6E14wDi7xjwZG8m/jn3jsro733g6HEVuYiex+wl@vger.kernel.org
X-Received: by 2002:a05:622a:1b8f:b0:535:fa15:554b with SMTP id d75a77b69052e-55d5a544be7mr53848641cf.14.1795026997975;
        Wed, 18 Nov 2026 10:36:37 -0800 (PST)
X-Received: by 2002:a05:622a:1b8f:b0:535:fa15:554b with SMTP id d75a77b69052e-55d5a544be7mr53848211cf.14.1795026997348;
        Wed, 18 Nov 2026 10:36:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c72sm28241246d6.33.2026.11.18.10.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:36:36 -0800 (PST)
Message-ID: <a97169fe-b537-4f1f-aa48-4e74f7e7195a@broadcom.com>
Date: Wed, 18 Nov 2026 10:36:34 -0800
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
Subject: Re: [PATCH 00/17] ARM: dts: BCM5301X: describe switches and use gmac2
 as the CPU port
To: Rosen Penev <rosenp@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261118054758.132233-1-rosenp@gmail.com>
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
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/17/26 21:47, Rosen Penev wrote:
> This series describes the switch on six more BCM5301X boards, makes
> switch port 8 / gmac2 the CPU port on every board that has a single CPU
> port, and disables the GMACs that a board does not use.
> 
> Patches 1-8 describe the switch ports on the RT-AC56U, RT-AC68U, RT-N18U,
> R7000, EA6300 and Phicomm K3. They also set the WAN MAC address from
> nvram, so userspace doesn't have to. The EA6300 and K3 get an nvram node
> for that. The port mappings come from OpenWrt.
> 
> Patches 9-16 move the CPU port from port 5 (gmac0), or port 7 (gmac1) on
> the RT-AC87U, to port 8 (gmac2). Port 8 is the switch's IMP port, and
> gmac2 is present on all Northstar SoCs. The nvram MAC address moves to
> gmac2 as well. Patch 11 is a fix: on the DIR-885L the MAC address has been
> on gmac0 since port 8 became its only CPU port.
> 
> Patch 17 disables all GMACs in bcm-ns.dtsi and enables only the ones each
> board uses. Boards with a switch node enable the GMACs behind their CPU
> ports. Boards without one enable gmac2. Boards with several CPU ports
> (RT-AC3100, RT-AC3200, RT-AC5300, RT-AC88U, WXR-1750DHP) keep them all.
> 
> Compile-tested only. Every patch builds, and dtbs_check output for all
> BCM5301X boards is unchanged by the series.
> 
> An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
> the series, write patches 11-16 and parts of 17, check the board
> descriptions against OpenWrt, and draft the commit messages and this
> cover letter.

Thanks for doing that work, I reviewed it and it looks good to me, I do 
wonder whether we don't want to just switch all of the devices into a 
single commit because there is not much point to do it on a board by 
board basis, it's easier for review, but not necessarily to manage a as 
a prerequisite for additional work (e.g.: flow accelerator support, or 
preferred CPU port election with b53).
-- 
Florian
