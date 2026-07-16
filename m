Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A54156CF
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200347; cv=none; b=YphcQWHmaSm3qGS1INoec5qUSOv022b9mDGcqjQhmwp+nT/dwJ5pkFnadynkhwiUSs24TkbsGvtdTSicpE8xfWgEnl59tpYauCD0QLYIw3p97/MmhhzeJRKKqzSnw8mG+1umPEAiuRY67HaB1tj7nCdG3heNGu5gRW8yiPPUC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200347; c=relaxed/simple;
	bh=yzH3rj1qE1iSUDcLNaIAmbiWve6bqP2OJ+u3kW2gTLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN0y7cKiIplu/E/lhTBWXYX/rRrzkmz6yp3UYJNquGWIgU24Dnfw57opKVniEVfx/QHeS0ciPefCgQQI2fhz+eotRSRUD9UcI/7MAxe0lGkXqCl8MvsEpZyI+Nr9oqxNz7E0SjUvR2JQcjgF6OT5eYBqlVRMyxZu7A2giZSI7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXs5bHMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcbAR4Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXs5bHMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcbAR4Ys"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rccZ2415920
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=; b=lXs5bHMJOg36IFTw
	YHeHq0C1sRqamoqaV9r98QJULx1ZLHC3GM2/avlZ6k0pAmyz0y4rqRY8SeQzprIY
	Mm+SK0oh+jPzsuH20YT7DRxT4JjLAr3i+WCWrQpc2vxBpOMOdy0GWwF2mHrKxKhF
	rmVL+qLbdFb8AhwxOLjQSYbm5bSPL+4kp/l3/rklj2i98pFu1BaENR+oebUccaDa
	vBGnMmdCt8k7uLUsMGJA3lCdijiuHM5d/HW632TxxvW9TvAkYk7v/88DqYdWDiId
	FHVqIG6jYR+7AW4qQj9DZ5AqGjgIhFQJh1R+KpKTipc+Cp1kO3nRgVkw/1JtyJdv
	b7nisA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rh9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:12:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b57b98bso12596176b3a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784200341; x=1784805141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=LcbAR4YsIFGB2ZF/Ma6ir4k1P/ITidnyiGZblwsCG1DZ2HmJ9s9R9p1ghEHQFyBjoJ
         OneaZehxJui+/UD3+GryrBXvCefzq4SEHMy05QR4k2ueQgWimX7YUgTT/H/Cna4jNcpn
         ONBHj2nC6Qi/zwi+B4eYVubM/8Q6sjjOQjcYHwB8RK1O76uW0Quut+RIloajO3+47gZU
         I/0ODK+yjAC+Z9yeCGC6UIB9yLOo0YDP+eaQMmTJwkYhL5IOetytp8rVyHLznaMUGHOK
         5tY7vmTnB/xyfkygaqbCxliBkMQiDaMkfv/9ti8Xq/jaxWNmDx80Kvwe3MaJzNMzzZvr
         c7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200341; x=1784805141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=IrQVJ6xGs9cMGg0hjCefkE0KAvcgVT2a2Ba3DzA9w411Q0y7kvN54REdABgr/yvW7q
         F2Bf/DdmxOlic9mcjJeADB7YS75wHAz+SGZ+h0wzyA5uwlOu11+L27vQEMbjn5lU8X9s
         YUs3IhHERWRRLJ4jZUH4vQDKpL9Ze5gPz2QTCfG4C1MyrGUlsl0voQ+dKFJHCE7505E5
         JMvc2AAVrDZET9wlgwrf+JHxwbOOcvaES3/FvrsbysoiX28S/ilyGpbqDL7JCO196pKB
         RMdZtisnpzlK+XkF9Y0V7a3gLPCycPcrk+HnpClULQbvnsrD/md4romUpOCjGu3lrotf
         UGEw==
X-Forwarded-Encrypted: i=1; AHgh+RqQUzSNOhzb44COaFEhnWk3AbAX8f1TRpFLc64wvFMPBHQJJZFGcVYT4+atoOeDtlXMhe45bGVhWs5k@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbvxaJxBvxQTfYViSUgr8C6Q4yq5sGBD4Q6bXSWcct/zfpk0f
	LYREMzunnxo+R205rMnP50O9m2g0aUNZR/opRtc5lAvXOIH+HQrblaBw1KV+cKz5PBcDoyw+k2n
	Ki9hLh1EPHaUZpEe9Wp7S0ciKhAu0itFtREIgYIb+3oR3BbCrOTCGdskaa/PigJ/8
X-Gm-Gg: AfdE7ckco8QrM5Bvt9x6W4DPBOJHntUlD5t5/PqG1mOVvaTIOb1ce+IQDstWvDUkzVC
	UQLh5ZaJX3zKmjYvfY8HLENTNZaRtO9xBnWr/xHaQuoaT09u4B8fxPFLDFwos5/26qkJiO4v9Fw
	N7MPhgbMzU1xzhEBdcnneJzYjFmTUbPLq54I66mAnTBxR0FzF3n9+WMOiVAjRAV8IP9m1CaRx22
	Dpbaa6Mb9anvGFJDSNemF3h2G1y1BjDegeOOAGM5Ofz+CIBrIVtnrqKh2npBJYwCSpF660CT/Om
	x2NMSlbxihFi3XXYY1kH528M8F1YP0otJL3TcfFxqwuUdiRhIRmzfB7qiKXZdK1+o2nqizx+eZl
	V/YkZ7rl7eo9YtZC1iz0KoHapoCI=
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682710b3a.21.1784200340772;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682655b3a.21.1784200340258;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a5f3sm4578248b3a.5.2026.07.16.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:12:19 -0700 (PDT)
Message-ID: <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:42:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfXzAkW/yG0uyRv
 k4VUVzrybTcnHIOjkJ8E1mEObPE3ZtIu4FUIqP0JHvMW+hcWljF2y5TJwAWz/3lEfuTZ/eLqSoM
 HwCCyHFR7sN7xDyQ99gEsiWmWj7VV+CoCO+dSZv6oUQhIzfZWI7ZIKFFeu4renGlQf6G+ZI8/gp
 ijchRuxnP7o0bt2Uv893tw7Z3FNo5tF7O2F51g9IIirOW0jAYMM7RR+7PKmTcxZBTry2qLMusvo
 j7pESVNa9UnekEavfkAJ8xEUJwazSxoV50iftiXGUYl1f5WJ5w++khGEQFEJNZCN5iD8EZA5GFv
 y3qClcZg1lmawwyhKCVCi6gy2Z7rF0PvWpWzU1+jWLkHPIxdLeYADwaTLyhrmZEos0LBNujil6N
 PHE0lfbTguW4CLABmLJGS+fvv+VSxSo8h8YpEZipCSMeg/iIavcrmavkMJqFmOAdWo9wViUbRu1
 C4RsahDjZi1MhV6ZuyQ==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58bc95 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1U0sEZR_6ltlo9pre54A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: GlRDM8rrTq1Ewy0uMMWkqj1mLwq11l7H
X-Proofpoint-ORIG-GUID: GlRDM8rrTq1Ewy0uMMWkqj1mLwq11l7H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX54ftgydOR5r4
 OibIxeleSRKFtzUIZxWWCuUjGPQYFbTMTQ6BzT7LiqS+rD0BdKxnBeyqXbXlmpumk8/osIUN4rK
 8zBFHhlJTxCPr6D+UVziPxvYMsVrHIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160115



On 7/16/2026 12:52 PM, Abel Vesa wrote:
> On 26-07-16 10:13:48, Taniya Das wrote:
>>
>>
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
>>> domain. Model that parent domain in the GCC binding so the provider can
>>> describe the dependency in devicetree.
>>>
>>> Add a single CX power-domain entry to the binding and make it required,
>>> matching the hardware description needed by the GCC node.
>>>
>>> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>
>>
>> Abel, I feel we should add the 'required-opps' as well which will ensure
>> the clock controllers minimum voltage requirement.
> 
> But it was agreed in v1 that we should not add the required-opps. So we
> dropped it in v2.
> 

Okay, sorry, may be I missed that comment.


> Can you give more details to why you think it is needed ?

My reasoning is that if a clock controller requires a rail, it is
preferable to explicitly specify the required operating level rather
than rely on system/client vote. This makes the dependency
self-contained and easier to reason about. Clients that require a higher
operating level than the clock controller's minimum requirement remain
free to vote for a higher level as needed.


-- 
Thanks,
Taniya Das

