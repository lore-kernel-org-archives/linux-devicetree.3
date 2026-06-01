Received: from mail-m1973188.qiye.163.com (mail-m1973188.qiye.163.com [220.197.31.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC2385D7D;
	Mon,  1 Jun 2026 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299346; cv=none; b=UQwYUG/I62zbCkpOK4v+3J5ff0kPBA/dUTZNF6USs+9xTYgjXSggq53p1rU3do3Uzjlapz5757ya/OlBADPDEliN4eqI6C2kp2segMB5g+9+lQo4g2LXW7Opzq63wbGIrtCcgmbHqbqSI/gWqF/bOv8i9BFeLLrD6WOep9O+ZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299346; c=relaxed/simple;
	bh=eOrRTGCMi/K69lLtifXOuIuaBbzMYghKQgGFWXL91io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tELJj/T4Z1RiLKfoeztALUJwJU8yrAzCrenyWEQIQ2w/FWq3kyS66ne+KNx97lQcRhLxZ4v3g+IhEUwIvMBVL68i/8nL3dpD+LutrFEyLFSC1eNuRBcdCu9ysKYDwN4jl8vRjGq739tEKLdYLW1Gc6S38oDH3ws+5Zc9UXzbz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=beycXQzU; arc=none smtp.client-ip=220.197.31.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="beycXQzU"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4085afb39;
	Mon, 1 Jun 2026 10:59:28 +0800 (GMT+08:00)
Message-ID: <17160115-6c30-434b-9dab-b768110cd8d6@rock-chips.com>
Date: Mon, 1 Jun 2026 10:59:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-3-damon.ding@rock-chips.com>
 <178014803941.21632.16225608049285101452.b4-review@b4>
 <DIW1WGLL0GW5.1BGU194UXN0HO@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DIW1WGLL0GW5.1BGU194UXN0HO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e811f3b2303a8kunm571bef1e23b414
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUoYVktPSEtLQh4aSE5PS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=beycXQzUpN7FPhJ+fAnFKBz1/vzWYNCiv9XZmeqLZiDZFkrCqTaI560sy9/RjK386Vd55Uvdy77o8wkoVWe8DVjcwK8gjQHQNRMKZ5MguiLr9lmkNp7QbE/7RLqe3MGSIIjEk3btRd0IeXbEkiBb4MwuEV55/9WdY+TB9L3Xc9Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bTGq6JyMOqNz9AcHQ+pp9TTBnC1HlbtzjBlhQULSRac=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 5/30/2026 9:38 PM, Luca Ceresoli wrote:
> On Sat May 30, 2026 at 3:33 PM CEST, Luca Ceresoli wrote:
>> On Fri, 29 May 2026 12:05:29 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> Hello Damon,
>>
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index 8cf6b73bceac..699a7f380c56 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -1260,8 +1261,16 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>>   		 */
>>>   		of_property_read_u32(dp_node, "samsung,link-rate",
>>>   				     &video_info->max_link_rate);
>>> -		of_property_read_u32(dp_node, "samsung,lane-count",
>>> -				     &video_info->max_lane_count);
>>> +		ret = of_property_read_u32(dp_node, "samsung,lane-count",
>>> +					   &video_info->max_lane_count);
>>> +		if (!ret) {
>>> +			if (video_info->max_lane_count == 0 ||
>>> +			    video_info->max_lane_count > LANE_COUNT4) {
>>
>> This sashiko report seems to me valid.
> 
> Meh, messed up with 'b4 review' :-/ Apologies
> 
> "This sashiko report" [0] was about an enum being signed, so '== 0' could miss
> negative numbers coming from bogus DT values higher than 1^31.
> 

Ah, I agree. It would be better to add a new inline function to validate 
that the lane count passed from DT is exactly 1, 2, or 4, just as 
Sashiko suggested.

>>
>> But I'n no DP expert, I have no idea whether this ther one is valid.
> 
> And this was about "Additionally, does this check inadvertently allow 3,
> which is an invalid DisplayPort lane count?"
> 

Yes, the DisplayPort specification only allows lane counts of 1, 2, or 
4. I did miss the check for the invalid value 3 in the current code.

(BTW: I did not find a common helper function in drm_dp_helper.h to 
validate valid DP lane counts (1, 2, 4). I'm not sure if it would be 
better to add a generic lane count validation function to the DP helper 
library instead, to avoid duplicating the same functionality across 
individual DP drivers. Perhaps other DP experts could provide some 
advice on this.)

>>> +				dev_err(dp->dev, "samsung,lane-count = %d is out of range\n",
>>> +					video_info->max_lane_count);
>>> +				return -EINVAL;
>>> +			}
>>> +		}
>>
>> As reported by sashiko, 'count == 0' should be 'count <= 0', being an enum.
>>
>> Additionally I'd avoid the nested if, and I think using dev_err_probe() is
>> correct here (we are only called by probe functions), so it all could
>> become:
>>
>>     if (ret || count <= 0 || count > LANE_COUNT0)
>>          return dev_err_probe(...);
>>
>> There are other sashiko reports to patch 3, and at least one seems valid to
>> me. Can you either fix them in the next iteration or elaborate on why the
>> code is correct there?

Yes, I will add a helper function to validate the valid lane counts (1, 
2, 4) and use dev_err_probe() instead in next version.

> 
> [0] https://sashiko.dev/#/patchset/20260529040530.741336-1-damon.ding%40rock-chips.com
> 
> 

Best regards,
Damon

