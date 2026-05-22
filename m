Received: from mail-m3290.qiye.163.com (mail-m3290.qiye.163.com [220.197.32.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E81F151C;
	Fri, 22 May 2026 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779413427; cv=none; b=OvPHaIYvBclK2e5QeYwz1b/cRqpBpglKw5S3fvEkXypPSv8b2WdNk+v8CInFiwuN3JqUjLnoWaJxkc4VkmMyBHKwP5n+b0T87pFnoOg3NNV5IjjLN23QlWa3CDGaEIHBd6d3q3e+DldYReo5k1CL5nRhAJOW6O1uYdbfcJJtR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779413427; c=relaxed/simple;
	bh=uqr9OSbQ+bd5dtQMJntcCP86aHKH20d6xdiS0ANBLqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEsqngxuZptHtJKtgPClv9zU0vioJ9N4vzzUAMutx6HpMKtR6b3tPiQpzuBxYos86avcu6mf4ht4jojYAeMT3plCgk9mwmAvoz9PfZ+esH/ZlRlApK0kJmKhLyaUwwtClAzKDC8eF6OhmWSnsqIUmZUZh/Jk726iVytxI9O8WqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GnvlT/xB; arc=none smtp.client-ip=220.197.32.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GnvlT/xB"
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f5fceca6;
	Fri, 22 May 2026 09:25:09 +0800 (GMT+08:00)
Message-ID: <959f90d0-a97e-41f2-b39c-97465e906700@rock-chips.com>
Date: Fri, 22 May 2026 09:25:08 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: rockchip: analogix-dp: Add data-lanes
 example
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
References: <20260521114459.1394264-1-damon.ding@rock-chips.com>
 <20260521114459.1394264-3-damon.ding@rock-chips.com>
 <20260521-powdery-tux-22a7cf4fadc3@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260521-powdery-tux-22a7cf4fadc3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e4d494c0303a3kunm0428e0bca4f9b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxpIVk8dSB1DS0NJTxlDGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=GnvlT/xBYOdkN9DU1iEt20bXPIo8qdooBfyzFMQY8127vD1w+oeiXdZNszI+FwxKWmNnMLyy7YaSJS+FA/2UIC2njnzt66dgeKAwTfsgzkSJk1Acbr0R4GM9yO6HuaKAHwmCWEYBDEatI0Y/F/Ah0M8H19iQqc4vGHhmxJI0Vl8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=or1x9VMxHGuaR+KEDTWJh5vt8U96cHrmYFhV8rlbjwo=;
	h=date:mime-version:subject:message-id:from;

On 5/22/2026 3:47 AM, Conor Dooley wrote:
> On Thu, May 21, 2026 at 07:44:58PM +0800, Damon Ding wrote:
>> Add data-lanes setting in endpoint example to show actual lane mapping
>> usage.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> Squash this with patch 1.
> pw-bot: changes-requested
> 

Yes, will fix in v3

Best regards,
Damon

> 
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml          | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index bb75d898a5c5..cf75c926318b 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -151,6 +151,7 @@ examples:
>>             reg = <1>;
>>   
>>             edp_out_panel: endpoint {
>> +            data-lanes = <0 1>;
>>               remote-endpoint = <&panel_in_edp>;
>>             };
>>           };
>> -- 
>> 2.34.1
>>

