Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CE04B1CE0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402091; cv=none; b=tP4PIisjbOymIBgeEBurCsjejb1GoZOhPtYZfF28NIvQUFhUVwRsCVf4cWiQhHZUR0Ys7inpUgiQtnPYSY1ceQESDHPue04ZjalWQIBhc2rQOmPlyR0KCB0GnslWXa7hpQP9/fAzEA+4cLt8bJnmSxHWofQnJsJDaaEheWqQonM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402091; c=relaxed/simple;
	bh=0dyPF7mE3t+RM/QADdAdf/PKx71VS8XRDDVPCLUpasc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSGbZT/w9KR42kYIVkjbqn3UlrWNIk4BbCk6nh8jAGQZKMTBxF3oGyNLRWaexp5PsDZPndztxexPAsirG9GM+Znw0x6FM+4M3L0edhVgZmwQmU2azmaSNfy/3qaKm17xpA5R5uuRYeA64fvJfwWKtVOhAO3YKjDylih5l3E88oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TabEt+4s; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TabEt+4s"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso927314f8f.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402088; x=1793006888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=TabEt+4syARpZYSS7IAUv/4kga+T5mT5y5YV4/TwUanxWgYT/3tSNCDXar14lM3s0H
         2IXDJb6fV0mk26cwkkFZijqxVxtT5Ahl72+Z0suNdAi2MaGf349Kl7Q71ylydqVvKJFT
         KyMqDVPxYmH6P0rDXOtqj36kHXvbsVWJ1wjxkaQKXvJ1LMhAWCtFjKhAxVWp0JQrPF1F
         MZImYUWGFPs/IvyKEJuRB7hzeGc8UZmOytgRX96KnwaunyDKGg+OrTulWUzkS7ju4+oN
         Dg8emLA38yAWd1v7qMBKI0kqOZW/I6e1UQzXhneL8ur/ver9WLJRdpeeZBJvH0qR9hnD
         vFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402088; x=1793006888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=g6dQzSOHOgk/yxIDiHO/tjRmunuonJC2fcUbuXFDwNeycIOeaYObNePcflL5WdhJhB
         qreUg3j403A7HaatGt+tKshzsxetFkxKsQaiPdTXXRD2gXUGxpKoMwDvIA4rduECIuoF
         yNRVKXab697IpxjWcdIeNBpYJDY40bQ1gfeR4xsaZFT0ayoGoa6te3q8odWo77emGed2
         gzBgMWHejYUy+QOD3gsxV+U9nWN4Q586Plu1K0IExXc+u3rLBUjWgP3ItvFLRZPjoRMc
         zTaMxkw3+nTpB6hVARljrOQs9UuWwrSUlZQ1+LWxJmfm/HA3qdYBv52CY8GxG6Pz17Bz
         qBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC1NJo8UvfeF2LuCqquG0t95+VoVZP4qthzWJ2Ze0rN1GmrkQ6os8xLpOQMg+rf4URIEEb/Nv29ckH@vger.kernel.org
X-Gm-Message-State: AFq9FYKU/5Y05QwIdOkW8GAJo8W017hmHlnMAa+QKzsporqgqjPE1vDN
	TySUGs1rAtPdJqtFNki1stFVITRrfYLdJir8wTZur2Ysp1P2cX/ymYYWhzjRg7GqwgE=
X-Gm-Gg: AYBFou0KBRrYr3dVZGQR15jVpPl3GdIyzGJAuxhQPlx3QKaYzN4mdo/3Rhxsevu6SZB
	xjLcOYsw+fbiSOaKwpxdGFq86u6quxM+xPIvbHyvRggCctoxPSB5oFuVI6JqQsvFd85o/Wn7+CR
	GMrseIbCbfKVIJrhNkjQ7h8duVJipc3FMVurfeu4nuCy4zYuvHOFW2QPgToU87Yy2Tthvtg2og8
	pqhgBeFP/eEff+Eoq1fhJ6IptToMM4kH4DgsnisNFhZ4RyYdKW3vsj1ZlZTUcL8nFbvTpYN3Hib
	c6iR5jpErNgnbwdZNzE1kQeHuRFlKAuztZsnFqRb1fykrr++E01sVoU8acrgNIaPNcbkaL76iYZ
	FOgmeiSCgQG2h1cANywD6Rr9761RNcCk5l4F0J9jNzVRAGo5wRHW2TpyBmwPa6cgbyZa3vH3CE1
	iOgQuOyyMI5zfcn2Trg6QsSisP+Hk8VesMk8QJSOHeowoiy8+Iy0pgU10ncn9X+bSX0bcAbXsN1
	Px/mi6il22JXEKYbpejvKqDwtMJsv5OkjHgo8Ssc8CGv6YP42EfazUyT3Gf
X-Received: by 2002:a5d:59c1:0:b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48e0797ff49mr16398545f8f.6.1792402087710;
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23498338f8f.6.2026.10.19.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Message-ID: <cb24bc10-aa0f-481f-80d7-71fddf1e428d@linaro.org>
Date: Mon, 19 Oct 2026 10:28:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
To: Andreas Kemnade <andreas@kemnade.info>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
 <20261017085339.3533e9ab@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017085339.3533e9ab@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 07:53, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:16 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> There is an issue with USB being put into idle with DMA enabled and that
>> is mostly prevented with usbcore.autosuspend=-1 on the kernel command
>> line. Stop the ti,hwmod code from putting it into idle by setting the
>> appropriate flag. This stops the log entry 'clk:0058:0: failed to
>> disable' being generated.
>>
> So the module cannot be put into idle in certain conditions. Why do you
> disable idle under all circumstances and not e.g. adding some
> runtime_resume/suspend pair somewhere?
> 
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> index 9b5c728fb7da..2f55dc32e150 100644
>> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> @@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
>>   	.name		= "usb_otg_hs",
>>   	.clkdm_name	= "default_l3_slow_clkdm",
>>   	.main_clk	= "sysclk6_ck",
>> +	.flags		= HWMOD_NO_IDLE,
> 
> and why do we need this here and not in the ti-sysc node?
> 
> Regards,
> Andreas

Sorry for the noise, this can be dropped. It is not needed. It was a 
workaround for another problem that has since been fixed.

Andrew
