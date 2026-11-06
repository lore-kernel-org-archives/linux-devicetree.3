Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964390;
	b=O5cUEKxCka/wRNh/cXLe4Iw5sgFcaxNwy07TJ7kVua99O+3KABfuByeZ0FILAmJanxqm
	 gOBkjFX58bGz8NajWlY+tBSgn7qVvsiSpeok6RdMuO1fROzKJnMMSJMvUomzxNvUm3P+5
	 PpAsUdZfIcYuw1CZ7RwfXsicDRKm0phddsNzIqSEazJaCcxvYM9aD/oTBRjBMZDEYcPwS
	 8+Qh3f3EDWB4aaJswg6h9a9JOexOL7lv/A0MyuioTmeD98EqC8vOQG/JcMxzLFuPR4Ha4
	 Di+Doth/pwaLZMEkNPQthqScvHIxHeTq37yklZv8YzNgue/60GKJxRYtNbjUJZTrhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
	b=c4aUZCk9zt1wgD/dPDWellD3mDhwsZhTMkWr9OOacGvKN2i0MOLQjwseuD/SvbNRNIRy
	 Wgle6oEWhGUyo3a/cFaj+Mj2ZSIC2CGUD8A0VA+WilFEOHZERHKAjrWMhj/xORzsT77iw
	 1Tt3yn3GEToO7S3lr2PkAQZYoNcG1N6jTJnmQ1fl2ecQhJ6pfhPbAdJ47c9V1lpMSG8ZQ
	 xKtFv4BAPym0J30phszuBjHT4KNao18p+gOy4/UdXgmUcy+7Hz5P6QJ+2KXmKAqTm8x2I
	 lsq5qUkwy09DkOldihUZEay/NKhtlez5qxJmfSyLf+Zk4Jd6YMcEQMo3+pHtKUiaIXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0697606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0697606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so5339775e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964388; x=1794569188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=opUqJAWAOya7CeKLUFeRUpto0xhDsHDE0HohVtyIZnuUT+wiPe4cORcwLddq3v5huy
         i9pGZ4OqYg6HndDaZqJmJeiHMZxsorpAMu860/wKTG7jmUDZwZFMb21qzEfUqDhPRHdB
         wjgK5PPTSFqeFOVI/OkI0pg1Hf6EEUS+XwWDB7brg/tpwo4MRp2+2iu8CpUB2WynFEex
         NSNn5adlK+HYH8TtofdR2pDp8iRQ9QCMWtk3fFoKfJkzsbo2JN86EjBX51QXAZfEJqKS
         B36XSyIS3N15WdMNs5DmDNZNNYh5w6CaTX7o76QRuGcUTqhk9zNOqmfNd81CkTGX/w+4
         HhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964388; x=1794569188;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=Mv57b0IqMEFPKpksHqx0LFG+z+8GAtwFDbpbWdFNDUSSc/VhgROE0U97WoPk62JyNP
         4EwOcjrR7VNL5mNT85K8/Me0H5HmXNlgZ2x6s/2IaZvbW0Utj7PKSrhLt+9psT72w4+M
         c92hPTVM0zVdbUduDtRSLK/DFlDjli9VCbVCZQO9FovCqOczhip7Vrn5XiFu2HFPGv5B
         2uHHWtH/K7G7nS0TTa9zgVXidyPr+lRqbxnUixTzRT3YmgohcIldBhoL8rLDiJre7B67
         baAAEz7klo31oOnSYboqYX3nuGVaIg8NcWdWdHuZVnv+vjzA3wq/j346/WTxUr2i8f0g
         3hcg==
X-Forwarded-Encrypted: i=1; AL+hErFfTI8XVM/nowO+2PLVGn/euNlaBh1npgHr+CR/Ox18ncOJ2k6P039UXaAw34FWh7NGgaP6CdC76JxW@vger.kernel.org
X-Gm-Message-State: APuU4Z+LkekmSetdB2o2cU79W1AkiHk1SmMHIalkRsy18JW1WX59g1IU
	IrCLGSgC1eICWkPlaJe+AlgMsvHANzVQCtD5eWOSQEHOk6E5DHh3dBJR1icN+nHhHSo=
X-Gm-Gg: AYBFou18w67E+MgB+9+THq5FQlTLrazGdubkyJ4AMLB6m8FaTs76JX/fLsp6A++enXP
	Ig2DgE/LCK6hSEHKrvuukug/Rf7eQVwxAegV3zO+FVaiKU1QrZ8c5YiAZfKRk4HfIxQBT2IomBS
	p+Em9wHCY/NJRE0BniByoy7ZCOzLmmNZQ2Z3QbVy0uVg+kc0MZmiQvM0D33J5yU4jfZrBa3QF28
	MRnvCkNttQRXUywrrxr3QdUVPumRBJY9uHMsR3WDc2ciE4nvqhEBl/ciya3M3U0XWc0e1D3QaRt
	kAxsjqxVtYC1jTgtR65FDYnwUVS+zg5ZvRkX5JcHtU41SH1pOEKgCY4IFTPsv41yhF6Y3VwPv8n
	e8xdLj1xgLZssTT0ertTb4UrHeeuXOBL+U1yW2gOtTrULuIjk87GRM+/7WzlzbZW5IYZ0RwzHTN
	ym5ieVDZ1SbWZs6uDcLgxC+MQ7Fn+QMEZhyRvh0w30PP+Waw1NDBI917ZcYFboimGS0Gc2TLZDh
	wd/Fkk8XBbqBoL4GZjPrlitxAuBvsrmmUSdkG7JC/dolTH0HgqPQw1g2mXihPzdMhsVGa5gtZME
	kLkZR5Hx5wHniZuLelaaLzELEV4xbKIKwp0eZlN+JQ==
X-Received: by 2002:a05:6000:4685:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-492778d1fb7mr3239346f8f.42.1793964387965;
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492ff85585esm2390286f8f.5.2026.11.06.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <ac2e970b-1f3a-4aef-9a84-034d7e460c0f@linaro.org>
Date: Fri, 6 Nov 2026 11:26:26 +0000
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
Subject: Re: [PATCH v2 3/5] media: qcom: camss: Match VFE lite clocks by name
 prefix
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite && !strncmp(clock->name, "vfe_lite", 8)) ||

Shouldn't this be the case for existing clocks ? i.e. only check lite 
clocks on lite VFEs ?

---
bod
