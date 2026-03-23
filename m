Received: from mail-m32105.qiye.163.com (mail-m32105.qiye.163.com [220.197.32.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA11382F06;
	Mon, 23 Mar 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256091; cv=none; b=N8wZnJ0l/bCRSge/jo7Vwah+X9EnAebXh2WCspIyOIftX19PA+ruOcsjRfsN3AkQYI9LFpwlUHscqqNPIZS4zIMojEomHcpOQ6NMPduEjT2MU9gtrbCBg5HMQ1qmjvRAWfGPPD2fEkUQRKISZTiygpwFKmJBrLvjcUH7wgFJR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256091; c=relaxed/simple;
	bh=XqEcQ5qu5J8RP12/dZgidiu1Ea39jfaYPY1FA5JyaYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o4IJtk8FCZHEbBkfbpUkYKXRSYAnhtes8uAAX1jnriaY0gcRhZBv2Y/m1mnPc5OXKy/i9QFrPNDufL9c27n7Vtsd8J4KWayPlsBWOYSSGdr4gFO6CSIXNJ3jn5HiIeHSoRhTkfg1z+6+zawRYwIOnPNld3dKY7o6hrTmsCurTgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=g2PMVctn; arc=none smtp.client-ip=220.197.32.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="g2PMVctn"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37ee42d36;
	Mon, 23 Mar 2026 16:49:17 +0800 (GMT+08:00)
Message-ID: <6bf2b3c9-4af0-4c3a-a34f-ebe881d4827b@rock-chips.com>
Date: Mon, 23 Mar 2026 16:49:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: display: rockchip: analogix-dp:
 Expand clock-names "hclk" for the third clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-2-damon.ding@rock-chips.com>
 <20260320-amusing-magnetic-harrier-20cc40@quoll>
Content-Language: en-US
In-Reply-To: <20260320-amusing-magnetic-harrier-20cc40@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d19e2599003a3kunm591f097f5835d6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpNHlYYQkNMGBhCTk8dTR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=g2PMVctni+Tmi1H13vX7/jpuctiAQOf9jIaWSgTfnOYJqHwPB9HoWdBuyJLBQ6dIQ8CEIuDajcV//mZDKrb1T3pFZBYBR0LVLWovKpqvDMWK6z/LFlUVxrCoPINCdPXEbMd+SONHAoVmxQ7HG9fdGKjnUPgqgmfBZ5D8KucIOO4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Z7sLiwhoVXpTk/aVRfpLSAb5QwlvL/VqB3G80sqReiU=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 3/20/2026 5:19 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 19, 2026 at 06:40:23PM +0800, Damon Ding wrote:
>> The RK3588 eDP controller needs the video datapath clock "hclk" to work
>> well. Previously, it works without explicitly adding this clock because
>> the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.
>>
>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc5..d2bc8636b626 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -26,7 +26,9 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - hclk
> 
> You just told me it is the same clock, no? I asked that and you
> confirmed? Or you replied with an answer not relevant to the question?
> 

Aha, I may have misunderstood your earlier advice as meaning that since 
the RK3576 and RK3588 platforms share the same design, their clock 
dependencies should also be identical.

The 'grf' clock and 'hclk' clock are different.
On RK3399, the GRF clock is for accessing VIO GRF registers.
On RK3588/RK3576, the eDP 'hclk' is required as it is the parent clock 
of 'pclk' in the AHB bus topology.

> If this device takes reference to grf, why does it also take grf clock?
> Devices MUST NOT take clocks on behalf of other devices, so please
> answer with a list of all clock inputs according to datasheet/manual.
> 

On earlier platforms, the GRF was not partitioned into separate 
functional small GRF units as on newer designs. Therefore, the 'grf' 
clock was designed as the clock dependency for all relevant modules.

For RK3588/RK3576 eDP module, the list of all clock inputs is:

CLK_EDP0_24M: Reference clock.
PCLK_EDP0: AHB clock.
HCLK_VO1/HCLK_VO0_ROOT: Video datapath clock.

It would be better to add above comments as the descriptions of these 
clocks in yaml.

Best regards,
Damon
