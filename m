Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB882D0614
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490702; cv=none; b=MyRZFWD2AjjC8ugr5kltQvYorM+ChKcbeu7Uj/qT8WDTs62Aqo02p6JmTUYqPMSiSCEAWuX8ZoMGgaDzCTM03/k6BJ24JvJ57l5hjPP8eGQG3a+Nyy3Y+DVojka/etSFhsyF+3a4YFSOUkYdK6ImWYI6XJRo7O3cNfuJUANPhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490702; c=relaxed/simple;
	bh=rzKk5WejB+mbn/yRTIRbxkZzr1bQ4VA/zMee/GV8yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjB9dA77R/l01i6UqRGD/6sDZBC0OjDYgAkgXy54vTHjQVx0Ba+G+a3ZZoKurSRoIPPJAqmHyjP4r39oPx8ueQVqBnjALIKiU1MDCtIm+Sf1pElZMY71BSs0EF4rAsNkKHiPZLufYOeD0+KcA10Zpbad8aBDUImAasGzl/9f95w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J93kyziE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbjsllHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J93kyziE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbjsllHE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Er497742400
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=; b=J93kyziEVXCaDbwt
	ZIT0AYP/Y0+O2Lgk/IKQ0H3W06K6bAYtGRhFzD/XVbuvpZuwpBH6MUqdtNwsDJme
	WouloICu0BfgqnKRoKxAXUdFscYsqt+EzzQAr3mUlPGKWa9Z7g5Vs2bE84XzaaCw
	SOrQzYu5omCBrrW6wKKaa972ZNQllDgt2bpVHBel4Z4m43XHQAmU1EoqibHgajAY
	Q4M2Q6kP21cghTLNdd/R8AVtvijc50TVOf5nh9YowLnhNFLjo8+T2wUK3iYDNgxX
	DGMmbGzJS2N7idyKVqmsQuuOeeXQB216jedwhbFbXct2QhlY5R1P0fM7Sh28eK91
	GYrzjg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dceyxg63d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 15:51:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127133794b6so6486414c88.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775490700; x=1776095500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=IbjsllHEUZ/v8E9OXA7/tD/s+FfZWcQcKqrETnI9P5/Tv5KN02nycERtnS12civnWt
         6IOIrCQpf1xGMmXEpPhlOoJaFaVfTRhbaK2jYO0VNRFmYvcbrUoZgXQFOuG2bpKajoHq
         fsoZiULiMUpzWnXltrwKb6BHxIYB31vF8jV1N27OSttLGeOG8PnTvJvIs7OGyD9UhAWz
         iu32/UXhLSLkvh23qJH63KguQgz8Obl5tlGCehiPvepDjovIc4352pDmX1FzRtEfkoiZ
         ZGMY7HeKxkjUT3xU1iW5J1MrHAqwxx7q8DAYHNIe14oYD9Boaon0bLjDaVMQRYqQSQEN
         FrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490700; x=1776095500;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=fZe78GFGcsf3UTlFvCjPLHgFVGxatafeed+MfP1o1vrvqmr3OhaLobbQcBiIQDybY/
         4x3TD1AYjarfv48oRk7uQFy+O/wdKgKCdPIqGImEFhbKLkmQS6kTd202TRbnZfkPCLpq
         RXjYa+I9p/3ebLcHG2lp6DiZZsj0O41S72eBoHU/AxlWuZiNVCUZOpaG7oPtFwBG7IEz
         nAGQ55G2PtXLkA8kcK7Fvb9l6uzoUlh+AoB8g97srLx7OLkU3AxG7diAw4jlytNmrGk+
         MJuTO5eikJe/RVe8c/kzmbb2w0UgY5Q53pmHpjPikz16NIgzW0Tj8ZL2Fz9keFf5zCny
         bfwA==
X-Forwarded-Encrypted: i=1; AJvYcCWzih4ZxhSfulL/GackpdLH6oqJjIwzVJ146E/1/0SJoRXxlOGK5gevmURzdsXvrGpmLK10NbmXjE5i@vger.kernel.org
X-Gm-Message-State: AOJu0YwYduaKWP1AiHCFge8bCyKOQQ8MFLN7fWRG7t5/uG0T2cdSIctG
	LALlBADuik4bclrn4+ckI9sUSgCn994IPDGo+8UoJ59l6r53nozUIm19YWo4eekVu3HDlLqtbAW
	PDAlCbTFTxJGh6/chVH/iWO/yJtM/s1vDCuRRDqaYO1iVTtTEgv+/H6aegmUYTYFt
X-Gm-Gg: AeBDiesPAOpQUHHXbwBVSJuwGHOSVrv2iWchkkIN6ZIP+vnlNFmPAxL3MLSDPQGfSe7
	WJqthbD2GatSl1HFqldi4r+sHXip4+w7XYA6cKJR9qnGdzi8eS+jhT5+ejLpPtJCiJ/mZe+T6He
	txUOZbfN02MswXo9S/8aIMsrs1aohyz1k7eVP+90r9Wp7Jd3HpxTdoApH6Uc8Zo4geK4WMdBQIC
	L6QmFmCcJsIX1b+DxSmYdctZ02tpm7tnJz1GVlWYherM/4D6iib2Ayr/kkPlbZ7oYkpQopB52OS
	McJv8qYXQNKebVY5v3fM1VIBvt0l+qCdsPOs/+qlFrgCCZ63Af8h43zaNuQ2vfn4E99pLnl7KRY
	4lUQDdV38WKahoT7KGrasE/s3X0YbynehA9+2Z0x9krEq4UnoQxNDf2hdG41Nzyi0mOlR00GyMb
	qRIfKOO1SIJmPD/w==
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780052c88.16.1775490700210;
        Mon, 06 Apr 2026 08:51:40 -0700 (PDT)
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780019c88.16.1775490699506;
        Mon, 06 Apr 2026 08:51:39 -0700 (PDT)
Received: from [192.168.1.44] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm15701803c88.10.2026.04.06.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 08:51:38 -0700 (PDT)
Message-ID: <0cf5e285-b5f0-49ef-97ae-6c04504044ac@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 08:51:37 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v6Vh5dJAZ_LWpF9tN9b4ASP2DsVUDdLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE1NiBTYWx0ZWRfXwiIaJ0cfwc/7
 4kwbAHAMTWfMxXZTy2+I4UeUzR5Q3s0dG9+ma/o7s5oyZ5T0muSNkWrz8hQTOsi485lmCqwDGG8
 Iw5hRWAue8H1MoDp9Yds1330B1YEXHqoO/9pYQHJAcjzDPvwsDCT1a4FJK7CimKII51q5D5iz/S
 2kAgzUO2xrup5t/jcYCxiRV4fSqsbgQZygsByos18gCCHf5sg3qt/E9HSJDLT4OgxaDrDB/WMKA
 6ZdEi1gahsXYo//AJS4hqVhO8VsSsUePq3rxdxAospgmwfz1yJ36xcs4hGQHhOW/Oi8e9pJX2/h
 zhBp7Sy7BpPvIf28xyviCdJLPFdz+QhHiKzk/QY56Q3fDTlTSjJcUJDoFnCttqY/P0lg/Fm/gOC
 gj8yAyzA6mNattvzM5JtKcmOYoNlyKxJo1Z+ibOtVnNNX/hFwpc66BFNcbeu3sgjpDZICSuyuek
 hfs/7xy7Tq0tada+ceA==
X-Authority-Analysis: v=2.4 cv=PNsCOPqC c=1 sm=1 tr=0 ts=69d3d68c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=KKAkSRfTAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: v6Vh5dJAZ_LWpF9tN9b4ASP2DsVUDdLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060156

On 3/25/2026 10:57 AM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host-capability QMI request.
> Since this request occurs before firmware and board files are loaded,
> the quirk cannot be expressed in the firmware itself and must be described
> in the device tree.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index f2440d39b7ebc..5120b3589ab57 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -171,6 +171,12 @@ properties:
>        Quirk specifying that the firmware expects the 8bit version
>        of the host capability QMI request
>  
> +  qcom,snoc-host-cap-skip-quirk:
> +    type: boolean
> +    description:
> +      Quirk specifying that the firmware wants to skip the host
> +      capability QMI request
> +
>    qcom,xo-cal-data:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> 

DT folks, there is a pending DTS series [1] that would like to reference this
capability. Would like to get an ack so I can get this in the upcoming merge
window.

Thanks,
/jeff

[1] https://lore.kernel.org/all/20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org/
