Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55033CF698
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271515; cv=none; b=VsFzNRNw5bt7PAH3zM1+QAGFepAlph51FQUiCSDYOVBwJrUYJtvqgZiK79qNx5PYIWX21kYbL8L+yjCxb3m8AONQeBDnTIlwMiQVB3BaR1f5L7sxdX6el7DDCpRZIO/TasiPHlLLcclH2LfMsZZVpBsDVaWwrxdICpmNScEXLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271515; c=relaxed/simple;
	bh=qWsWC7RByPJUP7uR8BF+7n3gQd26XqYA/bFPZTZZSDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfNgjrEWUxm1CSIeiYRtPnI6W2Tju7X7H1A1JcDlQGv4up97GFqEeTY6BrOI3wWxbeiBnkNjbuW7jeXEEsbZc3HxFMzU+gT/6vNybxxEuChjKzSAxJDuMP4xJf9AL2oGEwCRjWdlLsvIyX4tco/fCLWTfe97WoBz5khFDAciIMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ht+T1g1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8ihqrGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ht+T1g1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8ihqrGz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nQJr446597
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=; b=ht+T1g1JJw4cMd5E
	WMFpWuAtvmhdQAc+rt059p4Trnbtp0ebvOzK3R5MSEqBx5D5FWmxFHFJzsJoWRec
	u21oL9lfa4gguVLmHEeUjyWYRHyTMn9mCUOc4cXruAXzjaNbGttvrnIYJavMzstR
	8+3Jsv59IHjNFW+9AR3JgYt69vmeVb0+P0SxouKtI8kYt7BX6w7I0ZDMUizxyCzv
	ciKl3LAfnpdRkYxQTOeVy8fX+aWjw7ORXZ+h3ornRCBShdm9Dv8RuTbyXGXHfsm3
	z4kzDyptfTyKBznKX0XAoX3aXDEVsqy0AlGabstwcDDi64rFEk1m0J5/txE2guyl
	4ZXlQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg1xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90f5edb7516so101993385a.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271511; x=1779876311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=;
        b=e8ihqrGz5yOCXMYFSfa3l3/4fhChOuter64fAxWe8yLeZVDtvnWWCa/0X1DLgLl60Y
         HURLAK/Z0De7cSFvKF1xToCF/Tnj5qRTCX3g0HX528tc/YH21+U8YBlPNSIICNYTqnlI
         xjbzxgBntMkCTdgFB0MwF5NuJ8/ED/4MY6ZRH+2W0yNCj45cQBXhieGPoAi7dVHQNtKy
         i4m3ehHqaMEWagkyCcenNYpk3uWQ0s5uyd2SGAxPVJxEvbsh4suQ5IPk+1uBEpfAxnrl
         HR5ZjExZ+sipUQTm99msvgg0KgX3UFm6wFTQEkeIMal/fe/MO89CaN7OMKljfv5Bg+Vp
         WCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271511; x=1779876311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkTZpNLF8GxjgyScqFNYNgBxkNvufQOs4iQU8+vdxtc=;
        b=Xdfjhm2+WS5OiGcWikuF7z79KgMQHezP7gKWdkyLR4mLGmCR4OHpc26iILThmLW0mX
         3Eie+qwrCvKj/yRVJSxMZkF7aPdeKG+UdDwI039Tr/N8YQfLFkHs4ijMQQ3WLV0xF6dJ
         5WD9BVF7Jhxg0SxDDuftm2sshrGpxdeRXmlG4QYyeueQTmyfY0RJLJOr+ncrt2KIvc2F
         0LZ75ql5OOtF+w+QCW/MrgZejCJRPgXn19gTHzKxj6Y9UFshkVWmezcA6/WMdk92SPq8
         5kwzrpvcqhfLxjJvVjay3ybKmVFtjPV7BnXIUYFbS31/dbrRhLfMC//oYn7sWpWYFU0r
         TzXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OxeGvy+UtXDNKg41kuAyGMKZGODeHquRy5qW/03ubaY/OLp7C5IJOYPvRNpuRRxE5gqt4HUqv/PFE@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzEbZH16NjxURih6VdoRHTfFs6cxZtqaQoVR7B7KZFc683rwG
	MdwCB+m/ScgaTO2j1zEYYctuGrlJBv9pDUOoo53sxlYV4LXQNzZzBdLCHPUy7aTEIXO3xNq088b
	BsDUrQhBojWAZFVlitU8n9YctqB/HACyELnXeQUet0UGfex6inoZ4PIDcmf/q70Kf
X-Gm-Gg: Acq92OGee45L/VSathf1SEsLyCZ4s14TJO0clI1Ui45N91Zq7ao3918KII8wUZaQGBP
	9TLadR8llXBsuLL+frX2UzmnqZFpAjGGUnlu0LEHw3Aeg9wa39+LXM0uYxNCUPF+IAe7nHxk/py
	/sxiVKjf7mz3FSFBynvyXtTmsLQYKbo+sYFgn1T678RuXNsgvKhSvY6RUb3B4FZcSnKoltQ4Ozk
	93wSXPNkz8uB2a9tGkRgUt0PsE+M8pAYH2NHqexgKtAqFTQY1JdjHlOMoJOzeb9T4YPFVzCDcK7
	pq46OHmSSeOBw9v5f0/lgDxsDBUvpkV07Mkp7MZugYL9AmU91iNGt3AsZxH7ZHhVBFD9u4nml2Y
	PDtOOkq6rkEwWkO1df+Ad4p4ypaXSvi1Esh1xtUQxPB2+cBb3+KQYGkQR4wwl65SX0axEr70xj3
	ph06U=
X-Received: by 2002:a05:620a:17a3:b0:90d:11b2:80f3 with SMTP id af79cd13be357-911d13317fdmr2209957785a.7.1779271511374;
        Wed, 20 May 2026 03:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:90d:11b2:80f3 with SMTP id af79cd13be357-911d13317fdmr2209952285a.7.1779271510898;
        Wed, 20 May 2026 03:05:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eac613sm830956866b.56.2026.05.20.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:05:10 -0700 (PDT)
Message-ID: <de210bea-ba3c-4be9-aa97-5d04d4d3d9f3@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:05:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali
 and others in SoC names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rhM2d72WVvjFucUR_7HQaqRThlOHuAR8
X-Proofpoint-ORIG-GUID: rhM2d72WVvjFucUR_7HQaqRThlOHuAR8
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d8757 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=i-IakZOFnYprcQ0soioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfXzXzyxr15/fOi
 mV3c721iUYglZsNVE6k0nirOxtQ2HQ8Vn05lle/mykUcZjM9GMPvqntl8Trz1z3C007e/bmbpuz
 iUcQrW54Tbl/HPIk11hOXDLLy4GKbz5l5pIezEPpyf/qqVhdPHMrzJ3r1G+50jVagwrzfEvmBmE
 FThPYNgQgaI71PuPRSHZLAhnVLA624hBDAHVY5wMlQq+MZsGq89czqMNpUjrGfdpkqruaM3/OhX
 9ifnNT6deOuEqBKtIvtJalt6d+8UMLetJY99N9ehLa8HToV+dB0H5qyfj5as3WmzKh7C4bLNDut
 +eJiSnfFH+UhQEFVj9yuWpJ3Y1e6RJ2agGjCUCT9MhQQWZzohw8rvC/dJxAPZPD+uh935MO6Yyj
 /H05eh9/oboxlG8KOLsc3jxvbc0x57LgIau/zWzZHdR0fIeHK8VHS1US1o4lI5kjyAZBHo90o0l
 hk49mljMvo0j7Jbmfuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> Grow the schema checking for proper SoC compatible naming style with
> recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua and
> Shikra.
> 
> Since switching from model numbers to codenames, this list with explicit
> codenames will have to grow and list them all in order for the schema to
> work.  It feels like a churn, but the compatible naming is still mess,
> for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
> vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
> style (qcom,glymur-pcie).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index 27261039d56f..b5f3a750cce8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -25,7 +25,7 @@ select:
>      compatible:
>        oneOf:
>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> -        - pattern: "^qcom,.*(glymur|milos).*$"
> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"

+nord

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
