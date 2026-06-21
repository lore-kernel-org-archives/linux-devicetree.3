Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9925B0A0
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048776; cv=none; b=a33k9Ed9WiSwGc8kmCPC+n6FH1YJFEyiod3CIuIAfD8qN+bamSLTGWTBWpLfjjOwv7s9x+TAghPEMsMTyQHY5AIj2iloM0zSGCSjJlmu8X/p3YputsrgCEHMvTqAQ+KfhmUTkKrc0xNUbzRgY40jANu8kD524z6hvvXQm/m4Z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048776; c=relaxed/simple;
	bh=ipa76yU2Zw2tR6ryZjmIAUocwMFzX+D5OAP1yIQC2TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QT0EWhGDazBBEFpR7vR3N8Nztc1N5ER6azXasHFV/Cn0XpQGibe1HMEKsjG0FSkA7t/AkK+4kbDl+BxoDwipvjGxGMu/pDshW+oW+zCjWNj7gJe992k9k2SqTsxnqdv5I+XVACwhbxiZ51YCPdxla0+1QRxhAQRQZnwgx6P/crk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAX3WVq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcEYgKGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAX3WVq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcEYgKGc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65LBF57L2164429
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=; b=FAX3WVq1SoL6yjNv
	AQywfDqvT7JbCuHP/KBgkO+iAyKEtH5eNs+FS3a852P/F4jlVaOzn3oJvTuHjdnI
	614BgeK42S9XWXwt9Q4xxty240TzHc6VbbefLaJms7YWAIUTs2VVjBLZRPfaMlZY
	G5BJ7tQbqhhpEF5KVmwTtHwIp3a4ps6fCBG+qipT9fAeZSHydApbm5kJQvaCsq3T
	K3eGUzgdAy7oKH/R5NKfysI1O8LG6/ZbBjDn06uICtemjHR+Yx+H2K/u6W9YeIGM
	nx7A9hoZ7XQ9dZWP5RhazwwKwARkNEGxjpBvjOZs6lses1cNqUb3BTf4rxTB/cKI
	4Ot+IQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mkdh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:32:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4f1f836aso730376a91.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048773; x=1782653573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=FcEYgKGcXvFBl5ozOfEMTcxrzTrhkLgKAae51tab0ClLKvJvZIxiW7OTLtL6BIacp+
         cQU91kVWDA/zfO/0XZ8Xq3HAsPdQQGVCgA++mh1fx8wlAIfLLuSBpJ/A1Zph65dNIcso
         Nmi5wTsNSWHYrNVIuTwAMY/j7PHjUuWxHAqDjPKHiWk9lgib4tJbvuUcFxL62ptvsrPd
         zhtJpsfmWktCF6AMAmtmVygP/6vXE6S6X9FnPD0fh0eVQdzbcJ6jEbVdNgz8B/WEvUwF
         R+RUBPDJDY4P7uKXLPUtbhQv7rwieMMbwe+jQZoqaSs1XI4zMkfmpWH0VY43kaiyA2KE
         Uprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048773; x=1782653573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fs6NaHP7AmEMbNJiFexcpcvlroCJD3XXYlYKwSLAvFM=;
        b=gMFd7/GAufeBDTVIW4JKkiK63raxgB0dP5NQSubKRtx6OfmTgVtxVqInXYgEXxV6VJ
         Ht16+mDsaNUnK10x4N6y5Un8YwR000ySbVWQLo4zMfU2iT3sj0hTkVosCjWgvqYGH+bc
         Qe+KhXaHKzick+t7HSQ4VHn1lyPhKYs3I1htpeokYSCT5oF+iTwZrAz4kGeOiqcqCHyj
         /a0EQ9SNN365oPEQSr6qtF1ZnbFVV/sAc2kreyNhCcox9lJVYxi35FkWfrzCh5FR+LN1
         ZkGdS3rV2MNjooGJtP1RliTBgXiJKHqlxJNtJ9NehRBI6IQ3ylIX5Ulk+ATBCEqbwcWQ
         rQBA==
X-Forwarded-Encrypted: i=1; AHgh+RqQj+/fmeIAzWTqGfbH421w3Vpboos4HDgqsb+pRrw04yIY+nhm+RclqfXl0IwE03Vy7o91p2bCtAiM@vger.kernel.org
X-Gm-Message-State: AOJu0YyihfqqsC7Q80UoVqyrtu2EerlgpKxDyv0eNQaE+8Xq6E1W1IiG
	e0bNUB/mLjwGQiX2G/iYS8jeixuplESeSRAawgU9ey0OdcH49wf/VpeXUj1joEnO/gcwRST+bcr
	hQlEc36yJwsVhkfz+lFdpWsgcp+uXyvF56DNFKkaYcct6KWzWvm8tiBww9ZUZbgjB
X-Gm-Gg: AfdE7cm6qWMc8DbD620vCvm7uSHngOLGVjuDvbjx6YAf867tpIsZHxD1/UWyNuo/KlZ
	LLTvOm2Db8TzGrYDJiU+54uSCJ0uw2y5CC6wzXdTnNpFWBpVJXNzfOG31I4ZHnSRlImAcyn0W+h
	iV2+kp7kja0gVWNsKqk6suALqt8uc5gTxO/URzYa8MkQTbFG3FEMWgqqfwFqTy4IjGoGE6Nx6ju
	9stHTieGDrrW75w1rG8N7ZSd/69oE5DaloC3DVLycuhPmCtGuRgeLpycL4oLLRs9IqkdFq5T5eq
	J8cPaDgiPkknnvPH3cHytkMqOT32dmceRdcoqZDz1V1AkZWHEUY/bOUaNXa/8ohH/jaXaL5rBwM
	BYZRxoRrZBVHOCXrdgkYsRrn6ucH9n2n3JgX6foBe
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095815a91.9.1782048773229;
        Sun, 21 Jun 2026 06:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37d160e49f9mr10095791a91.9.1782048772761;
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm4527649a12.19.2026.06.21.06.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:52 -0700 (PDT)
Message-ID: <86441f81-05c0-4561-93df-53783e5b9674@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:02:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
 <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXzV85nJUJBxMM
 D7wuh3yBJ16tEPprZ6HOEPG+AcgmJTmyZWbvn084TvqZrSASUOp99EIM0EwNDiqPeyZ2sCLOGf5
 Leh7INxDvDMpUCanQFhrC3tY/CUUVZJry57TyaAgyTosLQxjbZMtHkD8vApvPfkGZRKLZAAqrQm
 hvs8plW2tO38zsE03dwXEIV9cqrcD/0BlqcMy/OEY7Q/hE+kXUS2PbpeOhJYl1JI3AdGPzD0gOr
 faVYNUMvrduN/E3gl3WXTml5WTD7+/YapMz64pfJGbop5QThrXUK92X/Q8PhPz7Wl1U/CK0VA94
 QLHzdmKgQwkuIt9b0cn3+Jlooo/myh3jvTo3JFmuFTA+5opzrlDKi1M7nC2x3lhot8dBOnWgszn
 RRFHi7zYpPkmBIpGFzMLICFa/C5XK/FuvA/AP6ozhKl8q7upjKsVlL483up65VaesUToNm2NKdI
 mGfSMR+8pZyH1a6EvBg==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a37e806 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r43F9ePfV2yG36ZfAfQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX/QYFQUaGnfqD
 esUC4tLHxa2DA2q0+3ME77OMrcj4QmVSE1EK1h2Y3Zbu6Du5ka9XKmA8aepjCLqnVqKOWYMyKsL
 8yfsSMJANQv2EqfahmtjUWyiyCaVW/Q=
X-Proofpoint-ORIG-GUID: vM6ZITH7mxMy2fv3A0kl3hEcj0yxtaH5
X-Proofpoint-GUID: vM6ZITH7mxMy2fv3A0kl3hEcj0yxtaH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 06-06-2026 05:01 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:16AM +0530, Imran Shaik wrote:
>> Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
>> values. Incorrect settings can cause the GDSC FSM to stuck, leading to
>> power on/off failures. And update the GPUCC GDSC flags to retain the
>> registers, and poll for the CFG GDSCR as applicable.
> 
> Separate commits, explanations, justification, etc. E.g. why are the
> flags being set only to the one of the GDSCs?
> 

Sure Dmitry, I will split the patches and update the commit text with 
justification details in the next series.

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
> 

