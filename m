Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061242586B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444624; cv=none; b=b4dkBlxlIet/HJYKJnQWr8VFvTJeDHGs+VFVOo9HYO/e0ln5DWrhyw5GZZ3qK4lcwCLv7xC6GiN/AwozokVUw6NA4XIHW+0GUq4CI87f4ZIRvv8MHYpJF+5EQA8M5mQea67jc7Vq5yVZbyIU2Be1YIMrCAbFAP35UXtv/8T5L1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444624; c=relaxed/simple;
	bh=gB3yqOeIsaaKzEUsb9uO6DUqNT2MwS8x7bL5ueDtyjI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uB6RXNebUJm/Dpj3cyRzW5Bq785JL+Ed4e/yIIXmuiFrW9n+u5dOXJepejZ0nFY+UdUF1SfvrgQF5Y1fDntm4LWl2QynrMN8fQfFuCdiOsw3IipldChG9WT6ucpw/ySB1xeznsPF5ERkoGY/LfP3ebF4fTNJhVv2hxblYmSMORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNt4R8BC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LmxUUEk4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNt4R8BC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LmxUUEk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786444621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD4hJ+lUljz5+S3ejOLlVQpGKrh+mo85PPvj3j6hOww=;
	b=DNt4R8BCwz1N2vDrcv5WyHRC34Nbg6EXF/CwXno/xrS5TxnLXRh2K2cdbqWfvoNNKjlrJ5
	iXYvMRcL+RjHbvhRo7+x9LYy+ptWpyFx/Ev21b4mz+zPYIuUBLEx2oogwHT3lmKrnNqkp0
	fwyUWigmyVTntPYlB3q0+tswjim2tA4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-6piv24RLM8CFUM147cWy0A-1; Tue, 11 Aug 2026 06:37:00 -0400
X-MC-Unique: 6piv24RLM8CFUM147cWy0A-1
X-Mimecast-MFC-AGG-ID: 6piv24RLM8CFUM147cWy0A_1786444619
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47fd4ee0ac0so2237106f8f.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786444619; x=1787049419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jD4hJ+lUljz5+S3ejOLlVQpGKrh+mo85PPvj3j6hOww=;
        b=LmxUUEk4EnHmWvMUg3gdxOJWWuHYPjBxdR39/p09puAzxglBClP6uAvtdgOeWQ3aez
         ym67dt/FTmsLzDIfiRGZJEk5eu0sMAoPLRV1+7zeCaR7fxmSgO8sonqYmRABrX4yahOg
         T1qsPRqGI8DPuSaBp4t74Xfyv8bqAjZsJAtTU0IPMVMyqC95ku2somTGLa9EGozfliil
         AHAweU+L0iJeID421i9jJph941V3LJ1CsYNI+96o97Ngl5f03J6Uj9ZkB8v0mfwqDtUC
         1ZOxA/y9Rkt8u1JrY4C8HPQi+BmEgdK/RHkwCCMqyIqtQpkfo6Z5i/VGdaqYMXfBjx4o
         t6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444619; x=1787049419;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jD4hJ+lUljz5+S3ejOLlVQpGKrh+mo85PPvj3j6hOww=;
        b=QKQHXUQrb+CeQbueIcG14oqlvWekOVKpFlKtn7h+v6q5Cjr+5RZuDONo39QFG3m2N9
         YSUE+hKNyOuBpOYPZfTWFNPpxWHsqfprw4YizM2mHmaRsKYp5f8DOiSErtACG2tBc2hL
         vHFLcrVVZkHc6fIhP00YuKanTi1acfjBZesDRrQoutkdZY47xb3FOnx05IyXUGOgy7Bx
         b4tu5jrAI9d0B69GLh6oRn/wZCCKdiQHpDorf9f9NL8vBG5seKD+wQz2p8bhwWQ2W5NU
         kAm6SjNA1jSRzyckyhdTzVUGTDbBe7WPUK8reMf05eyRshDSJR55R+p7++zR2T89Khrz
         Do9g==
X-Forwarded-Encrypted: i=1; AHgh+RrfYN6tLgYRDd/haDqPeixKGMCUT9/gZIp8gGL6rPuriOMJ42RhcvnPwwRtOv2ZeNlJFpYU++/GuupL@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJ2VxiN6lGHEOpL5b3gtmNAE81sgGDYRyRz5jIcdqs1U+ZfmG
	+ChHhgzc2Hz9slKGrb0O7ALgPqEbxUhXvosO5Shw9LnpsoXIaw4MdpERjs3m7z2lA3GqjWYHXQP
	FlpKKNotDHcW6epoumaRun9Zrj9hTfEby+5w+y4AkFYx4fnH6KiBzm7lpQomtksM=
X-Gm-Gg: AR+sD10VZKaxiB6O5M/NqWK+WI3ekB90/jqzPx/Ko3LdzMOWi9f60/d4J8htMq9aiTR
	H8kSCFpQhQKwgZ3EL7YM5w8NyMjsVdl9ZZ+KhaQe1Es5/IvGDT9XewaEVbkgZM/Jzcvbq4XD2hu
	4tMUfB0qScve6churHOdqBKKonk7vOMZmLK3ipxlq9N7Q4YCdUg0D0a7EqE7X+eO21U7NQyd1b2
	Xi9s86akWSvXa4jZCHzeVMQny4XtRmCDANe254lJI+1dApy4V41NNfiWe1QcuC6ELA49HGLZZG6
	KaICrMIhrr/7x8d6zGYklYSjkq0yM6Xur+2jcSWpCkuq2XQp0SrltLFnToCcVvWKiiTjSSkJ1w6
	vsmGl+DtpLZIIxa7Zq0sxcy0ELX1cUnnrE9U5YkN0zRjoJPa98HKdCZUUAZ/2vYrJ52FgIaiFQ8
	s=
X-Received: by 2002:a05:600c:310f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49978439635mr27492885e9.5.1786444618969;
        Tue, 11 Aug 2026 03:36:58 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49978439635mr27492175e9.5.1786444618470;
        Tue, 11 Aug 2026 03:36:58 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm33743245e9.1.2026.08.11.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:36:57 -0700 (PDT)
Message-ID: <2699d4d2-fb2e-4f87-9a41-88627f16fb78@redhat.com>
Date: Tue, 11 Aug 2026 12:36:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 0/9] net: dsa: add DSA support for the
 LAN9645x switch chip family
From: Paolo Abeni <pabeni@redhat.com>
To: =?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?=
 <jensemil.schulzostergaard@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <16b71fd7-9911-429b-a5a0-577f6ba0e999@redhat.com>
Content-Language: en-US
In-Reply-To: <16b71fd7-9911-429b-a5a0-577f6ba0e999@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 12:35 PM, Paolo Abeni wrote:
> On 8/5/26 4:34 PM, Jens Emil Schulz Østergaard wrote:
>> This series provides the Microchip LAN9645X Switch driver.
>>
>> The LAN9645x is a family of chips with ethernet switch functionality and
>> multiple peripheral functions. The switch delivers up to 9 ethernet
>> ports and 12 Gbps switching bandwidth.
>>
>> The switch chip has 5 integrated copper PHYs, support for 2x RGMII
>> interfaces, 2x SGMII and one QSGMII interface.
>>
>> The switch chip is from the same design architecture family as ocelot
>> and lan966x, and the driver reflects this similarity. However, LAN9645x
>> does not have an internal CPU in any package, and must be driven
>> externally. For register IO it supports interfaces such as SPI, I2C and
>> MDIO.
>>
>> The chip supports a variety of network features such as
>>
>> * Mactable for MDB/FDB functionality
>> * Bridge forwarding offload
>> * VLAN-aware bridging
>> * IGMP/MLD snooping
>> * Link aggregation
>> * PTP timestamping
>> * FRER (802.1CB)
>> * Media Redundancy Protocol
>> * Parallel Redundancy and High-Availability Seamless Redundancy
>>   (HSR/PRP) in DANH/DANP mode
>> * Per stream filtering and policing
>> * Shapers such as Credit Based Shaping and Time Aware Shaing
>> * Frame preemption
>> * A TCAM (VCAP) for line-rate frame processing
>>
>> The LAN9645x family consists of the following SKUs:
>>
>> LAN96455F
>> LAN96457F
>> LAN96459F
>> LAN96455S
>> LAN96457S
>> LAN96459S
>>
>> The difference between the SKUs is the number of supported ports (5, 7
>> or 9) and features supported. The F subfamily supports HSR/PRP and TSN,
>> while the S subfamily does not.
>>
>> The intended way to bind this driver is using a parent MFD driver,
>> responsible for the register IO protocol, and distributing regmaps to
>> child devices. The goal is to use the same approach as the MFD driver in
>> drivers/mfd/ocelot-spi.c.
>>
>> This driver expects to request named regmaps from a parent device. This
>> approach is similar to the DSA driver
>>
>> drivers/net/dsa/ocelot/ocelot_ext.c
>>
>> which supports being driven by an external CPU via SPI with parent
>> device drivers/mfd/ocelot-spi.c.
>>
>> The MFD driver will come in a later series, because there are
>> requirements on the number of child devices before a driver qualifies as
>> a MFD device.
>>
>> Development is done using the LAN966x as a host CPU, running the lan966x
>> swichdev driver, using the EVB-LAN9668 EDS2 board.
>>
>> The datasheet is available here:
>> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN9645xF-Data-Sheet-DS00006065.pdf
>>
>> This series will deliver the following features:
>>
>> * Standalone ports
>> * Bridge forwarding and FDB offloading
>> * VLAN-aware bridge
>> * Stats integration
>>
>> More support will be added at a later stage. Here is a tentative plan of
>> future patches for this DSA driver:
>>
>> * Add LAG support.
>> * Add MDB support.
>> * Add TC matchall mirror support.
>> * Add TC matchall police support.
>> * Add DCB/qos support.
>> * Add simple TC support: mqprio, cbs, tbf, ebf.
>> * Add TC flower filter support.
>> * Add HSR/PRP offloading support.
>> * Add PTP support.
>> * Add TC taprio support.
>>
>> For completeness I include tentative plan of planned patches for
>> LAN9645x peripherals:
>>
>> * Extend pinctrl-ocelot for LAN9645x:
>>   https://lore.kernel.org/linux-gpio/20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com/
>> * Add driver for internal PHY:
>>   https://lore.kernel.org/netdev/20260123-phy_micrel_add_support_for_lan9645x_internal_phy-v1-1-8484b1a5a7fd@microchip.com/
>> * MFD driver for managing register IO protocol and child device
>>   initialization.
>> * Extend pinctrl-microchip-sgpio for LAN9645x support.
>> * Extend i2c_designware for LAN9645x support.
>> * Add driver for outbound interrupt controller.
>> * Add serdes driver for lan9645x.
>>
>> Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
> I forwarded the feedback from sashiko/nipa, but sashiko gemini has more
> comments:
> 
> https://sashiko.dev/#/patchset/20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a%40microchip.com
> 
> please have a look and also to net-next commit c82ff94592fb

Whoops, sorry I missed part of netdev traffic. Please ignore this one.

/P

