Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8873D25DD
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789763; cv=none; b=G7zCnlQbnqSZgiNVivCifrPZq+kIO4oDBtV9RZAA57MAF4H3vJyxmUNnxNBqPl/GLbsIKjKN1TUjGD19ZGKRK2YI7lCVFhI1K87KBXDcvdAu8jZhScCZg02B+dkdNtqSTS+FdCV+661hbWbPsyD6WdK8ArSfWSnBdftFxyDUaM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789763; c=relaxed/simple;
	bh=1WOWMSyv5ijDMTi+z3FvC6gxEI1E0lxP5EF3SlyMUHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kz/fcGkz4qYz+8wGaUIflI0gjREP/k/fy6+SSKneASZqBuHf3ZSjQxaTKH0EJwQJqgi8rGXA5V9ysjF1RRUqNvVAhK6BaXYxdTne5VbFx/Awjbqj7B8vMOj3Cbc8f1l78RPXyjMRa6iJsSDRkS/5hoVvuVfwAs7YeVKohfeCCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROfVy8PP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROfVy8PP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903974854dso42133875e9.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779789761; x=1780394561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sR54CF7mjFzC0QGjIQLTwB3SyWd+B75zHF817dW71tk=;
        b=ROfVy8PPsGSxCTRTWGg48mRZRJHHKPLF1v22dWOveFLRntgM3RX9ToHnUdIP/hc7El
         PhczOaGb0UhU/eMENNYm92/qJlyCJR6MEy3zGWyrOMkUSmkf1AuDp2SoUj/mO0YIIZ2F
         ryzSDAPMQFvaWzhbPCogy6lzS/qjqoiRNVUjmOUotj8t3aNKjtDEkh5j4dKOdF5IA7pP
         E+BOlqAKl0//DMFjMLJqW1/ML5n0maqEh8778K68vtIsmnPYFH2fHaAV/rvirbkO34vC
         Pj+7PA0eUEsrHWUnp2oWQSYTlgt8GkHsG8t1onIrH8A/YhaeUqg9X6n8LfavmTNaZbJ0
         Jnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789761; x=1780394561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR54CF7mjFzC0QGjIQLTwB3SyWd+B75zHF817dW71tk=;
        b=fT/hExs1b99QxRQ8MqgL6yKm0VEO94rZm3EsQm5jpRJTyhcr8Xi4KU87p+LABDtAOE
         xLNE/tCMyItm8i5SI5a4URNZXmecYUe+KdLRck/507dyXszsUwIbwTT3z4gHlATWptGA
         lGl+/y1+E8HkoL5xIdJuN+Dte92pHbaW33mN/dU+OGtYUwyokZ7N04lDvPewBLFkHLTi
         y+Gfhi4mqLtj0T7Xq/q+NFp1XtGzWbjvYnC7WAS6El8zYmwCO+6YYzxaJtTM76JO76ab
         V8teH7CF2pV0LZx8DZ/d65grBBryaPNkrmKK3Wc0LVZnWOL184GyV6oiBg1aKt6LurCs
         IZ5A==
X-Forwarded-Encrypted: i=1; AFNElJ/2MFTN8XhVWvZ++Gkwv7ywiAkXXNJKNcgnouUUC7HhjD4LT4w9jYXMWz4ud3V2aSQ/DCZXh5mWNi6a@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjpqCotsQH5lR5vLDj+kq07eka2mviOL2ps4PiNJ72MVgfOJn
	tXZrX4U/D3scdCIpfdTvQN/uwQFE99BO8zk/NIivR8woWx8OqttzuJdWatFO4amdjGU=
X-Gm-Gg: Acq92OEEDhPbmBetzi6RzlLDrdLpTyLYys5AhmkWq24Zc6OtaJfTQxeBUrpe0mNzPuc
	EHSw0XR+nlPBO+z87P5tyL3i+uGC8aTmK5tffEz8TBkrbybp2JKlTlzWkPsY1uL5jH4d5/soHTE
	v3kKMMTq1P9V+hoT+rvaP2NLpMPLyXLea6P0fYeUbCx6BndtjA9iyu9GBTK1Xlqa0/iIQqA5/Ug
	dpsjZQNJdI7Dnp4yehDJMdeMoGmMhYphNCG/BiLR7/7LFTdXlJvsCEhf6oaHrL0FNldr0M1Nm/e
	NlAje0Zucs2zLFyv5b+oKC3KRowIqCn4gzsesDDZS8Q5vdoMi+b8GZD3TQ/ure67TrWXhTM55Mr
	Rwo6Hhy1oCSe31ZOQOLMGo5R1Om3IKpPpcHRtQd4IJjTB2qhip7Lx0NryH57pHoafzEq/lEA6fK
	UV/CwxTL5I4+LJYb5CXffEBaZcahIayn4=
X-Received: by 2002:a05:600c:4ecc:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490426d4d7fmr296727545e9.17.1779789760577;
        Tue, 26 May 2026 03:02:40 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm36206969f8f.33.2026.05.26.03.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:02:40 -0700 (PDT)
Message-ID: <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>
Date: Tue, 26 May 2026 13:02:37 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
 <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
 <20260526-uptight-bustard-from-jupiter-291e59@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260526-uptight-bustard-from-jupiter-291e59@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 12:39 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:06:40PM +0300, Tudor Ambarus wrote:
>>>
>>> [Severity: Medium]
>>> Since the commit message and binding description indicate that the
>>> Application Processor relies entirely on the ACPM firmware for all
>>> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
>>> required list?
>>>
>>
>> I disagree. The property remains optional because the ACPM firmware
>> can be bypassed entirely. The TMU IP is capable of handling thermal
>> management directly without IPC intervention, so the phandle is not
>> a strict hardware requirement.
> 
> I see your driver will fail probe without it, so something is not
> matching here.
> 


Yes, that's because plain TMU register access, without the ACPM, is not
currently implemented in the driver. The ACPM can be bypassed in theory,
which is why I left the phandle optional in the binding to reflect the
hardware.

I will amend the commit message to clarify this. Sashiko identified a
few other things in the driver as well, so I'll need to send a v2
anyway. If you still prefer I make the phandle required for now, just
let me know.

Cheers,
ta
