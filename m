Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8E42B33F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987001; cv=none; b=QXTv+TAyQTVRjpaK3ULBmCFOnYKn4qSz7r9NuEpXhfE8xrZOOZl3m3FsgXSlKt3vlMp99IPKN3p7RlAah9xqMhmrdty3WhdtFHBLwYoGM06BWeTUgngBLNqzX1cxoZ01StJbYaxr/hCZslH6cjHWysk7xYufT2+90iiU+jawGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987001; c=relaxed/simple;
	bh=XGpnaKbkzUa2p3KOJeURMXlv+E7yeceJMBpe/i+afX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+ei1k+KdSgHCj825aTvi+iesyW5bGXfYxVoJ+u7qWv7z4DlYxCD3lgdAUPE9pM3k68PZ8bQwCfGSPk85Pjc6MMrRDRzP6wU9AVM9gErwAO92e6010T0cApk1r5HIAJW8DW9C7VUJKAtaUPC5pnp26CxRfC5QzG7K7VxlCtQsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+/rs3Mz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7mARuup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+/rs3Mz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7mARuup"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iMxp3591746
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=; b=E+/rs3MzCH9NHvNe
	otUuXRD39oCtLyesfeGCpu3HCPXw3Y28nSlRaHiM6rGOQudjEiLTFPL0ENG3rdH4
	XPwEmbJ0F9XSEp932E6ucZ1TSZtOT/8vcEN1h7cLsyoqyC/WcmOf5qoxtjqr3Ad0
	3v4whlrnN2yQxMoK//WwW5Adz00VXGM/A858Ol68BmB8eTjc8T2jJBU/MdlWorBR
	ZiIL11V4mWSQoJntBZuXT9UxSj8+fAWkwe3NSPJPX4YSKLq/aDTEH+fKEtRp300f
	203mi3OKpszN6KntaqFyVzrarScL68CORcl3lCHyN2wuEgsotTLSL+/NIZZ4f3/H
	LuGYpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n96k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:09:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b3141a6so26497675ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986999; x=1783591799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=;
        b=D7mARuupxCNszz44QiNkKuqj5KgeADPVqGEOmRXcq7nIAq8EkZUGW7oA9FVeS7JkIj
         rs/OCEbdEn0eW6WC4mMCLDavdBk9ltoJOEXlZce84mnb+bfZfxFOJx+NVH9pdiKRE2Rt
         /eBY4I+0kynuDQ7aPN2aO6jpFUfe8Lirr4dH0lvr8spoThjbVbjpmdoE4H8T+rV7hlni
         m66cAFKr6eEOj0VcR5OJqiXwYPY9X1JgK6a2XaQwhlteeFFvYdlFU0TRbL4/M9a4j5RV
         wcjNPbe4dutTy1NZR0/1me8ljfmWP85zzZS21FYngnP+Acow7L6V4iVJuC+uTe3SCIM6
         jk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986999; x=1783591799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SiEZ9xl+02b9shIMVkNO87y8eMfhcAz2ipEbxm25/c=;
        b=Eg2qtsOgNKhPJro0jvNKp8zzvlxJJondpSoNAFD+gwmvuWtbBKgbdcYzx59z3Q9Evg
         lxd3w9aeuXTh+WqdE738y4F1aRbUnJXImWd8u43rIYMlRuF29DqRk3qWxbnNnj39egSC
         1WKJBnINbSDj6Bo2iMV4m7aasylc8o17+nda7GA/rCRyKgmiS2YO6C/kmpLSqQ6OMdhU
         mziHjCku+id26E1CE969U7a+WlFAPGBTSxcRTGg/SX5nOojxYL7gqJETh10QGTcCT4T/
         OLWDxUhgXa8/dmT/Lt8c8IL+070A6uLJjYI06Z3CY0k5FmScQ83lIyk8SUBp/9FpIBZV
         65DA==
X-Forwarded-Encrypted: i=1; AHgh+RquBiO5r1oCUlKH10Fhjad+UdiSdCLRx/i65JcQ7aSoc3oi4bscvRKugXLRpJXiN53kzT2bfOasJJL1@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYNZxdSPr50sUMFJJUz8061vItEYiCqGgav16oFreZU8WQGWf
	7ZQjtvoZXVFdXnvgSftDt5SeUBFpHnfjLx2fZGL1Jwo3C9qU+I6Vg2xK3reeMSkocrUK2hrTODL
	rlHz7a66LNeOKO674k5s9yhwCSnevLSY1cvbV76XV27LmUXwCz52niuYptHM60/OS
X-Gm-Gg: AfdE7ckPUiokYQ9Q61+eX6LKhSmFYVdHpqaTMD0MsADS7vkjvk1HOdZar+g2T3PcXro
	k0frTx4slyidR6g6co93NqH5a67Lc18c79lfdZifyWJCOb6MWu6GqrfOS9WG4BT8ZiNRe3BrMP/
	Tm7wVCF+AHEoERaYgJ3YGPULjNCqn/N07mrWdcZQjWAMjd1UOA0oCogE6ibKWBlktP5+IhRQksW
	sqBs4Su7w48LzTpBMit6OVFDbAPUvRpHZPE7gpXx87I/GSJmr0l4z8uv/KL7/aCce2BYUsrhwpJ
	FVJxdIiHdt78kHkTrrZcux+l2l0tmdPy+zZ6Ofjr2mrP6Rcl0mMkVg7yoSRMu7cqi/9X1pJ3qHp
	+jw1XpA/kIJdLBRS3dw46JFTVdJ5GQ3NhaN3WVj/1
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr57362255ad.3.1782986998732;
        Thu, 02 Jul 2026 03:09:58 -0700 (PDT)
X-Received: by 2002:a17:902:cccf:b0:2ca:329:3da0 with SMTP id d9443c01a7336-2ca7e682ae3mr57361885ad.3.1782986998206;
        Thu, 02 Jul 2026 03:09:58 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8fc200sm11364315ad.19.2026.07.02.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:09:57 -0700 (PDT)
Message-ID: <fbd3c1d6-2142-4268-b88d-898850b0e5fe@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:39:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings
 for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
 <20260530-funky-mackerel-of-current-878e2a@quoll>
 <6c06e372-85b4-4207-9bb6-270bd654c287@oss.qualcomm.com>
 <mcn4ysrxrfqo36tr7khsxnjase3priskimkgxuacgma7jcpa46@bgla2znqhyfl>
 <9448dfe8-4d9d-4344-be2b-ace371c37975@kernel.org>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <9448dfe8-4d9d-4344-be2b-ace371c37975@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX5XuM81g+/rz7
 HFiV1sxycEIQVp03OZCQHPIu2gpjfCQ02Mrm7J2s5iuyLlyqjFmgos43Y7qIT7oeiqrctuNPYbR
 6dEQG8D93wyUBDmVzmyCXqU+r0lmkzbwi4QnBrVvTHY/pmfC7k/4QpyFz0FooPx50YiFg1kKAlx
 ZLQGKuoxF+WQUdR9SbFzaApWZsVXwLGeZ1SkophEmCKpjvflLBj0A9UW53k4iSrVnv1Ms3n5/1I
 1pTua68iwb/6cllcQfUA9hSgitw+8HR0OFLkuRdNTBZGR3TAwo73SrTD94NsU9aWHkUwr6J2gPN
 kWuSG/1cTcRetvV+aH7tYnCxaErF3n0Y77kFcKJLFAkYIMz3oKY0ghHgs+MJ+mOrhCTgpKpbcad
 WGxU3+bk5mhrrViqeikJicpaTbcVnTWSF2hIqNJohm63hKfi8G+EdlTMMyJWyu9mpm0M5Lz6iIX
 TfEClmzL+PqmiOq37gA==
X-Proofpoint-ORIG-GUID: wnHaa-BEgORhjKBD9egldjBbv33Ac34y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfXycoJzpEDgloU
 RDHEKVzeDNf3hwHD8I8L79vQJQFho6Il6fC1rjIzDuC0AvxdJwmcKYn5gPxYOxYXy6UfyMizv2C
 jdQY0n2FkQgCQ7PG5D7DlzlUPzYdqs0=
X-Proofpoint-GUID: wnHaa-BEgORhjKBD9egldjBbv33Ac34y
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4638f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=opGXe0OTB6Gl6oJtH14A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020105



On 6/1/2026 1:49 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 09:52, Dmitry Baryshkov wrote:
>> On Mon, Jun 01, 2026 at 12:50:00PM +0530, Yepuri Siddu wrote:
>>>
>>>
>>> On 5/30/2026 6:04 PM, Krzysztof Kozlowski wrote:
>>>> On Fri, May 29, 2026 at 11:23:42PM +0530, Yepuri Siddu wrote:
>>>>> Document the YAML binding schema for the Qualcomm QCC2072 UART-based
>>>>> Bluetooth controller.
>>>>
>>>> Where is the rest?
>>>>
> 
> I repeat the question.
> 
> 
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - qcom,qcc2072-bt
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +
>>>>
>>>> Looks heavily incomplete. Devices do not work without power for example.
>>>
>>> The module receives power through the M.2 edge connector and manages its
>>> own power sequencing internally. Unlike bare Qualcomm Bluetooth SoCs, it
>>> requires no external voltage regulators, enable GPIOs, or clock supply
>>> from the host, so no power-related properties are needed in the binding.
>>
>> If this is a purely M.2 device, then it should not be a part of DT.
>>
> 
> Exactly. And even PCI devices need power sequencing, unless this is a
> simple (BT only) device.
> 

QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being 
upstreamed, we will reupdate our existing patches to align with M.2 
power sequencing approach.
This includes aligning the bindings, DT and also BT driver changes.

Thanks,
Siddu

> Best regards,
> Krzysztof

