Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412663F8EDB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798274; cv=none; b=b6YY0Z5FtEctFJJecbkaCKMl4AQlqH6Cqzf1LJRiKSGTulyb8gi7y/nmRCbYA2dVV1qDCJua3/tHzueU94TGAyXkaHraKXmf2CMSqLPLaSQm+hstAYSSAMvUuAPnPFVo72ljo6AeB0kc1JVykNxqQXXGsT6KKaw5SyxSl1Yuhvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798274; c=relaxed/simple;
	bh=E1ISzBCLBIhW2cLl15JaLwQElpfxj+XxSVyHRpqpxlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsL2KUW99Yb5ZkzYovVVkbsdHipna+13a+yFCkqHHY1qRWHTdoKPKcNDC+hHFBcligXMwCacWuVrfJLduDfXX8j1+Bf3RkTXGUpTi96BnMNGMc1l/Qx+M7AUzuifbrCRLsIWGfYSB00hGLsubdFb3UwYACTNCqDq9xRHYQFjEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzzXyVIx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzzXyVIx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905529b933so22001175e9.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798271; x=1780403071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTUnOgQ+1EjcEQJ4pd3MhK4+4n8eohdzmTy0cuBpKuQ=;
        b=YzzXyVIxd97letXrh/XYSgLqnoATuCxoWpz7WoJnGgRPrmocNTPBB/91xxu9TFOE8L
         nflHVzz5PZBP1nd1xtsSTGObdnjJvQP4EPNSlG0hGDkx0jS1S1Ejzf45YZuOzClrPEDS
         JINdH6LJ60s5bj3WskwsftjntL/R+i/cKUGOXN3nl/6jVbhCKwUv88yDX2AQJANlsUS1
         PFgq4snLWl/z6TbnuGNusRUk5fABwvne8hMnt9SaQusCoI/t+QTiVNv5zFnsqxd9ntcE
         3gknMqTXuu+Wd8j81WbFHVT5/K4w5st0FDtKRcUyZY132D04b7F26Vfr1OxdUNvsus/f
         m4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798271; x=1780403071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTUnOgQ+1EjcEQJ4pd3MhK4+4n8eohdzmTy0cuBpKuQ=;
        b=bMa/H/GCGjaecT33y22f1Xk7CpFFNgUBiQZMeNV8icJtU5x9t877DoHzqKABZ3J/25
         BaC0e1Cn+X5OhtBRW7nFS7UODsEaeIuy3wXDpTPg0EQgVGkbyiKo9lTg9KsSSDoxQbdL
         RkwaboM4EwMS2bj3buYdF91rMRIuhCJb+CMhXarJXupaqyqZiryLce7TWwFGL2+dnStJ
         DOjQsBIwNQFiva4xpSB26WEs6Ff9dDZRDv4H/9lKxR1gjX2XT4IJJugzekqHQhg9ECjL
         309X1PDdRZlOBiSW4JwymaVGAfHm/q4UdSTWZtLq7Oz3BI9g5CkydqSEr494hRrgLtZ/
         DbZg==
X-Forwarded-Encrypted: i=1; AFNElJ+U10+EVAf8V7dcqgviu691LdXhgBXuR/LP/py7cOlmXZxz/UBpmdguKrHZ6Xv3lTW18U6tKyWtUZcn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VvHTAZiowAinWMcmoBH9cax5OthJdPL1HGUvw0P2Hx++pIIj
	kHIjT0C3VVBonFsHv206j3ilDzIHoNonumytJIeJmCAdkbG8CPTxWHMaYCX827mTjls=
X-Gm-Gg: Acq92OFFi3D/mcxbHzk94QEIipGTePKkYEGQYA3V7vqUaOhQFunGZj6olbjfHL2eLPu
	b5O+RV7uWDUfdyq7NSxPb+W18POcuN4va3D34RTTdvZ6WnNU2p7J2htRd5xWi4Mfs+L0+KX1ocH
	oI9599SSH1Wb3SGRNuV7nI+vWgpjqDZomKEIKJ3qX82DXkDDT7CBpm6gVNu2GadU/1Y+R3LRbNb
	g8lvTCxsAUYq68XumhMB/8saITrYNa8XLFaDYx7oB4SV0txp7D30nSltdg7zoo5yTnfurpxKLGF
	4gP+bROT24LfIpvHnU95UiVb4PDP8i8ZaMAXEl9GPNMv51IWEQ8aTvxWJ46goK0wdgT7MkEAt5J
	lVGheQvHyjn2vWMgIEspxf6ApfrBnT/hNB3bVuwcQ4GXr2p2OYhPDqDoT8mTPW9mekZAvbb7IQS
	n7Z8/UnDAxDc/wq62aL4km2xnAQFpBQZyMamQN1C3+hJ8=
X-Received: by 2002:a05:600c:468a:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490428e5a6amr316198005e9.30.1779798270637;
        Tue, 26 May 2026 05:24:30 -0700 (PDT)
Received: from [10.149.200.45] ([89.101.53.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm332352565e9.12.2026.05.26.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:24:30 -0700 (PDT)
Message-ID: <9e2151a8-85c2-45c8-a592-d0cd47d08528@linaro.org>
Date: Tue, 26 May 2026 13:24:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Daniel J Blueman <daniel@quora.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260526112409.66325-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2026 12:24, Daniel J Blueman wrote:
> The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
> Hamoa X1 CRD. Add a board-specific compatible with qcom,hamoa-crd-ec as
> the fallback.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - new patch (binding was missing in v1/v2)
> 
> Dependencies:
> https://lore.kernel.org/all/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com/
> 
>   .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml          | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index ac5a08f8f76d..813d41769c0b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -20,6 +20,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - lenovo,yoga-slim7x-ec
>                 - qcom,glymur-crd-ec
>                 - qcom,hamoa-iot-evk-ec
>             - const: qcom,hamoa-crd-ec

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
