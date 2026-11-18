Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996493;
	b=XPZq9kYS3lBCPcFbpy2zW/uiD8k6NZb+TSAIdC7ueB8iwFbzarETh5LfN0PMwHfK/Lmm
	 ucIDN0d+VH4lQvbctDHX0AB55PPgh/3x5IXfpLYPU2KEuwqM0kaFIzuxFv3Y6T7lSUzEm
	 rmRfs2kUPl8q1dqFYr4pCrNFmEPWynZWH+kM+1jSAgaTjnGQVnXPWhgUmD54FhOIamwSq
	 XIPTdvsQSyNeUk6joHgxxFVNfPhIFjsK5liS8s6kKfSMjUCXeqK+adQHM0pA7b2frdIb9
	 7D0Y+2+V4rCnPIO+1d4CRNA4C+W20wdkPsGuo2bTQSBwXlKUznCJwlKmHlvdcpamkNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996493;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7zhgK2cftjiTzkt87l4mZkq8xI6jhkpMgB4GLzuXArw=;
	b=QIg+LWW3XBzYcaCvd1vlrk9a1mXV3DQ4wqh+hcbfJwWQybmexxtXXp7sLW/J9mL8UfyQ
	 hi0nt9ra+XkIzAJOY5vVFxMpgpHrIm3VPog+zvejmShheu4LE2CR/Begu1V6p4n6rWEfz
	 TnN7ZmvpAyN0CMtPDIQi1d7/Vos2NhtUbLA+EswBdX0kPeJ0yvG3C+Z9VYzQGB567M8BU
	 2yhBQyB7Y/hQMgZ072BpoglgtOURaW5zAWZbFlXXSGZYPwgcF5hkVW5SHmTkvu3LOk4UB
	 rsbBMqrki2GeRxOcMmej0TtKfkZi6Z7aqYkqeLGK7GBUA8y+YovDCpcY8C6BHtiFDnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYBjfuJG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4F606A33D;
	Wed, 18 Nov 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYBjfuJG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728631F000C4;
	Wed, 18 Nov 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996492;
	bh=7zhgK2cftjiTzkt87l4mZkq8xI6jhkpMgB4GLzuXArw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DYBjfuJGrCXQ5e9ujie/dO4L0JQvm+DUcbp2mc5xLpc6ZPVBjs3Ks40ccoAIAn5jE
	 S064t9CjDeHB7T3eD57yk2dXCKfnBCc6wRIq+ITEIAdxG1oGk9NZkCCWhJODWp/Dbs
	 ITgEHQZfxngWJpcYEVO0uKaZyWR9UqTt0PUJ0E5rvoLarq2wbkWgaUzYyw+1OA4UCO
	 AefOBHsv0F+y8WwxpSM6ztttoWEsueqP42lDnMak+TZEkavGJ0n0yZQjCg7eQsioGi
	 50KaZEwibq/raNQbq8BnQ6SOqDX6nGbphDC99VEYumkuZNFqFD7zuwP4HwACP0Jmwm
	 S/Z+52+/5aPjg==
Message-ID: <fceee6fa-2bfb-4676-b5ac-80e1bae8d4f4@kernel.org>
Date: Wed, 18 Nov 2026 11:08:06 +0100
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
Subject: Re: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com>
 <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
 <fe324e43-50c4-4f0e-9bb0-57ea7172530b@cherry.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <fe324e43-50c4-4f0e-9bb0-57ea7172530b@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2026 10:28, Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
>> On 18/11/2026 06:55, Jason Yang wrote:
>>> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
>>> for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
>>> can use the transmitter and the receiver at the same time. The single
>>> cell of this binding selects the mode and refers to the transmitter, so
>>> the receiver cannot be described.
>>>
>>> Change the cell to select the transmitter or the receiver. The
>>> transmitter and the receiver cannot operate in different modes [1], so
>>> the optional phy-type property of the PHY node sets the mode for the
>>> whole block, D-PHY by default:
>>>
>>> 	/* the MIPI DSI host, driving the transmitter */
>>> 	phys = <&mipidcphy0 PHY_DIRECTION_TX>;
>>>
>>> 	/* the MIPI CSI-2 host, driving the receiver */
>>> 	phys = <&mipidcphy0 PHY_DIRECTION_RX>;
>>>
>>> For C-PHY the consumers stay the same and the PHY node gets:
>>>
>>> 	phy-type = <PHY_TYPE_CPHY>;
>>>
>>> Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
>>> valid as deprecated values. They select the transmitter and imply
>>> phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
>>> changes for them.
>>>
>>> New DTs on an older kernel: an ABI break. The older kernel ignores
>>> phy-type and takes any cell value as the mode of the block. A DSI node
>>> with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
>>> PHY_DIRECTION_RX gets no camera.
>>>
>>> [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
>>>      operate in the same PHY mode."
>>>
>>> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
>>> Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
>>> Signed-off-by: Jason Yang <jason98166@gmail.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>>> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
>>
>> Please drop the tag, this did not happen. In the future, please add only
>> applicable tags. Otherwise share how this code was executed and tested
>> on the actual hardware (make process, like building code, is obviously
>> not testing).
>>
> 
> What did not happen? I tested the v6, on the reported hardware, on the 
> reported two DCPHYs, see 
> https://lore.kernel.org/all/840285d6-a8a6-4777-8d38-6758ccbc7723@cherry.de/


I comment in a specific place in a specific patch. The testing of this
patch did not happen, which I explained why.


> 
> If you're complaining about the Tested-by being given to a dt-binding 
> patch, it was provided as an answer to the cover-letter, and the 

I know. Tag was applied blindly and that I ask to correct.

> contributor is clearly using b4 considering the last few lines from the 
> cover letter (base-commit/change-id lines). b4 trailers -u applies the 
> tags given to the cover letter to all patches in the series, so if 
> there's someone to blame here, it's me for adding it as an answer to the 
> cover letter. So now the question is, do you want me to add a Tested-by: 
> to each individual patches of long series when I technically built and 

The comment was not to you. I responded to the contributor and I expect
the contributor to act, not you.

> tested only based on the last patch of the series, which is only a DTS 
> patch adding the nodes to the RK3588 DTSI? In that case, I cannot 
> provide Tested-by for patches before the last, as it can simply not work 
> at all until the last (actually all of them, except the bindings) patch 
> is applied.
> 



Best regards,
Krzysztof
