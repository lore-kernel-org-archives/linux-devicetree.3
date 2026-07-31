Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39B3D954C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504160; cv=none; b=sLFlj+KUxvYMDk2z9ZtR/lGY4zm0WaBGWxPU6WrY0ViuzQX3CrTjF/Uy15iP+PlVAW6BlphpzbzGf2DnyUgESZKUEUhZ/b8CbI+JBHSDdj9LO1JokBr478165LoEYxR4N7Z8p30+xqW7dDy5gVeoMm8MivMF/jl4wZ0Vs9hKV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504160; c=relaxed/simple;
	bh=uuo89+sAtKtyJaPS4V9rNIjPQmeUr9B7tn/iPGDAsbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BybXjX1FDXyS3WZmYEguPaQ9TD4PI5M1sg290ZUI0BXTSOhadEhxF0NRULbl5BJz3gtqOI3TLUaEqmc0FZ4/nvoytxg+RQP6QYUEp3MH6LML0aRui6OwJO6trc/HND7ka6RvTv88iIT2JSLTiIBoILsQZj7Eyestqfi3ZB/Vfo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYF4gbzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVMjiSKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYF4gbzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVMjiSKF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCBs3L3776893
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=; b=AYF4gbzAlx2+5pWP
	UCsAFA9KAm9t1IY/bhHWSy0pT0/7pqVfjP/h/VN2f5SEhaeebEeWqnsmiUtqS0Xk
	llekquycx4Zalnc2uTsNorHi+T1+Y87HYc5a/T4gHNePogc56F2ZJ5kdsQ2SXSw3
	2T2TZ74706nU8VOh+f97wuGPiiPWgndMLlarDYH/FyNn8Gn0ccujkF3AeD8F08wd
	vxerm1UDTMeLa/v0nA0X6OulBlJinHr+kubgPc9uOaIg/9RY3VmtQ2sOhMPnwZGG
	HqCDT75yycY4dbVJDJns5o7mesOWd6sQeCE9obPPlm25QvvxNIElRnHTmNztmO9I
	UXq0SA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh08yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:22:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso18114295ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785504157; x=1786108957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=;
        b=MVMjiSKFzWt5zZsNc7PPWTuwWrsE5alsvRGEdNIzfXxNz32pNsK5vmIaqlFjmLIaps
         XcKJYzEVabxjCK0XpdN0b2RWpCkDWkr65qgErjmcQAZg4AkYZfCr8Zz+frSrvlAsaokQ
         PEOWO0WriNaxPip0k5FdvA9fvKtunhM02wRrHeGC3l4MHdImcbP8/LKsKhatJG7zLl98
         CEXoUqe0H6XuIwHzZbpNwSDQAp/QgOIWvj5RU7M/PleJepJ480SK5UgZkIUIwdulu/6x
         5W4ung6/R3Tz1PEYy7EKprn58iLUzOmOpT5iSBIIknYMQ/wf+ZbnsS8SRhw9NJZ1WiEl
         xcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504157; x=1786108957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+9qjsOSKXBQy8fGWCIsCrOpr3B6XcgBZrg078GxUsY=;
        b=phS3Vti+cSWYi39vJpDg3HovjgE2LY1jYJN7IUJ2XZPF8dzx1cqAq0a3JuaNyJE9TF
         2vitq/38VIEjD+PBAH1c5Hq3oo2617s3xi3P/7OrDc5eufFIpvJ6l8PLZ19RjwfUpjcs
         Ubc/yFDxjA7g7M+5AAR3puv7pUdzbx5BMesk26EMZOVEiHGGLC6wio1cMGBkeYVylKLo
         9AOJgjNvdnJgyFG4aXLt4cJwq88sxw/F6TEXEQ/8dlMHC4LSJ0EB7j1IYTA10US+bQWs
         e51yv4zoEXGD+Tz2B7pycX3xjVw/cW+UxomFpam5rdifyvgNoOVimIaDFBQxuyfzkbou
         /Y4w==
X-Forwarded-Encrypted: i=1; AHgh+RrjsjHRBbJliwSCWlNlLM2XwGsJaGciPycVitYI2HR6LUKolpo0KE/Dag9HE0D1TqhvJX2cERsd2/hr@vger.kernel.org
X-Gm-Message-State: AOJu0YybYBAGYk0aBu9h4pUscpUEutFXYbUTos4bh3uaqLZlK6gZCDqU
	648fJ8DF4OXp4NlBP1DY25ZEBrIggrmRbq8ehu/KvK6cCss+8/rmF1+vyWbCvcg/zlZYADqZuc5
	BchxRmUYHQHhR3mPCqYwMF0bYtG+E38THx/Is3bX0ZUhM7EhB4EmJUO75Acw7jhaA
X-Gm-Gg: AR+sD13+rRZfP5ITuniwjScfBW/BOg1nEQsZrbZobLc0U1SG27tL5PROsHAA3lH0qhw
	VbLFAaQsArkGDQOUrNqHtItlUKvHw7khiduEzwwkb0eUKf9kHWlZNUSxpKeZ988g3tpp/zB3khv
	QhpAux0bT4awEY5GU/Y7eocgqwgTZedF4jmn6GCjPRQ4alvz7rgALdAWSLAsCYhHfvozTuZNK2W
	ezOtihjlghnGONslx0qMUdH44Xq7b4uJ+t9SwEcuxjEz8SJUfWDlFe7FRDckpUTyDNlylc42Gyc
	ufeaUqRXfMwfG5rLsYJaFoqv4+RXs/CZrJ0bVIiwlkvavNLun0/l9WLgDmUpehwD2kZh4Pf+1SZ
	jtTe2Y8ysJQwY+Qqvkg7naSv9ISuiYPY=
X-Received: by 2002:a17:902:e84d:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2d0521e9e05mr385425ad.15.1785504156920;
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
X-Received: by 2002:a17:902:e84d:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2d0521e9e05mr384975ad.15.1785504156518;
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19ecfsm5401795ad.10.2026.07.31.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:22:36 -0700 (PDT)
Message-ID: <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:52:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
 <amyFARId5K-Izco1@linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <amyFARId5K-Izco1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMSBTYWx0ZWRfXww/lhWf6LMaS
 nJNtLfCoKctQzjmsSkotgCERo1YPA3cyf9cVIBjD6Ret/ZbkXbGzin5SsslhhrBoJ82+MACQ8v7
 caU0Nj7kyqBGD8fn0BtqNKqGwARqDWNy2t1q6ol1qhyIDhikuMCuzrvy7T2NypJI/9F38b0Tdg2
 ZGjfD0sS0ZvEdDgaoykcWe1r5EB92LqN2+qGCYOgh3gCntCHGZ/4gSye2mAAE8pXbsULZiO+Nd6
 dgnT4p6uCDjejEAskGhHluIl3SF/lQg/VBXyQJ+h9gzTxA7Izoc1QGWyUyj0Svi4c5l02SbgaB4
 81jKQMR8MNsG7i+zwD719OoAvnoEgjzpwW2N0OnsKFBPo0YDI8VhNQk0IQLV0mySay0bMSigpkC
 fYhvQfC8hmHQRonP6DoLfKNaUpipbb+pNjPvdYGYGLkkzWLZMn3LlgtD7adi1FTZSnImT4w9LZj
 nlfDXy8IcVsxT7u+y6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMSBTYWx0ZWRfXwGsWK3Ifh05j
 Q1D0bTT5jwN0p7LMw+9LDfY8NdG8OgArFajC74BjPY0PCOQlQUed1wAWaagglOPvGyqFDlHrmBB
 f4GIEM13VbEnQv/3uH/CcmxEUMLMmck=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6ca19d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mOqVw97Yt21F7phKvS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TvSaLfdGJ83hmFlwSC2Mxeniu_jcDtAo
X-Proofpoint-GUID: TvSaLfdGJ83hmFlwSC2Mxeniu_jcDtAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310101



On 7/31/2026 4:50 PM, Stephan Gerhold wrote:
> On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in hamoa.
>>
>> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
> 
> Would be good to mention why you are treating hamoa-iot-evk differently.

thanks for review, will add the reasoning.

> 
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index 9fa86bb6438e..a146be1cb5fb 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>   			};
>>   		};
>>   	};
>> +
>> +	nsp0-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp1-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp2-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	nsp3-thermal {
>> +		trips {
>> +			trip-point1 {
>> +				temperature = <105000>;
>> +			};
>> +		};
>> +	};
>>   };
> 
> Please avoid overriding node values like this... One quick rename of one
> of the involved nodes and this will be silently broken without compile
> error. Nowadays dtbs_check will *probably* catch these, but if you
> override values using the label reference you would notice it
> immediately when compiling.
> 
> All those nodes already have a label you can use:
> 
> &nsp0_alert0 {
> 	temperature = <105000>;
> };
> 
> &nsp1_alert0 {
> 	temperature = <105000>;
> };
> 
> If the same pattern is already used for other thermal overrides in
> hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.

thanks for review, will update this.

> 
> Thanks,
> Stephan

