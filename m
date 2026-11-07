Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060222;
	b=Z3y/AqMdQN/C6aNE807OdbKZtiRfJo5++/leozTgwOci+qRr5SIekNPOHs3MSTGK9rfL
	 SMFiME81A+AYpUYiSq0VWNy5wj0U4JZot7PBjDc4eMnQEchD6YwAJQGPp9kxRIzT4p0GZ
	 bkLM3poCEWG7eJtMWIQvnLrTarf/z0De0uetw2KrdLZbeB05uqYO/HgE77fAWGzZw+QXy
	 wvRw8tvMVfI+IEQDyPX/EuH88rjV0HRffrQA8FEIn40EKQA70XQF9gLF+eHhmsjHmDtL8
	 4cmgiPAh+oco2uLZQDsOprONcCtwzy31SJv+i1ux38UeQGqWnYKxM+m0we1rU5isNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
	b=DXCDqjf3jxriT7d/MBWK3sxhnByFtEWdDymyr8VD3UwxjtunO3jf52CvLk1KhXPvU4RK
	 XWtwWqogfVi/oy03V2PtuP0YBG3/5YRpetCSvW3Dqy5iFd9J4G2RISNgocJ1yn+R8b4jl
	 vnfB8aJt6fhU24TCEbJLnqTYxTty2D7PAUvwOxHHrBDGU3ggl/GF282g3mVLKjSEzxW8u
	 xVAX2ffzZ+cWOHkIu2YkJAGa3eJvOaAtYBXBJVZbQgu796XT/qnEFgmk2tO0VVdJR93wy
	 udDaYMRMHKjJ02iVVo0o9GzjuYMcApUW/m6fBT+Z30PmKWViy2jlKjKXh73e1RnLixA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302E606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D302E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so11132525e9.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794060220; x=1794665020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=aP3Lr9ihnVE3AAdM9kPgIOvbXrlJiwClq0X74LQv3Wyb/Z9cppqMs2SyBmMxald4yu
         C7kE8oF6MlLS8Rjc84Pwv5t5NU5WSCXq0krYgU0fcGlOjUC+5jVUjdNcpsbspEjjl9wW
         KaVnSY8HVH3kwuZmvaalyNY9bp6d4g01KFtA6dYmG0sJMS0yVIMMoHhHZvdMld0yGyAm
         3XeXSmAfDvym7JVJkOKRByr8hhBdEnA1vTCsa2TEf/dXLc817ZRkiyMQfWgLXfK1+BG0
         qYVUL/yCfx8SnnmCchwCAoJsqVz9UC9Hsf9I7YOUzO5RHkQuJOZlXW7ydqVg7bdAoSjG
         5gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060220; x=1794665020;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=ppn7yXJhk4Hfpqz+eQ4oYgHKxf+p/kuWzAXFO7TaB9hqsH5WumPRmXQhkDPqrE+upe
         aR4O+eOUCliGS9MN1rurHAwQi8V/S/XDnihe6FiYOhIZkwluK4kj7+LxII4/qTbj87R1
         MlDBiOxb5M7I3PczaZ+Fjxo3hX4nr52OOdmEju4ol3BtlOhmxyVxQxrYR5XBVcz0Ka3K
         PfIIbVbu8eXM+BzA0ll969lS47MdLKa7ZJNBOkv/KoZ9wc8Ab+Kjxajv47rBShjPjrI3
         ujyp3GNh3v+dBXFWFlibVQm6Q4HtGoTe5pRtBtPlQUP0Bgcr4p1cHYnlCajjq5/H7o4U
         yD8g==
X-Forwarded-Encrypted: i=1; AKwUvByQ13zmOytjaSv78Cl/0NhV5isAcLm1Btl8hb4BAZKUYPGEleiVGvejJLvZZl7kIUvdXSFMSKQMaHXm@vger.kernel.org
X-Gm-Message-State: APuU4Z9J5edSk58GVxK9mktgquOtl/hxinePxacwHnnIKR/8vGJih6iU
	UKaZdOWfrCP6HdqcF0/VkO4rfxmHrQ0t9BTF4UUe+2AbJBQ++wv7rSvOslT6eDz4O0w=
X-Gm-Gg: AYBFou3sz+1+tWNGtcWrYhoroN+jJB6/LC//LSyCcO9ezGx27EysVa4qMky37IIUTTI
	aUNbMw08n2+/VPJVqUtgrMiEh3ZZ0cQArulEBNEVY46mzIkkn1JPJP7QA48lNeh8qrcuXcMuM7Y
	FEORL5RIGgHkR67ML8vgmzos4jEmuVoOZTasH3c+wHgQW9Cfco07JzdyIUMntjpXRsnc6TNpXlj
	ET04P92TpD0t2CHaWhQNJ0lf9HsjlH5IksB+Bvg98g+mY7oxE7OzuT7yTW3zjH10QgsnE3ZO/pn
	h8Lg3bTd5y88cgVP9RAA4Sff1O6c8oEuS2UJRzaHX7ee5Qmyh2ziVBtjGsHbts2ne7bO/G62OEE
	tIijueEwH0Y1Po3QsMQOVeLsFx43DIal4hWaznSm5qL2THTdc+xu7WscyMChtdJJvDOi4t8H3As
	tb/GmzeYhtb7dBDeDhpibWdjAmR9g0gn9NF0ueb1q3JRwVNFrhndJkMNsteIe0dOfnkDFQ8bvt6
	LQN7xRrjZnX4Z1o7234CIm3NvYmRF+Xzl+/9gzMthKtgS4kp7UXG2Nea372Vhv2R08NhLHXrpgm
	XWa/t9wjiUkjeKqph9SCUnx//paN3vYertt9IhGaGznLQ5bg5xk7cfHpzhXVNw==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4b6e054920fmr98235845e9.35.1794060220092;
        Sat, 07 Nov 2026 06:03:40 -0800 (PST)
Received: from [192.168.0.167] ([109.77.86.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7a0e1f298sm49309125e9.4.2026.11.07.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 06:03:38 -0800 (PST)
Message-ID: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Date: Sat, 7 Nov 2026 14:03:36 +0000
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
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bod@kernel.org>, mail@andrewgigena.dev,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2026 22:29, Bryan O'Donoghue wrote:
>>
>> +    /*
>> +     * platform_probe() auto-attaches a single power domain during 
>> probe.
>> +     * Detach it first so devm_pm_domain_attach_list() can attach all
>> +     * domains by name (otherwise it returns -EEXIST for single-domain
>> +     * SoCs such as SM8150).
>> +     */
>> +    if (csi2phy->dev->pm_domain)
>> +        dev_pm_domain_detach(csi2phy->dev, false);
>> +
> 
> No, there's something in the CPHY series for this already. You'll either 
> have to absorb that patch or apply those changes to your tree and base 
> your stuff off of that, and orchestrate landing this series on top of 
> that series.

What you could do to unblock your series and not have a dependency on 
another series is cherry-pick the necessary patch.

https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

If you do that you can drop the above change and resend your series with 
indicated changes.

---
bod
