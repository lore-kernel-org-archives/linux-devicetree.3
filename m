Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA92F260F
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681862; cv=none; b=ofjpBD+DGjKOkfCbolda32JeNq4Cuaez/ub8OwZWyuDmVOkJCGaIzivhSv5xbLqlzG8rCXagK6eSgubkG+cDph5aPORmB4pgNsfHqOX83c8hP/tO0wT74t4sVDdnUxrXXPlJRcnD6g3rnR9JcloyXc8BbNDRTmMjG+9HX3M0MUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681862; c=relaxed/simple;
	bh=+gtalVYpxoENTEE6SD9egGDXV7+Bv1cF4WTpXQvJsoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsNc4WXDTbKBJcJ5kvQ18P1hCSJ5naYve3LVxI4/VWV3fA8JgixgLLadT4yX5CnAYYgrRAb6E7UJhNP3X9fPFeDSxj2TE4+Px2Q2qDUxg9L2dOexbRqr9WmiRVkfxpSEWORK+0zyAxNd05QsURd50lxT2OjcEJrfqD1Q1wYPOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeQLZ/Oy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf9DFPjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeQLZ/Oy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf9DFPjw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91RrO2281664
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=; b=WeQLZ/Oy+9YqciqT
	PHHRFYVjhJBFG4dG9UN0zRY9pEzE0iAd+DrozzmTBPVQlRari/wuIznHJvgS+TZP
	F6+E8Kz6Sv7lpoCZabWKipY3QwFNVOi2DOQnHlmtJB6Jjn74fVWXmgi+80u/ncJO
	epAOVkASLPCwkP3WlUpJa3Zl9Oqm+V6luIkZUCDZ1QIY7r9EtSSiaxPKfSZzVr27
	uzQC7NMlY2dznGufix+JL/x00OmZQTJgC2AmalFnIG5gcZCExv8yeA3gqiiEXyXJ
	L4Rv/nGmBsr5dk4PTM38Vr+qJ+At0oem/re8I2D2QRX5Ft9m++QN+1585N2G2LmJ
	fXd56Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598cet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:44:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354490889b6so4383421a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681858; x=1777286658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=;
        b=Tf9DFPjwdV+diJf7gYR3mtPQKIZgCc50tKVBVYc/wnV9QXERu28dOY5VSHq1ub+4MK
         6p9zQzWmZU0djxPTbNSXiHD+8ehDFWt0IWsrMHjr2kMdSKB4lH1RQWjJNV6t+ujKIJ34
         8fscS0/3fogLiF54oHJVfAze42oEuI817qfrKsPam7SnqU6GV9cXQ8sgJX5hdiWFjtSi
         mOW17RQP96wbpFtPglw9AdrYjqVOWpHB39fcr3zUdX45vNQoMDaZy8fvjgFdQxIfMBO9
         ATy/5O4Da8Xja9gzonCc9AVdoT8o+xo2FtuLBerqEXAkLnG7L7lG5NWjclEhFvei4c4W
         uTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681858; x=1777286658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79QRQYycZQNH3IttWiKNV6WjVrVM0kDMoHd4OWy5lgQ=;
        b=OG0qq2ANe6T0R3jIRbCrkvur/fwuoVCpDBzjQYYpdCIjYqLLS3GrS06P5ffP6c5dfr
         zeG2PJ3vpn9RYmY9TZ8HCHdL8RG3u/rYTnE19Vd975qwKoQFy35Ay/+ItCuSXmWgGNlb
         EgzecdNyh5+YQ0WoJaKg22vnKU3x3qbMqibseHazQ1I4Sqjy43DLJY6ahS0Fa3y70XlV
         EJ+8em/KW+kMYPhIkJCdin8r8mbmaL8KG54rvzy8wmoxFu8J6ADHJDHZyLnQ+mGMLsGO
         dibQV/W+dkbe37HSg1dhOgp32jLHiqQI4Ra0Z5/XL4zoKqjHFZst43oMaMtKHhXuPzll
         OphQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n3VNEtW+rZanUK/HEQN1fgyvS0iz7YJRxJyft3sEAuRJverNM4h8E7WOA6bmQTzgk4CoMyc1kGXTl@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGe2gMEVkA2eFNzSQ6QZP5pBPeyqw57GxoaoED0f+fqB93ngb
	04S1eZC+z3EsxfDsEDdol0AzPlTODw1Zz1pThOkvfouB/ioRpzbms8AUO2Q4XjyLOvvcqKpQ7TQ
	NMlsFKX0TFqbKzpppPqiyCza6OLpkeoS+6O5KnLzTLCV2wrb3ZgHngu+IVZNeprsI
X-Gm-Gg: AeBDiet+GuMO81umNoAbFWdjwPM2OVxYX9Qg+firY4iKoSco1eVbPwsG4AqCyWCy94g
	v/G/kM3Ui8WPkJ+l52euMWWWsLG9TECG9rT00U0te25KQ88zeNqL7BtzmqWj5hVWlweBcomKddY
	HKzDXTpl9A5+zAVsFL9lQMcJaAKM1UugAXkuImQSh/+BEQXbJn8wTW+xEeGiZTU9/YQs3yR160X
	kg7I+wl0MBDTA1sozCZWSTyEm09QsjvAb0qoo8KRkGLEs1k+xvSrGrbZBHr3FPveyr9rkpTeGTY
	80dSvxUnGXQLYW1ZX19eB9biwoZqR2D5RctkTJGb71oCp1UI8IacNMkDrZB8aFEFovZq9qN5zhq
	qUjWBW32q/1LOMGEABsdQGGDdJWflz6ecULcyKV9DnAMwqKnWCwrnIdm7Zp0o
X-Received: by 2002:a05:6a20:3943:b0:39f:82eb:88b6 with SMTP id adf61e73a8af0-3a08d283713mr14655094637.0.1776681858455;
        Mon, 20 Apr 2026 03:44:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:3943:b0:39f:82eb:88b6 with SMTP id adf61e73a8af0-3a08d283713mr14655067637.0.1776681858028;
        Mon, 20 Apr 2026 03:44:18 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797704c332sm7619414a12.30.2026.04.20.03.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:44:17 -0700 (PDT)
Message-ID: <e93efcbd-42e1-4f1b-a5cf-c6dc500db63b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:14:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm630: set adsp compute-cbs'
 regs properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-2-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-2-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DDiz2_GWDK5_lrhzSHDXhp4LLjALhTCi
X-Proofpoint-GUID: DDiz2_GWDK5_lrhzSHDXhp4LLjALhTCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfXy83gOnBID/FC
 ffWfEO3WE7LIz0sV7hijlovTzoi2VRSvACwfT0lVIR8J+Szho/viHQfbv1V3xFmL8NBKI37vMJF
 V4+cAKoWEJd6KiGb/LsIcE7HMQ5hEfvtC2JG92wrEiKOtK8OJRmuW37T9Sf9YNqUg2nvZP0eZ3s
 KQ7hui0HtjBqxzQ0q/kqeUdTv34DWdfgHWXtBYJaHn2owbFUXDUY72DR6c3FAaaJmo1CkKg8qde
 PvLSKbRqmJyFZmhydYDmxBPWVmqFI2ZvWv071ZLJijSMHIH3x9Snk9HgI2e0OnKIujuxrpUUZsA
 1CEgKZpME1CefSlI6D+MwcjHijSdsDwL8HlMXTi48ijCo4sBKTYwmfsju4fWiRRtJ2WSfvDXWKn
 SX76s4sfrsMplb1hG3D95ouDD3MNXD0ZBV3cLfEysg1BbCv0WTzR97SPB7LBziEUoKVekeuuVK1
 mVRJ1nL8phlr2rowQuA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e60383 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=9x20Oci4SAq0NeVlzk0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on ADSP
> so change FastRPC compute-cbs' reg values that way
> 
> Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index bef3213165d6..4b47efdb57b2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2459,27 +2459,27 @@ fastrpc {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -					compute-cb@1 {
> +					compute-cb@3 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <1>;
> +						reg = <3>;
>  						iommus = <&lpass_smmu 3>;
>  					};
>  
> -					compute-cb@2 {
> +					compute-cb@7 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <2>;
> +						reg = <7>;
>  						iommus = <&lpass_smmu 7>;
>  					};
>  
> -					compute-cb@3 {
> +					compute-cb@8 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <3>;
> +						reg = <8>;
>  						iommus = <&lpass_smmu 8>;
>  					};
>  
> -					compute-cb@4 {
> +					compute-cb@9 {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <4>;
> +						reg = <9>;
>  						iommus = <&lpass_smmu 9>;
>  					};
>  				};
> 
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
