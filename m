Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3DF369D6D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286599; cv=none; b=Rto6yxYH7IHcCpJ6SnGk54V0zm5zlaYjQ7jqgpxf84dz3C/b7dnkTHqRl6594GmicDtF4dDBOxV+IClwNaiTlocHlyugu+dQF4JXMvZeGbEwDkLGpnzQwUq3jwEsDTB1JgpAC6G8erwPRYVv5kvcIxCqg8CBjahXMazfxIledbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286599; c=relaxed/simple;
	bh=h115VTK6dungfQ4qIdCxA3kCKtoEZBfHb83D7Vo31gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gvx01IgdWi+9TFvYueDEvdFiEpWZmAoGqpc17sBsdfWl9ck2dJkJg7JV0Jb4pE/89rkptRRNCA4lR6k7qDVhxjumGLPjqk8zlS6c7UPReBoSiugp2Nzgj1ky/KkKJSNMIhI1Z7z0gqq3BGpNlZUL7KN0Xepgv60tkh0nFbXTHNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO29Eynd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NO29Eynd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso10518095e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781286595; x=1781891395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C85wBIXdmOAkbGAX37TSwTaJxl8p7p/GigMbGhAuSmc=;
        b=NO29EyndaZTP4L9bwqRYnxiwYwu3iC3bkQTJe8JVl/jCSqZDwSLYVhxRAxAAlsZnGq
         z8ovA9kxiRPX3uNCAtCQQk/40+Vi6nSJYfNxnTHyn0BNUkMogapVhueSRGrJfmlWkluu
         70Hv+BtE2YYQexNE03azSY4wCAmx8xs/khlZlG7yrX2zCOxYfp1PcbpXYhcH3pVxu8hE
         1DBjU81toTHYhFse6lhVRyRKCjP4ZBwNZrmUtSNlAUItk9V8115ndCndbEM0uR8d0LFW
         wom8KKabJYaS0GivkOV0K4ZgeDirCDMp4OqtqGEJSDg1kbnLQrYsMmpIhisaLIjwv5fU
         hQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781286595; x=1781891395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C85wBIXdmOAkbGAX37TSwTaJxl8p7p/GigMbGhAuSmc=;
        b=TVv0RUXHx/L2wzHxIzv5x1xofFbjT6o+XAx9tUh0CjVP8ddMJdbvnJ6UTGTgPtzRdJ
         uOSroBIsxYfYwrkjJFlDG6v/rQxzDTH0+chixFVLQqam0nvSpJuMWmGSmvKFBQJts+1l
         22a3Mi/spidACQMT0N8voPTuwYDofW4mqX4DPJ8gO5P6m14mj1dU3TpRF436MA0F+D3S
         /f3jFnMKbt2opqKirQfiu+2R8dt4UFZt0DNX0YMLwZg6RjPUTQKLT8L5EkqyJ2Zq2DnD
         x/SpOgh3SaeOZS7rhhnVYj7NwtfzxS4QtPFgnZfdkjb+XCoBLorcCajViZUDQ0iSjM1a
         ZRxg==
X-Forwarded-Encrypted: i=1; AFNElJ9/r1YvYiV4JaPze5bGAmWOKLuDx4C/31EJGTJwwNs7+a2EnijUwDGLih8cYxZ6REZ1sG5tUBcg/uIs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kk4foFFj6l7nDSAbOCRVFlYgaPurh5knMU2aE1LcmFa5/6Kd
	rueUVMMU4mBMONdgUpc99Dgwl2tX1rmNXBNMBSUbkguaD0DSZpKG0OwbYzPbysuZ
X-Gm-Gg: Acq92OFKywQwGQanMdNkZ7V1TuRBAPwGwS6KMaOHJrByz2LA4U59VlBAQLhlfKsObo0
	Y14ydllCufTpX4L4wmCJlTCrpNBlvLaHvOH68ZNWe6bSfIlC7K1OZcPs9OKn2Ye0PNWsC7w7nFk
	5MbOH8Qk//jWOtFFjLLuvnyLKQufQoIFeajZVlCiwek+tTi13F1iNWBxD0AYgCqfDHCs5s3H8Mm
	KLNQx/fkIA5fDb8TaFA/rHung38/Jujlb7qbUblRubnVh1HuSkFhyf7ctN9HMilMr/Vp/n9bowZ
	QhXtykXY0gEsnwkgv+ZtuvC5oX7L8oyVloOyaRZzgQYGwjUgioBJGSXVGVSfeqM5yaoxD+Nb0yW
	EM03hhTk0FYr6nnKIeHuV6TcqoeuCkFJxULxYF5BStjgvn17usW8CMsRJfCBKpGFtk1vMM8p3g1
	DMCVvG4X7Ik7RP9Qw3RCvjqCgVJPqFXRCqD9hIeUS4HxHMS3e+a//HVaIRKCKYmzHhLlrRop0Oq
	ts=
X-Received: by 2002:a05:600c:820c:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490ec4cd08fmr53203395e9.1.1781286595100;
        Fri, 12 Jun 2026 10:49:55 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm7395809f8f.12.2026.06.12.10.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:49:54 -0700 (PDT)
Message-ID: <31cb54ac-8cf7-45fe-9167-becc4cd2aea9@gmail.com>
Date: Fri, 12 Jun 2026 20:49:51 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 3/9] net: ethernet: ravb: Simplify gPTP start and stop
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-4-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> For devices that do not support the gPTP clock in config mode the
> somewhat oddly named flag gptp is set, compared to devices that do
> support the gPTP clock in config and operation mode where the flag
> ccc_gac is set instead. The two flags are mutually exclusive.
> 
> For the gptp-flag devices (Gen2) the clock is tied to the AVB-DMAC, when
> it is stopped so is the gPTP clock. For ccc_gac-flag devices (Gen3) the
> gPTP clock is available whenever the ndev is open.
> 
> Prepare to add Gen4 support which will add a third way by cleaning the
> Gen2 and Gen3 cases up a bit.
> 
> Fold the gptp-flag start and stop calls into ravb_dmac_init() and
> ravb_stop_dma(), which start and stops the AVB-DMAC. There are no

   s/stops/stop/.

> functional change as all call sites to the construct,

   s/,/:/?

> 
>     if (info->gptp)
>         ravb_ptp_init(ndev, priv->pdev);
> 
> Are always just after a call to into ravb_dmac_init() and all call sites

   s/Are/are/.

> to the to the construct,

   "to the" repeated... And s/,/:/?

> 
>     if (info->gptp)
>         ravb_ptp_stop(ndev);
> 
> Are always directly followed by a call to ravb_stop_dma().

   s/Are/are/.

> 
> There are two special cases where the calling construct covers both the
> gptp-flag and info->ccc_gac devices, one for start and one for stop. The
> condition that it is preceded by a call to ravb_dmac_init(), or followed
> by a call to ravb_stop_dma() are however true for them too. Reworked the
> two special cases to drop the check of info->gptp.
> 
> The end result is that the gPTP clock will be started or stopped for the
> gptp-flag devices in tandem with the AVB-DMAC, while the info->ccc_gac
> devices will be controlled, as before, when the ndev is opened or
> closed.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]
MBR, Sergey

