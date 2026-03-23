Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DA3859C4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256572; cv=none; b=RmbEDDNUfsUVV3QmrPh5Bg6+QH/N3+S7d6wWc1bPKkXWjr9p6timytSZII6K00hy61aVSJqTQdLotsvcCj3GHsRfyqYVbHdwnAXojtWOu8ib4/LXMyYGHP3gTCyPUqpNIzQiA4HN5UAu6bR0tnNpvodiOrLS46JxPMW///TUKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256572; c=relaxed/simple;
	bh=1YEYqDf1LB1KMCb1UKjOEBsNJ1K2jABt3RfVRVuTbdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cp5PJ8k7f3eHnoFIFMC5tTC7fu5b9Kty11IzA2FmbrTBroiEwPONwUiHJWIdwXUm02D3HD1k4jdSAPfz6TtcRJFMktFkvMbn9XcQ4Igao3PxS3yqRQPS3t2nacQNscfTurtGpNVD3kjgiArMCqPfk/R5215joXJDwoHTpP0GWi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWeiwXAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAwVVeFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWeiwXAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAwVVeFC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ee523237007
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=; b=cWeiwXACJWm3/cJa
	cH3GVXDtA00MLQLRFu8yw6y1IJb9z+opemAaWOclNihMmm9rU1GVP7gHwrtJYeTj
	u0mbpyPVRU7KO8u/6imZexx4TT8/QE1FrLi/NdfkgKC1XKKeKNqiRtpKwPQZI3qy
	jZKZv/qSosKQ+sfeLquviFj50bQI6M6KBA8yAX+/srhjk3WR7KgiSm5VcSosPilj
	Kif4j8BMoBr7zJyoOMIRrid1w51SDYKzxXjRfuYrryb39kVwJtQ1avLyqjsDlWzu
	Xlti97oZpAs53/Od5fv3e4yS3ZpuZSM4qQKTfY1T7JkqJSwlfCPNdSFkEvPbCThK
	9PmneQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng4m9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:02:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b06b68783dso7336565ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256568; x=1774861368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=;
        b=BAwVVeFCD/VFoupxkljkq5OduRN4wGRl/jGAZiucdaKeywo8EpcbCSOKCNW0hWyWor
         87sT7mw60OXQfCxyGVa17u+0NJsxtg1tQBKdbfAQJ66Pz2pAaSCZ4oVsPwLU/BTfLy0c
         O+rneckiDzOaPzYC+y+tJqQCZTkLbbapOmnOpPHoAKg0ykNKh8gCXusX7H+VYbLl5y3O
         9M3Ye+EW1mR70PCcLF5O2GbL7LBwwVkV1IQjlg6tLc3WqatgDxhMTeibhgRWk+Rp7t3d
         6dH2mEMRG0oCQpl+bZM1rASy5lBRlK6WLsUNBuyGL/ILdNrON6Q7AoYMNcF1URkY2yuH
         BwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256568; x=1774861368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAeKaUPxN4hdmfgJf2X5L1nebaVTTWL1hb6JyibW76k=;
        b=dxB1iIOBkrStnBmh9mk9a6trYXLcpI4Lklrj/re9VPb+MqsUZjJDOQDIX4+Z45U95a
         BAkVUdzf4gWTVHsf45mKPiUnjPc74PzVUxO8hPSUzRqhiWnE7LCNuM6nHLziCGm1DLZv
         VaoFVIpdjEP4WGlbnKrig4mY+L3HGbrAYYmjbU4U+ipoOwehLyEqau5S5By7YSSfS25u
         MlSiKldeK5HJCqXp648vUmCz3Lbu2gLgdzgJNmHmULVvjVaDv7cVHnTw95Xe/3k7GcDA
         sLqkvqlzl2bW/86Awe2F4VCpqm3gSEWjHHTqOMIupRFUslGwmbvcG9xdbOeRBWxuXsFS
         /y3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrG/dgmkWZ+hGQIResM/uz6d8r7//3DKM5ix67hic5gtvv33czNT7GIgypv/8NHiZnA4qKVSAVj2vL@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcYEw52DE9q4RsuA+jGR8DCriYZuRPEQ0rqacik7RuKjG39ED
	vwz2uIaUrYvXQLF8H6vmeoznEY/yxNfzQv3Cy38jCPgFSnYNUFjaGW/UHr/ch/Pl0+p3psx/VAJ
	9LDYg3sMXjFwRrpeMv6Xs8wZ0o8G6cDLALfO12HWeoE/UzgiYOQKeuMmJkLxIswXK
X-Gm-Gg: ATEYQzyBoa2O30/DD/Q5TNVuSrpYDQwH7kPDXUC6VH9AqUsiylhVWRObzuiHCXhNQwX
	+EZQx9eteFkcj8JHFU0mFYtEGJ2IY1LifrqDwQiXELQIf4ue0KJN0f0RFvM3tc+K7nrkHilLUZc
	JeN2FL5spMh4nktSKNHhBr1Zlrnu5ZrdEFLLGSwgqP1G2G2xFgGSjpg3FAYojQ08B3kyk43SPe4
	WjJbh9Ky6ksSOIgzPZv4Dso50n/Nz5pOgVShIA4tryuUyNa7koTZrDBXEopci6mzOt6O7LWFZDJ
	eHVvuvhDhiUcq9EVu6hqzpsSWbO+qWeh12l2O2EPXBLOEx05DGjX1EspnC/V/tNwgD8bG4MWCxo
	8xJ3j+KuJTbMIlfeCahowhXlIe3v55SJ8ypCUd0WEwEkdBJOcS1w=
X-Received: by 2002:a17:902:d4d2:b0:2b0:6a3d:36e9 with SMTP id d9443c01a7336-2b0827a93ffmr105389225ad.33.1774256568232;
        Mon, 23 Mar 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:2b0:6a3d:36e9 with SMTP id d9443c01a7336-2b0827a93ffmr105388825ad.33.1774256567730;
        Mon, 23 Mar 2026 02:02:47 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm106071805ad.22.2026.03.23.02.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:02:47 -0700 (PDT)
Message-ID: <b7b19386-510e-4892-84db-09a20bca635f@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:32:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aastha.pandey@oss.qualcomm.com, dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
 <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <c4376a88-a490-4b58-bff3-b0f4d2f731b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -n00vStMvBHBhxJUb_bCoA_C8HZyjndc
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c101b9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RYkhNht3YKPCQp1dbvQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -n00vStMvBHBhxJUb_bCoA_C8HZyjndc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OSBTYWx0ZWRfX+ttgbZ/AWUkS
 PgbNMR/su9b7cF9aoDnRkdSt3J66Fp47KNRI59Yo86ecDtj9vbq9vMhAsA3NmmoLh2L/HBs25gY
 Dl/7B/lIFYBrb+6zJbqrH+oNZrGeRURvHpiw5cAVMSKxEx/xgpHi+MHfao4XLdQnSADEzBw89gk
 oxevJkZS/QXGfBDiUsUGBTjKu5dt0iVKo5FcL/2Fd90ti4vyCLKNxZzK2bNyyis+lIDfdbwsArA
 Nbfh8C8+61X9hFst+4RfKVM71Nbo92EH4XXCaRPIPiMHNWhylT/g+1cPCBipT2evCMwkFQyitC1
 A4ShLh+dbl4ogAnrj5GycAxQsJVuCEPOb8LNCuEVVOcq7TT4nO9a0JFdSvB9Pd3sBcO+duPejr9
 QznVmKcicMSA2ss0corDtFxyMxSE+CLCp332UTqRkbSetl7QsoOfASTahYN12jdnrojqepqka37
 UY57a5QFD78ot7H6G/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230069



On 3/18/2026 3:14 PM, Konrad Dybcio wrote:
> On 3/13/26 11:34 AM, Gaurav Kohli wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> The sm8750 includes four TSENS instances, with a total of 47 thermal
>> sensors distributed across various locations on the SoC.
>>
>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>> Enable all TSENS instances, and define the thermal zones with a hot trip
>> at 120°C and critical trip at 125°C.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu-0-0-0-thermal {
>> +			thermal-sensors = <&tsens0 1>;
>> +
>> +			trips {
>> +				trip-point0 {
>> +					temperature = <120000>;
>> +					hysteresis = <5000>;
>> +					type = "hot";
>> +				};
> 
> Are we going to use these trip points for the CPUs? If not, let's only
> keep the critical ones (again, for CPUs specifically since they get
> externally throttled)

thanks Konrad, for review.
We are not using this trip points for CPUs, For Kaanapali, Dmitry 
suggested to add more warning for CPUs also, if in case some user want 
to use it. So we have added for this soc also.

https://lore.kernel.org/all/vjx3bd75zdgdh6hzhrmlv5tlarnf6ea3yklwhg7jx6momknase@kstxwngyicd3/

> 
> Konrad

