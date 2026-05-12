Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D5048166E
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572805; cv=none; b=sbeaXhlwbRBT3Z3DTbj13bG2TTOtrZKQS84QZz3BdGokmPYvARssRxSpKJJOBdm/8lc1qyvzmBivRXgpsK9/reUIcFBCNT5q8wZvknP6Y6mx07expAuXb4F0b8AHADS+1Xl522DKAkGx7ix4tzmwLa7LliZh8IExhv+4aMr8r/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572805; c=relaxed/simple;
	bh=2fv5A4e1dB9zVQIntVwLfiUySYvcdprvcXazBhueM1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXPOZyg8dpKWRIYuGlQTF9UHzy7D+RUr9/3DNVrbewqrVqNFhJJ98qWFJZ8I5lkGYJUrUdxtqRsiyL8PWvFQlyLfYIFbUYesmFpKBxMgpugVsTttRXs9Chi0z64orjTigrgNIaP/9+/e8xubIBrFHe5DTwUoyvy7Cn3UwvDOITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFXf4nJ5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFXf4nJ5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso9909420a12.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572802; x=1779177602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3vQQvfbzTBQxob4QAR66E1utIi23oX37LhpyEU1L8A=;
        b=AFXf4nJ5CkeeIikBG3N73Yg/D9d5wNtwORMTovs2xB0jwYyjZu9/idVoEsv09+9pbf
         2hvD43nCBOrVaKI0ST8LS71l8XpN6NcoEq+Uf8t11f0ihX4LPE8JgUNgMCtFbsTzTnP0
         gu7b8b2X4rj2CRPJYo/US7AijhYx+6LeHk/mF8XdAxvPEpIjSQdxAMSwqS4TeuLCH/Fg
         2qn9WayOmstRckvJj6tTpNUT1fRX95s4po0hcf0DbD5uQf9W3qzqtx52haLpCoW+/XXm
         tq+EMwfN25zN5GtMvkWcTS11oQn6ed3qjoypuVQTiSnfCydi34jNVq2JP3Z28t2Xh6YG
         T2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572802; x=1779177602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3vQQvfbzTBQxob4QAR66E1utIi23oX37LhpyEU1L8A=;
        b=ZG76KDLvUj0DpRiU5IMdSll4e7PXwkYqpKPBY8z3PEzMeU/OUfjuNc0u9ie/L3w0M8
         nEkYBP23970+Y/1p/oees5xHuW1WyvnUkkk2Op2fVY5RaFndWzMFn43sO+5elpU+5e6U
         m9Zr4oxNh80D2g1KNkMX5nH/Z6eUy91BRNcl4aAeXDtRu4LVeCQnQyO7FytkjGZSDFUR
         7pNtgB0A1nRi3wyQ3yvJ1Ob4yagiVMuul78zBzwKBPdPNpcGUPpwIPfiAjRhvo0bK4UX
         WQLUibCxT0n8BekqM+BBwtyWgKz5IoVqn0Dq15zXwknnI+NDgWmGQTl4qBgrxPBagxB0
         cX0w==
X-Gm-Message-State: AOJu0YyQXhtmoU6U7I1vgdVpAs+WJPUixoJq0fQmnTHAyktb6lpJoz2T
	msMlzdDgqguo/zY1z2DnnO0mSSE9MJD2RGEFA2zDHFZHUzn33HLihfMz
X-Gm-Gg: Acq92OHqRbjwjeOiBjd4gsvH7dHEn9Ri5TRkUpIDQOJ1Fo+PunVONADOzA0fxj6uFKp
	FiAqTNofZIvWMGR7vzUulw6yVYvOoxjQdn9P+5OsLnRTT6olIDScDkVqpaO0QuVKVzZAGnOCNaE
	xJnbksmyC1al/lgGBWlGnHKCQapfn+YxP81tz2I0Jc3R+dBDYypte9YS703AP+DsL+e2EV49SpC
	yRSswF9kyX2DqXwjY5lwaV5jWNsFjtc3dQCirWegze7mLn1dlvP3Uv/Cpb2mU1wxjA94lqeXuwL
	ZcH+0ry/PZcCJFokmtYla6iWwkkzNDJXby4IOWuuidOEF58Rmxk9iGnSHHaC6rY6svDf3soym+z
	Mu8KwjUT5Wxko7+eA9gMj/fSz3/q2sFWglwb05u869KbdEBiQYk76D/lDo8ITuRPSFxoG3gMKJb
	g6153XlTN3tXu/6hcOXPvGcheS8wRTSWz0xTEQO8CnR+v6PgDBDNLxh7LWtw==
X-Received: by 2002:a17:906:d542:b0:bae:c57e:d192 with SMTP id a640c23a62f3a-bcc14d99e30mr657180366b.41.1778572801449;
        Tue, 12 May 2026 01:00:01 -0700 (PDT)
Received: from [192.168.1.31] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d455sm4768266a12.21.2026.05.12.00.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:00:00 -0700 (PDT)
Message-ID: <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
Date: Tue, 12 May 2026 09:59:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/19/26 1:47 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
>> Xiaomi 12 Lite 5G is a handset released in 2022
>>
>> This commit has the following features working:
>> - Display (with simple fb)
>> - Touchscreen
>> - UFS
>> - Power and volume buttons
>> - Pinctrl
>> - RPM Regulators
>> - Remoteprocs - wifi, bluetooth
>> - USB (Device Mode)
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
>>   2 files changed, 908 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>>
>> +
>> +&ipa {
>> +	qcom,gsi-loader = "self";
>> +	memory-region = <&ipa_fw_mem>;
> 
> Could you please move these properties to SoC dtsi (as a separate
> commit).
> 

Sure will do in v6.

>> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <48 4>, <56 4>;
> 
> Could you please add a comment why they are reserved? I _assume_ that 48
> is NFC SE and 56 is fingerprint reader

I can add a comment like this (or you can suggest different wording):

/*
  * 48-51: presumably NFC SE
  * 56-59: presumably fingerprint reader
  */

If that works, I will add in v6.

Thanks for the review,

Best regards,
Stanislav
