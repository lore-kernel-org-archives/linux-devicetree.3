Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515362;
	b=s4WPYIjCnrfjDZshWZ0Bnc3eZXl3JhrF60VN7ffhbx+KldvxhauuhBglp1ef9bRPQsM/
	 /8lvjed0Y5X43HuvLiEJnZchblAdE36rIvAZvT5kZIV62Yr/xd0363JqgaAB0kEzypwWt
	 5CwV0WZtefE1HAMjy0rzepWT66Lxz95hh2YZMO5t7X6ExRw0lV5PicLy8p1NbtCNKhwJk
	 QYY88h/WHq/kIz5H45HTteWzXBwEzWIu6VItQ5HpKu6g9oQhIZAFP0ri9zm6LmwCMyuJC
	 LPiLFLwcOGtcpzs90MyaZhoEnrHiWfAarYNlDcwXGJn06cLn5+HGL9WQtU08ppXsAEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RrKfr9NI9CivHaA8pHjFoPu8oHwiXk5e1C77F3AOha0=;
	b=yk7mYf+e3UNrGPViBgckMZ1f5CAhZekFlh7OeVoBeWAnHSiqK2VHQtozYCCgjuMvKo7I
	 MlWZtGUcxRoiiFQU0mS6exv+pq3pDegh6CnkhOnJqWTwW60w0gy1JbKYxevTh7ogOi2Xt
	 H0AgK5Lbc4hwVrfptu5KKOwf81NpDx9gT3nUwspTeQidJGL3pPaaB0WmSBjPzFk/daLt+
	 d01bLHpvfk0Z26BJFrW+dDdNdBV7yGQ89MOvqdUPR9KwqErKToqw/+7R0w7rOEwE56IFf
	 oC8trD2F+1FTiYUjZmLiftW2J2WrzeA0haBgLPNbu51QK+lTj4s9KwSo+yccKCvU9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BEzQ6evf;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DEE606A693
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DEE606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BEzQ6evf
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso3359381fa.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795515360; x=1796120160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RrKfr9NI9CivHaA8pHjFoPu8oHwiXk5e1C77F3AOha0=;
        b=BEzQ6evfQL/UWxcO1jMemegBaiItWgXt7K3ICkbaB+XVjQx3epFSxALyZnr3KEcsHE
         jmT41Y+/N5yi6qiRjAotOmDCy47AW8AmnIepEhRivFuxjhKXTwNLcNvRw6gyK0Blaj0B
         16GA59m5BLke/QdOwHVVHRtC/49B+83NGxnh1loplB9EHrgNYfbZZiCp7kWgbUv8Q2fr
         FNGNFC3FuI17j1Q/ivCovmgN0OgfUCrt5CpEnr4bQmq7sKX8fqYSXlzNYIl5e4T9EF5v
         0TK6L/KUhPXEbbukolilaEUgXwdFwYnfy5KpOpJdNUgAson4KD5hmJi0wS1e4PPwblQ/
         HzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515360; x=1796120160;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrKfr9NI9CivHaA8pHjFoPu8oHwiXk5e1C77F3AOha0=;
        b=STbOhZUEaW/mxwGDwLcaJBChi0d0AWwiJo84Wt9pBKka4wbphV0fjr0EK3G5ZNV8Ln
         crDgqX7qU9z2DHcMyLsKb7iRdzEVRQVkg5BTVZGDZSa2vbeLJCW2qrK80f9MKp11SVft
         U59pHvqPrZ/MnRVKeRnOYZEPzZBIXhzuQ5gFgck1gF87jPuyp5SZDMp9+l3GLTHQIi5S
         vjMNn0N6ZpgiKCTE+ICgLptTLMRQbqLVJOWWnNuqDhwrdT35gUaT1Wq/KBSv2F6VeSoo
         7vmvjEkY0skiCMj3yhpm3YzT1B7UXiiR9hLhPQS0uZ3OznLPbo46f1X9LPRH7KnI93zT
         ZLVQ==
X-Forwarded-Encrypted: i=1; AL+hErGx8A1VmLZLD6BXoF9OfTkCSKfn3LmgfrpuiyOEiLZY/NlS1j52UNjeikBlcIewFmOKXgyTzWeW2k+u@vger.kernel.org
X-Gm-Message-State: APuU4Z9rqeD6kPKQJmQ2v+IuCaginW0nnUqtLvRtsnaV5x3yaL79/nyl
	15jyCtv64dd5w/mq7TLB3AdQWC6MlsXWzZAHiLkdqi+DsmPZMuaVVz7TPB6MBYGcqLk=
X-Gm-Gg: AZFdTZfP+pTyK26mrL9ysFGQEAgSbTJ3bKtGAcLVZucvxWKi6xnr3PmfvxvovVvZ2/T
	4vG8VwZ3s/GC8IhpVaVumo6ZF6Wgjlu+jRn8Qjuhv+s++KEyCp4T2ImWaZwT9Hip7ZSyq0e2X7d
	PLodCC1aFbpMPZLxOuiPlL81v6DbORjWeFrhfpSeLWJkDCz2p09nzJFSoPjRy6Iu2jTnehXSvIq
	D8wDZIX0w4/Qypfb7mGV3501P5UVLtQmfqpxrrEaXK7MVmCX2xfjlfLRyTWNDsM1dMrxB9yyc0v
	geu2Xs9rNZfty08jIbNJqAvOMlmT1y2RB85H9naVDOdtpTUsJcKdKzkUfS0gN0IdNHouQ618mFT
	LiiH/gxlXveRddEa3ETZYfCqGI3Z5b/IDflskuzqPECdaOAy6nHXhhURcJ28Zw7SQDwYIoj8Qir
	c/BTjOT6P4kNPh2zAjFMgOPGDHhQ22uQmeY6RNDa/UtohEODhizcRRvoZUrUCLgC8UAzwOhRsaq
	Wwo3+TsXw5UaM8xyj7aW2blvSx/HboGGcpYuI+snJimPlg4L7AkiIJcDJXBMF64S4i756G6ptXC
	hCNCUdZGyeJWVjImBr0cVImN3HjF2BMkojj2Xt6+CpaeAo88DgU9oJ4XEVVF3Luk1A1QOUO3brQ
	I+2afxio=
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr30282431fa.1.1795515359820;
        Tue, 24 Nov 2026 02:15:59 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e211sm38976231fa.2.2026.11.24.02.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:15:59 -0800 (PST)
Message-ID: <a519c2ff-7d0c-4aac-9a17-b9e76913d659@linaro.org>
Date: Tue, 24 Nov 2026 12:15:58 +0200
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: Andrew Gigena <mail@andrewgigena.dev>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
 <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
 <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/11/26 01:52, Andrew Gigena wrote:
> Hi Vladimir,
> 
> Thanks for the review, replies below.
> 
>> Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:
> 
> The hardware can do combo mode, but the driver only implements D-PHY and

"The hardware can do ..." is necessary and sufficient, when you add
a device tree binding description, anything else is irrelevant.

> returns -EOPNOTSUPP for C-PHY, so the binding stays D-PHY. Would you
> like it documented as "not yet supported" anyway?

You may add a short note to a commit message, but definitely not to the
hardware documentation. Hardware is not dependant on driver status.

> 
>> D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
>> it shall be reflected in a way that two endpoints could be present.
> 
> Split mode is described in the binding, but the driver rejects it, so it

Don't look at an incomplete driver at all, when you provide hardware
description.

> cannot be used today. Is it fine to keep it out until the driver
> supports it?

This change provides hardware description only, and anything related to
one or another driver is irrelevant. However since downstream driver
provides support of some hardware features, it tells about the hardware,
and therefore this information should be represented in the dt bindings
documentation.

>> In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
>> clocks. I believe MX shall be added to the list of 'power-domains'.
> 
> You are right that PLL0 uses the MX corner in camcc, but that corner is
> internal to the clock controller, not a power domain of the CSIPHY. The

Formally yes, but probably CAMCC driver should not enable the MX power
domain, if I'm not mistaken, there were arguments against it and to
delegate such logic to a clock consumer, which is CSIPHY here.

> PHY only consumes the top GDSC; SM8150 uses legacy GDSCs, while on X1E
> MX is a real power domain attached by the PHY driver.

Here someone from Qualcomm may help to get better understanding.

If MX is truly not needed, you may add an exception for SM8150 CSIPHY
dt binding description.

>> Still it would be preferred to get 'vdda-0p9-supply' and
>> 'vdda-1p2-supply' properties.
> 
> Renamed in the binding on v4, the driver and the DTS, matching the X1E naming.
> 

Good.

>> In general the change looks good, thank you, but likely it can be
>> embedded into the scheme for X1E.
> 
> Clocks, register offset, power domains, lane table and timer all differ,
> so folding it in would need if/then blocks for almost every property.
> Would you still prefer that, or is a separate schema acceptable?
> 

I believe it is good enough to embed SM8150 CSIPHY dt bindings into X1E
CSIPHY dt bindings.

These two pieces of hardware are non-compatible, but they do belong to one
class of devices and can be described by the same dt binding documentation.

-- 
Best wishes,
Vladimir
