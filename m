Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5414B7A5C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003879; cv=none; b=ZncQL10LhZ/hmT2hUZq2RhoeW6uqw6wuamBLqYyrNJAZF4OK1/xrSB00M1sIzNKZvi1JTYaBlJALQ1MSMIixlqQhrUV1aVrBuT/87rSjJogF1qZrwJ2/k13GVIFNH+Ae0Msbpzo7JhforGU/y/JRc7FqUZ71tCpXFUsjTHXoshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003879; c=relaxed/simple;
	bh=wL7ViQpOBQrR1TFI9V+XKos7/PiVSTRxCqAW2yNVG+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvr7Qbm5lehtmlw1AQjlaTP2Jnt65a8hFttw9AL55kmi8nRBRRbY7XDemV6BjBCjkl4iarZ+qVllJb565hPyIoycAeHtEX+k0kSqYsLxnKLde4W8NdmmmaFmooz9vjmwqYjZIifoTenDoaIItQd9+g65qIJyHmWYe7AZIuin0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEEDJvvn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4chrIRt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEEDJvvn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4chrIRt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAagA2012793
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=; b=jEEDJvvnSuuAqf4k
	BOCUoTtcZ3OXaYsV6vhNRuyrhmvayLSeHO6i3RMbBHL0C7eXq8L6Bg0LRqk1gPZF
	zIh3OpoalkeT0DtNt0Myo1ZORVe8PlgxqkYWfSkqHOg9qVaxAwNkznPhF93TDbnh
	/t+P4LiHBRSB/MMDhl1XkCNw+rMTg7b2OOySb3LRPRlR0gRaOuU/AA3JM3qYIe/B
	DYhJOhWDnZr28JyD/bQGwuOMtZraVo4Gk9RpvS66XN6u8p797aSFcYMQFLY7StBR
	FpxHsu0HwoIGf0lvYVgRvNLBf3k84RjjGw6KTRQR2i2sycRev47GDDAKpY/vP9Ox
	qe7jDQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1xjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:17:56 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso2503858241.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790003875; x=1790608675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=;
        b=R4chrIRt8mprrvBaTbFNZGWUwWGShiQmAJmOxvVaiNZxcD40HBsOYUJCAZ4ysNooBO
         PGjbnxyzPjFBJKo08YLyOBuHCa3fjUtuMONT66f8pNrxDP2CLhtSEuCsWaEsKxRMSby7
         jdzC9l/cHfqgfwgJpXgYjdhabhNMhtr8cv5qOvjLqGwlCBqDzvp4jdimYj1Up0b1srGz
         ij0jGcrL8bPfCvawTycWU3CEbsW4o7HBb33n+yY5o1Fv5sxLM85cGMZVvfdoiE324L/c
         +H3sMMezUsvX9KxuKFmfRTJ5cA1FMSEXSPZajR9fzSp3hpLlMNSzMTBT2ajCrJXGcoIW
         Wfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003875; x=1790608675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=;
        b=X5T8lHQ1KPIfpwpoJtS9VEhI5WSubv3RIOgGN3HeWKRhBQ8gdmTN8Mfx5l00N0sDdd
         yrxLspy0ojEAzRRJfG/6eudjkm1qD2Vp23G5S/So6/3JL1yTOQ4KQBYQWGJN2SJzcAdC
         o3gxaZtelZZDFnG6yY+NUfVZl81ZcG5uw3dxNCu2/32rKPcBVRgzxMzC/bZKGxlhV+Pm
         9jpcW54alc8Dd9aSWca2WDfGPKgy0ASebzXW6az8vtsrLC06wEDAWnyjdbUZyM+oFEJp
         rKaEIf200gZ3fg0Qtvogrhtr73RV8nqFM4qStrxDXLHY11klyZWxrIveHh2wqJVSAJ4M
         rcsQ==
X-Forwarded-Encrypted: i=1; AKwUvByhbKeghmm3Q4wXjEPP8RoQn7anbOh53ODQHk5LrD5nTgWnqHXWajEZ5TRky0CmyRrqnLLzOfa+997j@vger.kernel.org
X-Gm-Message-State: AFuF++n6e3CfDbcF0Ui/Gnh7Ym06Qg4R7LChlaw8mb7kKecHrDU5Kfa/
	WVrIuPZMl/V6NZ/WRvlCiTlxWJ2EWbJBYYQ2Iss9PgYQcCS6ICeNc4ZF33Q2mr6aL0ulSoTeeEY
	v/6T0OPsCSrbbT7jvBA4o1FAGIXVCG6ZIc1vbgKNBUss4O5mMXozy0ocqEqGfXVTU
X-Gm-Gg: AYBFou23rl5bdaDy4vtg0UlJ8c4GcqKobziFApNO80k+CfFWLyfi5XYG02wV2O4sHj2
	23xL6ajtmu8K/haYks8LTDxWglqbAwouxFjTkM/2vP5gWwXOPGvMVjrpu6wzTUi7o79Rdur5gWa
	MeR1UkR0Hi2M73EXzOirS24FARIm5viW4qdhnHfKDcSYsMNr+3J1Q7mPVOldjqPZFl5pg44oImb
	yt4gXEUG0KCYS0wlcD33CqiDBtGeggPPMFZ5T00wUy1vlPEQnC2joSDEdP2f1G9p4zOzSLhYlqS
	A8U0DFzqdAeUCiam6M3xNJHmnPVK4hpnZWfdUhomf75vRJVBbZJDbAHk2O9PJ2x9eQTmUg/Hhv+
	zvnheZhz/G7BP+GWH1b+ouSDQC9Dd9qsf4tedUM0r
X-Received: by 2002:a05:6102:5123:b0:7a6:de9a:f4f1 with SMTP id ada2fe7eead31-7a6de9b098amr3369140137.27.1790003875418;
        Mon, 21 Sep 2026 08:17:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5123:b0:7a6:de9a:f4f1 with SMTP id ada2fe7eead31-7a6de9b098amr3369092137.27.1790003875011;
        Mon, 21 Sep 2026 08:17:55 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm630198645e9.4.2026.09.21.08.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:17:53 -0700 (PDT)
Message-ID: <a51d8129-0167-4b9f-89d6-9623e4d41c49@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:17:50 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
 <20260827-adept-traditional-earwig-e2c8c6@quoll>
 <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
 <07aeb266-927c-46f6-8363-f26fac7e3aab@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <07aeb266-927c-46f6-8363-f26fac7e3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DctjFlUGXvnKpTuu_remdu_eUTU7z2OR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfX8e/Ni9ExP7wO
 poI9h0qUcspFCBPJhj9Z61BzIKEBhkBIXUXd617sP9z4PVVqBlFpVbOK+wk+iokJQ+gqZxWVVKq
 OJd9dAjiwpXjIsY+bl9Stn//FTx0C7w=
X-Proofpoint-GUID: DctjFlUGXvnKpTuu_remdu_eUTU7z2OR
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab14aa4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pKspbupdq_hDdIdxj9MA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfX1Kh9InCVeRzA
 McmuHB4pEmkZ78+/UjARFQjJyxDWJVK6S6rxe+3e1BuK45VKfuSSTRJoVC0y+4ci86q4lnHDryO
 kwkAezdMK8wNSFHc/8c07GXrSomuCbGzarYyAgj70QG1gVkLnLA5G5eBHNR7fPs7ytiHQ1xYdlc
 fMQ6turCzCU6kAijSQ7Y1PQ23HF85e7+5lire/aofbwSRtkn+RlVhS/8b0fVClh60X5Pm1nKDZj
 bU8n4Z7gc6CnnIC1qMQ//MDQ8nFEOmR71c2syfFc+/82EPzk2cpzWhPpKa3H2ffATvwo4ONuzsW
 VrQSEyeI9ve8pEehob0ywrroSEnsT8R+40CIPpz7LG8SAic4Q+Xoqdy3NddLmvb35Mx2v1nBJxj
 JQz0XwSXYtPinCyBHxWCBfDbKwa7G3RAIPLRsfrKRxL8/Bf+Y2TAMTEc4L9Aa0VxNJUd02nw1Yk
 jXPOJBXZoFRogrjqdJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210222

Hi Konrad,

On 9/21/2026 5:17 PM, Konrad Dybcio wrote:
> On 9/9/26 2:58 PM, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Krzysztof,
>>
>> Thanks for the review.
>>
>> On 8/27/2026 12:25 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 19, 2026 at 12:32:10PM +0300, Atanas Filipov wrote:
>>>> Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
>>>> camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
>>>> calls from each consumer cause a last-writer-wins race.
>>>>
>>>> Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
>>>> icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
>>>> set() callback converts the result to clk_set_rate(). Consumers
>>>> encode the required frequency as peak_bw in kBps.
>>>>
>>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>> Maybe those series should be marked as RFC. The basic idea is to manage clocks as interconnect providers,
>> similar to this change: https://lore.kernel.org/all/20230512001334.2983048-3-dmitry.baryshkov@linaro.org/
>>
>> There is requirement to maintain higher clock rate on source clocks and some place to aggregate them.
>> One example is camnoc axi clock which is used by jpeg, camss, ope and maybe other drivers.
>> The interconnect has already functionality inplace to maintain higher
>> bw per request which can be used for maintaining higher clock frequency from requested drivers.
>>
>> One option is to use already available icc-clk provider, but we have to add many icc providers
>> instead one provider with many ports.
> 
> icc-clk provides N clocks, it has M clients voting on each one and
> avg/peak bandwidth aggregation happens at the icc core so this
> should just work - or are we thinking about different problems?

That is correct thanks for pointing that, i have double checked, please ignore this series new version will use icc-clk.

Regards,
~Gjorgji
