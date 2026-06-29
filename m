Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D03B9930
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729539; cv=none; b=rUCFJKb8zPpXparEVbrDbC83o5MvWlVHa9UN+EWhn/m7oWyLnQSHjFrIYnyKOEL5uMlYRS4KMX+B1hpIntlQVQgJUiB4ULBIUUuGz7u8p6z7UVlLkZV8z05GhyWOaaBAqiNiXBr2yxC9/0gEYYpTSgVtCf+lK3A3jTonIYbXbhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729539; c=relaxed/simple;
	bh=LrE7fbEwnME9lt1owyrkD/f+XIylRcuGgyJYKdiDMvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWvLDFFlBYVv74b0ZYZVFjUPWqvD+SJhVPwL46Pfo3lIwlnTRmngsx5fNfY9Sem8DBhD2nmj6HfBRCkI+WExw9fI/6/MiMPu3ja7EMy/16hRV1IU76PR9g3GEe6ru5D2qJcrMOKJYXgGenlyn8nGTkzWG4JbWHH9WCr/wTpCk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChuY1yxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQGqoUrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChuY1yxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQGqoUrk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3Kk2641658
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=; b=ChuY1yxSUOvRuk29
	FEuoaA9QVruZzXPLjk6d1n/rE4QwSQQblX3J6wmDzRU9ZiKwakBmBSeIms0fUNCa
	8tSGQTIJGmJqfzSFkLkS+MxQn4HLPJYNFtCQdSo+aUkeY9gk5iwmz1gkP/jNT+3C
	Hp5P86epwvPhybfAVA6rdwsi3yGJuoABsp9Pf+UXce5B4ebEx7x5wu2DMMZ+N8cg
	6rkkaN87uDxGntGx/szi3NHsoCjJLIVi8vFEp+VfHBW04OJyTuZ+EokW1LBy7t1A
	wVKsVSUuD4eR3qJBHr13n9BrZ8HrxxP0denUU1rD5HFV3p1F59FDkb+G51G0+6v5
	IU+wsg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperd9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:38:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9691f63552fso86450241.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729536; x=1783334336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=HQGqoUrkaxNTzGJ/V95q5AsO0uvCzyeZYPldYZl+RrzT3F2bSjtcNcuAcdyOhrIYR7
         D3meodJmFt1BCKoU/ym8olaXxUXLCZKwTcD8L0edTNKhD1XztkvrlSADmKYx9/H5Nliq
         GH47LOhXRUcN9Mkw/yraRdPjMo6fruIPQ3iBGkuNyYjB1lCrkRl/HV7XMFoF8bSH7HrZ
         bvsknIQ9biuJDD+EPNPTysvqjcUV9NQwPETR9XSmKPuk4RXftxBrs+ddsFVfohphzGy5
         pXnL4c4wPq5XG144Bxtwc/ZcSdyZYu8GycH+HdT1HXVs6ehAYz2XcYU0xCBgwe62XwSP
         TanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729536; x=1783334336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RWreAaB78HYAsqbj2HFHS8isvDnQ0YYLlkTXEXlOAU=;
        b=YPuNhkh6Iwpmju8UhEFzolscMIfRjLjUuGVkha9Z+qxIm0r7DeXpN2QyOHQyc1xOf+
         FHMqquND10Q3epK3I4nxkCfgRL821WfKcaj8W4/BnWYHfe0koRsVaiYi5hdJKERbL2J5
         xeybtGdRvD6fcX3959rEhtidKH6IwQoCAVCcnBlswIYhFxumYgfXwbVz6I/oBL1r/SDx
         oWyai5vIPXp+AibZC85gYcNys8XvLXYyWwx2sgLS1bx+R5IFPGyuE+G4t/x5JQMumn5R
         01CRmA3NeSjfVra4xJzxVGwmFVHLjkWja6qzUOySQwgIA2bMcWIhQzzYgaYXsx79gKrX
         cAZw==
X-Forwarded-Encrypted: i=1; AHgh+RrFVKfkkEpBZ6o3H5HirsJVlej+JO9GIjvZHoYcQmLncedAKbkI2N7lGqFEQYou86L6/tRtmF/UZ+TU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7lPZC7Ngh/qXBKDG4p8JC0A9OS4ck0oPMNUSDrCAuluV5Depi
	mfD4UDWrbCMkFH6PbzPmLvNHV3kkjXANDyELz2v2Cx1GEHpdSEjKMocsyRhytB6IV6hYPFEZXzy
	hxoKYQTpmf0OTjjHDd3Y6BgMuXfr+vfUOpuHDfrcNsWUPAOCVWwoNjJO/JhSIV5Yh
X-Gm-Gg: AfdE7cniBYmGJrZSg0oVMCvcoAif52QZi1FedeD9SpDK4d8QfaEGTWpM7ohPudFW379
	C7HF9L280QrThwiBbomgtniQVrAQl92P1MHJIYpE4+6Niu/HF/FHCPCLbANqm6qc1ZdfH6tHTKm
	z9IM/kqFyDNG+Koqf0dy9cFCFF+TwgtWbBPsUJm96lADe5qeGCxaXe534mVWC2xOU20MUHNaQEK
	c5Kg7ZFY+javfEMpwOFG3m20mRT1WUtptUF2CkJR+Axee6efI+Tayzeov9gySYj5ePsqbqqQ275
	LGqA/tQPLnHsN4uhcDu25Q9iIkpxjN1MI7JtZ2EUu6DItmkFUyo0bnefObu5elD772vhKjPS332
	sEyixF94bcAnKHt3A1z/igAHsDY2hU1VO/8o=
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557586137.5.1782729536386;
        Mon, 29 Jun 2026 03:38:56 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-7381ef65da6mr557574137.5.1782729535994;
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69870eac1f5sm621852a12.2.2026.06.29.03.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:38:55 -0700 (PDT)
Message-ID: <b8e0711b-1e02-4860-b80c-bc99757181cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:38:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
 <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX35BpMGrW/7XI
 nBLbnRd8QBov3sBoPEOdgqS6lOHrEqsugPKii+dJxOMcPQSjuLbmEUwO7c8XL748xmnOQs7tKxJ
 VVdHtYOmf+BIEgktLnejgZdCeA3XrHjrFsMN6YJ9AmNw3OAbonqymoc0F+9g+ZYFtC/LBC3yby8
 mdxUTtCqy4KiywlNShIzIBE6izA1yRdUMWraO/ZdQlEJBczMlSmsgKF2yectLWszS/Ldm5sLUw2
 ip5G6fdwlq7vp7cJtpjkpXFpN8MPhEMUhXET3XvjpQgn/4p8ownIWKTmQE0kqf6VxYvbWVLndYa
 ZRRmnyIE9X1ZF0UL1bnP+V0z0igYxVo7uQZdjDw040/hnCaUeaZq2r2c/DKGNGsldFTwltNSdly
 7ifzLWbK0D7GXtvsGrwOgbgOjZX3ng3Ggwck14/m0QYtKXccvGInDzzmBTjy5EdHyrwO+wbAxUW
 uId0IFwqnfaG9wP7Dcg==
X-Proofpoint-ORIG-GUID: Wnd1r3zjzTGTE6SgIiOJJHU190rpZNOv
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a424b41 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kbzcBev-Ug5g7ovxFVgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX9J9tuLmBQ9ko
 Rc8yzBen8pawR43tFzHzT5x8U71gKMiwgX1RuiVR+xn/2Qt7v2jszn5lDdfx8Lu0AZHR92jb0hL
 3ZWvjGv2hSupZJvt+6RjICSBBfuF/+k=
X-Proofpoint-GUID: Wnd1r3zjzTGTE6SgIiOJJHU190rpZNOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086

On 6/22/26 3:24 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> The TCSR clkref_en clocks gate the QREF block which provides reference
>>> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
>>> and refgen blocks on the CRD board.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index c98dfb3941fa..92b929ee3448 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>>>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>>>  };
>>>  
>>> +&tcsr {
>>> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
>>> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
>>
>> l2c_e0
> 
> For COB, it is l2h_e0. L2c_e0 is used in SIP.

Right, ipcat fails to make a distinction, but schematics agree..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
