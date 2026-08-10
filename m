Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141CC3B1016
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354754; cv=none; b=KdEVT8n6fAjTa4XZYdii2d4ovZgedekYJr2tcHk+XqJVOYxGebHGm09qPwy4Sv00lOfFx1xRYZJt13/MNm87tlkhncCKXF0tGJXsLk4bcFkxaHv79kUM+obkHEWnq3EqsFA7Qs2ktxEoIqmW0K30lAFtt1jUnU/PzyZjfyywdYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354754; c=relaxed/simple;
	bh=eqFMadOm4jit2zzncliqC9YEpRpOfDr+e9OrdRWC3w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhgKxz0EGlNny/ixw+B5/T9Bq+J1BjukFfH5a4D3BT5ieiNNXE9OdIVTbfHXpBQTv0oqZ2tNasZjU2w81s6sNKyp8cJawuSKGcUyTmn2mmDyeNclSfRAD7kV7IkChNfyXSE4t4tRA4oWwVZFdGtf7NGqacb6ehB5Q575eKy/4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Onygm/E8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWJdJA8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Onygm/E8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWJdJA8B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RsBq1231788
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	id0YzdGW9hCG7H5gqzV2c3+mCG6eyUQG6YtgwUVj7gA=; b=Onygm/E8/11kz1M9
	QBKITympRL5WBAL62BvV7JGI9xhwj3ctQ/0HbVoyrfdXdisa3LjG3cTc+FEuEKLo
	wQydJs9wdq1JGuyaNCTd3J37JK0lMX8MRn/P65/do33xqykktbKXaFOYbbo71z31
	t3/RmQj9DmPAOU0LheGXjv9xbtSwflG1XdicL2Ismh62FGdScIc4eECGndwcT1Xf
	Y7PmfcTs9gnkJUrMHU38tUgNBK6whc8gSo2fOc9N+4JgghSYa3ZzjQULjbdgR0lQ
	cOiLFhURpzHpu2MIa7OxcfkK0iinUNihgevLmos8jK9V/vjLNjiNtU7+H/Sr07JC
	/rhftA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh5862w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:39:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d004f13426so27005335ad.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786354751; x=1786959551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id0YzdGW9hCG7H5gqzV2c3+mCG6eyUQG6YtgwUVj7gA=;
        b=kWJdJA8BLAy4xWhDgPd1SIn+QNu2u8KC2F6s4q0P/1EUNUcyKVnFenZ0fR9V303giZ
         /IySo0KVoQK2nqtNcQ6JkK5OL9RHI8hkmuj0hfFVuPlk2ieH9b4L57ARAIgI+yNYSZEX
         336u8a90Q/PcRP12pATMlOHiKNLptykp+yzeQDr4Z3VvxOG2Mj7Cs1J/DH+Cf845ohYz
         5tZ+4Oef4m+QIDOp5Zt6s+A32aQLnzrpe4u7LW8Z5xWPgniREn2txhvW0oqGcjmlLtrF
         Dif5TV+W5tTHpOBUljVPoHSbp+WVWrRILNWFc7sysgmmwY93BukG5ERq5RF0GSDoSmI6
         sxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354751; x=1786959551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id0YzdGW9hCG7H5gqzV2c3+mCG6eyUQG6YtgwUVj7gA=;
        b=Z4JwDsqbsKZ1I3NHZLZ79J25ygSuMYDFx8W5L3gfCsecyY5fO0Ihx3N+mJOwQWqSD1
         33HONS2XtVAeYSMYJ8VXqHeE9SpizIWZSCzTjwM+xgACe1MkN682oKSf5giCM2vmsil+
         HXb2HWxSaEUYlHF5dVUob2aq0jKCNgRjIC1PcAh8ExX6+uA79TywHT+Uz4J86hCoZwDZ
         ttVYfYBQ7WWUNktNO+WEmyKkVllOP/W2CS/M2kavAw/yM2gLR74eVLvRL0qlpLocfKGN
         EJh9r0tWIygSCTFGMqFZHGb8MmeR1vFu5N4NJbofBtAT1Vw9NklTZYVjkLW7uMp4ZHJ7
         rsoA==
X-Forwarded-Encrypted: i=1; AHgh+RqedxU0hy+XYzotdtrR8J9KGca5geMlKntwLFTobwLiVHNT1C7GW+bg/dqqVoB9FcZPekFJpM8EHSs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/g98dzvSwVLQyo6hAP1YNGCQoFty09lOUdsoXYmUZMjdCIEOX
	v9ZJVdlsC/GXOVNyvUsIlxYh2uptXUgDnuTT48qthfGLt4M3l7rHyjzasjAbEATy/a8ooj8TsAG
	E6HZqPYd3u+DUIl7PtkhjzsxpgaSWML9R2PQ07iVUOPSf0jf14y9YHNlwRFpyWMhDp5YjHaT4
X-Gm-Gg: AR+sD13eEFDW/0hGHCw51Xu29aWaHC4bL1eAPc8/tb1HyKwSy+couiXxpIxlJfXIo7a
	r0GsYJzF+Yyi4MB7qdav82p8o6pIWrZJKWe36SU/2nrP/6T/6b2fsMkfsEvdvGr90TL58Yru3KO
	H9K/WQ9z5tTHLalXlnjs6Dlf/66GUREKHidYcx0hMHJGESIbzetY6O5IFWEE5PzEBqd8GrBNXL8
	5NyCIhPwWGYBnaNZzvC8t3Qzw/dtKY4AwjedqfAn4rnZsp5D8pr9BRPH9kamFGFejzBV8Fu+aDu
	wOeM3/B3P+LmOKugTl/2Wrjve7lSWioNgB60fhZAGDHlOisLKDC80Cw1+dPJ41r2T0MNKClu7UQ
	R8yvJ5dv9jz2EjEUTcOFYsh9C
X-Received: by 2002:a17:903:1ae3:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d2fffd70damr314095ad.6.1786354750630;
        Mon, 10 Aug 2026 02:39:10 -0700 (PDT)
X-Received: by 2002:a17:903:1ae3:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d2fffd70damr313665ad.6.1786354750206;
        Mon, 10 Aug 2026 02:39:10 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccad58asm32963465ad.5.2026.08.10.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:39:09 -0700 (PDT)
Message-ID: <34d3cf04-95ea-41ce-a8b6-2169eab2457c@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:39:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a799c3f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KNmlJ2AI_NRoUSMOKEIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LZgEl_JSumSZWFc6VvuiqQVZ1FXc_nE2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfX2IY6nnaMJ5Rd
 RafL6TEuHnEDhOIuGeXq4l4v4cv43XIGrOCVB7AnMTweUGzcr4RefIYupw96Jf8Q35qlh0GNmCg
 CrLWepKtd8bmlW5BW9oCxgncCiSf818=
X-Proofpoint-GUID: LZgEl_JSumSZWFc6VvuiqQVZ1FXc_nE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfX2rkTHOiSEmRz
 c6Jpm0/UzngVmB36E25CukB3/5VSfLcusOYRU4pYxXgFrd5d6taI/kyoDItKf1jyJFo92Aurek5
 nNjhA6O9UmpHU/gSRjBjL5hWjt1/R3Kf9lPWoyqPk4v8ez0xMEKpqn50KPebhrNCciO1Gg0oZZM
 yVPFjb6D5K/KlwzeJ/b4ZhvSBqXUmK8Pazsz0H9f0ObfM6SJ3hdN3uXNTXbYVlLZunP65MIz6f3
 rQaaT7u0Ze4i3CW0WTbn/2bPtrYUYzbUR7jOR3EbnVDPnvrGhkcLtr3PnI9y6twbfYCM80Ebw+r
 IA7BRT6qcMqIvstPcVlQKj/Coc3yz69Ti+A97mWmeQfCLuHQuyLCZjiSfJ6FaYkADbZJR1L9iRZ
 S25lI4C891cOFcLb8ArqXjKQeetcsYJDqrXxSzrYu85GZlnqbW+btaUjjS15kYDKwvcCCK8yxgF
 6gGTsW8I5Px4g9roLoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100083



On 6/10/2026 2:29 PM, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> index 1593a1183a36..44c864fd5fc7 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,hawi-spmi-pmic-arb
>                 - qcom,kaanapali-spmi-pmic-arb
> +              - qcom,maili-spmi-pmic-arb
>             - const: qcom,glymur-spmi-pmic-arb
>         - enum:
>             - qcom,glymur-spmi-pmic-arb
> 
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260609-maili-spmi-binding-dbecf60b498e
> 
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 

This change can still be applied without conflict.

Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

-- 
Best Regards,
Yijie

