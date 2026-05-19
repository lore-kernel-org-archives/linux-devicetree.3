Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520193016E0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173975; cv=none; b=fEvh+KtXBeWlOq4r6EexfWSq5v4avR/RVKKT+j5iKgzNQ07HCyDq4dA2+cZMLRSfw5zVj46F7tWlCsXNlTiO+3kMsigR6bp6NS6hovsJ/1zBOa+9y+wjZDd4s474QbqnfaQvigbzH8NHx2WieMMkC8BI54lPXSVHwNMHBFQJx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173975; c=relaxed/simple;
	bh=0BUhj6j3hrklauwfy+i/h/s8xlX/MYhRh465WVn2hLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtmyS21eY4Em3D5tJvT/gKIH8cFGZ/kFR1T84icXufTpHp7N9SeNWFVcunMKFOnNq1npoeYM6ZcRf84AJlERuR9K41BkJzSfWD5PIOvrvPt7SZrPJ2h1R6VYGiD3PtkajgUw3ryEOlc+tXK56s6W2I09ZHKjNChHCCq5Lw6eUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAk4FSBV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAk4FSBV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso22348665e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779173972; x=1779778772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gF5Z1qKa3/ePayEWJpcu7Cbt4cEhhoyI3/LeiuP7Ies=;
        b=MAk4FSBVZdYEtSXDCJVHAy6HwIuYO1y7zU9AaEJ23cjjxSOJioRz1BBlFKSs2ns/gB
         v3iWIZwcegLaqF4IeppnCt7DzcSLc2MresRoCAzV0pKasLnHkys0MihfsEVWVBKOT5ZK
         +ug0dqRuAmaPBtg8GhJmR7YleUwAvwewy65+l72mU+9/MBjwHk7lR46KafUCsBZTehSm
         v0SRbEYT5ECZDjIsmqXGw/LiRFHqMQ0aHfFcOIGicUoR2hwFxMuMrmbv+DvjdWNriDOy
         jQ5mICK1BT3VOGcwqFzJcou47u26sST8mL9k7gSFcry6jMTdcEmiT7mDitDH9+JYDNNB
         YvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173972; x=1779778772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gF5Z1qKa3/ePayEWJpcu7Cbt4cEhhoyI3/LeiuP7Ies=;
        b=lG/iVS/owEYZ9GIziK6e8zpcSv4HEEMObGCfp2poErc3ZpLCqims0hum4ndUp9wGgm
         ou/g+05Dnkh1It8g2pVZqXE078oHNI1Zsn+Rbj1IiD1jrlOnJBFA78HqOIe8pI0Rw/Kc
         ql5Mof5TYdy2NB/5VWToYRNLziVYyK8Va4pQJ8Xglyq+2UHs5QtKBo0gSnz7JCqyClSq
         IUgyd2DULyn/+lQlznLaCyTFeIID4RWUdjvVR+k14jJTsEgG7Iy5m0CDwdqY/LeOR2h9
         CnTJHjSgeesN3yUHwUOIXOdDmKmhsoCu+LieVUwmKXiE0pHwCrVgFUAJ0f6+yw0Gng3/
         K8kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2AhaAxHAdt2aoRI1vP8Syw+Pz1QaBZmenK4uDtGsyLPpbdKNkSptOvF/MmJF7+jkGfjcFbGRqMIC8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3aZVOZLCcopxk+DzB4qrKvsLnH/vwhCstDou10fbN6gVQicyR
	Y95KOSGUby6UsrjxBCBmLw5FG7ZfhTZpz+ZcBuG/cR5St5PB6pBGpxeN
X-Gm-Gg: Acq92OGpnQw4jUxwwALc/N/kojk06wCE+dX+r6yoXLS1/0QP6PZIU9zhP3FKc7d5+pr
	fGySPO5SJmHE2M/HJ1UEaFY/CPOLluWUlOjb4mAiD4yblH2rFWfXY+5F/newWeP+d7bngHbU39W
	ZJtOlBEzM7SnilXlwddEcx8umCzhBFMJTbpHDebKf45utJYcZoLF6gr7c/K1S95+jRqoWM6n5Pe
	A2ZxoMg6Bbkqlj1aKzuHhqSK8x3zzRflPfUoZkQAJQBmz0hMQ32E52YlcWe/DUiW65H+Y2b+Aww
	OSGgHYZ9LEMr0NqJaRkuAHMO2i0Fbt4tQyezkmjToYSVLJbIcTIRbIcsbuX0QkrLZpqGG80VVgJ
	JX/a/HhRRGpa+h41PLWR42kcR5MMTS/VwT9Caxohk9HLV5k0LWzmCIsjl+gtmHRmnfkBYPpV9Op
	QP7B3yVur4plZZJtH9UjEUgMwrHhHHG1Q+EtHtDqV99OU+U2YAoEzqhl20sTpD620EPS/1
X-Received: by 2002:a05:600c:8189:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48fe6323addmr275170575e9.21.1779173971682;
        Mon, 18 May 2026 23:59:31 -0700 (PDT)
Received: from ?IPV6:2a02:3033:6c2:b9c5:ec15:f5ad:b85f:a3b8? ([2a02:3033:6c2:b9c5:ec15:f5ad:b85f:a3b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c744sm126227455e9.3.2026.05.18.23.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 23:59:31 -0700 (PDT)
Message-ID: <3932472e-91aa-400b-a1a4-03f520706890@gmail.com>
Date: Tue, 19 May 2026 08:59:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rodrigo.alencar@analog.com
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei> <20260508140814.67800e4a@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260508140814.67800e4a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/8/26 15:08, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:48:43 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
>> On Fri, 8 May 2026 13:55:47 +0200
>> Janani Sunil <janani.sunil@analog.com> wrote:
>>
>>> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
>>> buffered voltage output digital-to-analog converter (DAC) with an
>>> integrated precision reference.
>>>
>>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>>> ---
>>>   .../devicetree/bindings/iio/dac/adi,ad5529r.yaml   | 96 ++++++++++++++++++++++
>>>   MAINTAINERS                                        |  7 ++
>>>   2 files changed, 103 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
>>> new file mode 100644
>>> index 000000000000..f531b4865b01
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
>>> @@ -0,0 +1,96 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/iio/dac/adi,ad5529r.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Analog Devices AD5529R 16-Channel 12/16-bit High Voltage DAC
>> How is one device bother 12 and 16-bit? That sometimes happens for
>> ADCs where it is really reflecting oversampling or for device with hardware
>> FIFOs where storage space is saved by using lower bit rate. I'm not sure either
>> applies here.
> Having read the driver I now understand. This is supporting two parts and
> doing device ID based detection.  In an unusual step for Analog they have
> the same base part number with a post fix.  Whilst this approach works today
> it fundamentally breaks fallback dt-compatibles being used in future (the
> driver fails for any non match of WHOAMI value as it needs them to look
> up device specific data)  As such I think you need to have separate
> compatibles for the 12 and 16 bit versions.

AD5529R supports two variants- AD5529R-12 bit and AD5529R-16 bit. They share the same register interface and pin configuration
but differ in DAC resolution. I will add separate compatibles for this case.

Best Regards,
Janani Sunil

