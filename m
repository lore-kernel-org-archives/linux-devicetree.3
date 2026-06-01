Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A1C3A4F5F
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323555; cv=none; b=PfpsqvfXqBPuANgQJ55pIesdYJ35f366tYhTo42m3cq356K9dB0rp3vzl+62bBTN3FaxtXBZ+SwwRDAw//B+LszUQ0sNsdVScD5cYGh6ZzGrV7GO9IfCgnHKUjiPlemKYBI2OL3laPTYzbV0nKON7ixHh3b9B77hnvqk41XHsPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323555; c=relaxed/simple;
	bh=0WoyP4VFmcWSwZARoRzXvbXDRI6qgb1cEPd97r9v4hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9zlPY9EIWJlbbqsgpI2gZZW3K9scby0Z4qKkZvA8EYSoDn9/UMPD76zEk9gkwMKaMgYGY+ISRnsp1IKqjKFHYNMI5UlpuYSVDbn0bxLccQct/a2zAEAAJwSY5bBouPWR58jlvhocv+Jh+IEVWilQZPe8GURMd21AzY9uLJdouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZxjuRrMu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxjuRrMu"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec4639953dso225898366b.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323553; x=1780928353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=ZxjuRrMuYDzA3rbOcotlPkR4hCmqVGj50n0Hkyb5ZohgwZEi0WitzUHLk20eAVDJW3
         1HIyrgzTWhSaSNw+eSMlKICJt6tWS4BPnCU7nbuKXiquJAcoRi78cFnoV/40+uzsYoE2
         xus8Z17HBFhnbhP5y0Ydh2LTSylA7nL0BP5Q5ToCEyH7k2l8x258yA6N21vutvSIFu04
         C807TFHrTBtW1cSpbQGRj+VD6taq6Wov7pXhb0D2GSK9Gg7VU+mz1s9riWRxcf6jr87N
         YS1uB4PZQUV6XSpebskCxJ8mzZVIfEHqn7kxien0rFX5Wh+OMiybYmd2A4AVRBhsHWRd
         ZvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323553; x=1780928353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=LUpx5eCCp4fa73OTY9SYdRhrvtwvxgLAcD0du5FNxCipiiszO8a0rPb2Cr6zTWMNMW
         F/uDMJy74EMon29OKX01j1qa46BlmmkcJjjzs1AbxHT9oxE05e/gjTwpBsaZlDSgV2as
         nX5FgZrhx+b7vkvmhardzeEwVZ9hqZH1rED5aAXTrLXfiXdiZvaNETmr9qtLYihj/6FS
         M7eCml5SDB3O+2DuSjvVh0OcEGDQsI+Cb0CInD5znT2s9UAJNfhX7xxlxztP8VmkuvGi
         6NhiUoVdiegb7hemngsqCG8PXLduAAwabo72Qzdz7roEFnTxoCOtfhnNhPEbxy0cXuve
         FqSA==
X-Forwarded-Encrypted: i=1; AFNElJ8PYvDiBlyEYXSq9hztjqddZg8zM5Lf7Ucm/CzG0KtHC/1r5Dc3zR9ttt+/hhlqm6x2EDuv7zmPfwCP@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhgmupoUP9imifGXixi9sGBwrCzQrCEHJ9EslYy4OtrRVa5FH
	M52exeABXA96nenr396lI0Bxlc6fLP3aWIleAcKk2mJq3bboN0i4gJhEL27pla7MXyQ=
X-Gm-Gg: Acq92OF1/m3+y7BnCo0iWMRGERFv8vWhzC9bETEDjDir8bX/tFWV9hZ7N9ahc05vH7y
	vSWUlPds0KC6y+XWxT/+6AkCEgpWp7q2a2lCUxFQw+kswttHTOlZn3S1IlETje+/sLTZkMs2NNZ
	AyLudI+Wp8CTiWOAOzI9U3kBYd9FWU88hYJh0P9QCu1dWOHOIjz7KZkjzoEg53f8gwooP+VeP5C
	3HcU4xYoUrGEiwr5H7st0wSt2ZeahgY0cykWoQ04kLBvvxr4s5fP69BmOrqB+s85jndTJyegL6a
	dDL4s3jPoeJKJslMz+t/N+PL82n/9LwK06rvgsvi1+egKgZnY75p8/Ev+a01ufk5Jpko9ZWPllS
	Xf9aWqkBrVZ6uTfJUNd0YsfUGAq/lN3YhaoZtDDeWWmYfx0P8IR16+UIMPvpcymVxMLTRR63BNK
	HWc+svUJkl4qDEn60x48ch86ICIV5NFoKnpshpK/40p08fMw==
X-Received: by 2002:a17:907:1c0e:b0:bee:215e:5480 with SMTP id a640c23a62f3a-bee215eabf1mr180015266b.9.1780323552444;
        Mon, 01 Jun 2026 07:19:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7dc1sm2092485a12.9.2026.06.01.07.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:19:11 -0700 (PDT)
Message-ID: <624b64b4-c524-4436-a338-52551ad9c6e8@linaro.org>
Date: Mon, 1 Jun 2026 15:19:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
 <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
 <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2026 14:55, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:31:08PM +0530, Nihal Kumar Gupta wrote:
>>
>>
>> On 01-06-2026 17:01, Dmitry Baryshkov wrote:
>>> Is it completely compatible? If so, we can drop the driver parts and
>>> make Glymur fallback to Hamoa.
>>
>> Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
>> probe a non-existent CSIPHY2 register region.
>>
>> All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
>> to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.
> 
> We have all the resources in DT. Can we not use DT to determine whether
> the host has CSIPHY2 or not?
> 

With the CSI PHY driver the answer is yes.

With legacy bindings - you depend on driver churn so no.

---
bod
