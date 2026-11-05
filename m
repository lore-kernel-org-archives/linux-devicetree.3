Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872389;
	b=c8byJFv/7ffe6zrSPIhJ/QyMrIhPL7is3+pd89UX+m8PE2IArhpTsti4HsN2ik8ftlus
	 lyNaeqeVAkzSB3jZH+9wvL5FW3HmZICHw1Ybkv/wFmB8Jh023lG8PkE8XRo1Gf34aAfuo
	 dZ5e+Ose1fwrh6Rjsp4G6Et0QYTMxOSDS9MAwTPlXsL+FRlPxIdBId3Qh0ULRnZ9MtXDu
	 ErcFdKXQABeA5Qe3H9l91aAIjppmBgaq6pQrWJFNS4LmDW9aslEY5Gpt6wMmw7j6WEyF5
	 PZJyqnfbdMfaHI43K70zhbhhbcQ1BmyWpMpXgHyn8nSnSnu44eGtuoYhalvyrvCdirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
	b=qIRoMZVfo6j1DA69BqWB/su029GOYTVaxcCY4BszJ5MwNCVh9/EORAx03GelrFgLc6kK
	 9DKwO6xnbIkFmgST4WgOwvv2YPAcGrEF+GbaEGbSc2iQ5yUD4hqL5kjZR8j3nsmryZ0k4
	 gZBl5nXW+Th1DfdmAx3cqqPJtkrl5tRZFITyu7SBdedjhoklYWMdR/Qq7prVpAkGWPfIv
	 Jr7bbg3bANvlQLnvINCW+RLztFUwgpdj8W8cOvEDMou6R8NA836WtHpWOvV8QI64b11GA
	 kpwAmNBZOalYW2KnQVUHEdOGdQZ5VTml9Ihm8tOpa28Z03sWqFJW9UCq2H3n0JW/img==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCA606D81D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCCA606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11035715e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872387; x=1794477187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=wTnqIPbCdCzWHLY/mz5zY5KROvDJSZmZMvIuR5u0H3SPYm/UqeV0RgDH84ocGM/V2C
         +6ejmmybS2Nm54eDNRm5NQinhGhw6bSgJmElXetnIJ7VwaWRbbZkezJtwla/NeGLzqvY
         gRoOMLWejoyUow6FUC+rbnMtdfMJ/qYGNLz8ITL1cS2TRSpxaGJxITDwhQtVg8sYvPel
         eIXy6ZavW1wnqEuWW+tfd92xmz3VySPVTlPbkpGGHr9lCyihlFvnAt4Ld9fK2IQLaQ8Z
         oIcza0+aucFfxElxHqjy+PfPxmdd1XY6qCS6oOnRP7k8GrwX/Fepgadcqis7Y3/qNMYV
         gv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872387; x=1794477187;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=Sl5g1BQs24lcPrlZqlvsdH5yT5Z/iJoBFC6B9jTcHLWhi3jOG8iM0c5jaWnpo7tY1D
         ydlOi95ApDmozM5+mj7DKCGGYXj83c2TACwZjnmAzQSX5WjB26h8LehZ5PoElfsUkVTh
         tjkEaBGdfVfn1Ggdb8ACdWxhjfvToeuUcEO16dgAylNbr3bXA9wGhZn5bZqYIpvz+8B0
         5aqlYC2jDCAaHRmy7qnSZOgm6Cs7zv5Pzru/hW/A0pLSaTnlY9CafL+k/9D2u9Jjt1/q
         GkkUuBl4q3q6TQ716GOnMekE34kzme3G7vVftpbiTajYDwDboLz6qWH1HI4l1ydAKlZ4
         PaeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6sT8xm0ULD71vYTf/EK80S3CEHToensxCu6yYrglO7cICZe5/5N7XKX5pVZcZwjg34lDPCc6AUVb/@vger.kernel.org
X-Gm-Message-State: APuU4Z8IqUdDqnrN8KrG7u5EVJlxrqh7VX1VB1S2V6OZKC2Sae9JHhbU
	StpJAWbtqTTRcjLyPAqmq6V8ajtBKeuQSxEiG9z8uT4/lv918TyWPYJpcF2oGbt5/4c=
X-Gm-Gg: AYBFou2U/fqD60Q0RIbsGcSbtvmjACVN5EcY/jrIAJloAWyjsUYcpQQhRpAAjmXkWu0
	JKLvnVxxnVlgpSd8VqFyd2+9WPd6kvBwCsYm/7FNa+fm5fK2tFl/+wpuxZ7kml1ATsoAX0H2CAP
	UcbqTTgt4BSsR1jHoCA/GGFx1fST5xxkrAiLoXhfU4VJ3hV+ZehBq/BZXPnuwxdn0whcFSOREGQ
	3lyu5oHlINRJYVxLoz55inAa56yNVcWz+jNxod7hfyTwqJSPgDiq18uIEPZ2cd44H+NbtY5uKbT
	99Qi/LEuUJF6y2uvUcN2966zMlmNs+L25w8W+/2ipXGVC4uPElQL38lrzxG2UT1xCu6wm0SB/Mi
	FSZvjxUNXKfHmgOsNPnCG16F4QWHOXRewtw3v5I9p5dQfzJScOb/YJ4u0UpFIpohfgGgSCQVLtS
	yKx46ZzbE4R5gVyqRHnV86IOzUSLoSwtnkhqg73lss8yvWYH0xsFGBKp8EGPMyV/BmRYUmkcfbS
	CJ5S7iHqBK2cs5QFoinehEmcncP3Xqsj8xj9x2hoNLGY8e73QzPpwtnuRhzQEoc1PYP4jQuRL1y
	9ioR1q6ZSqpFlFrlG2/owGPAVjkNpOhAnHT11//K
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr417919875e9.10.1793872386620;
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm162575385e9.3.2026.11.05.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Message-ID: <f3de19ce-9a15-4b50-a509-c462bf27fd48@linaro.org>
Date: Thu, 5 Nov 2026 09:53:04 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: Add SM8350 CAMSS support
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-4-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-4-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add support of the camera subsystem found on Qualcomm SM8350 SoC.
> 
> The CAMSS IP on SM8350 contains:
> * three CSID and two CSID lite blocks, which are supported by CSID gen2,
> * three VFE and two VFE lite blocks, which are supported by VFE 480.
> 
> Every CSID and CSID lite block contains a CSI2 test pattern generator,
> which is supported by CSID gen2 and controlled by the CSID subdevice
> test pattern control.
> 
> SM8350 CSID and VFE blocks are known as version 580, the hardware is
> programmed in the same way as Titan 480 found on SM8250, in particular
> CSID register spaces are placed inside VFE register spaces.
> 
> Qualcomm SM8350 CSIPHYs are supported by the CSI2 PHY driver only.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
