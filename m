Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6391F37A4AB
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641343; cv=none; b=ihxmr+1V2TWgX6oBqILvUaSaG6JqNi5VMiI9/8GtTU9QAuHSPUnwJwDS8K82oLFDTPh/deIqMxvniTir1pCsLpTgFY7USNaUs3zNtD0objRLWJ9NApwftWgSZIROZU3AwFQJpm9lQKr2G0Iyew95TkgZVcPFIWPAj+RV9H4h4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641343; c=relaxed/simple;
	bh=7Rda2gMVy1SdQZZRHFToWcIFp5Vg/jxtkzMbB7W5W68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+/BZXblR+fIzdxXL+K6YNhTxCrmO0Em1oNYpmcSw1FvbqLlSO0VQt1jS0cHh+WBGD/Mi7Vs3O11QrxznEzK97ZPgNF1/KqmfYegZv6e/n46XdiUNyHWjYteYxxbCcYM68b28BaxT/ibrYVACKg/EUNKepJ80qfbYzPKmNIOUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lH9lmU5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkTWmy20; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lH9lmU5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkTWmy20"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63879LEQ2861188
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=; b=lH9lmU5uUvMkl8rP
	K3W+qwqaTomktgGpeqeIhiu3fghS4+9R2y67ZcPcjdxyXML2qgPF7ez9++i+xcqo
	fNfFOr4FNp05i5jYn7shIhYzR4iyCjxeYIBFHCJMbHD/kT2IDITGsJsrVr9PjpyF
	dzfE6NyD3eBVoTDnLJx0yyB5AFcD7MxfSV+3zgN4W+sRyMEvMipUIQ5jF7ViUTRi
	veLBCMv/1RPn5Gk4RfoOFKKJwIQSkcqs40GbWyxga0VRLz2+cIdMaXvDFcQv884k
	LMo+eap9sPL72uDbhAisATX13yVY0FCOT9eQ9KxVgp0uyIboCD8ApEVHt81CCf7o
	JsupTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8t4pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:42:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso21338291cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641338; x=1776246138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=;
        b=NkTWmy20TTupqWY7qgyoLvlDW029FKY9vyw2b4o8n182bF1R80ui55ibO1ZCa8XKvm
         W5yngfJ/beNM7Lek4c5GW/jeQanuavfwystV4XCkrdnoxWu9uvEMz3Jp2cOFt2dMx3tp
         jdMjd3p/XzH/qxJq/XfyLuna2pOvpCIuyFTIfb4ZnonZi0eDHFf9L3rddrVA16/XHZR6
         cstV571szSVE2vsUe26YmmadUExA8nKztMWp7QJZJ1JMAkW4QSHoMBVdByes0oGbILYc
         q4s2jtZkgXoQy7l5HtBhsIrAUG0i5MrvgA78d+U7pzigLDVWe/rMOsiz1fME0KD6S5CN
         7viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641338; x=1776246138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czCCWuYWN5JTYttKvIqlkZ+7kuUoNFqya/4PflgBR8Y=;
        b=sX+Oa64r8J6FMozBfr+IGv4lh/PXCFMikc2i89/6WnjsLMDoDIqttZny4OhbyjoKVz
         Hg5AYS2PH21fSpyZKooalW0kDPvCt6kdfuTDk9g27VAlsw2ncnSpsNNwE5Eu1Oq2gS4q
         4B76PDE+y68ZkGHf/4o0XMVJGVLCGwfyMguDMf50IpqbwGH17cExSvBtw7794HNkPoru
         E7wAQh1UAbop/7Q/GABydstX4/epMXFnYFy9rlpo37vQvQdUHdSmV/XzH0czm94Q+jys
         NvGK1HPbLld+YbjQHY6jzBPhxlLdq1vmqZxCPbz7tYJ2kGsXaeCaHn0KDmPSLtlHs5lb
         VwAw==
X-Gm-Message-State: AOJu0YzD+YfaLAYv4e3RfoZp6ceEjyaWEmbBXg2KmpJTs7FwYU60r9Ok
	Ihd0sJcSfIGBkqu91EEOv6pamE/2U8pPHd8FBRTyYa0iLqfwoQoAPI8ZcVkxMgVderefKf3au7x
	4VPHIEvxSgLUIkWKGfUZAMV0HrS78i+tqJVw9jnCgG3N/Xhmiwnqd/DsA05BYIXle
X-Gm-Gg: AeBDieuoMTf2NL4NkuTEDc1cImc9Eaj4SrcKf3ruEeH+x9+vC1tpGCMRT4RDakLTPzc
	/ZqrwsEuxP/8Sn81CavUtp1wO4h/Ezoqoh3IqCetC4+S1Z+QrRE2KTqav22jmQd0LKc1IrT/awX
	ia3/+1J0kiX8X5A9ckMyWPAwzymNJe1FwMsLd5iwk7R7dODXz1R7LhAD6/XyIGyPInrwK+NN3FT
	uqFam197cYy0AV+xbZ/Z/6D4bL/HFMyMR2aySmNmVDB/dSV7NGtKvz591DtVg724ZKc+cmO4yZn
	wmykw8pja1EmGF9Gu/LqCe8DQVA+Zi6SsY0QVNTS+M8ucmXfdpKlSTN4pSNPi8vtrA+02r2fuYr
	SS+m4lEDIH9CciWAfAKBwDqtG5Ojkg4KBjBgUj4ey2mGnDExnmXZY4YHdx9nS/7sFi3BAFNGfOg
	RgRN4=
X-Received: by 2002:ad4:574d:0:b0:8a5:e0a7:d99a with SMTP id 6a1803df08f44-8a703d202c8mr260254996d6.3.1775641337858;
        Wed, 08 Apr 2026 02:42:17 -0700 (PDT)
X-Received: by 2002:ad4:574d:0:b0:8a5:e0a7:d99a with SMTP id 6a1803df08f44-8a703d202c8mr260254796d6.3.1775641337366;
        Wed, 08 Apr 2026 02:42:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm6454566b.35.2026.04.08.02.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:42:16 -0700 (PDT)
Message-ID: <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:42:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LSZWtN05QOS07lt4ptCr350GHHSCrEnT
X-Proofpoint-GUID: LSZWtN05QOS07lt4ptCr350GHHSCrEnT
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d622fa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J39E50f51TnHoGT_JMoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OCBTYWx0ZWRfX/iYt/T9fvlgR
 2kghtw5+xEdxYGpf5Wli1dOzZ5Xk8Lr0FwkcwO7euCZCmPbpi/JDz48E7T+uaA+WRjOxVOQ4L2/
 MBpScZLEIG4B9UrCJFUMxFaWzd4aXRYKtPOdVy2con+n9osuBbd8b6NQ4dpBcZ0TplmaFrt/8wA
 x/eTP40KFMUSH4c5QUx1C+cS1WSn4WAHCBLUSBWQXxnjF7GZTO+FDkw4XuknP7g1sl1veL09NfZ
 Ti+f9oFRWuOmcEd7spEMiBucdx9jYKqmMxCJ/Dw/M7/dA2oheX8/fBUmNbISYv3CFM7QsgFvp/y
 k/ynyvXtfJDKwNx7YyxaoIrWxWMc+e5eRxrYZl16+jMP2WDVLhUY99Dw1T8yPY1P6vbiYHAEHbq
 Xd1m2XUayooqAq9UpbQpsI+ceQ4cqtAZfrE45kDpuZaYetk1ZERKZoAomSFLvNPnDU8Z6X/MsHr
 btW+k9LoqzgblK3RrPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080088

On 3/27/26 11:24 AM, Ananthu C V wrote:
> Add an IMEM on glymur which falls back to mmio-sram and define the
> PIL relocation info region as its child, for post mortem tools to
> locate the loaded remoteprocs.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 4886e87ebd49..21ae05f0ee17 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -6457,6 +6457,22 @@ rx-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,glymur-imem", "mmio-sram";
> +			reg = <0x0 0x14680000 0x0 0x1000>;
> +			ranges = <0 0 0x14680000 0x1000>;

size=0x2c_000

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
