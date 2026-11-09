Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183274;
	b=FOuHBqdtW/Kifubbw5ErQFLBIqJ/jlGzfq/G2vZYc/rvapGn3DOfx7Q5kXG3YbTZWIYj
	 ebQS0DafQaZOFCQc94kPlYSGIQKwdwySVgzvK6FLWbD1cQFHPnXQbXa3L2rzJEQlL8Rfy
	 2YwJ/bJs1wkdA2ZX7YQpcJmwBQJ9BtVULgI+n2ayle1uO/ofhmS6J0JGUtShMOkN5ArPl
	 f2x6JKOYZ3eSOP5OVuskf+c8yeRS0yYtP3Az8jTxjRK+tnhiHZc+GeKaohyE3OnZTs7yR
	 SaoffKkIvYhP94ylKJVKec3Amwp3msPgmVXbApTHARKjm2IAhs4tXihvT++hCYqcdsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
	b=WHbRh2HR/zxl4XclSJ9ebXFVLlvGAlsa/39v1Atxeo1oOQH+odBO3ZUL4f5IkeV8KIdb
	 V36SeLbDeeV9LN4eu6pwNZKlg8AWjgUbDPapIzuEkmOZ1hcTftmBEcM9EMyTyXOPpYV7W
	 hrX1eHD0vWgLBdn5GCIDWVkLFeu8OKXkoLXOMo1Yf76dIBOsIH6AvLmOQCt+8gnwiUG/Z
	 aa7VMV7qecyq7CqOkSHMdABHnhpwQxN5bJOCLKAKmWdrdsGygMXIlhT5RZ0O0dcxmBkWH
	 0CpUnzFu+28j3NzYNPjHuIkirPn0q12j1X+SnOZGmtCmhgI9pvJmMsqKtWjGTePujkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD0606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AD0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so188879b3a.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183273; x=1794788073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=ZWSuo7o1a8UnAu8ncnh5mn3fSiYXc6RaBhlIVj34wIGCkP5oIgEI3ZIhR1PPCStR99
         es4VkceP4A/YQn5zgOskoYrNJsBpiioGXm3dcDwHrc8p0VGbjsVLtf3jpirm4WdIHvyo
         sfNsyrKFGOVtf3DpRkI6+42XEXYU3fPJOpGpRxgKiZsKwZhZe+DhMXYaEjvOE2B1uIef
         L9Z6YW+NrmHGtXWy9t7wPwht+DC66M6tPa8JwfVAfUPQ1K3aT8E0L2RedPDVvIOz+JCS
         igIyLiHooDBiJvvx/F62nscNzDw0Ur+9CODjcwXv/BkqGwA+wl8dx6yOae32sk1bvulp
         nZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183273; x=1794788073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=ckqffmmo5uZT9GMVXlh21PoYyU3BefpTUAZZG+h5AS+Lyv2V/hJ97/OgsyPpRm7NX9
         Lnv0AVRU00wbYxRPahezbyJ+eOD2EongnPs3iNvnK9lRSeYY0rnW+A5dM7w9z6k1GyGK
         oxj5PQGV832X2tPbl7/yjP2JDIveybSCB1+RZOcEv02T0q9kBkb4s6UP6WK0VtEHKNuQ
         pJ9MVfEp9YaA83jAVwplzo5lwbmlj8KyrWvz2/EskR7lz+MVSZWRUF3mQlk2Wa/lUrp2
         s5da+cUxG9V6kBJEHPSlpS7Uy7/PbBKTJe7FjSyHF5Vde0p6DpJnYCEckN1LPR98MU/5
         FgVg==
X-Forwarded-Encrypted: i=1; AL+hErHv1apmYxl9IZAtubrXTZ4LEBVWpVHvDW6/qm0DEB4dy6X1w2TlYFctp0cRwXhYYX0isLJo9VYGbTcn@vger.kernel.org
X-Gm-Message-State: APuU4Z+zOZVMomnk47RbwNlzrDd8BrqISEfya2MqLcp2+v5oglbUWeYf
	3nfLBw71rJRZeWnu9Sz5jr0VvI3PYXx/KLqkhY2MFUE9qw8MU5NnTwNY
X-Gm-Gg: AYBFou2kBlnfJS6W00ES6Fo+COFsqiV796wj7b2eEsJGgNgIHDKFi/hK5oGQmClFmg6
	/mThze3GZ5YbybRwbk952A5ZjfSPKdfZgUuC8d5CsI0QAFX0R+pI4REjnCDmHkYdPmyAy7hWZWd
	ZNGLmEmrunK1dzZJ/H8NEe5Nt9pWWtIHcFFk4f8juHFHYpNGPRRJXTCM8DFyyItvrqtOIVqt+rj
	TPSuVnebNvZLkydd3pbBcvm/hC1BNAs4QAdQVmY8J5t+AX5WmPe/4B7vysDj8eSaOwueQ3/mjwv
	Khl9zmWXQF6HQ2HH3E/fXcN3lUuegOEAiweoFoxLJzZ/NA0IFa86tu9/Ys8Wa6bPmkFo1iMv1bI
	3MA4uflJ3weUuPVUQwkZZD61T1HSQ9CQL2UOHXk5Hrn8Dffu2OKcC8t+3YsgPL+PPoBPxqvH/id
	/yW8vjkQI02+/hR4bOs0YYu6Z4nK/dUSYUVx1g4/tlPnICrdxiAP21dbn3xQ/I0JQ2oReaemDwg
	btqDoJYy3RfY/Ei4nvGqk/fgmaVRriAm+hnIG98/n1oE429DOH0xUq91N1R14ZNJTZ+IYfkThva
	fHNxafPLYaC2pS0YFr0uf25Z835+Tc94AnVlXmT2ThKxY2tRySiP3zTiniYRRNXzv5zqbbENUWj
	Po9Q=
X-Received: by 2002:a05:6a00:9a3:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b66c3a7923mr2227291b3a.7.1794183272958;
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821abesm777951b3a.34.2026.11.08.16.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Message-ID: <faa957ac-badf-4027-b86b-e12b8dd4bc7e@gmail.com>
Date: Mon, 9 Nov 2026 08:14:16 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <au4GkvPTXmcvReoj@monoceros>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <au4GkvPTXmcvReoj@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Uwe,

Thanks for your review.

On 11/7/2026 12:57 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
I will remove it.
> 
> Best regards
> Uwe

Best Regards,
Shan-Chun
