Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3530B51D;
	Fri,  3 Jul 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097989; cv=none; b=iNLPmvP7XulN0smVZqPgLrFqhnGodyGzv8PjP49AIYxLm8rZOui0vq4nPrErLZ7EJ59CSjhSuMo08QreSzBWUybdcy7+ggoo7zGBbD+FSh8QUQyHxIpOoyhVVfA1ft0bFur9wA3UiB1X3ZCsW2xrXXHbDny+PaN9N6tXSN5CgnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097989; c=relaxed/simple;
	bh=Dhy4gvLT0RAnGvm4Qciq67SI7sUn4Qp1DNRguSA4Rcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRUjKG6hEdgREr/ILmGizO/1KE471iq7WNIXK3THiE1cPsBN90bAcIZhMO34sIgD8rliCt3vquE+dqrKpfbrwEgPIA1R7K4EL3pUZdf0kSQ6yN0wV7Xshzj34QOI8TtIoDNsMN+x8HlFmwxj0LvaoRcSN39zVVF9wTwCvoIiAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nJd6/ih4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nJd6/ih4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783097985;
	bh=Dhy4gvLT0RAnGvm4Qciq67SI7sUn4Qp1DNRguSA4Rcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJd6/ih40hiWEhn4ndj338VwFyT5SxADffzqSTjv1GQ5me0AH4Mj17WymraBfs+t/
	 r5GGKZ4aL8Tow2C+NPSJhmYYVE5jc8dNI+pq7pn2xeqyIqZaFc0+AT+VP4hhrndqmx
	 RZH5/XifxgE5MXgQvzXY0bL00xaiScLbPsKviaa4biXtRCgtTWQ1LRbKxdaAO8vh4c
	 vFeEhuh52yIuwJ9INcJJC/MsS0C0gxf7stzwfxbLzKvut59k3ZLy5XdVxXX7PCQpbq
	 CBgkhxWhD17uony3610weO3dBkZHxQph+StpRo70GCInYK0K4cKEHlrvZ/jxJI/Bqj
	 IFdD4qkXS6vNg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3DB217E0521;
	Fri,  3 Jul 2026 18:59:44 +0200 (CEST)
Message-ID: <deb7bdd8-f9d0-43cd-9de0-82e80351a739@collabora.com>
Date: Fri, 3 Jul 2026 19:59:44 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Diederik de Haas <diederik@cknow-tech.com>, Sandy Huang
 <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <DJC0L3CRJ0WL.IZEYVLPROMM1@cknow-tech.com>
 <fe8038fe-940a-4c61-a551-082534ef9c51@collabora.com>
 <8183064.gsGJI6kyIV@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <8183064.gsGJI6kyIV@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/26 7:37 PM, Heiko Stübner wrote:
> Am Donnerstag, 18. Juni 2026, 10:39:14 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> Hi Diederik,
>>
>> On 6/18/26 10:58 AM, Diederik de Haas wrote:
>>> Hi Cristian,
>>>
>>> Thanks for this series :-) Just 1 nit (at the end) ...
>>>
>>> On Wed Jun 17, 2026 at 8:52 PM CEST, Cristian Ciocaltea wrote:
>>>> Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
>>>> clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
>>>> provided only on RK3588.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++++++++
>>>>  1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>>>> index 93da1fb9adc4..d3bc5380f910 100644
>>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> [...]
>>
>>>> @@ -289,6 +321,16 @@ examples:
>>>>                                "dclk_vp0",
>>>>                                "dclk_vp1",
>>>>                                "dclk_vp2";
>>>> +                resets = <&cru SRST_A_VOP>,
>>>> +                         <&cru SRST_H_VOP>,
>>>> +                         <&cru SRST_VOP0>,
>>>> +                         <&cru SRST_VOP1>,
>>>> +                         <&cru SRST_VOP2>;
>>>> +                reset-names = "axi",
>>>> +                              "ahb",
>>>> +                              "dclk_vp0",
>>>> +                              "dclk_vp1",
>>>> +                              "dclk_vp2";
>>>>                  power-domains = <&power RK3568_PD_VO>;
>>>
>>> Place reset* props below power-domains (like in patch 9) ?
>>> So everyone who copies your example has the correct sorting order.
>>
>> The example doesn't strictly follow that ordering either — see e.g. the iommus
>> property — so I placed the resets right after the clocks, which keeps the
>> related properties grouped together.
>>
>> That said, I don't have a strong preference. 
>>
>> Heiko, is there a convention you'd like the Rockchip bindings to follow here?
>> Happy to reorder if so.
> 
> Please just use standard devicetree ordering, as described in the
> documentation. We generally don't want to invent new diverging things :-)

Ack. For consistency, let's also move the iommus property up into the expected
position.

Thanks,
Cristian
