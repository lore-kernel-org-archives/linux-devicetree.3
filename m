Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC780391822
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007346; cv=none; b=OXZILO6jK1Bup8GY8pqwNRNojMljpYLQvh/bWbX6MM4mTrOxoTSWyh7+WqRC5CMGHEFr/X7vdkqnmPWvIf0A3j7/BjZBoItb6xYzysW+MIoNCmNoZB7X6IgLtzYQgc5MuAuSDIZbi5HQY9T17h15t2kiuHpvoCpBbrqoPBxukMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007346; c=relaxed/simple;
	bh=Qrih9tbIxMYK3cVffn8rChfomShm6TcW+n2OQ6LGqGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYTvQMyNdwsE6xdaiOaxtcUthP4jc6OddFnm0Bg1XFSTYcI6/5KKvLwiLPv+9Ire2BpVYYPEWvevvFtzoEwfAH4MvYutcMvquT/Pq3mJpRSRqEyv8oDTM1n8EKh/Ibn86RSJBCCbym50hEWef54Dr61fae0NV4PH9DbGLwkYwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5HoPn+l; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5HoPn+l"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3937a1f9f7aso4397931fa.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007342; x=1778612142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=J5HoPn+l6jV5hGSLKn4NHP9KvSnHq7N0LYbPkufjlgcYzDMkKr0IfithL78JM9fbbg
         85ArIY0QlT6L0cjsX/6JBxZUaJ6FAwSxFBoj1S2D5G7dxbHpojgU7BiqL3CUhXP8aGpW
         BcLEkXU7X95iiI9Qymp5qZ3Z28ktdMzSSdGwoIFTOAPlTCkz5BhLS3yW+7oKF6yul/AX
         GcziERwiYn9d1/gBgIFIPrFoF48f87RgXuOO+63m29PbG7DVb+SdyoTf2Bw+BDRxdFMt
         QjBiTuia3vTIj2qPCUnwL4Uo6AYhRHcAhmHbel0tm9zfctTQ/ifBoeXfb2+HuUzBFCrK
         S0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007342; x=1778612142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=C6DyOkiWmtqR+EdQTWM8DcsLXtVycRNj7HHIx6rgdWz3U6hc0NysITP+MqRUbLiW/i
         zQC6j1AQE6iMxFpiKeJUbOY8h/cQhIy3cU8gnAUTRXvQRgfzJZnrUoOHxMBG7fxcTZw+
         bAKFAkFnBinPv/QxhJ94IWnz6POITH63pqDEWEpmsA+TEEzMII8ov+ljjqbbEF+Rjhgb
         hZNSAaa2vigAOeqsyX6xtUyehxRoiHUceADdUJuZS98vScbdjcYyveh0chKjExRvBEzu
         9e4ERtv8xhYMeKspy9s10KTn2BuTAct9elfAjeIX3Fptq36N3KIh1qH/NccHuCqCMUEU
         jKtA==
X-Forwarded-Encrypted: i=1; AFNElJ/nhmta1x/sep2PIrLzL7xDBSFo3FkfjvDpm4JDQy46mk1JsfJMy7uPY+WyxGCSDKp1TxfGTGS0TQlB@vger.kernel.org
X-Gm-Message-State: AOJu0YycCTvr2OR7LzQlyVK75qqTRMO1tbJNqn6fIF3iUPynQ0P0XxXI
	SMm91SQnOkeUOG+D7w4WmX8ZCC8m8pCzwbIW7SuzIbwTufhd29m6So6UTdCcNWePOFk=
X-Gm-Gg: AeBDieuSuHSBSXaAO3szvOknAwn2KbEgB+SX97IuN1NlGGj6RQqL0juU5QAd0kPzsxl
	q4pGgm5297tSxDAZNJagKVVPwrz/DLjVCiQDHWOhB1WuP6IO0U0EASvq7+nwh5PuzLuAMDWg1D1
	sliOilTCmPoQWFxg5Xw7UB1U3LSNtrne/UtcZjsrNwOrCKl3fWbtjMX07Qaw3krxnjPNNUXXjIV
	QR7rUU6kcf3U8k/l53k+UT0s1hulnTTkfYgsBDVeCtl46/9LonwSWsmLpcHmkbg6+I66PVoKwS+
	2ubRzaN0VndwzqgfDS0F7f4TjPlE2X4/uqCQ3m01v2PtwNAPBZO5pKdwbqDlP2D6H5jAZ9E7dLm
	t71FL692wWKIk9Nfv0WZUgqoeodeTEMZvMj80wpBxW3Mq90Pow5OXuyy3cTM2Uy05NtUI4RbeUE
	BzXOzbkljQy6tvW8QAkcIaftO+bmySFWJeyzRXJhuNPEXtf7x5sbi4dvrfQZnXxEqS219yhsUdA
	/ITGm8aDq6lPDa1
X-Received: by 2002:a05:6512:1056:b0:5a7:4912:1a3e with SMTP id 2adb3069b0e04-5a8631b8d40mr1976270e87.3.1778007342013;
        Tue, 05 May 2026 11:55:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a882e3589dsm654744e87.30.2026.05.05.11.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:55:41 -0700 (PDT)
Message-ID: <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Date: Tue, 5 May 2026 21:55:41 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
 <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
 <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/26 15:55, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 7:00 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:53, Pengyu Luo wrote:
>>> The rear sensor is S5K3L6, describing it but dropping compatible
>>> string, since there is no upstream driver. A funcitonal downstream
>>> driver is in comment.
>>>
>>> The VCM is dw9714, describe it.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>> Please take this patch as a RFC, I am not sure, how much I am allowed
>>> to add without a sensor driver.
>>> ---
>>>    .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>>>    1 file changed, 123 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> index 39e559e91289..76b1ecb3819d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> @@ -22,12 +22,18 @@
>>>    #include "sc8280xp.dtsi"
>>>    #include "sc8280xp-pmics.dtsi"
>>>
>>> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
>>> +/delete-node/ &cci1_i2c1;
>>> +/delete-node/ &cci1_i2c1_default;
>>> +/delete-node/ &cci1_i2c1_sleep;
>>
>> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
>> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>>
> 
> Should we register an unused node?
> 

I believe unused nodes are found everywhere marked by status = "disabled"
or if they do not produce a conflict for resources. I understand that a CCI
IP with two ports are special, but likely (not always though) it should be
acceptable to keep its device tree node as is.

-- 
Best wishes,
Vladimir
