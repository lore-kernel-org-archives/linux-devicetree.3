Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0281FE44A
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943998; cv=none; b=c25/nWFvGKPA1W/wijJhCq/F5GR2KWF7wynlaay6dmyp5Xtw8JKRq7xd1eIS9cnKbG3LPKLXebs82Iv9BvvsY1ZbWaBBqcBbmQCtXwOKu///UPoX+nVzBzVpBiFNHQcVWkavxnM+KaRV63hw48lH15xkfhswOqU39t2apHXaU9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943998; c=relaxed/simple;
	bh=32S7wLkq5+tLQBpm2lcEviLkDWVo0Khy4ibvJq8FX7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYASIWiAPINcMW0gFO0QtO9fhq0ZFz0L0yvDThKZ5pk6e1mWxexFz9xOv59CrF7uJNfLkLM006DkHGEOUonKhrAu8OuwjbDwuW0YzmbTDmouhUMjSAX+WgGBSrheKAJODh8NH5efP51f0Sl5+9cq++Uk35K7nphTKFNf24yzsq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=d1P8ne3m; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="d1P8ne3m"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso14513525e9.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786943993; x=1787548793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOAzM3F+gJS+8ekXWLBSmACUEeC2z+0rXqaknxPGi6s=;
        b=d1P8ne3mmIr/eZfpNRJzMjatk76pNn4ddUo3uVDsa6khKPhu6AsYKtiITfy7kAF8aD
         mQxkg1I+/fHd8ecrfCPUYxa5p63droHpndgLLEiNhIbVovOcSut6qS1y5PbTGWHKAHxl
         4lnTk2gmnQyKLq9oZ4Nyu+aRGiQStuZKoKetBD+/3AW94q+ukOSg2Ub9VMEHvTxEN+Q7
         o8Z+vtaWm/DPIU8ZG2UYGKlv3MeT4LFQADF0WfXBpEg8ukIIOs8ixHBQNU4+xQIftMl0
         lRmAP7uAU1tLW/06oTy5zC6EL7F/ZFzw+tnQ+QUxisp1rMHxvuru8gt5jw7FmcgLQJwV
         rKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786943993; x=1787548793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOAzM3F+gJS+8ekXWLBSmACUEeC2z+0rXqaknxPGi6s=;
        b=SmmXhcOWFJ4zZnGXQr4ytx6zVN9+Wwdg+Cu4b+lxnCZloSueKuVf9c3j5iKfXrvU4d
         d92hkTpiEkM7tjg502QoIElYyre+eJJwrDNIVUtrmvCrBnvsTNoySaQJlUpxMim9Rv6f
         Nmjfx1BFvT66ImDQZc/R/2k4lfmMBFlveCT1RAQMhXVPsjlICyam9awabDMLsxb8zJOZ
         2uAb/0FAMOxCZDl5oSug8dj7ToRFLguAbDHx0w6OEZYPnVa7gNfrGEB9bYZJmVOdM8NJ
         9sXgI4FIMj6zdLfiRxfoQVJAtvzCwj84YmvKozyH0DsBwtrVWw7KU97SKGprI/TFYac9
         gxVA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp3J6E7sY2yHQbp8ExqrPjuJvgyU1iNBqhoXNcQ+77dHPhxpccRrgRhzolj4c8Tzl8MOr3qaaARpEG@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrAoeKQjGK8ub3mDwuOV0k+xPhF8/cx/WjU9TrEi8JUij0kMs
	DokfLYvnb83zu0peJZzklkTU1Pk2yfVkA7dAauuLSZiFjx3HVlFGOuLJB/bPiV8Z78I=
X-Gm-Gg: AR+sD13y20hQDz1IqLd2eGwOKnP2izEbIx1RZi76Iw+az77Ijxg11Zifs5ksGUwHK5r
	DMc/25c+Cx6htmqGYYLXHZf17eSnY6dgjFDlPBV7c/z28Q9xpwk9b+Zp70C1GimLUe0Rq4Ll7VQ
	ykWxlR895KGG7a1kVFl15B3Wm0utLsE0iEHpJhnmv6CpMtjKN8INEpyXk9IZkAuxUzSGHDvWGd1
	7PiFFAOjBS4EYyi3DgWkBX+ZAGbvpe/Dni7xJg5akZxW5z+6TkWlYx7BHI3ayzoY9OtxnAlyd/6
	8/igVc7pcHS1psRFIwUC+Cf3ADZg7hAroDWQMhHWoLuwZykK5pEYjKlrs8rCHM7tr3ODyi/aUnB
	gffIEsu99+jzx1mC1DXj7x2/AIcEr9v4rhMBvPADCx7VfM6OiiMihDjElXnMjGk9E0VxMTVN9O4
	CMHpz9lT3hceO0XD0iZVpluK+75WUqCz9tiB/AzpA2nDPfTYA5EfQGkDqB0Mke/QfY+kW0Q1FBc
	dsPdr9sgEg=
X-Received: by 2002:a05:600c:4924:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-49987971a6amr210142505e9.9.1786943993346;
        Sun, 16 Aug 2026 22:19:53 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b51asm836378f8f.11.2026.08.16.22.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 22:19:53 -0700 (PDT)
Message-ID: <3c11637c-8e81-44b2-8692-a5c7940ab7c2@sigma-star.at>
Date: Mon, 17 Aug 2026 07:19:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: ti,phy-usb3: Add aspcie
 reference clock setting
To: Rob Herring <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, rogerq@ti.com,
 Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
 <20260806091112.164695-2-david.oberhollenzer@sigma-star.at>
 <20260812022031.GA554483-robh@kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260812022031.GA554483-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/12/26 4:20 AM, Rob Herring wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,phy-pipe3-pcie
>> +    then:
>> +      properties:
>> +        ti,syscon-acspcie-tx-rx: true
> 
> This has no effect. Invert the if and move the else here.
> 

Before I send another version of this patch set, are you really
sure about this?

Not only did I copy that entire block from the one directly above,
(the one that is supposed to only allow syscon-pllreset compatible
is set to ti,phy-pipe3-sata), I actually tested this by running
make dt_binding_check.

If I intentionally break the example by setting a wrong compatible
string, I get a "False schema does not allow" type message, same
as when I use the syscon-pllreset property with the wrong compat
string.

Is the existing check broken too? Is there something different
supposed to happen?

Greetings,

David

