Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7C3DB630
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562778; cv=none; b=HkbB6mJsk0NAOh6OmdfCpULi+K0QfEK9u8Ko6q5XBaA3cK+ulyBHt0HLv0BMk+Nf00uCdS9VI2Zt5S0e5+kA77soq7ZKKdiJ2iAGz0uKfrpoEdY2xNFw06jytMVO0xn8JDVMMGjcCOXG4rDB+tejBd0ocXaGunBiKtX44mlBPuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562778; c=relaxed/simple;
	bh=DKBAaG/N5R4rrztzGTcNqmxNSYvmbc4YOW44ZQWDhZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEODKf29socC529tcWxXRayfneABkWFfZ+O9O5pHGahLdboSWq+MJdsHZICA7qke1FuDQ2Tb1JDkQEuBJmSDplRbR1HnNTxd7yEKXM7Wfcsq41/c15ofRk5J4K93KjabfmZE9yNQx50zoiqKocMOrH0IAbtvqVnnt2FTTpzjPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrGhWNKe; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrGhWNKe"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa60c7be57so18656e87.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780562776; x=1781167576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysCy4i0ZuZGHTLV0NNKNvTSVjrjWNaqQ7rMKNBVAW0s=;
        b=TrGhWNKesFMoOF8eV2aRD6QPSe1hm37sPWKH58MN2wL4Rmi+DbKnafC1zFjBDFHVWu
         DsNfED04TBlgLFeQypnahib8eiuR4MSfTKMv/jrXfO8ZiNZwt90wlL0Vddcr0m7Bub1g
         kKbSmtBVFVT0yfwKWZGYakYf+2F0IicrJmB9SUhK8g6JDEfSfDsyZ/qniDdyqpiSWBUK
         P5fU8kjwYG9IRTklbFraqBMqPccMRVlxWCx2inALca4ceIzwHTJJHnN6ikvrtezk8Uxi
         mpsRp8GMqKIEvw42y7o2CeDoxk13g5Hh3sICBkzR35g9UaFLBZ9/syaz9mXsiYCAscVI
         ZmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562776; x=1781167576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysCy4i0ZuZGHTLV0NNKNvTSVjrjWNaqQ7rMKNBVAW0s=;
        b=hXCt7hYUUgHEx7MvFHZeaWx/AZGsrIIBC75+xiTFWmz1PrupU3/Bbge15/i39tHYoa
         EaTL5XpXEdtIkxO2cAIpJO8BtxBbIII4YQDhSh+r/cJLjDLKaltHNYDI09sGW8nIjQ8Q
         zRLRz48qxyQpCrvtwmM0+RjnIL8HTi0y1KgUbzzPrlX1q5wHNiuot9/OmsvaAFIeNSQK
         w5D/clz6jrW42lyy0ascv1rrE9oEfwKiAB1i+BmHY/lNl+1PHQQWN++E2jyeBPFnPRzL
         taCmveC41troN889IX/IF5MhVUi+J+NTFGcLn1CEeqw2AhoRy2rWPxs05hkuuT2PUehT
         dk2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ky/sKFTYe2xSJFQRCtmI7rFNWBEo2n7H0NyrcS8n5BcOFbf0SmiqrhWU7ROTf7Bf+Wftm2Adxrazj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9spjYeT1RTu3fPjRQMJrmsZdLn7FbxC5PUTpT+qbvbcLeL33
	TS07G7uR7Bm1uVvpnBHnSlQiSaS/OKWd7XG1eywQF97UPY/DYOowprygSK/b0OLQFSw=
X-Gm-Gg: Acq92OFopahR2eJfUhaErk2lNxANcGdRfaJCYRkQp9pTx2uqSSvVdOscPfPGOyeFDbU
	grIj6ebdXBdV/Z0G6wHgRno82nTUIlGYCyo5ZzsqdbW7nM0x2h20bULFrv8vRA2G1WYpkZf3I3n
	r0kdXqDKrxjqrsE8OTXMPPqhZNQPcZAJeSJu5jUjX3TksaLNSRsVCLcuPbrhfRZ4W3jNVaTrvBl
	GbZUSkRgOsgXHujIyMcjWwPxRx/WMbxpQAzoGtnmAsDGCASyOQecZndfPMnRk7J+iP5nyvf+L96
	yUonmpHQUT7GV72bvI1zUgNQ02yPyGUtolvdfdNjiMcn467cgPed8kD3wIfOnobsY7lTPE6eUEy
	+DXR031jzeo+Fkyk2fvnJ0Pw/donNXqy9zlwSDbTowkPt6V+28nBVFsCnWuIwaROCRlnEQSysDf
	g5VzI3vLEvCDHLzp/2I6kgWOsyaqSCcOSn3R4tCkzHRp8uO95/6PHu+xwVJzQeCAAfbtQM8aSBg
	4iFrYA2WcLdDt1A
X-Received: by 2002:a05:6512:24d8:10b0:5a8:7317:540b with SMTP id 2adb3069b0e04-5aa81f36e3dmr159818e87.7.1780562775465;
        Thu, 04 Jun 2026 01:46:15 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm1075006e87.81.2026.06.04.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:46:14 -0700 (PDT)
Message-ID: <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
Date: Thu, 4 Jun 2026 11:46:14 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/26 03:30, Bryan O'Donoghue wrote:
> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>> described as subnodes, then likely none of power domains are needed
>>>> to be
>>>> repeatedly described in the children device nodes, since this
>>>> information
>>>> can be obtained from the parent device by the driver.
>>>>
>>>> Technically 'power-domains' property can be safely removed, I believe.
>>>
>>> The policy is to describe the power-domain dependency fully since DT
>>> describes hardware not software architecture.
>>
>> It brings no contardiction to the statement I've given above, the needed
>> power domans will be properly described in the parent device, and there
>> is no
>> sense to repeat the properties it again and again in every child subdevice.
>>
>>> Also for a very practical reason a sub-devices can probe/run
>>> asynchronously of the parent device being active so in fact we do need
>>> to describe the PDs fully.
>>
>> In opposite to the above this one is precisely a software centric argument,
>> which should be excluded from the consideration, as well it's not a big
>> deal to make a proper async initialization, removing excessive dt
>> properties
>> is worth it.
>>
> 
> Right look forget about that.
> 
> - DT requires you to describe your hardware. You're not entitled to have
>     some other device vote for a clock or a PD you rely on.
> 

Above are two uncorrelated between each other sentences.

A device ("consumer") can ask another device ("provider") to behave in
one or another way, this is the only possible and thus natually selected
system design, and nothing behind it was asked. There is no justification
for the proposed flood of multiply repeated data, it's avoidable.

>     That's exactly the type of downstream short cut we are trying to zap.
> 
> - In our case we also need to vote on PDs individually when the PHY
>     is active.
> 
> In extremis say we are only running the TPG then we have no reason to
> vote for CSIPHY specific rails or operating points in the parent device.

So, TPG shall communicate with CAMSS, there is no CSIPHY in the equation.

> We could make the parent power-domain argument for CAMSS and CCI but we
> have TITAN_TOP_GDSC in CCI specifically because we have to model the
> hardware - including the PDs for that device.

CCI is not described as a child of CAMSS, here the situation is different.

> If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't
> negate the need to include that GDSC.

Of course in this case a phandle to Titan GDSC will be marked as obsolete
or unused for CCI, no problem here.

-- 
Best wishes,
Vladimir
