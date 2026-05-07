Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CC3F7870
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160243; cv=none; b=URDgu5YO7LiFbWHLSMXhaCBt9Dq7usEzyfUQLHZmAtHNO0rjVQiyCuqp6LWkeF774WZfaWX61ANrhcXUfZUulD2lZOLCnC4yULL9jCrGausFIXD5lADP1FA0M9gV+tZsABCooPfRVUIa9b9uXI7egB+HpS/cipYlXm0MeCXaUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160243; c=relaxed/simple;
	bh=0LvcMjoBI/iLO7V68fpoO4iG8nsPdfXEpftRhNV1pXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imolf6dAjozUG/rUHJO2v/WH0eR0aKKkg1V5lJeT5LofTVkyTg+6jy/KqjVWMwEv/FjVWRCFfSmGaIRqW1NGnGlCRpYIFiRQCEvIrWkG2ufoD3m7obN9WGCEdWBN0Podyg55PyIYonmiCQGBS2CM4Myf2PPuaYTKxbMIbN6sKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3CWqQhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS2gq9cK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3CWqQhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS2gq9cK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AGto1879589
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=; b=N3CWqQhrtnDd3i18
	cPLRB7z15zvLTAZcslKYrQ9CTjOk49R/5P6uBnkImFcJNPgkMhStK/Ne7HCNjajP
	rHLjdDlNWIBgy6Tq8rCYsre6+J5Pa/rB705RJEDVjrhvJ+33Hc+6uuom1asT2AnA
	hgiA7G+MM9BqvoQeM2YiYPdD5qhhlhHKNd0yEpD9WY3+269cdRGYWPcNTKChkkT/
	AzDovWoWtWJDZdT2jNg6F53yGViFhwa2zrX+tEXZWyiRHYXTtNEcDQEjJ+qdnVBU
	kwJ/b+K71FsHaQtdQTP1EiYyT0Cxrq+tzZfl0xm54rl5AZcg/Nb7WN4Lhk/GwgaI
	sKKzUQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1yac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:23:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35842aa350fso1594643a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160238; x=1778765038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=YS2gq9cKrr8rpgGKN/fFrv6pwKwDNfJ4Nx6Pwj9bQOJNPU99tBwp49hczP4yFpf7TA
         9f1j0IqNdJ59DtVPChF6CgHDa6bZ+K80dvPl/7IQRKq9R/7r16vRGE1lve0ckezT/7iY
         4pI58joKaQ7dSlvrezB+cL5qxgFB+QEIHnobhgCN9Hn0U2g0PrvzBV9MCUfPx5WC78qb
         YTc47Dzv7DDyyiPNBvXjy8msweqw6WXz6zXy1ZCF5MEqYp1PgqR6MSPltoPTeHhV5r0x
         4itgUZODo2ZxRg80R9+rGvNDEFA8SwvZ9h7zhzFSiVhVdcXIdUdXeQ/VsmXGSIU4Ztcw
         hEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160238; x=1778765038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=kkGDvDdTvbJm790BjNQ/7EPhFvHWeJURZY96oj28dEQ1Lf0jCGZJhszeD65knM5doH
         hrxHxhVyAyqy7uUU5WW9ahbLo5LR9Rps9IMf7Ku0C3yl7Rtldt/+mtGzJ5+Hg/gaStHy
         an6ssTqXEmkJatONpdJdkySsTYC9gby7XE3epMGGNXblt2WJmNpKTRTD6rNUMluBHOFL
         4+W4x5znyhiOvx+cV1ZB9gp8iQv5YCx6HmiSBbJQVQeEnJ/uLJhpuY23z9LzIfYHoSyj
         MthHpBHrY0DBi0A1wGx5gYpnldwUHJCrthorRlR73u4PHcWKqdeWHxUuV5VS6ZSe4F+N
         5Hqg==
X-Forwarded-Encrypted: i=1; AFNElJ/mq+sau32uNVEb3cFUNWXZFzkoNNbGZ+upwfRh6snKjLLs4xb3pXoTHoWhM+ABWdaRrRDBByvICNHX@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQkYOWwuvycONjHEDMrUOBLzj5PslgVhWUAEhBMAPPGQPKD/r
	Y5wwxf4MgnaXuOJP5G4VkewLh6tzixmayagWdPRc2rCGYKV/ar5Y5Dj5Z0qEhjdcMT6/shQtT3C
	r5JLaeAPh9mZzzgx2dDMVAt26jNT2spvEswCB9GGh4TJbalwd+lNB48C+sPrcIv1L
X-Gm-Gg: AeBDietha+4gMzGTHlSNXNfH1pba19kOOYCAWWkcLu0MSJz+dKNsQWFVYZq7k4pqVht
	xXWY+DYv5/RHd4gd3bzkOEfmo+ErDKj59VCltpd9m+rVUbpB6VAhWY88ChJzF5ifbJgW+NgxcKb
	J96EzmA76Bmj7rP5tCTUWCdF4VgXKo+VDxIp5cvRvpsGHTFvsW7leZyniuVo/lDL/EIVa98IVfM
	NMrFbsjkkpqmhLvoHrWkubG/2rEuDffjS92Bdq6PgN9TkVQIdEkIvA3PIOfHzVV2o5OAr8Yh5wF
	KMiEUBaezwmus/gDBNa2oQ0Jul3rQl8fFRXVG6R9XRyMjInouTDlwd7aULR4kQ5nvLC54NMpwmh
	XaeySIgsjbGMdPSjdvazgQ+Rt8dbBTPYjxVgi3wdkScx3tr9VSXrUhCvkKRMoo3RtMgY=
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223284a91.6.1778160238404;
        Thu, 07 May 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223254a91.6.1778160237937;
        Thu, 07 May 2026 06:23:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06bce16sm3213237a91.2.2026.05.07.06.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:23:56 -0700 (PDT)
Message-ID: <30472fb7-dd8f-49ad-9c5f-fd9a7dc9b393@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:53:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc926f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J-ePHVnydm4htHqtPd0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: nA38Tm7rRtZ-YMfaSBN_XC2Db1_lQjDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMiBTYWx0ZWRfX7IAQeFT4BlcB
 CCwrbRQfXmDEdtOKStyn1ErpyKQGDH6zPFiA7Sr4y4tJA8Wkwttme7yWAn3LIUUbumiNmbWKOAP
 QthSFiGGqMhSW9S/IHddssYDGkKKDEcLRB8lH9R6ZJuFy1tROJkFfjjGNPrg0wsiNj/n22//U1B
 6lrP5baBGdywsOZNmtqEbv00GdgE55+ZWU6EGFdUzU/R7AZ53LG3amERGmWs6EMXPGqlmdMT6UQ
 RDGNg/48n68sRmgij/F5SJS3vZc5T11FHadWZPEROBLouii9cHqSRJjNgi2HCL341olb5t2XuBu
 7aJ8NFyFT1jxrZvxc+V2R9ngps4mCB7E9q50Yyafg1JdZdmzo0tlgRI5GKZORZz+ihHIdcIknmL
 NRAWPvsrmhGYOJexhMz++mvs6+dwcspgbJVOpr5n6q2sMkvMHgh2ZtvJcGvvI2QgZ+Qe5ocwXJI
 1pSMb7yXoi1mWbHGptA==
X-Proofpoint-GUID: nA38Tm7rRtZ-YMfaSBN_XC2Db1_lQjDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070132


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
> won't have corresponding entry in the capability tables. Let
> iris_set_pipe() silently skip propgramming the property if there is no
> corresponding capability.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
