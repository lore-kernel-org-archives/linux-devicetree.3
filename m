Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8E13CE4B5
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856077; cv=none; b=feqpbvPilwHS2ZnBbWkjVJNdO7UM9/kRl2fl2ApaOqepO473GRFKpAvQA0AjC7cnbCYDygfB6UN2pPh3LIGUqCkkEOUycHvlbwcB86LYsIb3xwbe4P6ZE75IAI9u2Xq0wtnt4VUKFUwAh9V2xYn8bssGJt4p1Fatc/xZ9Ye+tg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856077; c=relaxed/simple;
	bh=GvkqJN1YthsBywTxjCiEzmsztbM6hId164sRjCpat0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/8TFbTBpguztsuMMnLYwxhOdN742qi+cshOj9uLKdMYFsn/fMLGVQKRLc8XOZyHzIIHT0bqCauhMAwkoLF2e8SoSh3I7IPZzWfNmMkS9DRaYVmiheTMCju8NXI79XkmNUETyVb23UhFQo5xFYIMp5woU+jzX1LTy1RGkFYqn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER5b1eBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXKvqWyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER5b1eBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXKvqWyV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98KsB1080558
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=; b=ER5b1eBqYqMigAei
	yiiRlw0lYkLzdbUTF7XtVd4aXOEQgLyUXxeSCikXKOaNp8aBFJ1mD9nQa8yVUhfg
	Fg85nGccoPnHpH/KpflnfUzCGWmBxirvwwa0CMOR8Q6AMQ2HWP/KnUPC10UGIMHJ
	A04Bpbniaipb8OaMae3yhkzzPVcIKJWvlUoEDYPWbdj3aKz1erlW6nCe+QDT6liB
	W5x1rJvIArCKCSXLUguIoYLXYxNiXDC67xShNaxbxn0Z3W8y3jNKy10S65/shx5y
	+rthp20A815ccwt2SLGqiTQfRpfXpcYaiisZoA3y8fl498qS9zyZcFEAWIDGc0tr
	cJLHSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng34nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:07:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so8492111cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856070; x=1777460870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=;
        b=iXKvqWyVDtFBPn0NpTn4wbwB8zEVrWY0uTKwumCGMpZ67pxAfcTB1SGv54Mtto+6x6
         hXMKSlCrVD62weRPY+uqPgIQzq3O0UGfFcSkJCNdaTyMgqFSudvtKbrGfvpZgRUeXGcz
         eXqtRZBS45wrrxCJZ3PovTdFxetXPSsA3PFmpcWvX4/lW1Qib8M6j7bkpb7mB+eCZJNi
         m3Hp1baD/voFEWPAICANw8Rs3AEH3mvXsk39qgjnkWwj+WiJsmxa+jMTOwlmhb/bh+dG
         Occ7B4X8SleYiroNOMGRNqWiKVZX2CV3zew5L6A54Xu330LkxqTcpkxHh5rDnqHgEJdN
         /sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856070; x=1777460870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yF6cDM//syCAxlLbvPLBHd4DvnMH6yQ8XkjLoKOtcJI=;
        b=Xn8APmT2DpGA6XI2zZ1+Os8386jz1RoiiX0ZR7oNK6DQtd9HxrDisAxb68qqhy50ex
         xViDJGMTxRZGebcShxCCAioZTPEpsaV2JclwlXRRmvzw7sYBhOMCHQvgQFKvD6r8lT9M
         MoQkCzCuSMGzS0HWz6OWmoHnzxm6UdHCDHg4SOKli517Jei4VYxX8TPuDe1EjDXDcBzU
         /wc7/SajOXsz8Tt4TsRDlvX+YOEblNAQOmy6+kpShoqk6ebj8Fk6kcd6fhmHn/33Rz5B
         POK8f7qZ+yGDNc48BidDhwbTpn2DUbntOpKSXuO5VWp/UDlaExu4IQQVfwPv+V+hLdL3
         8Rtg==
X-Forwarded-Encrypted: i=1; AFNElJ/vs0CGRdbQ7DxauJN2C8kjlgMWU5Xj+hYHkS1LRdH7j+4jJyi/tr7ZPDxkV4+hxAsxIdHxl48T+/RF@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCwZVPXJsWNeqfumk3B/VAlu6hhyAimxJK1ifjFPxIq+/sxMs
	OAbEF4xjwT1MIUmDlEYLtx32rR0FfMiDRvTROAo3gBiBgi5VMQ+RoTHrECTzFwMSMtG3yj18aD0
	6gd4wnlxVCOUmu3r7FiF7HvGVncXDooFczSRUmPpRVw0jNNcwiVDoGybEPyfB7gd9
X-Gm-Gg: AeBDiesLl3idMAfpusCoCABJUBZKtFvBpjqaDkun8npEa8mH4qLks7oQFYjsFQwba47
	RcS8ArWQUfN29u24Mqg6prjD6YP/XUXG+opppEGgIuLZokMOi8NRUsyUIuwjRmZRhP9hZZ9MH/o
	NRN10vXRsponN/wxD/uImlD6vkd7kr9kQ//zKZKP+fy37Euqz5ppPJC5BvfMWdTLaXZ+Zy6KzGd
	ZAPwMSucAVtDzptQp8a3uT5U8GuqFRrbDh1QZUnTP9mmCZZ5inndyaJfwiHhsShd1cIEgzT3kIF
	XBnW9KAJrWs2Ar/nm25/AuCfqnlEkX+qcx8X/nYUVYwvtIu0bok06UrT4fbVcgC0gKU+9SzKHXc
	7Cn1PVrvkRAt2KqvpVXAg49iL0jnbXVYRXM0DwgTMmxgTrlfVsPoQgXcrY1VAazLiDjTaSh95N9
	CMxXU+qVGae6SisA==
X-Received: by 2002:a05:622a:1307:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50e36e9bf25mr214528451cf.8.1776856070296;
        Wed, 22 Apr 2026 04:07:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50e36e9bf25mr214528161cf.8.1776856069898;
        Wed, 22 Apr 2026 04:07:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm533244966b.3.2026.04.22.04.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:07:48 -0700 (PDT)
Message-ID: <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:07:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
 <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8ac06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=go9SmOXN6WSQs1UN5q4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XKphJW6qyiXVN9QJ15w4p81IHp0JjKmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfX+JqhdKrAwNax
 YfYafOKiv3YW47+jCu6II3eFkIGKDKAeIZ/GmHFkxrWJKP45JdnYURgFyd2BNjqPbMdeXt34e9r
 pix57pgzmrvA0hjsBekMGyFZMB4nJPHHwutROfl8pOatB9KvzA9/mUzo1UUg1KPDR8g4YhJDS6Q
 1vV4TdjIKpcSlrW/NdSx6jpXRBb9i1vwElxJy2WtiXqqlErKrGsE/P6RV+4fbDiQ32YMmkD4G4N
 SbhS+Hn6UpP9sSx/j3okuHlqca3HeEC0YR+56D6KNSDEn2ua9mAxPKCKSj1mGGqQsiEKpBb1xSg
 tmvij4XRePxg3UZsfK7DaIILJqL7eXXaQYSI/B6wik5gM4VNpzjm5U62j4srWUMLY6nVAFPzpvp
 vJVtdM3yUG057wAAbhT15WSoDUklXXYat3T4qKZ0i1T+5M29jKNk8nDyCLDFEWJF5YwCOmuYWE0
 nyLb3RYrVZZ6AO5hKXQ==
X-Proofpoint-ORIG-GUID: XKphJW6qyiXVN9QJ15w4p81IHp0JjKmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105

On 4/21/26 11:47 AM, Ananthu C V wrote:
> Hi Konrad,
> 
> On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
>> On 3/27/26 11:24 AM, Ananthu C V wrote:
>>> Add an IMEM on glymur which falls back to mmio-sram and define the
>>> PIL relocation info region as its child, for post mortem tools to
>>> locate the loaded remoteprocs.
>>>
>>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index 4886e87ebd49..21ae05f0ee17 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -6457,6 +6457,22 @@ rx-pins {
>>>  			};
>>>  		};
>>>  
>>> +		sram@14680000 {
>>> +			compatible = "qcom,glymur-imem", "mmio-sram";
>>> +			reg = <0x0 0x14680000 0x0 0x1000>;
>>> +			ranges = <0 0 0x14680000 0x1000>;
>>
>> size=0x2c_000
> 
> on glymur the imem region is a 4kb region of size 0x1000.

No.. that's the "shared" slice of it

Konrad
