Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA236E497
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417793; cv=none; b=Z9C5nXc56mD23+Koqapm73Aw38LehvyVnEeDjAzYyAjWIMwKsUGMY6IPysBxRKKhMaJ8hx9nMDJmyDZMXmtdJnDq5Tv0+RqwQ0eTKe9ru+hJYtaFTyXuUk1E+Vm09qingVFeaK1IvrBdNwAz0l77tBqsmaWshRc1WrYYq+rFr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417793; c=relaxed/simple;
	bh=2shIHeFcFKqjZ95jW4Vx29dUWa6l9PR8yAiG06v4dQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rw6QpcDgZ5Bc3KsOUlAXo8AOLep52ql9D1+m13hE8l5whgBA4ga6CC8FpDMSkhdDxhLjhI8H+xU1lrjpF/DOBrGIhk1N7Zyo6/D166o4Mk+1SrHfwYMRAT4C4/GMmNiY7y/a/JSUuB6CPivpJgj9GojRT13KpLVPEuQenc9XDYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ha0enODd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8THfom1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ha0enODd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8THfom1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7AhnE3438973
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=; b=ha0enODd1FRFNQvH
	6166uSBHHlQ0nJi5he1oiFTEZsjlZcRWF7Rvk5OHwwo7thjAK9B7ICrafS98w/4B
	sOwwGh37UpT0ddYuXc3qcZTIKFG/cz5jExiS3/iPIk2vMOpU8KocPKFMJ1QLd57P
	LFoOkfvJn1UeMozmBCFf6MNcQs6GNHjXeM5vijoYkW4tMAyRHB0uJmvmYo07w/W1
	yGm2CAv1xjq7EbdzOzPlOOFjL2AczTlWJWqmU+kDxrKzLnZGkTwhsf/7atltpm/3
	ZreONYAwUgZVDVhuDDVRf1MrLeiVlUbnO9me8ZYScsoVfV4HvuMPJsKQYQ4fKrhQ
	u9SvBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88rk26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:23:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so729954a91.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776417790; x=1777022590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=;
        b=J8THfom1FFwJZJRaTMg57hk8jxYLjInIhd0pt/p+WlZwe2aCxZDCmH83K8BslILMBg
         07g3EJHxY7YfQzW/reOgEh2esGQ9UWCsruyxNsz5DDumM5PuuhKrLV4VhyCosLLgYBmr
         8PkRzBUU6jAzc0vn/GoipadUTqB5h70vD1mX8zMQubyefaU0QFzyWALBrrUm3A3KihoF
         4txcC64oZEgCMNi9ZdoEsqGap8jEjB5BOL72GEU5ollt/AG3r9KA0jaUdQca78En3I+e
         MlEHeqlT7rU+meNZV/HLTccUN6XGktOF5wSJIU/y3JcWekvJ9rbpqQHzzkr91HWJlQZd
         XLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417790; x=1777022590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDT6bG//biEbiFpAOOIJaupEFsvw4HKKTh0BeExEgow=;
        b=H1lZOG4XkrRsCjh5vc80qVomcwN46JDgmKzF1Ymx6pK5BCt9ahBlxppwxKOUH2OOF+
         Xt7N2opc0NmyOMrqgDdRYXOiAExsvKCdhgWBcuOx2V3zX9I0zGm4WBOMGpgBsYOWfy2n
         9TvsS56LjkQ80HwTRvSYS45neEGEqLQewQJKzQYAS4ELrM6HilsknvcGqWRw8FWfyJ6z
         sSjcMxKOwmtO13233iBNfMTA+k4nKYDDtumgni/137MZX+330Uissp/IkwzQXCYboZgB
         CD1cOJrCIYoRMahQ9E20r7IY1ZUHHZN0PEl9d51tBwTn65Vyk0c+OJt4ythFKOW5WfbL
         8ONg==
X-Forwarded-Encrypted: i=1; AFNElJ9BzwEcIubIlWm9ejWasvVcApytBU2wZUyVAyCQLEfl6/sZQUiYXk1iPGGisYMjApARG/6ATNqCxYNw@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0vZDjn0VPtJqh3qHAwbl75+WCdgNUSfcwKP0BcdwivCqY5h9
	/a6TGLuFpzVc1+wid1AhPBWCdCDE/CLSxq+7kDifIPm3412fYu8yCQrSrIc+WTRAJ9yZ+wDvnLp
	oJzg81y5oBpZ7phTaRjXgpcIr8GDsRUNjJY7eBMOuu/KrPIm8v08Zw/CpyAAdK94a
X-Gm-Gg: AeBDievpthKztlrCkPFye8u/hbA8Rz9+IaVa69FnBsZ/QzbRp7poSf0zW23th7o1+rS
	nVKHuEsfZKBj0//vIxIZ33KHcW9Yn1701xiKdO7rvfg3BQ0wv6hNo9VUQDPXAqNqsD9jVOd0pcu
	UpQf+sMZZJAc6cgDAP3+Fdz0i66NeqSk/+06wVogjGs7XEsQ8ynqw3CEml55sF4ay8+sxA5LNAl
	Jlrg5JjDsAnUuT2wlY37EEQHQeLogUQid6PB74izHQbUfGH//WtC3PCyOnzehojVcwcdTEJg0gN
	eEb12iJOdC9trzbh7mzsdyszmV0zQoUprwIHelhrhJEiIxEgf9rcT4vhkFubqOdk1STqmNB2Kkq
	mgMMb5oKuIwVHdRoMiwiC483tYG4ZxZyLevvK8YdD7zotB0h9HS1Vv3YFQNLQyg==
X-Received: by 2002:a17:90b:1846:b0:35f:c796:ca5f with SMTP id 98e67ed59e1d1-3614047a264mr2204576a91.19.1776417790403;
        Fri, 17 Apr 2026 02:23:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1846:b0:35f:c796:ca5f with SMTP id 98e67ed59e1d1-3614047a264mr2204538a91.19.1776417789920;
        Fri, 17 Apr 2026 02:23:09 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba13a4sm568153a91.9.2026.04.17.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:23:09 -0700 (PDT)
Message-ID: <030ff8b4-c553-4e3d-84fc-30ae8bb24aaf@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 14:53:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
 <20260416-glymur_trng_enablement-v1-2-60abcfd45403@oss.qualcomm.com>
 <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <28108ec6-2b06-4b63-8e41-fa75b7858acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: phGUTe4kSBqY9g-zC8MTZqbr_N0ThRmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5MyBTYWx0ZWRfX38RMBUgfXPGB
 CZiAKoZB06HzX02FO145p4a5b5PRMRQYMYGbOFqAW3szL14lsqLkpjqgUVV/cOm+Ko4ww5VUcIL
 eMRXTUj1TPrk3PRcmkFEib1kF+3qlwJ5rGdUumb1FD/iVF9OugviQauuIgxvcVmSlYx4zBLBUGr
 T1txGHHF2C1RwTdwdhWqWr4/0Wvu5y3m0SPJI2aq3ngO09c+FflxFr/Y2fN/D9qKbWyFKKEqNrH
 hN9J+m7tlOxsS8y2mddcDdEVoKqToNCKYPgvvdfau8wfYif5LicCoodo2SobUKWBP6OtSl7oTXX
 wAO8w/HS2Iv7VsCCqJLSnhi3ChxvX8h2dtp2RaXrYWDW5gIjJnHHbUgLdjv9lt+QimJpzkEhedN
 spGZY0qgLWkIgfthLPmeecFD11U5L5HdvmaXIzgA3vlRK+6Tp4hpJyTzu0L12IeUq7bSyvPf7yM
 3O2yngR9kg751hSofLA==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e1fbff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V3ZMZ3GGzncCEMzdExUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: phGUTe4kSBqY9g-zC8MTZqbr_N0ThRmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170093



On 4/16/2026 6:03 PM, Konrad Dybcio wrote:
> On 4/16/26 2:26 PM, Harshal Dev wrote:
>> Glymur has a True Random Number Generator, add the node with the correct
>> compatible set.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c9d46ec82ccc 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		rng: rng@10c3000 {
>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>> +			reg = <0x0 0x10c3000 0x0 0x1000>;
> 
> Please pad the address part to 8 hex digits with leading zeroes
> 

Ack.

Regards,
Harshal

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

