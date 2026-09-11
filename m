Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B44A3D28
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148822; cv=none; b=rpoI/mpJoVhgH/nSy5j4vESxN/8DLZ/U7l5OL+uM7iYtFM8vHdmhRs1oSxKezeZE7Ysj4NbpOgv8u96EtBnwpOof0DdmYnQJFfusO8/9T/qXmQflW+6P1XzsPoeqfOis2Eeto2R5QDoGztI3fobcS6L8vS3kCtk/PAkHD/lb12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148822; c=relaxed/simple;
	bh=8I8OglRCEAVJH2OPdrvFUHnij1NfmtFjfc83aLX5lcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL7CK4Szv2nVifmQzF+1ylXZUdkRYR/qrG+9mcfj8gZR/A0569t5e9RyNsE/99Gp0CP0GZOPzvXGwjoeD7LcFDjOCulojyCgpakzVwktgGi60Ffujp79NhL0aNgrPpSXkv9dZk3ERWueJqM7LoU3EkRi5QwlbTxJWpfzwePvPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMEf0DKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aStyQNVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMEf0DKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aStyQNVe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWPAU488002
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 17:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=; b=hMEf0DKgaxDLZHie
	OQN47RZMrFw779TQBk80AIqOD7gShUZcM6LuGVYVYAA4VtcEJiHzyGddDcBg/Ddj
	v2YS5fwDp6oYrrWwFcE6d0D+00mLZFJh/tj3F5orftjGseMWWq97HhL67aMpFjw5
	EcVpOGoHdHpDcEWTmvddvRGY3MrQBRVXqCdalF9O/bcY8S82IHvSXsyP0oGBUtmq
	UW+Xb5ZmposUlivB2+JJnyCE7G0HT52sKdkOC+g7mHAvdWjps5wXr/gtIOF36QuM
	zcS4ZvTHWJDT+uoYQVSghvWfgMU2F38zCLXejEuLd93NIhtpmSh2OQY8SfEHEujD
	9LdOCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e8mpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 17:46:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc2229450b4so1037574a12.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148819; x=1789753619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=;
        b=aStyQNVeSTnIGFcJvuCnU1P4KKqg7FIai6Xvm1e+GF7Cn4IgkXfuf4spLogwEsxKM+
         y+7pkGfkWsAKA1Xinnl0Hz/4pvACK4rrOjMo52iDpyaNPLsDWQaPxkdccbHHQRlN5H/f
         TiNT2uPQ13CgySKJIkHC3fdVY8xYUVH727iR6/Kv+1HFx7Zc5Toe8r5rHcIkk9KiNsuI
         EMnCXCdaNPuQoDwSN2Zmg0YCVpkf8J285GlHjxYedzbQYEK+PnXU50BL3V+v/vkeW1E9
         rI+agDZOCnpJGs3CLiz5JJ+sjeVvtoi39QAHqIQ1W3EtoFFflyO5IoxNEuNpdYt7BnCr
         nVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148819; x=1789753619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsgmAPw6yBdhTP5tdUXY2KIVjFb7ZoZOJkT3weJPqcg=;
        b=is8t5oyGHj1XC7IYzMpiFDHpa0c3BUTYfYM+bOLdfRmNA/IN0pKTwHFAToNlcN2k8r
         oaadzudvqXvS9zsd/W2ASED3TmFpBtbBSaHZ2rXpjmPZ5vqVU3V1wXDbKLQODyv98Bg1
         mXrtXcxiENs3UOZs+0EDpfAFh4A/A1+0nbQGok96lzwE0lAILalwuCzF8FYz6YbZVAwA
         HcXSDPwmSGJUUaOhYLpkioHVsyRHcyE2Zv0ZEj58pxN8GvRR4mGHOAfqSA2yCqmV9tco
         fh68A3vW77Dra3rvlJVu7jAYWrl8voj82nkzLbKm5gFSgkWR3dO40cQqFJbr7Dxk3Ajr
         4moA==
X-Forwarded-Encrypted: i=1; AKwUvBxC3/8gmxKbrgkwvEusnRCMuzJ28TIwgAwPN/FUrQeewPWGFYd2Ck078hdjCFRHp+Mhrz1lDLJ73jpx@vger.kernel.org
X-Gm-Message-State: AFuF++lEq0XBDTatH3eKuCsLwgNNJ4/2YcZaJTHUeA1C0s5/1EOx2MMF
	Gti943WINN9GsvmRcyvDk69NdB5DR9whefj/EZR7tcAzZfcks/1DrEhrlqsXuFMx3FQyDaO/EuJ
	GOkw8begWahRnZoJHxxrw4IOeVThv7aEPAYHRPHLdEm+ZYcHtQPw7n/oKHsnv3RAw
X-Gm-Gg: AYBFou0iLIyJY0Tud4ErF141bEDyRtHMx1tbS7aXGroJguhvH7Sj8sqM0n6L1epzeYi
	KS/idMykjI9VNkxwQxAHhCaERFZeUwfpdyE7JCr9/nlODMww/77TGH2D/d3fupwy5CPMIPGjNVX
	6TuM/rRhhiWEiNtDCiVTOAMZ3FqRPeh0a2kRgl2m+usESbe9AkbewdiFijJ/1bTeKfR5xajIj/X
	FjZ+/mw1VDWOZGg2ABOOmDIsg4gkbfxkhhxosCk0DaJI11gTB1U/ri5qyrbm+CodsdISZKBitL8
	S38DqHxD501y5wlgr/0Q2XnHoFfiA9dJod7lkTgi61zB3pxwHDU77pMiSl9o6OF5CKp0gQFKuCn
	QRt4P6hB8tITA+zfVqEmIfEV4/mh9042Ojew=
X-Received: by 2002:a17:90b:2f10:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39d9becda16mr9589991a91.11.1789148818587;
        Fri, 11 Sep 2026 10:46:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39d9becda16mr9589942a91.11.1789148818123;
        Fri, 11 Sep 2026 10:46:58 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5182fsm7928959eec.9.2026.09.11.10.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:46:57 -0700 (PDT)
Message-ID: <fb559fe7-2e63-4d20-b0be-ff788e742cfb@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:16:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-2-2fe43ae45495@oss.qualcomm.com>
 <20260910-gracious-angelic-frogmouth-bcddc1@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260910-gracious-angelic-frogmouth-bcddc1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfXy+NOn7BlOHv8
 UgaBT4U8m/dRvdLuleh6oBlaSeaD8f8prXV1Pla35oyVi92aSsy4rsH8azT3Ntme+7Ou5tUKcH7
 P+iQ1sps5MCcz9XnO5ve3N64yycXgpeGKvnQj8yTxY6tdp0Lew3EnPFBLld/+mhMwKOx/tAWmT5
 rm6W+FRKl60cfFDfgq7y0S8D7euBBm47DVrYeHTNIGG2YU2FfChFdbDo6TtHRT4m87RjSL1gUXI
 HcfjACOhiNoXS7jtwiGKpXkF35aCcOym1YBxFwgUi8Y2QxmOC0+KYevWgAiLcfSt9su6Cff+zaT
 /t1NU9sYSR2yCsvPlBOnFfAlucUBFXlG0p8XHVlOS+dSzcEAe6P3V2DOuVnwcbwAbJvRQZnBBW+
 FVVCFM9EEPWXd5vPv1cb8L4E+lEr6lyMzXgIqaSLUigjdQ5aZ3VK5NCNdwARzO7vWlsjHQTf0Cs
 /6bqjSsrCFxPcASS8rA==
X-Proofpoint-ORIG-GUID: EcDBXbUBF1vD9g3AYggx0b2_SH-xEXI_
X-Proofpoint-GUID: EcDBXbUBF1vD9g3AYggx0b2_SH-xEXI_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OSBTYWx0ZWRfX13KQE1HZJfds
 5nQSrYPDLWWNs9O6aMtCJSJXocyIyX6TLJQELRkUwiO72HfDGRp8ba7MO1fRj3KfkCRdUpryZnt
 Q/mGYyjLTRKEwmca8kyiwvHbTQaQY6M=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa43e93 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=K3eY9hOJoobCHU9vVZQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110249


On 9/10/2026 12:30 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:27:09PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
>> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Given that the address range restriction is for specific VPU stream, it
>> should be ideally be moved to that stream. To achieve the same, a subset
>> of streams is now represented as subnodes, so that each can be
>> associated with its respective addressable range. The design was
>> discussed and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach was
>> later concluded to be a hack to avoid having subnodes, and was NAKed by
>> the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> Update example to the subnode form. Doing so, it picks up the supporting
>> properties needed on the video-codec node, address-cells, size-cells and
>> dma-ranges to declare 1:1 DMA translation into the parent. Given a soc
>> with address-cells and size-cells as 2, update the video-codec "reg"
>> accordingly.
>>
>> This patch depends-on:
>> https://github.com/devicetree-org/dt-schema/pull/207
>>
>> Tested-by: Daniel J Blueman <daniel@quora.org>
> 
> I already asked at v2.

Sure, will drop the tag and dependency PR will be added to changelog.

> 
> Best regards,
> Krzysztof

