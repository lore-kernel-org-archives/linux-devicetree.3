Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3692248F4B
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 21:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174185; cv=none; b=t+RU7j/CnpuGtv2Pzs/RGOxpuQKMVy4HjHJxxtA5/kU4Z6MaFpXSlH0i9PM/k25mAhAOA0A+Lb12ZrM2Oj5LvKnkv2IypFS+bb0w/gfXghQHmgSO8h0CqBpOGvtX+9+U2GM5O8U+sRPvezPWdh9PJkr1SARRGV3OOGJ98erdVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174185; c=relaxed/simple;
	bh=DQKnKfj15t5G/xxNfos2zBkkB/DcPAwgAfXZn2ydPuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pL3TIStEagne4yrzvOHTOnkrsfm3bPRaTpCw7MPBA3OSUhCjWtoI8JZf7Ioxun+T/UfL9hnLzBDCGt4Z2C9zsMKqt7GZJmGx+9p0131I8DlkZTwtIc7CVj0k+mOvhTNuulpw8Z4C90FCBl7sV9ro32nSx7E+qt67Hf3wrE+kJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VFD19w3d; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VFD19w3d"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DQKnKfj15t5G/xxNfos2zBkkB/DcPAwgAfXZn2ydPuY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787174180; v=1; x=1787778980;
 b=VFD19w3dMrTHhJ7cPRPUxoQ+viiJlj6SgOmAaHGJGu9FGa0SycWakakrWmzO9MJQtoftWtS7
 5Ko5PlW9qOPPnAdOmeDSWDe/468cF5P93tYGrV529106S3CCPUlSPBDYe7PfdmngS6xYLRW9Vqt
 rcMzea2b5XRE8ghYMq1wN2so=
X-Envelope-To: devicetree@vger.kernel.org
Received: from [192.168.1.24] (109.76.127.113)
	by smtp.migadu.com with ESMTPS id e914fa40502dc47c;
	Wed, 19 Aug 2026 21:16:20 +0000
X-Mizu-Trace-ID: e914fa40502dc47c
X-Migadu-Flow: FLOW_OUT
Message-ID: <6a529684-bd6a-4187-9ed9-bb40f4b98065@linux.dev>
Date: Wed, 19 Aug 2026 22:16:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
To: Ali Rouhi <arouhi@sitime.com>, "jiri@resnulli.us" <jiri@resnulli.us>
Cc: "arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "cjubran@nvidia.com" <cjubran@nvidia.com>,
 "Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260815221919.64226-1-arouhi@sitime.com>
 <20260815221919.64226-4-arouhi@sitime.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260815221919.64226-4-arouhi@sitime.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2026 23:19, Ali Rouhi wrote:
> Add a DPLL subsystem driver for the SiTime SiT95316 and SiT95317
> clock generators. These devices provide low-jitter clock outputs
> commonly used in telecom, networking, and data center timing
> applications.
> 
> The driver exposes all inputs and outputs through the Linux DPLL
> subsystem, supporting:
>   - Lock status monitoring via register polling or optional INTRB IRQ
>   - Input priority management for automatic reference switchover
>   - Per-output frequency readback from hardware state
>   - Phase offset measurement via TDC (time-to-digital converter)
>   - Phase adjustment for fine output alignment
>   - Embedded sync (esync) pulse control on outputs
>   - Fractional frequency offset of the selected reference
>   - Optional reset-gpios for hardware reset
> 
> The driver reads all configuration from the device's on-chip NVM
> at probe time -- no firmware loading is required.
> 
> Co-developed-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> Assisted-by: Claude:claude-4-opus [chat]
> Signed-off-by: Ali Rouhi <arouhi@sitime.com>
> ---
>   MAINTAINERS                    |    7 +
>   drivers/dpll/Kconfig           |    1 +
>   drivers/dpll/Makefile          |    1 +
>   drivers/dpll/sit9531x/Kconfig  |   17 +
>   drivers/dpll/sit9531x/Makefile |    4 +
>   drivers/dpll/sit9531x/core.c   | 3111 ++++++++++++++++++++++++++++++++
>   drivers/dpll/sit9531x/core.h   |  372 ++++
>   drivers/dpll/sit9531x/dpll.c   | 1232 +++++++++++++
>   drivers/dpll/sit9531x/dpll.h   |   69 +
>   drivers/dpll/sit9531x/prop.c   |  397 ++++
>   drivers/dpll/sit9531x/prop.h   |   39 +
>   drivers/dpll/sit9531x/regs.h   |  371 ++++
>   12 files changed, 5621 insertions(+)

as the new version is need, could you please think of how it can be
split. reviewing if 5.6k lines of code in one go is quite tough
