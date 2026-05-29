Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DA334C0D
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049849; cv=none; b=fpYAV6RIfQu48T+XNnMP7NBePUIqfxSQoSmIYeRxMszxUrHthFvEfl5Rc9M9JhgujWVVDBBgXqoXDPoqrRdgwsRIGCW/h3ocUmFaolO/ZG0vzfY4zprTEQrE8dOIW9gQRTVf65ZUHIbL2hLpHNX2kfs9F04mHTDWAnP0TDGjhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049849; c=relaxed/simple;
	bh=wsTTRuHUZyUK2eHffcCelXOtF0Eanqo2UbgT/sM+3MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qa2/zp06r5MRhTgPpcKTO+Dlcy4r/Q1z9RJO5NVIEMx3anG4dpGdnF2lBm0pAL2UOrrj2xbezc9Sl0Zah6T4ogcs0r8MPAeopiEHqAOU61zHnBXddMqiBrrXMGv3R5CYvhdtdF7gvpnSwQwNUABAyA1wTGZuudUCPupQB5sTVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIqgbXkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaOoDM4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIqgbXkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaOoDM4c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6LMYJ562448
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=; b=BIqgbXkg22cpNPPU
	1pY0M8VNRN7Oh/5UUY+KY4rDi0rHJ5zM3AhUWS0ilyFhJVAKwzFCwikg54MO0lA1
	ZZwErYVBCuXb2AVwZx8i4j9Ff8B7Li56H4/0kVW0y5y9o6Ei+MBSzhQryga4CZba
	mqi80RoAbOYQLgOnyVtnU4xSFf6NZBZDbcblS2PjDw0yprxYs9JaSa+TNFA9RWCe
	0b5BhqB4JJhVQPRo3EMgUZnSUfeb0/gUUHFeFqtcwxVFGjjQ4dcPTA0X1DvS6OX9
	tJ2x4ztc7kyLEvWtTtJSMkMw/gTtlKloitSvx2D4Vvr1hjPFnYkzE3lHT0wmwvB0
	Fb8lrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3179-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:17:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-841f09a96ecso1320692b3a.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780049845; x=1780654645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=;
        b=EaOoDM4cIm/Nwax77CEjPXaXRTNolksC2fmv1EZefd0mmUGBoWEq4+X3nCfqfgpjvH
         KWgL3hklRSOX80C5an1AA1FtuC1u9hQ1IG7tNDtHCRBLUuG4x7P65a004gLCaJLdthGA
         Zh/OfT6CZ0RSz2yuIQbpEhRidcWnijwb9KQoXZ1v1r944P+/ybMWxvNOHrX7sJjWctVb
         dg4RnZIN525RykBzwj9xSiz4Rut7w037m4V/s3skOGeVoyQe/dK0O/i8mNZJbE5vUia3
         6wNXp7JqyGpa+Z3D7+R05VMAOb3WZwwbMj9RC2R7Fpib2s+2Xidd2Vq7FNovTxKkwkxS
         VP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049845; x=1780654645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=;
        b=JyKYEfOLu9MR5JM/Eoh4lzKHFXXP8UCiSngR+0sHJkIbTuPoDIRpR4euhEZqsZ2hVC
         Mk8mL0PjJElqpacA+WLM10qzMO13zoMCMVhxmIg5srhCS36LaaUF6JtrQIDj7xV1uOj+
         rVDzTEP4yK7Kx+CUA4Bs6jTB0pd54QOVtidohdETedfr9HlvImx4tPwpvxQcVLOsYuOo
         o2YQ4yNkpP5qaAUfm+IT31OYbIsJO+eULzlJYou/iPZwX5xJAiQtYjbhAdR+h1APkzeZ
         W+ymuZ4mE5tA9s+VaAU7O89f8mLxxYBTkCkYycyicn/qVbAa1VnTjZNDGE86igcWxdtZ
         e82Q==
X-Forwarded-Encrypted: i=1; AFNElJ8x92IDzAQJWcqfuE2j/IfpakGN96CtD4ZC8dv6X46rlyjE2JrTaE29JN1iqE4RKG8hw0cydFv6o5sL@vger.kernel.org
X-Gm-Message-State: AOJu0Yza57sU9tIgDXZCKvwIUCOiVD0s0lAm2I0J0n2lC7BlxoIAiMII
	tSwx1VIGctbfHbhR2VPZXEaDMivSrojzU5ExGZDK1vi2igBfeKXLPCzDdTgf6aTjHpadlZsfpii
	Hr3rJsHqoMwn/ITmCbnbHUdrJB7f0Dnz7WpanPQ+OgIoRruv0MIhBVCca7bumxbD5
X-Gm-Gg: Acq92OEGDlJgVC7LILVKRzhR5Hs51PonANPgAbHOEXbUrxE4MED1lYMEv9cyfFcpxa1
	J3wCZIdf2l056moYOGN02JqG4UhOF1Lgs3PMc8v7hLGFvrKD71hqaS3Rj9VuFBDbxGsnMTwHBAC
	V3t8BzW8cOobEzM/ambSHCKYUvSapEpr4eNRNR0KpeQluKr11mCrHCBQgrsWkO17LMAMnuyf5FF
	JmZncDmZ3XpJGa8PgYfn5D6V1HnRfrmHMbDR6IsYGFdgkh6UBLjHrZp1fj8AtkkULVA4jrlra+/
	cQZtvKdlW9ukGuLCduvhBMjfOi0LLgVBBj/Vhn53ZgcH3/Hre/DJ0V7U+o+CUL5WjOBrsrxAtp6
	I/uIdxHjLneu3lCgpjpPLyhkp+JOnaiOzaqBLPu514jzCE6vtVhbQzOBOLOw=
X-Received: by 2002:a05:6a00:3690:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-84212d35431mr2340226b3a.29.1780049845182;
        Fri, 29 May 2026 03:17:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:3690:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-84212d35431mr2340201b3a.29.1780049844647;
        Fri, 29 May 2026 03:17:24 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b307acsm1440342b3a.21.2026.05.29.03.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:17:24 -0700 (PDT)
Message-ID: <63794650-69d4-4ebd-91c4-89bce022c772@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:47:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP
 and MPSS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
 <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMiBTYWx0ZWRfXxMMdwILYVAVC
 KTWFGlPGyG0Go2BED0uED+K8LHGcIWJ09HkW9SKzSUcfbrgzCGVXs5zFWrzotmA9rkfJPRSky5A
 gZ3zkFLe9vypbNs9t272gQoMX8NLbZ2SY52q3MPZMhY37IMp1JOcvMkL2Flse/iLlGRoTUbXy0J
 ssElXcJweuDLv5fLsV61R0bWKPW7UsFeRRdEz28IQksNOgK/D0Jm3NUE+luADgSTWEO1cn900H/
 XxCmV8f6FpmIw1ZGGOQIc4o5XlNemMu9xN96VZli5qOggpUg4GDJtzEpejv9cMs/g0ZcUS9YvCv
 5BXSXP8YuxmaElTvT3sQ5MpqjXAJ5QnZHTe+6XdiM8+aPyBbwHVRqXVuqw6krIbaK3EGd046dmy
 Dmdu8KI4CWd496HOdqlfC6p1wnw4ycK3mbfZtBtBaD33J/xOX7og6HPEr05V2Nm9wFeSDJ3u62n
 p96HpokTgM8yZUKM43A==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a1967b5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9tZMReaGwYLiO49R74A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pKaZvgwCiF9lpJ2lh-N5XSMuTbIXnDnF
X-Proofpoint-GUID: pKaZvgwCiF9lpJ2lh-N5XSMuTbIXnDnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290102

On 5/25/2026 2:59 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:14AM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c..b112b21b1d79 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
> When can we expect modem and LPAICP firmware in linux-firmware?

It is anticipated to be updated in linux-firmware within next three weeks.

Thanks
Komal

>
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>>
>> -- 
>> 2.34.1
>>

