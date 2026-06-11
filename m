Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D03112AB
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188584; cv=none; b=sD236wpuGNfh5XSX0GBsG40LULcHWLURT1UE73UoUV11D/YWrdVVazSfH+t2YmFlzxeITfvw4/1eN+tqsEC8wiWCDMh8Xyv0mI8oi62GLWS+WsMjMKud9MupBtcPlYSfxxI+t5AhPgsKeJuEWctESM/SDYeddI0c1al7K8Orfds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188584; c=relaxed/simple;
	bh=qnv1fAGXCtLVIjll5OZjfkQjjlkL/oatmHWaQJUPthU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSpXWBlQzU0+a3g2ugJEQUeqk3/MbGa8LtxURzw1FJPEHxLhC8FHUXGpMxK9f1dNu1LwuyxF2y9nVMoPQcqT3ZhZTb1KMEGFZS2xL4Crh96npQeR8qOJO0cJLd1BleCIQNCYwgazu3zBN3btQr3yXGdI76cBNMcJPN8uHrOBOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYQzB2DW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYQzB2DW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2583685a12.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781188579; x=1781793379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=xYQzB2DWHdtUO2kVszPWBJnsDsb83mivWggIjMOTuCYejfnCtOM0ysSmqmjgJUsfve
         mUOnxWryQCZEfGjcF16Hk+UKfDYR8UeTW9HUlHSn691NDGwUlJR+cp/Wl8ut+jurud9z
         CjzhL41ePAlgMNeGOhTDLHcbPYhGqr8c0SxiuqFl5sDJDWxeMRcLRoE1Qduic85+MfXU
         19jCHwkHzTxt4HzZuI6bnIyWq5VXcUIc5p6X4I2bfyZ5unS6L0LwCoTJuQKb/tYhPyeo
         9tqNxrCUhjKacMZrS46E/+jncAvZrx1GO1tXdgFgb9d1eKLX7E5hxysklo14JLLJXqY8
         IrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188579; x=1781793379;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr3m8r/i7ovHfjfbNC82N3Y0eijmiJMV+xkhP6DvT20=;
        b=hmq2A4+GxyFyA2gRwuuC8Mqrnfs3vvmsbZgm42dWJnpmaHrHEVU+EVZhMnzkbnbnKf
         ZBgPVqhW8pjTFJgmIwJpG8EbxYL6AGU9PzzfT570QByag6SuOj8qMcl4wQ+yI+sfAsvY
         45j/4soljEJpCX1eY7d+5njDUaaU8mh8Id7o28kLsJOP5EE5d6iElRcr3ACnKYFAbgxN
         nhYZGtcpTcGyJAdWoFn0gAhuxzM1JgtxBxIQlYleftcY0DUiDpE0tDukULK+u2GKapgN
         xDyd0tYerCboQaUaho2Cd5nqMZSCKpLCvLSjCynnEqvKzm+BKl+zG3d/fSSb9ZidvOJi
         c0cw==
X-Forwarded-Encrypted: i=1; AFNElJ8uRMXcrUO9KCQmZxKxELugaBqmdWxz1S9EQG7jmwduTG+T432wPjCzq+q+notoSO1MrnIyLLJ5f92n@vger.kernel.org
X-Gm-Message-State: AOJu0YziQGJ+HSBbT7dQU4VjVLILNTP2O6ZlsrsFLUt7vPgN1nLs7G4R
	Aq6NSsvJAh22zHvpzrg5QJGxyzfwkXS95EdS82TDmPnKdJefj0pfEl1UMuSB95uqAec=
X-Gm-Gg: Acq92OG+TIO5JCf6JvGDOxffaEmcGxCJJl50FpLiSY7zoNLuTIojH+GDlb8CQkA6+ep
	kWI/4GxgB5TkDUWcAOQmWpoDerneL2Xnnp9eyxqlX9trcq692s4y0tTnvpKTcyr8+KAi2fVG8hV
	fFrp8TRHovBW2TRCSYz5SztWm15NRv66JFSx4aUB7Bmi3Fc4/7TboRdoO1MoyvYd4vTS+7W5nxw
	JtKUpFP5q/m7qCo25GCJZOpsrkc2X0wVThkiwbCVhCFGU/wJpFmVCMuRY4fmYBgPzLEguPofLsI
	eew1JwHiSY1KeHk1K2khHcFUWFnmI/N/Nk1e1rrzO9DMleSE2ZPkbl06XiNjIJfJLbgQAaXnMB5
	HxEcRPk4Y/9saFm3tOx3MaCGKzPQrWCx7MqtU8JFTq6nNhTvHr1QcMT7KaBRAMxDdpWMBcwONph
	zNmGnLgQWUyQKMexNLxobE4R+We9jLyGJkzvs0KyOQp3v4zA==
X-Received: by 2002:a17:906:6a05:b0:bda:8e57:5639 with SMTP id a640c23a62f3a-bfc85e9049dmr144570566b.20.1781188578927;
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm7011436a12.29.2026.06.11.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:36:18 -0700 (PDT)
Message-ID: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Date: Thu, 11 Jun 2026 15:36:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-reliable-vivid-stork-f4ea6c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 21:46, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 07:36:38PM +0530, Nihal Kumar Gupta wrote:
>> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
>> platform-specific compatible string, using qcom,qcm2290-camss as
>> fallback.
>>
>> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
>> single IOMMU context bank instead of four.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
>> @@ -14,8 +14,11 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,qcm2290-camss
>> -
> 
> Do not remove blank lines.
> 
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,shikra-camss
>> +          - const: qcom,qcm2290-camss
>> +      - const: qcom,qcm2290-camss
>>     reg:
> 
> With this fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

@Nihal.

If this is the only change you get asked to make, I will just fix this 
up on application for you. There's no need to v3 the series for this.

---
bod
