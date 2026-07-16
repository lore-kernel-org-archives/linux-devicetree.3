Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857541F342
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206334; cv=none; b=predF2FKtbd9rAd9JV4l78N6z1KF1dOhPZpV5tuMX2/tRCfk/a0DZ6stWPrWg41lfm3ahHcFcsNqvOt3O6lO87MpZu7nY4eBsv5McSoy+2zTOGw4+UYrpZxuXRXTCotamWYbBm5o71vbdZ4K0twn7ao+ThoZOZrebrxv87oKbBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206334; c=relaxed/simple;
	bh=vAA8pxZ5/QO9WJwQ0ohnXcdfj+/EDTgsdWHMG8PbNak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC4DrcW7V/Atjx3XKA99L0svqPbhM0/2+mR6BY5WF785QaPR42B0HRmH92iyDzhZZSfOohihYGQZDJito4Gy5/mrT53RqL/WYyoOhF5uSEkQd5uZhbh2I8E7Rs0dn7f5RMQ7JhPDNlvtIpfvlq0lIpbIJIzllFDXGXeWsZOjFKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsWZshiS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsWZshiS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso4083859f8f.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784206331; x=1784811131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CL1+h+Sv7ciDTM5rA1EiT5WxOx+c/keG9qg756/bbt0=;
        b=PsWZshiSjWBZHHBj5BSL8W61Ht8s9oLWMvGafStEr1/tOZeOa6lWeg+2wsg2DSSHuW
         +AZTZ5uzuJb5RkoYARw2PL5xmBuG1UmPf9GX8QvxOKCA3pBtY8GQ+x/eyOk6cLpTavXz
         N3GTD4zZgVpSZ8AzxXCKmlAunxXmYR/DDIYSqgihyYEbc1wBIXAp45CvOFOyO7bKA6V/
         CYxxCv6hv8hcUJcJ0TyYRvmsMeEzqU1Ok63GIh/nrzy5rXoS4+9ZbopDkAxtlhroZeQs
         tRWCe1knq5C19+aA52QCp/GPNJgffgIluQP8/9gip9RaLlOv88dIVWluhJ5yWMTQQC6A
         5VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206331; x=1784811131;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CL1+h+Sv7ciDTM5rA1EiT5WxOx+c/keG9qg756/bbt0=;
        b=BxcAliyiFOuWzhRGVtvKll3R8Esoygn/jn4iS6wEfA9PsV5k78Ca2vl+2II9apVGep
         FaRHEiu/Ydt5gOvvXiLX2HVDfZPyYtLqezqGuoiVi22WK3sMqRMvq5hizcoN9TmB+3rP
         552UTtAV9NZK4eQ4kaBQJ8fjvrei81LkjJyh7TkdBuBMw12z2HkTdYhAcIookAOBQytr
         3LUTZfIbH5jDGxPyl0YNJLLg2gR8ZEnFzEQNDYhXqttcU7I3qL4MqRcxlfTc4wrpql44
         CbUyM1A5svK/VhVaGiwYJvymyzqKD5/jE8nh8O/mmylKZYfwwauIUybhpl7t7cWk6yvw
         jjTg==
X-Forwarded-Encrypted: i=1; AHgh+RqaY+m4ewlp58a7nhHtB1L+zbC2GlU2klfBhq8TNTPAYc3jXQpUX/NR6EliJdCw6lf+mUbsWzr16OCf@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjVOs1X7IQgSQfWeThdGOqC6aS2CpdcoSab0krtNCrKYPaqvw
	lQJnUiyHH8YceUXHoc4R2DSZUgLOkVcavLtucND8+BmXOqaxK4AONrHkPPpul9j6kgw=
X-Gm-Gg: AfdE7cmY/l5zo8eLozBEts6GepisY3PtIFho2OK5QokSiXpPOyg23kBUvx2CUGYmntB
	ZbD5ZIbiVpmnVts6oybMnuncPRlSp9lYWFb0TdXDjn7YZCAMwPwBKjMgYnR5+iUsnLg4pqUpB1a
	SxfwZLxqeGLsYeSwUMcHWhOsTvadgrFo8TnJNYKTnGFNJ/YODibVGfs66qHPqvl53eyO8Joj3Wy
	mVft5MjvZXeYQNmIHzMvF0i6n5FLCGKAnpbQ2sFszvzTeBhDvpwqn77t4taE3Bonot5VsjrUT2z
	PkRgijejOECFbZ+5CuGJYr8Xo//kDMbppFIHUyyRw+Qp9+sQ6lwtEOkYp5PYBZ/l9JThcNmXyNW
	MJqv4YqF5VsotYQUV3l/Pp6fxJP+vTz+jdrBWo0JTA+WGu0er1Osb1sny1uZ56NG1IUQxXaNuMO
	EkcEVrLT7R4EHxEA==
X-Received: by 2002:a05:6000:4b19:b0:47f:56f7:7a57 with SMTP id ffacd0b85a97d-47f56f77d04mr3955700f8f.28.1784206331245;
        Thu, 16 Jul 2026 05:52:11 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.36.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm25433837f8f.22.2026.07.16.05.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:52:10 -0700 (PDT)
Message-ID: <c6015615-278b-4840-a79a-9c7520141341@linaro.org>
Date: Thu, 16 Jul 2026 13:52:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
 <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org>
 <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org>
 <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
 <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
 <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
 <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2026 12:28, Loic Poulain wrote:
>> I just wonder if there's any real upside to all that additional work and
>> delay/churn.
> There is no really need to support runtime configuration as of now
> since we only support D-PHY, so the delta for v10*should* be tiny,
> either a bus-type sanity read in parse_routing(), or even nothing at
> DT parse and a future configure() branch when C-PHY lands.

Right, well I tend to agree that a runtime configure() is out of scope, 
so, I'm going to stick to Rob's guidance.

If you look at other upstream stuff you will see phy-cells = 0 for 
single mode PHYs and phy-cells = 1 for PHYs that can be in any mode.

Consumer configures the mode in DT like every other upstream MIPI CSI2 PHY.

---
bod
