Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FA2147E6
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338572; cv=none; b=aVEkNGA0TjojsTStD2XBTldLYgwBH6SqSBplzaW90Z6JApL/H/M3Avrlb/Z1lDIhfHeWPLvgD/3bYvNIbwvWDvx2dkFyTW0uvPMpQICONRe+PgoZlFAWCMUISgr96S1eWwFGfgDyFu1E/6mZMq6jetQLdK155DizI5cNVam79+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338572; c=relaxed/simple;
	bh=gxXIQs4fOYo7UxbFqDXGSyWElu5qYAeUnrJUD0vklmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KIoNWXEgOi7Q7Sj0p+NKa9sMuYgQWnG7d6C16W6bLsriaj8l8AWcRiGaJqFfnfqq56uBkQnu0xug899TeJ+HjIj5uNvgQ6py+46RYZeomMiWlPgWSthooxzTE1nGbhuXRBV8uOTmM9+JliNq6LRvC4x+oZ9n/4j56NCfPuLcIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2+02RrX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2+02RrX"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so1649994e87.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338568; x=1781943368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iXLstte6ButgpYOzogymHuOexokA1uZth6v7/qqcCo=;
        b=T2+02RrXMtMJCfwDyutG9OtBlzhRtcAQ00UNE81YQm+J0vWjlCsAZ5fEmKaUrPHWpX
         w9Heg/Vl3x60KBWHMFhkMVareUkFw8OdZhhVsykUpbgjyz2WL0nxrKLziYhAiTHxLoUG
         wYaKf7p4+iOG6UXbjV8X+lpNkmFvNGEh+d9TiblbGWZ1cz7TMwZJCkAvXCNQbJja6g7x
         A+swLSGRoQPkPnf4TXaIO+Ajo4xCEI7KCgj3RHC660LeH3+WQjuLZ+UytDGOeITK6sHK
         0VPtn2dDCQ6/aGyyTw+9zBrCQ8UsAX68IoLHvSrJp3mdOC/hKPJ8yv4W7YBlCHiSU/WW
         P61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338568; x=1781943368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iXLstte6ButgpYOzogymHuOexokA1uZth6v7/qqcCo=;
        b=jos5woJus6HcP4K4dpvDsnL6k+j0906qYCuGGK54y61G1Z7qqWuBP++dyVKBFmYgVE
         CQpmz8k6ygHMRYpQi6BT1q5xIWPyPlUblfn2Rqr5JOYfpJJg0J2ttahBuY/FLRnKbdtQ
         i5eP/MZXVf5T6HGDO7C9VZqUdQdipoVxmZJ1YaPbPCNhmN8kuh9bll1fZxrBTX0etfV2
         u5wUfTtPcgQ00qcuCk2lHwJIY640KJh2vu76Gvz6wFethJu0w3L+QPIDfjD75ja5qpZE
         ATBW6QzCFbCwjEe/hPwVCHba3hv2XZyvVIIZkX/yropT3iYB8ablKL/aHHU5ihvyLZaa
         13hw==
X-Forwarded-Encrypted: i=1; AFNElJ86hmih75cRYJOMMRAgmgFd6WGh6aJxGRiV+eSOJ63xvriwzWV3IBEeG8K4gseMO2TjGPggdFsqu6k1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rXE+yK8Cv9QuI67Yn3vtNoyfaGV1qPwlk9yaVLVcRce6AIXd
	pbRQSa01dWtrUkHwTLacfWHnnBtXihRaEYnKEx4+4WYmvfgz2XXaGsI6
X-Gm-Gg: Acq92OEi/RDAawzk7BVC4jw+ZLE4pvloZTm/vtCHT0b1hdXpRWH+3zo1oYZkZEGW52l
	Kp/uSe534ZIJ2sVx2Y+70fOLBWJFyZH5TrnXzUFZp1tw/eUEY92un2cDKFV/ikq0gglUcbR2Vio
	kdqA6XkQeo8ZrD3LSQRqfrkFyjYiB0UxlAPuyhS+o+HE/KNR66Znf6A6QzzUH9xFE0IxyvOQU9O
	evyCoyg+CpZyuYP0ifVmlUJacQISPSoCpPso2HpS8BRQeab7zPT9KQNkjDw1h5o/cjsKlYlb36X
	iZuwtAQbdOeMpcw5fenDztc3nP8QNG6iGKd4XMvnZeC2pjVhX7Y6b4edyKA8XQ34yPKe1Yq1jQ4
	gP9K+owo0u1X4pBEJP3O4Weu1H5mcNXOHcKVrRD2GMh1Ip1pcRs/A7b0Dy3xXmlM9NFN3cV2gUQ
	pQrutJ3LQl8auv2oO0KtgveclkNoFduOCkqSQzKUJvjhI8dPOZiuVfjC89ISxyo1oS58uAuEMIr
	hxWhw==
X-Received: by 2002:a05:6512:4608:b0:5aa:5a89:c80b with SMTP id 2adb3069b0e04-5ad30dc08a1mr583841e87.30.1781338567680;
        Sat, 13 Jun 2026 01:16:07 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:856:c6e8:742c:af09:78ba:8005? ([2a00:1fa0:856:c6e8:742c:af09:78ba:8005])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16935esm1124202e87.25.2026.06.13.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 01:16:06 -0700 (PDT)
Message-ID: <39720384-28da-4157-8613-8f02ab890abf@gmail.com>
Date: Sat, 13 Jun 2026 11:16:04 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 9/9] net: ethernet: ravb: Add gPTP support for Gen4
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
 <20260610102432.3538432-10-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-10-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> While driver advertise gPTP support on Gen4 platforms it is in fact

   Advertises.

> completely broken. On R-Car Gen4 devices the RAVB module have no
> internal gPTP clock as generations before it. Instead it utilizes a
> system wide gPTP clock.
> 
> This change utilizes the refactoring of the RAVB gPTP code to add
> support for a system wide clock and stops the Gen4 devices trying to use

   System-wide?

> the non-existing internal gPTP clock.
> 
> To remain backward compatible the device tree property needed
> (renesas,gptp) to get hold of the system gPTP clock is optional. If the

   Can't parse this statement...

> property is not present, or not enabled, the RAVB driver will no longer
> advertise gPTP support to user-space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index caad95a9c3c5..acdfb56bb135 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -249,6 +249,8 @@ enum APSR_BIT {
>  	APSR_RDM	= 0x00002000,
>  	APSR_TDM	= 0x00004000,
>  	APSR_MIISELECT	= 0x01000000,	/* R-Car V4M only */
> +	APSR_GPTPTIMER_SOURCE = BIT(25), /* Gen4 */
> +	APSR_GPTPCLOCK	= BIT(29),	/* Gen4 */

   Hum, the other *enum* entries don't use BIT()...

[...]

MBR, Sergey

