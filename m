Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A433F7882
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724847; cv=none; b=J1xS3T6zx50HRlz//powbOPK6+kzUbQVDM5bwXwe+klGzBMJIp7f3VUp4XsaK1r8DMy6Jt/4nIJ5vREy+SVVSuo3iir3Yfd6W+S0KvEVik7S2+Oi7Vgjkzb3ur1Vb+ALmCu7q3jvjIgjGPs1k9FNCU/+crvxSKWH/P9awsvvrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724847; c=relaxed/simple;
	bh=OIklkIjBVMa6cf0EzpmdVSuCxpIJOL6sd+Y1gHkOElU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdC8GnCOg0kNPM5s1FzGW0C5kNYh2rkqQUzspGOEms6JU7XV/YqLhreVId9X3M828/jhL8/9lxuEOjp86vFlLXV94GYDdzJOuGr/As9eigM/yvNnzsA8GTfvI+09ta+oEv/o2Wyqxj1Q8RND/plVy7k0SCcsGjt4RBA2fJtBAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6Uu/ihY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgXbxNVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6Uu/ihY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgXbxNVT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rkxh2116258
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=; b=R6Uu/ihY3Y7pCEUg
	KNxOH4hXyZTmMaHQ0QofRm1CzoHB15YAgv1DEVn5BG23o34L3UmRnJFshdDsnyWm
	HgECAljnuSImwfRW4qZcWxsiqJ91wEXCoc3o9oyk3ueJo/RW9cwf+H6Op7V2C49e
	pWiq3FnyjtPckDje+Fr+KJg+e7KdBLEzH3BwDtcNbIKnIVaSyh88N8S3DA7rD71i
	Ay8mdPFuZZHIx7gBa9pf85UdOVVhl22vHZljQRR52RA9nnJKzaPAd4/d0pdwLiEk
	ZkT/AkLH8VqrAElG9Ysg5hz+O0pTmqMXzmFZCJnj/zuBamI+nmVGE+s0wkqytAgQ
	dXw1RA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dryc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:20:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bea07880dso3811711cf.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724844; x=1783329644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=;
        b=HgXbxNVTZBXY9J3dnHj9LDXIsj3cVZ3tINsLvM+lzkv6YCBXngs9UsckDT/NNDSBu/
         FSGkYHWck5AGxR3ylDx2TzYrA5/tANmB7zDJ8eRzR/ZLvbAu+ujyW6rPwPqmji+jrY7R
         lF6JwPRV/E3leYkN2R1L96+vVze3n3fK3tGn8nKJzQBzjVrcjF+graLAUXJzfOnutA9D
         dYpKSt2pflQzEt2ti2s7SryzCJ0qdPkbMq3fwcLbTMeqPIuDsHhjBVoPlVRJZUFDYHgu
         MJpnt6RtBSaC8GUg/RD2SUkqt4WtauUb6mycE5QKxLtrSPvsKtrLP3AB7dxwa0DnvzPo
         L9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724844; x=1783329644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPzczu+eMoK+AhKFw+6RWhjrnWJ3cdjMxPb/PrzxOiQ=;
        b=SfaiVy8DJqBqGQUB951pz7wqco9h5jHBmPX7SaLJZL+FbHbWbp82SfwX+mmCsFEkjD
         qSZz0z4qN/i+06gJfTT4YeR1u1tPqCYeqGncYWzr+FjHoMY091MzBFwWiQdI/1r5wBQw
         ETKDNmy4g3gt25+rpENAVncNvDaG8JduuuDtXij1oVmOR1klEDXk378ZLvCKMHYLm8/o
         sdQ9t/xyPj+QqUUBB+80vsG1SBLTOCXkSCSdkp8qro+vWLjE4buirATlEkmT/cddv9pU
         pR52gH8lw/LnQuPix4gbrWI/+ZfapKsNZfDUb7yNUWjjE1/RsdSAWBnejevhnK/LubBn
         TO4w==
X-Forwarded-Encrypted: i=1; AFNElJ8gZVsHh2FC0CuaFQtY4mouzL8jZM2KsQy2mbKHX2dRTe0ACVTPaTEKpjWeBE/XkxnMbL+QvcJ1Teuz@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVHOjKbGM4HTMaGZt6oWDYa+P05qiM16+9u17xTpSKh4TGi76
	1s+hDtrJvzo7qSZgEHdnddFlWGqU6gs+q+7fygzM/3pCIhpr73u6/6mVBcN1ASwL0cNa4jr2HON
	QL38XogDdj6WYUdG/nDMmPyuCpxhomA+RDEdEi+LNpo6GixglOBPJwIto7x9jjP0q
X-Gm-Gg: AfdE7cmXcdfY9TMGM1PznngYgmBT1l98C/xIzZal0+o7/3VId9ejbLqeXo2LHfLYR0s
	JRGx0p8smjVLQcxCudbNaJdfBk7nI7+c0GLaDQWsDy8XShWhg9NqbXWzSxSiVtDkp49Z6CRuS4t
	mWPrnNJfDBV8mo40P4Do9sksBYBBUToKMCZtfq9PyA8gXtQaqj6narP6J1QNaTUp0/EzZHG4nJT
	zcJEpqshP1CWMgV6ZuuPcRYK0QJSai4OB9bb5vyF+uXTkTLZw0BrZbElLzVnsBR357+GKmcFoGe
	2YbY1gUbrHL6kySRrsLvy0wafgsOk1ah1rj8wq34CTiHRDSuaP2tMH3LhVbqfAu5CQx7y3RI9qu
	QO39MNX7fBeIfphVxWvesJ7vo9LiQ/SbQjrw=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr87799221cf.9.1782724844514;
        Mon, 29 Jun 2026 02:20:44 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51a8c9b9539mr87798951cf.9.1782724843963;
        Mon, 29 Jun 2026 02:20:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa46asm745789766b.10.2026.06.29.02.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:20:43 -0700 (PDT)
Message-ID: <c2f16272-94c2-4c28-85da-f9e8ca7027fe@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:20:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
 <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
 <akH/N/ZwnSD5BkIj@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akH/N/ZwnSD5BkIj@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AZ-hF0f895YUMH-IvbngDJs3DNfH5Luw
X-Proofpoint-ORIG-GUID: AZ-hF0f895YUMH-IvbngDJs3DNfH5Luw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX55F9QtzB5DCg
 Ps6NBV89C2Bmy6CJAK/qvkittNsz7onIGXHlRnFiA9Vx8Ty8oqz+Ip5gWVAgAOWXa56zJijbLex
 M7o46ul+TVeojmCOJVJcRy0oUAlNm6w=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a4238ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=p_8c1NbHuTntNjfAQcgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/0UyWiwXtG91
 FuYDpUgop620t9qkuiADftU+RW0DZTCWwbsRIBQmJVKU7HrmAl35bfZ4OZ/XjhIpFbxtpyoVvm8
 RdBPAVf6nYPg8gFY5BnlGJJSHNjtV93kKHEXkbiFBTFT/tSTEim4ZL0XdioM2355rzEk4nl8eLg
 3EEwQ0wZ2Khu9wV7ByNZ5gWNYqqE1xFzCtLRkewWi7Sw2tWyfudh4qseDK3KzUZpnfmR13zhPTy
 SxcGtbdl6Zsb3EKm8jolv8pF8SBie797pBBFLtkC8ZJJELElFqYO9Kf+XozREvOtOr5I6CJOu+P
 VCmveWLAglQDhpZT3TBTa+Ek9pk2Irip/ND3z/qhOIEZNrBA6fG9aS1xCbGFaa3pBLv1WTriNNQ
 +vVimNKmfOe5WTB7QCKNVHc11j4SuO066t/AJzFlyEyCJJWZUhCsFQLWR/6UyPL/iLbKXORdoak
 p2SocdpCXSo2rGNRvlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

On 6/29/26 7:14 AM, Qiang Yu wrote:
> On Tue, Jun 16, 2026 at 04:03:39PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
>>> PCIe3a/PCIe3b controllers. This block supports two link modes:
>>>
>>> 1. x4+x4: two 4-lane PHY instances are exposed
>>> 2. x8: one 8-lane PHY instance is exposed
>>>
>>> Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
>>> document the new link-mode property, which selects the active link mode
>>> via a TCSR syscon register.
>>>
>>> Document the required clocks, resets, and power-domains for both PHY
>>> instances active in x8 mode. Use #phy-cells = <1> for this compatible,
>>> where the cell value is the PHY index within the active link mode.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> @@ -68,20 +69,29 @@ properties:
>>>        - const: ref
>>>        - enum: [rchng, refgen]
>>>        - const: pipe
>>> -      - const: pipediv2
>>> +      - enum: [pipediv2, phy_b_aux]
>>
>> I'm surprised to learn 3A doesnm'doesn't have a PIPE_DIV2 clk.. it does have
>> a non-div2 one though.
>>
>> Seems like it's specifically not the case on Hamoa and Makena, so perhaps
>> it's better for maintainability if the Glymur list was separate
>>
> Do you mean splitting Glymur out into a separate YAML file for the PCIe3
> PHY? I'll add a new file if that's preferred and Krzysztof is on board.

I believe that may be the better approach since Glymur seems to be an
outlier with the clocks I mentioned above.  Krzysztof?

Konrad
