Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E42E2E8DEB
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094782; cv=none; b=QDKTSEH5dtGW3wbwlDMa/+awS5kW+o5PDZOjC4AjsowUiO019SZ94i2a/JohZEzlKKgjP8lGazfeLj24UcpYBrwC6gG0mC1IuhRiW94E3tID/TacqasGXuyx3YXPWpRDA5R1HvQGcuEwFeBtDbwDiBVoP4+ivgz3FdcqeSI6Fv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094782; c=relaxed/simple;
	bh=hMWqUTIAU8G998BCS9HztTdOjVZu+N1wXMmpnGGv230=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQOVN5yPzsbJW0Hm0ExhyALJG85MEjNiLOL3xcHB5qvQt/ViwCAww0R/K6Vk6b9MS+fRhkGm3dyRTF0ijDIwmHuDydvzvZFZQ800LsesdmtcGFMSHZMchpUU8Z6onnO/OnHAg7FH5urfhFwzh41lyJWzl9y658hZITIqe1YFkv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZG+ND7+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZG+ND7+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c7902f47so4634395e9.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783094777; x=1783699577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hMWqUTIAU8G998BCS9HztTdOjVZu+N1wXMmpnGGv230=;
        b=oZG+ND7+ERyX3bjgMBdk+Z7HV2o2wmMvcoPtFA+D5X6jwI66aidDR7iiJ3mSe58kUW
         YaPe4ba+GZYr3t0b6IoB4owLBbtzYFhSYhvOz0HcOs/ajtWQEX0q0dX15npWMItv/opu
         k1gBB79gaGLlcl5F86ea+7QMHFOrjVMJGa6BdoosYK5Sa0CzVdmgR4CyTxEM8RX7mOju
         USjj6SKHsgjSNMl86ErdJW0vVopgB8owXXgFWlrGaTcF3lwhYid94hxLb7FlS2tfJJyo
         Xh2n7uwkLvn6f0uImIPFaksBFObH6dfBsASQiUTp/tVQz42DFUosxwVmZXK5XwjNN4Ft
         /Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783094777; x=1783699577;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMWqUTIAU8G998BCS9HztTdOjVZu+N1wXMmpnGGv230=;
        b=YFq41e4QOf9eRPC7olr16uaWD8vwC8ZF5w1sAWdmPak+bNXgbW29TrGU/YzfKN176G
         acCU4xiJW0YGlRP4xVGSMfxCEIL6/Yy0z494s0Dg6vcgPnapgYaFLFfhCVh+woAmdsQY
         xc0eQXY39t83Y3DEe0LA7FKdiDrp+eY4Mc9to0hHy09uNr0WncWwGUF5mGEELSOr9I+d
         EBwUY4gHHbRqhb5jmXkk6eJ6pbzgiDUGkCZ8zCfLrbHeFvZUGfUDIiqLeNzQXgyzhI2Q
         42BzffAwAn6rs82550EyTXdPmngww86MwM8z3Eo3vBjPCbXuTy4jP6XfVNRIMbv5gC4w
         SURA==
X-Forwarded-Encrypted: i=1; AFNElJ8ekmB9nmn1x59iN40Edr3/gT4vNiXhXDrhZw49cp1H1cJxZy+TPzSwnoQRFrdDONLGk9Ie2+JwOifk@vger.kernel.org
X-Gm-Message-State: AOJu0YwruOF+XBoFB/1J0yLCSHMAmR+Yuhgn+kLFpGquX2vCVmR2AUN6
	gcU6lRFHerwWowhXUHT55kUIEqKrZpsYIxGn53N+ceKssAhWmF7YCAvnzMR+XOJdldugaOsTvqC
	AJrZI
X-Gm-Gg: AfdE7clAxZ2ZPhpTyFrK7WB6OMOugKluHOYNxmarfQL0qf3YRxeTk54iQvh9W2yGRvN
	1BjJM97L56gBO7zzw8JkjCmHM9aq9/9s4zHo2XIXuVdw1cHU91aPQcCY51G5TWvH5Y5awQiDe66
	bs6mwsIgwrEHd5ERiBfyl16V1Xt6jps0o7wv5SnILyv7zUSUncTTcf3ulqHGTSV9aXLhrNJMJ6C
	oNaIMe8qKnMF9APvlCoezyanrSJy+F285F6mkHruzEgCWLebod4ZEMbuL7dzQizaQr0tb3cNeiu
	YMYUApGn6MQW1XcJNrkflpI4JtAgKtWRAl+c+BTac142eiIQ9x2nHVfqawBwOLh7XjmzXH8RguZ
	9VIQqr3GzcG17ENhieXPk7rW9P6Yliy88uXHcznSvf8gX642e9mafzReJft3hoLDH8j1269qVzU
	rPi+/cT7BL2K9546fxIonqngXz6dsh3jjPB+t+ow==
X-Received: by 2002:a05:600c:6099:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-493d0f54802mr4622835e9.38.1783094777502;
        Fri, 03 Jul 2026 09:06:17 -0700 (PDT)
Received: from [192.168.0.101] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm286379f8f.36.2026.07.03.09.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 09:06:16 -0700 (PDT)
Message-ID: <2d10dd09-13c8-49fe-a5e8-1c1ec1a56b05@linaro.org>
Date: Fri, 3 Jul 2026 17:06:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: qcom: camss: icp: Add HFI/ICP v4l m2m driver
 for x1e80100 BPS/IPE
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <w94ETgA980W0Endv5HbqmfhQ2P9OKvdDKCK0cG7r6NWTt9iDZNMZWm900gZoKHs8Pu3gj91rUQeZVH4M-WclDA==@protonmail.internalid>
 <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2026 16:51, Bryan O'Donoghue wrote:
> Speaking/listening to several people at the media summit in Nice this year
> got me to thinking v4l2 m2m might be a another solution for an offline
> engine like this one,

got me to thinking drm/accel might be another solution

proof read your stuff please.

---
bod
