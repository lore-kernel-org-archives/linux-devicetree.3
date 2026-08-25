Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2901330B14
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648465; cv=none; b=V32Aplj9bA1XFN2rwkP0EN1sTegeAAXZZf3hsr5/FlaLjp61KytNkkv7Vxxpsu/EOE1Gto6tNA1KO2XTkVfybdNs0ZuRt5RjV6YsVnt25aLht0CaRnQV8QE1gGyXUkKmSzpZMj1N5FzF4Dyov1TdbPJPXvIqamYxam2OFx59Shg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648465; c=relaxed/simple;
	bh=9xDn1ajVKRzKRfLuy/bg7I+rTvn4E57pv+fN44j0jRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3JPUqp7UvPq9xIGELKxrN68BDUhmGQfcVGSbo8gkDVWQh70qRA0qjHtWH9COHPZI0RV8+d5KTp1wSNKkZXHl+3PCsBUBe3UMz/QpxwTuDx8WWp9z02NoeU1x76oxhizK87x12HswPdrkKWebaXz6WoAPgDW2pmsZxp43iUa40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=MEYq5CQ/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="MEYq5CQ/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so797517366b.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1787648460; x=1788253260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjyio8DgLKHGd4Hy3nKZBHOklYUNmSY9PP0wGlRlgZE=;
        b=MEYq5CQ/HVX7dajIOA7ZKckDZlrKERevk+9wwR4UYtAvDqj7Uq7+MevA73IlGCd3Aw
         vC90E0+cTEULRJWzYVEcp2vZG5Os3NfbYCU03nTdGL2vtDJCnlXij/7L7ZJ5ChZlBdE4
         rl3csxvKQuckPQ10zPj6lrihx8s8wqDJZAYS801J/h+9ZV9JqIL0HFjUCRYBhy0EvlqX
         Nm5KWD5pY2ZnCALi0DWt3cAIIzYAU5Bv7Vr1KWlY+FC1jaMcuHNJHbRCJ8vejyfD0BU7
         ryUK5WH8IzQ53II+N2s788CNriE+COBqgGuB2nyqNvWndK/8pJBgfkQkjTacDIqcyc73
         f7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648460; x=1788253260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjyio8DgLKHGd4Hy3nKZBHOklYUNmSY9PP0wGlRlgZE=;
        b=re+MyrcbN48hI1baa4us/XHM6+xzNK0Qt9ZjdUYWAUcD5bsXVxdHcW0QEU7O9NHhKf
         hhx3gkNXJ5CWdW3SZyZHWXfSI7pTnbouyoODgB5G/KNpoCcw4qjdB5CzZcxO9PdbuxCT
         nrYRgNhtLdWFU/ToBww0AZ33um8M8FtYxwihzRcd804UEGSE/l8PpHoh1fGWRrxfVito
         gl8fgvzbTUTbxQ1IuMwq1Vsm3Ij5xKJLdEBkycts1XV3npihWS+981yRTCwjpV9TnPXS
         8Z45sor2Y3lMWwVJpX1V2Xm1hKiQ6p5k83FwrcwwR0G4fwgWA2Dz9zOhfVosv8GD5fwq
         yVrg==
X-Forwarded-Encrypted: i=1; AHgh+RrZYQbS5K57NzOoILQmLcS+PI2uDokelqMGiD+hM9gnQkzUcAStSqV8A8WTDDcwvxOGjJxjUT3Nb/d4@vger.kernel.org
X-Gm-Message-State: AFuF++kh9sCsqOhjCsxGPDT/UPoPVpBhmWPBbpQr13oAWokoFYuFznmG
	gW9cTNvRE/MgCnlayvxA2HmJNDedzbghXLsXt4HTWAMdc13MBrSsO8wZszCvJpe+16g=
X-Gm-Gg: AR+sD11phb5qbqW18tqaDMNCsRlF8v2Xs2ZL5mYr8vFvUO+xBwZLvaVRLQ+pP6bA7FO
	QCVGHYv/Gc2hoIm9XIlGE0VvMA2xekoS7PcVseZYUU7MOj7aZQjY3CHZsGUfK5KkDgGkb4CfPcs
	0n5k/Cv/l1SvTr076rfUQ1uKr/9nyXze5HlAvkYY2jjRuE3Q+icI7YDKmPUojO24WSIOLtCjXei
	ORT95qS57524f+ykloNbrbL6NBGwZTkcNCgqA3WfoFZcwmxzRsTUJZT4KxUUzOAIpEpTV5Uk6Je
	R006vQCukhC/q4R8BpGEWNoEvrG+2EZmxXG91W1z7XzNjN4y5uokxKEPpgA51p3aea8i0AaEQou
	0f9YVsCcLeYfh0/sItT5u37fusYMGSULZ3fCiOY0I2R++cunnhDHfHsVWNcPnKjSwb8/gpYhsPC
	oBslE/f/Hyp7mbSAyv0fIc185EzOCIaPf3e9c848uph/psiDwY65Jpsj5LoCYBTniNgqvl+XiKQ
	SXp
X-Received: by 2002:a17:907:1ca0:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c249262043bmr2784972566b.18.1787648458278;
        Tue, 25 Aug 2026 02:00:58 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm1591648166b.37.2026.08.25.02.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:00:57 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:00:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ali Rouhi <arouhi@sitime.com>, 
	"arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"cjubran@nvidia.com" <cjubran@nvidia.com>, 
	"Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v7 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Message-ID: <ao1Zh0uHO0mWj-2t@FV6GYCPJ69>
References: <20260815221919.64226-1-arouhi@sitime.com>
 <20260815221919.64226-4-arouhi@sitime.com>
 <6a529684-bd6a-4187-9ed9-bb40f4b98065@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a529684-bd6a-4187-9ed9-bb40f4b98065@linux.dev>

Wed, Aug 19, 2026 at 11:16:18PM +0200, vadim.fedorenko@linux.dev wrote:
>On 15/08/2026 23:19, Ali Rouhi wrote:
>> Add a DPLL subsystem driver for the SiTime SiT95316 and SiT95317
>> clock generators. These devices provide low-jitter clock outputs
>> commonly used in telecom, networking, and data center timing
>> applications.
>> 
>> The driver exposes all inputs and outputs through the Linux DPLL
>> subsystem, supporting:
>>   - Lock status monitoring via register polling or optional INTRB IRQ
>>   - Input priority management for automatic reference switchover
>>   - Per-output frequency readback from hardware state
>>   - Phase offset measurement via TDC (time-to-digital converter)
>>   - Phase adjustment for fine output alignment
>>   - Embedded sync (esync) pulse control on outputs
>>   - Fractional frequency offset of the selected reference
>>   - Optional reset-gpios for hardware reset
>> 
>> The driver reads all configuration from the device's on-chip NVM
>> at probe time -- no firmware loading is required.
>> 
>> Co-developed-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
>> Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
>> Assisted-by: Claude:claude-4-opus [chat]
>> Signed-off-by: Ali Rouhi <arouhi@sitime.com>
>> ---
>>   MAINTAINERS                    |    7 +
>>   drivers/dpll/Kconfig           |    1 +
>>   drivers/dpll/Makefile          |    1 +
>>   drivers/dpll/sit9531x/Kconfig  |   17 +
>>   drivers/dpll/sit9531x/Makefile |    4 +
>>   drivers/dpll/sit9531x/core.c   | 3111 ++++++++++++++++++++++++++++++++
>>   drivers/dpll/sit9531x/core.h   |  372 ++++
>>   drivers/dpll/sit9531x/dpll.c   | 1232 +++++++++++++
>>   drivers/dpll/sit9531x/dpll.h   |   69 +
>>   drivers/dpll/sit9531x/prop.c   |  397 ++++
>>   drivers/dpll/sit9531x/prop.h   |   39 +
>>   drivers/dpll/sit9531x/regs.h   |  371 ++++
>>   12 files changed, 5621 insertions(+)
>
>as the new version is need, could you please think of how it can be
>split. reviewing if 5.6k lines of code in one go is quite tough

It's a new driver. Linear review in one hunk. I think it is better that
way as you see the whole thing right away.
