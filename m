Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2230D40C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517059; cv=none; b=TGRCYEttKhfNA+JiZ+fdCZSoP01YQsy/FQiaKB6HY/l4leCs6o48nwjwPiV19KP7K63QCJOHsdcpy6rbBfY6yeyKP/9gZ34gpXqyw2mN3YYuflhtYVzYetHm5xN0bxdWig1IyQbrt1mwuMmwJ86VtI0G3icOBdDsUsQCvZH1+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517059; c=relaxed/simple;
	bh=1Xh/9jpvgqev0sUOAVugYLiqyO+1oxRfC2+ya3TNrUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7mXLbqVXbuQMBc2b8flxWOmyzbLpm7eHVfyzuOvrN+KC1OL9o1sejwmIB8lhiQsKwM+o4cgtiurQ8N4ThcKfreh5wiDns7p9AvtwudV+JjHwjUPmZ+x8n34CgmemfZxOtbxCym7Wy2vSf51TmwyAL9TRyfFV5j/Dzpe7BIgqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U628W6tx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U628W6tx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3521931f8f.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517057; x=1782121857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Xh/9jpvgqev0sUOAVugYLiqyO+1oxRfC2+ya3TNrUM=;
        b=U628W6txnXyDJFsRtuyotITDlzy3czwEWKAMQlGqkvW4u1JzNViylapaRD1JybGLDM
         uPnB5pIlzCLhrSWfQZIsqQSDO+MbHHq1b4lHvwK5zM/byxG9e+foTfA11BoWwqvsFxV8
         a5mREMxjJqZyGtPBxjPuLQcGjf/GTgLcEU3gEVTLMIwtkJ+jouUFa0F9Eo89bFIBH7xI
         eUDruFAOFrlegD/pGwyg354c2Se5zLtMw2II/Z3Jg+/lUfmFV7+J7ilUeZxJD6g3JLb6
         XRPNauVYxUupZJ9c8lMqtGsNEZUbdo6QwuajXUVzYlfdfztIZUNMi45SpUKDCkk6l1bB
         Yf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517057; x=1782121857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Xh/9jpvgqev0sUOAVugYLiqyO+1oxRfC2+ya3TNrUM=;
        b=oY7aBF2k3zswCWcVhW8u7fhR8Ieet+YKWRo6kp9vfj8AdwxFex5imIBI7ZkS77/Cgi
         GIGt5TtmU8q1U3jWtx6bVomuBTmSaNQavq1O/g9e/ds4FdoIZny9QqHfYdVx0SO5h6Aa
         uOL8QEyOZ/ZNzyLFVc2Zioa8YT8WuvQwnC5oGPz3+9f6YGI5foVUA6HqFxC6RY9lSWrr
         4Ws1XH4F2e6JD5zYtolHiyhc57vMSs3PJXJLbpSjkBVEUbzTLKeiu+BryObthz5657CK
         fFd/T7xRMYmpM1CGJq0CbHa9Do94N3XQOL1Boz4iF302Xkv9GvfpcotSp6aqjp05kVqh
         hNQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8odM68gei53oB6L3wHToQLs0SCZ8WUoz1AkuE95STq8S6Z7nGTd1mLhwSHv9HrNSvPT9VRZ7U3XNkY@vger.kernel.org
X-Gm-Message-State: AOJu0YxImq2NiepP3RtXIZto39NdYcrlGrnI+Yqg2QmGxOXQ8zn7sSyg
	AtY7v3hErbUv0dsebQ9c+cy2V6RkT7biCnxYF+XvjBxHL8cfgeNDbvyM
X-Gm-Gg: Acq92OHrktdi0a5tBYaJieymh2VtOPYxX+sGi6Ujh9iQDa1RPRJAe77bGtMYgYLuLXx
	8TToCshMMJ6dqtTPv3tXxZsVt6RI0x4ViZBmhjhx5yVh3KvviLQAUFGpYtK0qUOhpW+LrKiQY57
	r0e+tBruzvx0Vs5TMFdRnEHlo1+hmTupqtrBVtrRjmYzmw6UVV+ZrDgjFILVbnv+cUsRyjbY06V
	PI2uOVTtLPbZ2oJBc3Ym1kPvvPtXAoZFjBQ482qvS/UPEYiXN864IOeeJKIe0nDbRcMBdX/Ji3c
	q4l/vgg9HwueodI+J65cDY661c3iwzISY8HWKbyKAzc5QOgVYRnOd8l3DTaOMKpufKwOB4IAURT
	8noxqhUCPZGcadKT9wN5YUa4wBGjHp1QSlZADX5eXqpU692pvkZxSNDRRJC4EeYnu8nAZnvONBh
	sBDJNi2SnVKwfQ4cMCBBsfi3hSoi4iClVFqTGgxQFeXQDlbzoBC63JYQJcIv1ZqshME1bbU0VNz
	BlOox+bXigvMmBRSFa4aY53CQ==
X-Received: by 2002:a05:6000:1845:b0:45e:e509:d2fa with SMTP id ffacd0b85a97d-4606da69cd2mr18394666f8f.3.1781517056750;
        Mon, 15 Jun 2026 02:50:56 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12e:9401:c875:96a4:7b6f:72fd? ([2001:9e8:f12e:9401:c875:96a4:7b6f:72fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3fcfsm29186872f8f.26.2026.06.15.02.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:50:56 -0700 (PDT)
Message-ID: <f7cee53f-c1a5-4780-9aef-a3c791b9f7f8@gmail.com>
Date: Mon, 15 Jun 2026 11:50:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: pse-pd: add Realtek/Broadcom PSE MCU
 driver
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kory.maincent@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel@makrotopia.org, bjorn@mork.no, Simon Horman <horms@kernel.org>
References: <20260612132944.460646-3-jelonek.jonas@gmail.com>
 <20260615090733.739423-2-horms@kernel.org> <ai_ITHd_xxt7an4q@pengutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <ai_ITHd_xxt7an4q@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksij,

thanks for your message.

On 15.06.26 11:39, Oleksij Rempel wrote:
> Hi Jonas,
>
> On Mon, Jun 15, 2026 at 10:07:33AM +0100, Simon Horman wrote:
>> This is an AI-generated review of your patch. The human sending this
>> email has considered the AI review valid, or at least plausible.
>> Full review at: https://sashiko.dev
> It probably sounds scary, but sashiko finds not all issues in one time.
> Bigger patches and more different included frameworks - increase findings
> probability a lot. With other words, it may more rounds than expected.

Sure, I've noticed that in another series recently. I'll just be patient and
address/discuss the review/issues accordingly :)

> You may optimize it if you have access to some free or payed tokes,
> by using sashik-cli with LLM of you choice as backend.
>
> Best Regards,
> Oleksij

Best regards,
Jonas
