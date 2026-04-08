Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C00396B8B
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639864; cv=none; b=omU4VuLZC6A8Elsp8sTXoLkShBZvsyjw9k4xTn52LsSFMXe5i6rgAyOdC8pOGJMFCtdfdanBVcDinnsLSMDeHPXf+00bsbQ0/PELkjcQ+ISviigc/G/6MX38zCRqNw3yhjBUVTb4YJE/BINIUo9/ONtt9JyOl8QEVBl/onOijJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639864; c=relaxed/simple;
	bh=5SgtmHDKYJakcPQU7t/Fr9x1JX6LqLotnyM8VacRCWo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n1ng6jqygfUMdFIkO0UVVmLnxuwRLvDA6/IXmJtQvzgkvqEjSKPrFvtXu9ZbliG8HOzBwgz0RuhtnQtB9LjycyzCkJhbhlafFQiLXVGWsNZ9aZkG1OgSHA5XCNDUwYASQLnA3hYKpbX8ch/ak2KGbw9j1ZCPe3+ixJnQ0BprkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaltLony; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6LgxhFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaltLony";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6LgxhFp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387tiSg1259648
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=; b=jaltLonyHTzMahw/
	5o1OSpHW08r4XpbN15i37+WTyb5ntcFKjd+Myy47ADT1beruc0in9UxI6GqsF6Yw
	qTQKH4he5o8tTNnQ06Lf4ZaUgRmaTxV0CzLHRzGYMAh0ezWH7Z92p1OiM1aLYrly
	3H2vVzmCW9uHEgsftdtrobwxOEyjJdvqsRW2XgeutXINVPjF+fbIUxQ3DK9+ufWF
	xo5ejSDOnlriWpOKU+mGSIkNgrQfIBpNaJsDkqcBQuDNbn3BsJToLD9m/Rsgros+
	n4lCF+tSM2WDrXZSsa7re1F5zscBNF0/PtuY7665uX+q0vBd50zS/e19LsjOvEG9
	5AA+pQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttstu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:17:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso14633827a91.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639861; x=1776244661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=i6LgxhFpCCrKC2pGpXmLgmBTPGi2vDWB9/fwrc1VrSyv2VNkIhwQ1YZzqqPC3Fq1T4
         BFOz2X+JjFWDFzib47TXPytItvLSnqpkbbD2DxaREQbC+lCyLlG2a3KvDS8bulA6TtQ5
         1jr8r7xPYXrqy6KHkaOqCgGlX8GiETveZDXd062/STHcx4qTvV9+F4VMOZokTYNuXg6/
         eF57UlOrT3wQoeqfe5mf/0Nb8jXGiaQPESQhY264BXEz2Dycul5cKZ7ReNZu0bBlO7CH
         wcDhsgaL53x4HH7vz0jRG1b+dzPAsKxH+2qSnsSA9ypbUCZ82IKcvDHmnYZHVGrxv2sg
         1N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639861; x=1776244661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=JtTusQAvmRwdltMYjXpP2AWGYDIpElRSu0LI22Q2Ca1cR3gfO8Sg3lRmIjFge1RQI8
         xJYwZQi76uvuyLPRKqLNAvheENc8nZusGCsWve4JkTXiQT8OrL6U3jEJwyIZLBWixWUA
         V91ZrEIc8KfeYdURypr7EtoYSPJ2OAFdqfvmgU7grNRW6E5bht1QDBMjoJTurGWkYE7I
         g0+nXwBN6Et4QEk4RmGvb9lx1vNauN58fRq1LlmjQaciIigPTHUm9e7W2BK/dZrRYX62
         SUkuxxnSLQ5095GmYAdHvh+ePmIUrz5jNXXg/zZIkT/R3bvw+32LMo7rN8JT2LJbX14U
         QNJg==
X-Forwarded-Encrypted: i=1; AJvYcCWbA5MjUAV6HKfbEWTbE45mXIQfv7TxuOoKsUb+SkX/Qf9e0t/oe7kpsRCv7ps62PsT8NvR6QCsQArA@vger.kernel.org
X-Gm-Message-State: AOJu0YxJh7/lvHVfwaRfZDO9ZNZhu7+OD3kodric7Ns7c/hX1YSCxS8B
	8zn9d+x6Fz1M57QhRYW5pbN9q73fhK7nNC6zD9XfoBjsbH28Tndoz2YlKidGmxUENgOlhG9NvLI
	7rLwfkzXY5uhcLI+3+eGHGGijJ+IgFp7N/L2WhgoGCj/21meIsRnPyYncVKLzRbDo
X-Gm-Gg: AeBDiesBNpm6zjE1IH0axuC/R3+Iym9QLIS57/pVrG73dPkJ7cr1hdCwcg712J5AkJI
	l7n3ftjN3jBSeNW7wA1ARIzPPHa7AHpid/+d1SB2tg0FAdM792NHET3GhzxLw8ENphCW3fdUcBH
	Iesh84rlsn/NwRL29zcb1Tcj1mBITvwh+t4psFnylo+nQ4kUOaA5zaByNvndMOFz7BXUE7lCZcb
	9GXnPstjPHiXLgOcxgljWkMqlb1RwYrt77eFCkRbeco0g5mRteojheaDTvVqTZpdRWRXq/FzmwS
	CHLYRkSsdqGXV0BomV9VFVRU+HICbkzti9wqhBcPGUBBiDnjXsMFtZtnEsHtY2V7g/eRZdqVF5o
	TH6CtBL1+goSHXKosA20u/k98dvjGcQtcdphUVbwguigilgIdVXgHsDA/PwklWTPLZPzKM24aNm
	IVpObF97Kqanb9x5Kl
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601685ad.1.1775639861532;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601445ad.1.1775639861075;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbce2sm196458655ad.79.2026.04.08.02.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:17:40 -0700 (PDT)
Message-ID: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:17:36 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kq2rPKa8ikrpbgRIVSDbK6W5RnEM2AZ9
X-Proofpoint-GUID: Kq2rPKa8ikrpbgRIVSDbK6W5RnEM2AZ9
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d61d36 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=cPr5IrC0RMkJ9YLvWl0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfX7fV8qZB8bUUM
 PU5wm7qsxURCorJadhRBgQZRglzfB4kGxRk4bNSp7lYTiOkMMwvwSQs996ucJASOv6cN0A0ATjd
 6RQMH2qWjXvGJPC+yprqSK78UbMs0426WHWriQq+V2KuFwX2/xIdxDn2kjwDq3Ok6FZunxioP2X
 hJENwII0y4eY7Rs+M79xmDVtxzm7nJHEkP7gfo8TB+r0RJ5OeMEvsE1PwC0meU2F02cqdhKrydI
 Cl/LMPbm4i73nkU0uZOYbHbVcHMOkV+r686qAqtYRh9ecF9h4rc7i9H2DcAEfHyyHAGkCwYDtOC
 Dy4e9mTO1OU33A6BIv2+zNStI+Snvz/wWstPqojB5YWMm+MJsDC4+q1GA17jvEoQFmZg/QQ/mdE
 kPhAwVOuhvin5oj5rIeOAQyTVF7cerUplO5AMonRIVBpJ7/mQDRA3Li2VsLNa0z90BY2C0WEGhM
 EpkhmXYZWsx537wI9HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080082



On 2026/4/1 20:40, Dikshita Agarwal wrote:

>> +const struct iris_platform_data x1p42100_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> 
> this needs a rebase on latest platform rework series.
> 
> Thanks,
> Dikshita
> 

Will fix in next version.

-- 
Best Regards,
Wangao

