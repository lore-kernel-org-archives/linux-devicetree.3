Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624321;
	b=GnWCqwwmxY5cmpYnItXPq2x/C5jVAFFqaXVQDVYo4SKJ9B9izEcmi8dohwtCHTBQlm2U
	 IbgXMRQUKN4MWdMUz2i52yaKGPMfBPswvw1uM5IyTtZDy/FqGKvWNFX/8gNLAd4315Lss
	 vGvUl+zxrua2atbQaRQUyn7nK6yDW2n2jaURy4JE23X4t6/SFoBkCQ40k83CalapGOLRa
	 ZLmSt54IGJnlshqlnHG0hVCRg5Qjj3MyDkt857jax99cShLPldUHMEqWNg36RYhECTYEK
	 wfGCBPRXjcd893KF7JOF/qjuY+5sJxzetpxp6CXe+1K/aJ+2RJB+EfwrJknikFWuHaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
	b=cACQJVbbpNp2wHFkHCRMAQV993gqGO2sidzg6jyH6PGf0SdKC8JXWfrhiCT4k8TTnBLh
	 Ac/fu4nnTDD+cDRFSDFW3NQDe11cNUF9MKEEmpgsEb8hB1WkgtkMScrhYnVD+1hCMY/81
	 699tAJnVAe0dKhry+bH+XO4Hfhcdt5D9nYb4il7kWnMF3+BzsiMRoMWC/xCVeOHNkkt2z
	 BQ+ZWU1P0IQL6eIMuh9HhKHt7KBQVVcf7S/qitrwDemy+IaX09LAEEs/98KWB4cIQZB0J
	 Og+0RImiz25Sqxo1c1sdSxt9olqJnedkoE2d7nArtCRHC5btuUF9u/Pbtj6ypx++VNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA236606A33C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA236606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46822eefb6so400529866b.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624314; x=1794229114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=sgANBLTL4YAZDwMklFM2H02NJCcXk/PdaEgxBT2cdhpFkCoMZ6HxQPXwP3Z2b/DFeS
         wBWKIQCNz2vp3MFn2A9bfGLKJ+KfLCGxipZu5An6Be8/ZVkEo19A/rATSys6diqxaHtx
         J07c97i7fSaKZ2780Unuy3tmV4cGWFeFHLzoWzX4v2isazoe57QuT9koARmMIfnAKsIg
         vRgOeAcNKiSUpqC8uifA0GnafMX42orf2CX0h/BEp8yZMiZlT9lmRhupAQC5noRBEu2H
         IjpvebFG0o6EmmhdW3s2jUXkFps/v3WUdE7w11o9r1todRotUMvA0pTU2vV/s7A53Br4
         03sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624314; x=1794229114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfM4uAledb3ebU9yvjdbYO/mTumVwk76mc2SnxdRhO0=;
        b=XNE4Gd/HKpoDAyYzZRdBqwMv3FEoDiKzx6OlIZ1pbuwhDeu0skoT9OwRlhDL3C7j3f
         3dN82aqw2zlYruLY+iQCWyS0jYSZLgNTrdt7glPjlww7aQYK+YiscS33vXCjuc1zESJQ
         fBaudaDHY8dAxHSmnlD30e5eo9jsEOPLspu6ki3oCa3tVpYGAhlHBilS2mkswIxDE3Or
         qOORj5R4Q1Eo8PRiCiygHLe19o9zSzFEbqK1WVOi5t91D1rWyI3cyOiqTUAvHHe9AciG
         9+JzIkhZSgf7TuKFeJ5XzCPVLM/lS/KcZNp+xT/W/5pNDIF8cljHK4gTXRdVr9/eDBZ6
         BlSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+zndZaX0iCGPvsGNoLu34Y9aRfFCi5ZdL/G5ZGwFFmz80+4QVnpzO1i45E0lfWW+MIAAw94kytfHa@vger.kernel.org
X-Gm-Message-State: APuU4Z+AbOWfviiOcM6vbLM+MhASeSbHNm0KogqS4e47bYNBRKaqqxQk
	OQBZ5ZUSumNd1vFQHocmJJUDblDy2o20af7n+2K9iVL4Atao2Qwvejt3XLfO5u/los0=
X-Gm-Gg: AYBFou3y7UOjhuDZpp/+lKeJZLzYzVdHjbBll9mU6BgHN2SHjI0SEeUUqMBDWjfMcdS
	L1Jgalavd4YW+gckBCFobDR/y9KN+G1pTzL/9GCtUYInMj4vSIHGDT9SXvccApUK1VUNkxNhNXo
	9biY2JuuQrc9kVoeswFOaRqaOnMz2RHyQwp0rGWA72uRV00Mza64pcHmSUgl7TcLcVs6RwTw+bt
	flPr+f1t4aCdqs7+2fT8zvw86D0lJ2lZ6olYh7oasGc1q571c3CSj5JvUFD6ot6EBCf5dGB9hfd
	G83kaXH7JR49XJRXgdXQDEokgTkLtGZD+biBB90aFgSwKEae3kpepzRezbfOkwIqMAxN5v1Deyn
	hFNksQFNdVRk56wtSySwlNKyxyQUyN4uoqaSrt7dugH3CQBku3cdmAI4sBxHO2L8kZGkub650O1
	LY/DhAdFSWLb5zj8+GyJMx5J+p/MG5lgXdDDfESVvwb+psBTb6PasZEtLnQnpyRn+M2PAiLYFG1
	P9koM/zRJRW6kwefh89Qv875FFMsuGn+xJBveQQUizB38Os9zJc1GW4W70gzIVDkgzXY0giG/ha
	1yetLXqER7QPUAFCmsOwBG/1L6iQY5vKY1ESFQ==
X-Received: by 2002:a17:907:7253:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c4ca7aa5303mr800564266b.42.1793624314046;
        Mon, 02 Nov 2026 04:58:34 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3476980a12.26.2026.11.02.04.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:58:33 -0800 (PST)
Message-ID: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Date: Mon, 2 Nov 2026 12:58:32 +0000
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2026 15:25, Hangxiang Ma wrote:
>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>> +    /* CSID0 */
>>> +    {
>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>> +        .clock_rate = { { 480000000 },
>>> +                { 480000000 } },
>>> +        .reg = { "csid0" },
>>> +        .interrupt = { "csid0" },
>>> +        .csid = {
>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>> +            .hw_ops = &csid_ops_1190,
>>> +            .formats = &csid_formats_gen2
>>> +        }
>>
>> This looks strange, why is there only one clock rate ?
>>
>> ---
>> bod
> Hi Bryan, the current CAMSS CSID code always selects the first frequency 
> listed for each clock in the CAMSS resource table.
> 
> In camss-csid.c:
> 
> [...]
> } else if (clock->nfreqs) {
>          clk_set_rate(clock->clk, clock->freq[0]);
> }
> [...]
> 
> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
> 200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
> so we need to use the highest rate, 480 MHz, to meet the bandwidth 
> requirement. Thanks a lot.
> 
> ---
> Best Regards,
> Hangxiang

We have a series from Antans to address this though.

We should list the clocks the SoC supports not constrain that list for 
one specific sensor on a test-case.

---
bod
