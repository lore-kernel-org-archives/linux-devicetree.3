Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907C3C7DE5
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043821; cv=none; b=qGYP6n0NNGdHijnLRgteWGRBjzGrwzLFyRJtvat8AgMj91sPcGW99X1l7EKuVuY52h8F27mfa0P6wGL/YXld/+9o57DK3aFO45pOU6Kn+9lq2Trk1FlpYDSin5yp7yqGLB4D/q1pWi8eESYU5RLEtz/bJLhOfzZVzXOtO+1QyRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043821; c=relaxed/simple;
	bh=DR7P1aIkksGz5fJP1gbEDWYgLqBB6bN1oZVyA7AF31Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFtKCwR7ZhCTqrOUSQBrAjWrnZPiA2TAjfWae7/QkHe2IpbUFcW+GqPX8OOVRwEaepPdZv38pAIRVpav6fufMsnGbtd5QfE4P7A1hAANxdYu50ztkqi4O+bBcHvq6CtI9R9NAP2U0Pda7g+W2i4QF8UknRUYouTDwtT4tbBGrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKJa5LvJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKJa5LvJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2233497f8f.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043817; x=1775648617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7XkTmsVnKsGBJ3bVNB0W4W6t/Rs8a6UCi6Zycut7Yk=;
        b=vKJa5LvJ3xSouy4MKgUcDXQeOAOYueOQjvSmKrlCN0WUaSkJekHZ5g1eNySj/NX8V6
         WkR23m1T9fLU0UtPiGZBiJf8ezotAMrvqCT99Qz/u66Bg/86/oYd7TOqGwuboRcEW4MJ
         AqXbmCNw6JaBW0tgVwBcXHL9EAH9uhyXkz49XtMP+j7emuseQ8/REdFz3RSJkxwFTbCQ
         r4G663U2/8eb/IniM6pMOVRCIuQzDlCOEOaBinZfEKfIq+cHbrMn3Z3ivFzyIVfB15kE
         ZyK7WSN5aEjY83gsuVxmtmsyS4CotIeYX3PEsm/jUDaknlYm3iUM4Eio7B6i1nklYsOx
         FSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043817; x=1775648617;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7XkTmsVnKsGBJ3bVNB0W4W6t/Rs8a6UCi6Zycut7Yk=;
        b=oDhegt0hwqDHmLkZDE7ci0nloeeLAs+dyPDrLTfEbu8Xk5kF7g2dTEq5WlTW+4uHmJ
         PXWgm1K1CQLm97Jk3MO+fDMSK10H/yNpjVjhHyJp8cBcbQ6M41nmTw4H5d2WNsyqg0wn
         c2JR5+NyhUWmzcrpN6P3ty2NhVUeIhNsefBFHHvg7Fi3R7JGhVhB0O20oUFydfBYswGA
         VQSw8GIm16w6FYS6JAlaPmdpCp/EO0xCIJ3tRtEfVO2x4lh7UwfuZfQx41kYmCZqLQTg
         v73/F7RluWT6DkjOoHz8vEaHqZwyBhnExX/M0jjLyXn9bGm0JWEOBhHvLJteKnWvNMQO
         pssw==
X-Forwarded-Encrypted: i=1; AJvYcCUULZzOMX4q9b6cmnPyKMXb3dOtcKq8eDzhJdDqazEWfj2RvjaTbWf8HUMteE7fk6G+wHDAFj8HQCJh@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtQYVrthYCyiADkWAI9M2CVSlr4dXb/hA1wnCp7VAnqWsM/Q8
	rdqPav4RS4VYrN+DOXstjvIV/WpRxID0JueRXW6WO/oTQHZdMG4/RaMpjCSvwW3+g/U=
X-Gm-Gg: ATEYQzxllswnIpAKrtcq7tWnTdkBnBohDOFZw0VwNCCQI9JiIJUQkL+hHb57cGhXmN7
	cxoT2aqGAYDkz2oRyKWNByLsJqECBr9/n1IV3Z1I7JhxLvUNHknpL8oSddZljDSLEcSAFgRn2ik
	8WmUfPpiagxij/uWGFzUOibFaQXMV33Oc1fLr4Be5GH0Wak4/mOiT6Mj6IZk1KGOUJs266wpCcn
	MtNtr0yDQ2JJmVRzuYl3FpuaA7zeEJ735VcWjSqP3uE2KuJWBbXHfCzWxk1PAc5gg0DpmNYq8RW
	llzqfW46ScMLBPesLxy+UelPGeJV6gnIFehkD5s5qugGmt187edjJIeC7+A7Ui5nz99rF2dtfWA
	JaefmExOSZkhbllfBPISGl0JKz2L/IgxIJ6OvTYvzeky4yZF81GprU98LefqlpntkxEntgTYeAR
	xyKTIUWfCSDJCKN4WBRRegiLlzblagyyFsf3c=
X-Received: by 2002:a05:6000:310a:b0:43c:f40f:6c91 with SMTP id ffacd0b85a97d-43d15047eecmr5731562f8f.10.1775043816883;
        Wed, 01 Apr 2026 04:43:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d14c53928sm6998899f8f.5.2026.04.01.04.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:43:36 -0700 (PDT)
Message-ID: <9ed8dee4-315f-47fd-bddd-cff0d096a9e9@linaro.org>
Date: Wed, 1 Apr 2026 12:43:34 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Ulf Hansson <ulf.hansson@linaro.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
 <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2026 12:41, Ulf Hansson wrote:
> On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 01/04/2026 11:46, Ulf Hansson wrote:
>>>>> The intent was for this patch to be part of v7.0-rc1, but I failed
>>>>> with my pull-request to Linus.
>>>>>
>>>>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
>>>>>
>>>>> Is it possible to drop/defer these changes until v7.2?
>>>> It would be very sad.
>>> Right.
>>>
>>> Since it's my mistake, let me reconsider. If I rebase my branch and
>>> share the necessary commit through an immutable branch that you can
>>> pull in. Would that work for you?
>>>
>>> Kind regards
>>> Uffe
>>
>> Yes. Please go ahead.
> 
> The patch is available for you to pull from the immutable branch:
> 
> git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain
> 
> Kind regards
> Uffe

Awesome, thank you.

---
bod
