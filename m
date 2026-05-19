Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289154A33E2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190923; cv=none; b=eaxB/6sz6+u0HyT+zCem4Dp4yD8+lU9baaG+1bAiE0KRSNMF76ik/Zjw6Jli2qG+ecHqaRV7hOpm42SqMTZ1Z+Be6kcEWsqJpeLbtP+nxb2Uhglq+VDMbQ52hRCBsT1Rzi6U+ktlZT7AT+3Cquk7BBBtDbhKZ/mec/BmArTZvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190923; c=relaxed/simple;
	bh=iXaQej+aa3DbMyR4YHSetSZ0oLvnEXqSgtMh+UpQUEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qarGpmZGwgEoqXf/N6s+xW9enaxFH1HIgOOxE1wY2raJzA0G3kVyUljiuxGGD8gLJsI7vv/ips/e+zbDY2OAWTsaTMZtyEQ2FEFJEkX6EpxK2TG2QPhpXwqynIM5Knx8m79gj08vPevby5m2HHEH5w3RRN7VDEuGNkm57L/tyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+gY1OE9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+gY1OE9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so28398025e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779190920; x=1779795720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=K+gY1OE9DhU903zmTSNokRe4DZws4D7Lxrtt0xgT3FBjwBBgwwZKav+DOrRc65MbL3
         Cpw+pNbs6o/8ADeOcEUtEbiuuhml8q7GMQdIQ/xaOha7IDuxVCboBc6rpHPTFI4llNhA
         3SMUYFP/diYDwHcZDlhrVu4OadZFj/26l9HoBeXqpeNHBvXqOxls0NAehlgg8SkD8xs0
         8WpeZrJsnYn2/NGizUXsRccJvmgCJ8ks7wIoJqaTMp4t/5+tLaLTztYdYY7JWZ43UBIq
         2RRx8UQbQNJ+a8UPSxZpy4DSkxOHtc1MqleoXhuwHLXSKCNHwYreHJsRT638OCK78JAV
         0ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190920; x=1779795720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=RN54QHiyoYySeGRWtDVbRu5hRkcWQ5dQ8bfeskDWnMFOg+Ez2leJljKZSkzYddrA7i
         yAZxi7ZvqM4C1T3WTwNcWweYwKxKPNGk7cau5kKvx/+coCBc+TML6d48asd05sLc92Is
         1pEVYiPO3oZr3wneX3rte/MpVFFW9Qwl+XoUWzdF60sWeGv+kxp5MSiJGECp4wKmfZYz
         nCTTG6jd0LEh0LOTl7G3pIkXi7seIKc5TfXyhbej5jUTln26vTk9YoBzl23A77IdGGvH
         859PcOfErqMv0SgRQ6v7dLo17H1ODcTWafa2vzICNs4U5f0mdNuA9syBruf9QtZD312g
         dxVw==
X-Forwarded-Encrypted: i=1; AFNElJ937d4vxrO9Frnwt7udZFihWBAJKTQebxxWSuYYroIHMnXeGUYUHrBT67tC0cP9h0XxU/ZAriFYXZGK@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjduX2vojq/oqLOfOB5DZGHh2BpCJEvqm3y57BYh1bcPjMPRc
	YPMlva5hovA/Ng4OcdOcngS1eWda28XVXv1bg7RR3kM+cIkBvq5Tdy+DmPwe0qfiUnw=
X-Gm-Gg: Acq92OFPWK+lMluCeCqRGUOlz6E5o5RbwEJe+4oeB5lTfjJ1bC/btQRdJf/A3lp3vsT
	/s9kGirTE7QS0Z3NuwXbtJY0NPgt9YotNsGKrflpno15EmuYVkgUs6GM4a4VCzRSJ7C/X79RUDn
	yvX7aHQfxlAJec8SzN0PhdpqkcXK0wqvAztASUC2GaQe4vdQyrmKI7xtDtZx/anRyTuL4AAl4ST
	cOnZ2ZxnS7LZwRv1siz9aGvKIa3ybhbytKnpmYY0d/crMmvuJivO6IfSS4gM+f45qQ1gQo1mA2X
	ICOHp3X8qFZKHLrbGO2VFHjOUpFZcXayuqTOwXhGcTmenZaNExL7L3s5cxkxbpz3uKadSM4/gOy
	fm21IbO/h/63sR0jhHYMDt9LkC+FEu49hzMMUEkY9vtKh3u4AQiPp/WE4e5pPIG0NAfetzj+UsN
	ePPjeZeYyFKVHmLhFmVRIaeuLVk8msZRdR2Q==
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr296433775e9.7.1779190920505;
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf8305dsm152745015e9.9.2026.05.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Message-ID: <1485d619-35da-48e1-a108-60de1bd8b19b@linaro.org>
Date: Tue, 19 May 2026 12:41:59 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: tcpm: qcom: use connector to specify VBUS
 regulator.
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2026 11:48, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. In theory hardware can use different
> regulators for VBUS, so specifying it in the PMIC DTSI is not correct.
> Deprecate this property in favour of the standard way of specifying it
> (via the connector's vbus-supply property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (6):
>        dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
>        usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
>        arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes
> 
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml |  4 ++--
>   arch/arm64/boot/dts/qcom/pm4125.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pmi632.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  2 ++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    |  2 ++
>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  2 ++
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c         | 12 +++++++++++-
>   14 files changed, 29 insertions(+), 7 deletions(-)
> ---
> base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
> change-id: 20260519-fix-tcpm-vbus-aabde21f339d
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 

It should be possible to use vbus from any source - and that vbus is 
indeed port not controller specific.

For the series

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
