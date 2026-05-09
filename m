Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764312F49F6
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346453; cv=none; b=Bula/7i+pIGhaUDslCx3ceCR+sk4eI8xhAntfx+CFZ04hasAx0NjgjGauycziRysUCkVPobB5JWDW7h3mTvDokv/icAfQ7sGUzjSBuTCLlEFZv5Q5c+3Fxde+ruFinhm3I+ZXbi3QiiO/kdMirHETPp9xTPUTztwMFFqLDEkNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346453; c=relaxed/simple;
	bh=QhhESLt4sU4La0hv5PEaGGtWswEN/2rxsz2V4OX7lNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmVQrp8Oixf4LIKK73chWR88wDK0cJCRq4j97455+hd1ivPcdEPZlKKOk+c1YYtTkEil4RcDnx4+vjHMbWWgIMEqT4W/8RFvIlpeo2tZJ5hyWfJzN9GEYsYN2g9EdYNFBAbtKR4Oh7YnKUy4fKXzd0m2fj2WFSHTVJwm2aIRus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSvGJXcZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTGxJVFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSvGJXcZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTGxJVFQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494ll3S1689277
	for <devicetree@vger.kernel.org>; Sat, 9 May 2026 17:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=; b=PSvGJXcZAgrUyxaM
	U6HDSgO1E2DllbScsXkg2vFzairaUrRNUwT/eHB8sNtYb9Mi7QIPIy9oRuPp6vTX
	qvqZRxKGECeOJAlfKPy/tChHjGd3dsC3WQJRMuKXFTcs30wkjWhlQQS4IXA5w7/p
	HBCSU6AEzIdjXCyIKsoOYmhpMEhezBnUYxN6RrWPmSg19rXe30Gas6nCH1SOJnPM
	AEA+TWemEm0jcVf5UooqQbDMp/fWsupOsSgjZzz+wuPDfLlBOu77UV2Bzx9WcaXz
	y/werDFzZw+zG/79CrF4/vSovF3+4jEul/RGYwcb/AftErqGrCTWy32yDRypTCXd
	xaWKfw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79h73k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 09 May 2026 17:07:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso3773003b3a.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778346450; x=1778951250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=;
        b=dTGxJVFQiTaBKsL+BfuBkxMentqIeLAPLjwIvrxdIfEJ9osiJ5jbNsa0+MlqaDFS5Z
         9rUeAJqluZ/Z3peGiiCtrh743MATwtR1yLcYfwNg+97+Mb/79a13w1muoxbupSeN4+B9
         wL9QDhuqyEcEKf4U4pIIsv8G3NTgfjWFsHr+8Por0dGTwrztv+1nQc7tDlQS0nRL3rVP
         oVpwLBep3K/DGlq/14GbB2NrAQDTZQGS+YN3ZV32OFY0jD/Ut0lBAVMNa9lU6H/BYzdm
         oiCtUkNXPs5P0kjjLDGklyVNHIAy1zpkplRwS5rr6zw6ovgJoQnP8GeCKpqFv9YtTpkd
         HCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346450; x=1778951250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK26YkhXhOkB1zXXrflzYxxjD7OJUQPCc6PGnNHByaw=;
        b=O9l3YlmtES9yaHwFukOuYxO8iBjkqH0TgItvA2lZeswyi4oNoRgn1epaY6MYCgea7I
         4NTEsL7nMR3h+9S0TA2OldSwQf9ZXLagl/rxFpqF1CK+8dki+fROHgQy7YuNGBoVdwpK
         xcCZcni1xWvL76Cklp+lfMSi+r/5sQY4l5ABSrqL523OBcCRUJ3KGqrU3S34Dp/FVoWk
         f+v+ZgN418vwTrdddQ1neTFlanEdMXfepgkwige4oeSBGw69gqo7bAVPJGYr5anNamYi
         hxLMXuuDBp6YYlJHmXbhQxty/L0L4N3Tfzy8UoQ8QQXZiDTrIwn23xSPqbpIDFhBl3v3
         JFsg==
X-Forwarded-Encrypted: i=1; AFNElJ+xQci7n9d2szeiCqGs4Bul2VE8VuxeWatL4QU0QT0bUrUNydaEIBCS2vmX1VZoT4fdGQbxmKcFHv1r@vger.kernel.org
X-Gm-Message-State: AOJu0Yzibf2n74SsozanKeWAUo/gBwNn3TBDNQVgTpvJUbnxiDwiPFaB
	xjsWVFXYpmIlnO2uh0Nx/Ev7XBQqWVQGPtUsPO5bd8ueaSBlmC/5siH2CLcx12pZo754zds7rhG
	h05rRtPgDEHbEcqWVd1OeR3ShkwGLpSY2wftLWjbEOzLNi2Z4OXPC/LPE4gRz1Wcz
X-Gm-Gg: Acq92OH6c7EtRlGyNvnejTqsdj/rMS4JM0U7yEHGuM+4kHKA3YWoDg5JyAjo88Tzrd4
	8aD7d4qpITSkARLwmdTeFtcPUMoBKKq2YPRYlgY3btk0QgEKADK4NYifLfhyE5NyndVViNRVs66
	mGHsk9VZnaWpak+NxCxSPZC/KQ8AJvX4wIt6ejyP+lYV7YcuPogGaw0Tyuv3S6n4fGymsS5qG8j
	EFAMeuty0Abouj6lBOshce4+oUwSCyn7CkITP+t2yixQ5+HGZQ7EfsCSVZ8ncfrS4AlqSpiK+6x
	1+TypXcPc9neM1ShHRIp6UA+SEFSEpsYmDRaM7eg8lIsnoDwqQgfdeIW0Q1SE65BgYbXv0nxnVh
	JdACXbKQbR8Ce/3gKpZTVLVd9jLyHKxYWhoh03/IrzksF4Oa/sXxlCAJomcY/WA==
X-Received: by 2002:a05:6a00:1303:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-83e3bf8eaf4mr2810749b3a.47.1778346450083;
        Sat, 09 May 2026 10:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1303:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-83e3bf8eaf4mr2810726b3a.47.1778346449532;
        Sat, 09 May 2026 10:07:29 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm20911031b3a.48.2026.05.09.10.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 10:07:29 -0700 (PDT)
Message-ID: <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:37:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q9UEADHV1J62n3g8STxNp4dqIq_s13BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NiBTYWx0ZWRfX0jfYJfYAx1o6
 LUAUD6A3VNfXx6y8s27pFnN2WBKokO4EyHlSL5LyaKhklZYd+9P1CJ38nJj1m8E+xcn/DChROSX
 n+rGFMjKJHv1JAyTxMDk7bF+zgjfEzSbFmDmsbfxTR3SpsxxQX2y80KNrm9VDzOatMry95cLqb4
 h34BdeRVeQatESjLvPzxu6qBjh0SysELU9EkcO2nmFrtaGv9FdJU5nmfYdZA5c94MtHyoBgpnwy
 Ey9cOSf4+FP20ENcKrznp8CVu6sv5+zpv0AWrDkDYSdiDVzMFXxVpr1EkIqYXOKq63FwuEIBV+p
 4abJ7KAfTVP8VgNdQuy7L3xTaerCwvW8ti0iJs+XuUqehL76uELSIMUGas5gpFMtkazgQEd2Yaa
 Thoj6MDEGLmlBzVpIX1yr6vdYKAg5ov49mQTUT5ClBUYLsPXDKjIrKJukWIHH8ClTb5XQpebNEi
 XJ5GlEf/vMmUY/ok0mw==
X-Proofpoint-GUID: q9UEADHV1J62n3g8STxNp4dqIq_s13BO
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=69ff69d2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2nvh9x2cStbi1KpodkAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090186


On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>> The current clock and power domain enum names are too generic. Rename
>> them with a vcodec prefix to make the names more meaningful and to easily
>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>
>> No functional changes intended.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>  .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>  .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>>  8 files changed, 67 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 55ff6137d9a9..30e9d4d288c6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>  extern const struct iris_platform_data sm8750_data;
>>  
>>  enum platform_clk_type {
>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>> +	IRIS_AXI_VCODEC_CLK,
>>  	IRIS_CTRL_CLK,
>>  	IRIS_AHB_CLK,
>> -	IRIS_HW_CLK,
>> -	IRIS_HW_AHB_CLK,
>> -	IRIS_AXI1_CLK,
>> +	IRIS_VCODEC_CLK,
>> +	IRIS_VCODEC_AHB_CLK,
>> +	IRIS_AXI_CTRL_CLK,
> Why AXI_CTRL is better than AXI1?

Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
especially when platforms differ in the number of AXI clocks they expose.

>
>>  	IRIS_CTRL_FREERUN_CLK,
>> -	IRIS_HW_FREERUN_CLK,
>> +	IRIS_VCODEC_FREERUN_CLK,
> Can we at least group them too?
>
>>  	IRIS_BSE_HW_CLK,
> Is BSE a core or a codec clock?
>
>>  	IRIS_VPP0_HW_CLK,
>>  	IRIS_VPP1_HW_CLK,
>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>  
>>  enum platform_pm_domain_type {
>>  	IRIS_CTRL_POWER_DOMAIN,
>> -	IRIS_HW_POWER_DOMAIN,
>> +	IRIS_VCODEC_POWER_DOMAIN,
>>  	IRIS_VPP0_HW_POWER_DOMAIN,
>>  	IRIS_VPP1_HW_POWER_DOMAIN,
>>  	IRIS_APV_HW_POWER_DOMAIN,
