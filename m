Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921D3AA1A8;
	Wed, 13 May 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654907; cv=none; b=qJjnqSp+t+1W+hKZFxknObdGorDvfINDg9dgaueTOISkH+QooGIgv8OU+TI1BPVDtRSHMC9a8a7utgMTqpic6+IwWdqvDY8o5o+2oS0HsMLnrc3z2FB9aV9zXHPcnFxeTKWSjXiro6GXyViI9TGgQjKBEUQsYwN0Jhj69bVH2xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654907; c=relaxed/simple;
	bh=fVuwrdv1lLwt4QQNbyCf+ySkRKnVEtyDYck1eDZjBFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHdFn98I30QvMG6Pnf9JlOLiQH7T8djhQfMBBNiW1Cu0ZeOB7wFSIn3vCppko3fgzNGJI6bZM180I4QnLyJ2LReeeKgqdkyIWi1jzwySYOrd45ca1DGtxlOLJSeRDV0IdG33IPt9H0tRhbR/NrHz2NU3f8R+C7cnFfziDB5bIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fGu06w7L; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fGu06w7L"
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e37f556d;
	Wed, 13 May 2026 14:48:09 +0800 (GMT+08:00)
Message-ID: <47836044-68ba-4008-9804-4e44462346df@rock-chips.com>
Date: Wed, 13 May 2026 14:48:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: display: rockchip: analogix-dp:
 Allow hclk as third clock
To: Conor Dooley <conor@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
 <20260512095644.1946084-2-damon.ding@rock-chips.com>
 <20260512-diabetic-ahead-dd36bc2d8be7@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260512-diabetic-ahead-dd36bc2d8be7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e2017c45803a3kunmda73fe6d4e5a4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhMVh5PHxpPHkoYHU5KGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=fGu06w7LYarZjk4xDDCGnJsKDegwnB/bS1kyb6W7f2SAs4MmyJ9sQJcg1RRnVCcOGjwgxXdMZHsKVwJjodu5BpQ+9poNN5kMd5r0f5MKvwV6Fgi35mFC4F1n4mdTlNIVjK4h1itFGaBwSofoHzXSyu2qy15cPJPjxhPHu+GC54g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qXpUJv6v2ZCsI/xZ36aQXcs4nWlhdMEflc6JdPg9XIk=;
	h=date:mime-version:subject:message-id:from;

Hi Conor,

On 5/13/2026 1:12 AM, Conor Dooley wrote:
> On Tue, May 12, 2026 at 05:56:35PM +0800, Damon Ding wrote:
>> RK3588 eDP controller requires HCLK_VO1 (video output bus clock)
>> to access the VO1 GRF registers and enable the video datapath.
>>
>> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
>> phandle reference, which allowed the eDP to work without explicitly
>> managing the hclk_vo1 clock. However, this is not safe or explicit.
>>
>> To align with other display controllers (HDMI) on RK3588 and make
>> the clock requirement explicit, expand clock-names to support either
>> "grf" (for older SoCs) or "hclk" (for RK3588) as the third clock.
>>
>> This makes the clock dependency clear and removes reliance on implicit
>> clock enablement from GRF phandle.
>>
>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Modify the commit msg.
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
> Could you also enforce the correct clock name on a per-compatible basis
> please?
> 
> pw-bot: changes-requested
> 

Yes, will do in v5.

> 
>>   
>>     power-domains:
>>       maxItems: 1
>> -- 
>> 2.34.1
>>

Best regards,
Damon

