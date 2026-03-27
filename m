Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8886375F82
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651033; cv=none; b=RLZtnwP5d2RqGG5Q8YJuLo1aiK4lJJPSq5dVmfSYxhmK6GnLykfZmPf1go8OJ9CTFC8qmSlTSr4yosYJWgLXtBNhEcoPNOSdCruCCXDPCxKnFpGVuKsrFtWmFuN6Njo47dZWlnQpErJg4WwMKKJz7gf8zYPpCSyilZCGUz/luuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651033; c=relaxed/simple;
	bh=Mz94M9j3CiZjbegbr4S9pqf4HEm+HXNGIzWBfuew2IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HawFYD9fU1H9bCWUoX/eYtjQAPrK9soSoa+CzY/2K85klrv57DM+3d5z9CczOQ7KyiDdIb6U9V6KLbHyKmVfgp/xI9jyv4xskWiM1TJds9sJAcw9hjuTDFOX/EHPcmvBiqb9AFb9xff72iYgVluXLbnlVxKWIeXXcbWOAUuqSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URoLuYmE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URoLuYmE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2632097f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774651029; x=1775255829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=URoLuYmEYJ20BrHmlwS2nQwpHOoYYMXHu7iPdwYNRxd7ypkWMukbTsIAPy8Ug0tdJN
         K8TmRboDyuZDd/9PIjPPx1d+HBKAhsa9foCwT+XJfra8HTV/uHb6bD9wJQXOvH3Nm9NV
         NOc6FC7ZOba5hp0/WqIpFHK0YGp++s86Hlnkus1H7NnDMnGPF6jPykv+f+hCsURLiy1v
         UB3rgtORpTXDk2ZKJh3hduy2iioLiwwFgoAcWQqFSBR0uwBfJBIbXjgBVnUsxzZnq8By
         xrA9o+eRZNOxoatng4dLXEiRSUa5h7t4lJuN+T1l151l+k996nb2hJvM8mb/5uM/KAZc
         /ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651029; x=1775255829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=hUR27bIgcVqiSjcGkK4hfRV3DYKu39sCC5g9kAXRRTXT63r01OFW1IaGsKPxcY5ian
         Iiq/ysEHSJ8kmm5aj2ntUZ8qKadYrSvjGg5U81gTyDwtJXL1YeddRklfBQE8kPc0/3Y5
         c2Hf3EJSYATSZdln4YNOAYhUxWIWj2xKiZ4iBZSWtb5DpZ/L3qappbaRP7fGz/1meEsL
         ncIJPFyO8/qGuL5Yy5+yYKQrfGatug3/ZZFMpKsNpcKoYx4iJoRG4dj9ClEd0Q1ybV6o
         WGPhVy7SUGvqS5Yn5j2UuNSogDwcvaemf7tfN6nh4Mup6kxXJ2Doaq5pdu3s4KWFO6rB
         HLZg==
X-Forwarded-Encrypted: i=1; AJvYcCUA0xZWxF3h9X1xSM9Y2hE9zKhspZDr/HCCuJQ/xWN23VOMck5LIDAqGt3W7TzfR04Sjs88iwqVbqne@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwBPbjfOjOiV8o8UgBwsSkq4UcfA/wL8u7r/Ki/Mk/O6sbzq6
	mHQCjR0odNdVyzsn93SaTanE8A7tac9O5KcyJRWWqI5dAyztXzQZisLIq8IyCieSVtQ=
X-Gm-Gg: ATEYQzz4v1iCkrSGR7AXMLm9z2EBsOhO68ndBCirKRtoVOZc5pG8IcBeFdTKy3LDw5d
	LU9rzkwO40j8A24rVOutXtsADeG5a+X9cG6s/Gg6TYnNT+RCbHE/mezpGl+6+h78Djh8XQhhJr2
	MH25roasLG+RMN4tODjOhM41Npms2dxG5RnAMeMEznVJHbdtVu+jKJcJN0XMUHqFNUI3KZ/7WW2
	cYARvePJbLw9CWHnDiCb7bRoaFzW8n/iqiSYJN1g5IDS0f5Ubk9G5aN1MmZKjgwSkYJYgSp0NpN
	U7+zCVk/wdaC9NqFEToUyuEbqKz/6Ncqv8TdAW1mYo0Fk9xdLSUUGs8h655L82vERv8jc3sz89U
	1lJhTbUV4iFtAVGfHnmfj44lx02JQ4ezctukCaD/wX0z/Zc5Nn/zHAEj7BX9j1C7taNwbPbq61p
	YIxfH8QdIewov4QPBPRxUOoRUa90QUn+VZ1wlG63fknYCCUgs=
X-Received: by 2002:a05:6000:2dc9:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b9e9fb32cmr7544314f8f.24.1774651028947;
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm1094260f8f.14.2026.03.27.15.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Message-ID: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
Date: Fri, 27 Mar 2026 22:37:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2026 21:33, Dmitry Baryshkov wrote:
>> Other drivers typically call the populate function at the end of the
>> probe function. In this case, however, it is invoked before the main
>> resources are enabled. I assume this is because the CSIPHY device
>> needs to be available early. Aside from that, it looks good to me.
> This becomes fragile. The CSI PHY might be built as a module, which
> might be loaded later.

Is it any more or less fragile than "simple-mfd" in a DT though ? 
Krzysztof isn't very much in favour of simple-mfd so this method of 
population is the alternative to hand.

The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If 
the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets 
-EPROBE_DEFER and retries.

> 
>> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
>>
>>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>>>          if (!camss)
>>>                  return -ENOMEM;
>>>
>>> +       devm_of_platform_populate(dev);
>>> +
>>>          camss->res = of_device_get_match_data(dev);
>>>
>>>          atomic_set(&camss->ref_count, 0);
> And this looks suspicious. What if drivers for submodules are already
> there and start probing once populated? Do they have a chance to access
> this ref_count?

Nope, we don't share the camss pointer or any of the data-structures in 
the existing upstream driver with sub-modules.

---
bod
