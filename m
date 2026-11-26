Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657876;
	b=WzWzApxe9VTxMqTcjE55GlIAwpDccch0xDtir7ZQL/RjYPyh25jBv7+K+Sn+9TdYUfpV
	 zbX42yBxaU2yl2NtwBOoiE2H1OnnIFJ7DZXA0R0IP0ZcDLEvWNqsHS1zjgEEOrmKX9fzp
	 YwD0tpCGscGd8H3JO4ZG5lcm3RmrZ0YRiF3+9e+QtL/1E7hpMXEA1P/vOoMsD3F8hCAMd
	 OFkRlOK7V7pHGF+BQeGn4T5ty4wGTHUG2MobFgXwVUzoc2yLyMkrEjJ/KHyu3cdByRAuM
	 yK8knQpgVENDUjo5L8dfnP+3NDAgkCKtMhBYs3ZYDTsv1D4PYvdli5pDKe9g/LIxJJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657876;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=SfN9tjE1qMNBgqH3WtTiy9LIb6nxDFA36oFjP6dk48c=;
	b=NAx+xFwzJQSiY+RHzm6za+IzDR+YH33Xq4Q2JYsRt8FwvY+DdlLV6SVaVyjneVNCBaDp
	 Oah5UmT0ExWnKYakaTXHhWLe0OrhjQiymWB2Rf/s3R42s8NezO21VoeZTjanPRxOESliu
	 WfVsXeBc/QRTvBsASKR1o9DAxg8Q7U36XspeeNXhhfY4hOVqaQQ6xOcwcbT8LbGxEC3Dp
	 rhAWkk3DBRSzfoD0bF8Q+awvP/8mIAFCalmjbbadJCJdeyUj5wpdnKMKQK9qkP2O5feRA
	 /H2XAiKDUnh0K9aEpdQqEnPSzhUXLypMikjtyIkVlN3U2GdaHpA5+nlsWrGYgdBA/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MytotL2R;
	arc=none smtp.remote-ip=103.209.128.9
Received: from mail-m1289.netease.com (mail-m1289.netease.com [103.209.128.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3C606A31E;
	Thu, 26 Nov 2026 01:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B3C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=MytotL2R
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5608936e4;
	Thu, 26 Nov 2026 09:51:03 +0800 (GMT+08:00)
Message-ID: <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
Date: Thu, 26 Nov 2026 09:50:56 +0800
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
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Midgy Balon <midgy971@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Freimut Diener <f.diener@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
 <oJj2NKd1Svmsn320H8YWrg@sntech.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <oJj2NKd1Svmsn320H8YWrg@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2158c924b03a7kunm45f8827fed3801
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk5JVh1ISk1MHhkYTU1LSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=MytotL2RABnbZ7kXKpcgJJfOfMZqqLOZu0eLKudmYI89t89SNQugmLgZi/eApkau5sbmpblihOSnLYLQimqZHDIMdd4wPMbHyTHpARTdbV5fgHpZOR9tnHJIFVyVBzki9SsoXmlRXEG2JzPbDiNVmJxrfFXwNRl64BUOSFBbxpo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SfN9tjE1qMNBgqH3WtTiy9LIb6nxDFA36oFjP6dk48c=;
	h=date:mime-version:subject:message-id:from;

On 11/26/2026 4:37 AM, Heiko Stuebner wrote:
> Am Mittwoch, 25. November 2026, 11:33:57 Mitteleuropäische Normalzeit schrieb Freimut Diener:
>> A Rockchip power domain can have a supply that is required when
>> powering on the domain but is not required to initialize the power
>> controller.
>>
>> Allow post-init-providers on power-domain child nodes to describe
>> such dependencies.
>>
>> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
> 
> Interesting that this exists since 2024 and this will be the first
> user it seems.
> 
> I've looked at the dtschema for it, and this looks really great for this.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 

That's exactly what we want. :)

I guess it's because the kernel doesn't include this part of the
binding, and it's only included in the dt-schema repository, 
so nobody noticed it?

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/post-init-providers.yaml

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> 
>> ---
>>  Documentation/devicetree/bindings/power/rockchip,power-controller.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> index b41db576f95de..d2b512dd95f63 100644
>> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
>> @@ -147,6 +147,9 @@ $defs:
>>            A number of phandles to qos blocks which need to be saved and restored
>>            while power domain switches state.
>>  
>> +      post-init-providers:
>> +        $ref: /schemas/post-init-providers.yaml#/properties/post-init-providers
>> +
>>        "#power-domain-cells":
>>          enum: [0, 1]
>>          description:
>>
>>
> 

-- 
Best, 
Chaoyi
