Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502907;
	b=G88HMypAudbHwuzykIXtNaMGKpDo16jLU+EGNiuC34A/crmHcKn7SY47ywu7me/WQgPs
	 uCPFgpUrVRoDIEtK1kdQutwJ2zost026aeYzKNKT8a+lPuNwkBackZ960jKEs15oi9w54
	 xNRYT1fL5ZD8VpOD2EQWvblfRoCjjs77Z/pslVapdGm2FHzph49mQpqBcGphN8zM0hUje
	 D1Fnmc6YfLkmS3gwlLPri6cNoWFadguZgMSqfxRs5ogzCzo8z+yqcHywY3KB9kLCcAAIi
	 I0R3tcyBPp4VVri3RqGY5hmOk7e/FzsXe8Gwm/E4oLf8MByEfj/wsS/Dbglvl6WlQWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
	b=Kx6oP6GGcPOfb0jWujUoHmHhg/Y0VmfgDdb9K65V/AbTnpX9L5/ymVPvRz/qUkcK/3eM
	 g2sC1GU9+Fi/ndga/qrupvBPVO9pfJVP8QxxULXEHtpZEni3fN1CPXake+vdYZqxgL0ZH
	 xYYKbbs5a/bIFa3gmSJG+vQfTsTCsynL8X2efi1AoDrgmitV/cScsEcuCuNTnBOR6Wpbw
	 4Wk8As/kukwFyKCK+yIxHWZtuW1t5TOZnqmg1TNtf3QdiOcXAtStxBrHC/Z3kpT96bCdB
	 xhDkuDkzbsPi+bN9PBRBU6vFgsk1MJoHtSO4RxD0SuJ8o3jGJKBwU/qSKUkG9Z7yhKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZiW+qKn1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrcoWNmV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF3606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CF3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZiW+qKn1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrcoWNmV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kH8D2208880
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=; b=ZiW+qKn14vtnE7kO
	MMxIua0092TS+b8gSn9oRuEvW5WdI4qO0phJ8mZiNytOm6vYDuIOui6d/GlPDnM+
	gs5+s7HpBBVSyjNcb7AuYX9ZFKMeOPM0FW1CRAKCbJ2n2B6/4q7wdJYz85rEbIQs
	FvVA7QA49v6lZkIkk5YvTw33UsvfVkBPu033USfWVSb0heJUr3KKzfrySkzY1Vq9
	vf/kl4ly7CIbHdyvfvmo4tQ+BN9e0ENaycUr2V52WRkd3+PE8eLIkHqT59KMIWfy
	T6Fq/pX64jUxR7tsqJGeCuuTuo5gvTcjzcjcI0SyRa4sKVlBXCjZPgeV1biOsc8F
	2IHU3w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy118xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:48:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c4e8b81eso24035eec.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502905; x=1796107705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
        b=LrcoWNmVRESindKV0msCzLlE9d9XGSteqmNkKvIuFLKwnKjiXu7To3zq3hxVnz/hJR
         vd2M5PdspwixUOkQFlWioZnjkM/7JGbI4IKJ8Yo43IhX4FFaC/XCKj5PxCdMNYmBO4rS
         4uFMPtlp8QU5YQE2Ux3HGx6wJ3hlE/BWiSe00DgvLwkT3ehR6XKNTO74X0IdsypbCi43
         eXu6H83oA2umUDzrMHV0Q3hQ1oxwSWy5lN05uwbzHXPzRNxsAnXEemKggve7EewNVVk3
         a88Hxw1Dsu7nAALg9Hxkgm/RaUQlRAVf0g8gZYNxSoq7NWp4sSusMVNjg9jhsW2412YI
         NAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502905; x=1796107705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNQoPdF41jHcyVXt/zIh5Q6mYdg74sk6nBChj46cOzQ=;
        b=SvvAJAj75WjQLeT/mF/kRGTyJAX9GDO8oaXk7mbfuvwjx3JRoJlGhNhnXL4c5UBvub
         vqqSGCotza63yZUZgdNaO1M1LQu9xF+Di75Rep9Wj60cpYoqYFM3ol56ygEsy2HhIQBi
         /nEjtXhI3Q0Fn0tuUcRQSSO6sHnWfmqOBJdun0IXdIJY4aGUsuVoTDyWZewcX9M5OXzf
         DNfMLosrsxU5g7KgAgPM/Dm69hn8hDQRP9EAcQUoH6qilbzN5al+Zlw4TjHFZL/Prt69
         x++ZULAsUTMYfCV1QFG1oLcM9lHH7n7e4KhwZ6Vn/8pLSOW0N5X3VPu3BopU9WJyY4iW
         dXuw==
X-Forwarded-Encrypted: i=1; AL+hErF3wecRkWHXyj9RN+2YaC3VT8z92sNBxTQbj2YU+h3MLOjhodia4UtQPO0CL6ouxn1lulDWrWBmCwZB@vger.kernel.org
X-Gm-Message-State: APuU4Z9+xuNrMdiFgKZxT6NfVa8y8JuoO2TKkW1IpGXGF5gfkKFVjO58
	zuJpkNK5c1+sXqDv+YytuiOlHAQZRRkGnUGc/XNru+v3BybO5FH+wy3PlObURpTRNMivVoTs76h
	+8tMHIA5tMXZtN2lKV4rLMl6Vi3Os2H+m3tkDEhjnu5igezah7ZTo+jeKF2yp3TbZ
X-Gm-Gg: AZFdTZeYg+Nr/aoRb9diXg8EQyT3FTRLvNs+2WMPD5Mi53zLATZ2jaaq1uMGg1C/RCh
	6lxTkvu/K86/PHRNvngYWy9OhhpuQPkzMQFhoiB9dZgyrm0pp2IQa2bKIoaqYkUancIR+PTaAxi
	KlosfQLs6O1yXyOtz2G6I1bPDNzMzIOQQ/uW5zpnFHF+29FMXQAvlg3WAWPFkETdoEO37ncnwwO
	sK/i50Ne7vHKgI3j2PG4EXTCEgHXlYTBclA8KcnjD8LJjnflAybYe2IP2x5mYwRYwhFocaNUUfC
	Oq5O6YuZUbJN/tN5dkQK4hhxaaFfaL/oy2I8AOGKv8IKvQXjmLeCjxxxv5RAW9Irhnt4GeerX0c
	tN0RmCo79rE0F0kehzIIlTQEujCaylbqhXmeG6Wcl/Tj5ZhC+ljO5F8KFkpZTb0IknOpuOkujmv
	pv8Pw8mtl7hg==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-1b556850746mr19969272c88.1.1795502904862;
        Mon, 23 Nov 2026 22:48:24 -0800 (PST)
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-1b556850746mr19969230c88.1.1795502904030;
        Mon, 23 Nov 2026 22:48:24 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm30769428c88.0.2026.11.23.22.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 22:48:23 -0800 (PST)
Message-ID: <9298f3a5-223a-4f10-9775-1f7432938443@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:48:21 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
 <9ef9d2d6-5e49-d46a-286c-fa29e83f481a@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <9ef9d2d6-5e49-d46a-286c-fa29e83f481a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fyl6r8O2RbtrxNn7zQ3BIGXNaVw8TAsK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXz3qVoyq/XRVN
 ACh1thOfnjgEIFuWYGGmNTlaQ87w/2gpBScJpGFfNq5aW4lCM5D1LOap7bkC6+5STneLOwGorTw
 YSuJEW3vEbCqJOPlKe6be5MR1Mpv/S4=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05333a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TyWfFpP1NEjc3mOn3dcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX0Qxz+SBfNnOZ
 PzFcXqLvSeHNCk3Jiz7Q/9VrLh7fOpLzHRpK6fcedp45+CqaAQ0DwM++F4Mr5SW0L/v7osBnUZX
 rU0bBEV+v67bZfe4tuGq7mS2yJzumpcHvHDEHOnTezoSE0Cg2xPPSGDvBJw1m0dFX7l0C02KuAM
 Cj/n7JZ16hK7Tvu7d3Zzl/b/l8qBHX+qy5lpYuMyjGCnPOEQWJmYL+giMEt/92ailyHW72si6qm
 KiIwZQ/5M521J9PJd94ioHP6GwSzUczfRU+f4YuwWGJBlfIUH2tlHCNhv+Yc9s5Jow/oYJALlVE
 H2OEGhn6zpF916datY0UnO0Tx2jmV4qM18uPfcC68J5GkpEgih8IzrOZGrFcjYrlDxjsX9068bf
 83rYhvGUyXYtKMhPDvOrzKROSbL+O1J6At2bffQrdEgUzKZYEnTv6GoF2yLuKf37IHZi5z0oAgS
 TK/DKRF7AgcxHyKNkJw==
X-Proofpoint-GUID: fyl6r8O2RbtrxNn7zQ3BIGXNaVw8TAsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026


On 11/17/2026 2:29 AM, Vishnu Reddy wrote:
> On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
>> Add qcom,mahua-iris compatible to initialize the hardware
>> and necessary Mahua platform data describing the needed clock
>> resets and powerdomain tables only for one core, vcodec0.
>> Most of the data is leveraged from Glymur as they are the same
>> Iris variant. Firmware, vpu ops, buffer sizes are the same as for
>> Glymur.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
>>   .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
>>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 34 +++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
>>   7 files changed, 108 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 48570da56aa052577e05ead12bd26df090d97454..6c187d25980eabcd1c789b132e2f0bffa62fc805 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
>>                iris_hfi_gen2_response.o \
>>                iris_hfi_queue.o \
>>                iris_platform_glymur.o \
>> +             iris_platform_mahua.o \
>>                iris_platform_vpu2.o \
>>                iris_platform_vpu3x.o \
>>                iris_power.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 1024a2fd75a3ae2b7e194e583b91ec5f16e2773a..817b8a9e2712e7f1e335dbb8600dc033670c5cfa 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -58,6 +58,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
>>   extern const struct iris_firmware_data iris_hfi_gen2_data;
>>   extern const struct iris_firmware_data iris_hfi_milos_data;
>>   
>> +extern const struct iris_platform_data mahua_data;
>>   extern const struct iris_platform_data glymur_data;
>>   extern const struct iris_platform_data milos_data;
>>   extern const struct iris_platform_data qcs8300_data;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.c b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..14b085426ac29cf69824d1d0da142c026266a0bb
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
>> @@ -0,0 +1,44 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +
>> +const struct iris_power_domain_data iris_mahua_ctrl_data = {
>> +	.pd_names = (const char *[]) {
>> +		"venus",
>> +	},
>> +	.pd_cnt = 1,
>> +	.clk_names = (const char *[]) {
>> +		"core_iface", "core_freerun", "core",
>> +	},
>> +	.clk_cnt = 3,
>> +};
>> +
>> +const struct iris_power_domain_data iris_mahua_vcodec_data[] = {
>> +	{
>> +		.pd_names = (const char *[]) {
>> +			"vcodec0",
>> +		},
>> +		.pd_cnt = 1,
>> +		.clk_names = (const char *[]) {
>> +			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
>> +		},
>> +		.clk_cnt = 3,
>> +	},
>> +};
>> +
>> +const char * const iris_mahua_clk_reset_table[] = {
>> +	"core_bus",
>> +	"vcodec0_bus",
>> +	"core",
>> +	"vcodec0_core",
>> +};
>> +
>> +const char * const iris_mahua_opp_clk_table[] = {
>> +	"vcodec0_core",
>> +	"core",
>> +	NULL,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.h b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fa30f33c5b03b515fa57e52a1b7413406cf5823e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_MAHUA_H__
>> +#define __IRIS_PLATFORM_MAHUA_H__
>> +
>> +extern const struct iris_power_domain_data iris_mahua_ctrl_data;
>> +extern const struct iris_power_domain_data iris_mahua_vcodec_data[1];
>> +extern const char * const iris_mahua_clk_reset_table[4];
>> +extern const char * const iris_mahua_opp_clk_table[2];
>> +
>> +#endif /* __IRIS_PLATFORM_MAHUA_H__ */
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> index aa03f86d19453a2f3b314d13b7137827d6939a49..0fe485b360d2a9271392f6e5a397211ed94cf99a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
>> @@ -13,6 +13,7 @@
>>   #include "iris_vpu_common.h"
>>   
>>   #include "iris_platform_glymur.h"
>> +#include "iris_platform_mahua.h"
>>   #include "iris_platform_qcs8300.h"
>>   #include "iris_platform_sm8550.h"
>>   #include "iris_platform_sm8650.h"
>> @@ -90,6 +91,39 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>>   	},
>>   };
>>   
>> +/*
>> + * Shares most of Glymur data except, num_cores
>> + */
>> +
>> +const struct iris_platform_data mahua_data = {
>> +	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
>> +	.vpu_ops = &iris_vpu36_ops,
>> +	.icc_tbl = iris_icc_info_vpu3x,
>> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
>> +	.clk_rst_tbl = iris_mahua_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_mahua_clk_reset_table),
>> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
>> +	.ctrl_data = &iris_mahua_ctrl_data,
>> +	.vcodec_data = iris_mahua_vcodec_data,
>> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
>> +	.opp_clk_tbl = iris_mahua_opp_clk_table,
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xffe00000 - 1,
>> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
>> +	.tz_cp_config_data = iris_glymur_tz_cp_config,
>> +	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
>> +	.num_vpp_pipe = 4,
>> +	.max_session_count = 16,
>> +	.num_cores = 1,
>> +	.max_core_mbpf = NUM_MBS_8K * 2,
>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>> +};
>> +
>>   const struct iris_platform_data glymur_data = {
>>   	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
>>   	.vpu_ops = &iris_vpu36_ops,
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 411ef7ef8dae957fae1ca47131e84244e3306ba6..cf2e92f440351e7b0aaf19c4c71db90d8a2deee7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -550,6 +550,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>>   };
>>   
>>   static const struct of_device_id iris_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,mahua-iris",
>> +		.data = &mahua_data,
>> +	},
> iris_dt_match[] appears to be maintained in alphabetical order. Please move
> qcom,mahua-iris to the appropriate position to preserve the ordering.
>
>>   	{
>>   		.compatible = "qcom,glymur-iris",
>>   		.data = &glymur_data,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 375defbb959424df5a6b0033af6e267187f97333..e981c8f93318c5afd5ead162e00690a0c6054edf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -365,6 +365,16 @@ static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>>   	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
>>   
>>   	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
>> +
>> +	if (platform_data->num_cores == 1) {
>> +		if (select_core0) {
>> +			inst->core_id = IRIS_VCODEC0;
>> +			return 0;
>> +		}
>> +
>> +		return -ENOMEM;
>> +	}
>> +
>>   	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
>>   
>>   	if (select_core0 && select_core1)
Updated in v2
