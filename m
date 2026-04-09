Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AB3DE432
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746942; cv=none; b=ehYFCeE72sMuZdwzKUAk8RHSomov1IFWtF6Lq0F5uZZHnHN30p+z6iU1Xwef3OvE/f9XVP20uLDlQdlzWAhlf+s8D6c/4n+p4nJXQzKX3yHmnfBYBUCaEteBo3tow2ceEMwGbHAZNNNym72uFSOEk4zXVfa97qvzxlO07UwQ/MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746942; c=relaxed/simple;
	bh=fXGBxwt49z7XnZX6d8Vyp0KPby/Zgq/bU0dkrOszvHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2ihPjNtnhVgI0MdaxQFuUB9ICQFhBQ5vAA72juXVtIJKoE4iWAmEfWJfSzjq8+pq/+64ETH3ygBvvFY+5fDBqY1yEhbSGLOsMR2M6qvr9wAWDDd7DBt+3nY0Q07tgPOD+xquvjn4RptLYmkXrAUn+P18OHpZ33nU3D5AB/WNQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiKuX1Db; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiKuX1Db"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f07e5ad92so130019b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775746940; x=1776351740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhXtNcfXFczFC0TvlssSpcRPxwc314v0ehuoW5MZUg4=;
        b=fiKuX1DbGyVtnp7dtcMjI+Pt8AwCt5ayp3fzcVj1n0sMtW3SjpwHQmCK4yMqKykGA1
         8V6Y0SG6u8YZAOcu9Lh7USRxhYl6cZDdT6f1nkAwP9m0E7iJJKrhKKlGIH6ISyRB6vt9
         7tzfy0Qh18KnyeOH0+4Vwu21mhzWQ6ZbsVq9s2qP+UurCKK8ITSdZZzOnxjcC2NvFEz1
         dm41rYavFY9eeVFqqZYv1aWiBYmt/C/XXd0qHOQrdm0y9yY+0l0hbvv9CUZo0VsoJxv+
         7h/xAh5UkPu/zJR3IqTrNhf0PVG5IoXoAZLYq/VTZqfT2T0sFVkYbEs6R58rTu8HAt9u
         RYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746940; x=1776351740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhXtNcfXFczFC0TvlssSpcRPxwc314v0ehuoW5MZUg4=;
        b=WqdyYhMko17qe3ZhQ+9JoThTl14LXl9Juqz8R6tV20H9cwh2XTkYfwImO1ku84yRyE
         8gP2ozdXueY09MHPkmXmQn3MEHWWAU6Yp/tlNzr6RI+bVPVVmqBFWteLyuDifJg11MC0
         0mFIrWaeQB41eg+0rpRhxeD37fLNyKQVF4O4xzorJgDYMdQIaLgih/2sDpogKlBw6QtF
         5x1w9BN1DuGTjXHd/tdPbCuhL4Xw7giyC8T5LPFP+VVO9814s/oVCdR/H4EhEXAQcBP8
         RcbMxPGychaqF1xhaLOBjXCtzTSPkvHakDEoSpe0MEuEfVonBYyzDaT4ax2XUWdp652e
         VdPw==
X-Forwarded-Encrypted: i=1; AJvYcCXfjZQlrRHrMmTTSkb+ue+PXp5fiWiJ5E8cPAWdvRsovqGM0Gy6AiKqvYhA1PGOouos2dsrfnGTF68V@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFpGytH+qyh3g0bAjYyRveeVAFr3Z5jQNtYJO84HVNYxHepBZ
	dsO9qEZrBD7itp6rdlJN4xlGqcH1bfWwfct52MSNwgoeIYSxNk62+1sH
X-Gm-Gg: AeBDieu4vGwK4SIt0tmDJBsNeaPkqsh7Hvu42dCEZ/f6zp4u+bOtH4bLNod5Tqkxki5
	zJAEtdGxuljkVPh25jJjJ7wByis91pLIJjys5JDcAsMmg9LRKgTOTdoJ6ENWkzLPHY5/cPx9azD
	RHeiMFTi3dWmMtElLHm7Abc2P+jUHvRhiCuzWvn9gl3xw2SZM3pnsmAe7Q/vygnJ67X9G+4rVbF
	YSB+6v9XvZtRB0BN4+D5JDCa9oEhSsgZkU0SWemuh8TpqM5ArOQrBZQmZTA74Aiod9G9nGw0Be7
	M8Oul9CF3DfCXGjYo06jM66mJN1dzB0QKgBXWNCW7mnfWZBPLsNcwOcCeSlzp8n2zVR4hpI9JJH
	19K4FcdTH7dcpE+LB4CpQjwfZo+lVSlCW5qPxakCYmHhYEHcBtfGmgi9sLUhpxRGGd0YxG+HaF8
	vmtuWfeALEvPAAXGzhCw+o5K+7VKAlpS/hVLoRSB8MKMnOxSSLknfGB6etTfqznNULXRuT+aCMB
	U3fWEGhSag=
X-Received: by 2002:a05:6a00:4397:b0:823:9c6:1985 with SMTP id d2e1a72fcca58-82d0da8a9bbmr26784425b3a.16.1775746940074;
        Thu, 09 Apr 2026 08:02:20 -0700 (PDT)
Received: from ?IPV6:2401:4900:8f4f:f496:a1bd:e74b:4413:84f8? ([2401:4900:8f4f:f496:a1bd:e74b:4413:84f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261b6sm29782954b3a.3.2026.04.09.08.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:02:19 -0700 (PDT)
Message-ID: <7930789e-6930-45b9-997b-0e5c850db194@gmail.com>
Date: Thu, 9 Apr 2026 20:32:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: nxp,pca9564: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-i2c-nxp-v1-1-8276ccbd95fb@gmail.com>
 <20260409-rampant-swinging-wolf-51ab4e@quoll>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260409-rampant-swinging-wolf-51ab4e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 09-04-2026 13:56, Krzysztof Kozlowski wrote:
> On Wed, Apr 08, 2026 at 08:23:31AM +0000, Akhila YS wrote:
>> Convert NXP PCA PCA9564/PCA9665 I2C controller to YAML format.
> DT schema, not YAML format. Look at your subject.


Okay, i will change it.

>
> ...
>
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  clock-frequency:
>> +    default: 100000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
> And if you tested any DTS with this, you would see this cannot work.
> Look at other bindings - you miss ref to i2c-controller and
> unevaluatedProps. But the problem is that you are doing something which
> would never work, so I have doubts that you know what you are doing. One
> thing is to make a mistake, other thing is to post something can never
> work thus putting quite noticeable requirements on review.


You are right, i missed referencing the common i2c controller schema and
did not handle unevaluated properties correctly,which makes binding invalid.

>
> Please first learn how DTS and DT bindings work, before you post new
> patches.


Thank you for the review, i will work on it.

> Best regards,
> Krzysztof
>
-- 
Best Regards,
Akhila.

