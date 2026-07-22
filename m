Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF88349CC3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717822; cv=none; b=gdwsm0Tot/QpzQ++4wS3r49tYmUD2hX1lBrH5fmeB68mKnQ9zbUPBBX6muoYTvb3mwX0dhDjv0cXHGxHn1nnEsuMc8FSTCMi1E/K4OtgnSBgxeRcBHuQQqowmRdwt8ixjloeyx61O2nx+Hhr8jHs+hYgAG7nljsRCTXRuSzZGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717822; c=relaxed/simple;
	bh=HtBdW0k8163Z4bkF29Rb4GalgJUOap0bamAwc2qnmJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXgeIxJY9hie0Ra27X0CfORDyzkRhMnT17553sNGWuDgdGtak0+LQyK9G7aYgRrsN4XSoLqyHJXThFIGVxrUlW5DPlYgFkq2thfSNu2DNc+c7pCGf4RHQRqwlTZ54mcS/1LWuM/5CUTUycKbv0M6wlnBDD6jrRbwCQJQuqE98B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5kizwTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3qX3gFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5kizwTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3qX3gFT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9EBCk050337
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=; b=M5kizwTRKlP0HEaA
	vA5DdiU2TZqxaIj0ot5NdxHfHSItIYI2b3RPc10+STyr5HiUGHyaZB5qm5PWzTbG
	EMdBY7oiA8RtRJJAJ69nTGq5ftBWhd4j91Wp9ouKu9MeWoNtq2kWZqvBcvV6IsaF
	HzLCsov3iWnckNK6uN9y9P3+DO9m8hgrLicus93hakByASTlytmltxaBmSasgZ/O
	N4r+lbz4xa3tCBSRm3AK0Ha6zWjWxjTiDH53bjEdfkPrBzMfUM6+wt3Il2S15tpd
	fzzl26FhI6/OQfBvE87k3MlhAv1WyJX0UmU1hDmSUXp/wwR6NyRhl+wiOUvKreCI
	o5tG+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228dj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so237040465ad.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717816; x=1785322616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=Z3qX3gFT+uVV6z/jfI63F4QV9KZf35SzUkZzQGjUNHcMJCeOIjXwcXdhr0jHVQjUve
         SpuNiulZ8hmi3hohr72f7F+xF01NDGYAU7EEc+UWz/0KvYdvy9lID4JK4fSXm8svZUjP
         A0lKVvHu4eskpgXKzNR6NAU9Kz8mMT/aySm+rsllRqkEvSk1gyNqxDu75ZCFq5RjIYA/
         a1ESS+GFIl/DiHHbBFtAqVGThlpg/RE254MaHTMXINLAGy0/vjKX2v18oon+P9C7zrno
         KyN7YCS+wgFzv+pWWT+3AX+7HPT3bwbIyiyTqqhF2oTa590eDB7bnU7P4lAd7gv7tx6c
         SJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717816; x=1785322616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=UePrck6+999iVqPx6mrqaIwdqE4fxlrZ7nEa5Hx+AjCOePvrVS4+OfEmMkx8enKvsg
         edjWco9fyDl6FneWyZgMKV200ShxyndczhOBSHrf53ZwsRTnWCTy72NQRH1+x4z//34d
         bZNMbeuaVnZZM247Z7eLmOks9fmwf7NW21c/iXmvrMbkQg8zwvfrSPY0JPHR9IZ/o1Vh
         sUdPivnAhoUmhQZlK+v1UorXJ2rp5o48FXXLve135FgQl/sYLNETz31Vxizva5oJ4Mu1
         R6QylOjGh2nZouOxi/rLDjWPXsb9CfUEOys3OoSekyWUk/H6HLMenx7dvMestpCBXJc3
         gGig==
X-Forwarded-Encrypted: i=1; AHgh+RrTel1y4VWcENYqeMfC9zKas71KFJu+gKBcd0cnoTIDKfzjKrrh40iXuQanl2URrgA0r0JPKumNPigJ@vger.kernel.org
X-Gm-Message-State: AOJu0YykhTL5wefFB8fSj7GpbGlnIDroZLSRaiajpiNWQZD9FSMh1znm
	ggXmQXTJb5b57MmqtenYIxtGrPHIYagLOLJpkKg4TwZOOeEvlZigUPPhU2cZXRVPd9f7YkC6QwN
	f71RLQpWQxEhPMy3OtsSJkjTQ4Lmd5F2/peXXV9eQ5nY+093mj1SxQGu/Zjo/MHjT
X-Gm-Gg: AR+sD106fWSJvh+Ulc5f13joiy6QnncZmBrCqu+EFpL3dEewCOdLGIh8rGo9W2Kj5S0
	jhZgFeofTKIZ1TdllVVpa2Se1AL6wgL83J/rZOHGkY8qaXzxmaFra0yuhSFtVCH7YUrdXOdRiP9
	h6KZLNKgv0p5fE5cn4TFs2HIqY5APb8gXiac7pB94NAyo2DdihDLCEyL5k66zPfUwRpaXHgeLXN
	B4N91YE11S2VtTKY4ip9vqaoBbOnZdPsTGEwampkkloswHD5UzJiftWtBgbpgbMkpS/P6quC3wG
	4csSga+Wr+eJa2j4jn0qVS4tYOAyw0YQ+mdesFUZZGzzxyzjfurZEA5E4vEE0fgENst6GrBZ6M6
	Iq4PVXJ7ZmwmO1OSX6oYZgK58BW/5mDigtnpdXmR2Ybd6hU1vnJ6974GF3VRK7nJwAw==
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244223125ad.22.1784717816410;
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244222705ad.22.1784717815982;
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65e6sm12700925ad.38.2026.07.22.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Message-ID: <f958ce71-c8bf-4062-a814-aae3df80bcf8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:56:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
 <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60a1f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=PwRE6yEF67RGCJE-Z6kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DpOlIAKfdLFAf_STRY4Ucvyq3v0UGZNI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXxc2KuVy2VkvL
 v/OIisqHIb680DAf3owvFVdp9JcF2+0sngHU/n2vDHMOrnmA0UIKDeAldyGX61Z2WJa81a5/7cE
 m044W4+VLpui9nG/z5eQaQvB0A+HdHw=
X-Proofpoint-ORIG-GUID: DpOlIAKfdLFAf_STRY4Ucvyq3v0UGZNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX0EN1Dt/RmyuY
 D5oj7meybenxNhzA31ERCm28n7BgNC1j3YSZVqcQBvfZ4dkfuJWkJUmVDREhA5QgQHqXDbtP1AN
 72tUSv8AZfPtM98tlUVvn01kQKm9NnvqhsIQWJ5v7PpGe/LN2GzrZ4i8d+gdozcouoFdOvYEHf4
 NY9nDKda6SlmBA/SKX7gI8re0JqZ/Hko+w7AWlTJqNeS4oZDNpgfe6WcGQNBDIznor2/SeOufAO
 RLo8QWROxN2GjIZYsH+9tLrmKpcEiky8oa2QGkc5F+QIB5JP0EPK3Yim2q0Zlhbt37Bg6VWwr4D
 B37tgs8dQqEvxg462s0arTTK2mn3Yu8kcbUoWcadRSSbxWlq71WNaOeVJCdHdT2Q2iBDr7Rpb+R
 Dkv1b3W13BFa8GsvhVMzvYTKMrsZML1nOLxVaOkzjIPx5DUtMOMmMnbbcg6nrJ0Hst64SPGsrbz
 OkXu2362ZNf0nv4GZZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106



On 7/22/2026 4:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
> 
> This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
> subject is:
> dt-bindings: arm: qcom,coresight-ctcu: add Shikra
> 
> I already pointed out this problem at v2. Nothing in your subject is
> telling this is Qualcomm! Not even mentioning such trivial mistakes as
> lowercase shikra everywhere.
> 
> I also do not understand why you add so much redundant information to
> subject. Subject space is precious.
> 
> No, at this point you should not make such mistakes.
> 
> Please take this feedback to your entire team, so I will not have to
> repeat the same exactly next time.

Thanks for comments. Will take care of it in future.

Jie

> 
> Best regards,
> Krzysztof
> 

