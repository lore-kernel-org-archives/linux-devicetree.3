Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78A3A6409
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353320; cv=none; b=VjxwFyhqfESM3fUq33jRvBng4Ca1ExafrG8BCowM630M1plNez24oR15FoFWytSmKKZ1jrVVMXGyU4xoLke9ShYBkR1m2ZX+iCkdMi52+JUR5mGadhh3u5sBGigIxH/VAtH6xr0PJDEZGoBtQKt9Ro5eGsNW1qhwOn/8YENLvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353320; c=relaxed/simple;
	bh=57ptv98eHT5HWsuAJvje9omWUtBApDIfl+FgKZ+ptQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AleuWHFPa+p4h8qH4CboaHBMHfllM6tbS7Luk2+IsIv2InHrA7S8GA2VJyNljkzeTg9UcFQqbeXSSULg73XGJ8w0I16sKDvdHS/1FaOsG5wBZZZF7mDg1vGfGbNFPKFlmmKo0+GLltHOhQoyVUjrHfnfscAaO7LMThktSyMUTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSvSrWoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AApbvyOE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSvSrWoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AApbvyOE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8Dj6l748397
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=; b=YSvSrWoYRS8d2pDa
	zeYLe7C2ZycakQs0S4vZ842NP5K15wj5uvyeK91nQCDZ69KKlM8R7T4fc/S9jagw
	dw3VxxPt7Coq2v/m18HeCyWKI549nm3Aq34G3KnxLuPLNAWeQAhf9lKrES3RhamF
	Rk1RNBTdq4Jp3BnTv2CeCcy33P3gcg9sHdW7LgSH9U+6nWAEQat3AWY7T1UWoIqk
	6AakZZDIoaPANRbY5ODRzb5wcwYLprRSzomYJCS0jRZ3Utm+FMjmC+cJ73Z+TjJ8
	wp6JqswWPVVqZw5RDGR+0TvJ7nKQpTNCY5JDf7GQoambvkPqjwBBiin5Beaj5lGq
	RRnuGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kkwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:48:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso18421371cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353317; x=1779958117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=;
        b=AApbvyOE/ePO2rhP+eLhetaC4M9V8paH75zI7EA/vN2OSUbnBmeUBF7U3UQ5lQCGKo
         BkSsaKSmDJqu6Qtqq1YOc/99eBbef1ancP+GrLXV2qLeEGD56Nd5Z2OF16JPpmLd2wpJ
         jEoo/gt/wsco9wfot8d4qMdkHsIgunX2o1YE6jGsVLXBhnaPMCzXwxcplN8e7Bfp0S7I
         O+Z91G/YMrREFntna3Zt+7NVggERkSVP8+DrJjKKLToYciA2CCGLyCsTFFc5QJXnf/ju
         0x1vhImpCVtq/us+Aigx8ikXhyYk59zO7fkKOjf8oYJhPsbSn2DuQcX25mjH8D0mKojL
         TQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353317; x=1779958117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPSwqpTo03Bkl0v3i4c9hpTGEzAjY7Tg79AzsZEcbAE=;
        b=hnRJ7XuDt9OZxBO//Z7icnS5JUfY9Ibx7vqEYB/8yRgV4kn8ker+G8yIZi1z09xG11
         xbqlxKqPj9eqjIcaVJ+yEr32/agLmeT4M+wVBtaiaklxJ3wyj5wQfbaZpWFqiebfKfdO
         cEiC4KjeHRrSxcA10cukDMcGd+3P1OaYmtY/0LbQBBLEPfjHWv96OtSYHi6w/e//Vsxx
         t19HS9gH1ZPlXdfNm8QFiRLopFRXFgcIWHzaWUUkNXaWK8i92F6glEAWDwIDi8u3Pxju
         bB49qDO7OMCtULMeGBS+uNaDiFGmff60izCP29i2QXvXqp7UPiOrrJD94l72ngrbN8D7
         +WVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8d2ZhZCJfLgBFVH/7c6WmmhIBmTMivmOUgMu6Sgkcd4Ais4SEXZizcOxPSr7iXedwo1PzONHXoueu4@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCEOB6YPRCFKG3fvy7bYAFtGcsBD0589fJz6wxVEH85X9XESj
	l5/svINfGx3rsrcQxaGwSuQUdyoLv5BhU9w8M0txQzgG25QSCPB/az4UdN8Xhd6uHhM3/VeUg5I
	T4AoULd5QUKtVP0f5xR9f5+mzRDPSO/AQccr+RYXMt80oDUzmzBOL0m/6N7a9L2Pn
X-Gm-Gg: Acq92OGupdazCDKQ2oEBimRQ0UAEztjQwtrHM6wxF5q9ZtgW/l4lcuuoEFLJ9s2/tX7
	BXBKjE4SfGgALXSCqEsmJDgnsSXgzIYBbQfFv4Ltpo69tri3XMZu5ILNPBgKDy+e3jE793OsjnW
	2MoIKNxikcSkea3BCQWHBL6dm3fXsXDDtKybQ4Ynj6z3p+a7vjKzb7rPPfK/8OPpgR7dK+8pNQ9
	B79mdA19tLxjg95VfjKk1sXjNn8L+w7bR55EjLMYePn3/E02A8pCRvyvj2JmrONFOss5KGJvtxq
	/xk3k4kTwIyuFgjZVUDGsDttjO8p0PftVE2NHRxRu88hzJ5UjVwsQ1lReS8dPT3yFz0EPdZQFg4
	DzntPMtcQ7PL81i0vT96V0UXtZojoWOpAGoU8bjPqyWPacXbFwvRYq/PiEY5kDuQDfkSSrgtwu5
	YJy/Gh1SBD3iykwQ==
X-Received: by 2002:ac8:5812:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-516c54382cbmr18835321cf.2.1779353317528;
        Thu, 21 May 2026 01:48:37 -0700 (PDT)
X-Received: by 2002:ac8:5812:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-516c54382cbmr18835131cf.2.1779353316998;
        Thu, 21 May 2026 01:48:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890ab5sm17545766b.4.2026.05.21.01.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:48:35 -0700 (PDT)
Message-ID: <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:48:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec6e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=-MGe_S8tJvSwwJYLNm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zz-zGKEYfX5hJ2pd5p81ajmlRRbXLa-U
X-Proofpoint-GUID: zz-zGKEYfX5hJ2pd5p81ajmlRRbXLa-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX1DP5ZNNzJL/x
 D7IFzyil/DKR2lgY8fNQMv+JGYRwKGiM8KCWdAwc0DtnNHuiid+cdXQx3v+a2eJfQFoM2+NrWFG
 faHw9pXIklfRwbYVNbxw8cUqzZbaGiK/ygB03UqpOX6geqQNEd7X3T1vW5g+BwI+7l78hoh/Z4B
 RFJUZLy/6sQ5PQxRZcIpB89jcY0tNqKYE00onnPomQ2GmCPtjaj8SDwS4654BjE5yZxPeU+W71L
 DwAnDXqZqTmpGANZEyPqTNqY66lgG54yNr8pY0A+lyjDyd8Tk/BHX5fc9qUyb7Fngarb3Nr4sNG
 46nr4cRnjFFHeyLdoY0mkz6nmFEJ/CJtU9VL/xrnx9d+NO26J9FCNrWlBolMTuqpcrZHEb8X/Ku
 OUzqpNGzTGJIQya6XAwYQcp+1gQMwCpgCnB7XftUm4nfrO9/Fm/FzYIBlEKSONBQ6LhIWPBKhv+
 jELipI+UthZPEbgovUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/21/26 12:26 AM, Jérôme de Bretagne wrote:
> On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Add backlight nodes and enable backlight so that it can be controlled
>> with the corresponding buttons found on Surface Pro Type Cover keyboards.
>>
>> The nodes are almost identical to the ones from the ThinkPad X13s with
>> a different enable GPIO for the vreg_edp_bl node.
>>
>> The difference was found by looking at the output of /sys/kernel/debug/gpio
>> on the ThinkPad X13s to see the properties of its enable gpio9:

[...]

> and ... backlight still works! It can also be enabled/disabled with:
>    /sys/class/backlight/backlight/bl_power
> as expected.
> 
> I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can enable and disable the backlight. Is it a common scenario?

Could it be that one of them is an ENABLE_BL pin, while the other one
enables the regulator?

Konrad
