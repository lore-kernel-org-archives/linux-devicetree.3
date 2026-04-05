Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB98219A7A
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348515; cv=none; b=fTME0i0jju425/va2KWedIqkJQ3LMo36O9/f7Z4axN/XcmkiYOrnj/9Cagylp9TJFMTvx/ni7/hgvLVjlcVkQM7UdSKstj/oooMN321VmQSs8SL4tROEMWCdgwWPbtOP2+RLpdo78tpYc3mQ5kCY29+cO22WrDjlqd42ttUsk8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348515; c=relaxed/simple;
	bh=tqWs+zzx709MgWZt3PmvYlKpoqqid78J2QNdrEuuRig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS1L31r9DJLtILtjfo1D3w9PHvwXQ9Z2LJeZLl/z8J109xl2fpHUCapKkS3sZAdur593K6q+FQIMAP80ip1Su6F6kPCFmHAMLMkaMGVqOb0+usclEvV9T8TX6CrRR692PFlGVWYv7czapVuBBy+yiPs238fBpU3Tnx/T91ZFBAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMMg/Bb/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMMg/Bb/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso1678382f8f.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348512; x=1775953312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bPmswsl0ZEMtXy2tMsgQsJ71tmyi4kiw2oOvZ6aYTA=;
        b=OMMg/Bb/Lwv/ZtLsRo4wcxuEpVNGKc5KTTL3DmJmxTr8IXVRrn0l6YLvJkBqeWtVSQ
         2ce0IMabicu2A4jPi0q6qNsb44MN1E5zLOs5TuOx83dmqie0/xWLHx3bme4CLmKALhDN
         CUKf98HnWAU3NmtM7GMP0LL/5oX3vs2dA2GFFNABIWLHsmHKw8qCQNo5SdlfwJnlFxzN
         1wDwhNwMmlDu5yeliyWzq8HFK+LU3J1TgvYZHoaP4Fon9cCEZwvplcfynv/q7zAjCtmI
         d+sqNPCi71Ao89IX0RTlZVzX7Qdecydv3ggiUEoAnOlaXqK/6O20JNH5N5xKO84txYej
         9JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348512; x=1775953312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bPmswsl0ZEMtXy2tMsgQsJ71tmyi4kiw2oOvZ6aYTA=;
        b=h2qeiUw2RPlnawservRFOfWdW0cMmD/nBbLCOubs5jg182D5jGcmdRsWOJ4c05tPrB
         jwaFe1WUrfl1GzZdkEM+ljqMnhW0gtCtLzAa8rMFBYAQS+lPCenRIE7A0FS42jeM4lGF
         0x312LdViObJGFy/icxqJganQvJKdon+MJLYLfQ/RB0sNtMzr4pB25B3x2DjLKFq4uoB
         uCDWNe5r8PD780zUukLk9Vido51Y6pKbhG7DPxvVW5rn3nX0xRNxe2h06nrSRERpkS/6
         adfksodnrUXqNvLubVs9Gk39zBtm0ciGkjh+itBR6Fs3NrncBZ6myKc4pG4v+NW1h7WR
         3Esw==
X-Forwarded-Encrypted: i=1; AJvYcCW+B6OAoS4eaaA6ci4l+qag7uUxwac94ZNiH1YVlTR68lN1BI2X0csaAxCfhnEkGCei7IJILrqo5rwX@vger.kernel.org
X-Gm-Message-State: AOJu0YyKO0yH256UWAEy7gag6kbcISUFHZNuZvZpD6ikPMJEXZ2zB3u+
	ZF3hI/rZ6/CNW4KoqyLy4obFfQrP9tvYohBEGrx8KlAGV90HcRMQgSYGAN2OJ8EBDVE=
X-Gm-Gg: AeBDieuZ9aW7h5nOorIjfBIpTECPb/5ihvYPOgsRMLn54fBWklPYkklW9B9wdNecYgv
	FfIBJF1xLCNV5Ge5eueqxSvvU8IQeO+KX8ULq6HHV4fuTZchqRq+SfVvu/C7X5vhhGTGTqWnt9t
	hj632609j6ds1e1lZQuAgSZdyNVE+daTpCo3rZVZQE0eN39aMqfRwLMfza593MVD1J72dfThgTH
	sZKbNlE9ttmMyjg5myzrDau5gWouwDSWMzxAkvvGY0pdTb/pn7V5tBUfLqVropfPcE0Afra1Jjy
	ThzKwLV0Rxce0aeMfH1nXw+DnpRJP9nhchxbnekTfg1yp9I08CxF/bhRctpM8ZYXHWMD5oS0CuW
	/JlBwvCmD24nMaNT2bRK/JkNLu3yiGn7mIKcxKdhGhqzQ87aiOZA1tefClwwRri1YN6+MAm5h84
	ea8cU1XfJPgp+a9/ShW3Fe5fTbg50Yr5il87B66mUDrkwibw==
X-Received: by 2002:a05:6000:2482:b0:43b:851c:4483 with SMTP id ffacd0b85a97d-43d29276b96mr11673051f8f.4.1775348512511;
        Sat, 04 Apr 2026 17:21:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm26296263f8f.29.2026.04.04.17.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:21:51 -0700 (PDT)
Message-ID: <b5a7063b-23f6-4b9f-a427-b82a6afad353@linaro.org>
Date: Sun, 5 Apr 2026 01:21:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> +		io-channel-names = "sys_therm0",
> +				   "sys_therm1",
> +				   "sys_therm2",
> +				   "sys_therm3",
> +				   "sys_therm4",
> +				   "sys_therm5",
> +				   "sys_therm6";

io-channels-names = "lpddr5x-therm", "charger-left-therm", 
"charger-right-therm", "ssd-therm", "keyboard-therm"

> +	};
>   };
>   
>   &i2c7 {
> @@ -1025,6 +1050,64 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
>   	};
>   };
>   
> +&pmk8550_vadc {
> +	/* Around DRAM */
> +	channel@14c {
> +		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm0";

You might as well use the same name for the label "lpddr5-therm"

> +	};

On thena the list is:

- "OPT temp"
- "CPU VR"
- "GPU VR"
- "Charging-1"
- "Charging-2"
- "WLAN"
- "WLAN (EE)"

So I think both the source and the sink should describe and be allowed 
to describe what it is io-channel-names = "fixed list" is too restrictive.

Much more useful to userspace to see a string "lpddr5-therm" than 
"sys_therm0".

---
bod
