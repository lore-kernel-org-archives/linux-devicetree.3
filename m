Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B159242D67
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788135857; cv=none; b=Ib92GP+CW744yDatgM2BF0zpoDv1np6BOKszIQ/05Sv6aiIKX8eiqFzgsNxH6xNGPHB+l6MLC8FN8AB9vpOSlmqH36OTa2IXlphrr7sR+lf7BwaagIO4woxZjDWEOdFGK+JIY16bINfVfA+XmXlDK2BRu4p0MYQM6Eu1kZSycWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788135857; c=relaxed/simple;
	bh=6YIHXqDUJ/SGIN4IgKl1wQt+dbTm0xIWC7JpfWou+vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDc6zmpCZJXfrk0cVHFn6N1bieRj8GDGsDDBHahLm4Pep0+RhZQik/0WNcWrOnDbRkOfb3UV0JEEu5g9Vg6hylgg2O2cNaicDO+StP/4RF8ptzIZoCXtu7PGLqdqZy8iePdkb5bNF4wk3Eg1lstwxejklGgEgie4j0mi1Ulp304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5VVaw4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWpXMRtw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5VVaw4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWpXMRtw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UMfscC1139474
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=; b=c5VVaw4OCpzNF1r9
	/rx3hxU21bcsutBp4q1bbe6x5cdEAyumFaGvmaChcQI9aNUZ4e9G6N9twkWfNX/O
	k15NjflQvPOtvvKOWwYGlu0BB0NLhe4K+pxGGjbfLPP5s3AXISNCGkToXm0fC/H8
	xdF8bg3Y+//ocvowB5vys+fXG4UE8CnoTye5gJ3UOqPOuydmdczoGCXdyFmRh3Os
	f1Lm+7bnKW5MMIXdI9LrKmT2Vcuc13soVXdRw2JHX9BLMnDNNmy8+Z/CmwSXtVmz
	AFwl77Pd9OC3J3YLJPmjQ60mQr5t4STy5hsOlyIeJHvIH9JnS4QLkgiGOoLO+aVY
	lE+91A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq83sym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1428294a12.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788135854; x=1788740654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=;
        b=cWpXMRtw5mbwm9GXeXlG0ezg4uAP8XsNinwsDK859BLwGC3oLpDitM5ytGb2eCJag6
         02up4vROsPjYsCBtRH3eYUgYJNySYiwrec/4ZAun0JDYvXfwxBsiMH+RnHrBXiMKFftW
         UYELFCKGWSCzsgaZ1kglScbjHABrdsoZtTXT0VEeRebXzKHc2VZfjPnTQ9KfNmMTLEWS
         fnsTGbUMT49YVXyBTulazLCa+d+sEuEjD7h6aO3EcC8bxlBS8WfLiJF+A5poo7l/MMxi
         6/2wkdXwpgJaZCx9slrNCdoslLy4zsAF02EMds8eJPlUPtMIxqeE9OY20iTLLqW+i0Iu
         gv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788135854; x=1788740654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=;
        b=RAVLj+DHW8V6xUYEZRqBhPiaAMfjZZ757zu1etXSkOYix+8jXns8vYm/Ot/t+NqW/f
         KKrNlIjGFcvxkGYzBachDW4/smwSq4xlubCI62M3JdWi+QTSqnM9fXmFHR494sOAUBt+
         JIqNA7YLhTIaGotv2OGmPnGZMljrgIDGNc4afH8H0JyY15M4maDOJhum57VbaXXV7GA+
         qUg6L9AcqDlKr9hXiq2oxCnzIxuhTwXpiPAJFk4o2ippM3XdKBVvaM1fjXiug8lknVfI
         /XJrg4AEmE4jdinMlqiXhcFR6EHQBiMcXuvHqz26Ppk8nuzaYDWwg1z28n2O8oBwUhru
         xU4A==
X-Forwarded-Encrypted: i=1; AKwUvBxVWLXMQh3bK2myMKQyiKDHRA3OV+QfdqpxvSTLlVwDnt20PA3bitQb3FEbeCkgARCkSMsEyaggER7l@vger.kernel.org
X-Gm-Message-State: AFuF++kJO3kSOHyFTXjiEOxX3sfAv7C4QLRMNWpAnokowHFWSaZY2Oyj
	63IHLCbzKd6FbTLDRIGacDKmgJZDSBNAzNQdPzCn3OsIH3H2leWgzmvrT16YWp5fAKwyBAvThDh
	CRaVJDlqxm3A7L3nZcTjTLpUZONjM7oFCKhAZYfFC9JO8XaE8BiyMhGUqWUls+sRF
X-Gm-Gg: AYBFou2JEZSlXaKB/jvbjkb9AnOGlH01gmGygK8UzkrPlyUXqTz6df9nctM6T32odXg
	ay5mIvadFi8Pc5lSRXbMQVwSHXg6/lzk2IYTToyjJfKfMYbwwBE70wOwVLlN5oZagFIIZda+IsW
	FQ2wMRSuIfEjMpH5HU0L74/W3XLJiyy+Q+UAJo9BCLJhvlOe1lwP/myEp2WVcXqic1gcOL4mdTN
	wWVdzgr6SbmLyGl3CDOuqsp851gjjchRjXcJ8wzs1J6eART/WD4KO3jvqkXY9HgDorXYjO4Se31
	PA9bwp6wLYW/H7SaaghLh7aoPuNvseySgBGu2f9IPm5Hrxe4v7hDRVifhCHvuV4uHDBlWm7Ow/t
	VIZSMVyrOmgnac3qjbVsfNwp8uwYu6xzOZB9/1puFtnOTwR5RDmIbOyzz8y5TkMRKiJjfMQ==
X-Received: by 2002:a17:90b:3c8d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-398da58f3bamr4020604a91.3.1788135854393;
        Sun, 30 Aug 2026 17:24:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-398da58f3bamr4020564a91.3.1788135853797;
        Sun, 30 Aug 2026 17:24:13 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm18299048a91.6.2026.08.30.17.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 17:24:13 -0700 (PDT)
Message-ID: <7dc6b68a-db8d-490a-89aa-596d70d2638c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 08:24:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
 <20260828-qcom-spmi-haptics-v7-2-0367b3ac2e1e@oss.qualcomm.com>
 <cfa1d6c7-267c-4e9d-b3ab-2c483503a1e6@ixit.cz>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <cfa1d6c7-267c-4e9d-b3ab-2c483503a1e6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KEWTvamiakDjy9dQFh7fNdp83BdA-hpz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAwMiBTYWx0ZWRfX+fM+tD6kOWgw
 kpKOTIWqQcfAWyRRkLJG77K5MTw7h9jFt4quMRL4BvziPZSvOCV0RXBz2UTvOOR/40mot7+aXvm
 l7WsmJ01QFA8HAIo8WuScJKfpNgT1EI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAwMiBTYWx0ZWRfX1seBijODtA4/
 dmrYey/AKZK9LExQ/4S4dNXQBqoBGyVFqyFydOOywhtB6SRubJI/81JM+C6/UOQfDhVAlvowvPt
 KdEFMqGt+d5u3xnt6bn0svrgA0yrl3Kt+tHcQcCgdgkKKho5rMxnKQydYmk2N/eeNc8PgxYd2/7
 fWBiBhmINbosMiQn0n61R+DuBo8J1TIznnkkLvCWsvUh+8DD6/fFXcqy9k6WwMicSg6xHYqtaWq
 w6F+Cna69DpiwTw8v3bHTH8gUvG0EYQNCxqY85hJTAtZtK4h5l65fast9H/t69p4RM5akkJcJra
 VUcDHh7iKp5WQHmk/Jli9jRWMGNpDlPnmgB1dH3dWsHE2SvlbCiVm72e1uOqjGcdykZurky8sFG
 anQ+2QdfAz7dAc0Tta5sYrtFKzzMarL7+EulQUjMhQS+hjxQSw+ndARuLP/TetVrt3hFkH14ZcQ
 qERTUtJoFsRsWZWZxHw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94c9af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W9oJu5yFqjHUb1IVf5IA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: KEWTvamiakDjy9dQFh7fNdp83BdA-hpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310002



On 8/28/2026 8:12 PM, David Heidelberg wrote:
> On 28/08/2026 11:49, Fenglin Wu wrote:
>> Add an initial driver for the Qualcomm PMIH0108 PMIC haptics module,
>> named as HAP530_HV. This module supports several play modes, including
>> DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
>> and hardware data handling logic. Currently, the driver provides support
>> for two play modes using the input force-feedback framework: FF_CONSTANT
>> effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
>> waveform for FIFO mode.
>>
>> Assisted-by: Claude:claude-4-8-opus
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/input/misc/Kconfig             |   11 +
>>   drivers/input/misc/Makefile            |    1 +
>>   drivers/input/misc/qcom-spmi-haptics.c | 1251 ++++++++++++++++++++++++++++++++
>>   3 files changed, 1263 insertions(+)
>>
> 
> [...]
> 
>> +
>> +static const struct of_device_id qcom_haptics_of_match[] = {
>> +	{ .compatible = "qcom,spmi-haptics" },
> 
> Hello Fenglin.
> 
> Same comment as for v6. As you mentioned, this driver won't work for:
> 
> compatible = "qcom,pmi8998-haptics", "qcom,spmi-haptics";
> 
> which I'll be upstreaming soon, can you please use device specific compatibles 
> here, thus listing the devices which will work? e.g. qcom,pmih0108-haptics or 
> any other you tested?
> 
> Thanks
> David

Hi David,

Like I mentioned, currently this driver is only supporting pmih0108 PMIC
haptics but it would be easily tweaked to support other haptics modules
inside pm8350, pm8550b etc, as they are having very similar HW design.
PMI8998 is an exception in which the haptics HW design is very different
from the ones that we have in the newer PMICs, so I would suggest to
treat it specifically. What compatible will you have to support pmi8998
haptics?

Thanks
Fenglin
> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_haptics_of_match);
>> +
>> +static struct platform_driver qcom_haptics_driver = {
>> +	.probe  = qcom_haptics_probe,
>> +	.driver = {
>> +		.name		= "qcom-spmi-haptics",
>> +		.of_match_table	= qcom_haptics_of_match,
>> +		.pm		= pm_ptr(&qcom_haptics_pm_ops),
>> +	},
>> +};
>> +module_platform_driver(qcom_haptics_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm SPMI PMIC Haptics driver");
>> +MODULE_LICENSE("GPL");
>>
> 

