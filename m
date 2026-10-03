Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2757E3A3E73
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018554; cv=none; b=kbZXTsdua2vn6oPUaWPmPhtgmrVBV5n+/aTZzr3h4/TF2iRXDCakl9O9yF4lMKlE1aKNjwqaJfCW5AcsvjTXNDu5HWwvaacIGI18mPFXSO+hJDBqBnHsDkGInG4QbTSywGSSB5Nhux1e7J3ltQV8R5dF9c2pcGXmkHOpqtSxt/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018554; c=relaxed/simple;
	bh=kYIfDI3QBE3ClSciA+/48Hptd209qBRxGk3JWEtzUGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga4ZKzR6WgYkvNhg++ulavE6XHNVPLVb2BscEm1yPyIzoOIKPOYnOSybsa63lj3rU/YJzCjnJun8vsewxbgbwz2KMV3VhP1NryiOXDXp0CyLCFWkID0C2DeBIb5gCHmkqJTVNQxVCpRp3QZn+1pnhAbpl+ChsglTuE7lcoF/pjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIS+y5K7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIS+y5K7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1670dad7a8so81402966b.3
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018551; x=1791623351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aD42U9G+t3AA3eGszJykKagIq3I33nrg5HXNEK2wHFE=;
        b=DIS+y5K7aJB/YHs2o2NskzaCYs/OLfQL6i2dF72DW5eMpR2rcWe6kJaoo1n0zmFIUw
         NvIJo5m0f0L1fJ1V+2EysiRQ59m79UF3hrKQZ6bbpP0phZDu6nRIbB8++P1KGP6Lu624
         Kagj4dVL6rSoRK4BWlaw4yRIfckJVQQE4Zb6lYdPD0/x7yct57ap9fGuJYp8+fxM3PUZ
         8ZjscNDf8lOSgYVQozQTzzBzcQBg//fjT4/gSVwy8m2M70xm/LWUSoC1eRqiuyM0+Q/S
         2whApDjisXCfawzqInsvCzyRTtw3Zlpjm1VYtzwGq1rgmr9PYFZ2YSq1IXPXzsXRA6lE
         wWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018551; x=1791623351;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD42U9G+t3AA3eGszJykKagIq3I33nrg5HXNEK2wHFE=;
        b=fdv82MV3mWA4UA9w8w0Gm7lX7tnGYw1t5ahRQUpmbhHTUUumwC6wDVAtS8zPj89M+z
         jlcQ2g7NaCbOOTkmkdKtpnKXgRN13FAUR/u5h9hJwliNYXgMh1jTI+iNAQdXJ0QUXbZQ
         bTOr03jPwU2Ste8c4kpC5fDoykvQS0/4XjgMK5om3m0LLqXR/jMEbFt8EReG5p70mh0E
         DFHYf1p5tCXQLsQ0i3EcOsnTl1YfUUDtE+yLQz+XRNd+Y3wMvGW/0Pq44djppgkLdw7f
         z13wnblsASssy5NtojQsXTC6kXHA8+IYkPdDT+s4cXL8o3v/3lHaCtwN/xG5PUD5gnSj
         FjEA==
X-Forwarded-Encrypted: i=1; AKwUvBxPXmXtR+FN0le70FGB1kcmWbdy5nT/ffLjk+NvwV/qkYoG/LkubgJUffeniuuQT1AzYhyc1OQ1IfrW@vger.kernel.org
X-Gm-Message-State: AFuF++lFobnkG0ccNJLA/DqWwCNyLfxeT0bjtdyouMxfh1uhLC60Ie6v
	jUEMWEYMQVNYwEu+XrY6G1WAdq4iWPtaiaSlYwQAsJj/zyYMVuY3jM0zbUtCcwIp5d0=
X-Gm-Gg: AYBFou2Qe551eLDYEjFzzQD8rh7yuAOEy9eM4hiQ0UQUwrBECjhV3O30M3KILZpDjTr
	yvPKzEf9RT4v3bQ7W2o2RBr0BiuXuKUIASOjnjWLs/sxk9XugY+Hhh3HUEUJ36i8HBsPG4CBsBg
	LvOFqUKRb6IxFZFMcYZ3LcyLwX+sXXcMTvOSOf4NRO8hAApnYvMj3UJX5KbdrksvnFE3pti8whr
	ETQvmMdNLM7i9Yxw8KPupLpbTPvJt6jNE3JRg7j0yZLmN785Ttppo4jiVSdeuqrv1mExCiSo5fu
	Z+yPj1FMQKtYCNJ6F2UiEIe8bJ0kczNbIpAnhHNwkWHsi1MeEgH0nJwNMXSTzxBarHpIpwmopzN
	kIjALjzW/Wz0r4ag8CAUVNSWu8Yyj6aefVDQdbvHvVHMM+B/XEZpR44jJ3SmHfP2u6g080pd96b
	ivGUoSkq9P8hnqdH6qZuC8KwxGdylSabPt5WeiZgP0OW/cScx6pm7RIVMiAzwmkKPwQw9RAhrJO
	XIap9xKlR9I
X-Received: by 2002:a17:907:e155:b0:c2e:4d39:b5a1 with SMTP id a640c23a62f3a-c2e6ece5605mr88982166b.17.1791018551275;
        Sat, 03 Oct 2026 02:09:11 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd05446sm174814366b.19.2026.10.03.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:09:10 -0700 (PDT)
Message-ID: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
Date: Sat, 3 Oct 2026 10:09:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> +			.hw_ops = &csiphy_ops_3ph_1_0,

There's no reason to continue to use the internal CSIPHY hack.

---
bod
