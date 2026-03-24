Received: from mail-m49215.qiye.163.com (mail-m49215.qiye.163.com [45.254.49.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5614884C;
	Tue, 24 Mar 2026 06:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332766; cv=none; b=W2qIHvadSrdkPnL5vEgRo9I+TTCHFKOie3ZiJGAqCk/40Kpd+TdtDI1k2MJBW4x1IGdnyIf7idQUISqoT42SnW0gOUfHB+f3/FDcbH4Hl69nTPGKS020av6jQEAdACBF9WqFTrc78ih6TdMge+CKbOexmXRGeDO4S9LXGIzs1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332766; c=relaxed/simple;
	bh=CIa39CPYDdtyJGejVMCKANo53F5Ml1n+YKV16aTUV/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qT0PtJSGhbZg+8u/qNgNZu/s5vY+kbWN9FM6+jndubABMNIs82Iv6UXqxo0rtkBGSBi6diSQQseI5wilb497EiuuSaJ+6LfijAf0NOX4+SriVE+/ES8G3YGO4yWax27Em+Q5N/Hh9FvZ6eBug8SowWriPSY3IS1EmS66e0ry4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=d4PGSr2b; arc=none smtp.client-ip=45.254.49.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="d4PGSr2b"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 380ef77a7;
	Tue, 24 Mar 2026 14:12:31 +0800 (GMT+08:00)
Message-ID: <42c0641f-2e37-4ca4-a1ae-e8fde24c8460@rock-chips.com>
Date: Tue, 24 Mar 2026 14:12:31 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-8-damon.ding@rock-chips.com>
 <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d1e792c7403a3kunm954b2488614efc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoZQlZKGkNMTU9OGR8aSk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=d4PGSr2b6bn1E0a78TIiBAHMJrN8AADAEpH+/KsURXWM9e0LXjFYM2ghRcKsjmiMIWmAco/kQcu1H3h4mGFifMUqIGfPZho713TMKNVTVVr8bCYlNu9Ae1IZThaNB1wk3ywC5fTQaj1q7LEs+jZsYt6koSt5zpyBAhM3Td3ayvc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=43b6SjPsKc9g6XHmllwsbhvYMGH2v0JIJbnJ7A+toKo=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 3/24/2026 12:14 AM, Luca Ceresoli wrote:
> On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
>> Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
>> and readability, and simplify the code with switch.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The patch content is OK:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> However this won't apply without [0], correct?
> 
> So, worth mentioning in the cover letter that this series depends on the
> [0] series.
> 
> [0] https://lore.kernel.org/all/20260319071452.1961274-8-damon.ding@rock-chips.com/
> 

Yes, I will add it in v3.

Best regards,
Damon

