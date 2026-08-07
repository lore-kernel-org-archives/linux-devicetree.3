Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3CB3F4845;
	Fri,  7 Aug 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786138443; cv=pass; b=pSih+Fo+HsvEBHAAOtvd6ygUSmHXFryc7hVkBseCLOvtD3I1dGy4FZTRoBu82ZDJv6d90uJmICfCHwzpmn9Hx5aWFB31VEllvlB65jG+Z1lFxVQ1JpTCyQsrG4RiBkwfVsQN1A14pOyCcSs1IAA5UsMF0X5fZf1ow9aS0GEv/CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786138443; c=relaxed/simple;
	bh=E0XCidknt2UyC69M5kBErZ1ybDGKnlvFTMTa/zbG1mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzdRpGsP8rg1dtrahq64sRtmzgrWNI5BkwLj++bsRlnrsBeq25o2FRAZy9Z5epQol1ugWcFmk3PThgvrx7GcvTu4meZGB3gXv1Jw3wRVYA4gwvDfnMVZXwQb5UBdWzCRPShOrqGcZd1DnkcETk+QnJknwLZZ/NkUKkyHC83HnXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=bJpBgN4X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="bJpBgN4X"
ARC-Seal: i=1; a=rsa-sha256; t=1786138415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wc23WidJGbIWp8Fc9+M+I68bZ4PE3481CJXMH84ECEWzumbc0wNNsxO+/eCvPGGyz2F+4cPGXI8HdocWkO0gPZmjOeJbsHsV3tivVdlZ1T4hTuuGjAeOdpxBPAPvezjK/OQrQeKCbARbZmrM7PAz7WyUYou4xOZx0cBjnJCkBcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786138415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pHBBxbPUVANpahMUOGZWz4stezBioU5NTMq0eeFgIz8=; 
	b=CZ1Zq/UXMOXV8BWTC7lqowJhTyKrjo3mdIzxHp+IVlTuwMdLTo/5yiiidivXnQnMg+7fWe1t0uKVMz3YOSvzRF+Hh4CMSLuWHdGVNgjvaVr3zVVO3IqiWAcYdZtH/QdLs6n8z/WEMVXpu5WPtN/f/OQDO3kfPgZPcd/DEP5998w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786138415;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pHBBxbPUVANpahMUOGZWz4stezBioU5NTMq0eeFgIz8=;
	b=bJpBgN4XzSb+MF16ZgRzB3MeQ8Wh9DbgPv4TJJezvakTcET2asvMlAfgzZLS6roH
	iL2djC89XDNBWidHr7yQ8DpHNX0sW39++lmX8eU9EPOkLbTMnXIgCnsMWK0lgrxgCFI
	yRxOWBaPytGeg/DBKbZtGqe44RrBeNh9EFAAC2l0=
Received: by mx.zohomail.com with SMTPS id 1786138412992223.01443850100577;
	Fri, 7 Aug 2026 14:33:32 -0700 (PDT)
Message-ID: <2f63364d-6653-4f78-ab0f-c75b4fd5bb9c@collabora.com>
Date: Fri, 7 Aug 2026 23:33:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
To: Vinod Koul <vkoul@kernel.org>
Cc: jason98166@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
 <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com> <anSuxfeitSqmSHNr@vaman>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <anSuxfeitSqmSHNr@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Vinoud,

Thanks for your feedback.

On 8/6/26 17:56, Vinod Koul wrote:
> On 03-08-26, 13:17, Michael Riesch wrote:
> 
>>> +      Two cells select the PHY type and the direction, so that the
>>> +      transmitter (DSI) and the receiver (CSI) can be described as
>>> +      independent consumers of the same PHY:
>>> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
>>> +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
>>
>> How is that Rockchip specific? As you state above this is either MIPI
>> CSI or MIPI DSI, two perfectly standard protocols.
>>
>> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?
> 
> I think yes...
> 

Jason, could you incorporate that in a v3?

Thanks for your work and best regards,
Michael

