Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC842233A
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774919931; cv=none; b=nlduCo0EGNhJeRC2NKc7/30bvWBfXGv7HqxpGCTenFFuJYY1r1ngUpsd9Ormd8Dm3fxP5ePAL9j94w2YEzZ7EmqwLHjfdT2Ehma8FkWxisyc2ROnTACeJJsHGEkiWdS/yzbsxS7NBfCGEO4fIL4AoJU0v24nAvETREcu/hFleYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774919931; c=relaxed/simple;
	bh=1JTdtmdA+XjlvOOqxhEU6ANtrvj+USfrL+gX+C8mijw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yv65SOhLhA/CQ0dQd570jiWZRaboC9wakxlFvdnqv9H+blhMlci2QDzalDTGfXgrIG/QTR8y56o29+/Yft6DWgpzSzSTeSZtACovqN10OQTCpX1SHgpcIJ5KSRJApz4wWLA/m1K0zWPTRuGxj24SXOMhBmg3VnJTuvcKgGhcqDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=LruVaVvB; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="LruVaVvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1774919918;
	bh=0owlCERj6gBEP9bncwJSFnotM1/dSDt0HIHcpsl1dUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LruVaVvBsoEiLBNYgBeWUaWALWq1vNRaHLnmxuPQe2aLAa6F861gxk+72249rnO7G
	 GNjnxC3m7kIm+Xnnure8o7ITI6iJcD2SQhKDIOTHY7r+edf+9WzEqtuMAk/AGgR5Bf
	 LLCR0hD+0XJ09QkJaQcGTyIt/8Mpgn/ExhXwSzPE=
X-QQ-mid: zesmtpsz6t1774919917t48c7f87e
X-QQ-Originating-IP: 73VvFKCdPCWg6XgecUK7wdpE0n5+tLRhYX+nOTNzZcQ=
Received: from [172.16.12.51] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 09:18:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10548730784965286243
Message-ID: <AFAEA46A791878B0+9fe68e46-8d8f-44f1-80e3-dfad2de51832@airkyi.com>
Date: Tue, 31 Mar 2026 09:18:32 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Synopsys DisplayPort Controller improvements for
 Rockchip platforms
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Damon Ding <damon.ding@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
References: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
 <FE1BFB774BE13241+54b8a8ce-5a8c-495d-a53f-65a2440924fb@airkyi.com>
 <acphlgK6ZmBitGJL@venus>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <acphlgK6ZmBitGJL@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MCg5+ArSTX6cI8MT6PFu0yIQi8WGXvDbYtc21YFco9cEW1xGKpkQ02lW
	ekFBbF0pGjnmMPIQYO4vm+43naMqCSGNaunE9DywBk+8p0Exos6hW07Mwbi9VmqDtuCT20V
	NnN5ytGBavM78dc/2u0pnOydOaKFxWW/t4rGUJiAqWER4L+/ZrvBe5OfJv014VUz26375qw
	lQG6T1duk7ICrUCqfQhirck/C1cWyppDA50rx2lwNrchWab36G0a1PIo6gzmqwQbtee0hmS
	fVqbMbVWW9aenstVzLG4ZQg9R1HxVfGj2KPeJWTeqs2I8cDrqtyEtxB9eSSJhiReYB90ESU
	yUjgfigv1Sj8ReqJT9ivnJXIRhDMewpfUWWryHCW65330vEGcek/PrgyA/hqDAYyQVs5UBX
	OTnMpoOR9wu7JDhh2rXlkHy9+iYt/QriyIiPuDuZFp1P16E1KALrbCNk1uqKp3Juda4jZdO
	8x5E1i7CfCCV5LD5QLeWfbG6SoNmiZS3eEJmJpg2+P3tATm75BsPfrpvlrF7OWUq5u87C3t
	3ypPApwC3wbvbAuHXvCJzAUx4Ob2OQ80A/YktkOdzzeKL4WGzBWMg/1McUg02T5P+KBBvUx
	+giJ3VGzIwOjwtlOQO8F9gBeRve98RoIUuhSYubteQF8HSXtswqYhfTZg6r0AM9gSNq+jQC
	F854tHOzQj3XD1oRwBrBJy/1LahutftydnfwNNufhq1uTPh89/2r/01bJu5rSg9nLPz93uq
	yV2ntmrj/mBJXTcPNIARmv0wZhC5S37kK1YZ1vb8BBL7W0Qj4WnMRc88trAsr4SrlyCwr6s
	dDn1f2oAx3EatlFVEPgwf0kSM/r3q8g5PCWLL/0t09LgyUDa9lS98uupmxmVmlLtoJXhLbv
	xu2ViGTQPHVsbYgDx0/SYeI2wOtNb2DO9BtTgzkPBzrpmzcXGROeSGR/Zu3YcngvmPVZYBv
	kALnbnAqNTXyTESbGc8GUkVA1maDqShUHo/DEPSfq36xlGmmiDHU5jhPH
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hello Sebastian,

On 3/30/2026 7:50 PM, Sebastian Reichel wrote:
> Hello Chaoyi,
> 
> On Mon, Mar 30, 2026 at 09:34:15AM +0800, Chaoyi Chen wrote:
>>> There are two parts, which possibly need some discussion:
>>>
>>>  1. I added a dedicated bridge callback for out-of-band hotplug events,
>>>     which is separate from the hotplug_notify. I have a feeling, that
>>>     there might be a better solution, but haven't found it.
>>
>> Could you explain what an out-of-band hotplug event is?
>>
>> Can't the drivers/usb/typec/altmodes/displayport.c respond to these
>> hot-plug events? Thank you.
> 
> That is what generates the out-of-band hotplug event in the first
> place via drm_connector_oob_hotplug_event(). The oob in that call
> means out of band.
> 
> If you look at that function it calls oob_hotplug_event() callback
> on the DRM connector, which is then implemented by
> drm_bridge_connector_oob_hotplug_event(). This function calls uses
> the normal hpd handling (shared by in-band and out-of-band) and I'm
> patching it, so that the bridges are aware of hpd explicitly being
> provided out-of-band.
> 

Ah, I'm actually more concerned with the specific types of events.
For example, the "explicitly" provided HPD you mentioned here. 
Isn't drm_connector_oob_hotplug_event able to provide those?

I assume you’re looking for an oob event that is propagated along the
bridge chain, rather than at the connector. Is that so? Thank you.

> Greetings,
> 
> -- Sebastian

-- 
Best, 
Chaoyi

