Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A13C3442
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270291; cv=none; b=U7GwdxD4ckLmqqz6pRCQZUyKYGHP2GdG1DTugBkT96ukZLwmBk1tWDsc93K9N6ziUATJ9Nf1QstyIUCdzs3Ucz87VAICzV8yvwiylww/rthC6VIpGK5VC90ahFWAvIpZcY7jPHL8uvITlliPRBX/E33TnYN1EnOsdZDfHm9aCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270291; c=relaxed/simple;
	bh=wqoAuXb/5kA/5+x5+834kRW1w86XaBss8UnzXjuaKOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpHH13GOmy14B+cjmhjg/XfRyyrMOoXbvOBfb+HThYJBdnsI+7eRlKOi90hhNjNF/40O/VXbcURRp1aMZPmau720RHeNm4JE1svW78QpPJ/HP3bYWuD8oJqPfPO56GwQ2O/FHyYJexDsrUUCuUhCUPHa2JjBPuI/qOcpBFMP6tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsBfcvaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMcNWqEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsBfcvaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMcNWqEm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7Z6cr629753
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=; b=HsBfcvaG2Rybi5yZ
	tKkR9RjPZ35hf5lJlf800qC+fcA2avUEgi467t4NCb1T81wC5GYvJ9wS2RXZ62pP
	hF7rqTuMtjDCJ0kvmuSPC5YH+riS7L77t21HE8wGDUA8mJHIUYv4MrdqZiGI3E0A
	YvhpmN4g4ppeKb6Rm/zWum7G3ovTu3QuP4zAVqw5yWZGnfURwJugW0AlY16EHOqj
	Y0MQ+zft1RCMf0Tk4Vd/FcdOwr5Mq+eCRv34ojKOizvzbCMyNpQrLbrOcQv9LTct
	angZlbzZ4Xb6+Hlrk/PzcxRfQu6PF0TtThDHZbXIn0EBu8BtnAdTrJfrnHNSBFUt
	SrdZOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nv5nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:44:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90e0eae822dso103348585a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270287; x=1779875087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=;
        b=SMcNWqEmrKJu2j4hPwY1dNIra3sIWpKsDALX5/0LTfgVV259xFlcbxEWmDCKxNl5Mt
         07F5swvkY6fJYWSbf0JVAhqO5kjaMkM3nl2mgGbbo+NLzOBefRnmWco8QuVHxS2W650g
         evafuQxOl9zAdwEolsBSjX/cj7ueQDTV0d91gEvmMATu2XYUBLGFBxLTlMfbvuK8sysF
         T7qQ5+2ER/j+/uujV6ZxAH5sohxsRdLZdpxwCKcv/CSfYeTpl+Xxv3ylNORJAzO4Ok/R
         TvgeHs14FEuur8J/ri/otRgx4MnXdMS+Jj3AIs311wP+DXZHgsNcIMLCLuOBUHq0+LB4
         PD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270287; x=1779875087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek9kRaJbW8YclFvMHyc7DFynBm4ugWlo225XSv2d0eA=;
        b=ek/QcQeb53I7oSYEM98RMrm1w6cAlQFH6lzbOalpTlSGIVV2/gqeu23PNLFj418thz
         L3OwDA2mPqVJ9B1iVqoGGsrFAxYbwI9Opqh1L4aTjP5QX0LGwbydB24GC2/Tr/3UX6dG
         HqUTSrOFJAsud7F9GiBAHg9sb1e9/bFm86+FTq9XqTMAsMxigjh8dtGE3eiF5fT1lV31
         6V2T2r0N7Sl7i6iFgiQHpt0B82V+j92qrJwKhDAJ9ZqAoHfotAleNVAYAEPvt7LpsqF7
         TmPmMjdlRepu1qi+45EN7OeSc+HlhE+wIWPqW33VfYssj8mbkPrX0cUDi2MwiMH1T41X
         EUdw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tjp1aY0s+//LCkpOp28d+1xk5YAAh1K/LdIw7Tyu0wAFNR4K5EJihZhuhcl3CQfwlLd8PL/8CIn0a@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdvwql1gLGlGhmG/ZMel/Mi+IMlHafo0NnlF5FomvhZOHpgAZ
	NZQE1+UWTzej3xWGhWzuP/PMecCWTlD9TkG6ngK3IZvW9/lxxSS6U5arRM2BHL7uus/Yz960nMW
	4kfecq0b1jzNRet3z3dio/hGcJyl5V/Xz8adkXttx/Kek6DmIM27lpDUrpIiU+JTf
X-Gm-Gg: Acq92OFE1FO69SQzqRiMtKntdM33Blaon4dPGNCAigtEzDkrHUw9CjtfqB+rs1VifFU
	gHwusbj2bg8tqB36SGqtYIaX5e64/VzZXMggp2aisxcmQaf+OO1+gV+FzuKY1TVonqIBTrsdTTQ
	+clVU4qFM2XksXt6diPWOFkJlfKdTns4wi29NMwmtXSDBYypKIihgr9euFUw29ISgC7dT9RsLCa
	kP47O9wjKRfFBlmlpJ0oiMeNb8lnAox+KW3s+AUk99uqAoJPRHmPPMEzZzje9nvee80Nxp5RT+H
	P6fHX993cFeOodME3ynM0rF8H8HUYp8hEBw2kb3QLKJkhUC66OO1t0Y/3w39qMAKzerHnVuOLOG
	IAXOyeRLVqXu5RxHy6X/L/yoS2JoPaHX1hcl8aVsIQ/BhHuSgXFtMnXVkH7AhdlvKHdc0GGYjuY
	G42u8=
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr2291567285a.0.1779270286757;
        Wed, 20 May 2026 02:44:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1997:b0:8d7:ed38:8189 with SMTP id af79cd13be357-911cb003cd7mr2291564885a.0.1779270286221;
        Wed, 20 May 2026 02:44:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31404sm838279966b.25.2026.05.20.02.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:44:45 -0700 (PDT)
Message-ID: <253db4e4-7b69-466f-b4b6-59a77609b9fe@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:44:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MyBTYWx0ZWRfX0CAXHfXOtjo/
 MCZBLpQI1m4oCnhIMDyw74qur8qszc+P8i6UjrQ/n5wEGKHGNSO8NXlEQ/26W69EeTbRRGATnHS
 vHWQL91CKs6TYKzgIFnqo6iz/CU/yOx0tjF0/Igys39oeNHcmZUfaXFMVTcO+7HYCEdRWuHidMS
 aCnN/lpR0AvD4PeHtSpWicNb2bANMdssOppP+W0/8ykf0O8j1wUqcdb4IwbIugq6DWvqB9cM2sZ
 3XIIlZPz2/xhwhkpRSVyX6FD9oFB0R6zatwU6b5NqmQp45BedxaAx7jBU2ew6seWqGacgmvtN36
 aL4o4GLlxcdX8lfiAPOyF8Oas1lqXn42o0KsMCcTgTNvW2Qeu4pCqOWWdDguA9k6iBOp+Yz+O9H
 h9zilhE4L96paFl4U+W0Wd9wZXNrrFQc/SFmfFvqv6+kqX2u0E5461BNVLVJDjs6rd9EKsWuq6U
 BDha3WvT+Xng4lB+84w==
X-Proofpoint-GUID: 71sff5WcaYrEVUEUSocFhc26t3aLSZU-
X-Proofpoint-ORIG-GUID: 71sff5WcaYrEVUEUSocFhc26t3aLSZU-
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d828f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oHsx0W_1LivJTKj_SDAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200093

On 5/20/26 11:07 AM, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.
> 
> Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> standalone enum since the driver handles it with its own match-data and
> register layout.
> 
> Make regulator-min/max-microamp conditional so they are only required
> for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> max-microvolt instead, and update the pm4125 example accordingly.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index fcefc722ee2a495837fedba026669de97350c566..7c74573848bcdafbf6260f69cfcd7a9b58bc9f2d 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -14,17 +14,21 @@ description: |
>    regulator will be enabled in situations where the device is required to
>    provide power to the connected peripheral.
>  
> -allOf:
> -  - $ref: regulator.yaml#
> +  The pm8150b variant uses an OTG current-limit selector, supporting limits
> +  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
> +
> +  The pm4125 variant uses a different register layout with a 2-bit VBOOST
> +  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
> +  and 5.0 V.
>  
>  properties:
>    compatible:
>      oneOf:
>        - enum:
>            - qcom,pm8150b-vbus-reg
> +          - qcom,pm4125-vbus-reg
>        - items:
>            - enum:
> -              - qcom,pm4125-vbus-reg
>                - qcom,pm6150-vbus-reg
>                - qcom,pm7250b-vbus-reg
>                - qcom,pmi632-vbus-reg

This change needs to be paired with an update to the existing DTS users,
or validation will fail

[...]

> +     pmic {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        usb-vbus-regulator@5000 {
> +            compatible = "qcom,pm4125-vbus-reg";
> +            reg = <0x1100>;

This should fail make dt_binding_check, as the reg value doesn't match the
unit address (after the @ sign)

Konrad
