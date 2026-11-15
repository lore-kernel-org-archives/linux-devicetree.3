Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744973;
	b=FT9zXTL9Q8h0RISd9Wf28Z9nuBMO7lSFKKBGkh431KswKXKPrczz7K8NCCkdjbDE/mP1
	 9MMnV59pSB5hMlDbZrhht5W3A56fchVx9qamxTyY4S3+SHLaihAvfS6cPiY0iK4kgaff+
	 y7t/AkruEVBvyzTLm/Z4rRCu/8WAxV6XHDl1gwl0LRz+5MaB7XehfY5iDr4dsEWPZSNfX
	 LXK3uKukOQU5samLlQloeNMJzRZFJqj9NiqzlTk2C+LgfyToM9Tsd/FyWeCzQJVLJNBGg
	 hW6jhRvHd5cAyZFO5yfzzjWjBK5XNOimGJDC6yl+IVIabfyi7fOvEJcCZF5Y9PZNknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
	b=uzleUudSV3c4TqAbxidswQUrCKCOXR7kbi7WBjyNfsAGluM0ANCJWIobDZI+r+QT+1e1
	 BX6PeBzSuQb0zytga1cFn/OSO+kAEznhRqBVVRh99tsGRnQ5O1QZ254MbgHHfbIBzYZZP
	 LdM97i7wJoSshPUkCYH5BQ3WSyBbRfmvfvfOGVGDX3RdIkFVv2CHK1/bNaf7Wqt6lpRB1
	 81k0TiQcMin8RQJ/0SMyBEqGGD7Gx8PqTfTky7QH6bMybybEfgpquP3ZDnv8GV0u5tSqp
	 LnHT9ehfGxqRdAZu+EbLYG/BG/pQQtsQUzBt3Yhxst1f9DasrJg4SNEz6tw4CIdI8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24758606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24758606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UMWGuZNB
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2823536f8f.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744971; x=1795349771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=UMWGuZNBsMnss2pwsw8rRFNOryhk6F4P5MsSQtbTOUSYf7p8ABU3vk4PaN1KFgXJ4m
         sLw57i7wKveAJsqJXa81ii4bayts99u5hg3J+aNyMOI795yl24cB+IpfYz5/HXSDqzz5
         8J81IXNBLkrq8pNuLrlDSWMlsmGEW+JxD6BDFcXHLBQjB+J9eOnH/escoFzz40YDBxpa
         l4K4aqxKU+xhxj/c2gSNDaf+IV7G2FNCNjefQ2qzQHvzhnP9uPM67bTReYKQRNnzW10P
         /U8EwovAUK3sCoJtrorcb/qNryT5hTEQM7Pctt8EMwGpw2KT7wD4z3gD8bIyUjh/OWZF
         nvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744971; x=1795349771;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cze6EXMazudJouVIRWBezoVb+gMXv48f+e410Dy7G9s=;
        b=Si6pgzyY6Fjyu886Vs+q/TfQ48FOZThTEjE04Jhsn2RYL4sCQ8ORdoI5T78dHCxZB4
         XnBJ9HPqcNYCZ18SLE4L7ue52BIsJSA7Jmqh75PH2YRbJkPH4u40/i3X+zdTzQAmVLy8
         4rnrInj9bHkkOH07HzWY7WLKGVzLIdYrdyD94pL9hqGHwWH3+3xp1IBvcpOHD1SMUizx
         GDk9H8CdBSgTFVaF3lLkZYFc8BAUKFVXUByBAtAsWv4+IuYVxrAasPy7+PODaMyEK7eG
         /HWkBx9KKeDD4OrBq/7TcUv4dVqcmbHcmthvDsCZOKO1Mt6AdJxAXYNk/KRajVGO6Kzh
         lK9w==
X-Forwarded-Encrypted: i=1; AL+hErE3FkU0fEsMMkDOrky1ecFdONZ6XIeQP9RAmTTk7hFCTN9iYrC99HWNZc3hgwnK8ok6QNIk4kKFjNR9@vger.kernel.org
X-Gm-Message-State: APuU4Z/o3ZJe3RJqnyM76FSQ3av3KbLP+YVI89klly+no1124tlUe25N
	WsJbjGbHCtjRk9aFIiMIKnJOFonoT0KnFyyU23ITAi9pCqgQlLtBck8g8HA1hMo40XA=
X-Gm-Gg: AYBFou2zTpLLGZ+bNiaeCJzxZEByt7eXMWBV7lW4UafZLPcHokbxJGFwrxrvPSLwrm/
	1nUF62qZ+TQHFpd+qF0KTvrfV7IwUgobf3GtR9b3fjVvuWV/OB6C+yHABjq47cGDpi66eaGPb7/
	TApu0V25L/GkES3Fm8oRYsFIBLEJWZj0DTt7hHfH50iPgWGkZS+2GWSmZNHFdAGrXrwcJ2CF2ro
	ne3GfdgfgySu2Rv5DX2J4CR2PfXedzXrhrCt5+gxsVyzXPyTVz086FoIXSSp98iJq/g7Z9E+570
	dWqsxzKMBIAMtK4uylFZ1lZ741BaGn2OpfinsUxHxRTRMx+WBMYcIbvtPO3s/7DVZYQ3qaV7EPe
	FaK8AOPChiSLYUMPpBN1psgjXU63A2XqpaxeM3NpUd2uWSY+SPsGY49gBVPn8UgVeuVLzsJ++Ip
	NaA0PVjrmVNH3kbXaH9GGwAZa55OBXTVcmOwxulTvlUASMz4eNAjJDU/IFFcLfXkgPw1RHxLTzI
	xLXFOz5dlgXTT/McH/zfdh8FmpyITwbDBfHQFCxEm+zQ/B47xjEPKFAkngx0HTZv7LSeaIX9lsR
	pvT4Hp9qydzzmPM1UKEWWQvyuALq481dfA53NcXI9i8=
X-Received: by 2002:a05:600c:8b0a:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb55a95dbamr161321305e9.31.1794744970969;
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm126726035e9.14.2026.11.15.04.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:16:10 -0800 (PST)
Message-ID: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
Date: Sun, 15 Nov 2026 12:16:06 +0000
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
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/11/2026 12:14, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>> +                __csid_addr_update(csid, i);
>> +                __csid_reg_update(csid, i);
>> +            }
> 
> Why does this run twice for the same index ?
> 
> ---
> bod

"run CAMSS_INIT_BUF_COUNT" for the same index ?

You don't increment a buffer index. How can this be logical ?

---
bod
