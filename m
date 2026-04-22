Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC7231836
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850238; cv=none; b=M+LySKDEDHOosKQakbMP6JGKr3JYSwpQEs+dGK/Bj83tfi6Gil9ke8gyBy/hS+YAZEphqfxI829PE9FJkD54KP/fZpdW/knpcWZ4Ed+HSXrg9uDT9+u8kse+rHzf6PY47rXxio3YKxqJhv6M7vgZOcFe+ZRyLSogmr0FXrbN0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850238; c=relaxed/simple;
	bh=c2pS4mKGjx3625rQXbCOTc3mNgXwRO1UBt/eekqC0MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRBudBDw3of5Hi5bQYBKbOwXkFv7vbYb/IMjyBGm9XfVzF0ptokdQuBeqngEoUKwvDPzA4aYPHHXnmFfIOZWOOJBGbzdHdseRmkqGFzfkczQ9qTSceYj85UttyixtqZgcM4waNJTqScGLM0QaRUaLymYn9IhXnMVD0+UU8jVWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa1tYt5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gThoFbMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fa1tYt5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gThoFbMi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99Fpu4118735
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=; b=Fa1tYt5xa3GxoTNX
	gQmaIy/cqXb5zs702M/NfOYMONVrmiBF2o2IVfbRunVE3kDs3a1wzmYAFUtVhGPL
	VQmLa0y+BSLHd9mYOEWkD425jRAycTL5K90gpBM6DkMF106+m9Ag4yynbbDFuJYW
	hliE5iBbOUqIaTYAze8TDhlCqGMaUma2KvGaqhevAg8hqLRGCbYzQJDhE1IfEHZe
	Op2HRQHrd0fc/KFGz3sYTzrhu5N7qmZEKy4NF3KM6YcNz19fsS+l2CQWbW+fvlJy
	Di1aQp8yUgDuEbzbDO9Oa5Wnmxzx/3/3qIt+n4EKZDa4ARCVdVG0pqdCY4lZg5cv
	w+sA9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengapjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:30:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so14479416d6.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850235; x=1777455035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=;
        b=gThoFbMiN9701SfCcebPZalfzhPWO25LmrW/uM/fWVkX+95mKPWDaHB+SDKWCp9LKT
         1tEfZjPDU3XRW2qFgy1/nHX30pzJS+cdyGhgC9aBRHPSEeyTH0Ycn7ojV6gEr1keTJFT
         jNtS4klyeYKUNohWiPJ630sJEOb+jzZsAlcVW/DXaHjTD1NPee4L6x5Ivla/vR1Ld0bX
         yXBrvTFzCMYpsc5nSq090fx7GoWTOdopvy6h8d6oxA6gPO79LPY8D8Nhgj6gpVh26IQA
         BQINInQaG5Zbp0Xirugasy308hw0nKczu/+DStGoGIbu7CSE3ddd74m2NEicB70LOTzF
         1ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850235; x=1777455035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=;
        b=HAa3Byi+ZbJySZA44zbshEgCKz0XS3twM1pakVbpUrMWTysiHhZyUXjzbX9xe4S2uH
         PczK7/jrw3MeBw2VMAXBHb4x46qeghTF9s9Rb70J/N+3Psw28/p9ETpUXidzUFrHiYlC
         DDovkkssL6CT7pda9NTsD1G+IjosS0K5xHBKIpDpNJSL3fdi009mRCeg6FSkD0OENUhe
         pJLwrqp9zmggq0pJMdaYzy95kbhRU7/CLyXv4q+mBOsg7ty4mHU+K2D4v/MF4buccANr
         WCQxmAulbwgD9Vm3BpRN9tIVEE2/wIZCp2qVLzLXBU3i7FTEaDHWK0xBnGoISur1YFXb
         nQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ8fO0SLCL6KoEmf8VlgBurmlyxzO8FMmrZy9tliuA90uL6doyN1zsWUAWM6/+luwtYspb4fJ37WcSIq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuww3Wb7uTvB2XEAAlCzPN2Z0X1KscaqYRnGp4JpHepFW7+7vp
	7WQMEfclCAqOOxzLQxkXKcxgQ6DNDlIUDMIaBEOLxIUy4MB7lOv6HKcv1yt2lB4dRKxjeEZ7BqX
	+7BwfvVSKaPFtaLZUWmA8PzykBpHA6eXXxU//DuiV29vEZtcbtfNAntKIlZjhZyGM
X-Gm-Gg: AeBDieuPGOeb3Pnm1tRlyQ58FMjsQzwzmsRmbze4FMRfSI5gvOkzYoXCsMULzTLQ14h
	vYYMcvPPf04/KpDdCNhFBE+MGXrVDAjvTMVtaDQgLbwbBxRyh9boun43EzcDkpZ8Aj7DBW6u7N9
	lH1UWgx6YtXs2UdDThj7vJWFDVIiE3l7ZyWNXX6nePmBQHR0Oxrov/uFK6wcKgvdD4J0+lxedO9
	UU/HByg8rxW76yjpq4OvTUwJwyS000ObAoNI3Uww8jgJ6ToZ6SXNtBlixwcBCoEcS0vhR8sKw1e
	M8FrNC4aZUYjp75tp3SORoA45O8N/B36nEQPuWM5AkJz+XyqPRQAQEwy6iHWirZgZbbctjN8cGR
	o/j8zy3bqYAe3Udb18bjPp9f+XibpYMeFJVPm46y/5vGu5Iaq6/G/XA9/XR9v05Eo2rdCPBKA5i
	AL9Pu9v2/eamZKQg==
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr258564376d6.3.1776850235537;
        Wed, 22 Apr 2026 02:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr258564076d6.3.1776850235074;
        Wed, 22 Apr 2026 02:30:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm522995666b.48.2026.04.22.02.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:30:34 -0700 (PDT)
Message-ID: <9b785524-4940-426c-baa7-22a7852f8109@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:30:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/3] arm64: dts: qcom: eliza-mtp: Enable
 DisplayPort on USB
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MCBTYWx0ZWRfX5+02zlAzgbdo
 +e44FGoNaVEkT/jdMRR8Hb3+ndmdz+JCFbo1FjMlU/lmxEoct9CIvuyoEQjX54DPQFfJc6Vg0Ab
 MXE++6nBHlAqZEZLW4OuKjoP++2ieoH07kZ4xr0pIyCO80nw0shhBW04QisfXwJIuwk/Ntdsrdg
 c6aVeSAvWs9H0XTNORNMbSoZ0OITkffYkyGknhcGvNEHmU82en5Vnw08F7Ra1xGPL55Y5yg9Znq
 6PHMze9g4wlialzuABJVK+M4snS5XBOicjdRSTq0AHZDftO76D/sTe0LjVeDpFhQkl6xWYt7VPK
 NgYgdLLzjU6mFZAwt5LCoKDpT7xK59LdVSPtnhfxTv09azy8kUwxN7pykMaZAhcuuORZMpmtJ9M
 Q3aDRM5c8BgxqIwbbUNE3nUX41g8Q0Zn+r6TCmPR7z8zxxkOHiXLdoixX+JhvuzBGZsCtynYjHU
 719BUK+IxtTxlr+6sMw==
X-Proofpoint-ORIG-GUID: lYE4blUO-lDjBJIIPmNODTEVmwoQC1Ui
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8953c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UOlMPMX7TREU8u2qnZQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: lYE4blUO-lDjBJIIPmNODTEVmwoQC1Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220090

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Enable display on USB DisplayPort.

"meh" commit message
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
