Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8A3E4C6A;
	Mon, 23 Mar 2026 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298979; cv=none; b=hW10+nfWrjUEwWdmjJdfr+GQx9Aatf0NTZbIaerwCtZcVD7iYY3lh9xRXfiyOaNqv4VBaSdRWWJt1nxBXhq21rMRaMaNmeRo8zzog+wcst6V/P3BYtNGpRXyinkdn7JRhX2Z2i4tSHalHXQn3/8Y+ycILFcb0f6/ppP6gY/Ih94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298979; c=relaxed/simple;
	bh=0pmS5hAUDlu3zrsSMoZh4tzsSSQ0hXIW0rgxBdqIMms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fStAStE9aAjKsJySKF3VR4I1MF8ghUyDKDVhwZ/g/CYriNxtK8MNOZ14Q2klPNlFgy0P2UFhDfeCCucizxm+DC+WQ76Bor4OISedGRAOP5piybS6yN1uAEZ11pgNvwjf+gcoQmgtgieeUgv+pH+DlCUhJVkFXExP0VJBSAEMO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=hx6nvCth; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="hx6nvCth"
Message-ID: <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774298974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPxjR0A9YEFfzmWROX/GNepxauCty+GI2uhi8VJRg5k=;
	b=hx6nvCth27I+eo36ypG0ha7DLF1IlDWY/FuhM0ZMkBUCGlOqNGJpw/bJBrmvgUgruQuVTr
	s+ofqWbnZ0k4jxBDFUiV6+qBh92ut3XBbdOq0eH3K89K8LI+hVjTkz3nBbKqutYWOs1O2V
	ECttbmczMMDBCSWkkEEh8KmnU2W97vNxwsWpqavso9EjDV0Iv7xk9s7hec+7LBFEt4Fiou
	GMvyYcXs7G9/4I5ouW/5ts/2Br4vpqpVt9w1TRPhNspIguNJQ297FNvE00j5nZEeaQc5dz
	w3z0ogD8it0H3TeVyDL6cXBi48Wd0Horoyj3yRnphtzs1OY2Bix6BQocAXDltQ==
Date: Mon, 23 Mar 2026 17:49:14 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
 <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/23/26 05:04, Stanislav Zaikin wrote:
> On 3/21/26 8:36 AM, Val Packett wrote:
>> Hello again :)
>>
>> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>> […]
>>> +    touchscreen@0 {
>>> +        compatible = "goodix,gt9916";
>>> +        reg = <0>;
>>> +
>>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>>> +
>>> +        avdd-supply = <&vreg_l7c_3p0>;
>>> +        vddio-supply = <&vreg_l2c_1p8>;
>>> +
>>> +        spi-max-frequency = <5000000>;
>>> +
>>> +        touchscreen-size-x = <10800>;
>>> +        touchscreen-size-y = <24000>;
>>> […]
>>
>> I have noticed this previously and started wondering why the size was 
>> 10x higher. Now with my own device (motorola-dubai) I actually found 
>> out why…
>>
>> With the actual 1080x2400 size, the mm values reported by libinput 
>> are 10x higher than what they should be, e.g. touching the bottom 
>> right corner with libinput debug-events:
>>
>>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
>> (1067.00/2370.00mm)
>>
>> (2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
>> on-screen keyboard was accidentally detecting super-fast down swipes 
>> as I was typing normally, and suddenly closing the keyboard as I was 
>> typing.
>>
> I wonder why some other devices with gt9916 (there are a couple in 
> mainline) that specifies 1080x2400. I don't think we can make this 
> assumption unless there was a mistake already in those mainline dts.
>
> Best regards,
> Stanislav

Not sure what you meant there..

I have not seen other devices do the 10800/24000 thing. Please set 
1080/2400 (actual size not 10x larger).

~val

