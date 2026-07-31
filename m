Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836913C2B82
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487034; cv=none; b=llAqFml2W5QR7PFuFz5bP7rvNRm/XHkdN5TuIvoczxkgDsHyQpL/F/S2AwEVCXYo9x5TFRX/2eyUzL7XM1jiLmqoisceksPX6K3774LYjCbxT6uqpdpypqkhKoz1FEk95+bLnIRtbcwQttznBXRYOP6JClUX3IJJ8+kt3K42gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487034; c=relaxed/simple;
	bh=vQ5rVmRcjhG3dspKydXeLI0zH+ohQHhWeIHCWc5UuMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6Rx/ltkeRNRV/z0forNethurPdXbn71JFxacV/FfhSheTSRvh0ccBLVAMv2Va6yCMGgdW43zf5zv+YGOr461HqbKhYAbXD4BASO47Y3QMY2ctrhgthDfi0Ao4g4CNwJI76dtDmnz+8T9fJ3sbV6VJZB6XQfykmzYsOTIL8TdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shLEnrHw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shLEnrHw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so124331e87.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785487030; x=1786091830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3dyMR+of+eppojoqn/WYKEbq0hKR8UKNgWRGxQVm9Do=;
        b=shLEnrHwQxXqDMajIzdpFelHY/Ytg5FSVUB0HDi40gno93vIMcoftPl6CairWIaWgH
         IowD83qLHMJ2I1gsiJv+BUfuWUYPqC695Abmo9ouNVKBGd31hA/cGKwQofo4mUkzcg6W
         L6/IVs4qIHyKtSega32fHGKrF4FFrooq/x+UkAOpRWk0Kpf+yLrtWRgRp/IuNgJq1waW
         rK65Xwua8yBXyTrRJeV/jCWtfWlLZbkZ9ka0D7nOmYL8bn2ST7am7R0qDXu4zlmdibav
         RO9Hb1B0WQaKFMnKldajHbhwqIzkDmsFKeUiteD7vXwvNEEIvVpnhp1/rtjLQOdBKK6D
         OxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487030; x=1786091830;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dyMR+of+eppojoqn/WYKEbq0hKR8UKNgWRGxQVm9Do=;
        b=tR/x3UKuteaTIV0QiK4zGw4yE2DXmWehiQgWp9czu6EJFkUQzf2ULfDeHYemfSnY8U
         VoJzjv7mIb6JY/d1k4pYCAznLS4GITyKQB8i9s0nNfAM8fi9aY/l3eq0UEUaSVZBfS+i
         rRWSLEtXLCfISAq/eBUOrByt0MyWUcQfDV3Vt+nPDL8AxfhA4wAZ/kdUgvGIQJ4UEDr7
         NtY9HyAYRhVxi2fuvWgjy/8C4qjNmKR4DhbfpZnvi+B1/VE8sFOa7K/ujOjZ4FxfwyVf
         YXArmVE2P9twbUsJEm2oQhNR+o+GvQyMqVFl7f1oOaE7OVspFI3YhjId7qo6TuIdbKKo
         f/OA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8lo2yzoNujIb+hOZSFam9InsvjUsLAAHdBTeVoDTvBsxT1xaCiJZZ/cB1DmtztX73irr7ytxOi9ZA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VXFKdc2ivNIgGQk6geoPz1/wCTX8sr48yCgdHY5eAwStSsRg
	FrpgCplDVcgjN89z7QZL8Ye/zP4QhLpi0OHwdVq1lAdf3GQo4CNNPy0ecLJznm3bOhhOENtbzit
	a3nQsneYPuA==
X-Gm-Gg: AR+sD11Lm1izNJrFrzU0H/fVPZqtp7hpLeOa62aYd0WX7yRQLcmVcJ0sfiN59BBrd7J
	KuYs9kwj8zwf/N6OmKew4BFQI7oN/08VnPyyK+ya76gL55hrl7RNvtLNE+tn+5973rFFJq3ldQg
	GyVoS0d/HqUFYDWB/Y08P+xCqNzbJBOBcl4lP738qz0n2SVrZQU7+ICqjg6yr35gnl0B/vIBgVW
	uL0ncxvTrQ+jYJekUK4hduuzP9M/olwvSeK20SmMq+83Tx+NdLerm6t2aFAbHMI7CCmB2lsqD1Y
	BEN9VgY+xAOaVHTJXLHB8k9LJlFEEXPm8hGlCiDdABN6GKGRNW9GhsaNmLuB6j24e5F3YkcqaEg
	j45lCG9dz0DAS3y4fEUjL5KszfaxIHXnRGqTyUbf+wTmn0fPqRVzN4GpqLFJT1JSLyCoZab9ewc
	mB9PALi7f0JV3xGpvxvkNgUOK63fWr1LwuINe0JtE7kVmvNOzSp97leivxVRe88Fij8M+VB+D82
	5LCzWjzA+3WZ/3bCjIBRWsZAOBrCzTl5wcdejTuiP+cxkKfnrQzeg==
X-Received: by 2002:a05:6512:2395:b0:5b1:5c72:2f0d with SMTP id 2adb3069b0e04-5b2e1fe7701mr326410e87.4.1785487030431;
        Fri, 31 Jul 2026 01:37:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c435sm163128e87.82.2026.07.31.01.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:37:08 -0700 (PDT)
Message-ID: <744b80e3-9350-470e-ab2b-9e3efb89fe32@linaro.org>
Date: Fri, 31 Jul 2026 11:37:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to
 37.5MHz
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
 <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 7/31/26 10:46, Loic Poulain wrote:
> On Wed, Jul 29, 2026 at 10:13 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Setting CCI supply clock rate to higher value of 37.5MHz allows to
>> program the controller to configure its I2C bus speed to Fast-mode plus.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> This works for upstream dts/dtso as the SoC sets a default I2C rate to
> 1Mhz (fast+) for the CCI bus masters, so the 37.5 rate is the right
> rate for it. I'm however unsure we want 1Mhz as default and still

As a generic note the specifications of modern camera sensors do not
mention 100 KHz bus speed mode, today 400 KHz and 1000 KHz are the only
found speed modes in "SCCB interface timing" or similar section of
modern camera sensors, and 1000 KHz is the standard I2C bus speed mode
for the last 20 years.

What is more important, this change "fixes" out-of-spec and very likely
unsupported by I2C slaves SCL rates, which are 192/375 multiplies of
the wanted rates.

> think we should avoid relying on assigned-clock, but until a proper
> solution lands, this simple fix/patch is consistent:
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thank you for discussion and review!

>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index a64922c21267..a14e11d81488 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci0_0_default &cci0_1_default>;
>>                          pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci1_0_default &cci1_1_default>;
>>                          pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>>                          clock-names = "camnoc_axi",
>>                                        "cpas_ahb",
>>                                        "cci";
>> +                       assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
>> +                       assigned-clock-rates = <37500000>;
>>                          pinctrl-0 = <&cci2_0_default &cci2_1_default>;
>>                          pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
>>                          pinctrl-names = "default", "sleep";
>> --
>> 2.53.0
>>

-- 
Best wishes,
Vladimir
