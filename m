Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192733E347
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 04:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775103545; cv=none; b=TRp/HDqq4az8NWdSdVIepEjFmvK9DjGWSNiXvut3QkScT9QRUShdf8HsonhPJNuQdLHMxiuY06FVjFcx9mYdeQnxBKWgMh+tfuvNEchpH3PYlmPUs4oZTijw1nJ8xFn/xskfMev5Zwo/OTsp/ZRbEHt7Zzoy7ASBbM/UILZKXPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775103545; c=relaxed/simple;
	bh=Nq1GoCB4ClQcOLSkMueynU5dDovgmX34BLhKBGAYTto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNdb54Hh0PNLCmugSjfnVY01fC8yYs0dUc/fSR4iE+3uiE5esQ8GcniOizcF4MFP9m8L/c0KljXx4CSBnO6iMfrSPhcJj2prYuAGF2EqTNlPbsOQFOsocVrm9Y0H74cAH7eKZAonBtrmTaFwoXXF74G2JnZEgUjHp4xL5pbSlWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmHMAttv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RirmtoNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmHMAttv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RirmtoNa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Lbn3044207
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 04:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=; b=ZmHMAttv4vcTNrXm
	yKP1z0+qccXYhdpYg7SCBc5FUfL3MbAmNWctJkA2QlfHZbe370bfavIlbSj2BfWo
	w7eNbq3UUoe6wSNHM6unjsTTds08HaUisUD/txUHDrZXUZ00wHtlsOVwuH+9tNdx
	ElPzSeF7Tpd9TaHjq1M0P8KVFsf4/HyhTC8GwCc/U3ZfKDtRs0/qIAWu3OzewJsM
	FkHjKbM9Vb2XtGYPBCjAKC0TG7HINcHedqElMeJlqc0lEV+B/XRr4dZNgrmAwKrb
	1hfuLSlrxc1H66jPHtHV4+gfn/PF30MctEGrhQNoHSYtnlXaCgb4fCIp0X2yErCE
	3cYaAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483twnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:19:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso994202a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 21:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775103541; x=1775708341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=;
        b=RirmtoNa9Hle399ppZ9reKOkJfgn0WXn1a5biSuJG/30bJS6ND6b/u8t+i8Fnr1Wpp
         y4rvuoAuU3nvVvsPPNjjz8c80u57GZ3U5kNBdZJ+U7K9SoBJ1NDLVvWdwvICLT+JqNHt
         HNeLJKo85zJ21V6tZLB174vDo2EqrqbyU2eeldGcclx2xEtcl/a1bOPo8hATJLTYY3H5
         32Ez/ZVEMwr6P2EBa+B2oeRLXJE6EBXnqOvL3INCdxGrldjqkioLTf7HQyMZqOFAXOUd
         8Xa2xaMYxX1P/bU1ya/Q5D0ycQQNuLQidUXSgze8q8TXYKtanafqiVLKKNoJ/eJhAGIN
         XHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775103541; x=1775708341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=;
        b=PGEFbkHpDPSk+2AESyXnfzohmfJs+SoAIq8Zu3d7/keyU6AI+6kXFBoXlgki6oAR2q
         JpGgrgjUy5+sgKWf0uVPtLXsgLMpZTuXpsuRMHteNx4giEb5j3qTQc8EnEt8h6jRgmyw
         5jpDveEWHFvyFwANxjxomm6Nmm6jlFHror6huzMsalaWXkIA5wNCffPT+ibzw0+SX5ve
         r1GPv/Mdj2S2sNpxbpDkPaNwAWkUcXIY1U2o0kiqHONot8GYA4OYg0kJcXMbP6N49Ihi
         dhuHk0s4lKLzS/fizjVsTs6QHJdDto9Fd1eVGgfJfkyICzk6T+A3m4rFj3uY/o8fLsnZ
         2JuA==
X-Forwarded-Encrypted: i=1; AJvYcCWp38P5Iuzl7MQURZHOHRTPeFkOVjnWiVFTKzrJgjnYrqOQfpmHD4Ra5jC7Ri6rJ+7PDg1JvGvVuAQl@vger.kernel.org
X-Gm-Message-State: AOJu0YwGcbIhJ8uXkdq6cNihqcT6ZXin95a31q4/0AxfFf01nx0PJVme
	Y30aFz9VPyRwehm7DwbSBRZyM4OC1ZksrZIGAdBBg+FzPREcYm0uN4lcJXQRddrbGI7SNU2fyxS
	iWL8e5iNdkx8b4upbnbxWcwHrrvOba6czw+viNQwrB1+2b5RMv3bxxIQSO6zjR1u+
X-Gm-Gg: ATEYQzyWui4n//MASIVtRqZ0aXtXxbs3MXd4UEeytWaZD3P5P4TQRM2I9N5E/c3eOZM
	5aUblmMxNz8c/r2zDsfr+krYpd7oxZGLd3OIbqYGMXz7YL0Z7I27/fcUTBVR0e0my6sVYrt5Hzq
	wAgdAQlMfExAimcS5xRbgKw65ncPyjxlPyYiGAw2dvzWtD5mxD6m24ECVE9aNBYFKJPBAcaMk46
	oDV5pCDbx4pYP29LL84wsoshcJwjVmpg7t7B+cvJfCuhZ5qEeff9NW/htCXgH2DV0OLDOWYNXOt
	Sd9f49FqVXg2bCZEf/1qu++ff4NnbP42ZcZp+akaXevI9o0nNb0ZOU9lma3oRRpbDV3YDmQ4IwW
	yGHzNr/n+T8uttaDaAR0zShIrVvadS5+RvjE2ewPd3gSyZ6IrAUbxZ+BrPwOivCYQBzZ1hL7p8n
	DAkfADEp0VQ2RL2A==
X-Received: by 2002:a17:90b:28ce:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35dc70192b6mr5926724a91.27.1775103541102;
        Wed, 01 Apr 2026 21:19:01 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35dc70192b6mr5926694a91.27.1775103540587;
        Wed, 01 Apr 2026 21:19:00 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9377b7sm8548259a91.10.2026.04.01.21.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 21:19:00 -0700 (PDT)
Message-ID: <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:18:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cdee35 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0XuG8Arr-fMTETogzHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzNCBTYWx0ZWRfX+bR3HUH3P61Y
 ZLJOpCZIPu3EtDUP7g72Pi5FAZcsW26qQ28R5gop3qTjYVpR6GECM1mC+dYxd8nwtmsYYrAKqTG
 4ucQ6qKb8uXf0JGlJKdWiTO2teQMFZ4NhNMEgchRqTxc6+yV/k9S86NfWp+xNBt8/Lr5OhRNr24
 hxO/CXPZZrFtt1NUNisLpU/6AcWVnY2x9I0S+c3Nmfqb68/3GV+MM3Ak8MhK8HtE/OWRuvdFj2e
 CEddkwnkPHDwIuJMT5blGKafXKor5MWGZAV7G2bAtaI4tNAgJT7ij5J8kipMt+cdwapVC6PpT25
 kvpiidqwsX6c7BTWyaxeKCfRmTyN6VFH/6Jd6edOeendaRoV/vofw+ejuQF++eUDt4+UYchGDyu
 TvcPOfb+eMhU1CYumPr+vJdmp59hkcJDptVs45LpB/bmBtjcr/AbzrZTSVm5pbeSgXGv2e9CdBZ
 M/FsCmFs/J4pP1NleCw==
X-Proofpoint-ORIG-GUID: 8Tk6ZmmdEUHUFfNcjpoXpHvKOTSB-WYW
X-Proofpoint-GUID: 8Tk6ZmmdEUHUFfNcjpoXpHvKOTSB-WYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020034


On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
>> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
>> the definition of the channel status register bit fields. Add support
>> to handle this difference.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 60 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 69f8d456324a..deeaa39bb647 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -28,6 +28,7 @@
>>   #define PMIC_ARB_VERSION_V5_MIN		0x50000000
>>   #define PMIC_ARB_VERSION_V7_MIN		0x70000000
>>   #define PMIC_ARB_VERSION_V8_MIN		0x80000000
>> +#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
>>   #define PMIC_ARB_INT_EN			0x0004
>>   
>>   #define PMIC_ARB_FEATURES		0x0004
>> @@ -63,11 +64,34 @@
>>   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
>>   
>>   /* Channel Status fields */
>> -enum pmic_arb_chnl_status {
>> -	PMIC_ARB_STATUS_DONE	= BIT(0),
>> -	PMIC_ARB_STATUS_FAILURE	= BIT(1),
>> -	PMIC_ARB_STATUS_DENIED	= BIT(2),
>> -	PMIC_ARB_STATUS_DROPPED	= BIT(3),
>> +struct pmic_arb_chnl_status_mask {
>> +	u8	done;
>> +	u8	failure;
>> +	u8	crc;
>> +	u8	parity;
>> +	u8	nack;
>> +	u8	denied;
>> +	u8	dropped;
>> +};
>> +
>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
>> +	.done		= BIT(0),
>> +	.failure	= BIT(1),
>> +	.crc		= 0,
>> +	.parity		= 0,
>> +	.nack		= 0,
>> +	.denied		= BIT(2),
>> +	.dropped	= BIT(3),
>> +};
>> +
>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
>> +	.done		= BIT(0),
>> +	.failure	= BIT(1),
>> +	.crc		= BIT(2),
>> +	.parity		= BIT(3),
>> +	.nack		= BIT(4),
>> +	.denied		= BIT(5),
>> +	.dropped	= BIT(6),
> Would it be better to extract generation-specific callback to decode the
> error rather than defining the list of masks?

Are you proposing to add a callback in pmic_arb_ver_ops, like 
'*check_chnl_status', and create separate implementations for PMIC 
arbiter versions before and after v8.5?

This approach would add more extensive code changes with some code 
duplication, especially for handling common error bits shared across all 
versions—even if they only print error messages and return an error 
code. Is that a concern?

Fenglin
