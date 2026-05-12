Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465048B360
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573019; cv=none; b=S97U8/fCdfO9Z6Ew1CfWkCglif2qKDcHGRqvgrE0AwOnQmLrwwpJTYMSmMS1p4r0bUa9JfiR71m1UXhjm+MbF/o7GXcm8dyQ78TKnVagSRGrxGwLwQBy13EEx8QjRoChNeSy3UDLsBo6Cd815Bk+GnuNvMopPAhdeXzeLadU9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573019; c=relaxed/simple;
	bh=B49OARLB+JlsuiyiETK1O/s14mcjYAfXYTSjrpllbVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8OeFna7HZD+Fu/wDqK5sIUfHzrmR/WLcJU8FnYWkIwUAxGmyvH9cnyxpHSq6n1hvBTx8CnZtXb8GS2pzkyiFHlpKbAxLHQG5LMHX7M9XX+RfmkGK8WzXPVHQEpL8PAZUi+MTPAXDvWK0H2v2djRqPGS+Qr20oEqzvj+KOC3yJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZWixS0C; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZWixS0C"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47c6f914617so2660142b6e.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778573015; x=1779177815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCt0KRjnxqzTDs+DhOS1UL4hmaB0RG4z+osI8Bk9y84=;
        b=bZWixS0CmQDuhv/be/dk1rsaL9z5QZGkHfdoI39bWG00Xrxo2kmOhgT37EQM5CjcNx
         ZIG6ybKtALI72r2Vzfj6FgNoHcSlYNBQQg5P3YEgFSPo4m1uCUbn/LEZEQYPstEnE8vT
         lPos1GBgMXosKd1KO9jo1MqjJ/6QSptbfgii1A+giHpEzM27ohFoAv98AGIySoV87Bzs
         ETEq0zDSv3OKjYiuFLG6YOucW9aXAAuwMmnZqO5tVY2G+giGvbJT2vCQNOEU0lhEsSY+
         xGPwe5RUdZZ+H6fsRWPlKxPLhub7z1BSJ5277lqOhsZQjMv0nB93gVvG2sxDCUyl9rHN
         bvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573015; x=1779177815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCt0KRjnxqzTDs+DhOS1UL4hmaB0RG4z+osI8Bk9y84=;
        b=Y7llDff4WFXZTfAwIqPNFz9ylAD513TTFQaeHD5kt5UbivxPZtExH2Ujm6L6RWPRLv
         yikyb6SuPMbRW0qhdu9bvF+vHT7K9XSuEMTv4RMGy14lb7Jeyt9tdvoUGgWYpU0CL3OA
         Llx7/kl2DsVDaaz4D3MzLUMUiXqRyHfwcoqdKYgqV8ZAxcFinqSoL5MbBtMk8LImhfj8
         SLaARbXTrgymPLxEAF2uPConMkBjR1kpJ+FpTa5yeJkDPXGuh8B0Veu80bn3IFXAde5V
         AbmPpxopb5s9GRGLpuE7O2vzhvlZcgcQvCpwnCmZP51v4ui3XkLIVZxR1gnLymPVDujX
         FUbA==
X-Forwarded-Encrypted: i=1; AFNElJ/c88g87jxksn/WsVWCKhXU7r2sLlor2SgVDIQ9X7iVIRDagJ9M+nGzN+ruZSvYHcyYsk/o4azckNEH@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOoksAPRv5VBXQPho2LnacoHOsHy8ac9uKpooaEZGrSccEAWb
	G2LcX9A1KUPTUJQciD9r7VCrgcV/wX1yY7WEBu00qzZb9dKwQQa3Kcl3
X-Gm-Gg: Acq92OHvUUvoejdJfWLdf5LatZcIPuDjjfq2Iw+teokDCWATCHEwgsLXUMmoBmTwMZ8
	+X2nHQ332dFpaNakfqI02/PYWKGtldIXfm2fLhlQB3+7NWXvV3lH29T/c3S2Np0QKLREsI0kSI2
	QefEmc+/+wMSQRkGVh9HfrKtb81VGXw/4j9Cd5+CAAgJUZFbCUoaZvB/NPVRXmztMkrKaKThovU
	girYuUEHRUMDOO2Ss5TNz3cAAxenXgjBnY9h0L00Az9Hd4xVtKhg/KQCysz9WB5FW6s4XXyZAUz
	EoVNwoBUyRMQiAKp4++95uF8mwjF/NruNzif+oAmiRW6ExTe+GyI3TLkadOATsjOnyW4C1GpYLm
	xdtFZZUzv11Uj3E90PQoaCEAd7ob9aQ/dT3YqjoqpUeats07aZOD9FPljnrwJR62QIeCHbK/cZo
	S92zcRY3eXqZELmAg/w9S3h/4HtnMqNQxYbM97lxLMxVmEdAjgM9fMVtCoNg==
X-Received: by 2002:a05:6808:17a8:b0:479:ed26:fbca with SMTP id 5614622812f47-4824aaa3408mr7195696b6e.37.1778573014959;
        Tue, 12 May 2026 01:03:34 -0700 (PDT)
Received: from [192.168.1.31] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986404sm21762203b6e.15.2026.05.12.01.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:03:34 -0700 (PDT)
Message-ID: <a86d32be-1c02-46a7-9b29-a53d680b9e4c@gmail.com>
Date: Tue, 12 May 2026 10:03:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/26 1:47 PM, Konrad Dybcio wrote:
> On 4/17/26 10:47 AM, Stanislav Zaikin wrote:
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
> 
> [...]
> 
>> +	hst_bt_en: hst-bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
> 
> You shouldn't need this property, since the driver will control the
> pin

Thanks, will fix in v6.

Best regards,
Stanislav
