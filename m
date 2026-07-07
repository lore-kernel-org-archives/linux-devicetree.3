Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAC4189AC
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430666; cv=none; b=fqifEepebiIjrAGmHyXvOV4GRK5U4zkdXqehNK6sBI9tKKIOdVg+RGcNiZTxf89jgT1LyE3tWnkT7drQby0EmPUiOoyVmhi5gPT2yUxwF701YF+9jzcWfwdy/W5+71MGoHmXUVS1RfIYMv/wyXL4ziPsiqo8L5r9ehJk/I1YeIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430666; c=relaxed/simple;
	bh=ja7GS54UR5AwuTz/Eekhp/5WWgMhkE+m92m9IozVLR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oj5b8qLQ8t56eLSDLkTmwQL/OdU8SYDmp0sTCR/Ycfme4BWFSqmCM2IjHKkHRnXkHNc8FIaayXW/pG9SoFNLMNkjSZw/wjPy1s5TU84WDybvPN6xCsKSuGqwT4/94N/RweCQE+Yu7mbAlPxTMiHSOmD8wISW6GkQifjRxgMTKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhGUOvxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Itp0J1qr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhGUOvxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Itp0J1qr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8qfI3768479
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=; b=KhGUOvxMrdzKWiD3
	ygV71kejrqfc6Y8MhpnI9PP4xZLkTuNFtG8EH8mkXAHPUXt/GuUd4ddgsarGRN+z
	201nTmuX4x3rmEQx/C3xRapGigQP/eFGAOnHIYOpJ8aTE6q9Y3b0BAgzj4Oag2Ml
	GG5YjjTVaF5Wm/8ILU8aKNkpvrM66U7X8aNqqr1etrhphr9JuEHVAbXNS8F/QXfe
	ntnBCp9czBaqLkk/I10XV4tr/9xvNMZ7YaN8MZ4RyMY3RFgJR8OzCvbN1rjrd+4T
	UB2eewueVSBmbDmEKhAuy4Ca0BuGRgWfLImugLMqWKX9NA3I72dTAXSqt4wl8jeD
	kogcdQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7ame6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:24:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so7895566d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430663; x=1784035463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=;
        b=Itp0J1qrkN5J1QtXJV6t/AYrCNVPRCgAVt2Wtsjg+Jd1TvPAOT/HHkVrgwRPiWsXYz
         CO16l4f8a/k0VnwyLLcUwSq+LLomt91pZrH9w76Mhiv3Od5PKKk2oCN0PthlMsLgE+Be
         EACj4eY+tIRR2z5qAZolsv31lcnOYyv/ut8dLm4I0/SZZJXKEGsE0FmTRe2pJPY69EaA
         EhTL2J+EBbgvc4IZ/Ox2hM4L4eNCyJadA+2sOHdnZzWyICMyiRn90TpJkYNfVQOqt9DL
         Klt+dhMBvnWQthzvuVn2i4AoU0s1o2dxgJ9AyULN5k9gU+meJ4rBXCDJZOAZ6S+cK+K2
         YBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430663; x=1784035463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=;
        b=I6T8ORZkkq3AxdkiiEDCzNNPqHqNQ6DanXPy8/o1PYAsLX6jsEfApnnv0PMHmUAjmf
         cNKgwI17IpPU3Uiilan92tgmVPsuZygoYPS7fWg1GHp19CFl8iHFrmoLp2YfLk6RVHUN
         /t+mzrbXa4LG478a5Z2ZH4jKrZhYrij4M1sXqBM7/JTXKbfqoM8vzpCPRIZuuO5Ik6VM
         iSO2DGw+8qM9WJ2rGJofV11rHR4R6xX5C8/9LeLvoNK7AAdqqAS7WLJPmQaZpVla0YZE
         W5L7Dat6l5yZghRcNACzhKO2esJ4HPWsV9tZYoKkiOUQojoh6eOanPgalcdQiKDA3xsv
         yDHw==
X-Forwarded-Encrypted: i=1; AHgh+RqXEPIJIZgsa1/0R5L5SWGy4u6wJ9XFB9NXcBgYCK5dTr66Vw8+ncMJZ7G4qYW2A5AKTHuhoJtLEVxD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//cOGeGyliE49uDY81RxBLASFtASmYK4zdbxv/DM+jlWGSKnB
	zSiyDyvQ7u1sowEnCXP2InkF7/U4n8CAXY5ZBXoH0Zsx/ouZIQjTNklzJzxT3xSxdx0cLrq29j5
	SvX0alfcUaGHUA9zpH8FckXqIRgvICIMLtuMYr9H+iQ/WuKSLuHdxKlbbFSR1VsFK
X-Gm-Gg: AfdE7cnXy9ep28Cx9djLZXlAeXRoEvsKpXJPXKDP4QF6TrgoSKknD/YhG9bTbbn4dS/
	lbOolk0TUJzfIACVmaI5xxdj3kdLHTnYlYSModJgBQELcEcWruQL7Qs//thUVe4JTymXUE8fWcd
	8jnsCnJ3ftZOFwLsCF+mpjJbSc7y7J13Ngn9S7cSd2qeyDBLMNwx473Cb+TqnJfNmyZ7qEnTQuj
	v5PGkeR0dXpZ4sB+GMw2eodikY135XtgpdD+LpgdJPEavO2ftyqTpS+gLUqgS3br5XCIVJyXR6h
	T9rTw+ynLS0+c7w8LuX85uKM65R/9V2X/rIbUa53yPihcL0uAx5W933wVUClLht00U3W+RJca6Q
	5uCHr4mHHQ2+fhwXTE1p2w/n6Ti9ph/CwO82BlzTfFlEAL3uelyjeTgSPOvWyCQaDe7nvFbsbUh
	TdYBQoIw4=
X-Received: by 2002:a05:622a:650:b0:51a:68df:a644 with SMTP id d75a77b69052e-51c7a46e933mr26366371cf.3.1783430663211;
        Tue, 07 Jul 2026 06:24:23 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:51a:68df:a644 with SMTP id d75a77b69052e-51c7a46e933mr26365811cf.3.1783430662673;
        Tue, 07 Jul 2026 06:24:22 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daa799sm5687429a12.23.2026.07.07.06.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:24:21 -0700 (PDT)
Message-ID: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:24:19 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P1mCW9gqUTuenCFnOGopZ5ccre5a6kx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX475Z6gd5BeB0
 0VUTFz0LC+Q/VObJ+jot+U729hE78hubWFiMgi+xA5xTxgzd3QOmkJl62zPJe9ugNEP5n9U7edQ
 QBfBGpKhze+veVk+NawjhdRwmHGiftIvk5WTOCLUIBcvkYoaUJPYxUXOQTUTl7HCHbTwAOdzCBC
 99Gq0Qdp5NX/XrfwW/YHuseXdWi7NJQA/opcL0w4KUYfJi9k5F1sRFKP1Zdp8KdV1RttY7fFM8v
 rRforcLwZXKGiDJK66sMustC7dL0MH0PWV8DXLBRm4S1J77ehMQRLhdmNPOtHiA8v5aeBMCCEQf
 KgQtSVv/jmlBBIZ2JOY1gZShG7mp9xAwZhQEoEIRl3ttvBExhbDJQ0F8sNm7kc3eLVja7dxX78f
 5XuMZPU/njBfNcWk66baghNJK1i4BE/2zJ4qpd8xgilCIK1JySvcw3NBM1LXzC5rkRRpO2PBLum
 /o1CulcCSUCSYX31huQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cfe07 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RukG3nK3fvgRKkzuuZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfXwu79IVR/25fC
 k1Z9xeGYvzpyB6sVEyRAaRVd85guydz470taNO2mOlXVvSdPdaSax0w0ZRql2puQ2L6ZGr22vcr
 TkzlKbOQv8AIsLiWC7xRpizbzWBV3kk=
X-Proofpoint-GUID: P1mCW9gqUTuenCFnOGopZ5ccre5a6kx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131

Hi Vlad,

On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
<snip>
>>
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI_CH0 
>> QCOM_ICC_TAG_ALWAYS>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI_CH0 
>> QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "cpu-cfg",
>> +                                 "hf-mnoc",
>> +                                 "sf-mnoc";
>
> This is the topic, which may raise a disagreement, but I'll repeat my
> position about the need to remove all "CAMSS bus" specific resources from
> the device node, they are found and should be allocated on parent's side.

The interconnect has functionality to handle bw requests from different 
clients.

Yes the best will be to have camss interconnect, so jpeg and other hw's 
to vote

on that (actually it is possible in icc framework) but what is the 
benefit of moving

those to camss? Is it not better to create camss icc. I understand

you want them to be on parent side. But how to vote on bw? Most of the 
time it

depends on the jpeg encoder configuration based on resolution format 
etc. to set properly average bw.

So i dont see how that can be done with not explicit dependency on jpeg 
with camss and some exported

API's which we discussed with Bryan they are preferable.

Maybe i do not understand properly the proposal but can you just add 
some pseudo code

how you see the things?

Regards,

~Gjorgji

