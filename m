Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464C363C55
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355768; cv=none; b=jQC5CvR3I3webx7pJvNbms+CDKB7aVq1YmY/DQHTf4xtkdK6+JC2q7Upe5RQqsxIq3kuKlCcJvQjkc+xFw609TuJepBD4xPUH2IkNgFDIKqA7404D9CogpbVULlDWEXZeVUzbhuKH3k0uq7DcO9bUj9ShN6KpDnj9wM486ZjlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355768; c=relaxed/simple;
	bh=Yg/cU74Vy9ro3baT9VcjvPWfDGRKJvVgURYJ8fSh8k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4djuVzTRD6Tp4jysdM3QbRXNCZV/uchY6D/3p7rflCDbmZ51OXV+csRWZqf3idgU+EJ0l+DycEAhGFp6ckdxzB/hUPVagpt9nKzRfzfnvUvz1nAXkQcRiqOYNQfK9u3PLtoVO75b/MAIYL4xc/Cxk8SlMZJ5p0icyIMkPuel4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO5W9J1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blzfeDpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oO5W9J1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blzfeDpM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99tP53343616
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=; b=oO5W9J1M/3SKlU9l
	Lo9+XU7wke3dZ4YYaRSQGr75NdzUYBdf8Vtvn5wKsvBDRwWcYiX1TLHgExB6xEud
	qqYD/P0+nfjKsZ5/wB3namukEJZErDjHLSAjgBCQAJ1AevJQ/JwBzkrL3Txm2Mlr
	YcrVDkplQwcdciD0lmQWxelkVepPYCxou+BALmSultZSft1lCzR8pMnl+eCdtT/X
	2wgA14tuFVJHQPhQ3qA9NjRnVz6lwvwDbKT0nn1wxQV/hkGEgyzXy4FSMAmiPfvy
	RTexzkufIduRZAvF3gZSH6OlQpaarTg3+LcFtMtCSEymoN6UEAr3W/h8iKhglq53
	rKJ3Nw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrkk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:29:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso12865247a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779355765; x=1779960565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=;
        b=blzfeDpMo5QMcFC6VvnVm0SwtgG1KabJ0O/Cx8Na+f/QaUziFvkX6FiUCyxmTmM+8c
         koAsnuDf1C1tWD2e1Sc41zn8UXJS4bmGe4eVbncGJDQ5tj1UJJYfjmdknPYssuHatwUX
         FtrWIdQNQ8k0E3OISG01UrOGg5qW8aZ+XBDuAw9g6LuC2U2CbNlPa/fVJoZwcjy3zTC+
         bDEDKDJDqPwurtlzWgi/lIQDXf7HTXx6EIfJ6nMQdziqmpNDPhthvYX9CSYZuydM4RdK
         jFwxFBFmSk5vKXsPoiXYCOwaUtDYNEP1bRACTwJi4uv/59Ae891naaicAMF+l22Tcs5n
         TtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355765; x=1779960565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCtWrc4L6pgAM/xP7fsEnsajlKUHB7/Vbhu6Xcz8ftM=;
        b=jqfhvdkhmfWb3MW9fV2OvtLhCOmx2s0uhybrPppAO/fY27vgzyh5liqEeEQqCVj2uJ
         Z2hGxuF9X9xz4q+ncpVSSGQSkTHgp6Z2W+8Q2ljtDzidxa4r9ePqMuHOYY05n3gdJH20
         Tmrvo5x2bn11Pw4cE+cNE3Y5EjdnFqBwThXfCrXg2VwMOzQwKh56XK1ahK5JZtdr6Bhr
         62buxElbcmkRNsF1ayYGANisgSjpZkYjQ4wMQ5EwZJQKAA1szyCOUdg9FhH2Ky1b8bd6
         7IimsFSNABI+EUwbufa64kzAfCWXE2oR00bVkxTN+v4FHy+KrKw3m7xi5Lc8+/Risvse
         z8sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UIwhFmYQfnH3eP6FT8TzJesfgg9cNpeedCAq4YB7u7sAr2s9v0hqpK3fTuEErPwtQBCyhkkIo7CSj@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDduNGqLuyUBqmXJzFJs0ksSnaayTpQOayZx3vRgIXuVv3uL5
	hO3lqBjR01R/Ik5DqPucNG8RIBFLGaBllXChKFS9RsuA8pYGCX6x8IAlZoVuoqZWK0beTh92OTr
	D+bngFSeL/NpyyVaLbRIHfNLA0POIei2IXGLJacccWCBFL1UGm40/79oyBHe4U9B/
X-Gm-Gg: Acq92OHyzU/SBvrO22lXrmCgiGnOPyaZglvikgSeDgcRQmJIX1AcJTdM5UMP/9VeuQr
	sEHa6BwxwTTXzVsxyQJzUkub4qC/sNf+Q4jYDMqkuJcbJAoTDSbTKu1PzhnFn7Rn1P1PBR5ZyhC
	3dA0pRgYITIzlJAaD5SeVvf7hiOLauGt56eZJsvr+uH5wdZXcfsmr9sbSMdv+PKjeE366eLFAQy
	DKd0lsVhRrbwdcc00jZNNHLYMYrSNDUustSFDDFR7/1zbUgXVwjiF5U9yakj0NHGRFEZnN+KZYt
	GHKnOP0Ojlz+9jDtMcnpOZw429M/a1RZhbkPUflDN1JhJVZHqzemGK0xwAI+TMLldKOrIUqe36q
	wGuDliEEXsMcJT7hh2dS5TvjIUYcvJpwOu6BUylye9oOUX/LL
X-Received: by 2002:a17:90b:33c1:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-36a455e4b9emr2003892a91.7.1779355764728;
        Thu, 21 May 2026 02:29:24 -0700 (PDT)
X-Received: by 2002:a17:90b:33c1:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-36a455e4b9emr2003869a91.7.1779355764214;
        Thu, 21 May 2026 02:29:24 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5b34a1e1sm106223a91.16.2026.05.21.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:29:23 -0700 (PDT)
Message-ID: <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:59:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>, Erikas Bitovtas <xerikasxx@gmail.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5MyBTYWx0ZWRfX8UMXwReQRUY4
 oVHMFnjBo+ObKJPgwvwBje1zkZ+FdohBolWpOg2rhUl2neCMsYmZBmjYpnlEf3bmS/Np7z+X8e8
 E1dbslh2ebTWpZLLnacdmUalQ3PoF5aVl26J32SMVsO+fR7oDQv/4G05pNoil1zDOhTnvqCML/k
 WfP48mkh5Dy4n9AFIYMejpziC123tf3zIT31O9E1jY0VNXLJ57x1VQY5MUA2r39xG60B9w7n3rF
 VBu9yyoWfdKf3jYaagLGR1bleAcdf+AX4H/9r5n2tu18KgsfpCva4R58ihLh/W2Qto01r0XfkH4
 Aszl9JH358Pmt+ewuyBfyvPTt9nreIgc+oTaU7P5M5L403AFix3fwjrZMgWWbVWHarX4uhGdmYR
 dMANR2iE4eorD2eIm7c7VgUM6/Hn96o6yCsTNgsUQRItn9H6cDqmF7LNUStXc+FwWsdUuziN229
 da+R1bJSFBAAvk1BfMQ==
X-Proofpoint-ORIG-GUID: qg9JOrzz8zUsbvQmvS9VfubtqommOgeA
X-Proofpoint-GUID: qg9JOrzz8zUsbvQmvS9VfubtqommOgeA
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ed075 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=BwysoTov3wrWWCQ5pjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210093



On 5/20/2026 2:02 PM, Bryan O'Donoghue wrote:
> On 19/05/2026 16:10, Erikas Bitovtas wrote:
>> Allow Venus core GDSCs to have their control passed to hardware, so they
>> can be powered on by Venus firmware.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-
>> msm8939.c
>> index 45193b3d714b..243d31a32e92 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,

please use .halt_check = BRANCH_HALT

>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch
>> gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,

please use .halt_check = BRANCH_HALT

>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> @Tanyia
> 
> Can you confirm this change please ?
> 
> ---
> bod

-- 
Thanks,
Taniya Das

