Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCEF408008
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204553; cv=none; b=YvBcTfTHR2aYDHd22OCsP8IYgKch/4W9Ry6Jb/IqjimI0QRTAbCQeOlho+PUFlr8MWdFv4W3vBhp4fKozgi2USX2v+2+2tPjDmL9QPbH+BwrQ0zv35D0uAYMs7uotwv4/B6TFeQ2Dm4qH8F/w2B8Qwhnh+8Fjt4ha77TSZN0dEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204553; c=relaxed/simple;
	bh=N0HBUn9Mh5pL+ucb5UEd0fgcswa/bdyHlGsPKKEWNpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rH2sFCs2lsabKg7I5evzuY5OzJtHHn3otlOyaTmedi8pcNQeJ9YjqDcOKMbV8pVVqlpm1lRASQjpO0qHPY0s/ZepM3lwzk9stRF5WNjOMMINGa8B+BiQvfYFLUzvEF7RvnOzQN2SBUXfv0KY6XW9I1JqMi99E9e6ngpXFxbHR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaI3lp+S; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaI3lp+S"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304106b1204so260417eec.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779204551; x=1779809351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/se++TNvk8+Q7Ds+IWKg6JPvzTs/UdaVZJDuU/0ji0=;
        b=LaI3lp+SOHHGqWsTc3Y2udZlUufakS+84jpG2r+dx70bOviSCVyPWJFsi5TQK67sLq
         ia8x0JO0piWSoMI+nt1ixS052TZTqLsZQqBAgvgYLoEyjy2mPRX7gCqvb39XrcjJL7sj
         spm0gBta62dH0kNQcf7m0FXc3bxYrvZdbxwlA2DxGHBRFA4emmg4TD8SPbXZjdJgDHgo
         nABPUFHjK24H84RtT5kG6/XmB5+CqevlhH3xxC+7Om0rwX1b40sRUZ97ApiWGx4WWYAt
         fjJTfW5+ZpR7YEqLr/99HnA59oB2x4hI/je092DQ07UxXOff6uYPpMNFDS1hzXG1sZfY
         QBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204551; x=1779809351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/se++TNvk8+Q7Ds+IWKg6JPvzTs/UdaVZJDuU/0ji0=;
        b=lMMu7A+QPo08vv6JgmuBVFXpw5SRRD1nMh87u8OYFMauxSdUxubE8OFF6ifC8/q/LB
         GRHknIeyu+w6LnLKR4CC7ieScSl7GtZyPbJMFhN/scVwo6RClSJiLiQnNkj58gGnLlHk
         wHx9Yy2Oy5STWVogd/f0isaxyPfzJ0hxvhef40KVb9MKFPAOZgErN8jkgXwbALyi4qrs
         2icfKwzlljH+mKZ2+xw9klYHPd6MqcecWIKXP3bRCYvuOALpl0vU2pCnWiMlrd/UtVuk
         VBoOSM/uBcHxLsA1YXexUlDAJyz15q6o6m+yRxbd+o9eC3TenVisu+4JsrxAcivqX1W/
         gBQA==
X-Forwarded-Encrypted: i=1; AFNElJ+JwrWBQQQIGySe5SUhTCAn7GzhPRDyo5y6w1LgcXcaDX0kY/b2/Rf9ScLWnrMn+ItzQ5misr3u5S+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjNwsfBF+6QHFSCPOgf0AtY/J6wC0XW6okrXgal89OPcbQXfF
	UtoLQ7X/+qKywgjf2R8gmW/uD+Q6Pt7SpV4S0neRvmWgouiiBREnGSFD
X-Gm-Gg: Acq92OGnvR0zMPa6hYT+azVYzn2n8p1Nr0hJDnZdOsfzheV+HstJTxBI/zwClOC9i8i
	Gnbr+vCxNeK74xyNkbaOO5LLcMjginzo4lGwArCxMHNqrccQPqd/c3NtnOa0kqF0fYzcNzrUIgP
	wXktU3509NijsdUdLAr8yJGznKUtbytQQcQrc+HAeaqAKSZTfovJiISuWdyX8RsHL2CYT+HaYyZ
	2IHtAzFbQl6NdKZLJLVaHwrkWI1xUxtjW2hYJHTfEoXYmiqsNlR7pfTBBE0cqIo+zCP8TAezdfR
	PS4PgU1jY5n+QNW4ZFAJaEAiNx5YHHrMXdT5AeRLvU0PWvtKvFnJzxec4g5GJBTBfHsuP6QSqa0
	Q0FV98Gx/3IIpGHRy/xyl8CRJTLJaAeNjKGLYNoyxl+1/lLym4n/APJypuTzdMbmVJ5pieMtvsR
	RyMYvLtKKjHfc4JK3GhNyhRlkn+1TR38i86A9Y9POmpHq/D4nlFdTEUqx0T7ZRMrgv41PkegLl
X-Received: by 2002:a05:7300:d4cf:b0:2ed:e14:42e6 with SMTP id 5a478bee46e88-303986bbe5bmr8933376eec.31.1779204551163;
        Tue, 19 May 2026 08:29:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm20207784eec.18.2026.05.19.08.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:29:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net>
Date: Tue, 19 May 2026 08:29:09 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 00:55, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Hi,
> 
> These patches add support for Infineon Digital eFuse XDP730.
> XDP730 provides accurate system telemetry (V, I, P, T) and
> reports analog current at the IMON pin for post-processing.
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
> 

This driver is 99% identical to the xdp720 driver, except for the gimon
constants. Please add support for this chip to that driver.

Thanks,
Guenter

