Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62F3B14DE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577828; cv=none; b=W3TSc7PGWMYOFhwWZxMxRtpQSwTyz4JC51fRi5R3rKX5zvKdDhDuHCZmm7pcXfjRrY/KbHNzxszO8U1+hQZissouvI2JxdXZ28JndvquUfY/B1V03ATOlLCqYwE4psdebIDgp+cfA8iWCC3tbM62cH3IrLMozUmuAlP7NupGv10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577828; c=relaxed/simple;
	bh=vO/oHDtiBeK08zj99SdGvx+O+AqtAveazytcmdamWNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+UYiaZpAd9yL4BAiotcT1otxkSAWBjTiW2FdA1KQrbFmgfmDT8kxgXd2SCch+iSFvIEpr+TT+yKMc65wGD2kN6slK+MpfFIKt4kESXxEBpaIlJUI7RhSLQoXwWDkPj87J0mjFtTloIagoQ+FYGYFPZ2cPTjOtKLWKG/Q4xnwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8+9F8Za; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6rJ/12R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8+9F8Za";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6rJ/12R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTrl53637946
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=; b=U8+9F8ZauaXSKAKV
	09HkI1bnYwNsdI7bdnYTPPm/mxMMDE2lkCUBCCBA/2juPasq6ypYauSGhj260u+k
	Y0az3kIc30HeDNc5ddbVD+fzpQMlQPy16Ss/i1B5xMYGsSqzotOlOgauuhnVC7Le
	V/bR87/J11YrRY2JDYYwoWS0ckadKvEmHZHnbAHtT6rGaSKaRVGkXe8x+bCKCk1D
	PsWeBMgzV1LTOeZnCJJ7jsEIDYDZFQ0o3KC3diYVGaDpw1Wxpu18P0C8AigDnSoy
	HuGWEGqvHiwKNYUFlaRWZNZkCuYrQrLN4dPIUEDGEgkowjYuoK5WpvYyDi+oht8O
	jIJ+GQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgytmhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:03:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so101671281cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784577825; x=1785182625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=;
        b=E6rJ/12RhVu28SzXq1jncVWQH7kwyoeGm7l/pXfpSolw7Rh0Wd6ytom33MshXmfkwe
         zAW+D/ySq0JMz4QFUdBHs1HhYQRYaiSEAxnGf/7GUBZln1DY3u0VloQUuc9FT7XTY6Fr
         mq7YqYOdsr7lpSVw2ypaolrFkejjemA0ITkxOCMxkOSQz/07252BsZc5ahPqvQlja+JW
         ERGuz212/z1DVky95UsMa+9IQTpq4ke/CC/Cg1A1fp/aM9zKugRBZVhAkTch7FSHsqee
         7MVU7txZFQ96WHgE/UPnHoXitc5pn6M0TraxCI9EF1oi/zg5KiuOrvOKYYGMlExDVGHv
         4I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577825; x=1785182625;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=;
        b=SBjM5oKOeEI+z+/zRD7ArvFXE03tTV3uwW8oFBDccSleGBpXWbKICDeews0mE5i3v2
         C2G4ZM7wfvX7h7qgUuADy6y4JUzVKToWI7dXRgIul3JhpD41CR3ypxme9n8U3dtRHeSp
         XZlAaR7imnzlGI4byvjqM+DkS50RnW/RBRPSvAw6TEjBGXTM2MqzAzmiw+YphO2E/FVY
         oi/3o1wcvft5TGett7iDe318YKORsXzEarQjkEIF+IzggPtVzBscpOsmf9C0S9ktfaCs
         bdpEtto8palMl3HJI/1Pr8PpVFrSAOrrmCDAwiFX1Mkhmwhw50wqDw0uA2++K0OoRlqv
         OxIg==
X-Forwarded-Encrypted: i=1; AHgh+RrlHXBRSs0uYxHQdSjVpn7tHXM6EwStzJtKpsiqeuMcUJ2Iu9C9g2DVgJmjDAXkHte1igFuf4WE+bHk@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVup6xWHd3NVETGCSMvn6JBTRxFKXTrrbqLEnOboBTB6lFZn5
	Cvl1JUZMS1a4pNZe6cXuziDIIidwpWvJ/h6u4EVVeFQlLKEzMkC9kkFUw/O65S56HRSECJKvgbe
	W9LoBvTcLfJp+2xgM5NgQQYLs9NcNKyz/00+O8KTCC3iNF7/SO2BJgivane0IL4OyORIH/bkZ
X-Gm-Gg: AfdE7cnki3gHq3UpLngS9BiU0bRqpGkE/HBf6oc1kG6urT5QrL3OmxvHpa8TYEePS3n
	axWyF0TS7bWMQMl4LZfncArgHiWl4HzDLR6N1sjljq71ZNp6+Hnr8mkHR8QH7CcY1kfa9UDlRSo
	SJpDiQVuxl6/LpWCpTcJC0EeKBY1kME+y4zP1TAv43hFJpQjuKwm4Q5XGFCg9Rocm6VpN15avwG
	tLUNLtdzaxaS9YiBqFUy8CTlGuQ0gkSZTYEELvmnCXUJtwG21qb6Eif4FzU+Q1z8YNa+pRqAhZj
	yED7OGpkjT7AfrYR7ISb7tdtfYoku52m0SBlJwJtw+e6/OiIOC3dh3gA0k7B87AUdrljkF62kM8
	V1V1TKorAgIs1abTqQsHOQ10ZORLgMQ==
X-Received: by 2002:a05:622a:11d3:b0:517:7188:c47a with SMTP id d75a77b69052e-5213a383d99mr155225031cf.2.1784577825107;
        Mon, 20 Jul 2026 13:03:45 -0700 (PDT)
X-Received: by 2002:a05:622a:11d3:b0:517:7188:c47a with SMTP id d75a77b69052e-5213a383d99mr155224681cf.2.1784577824676;
        Mon, 20 Jul 2026 13:03:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6980582csm25074273f8f.13.2026.07.20.13.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:03:43 -0700 (PDT)
Message-ID: <86d72cb4-ec52-457b-a175-a7123e341b32@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:03:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>
 <20260716211439.GA1290290-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716211439.GA1290290-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX/vinOBm+QI2E
 NBOu6Ckf0BExmonrv7nf+lByYJW7UjO2mJ7SlU0WGrlJpxxmj3UxkKyAro1ArtGcsyaX2yeBVvn
 A4oeEar1wtHQyERGNOjeAoOng6jJWIE=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e7f21 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qU11fmIgajKyYpnEY5wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nlip394NaR49HEvzT9D_czg69cgj5CpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX43+H7NiEsKzZ
 spF4eHqZFx3n1uVKUBnYuJM+nqxxIw44pkpzkGWAxluR20OTdVYKntWRQcRNe6vyrlkz5FHEve+
 hYxrbB4BImgmDOuR+ROAk7Goh2hS+3/2qP0a0FD2nUeDfkDTwA2/nNLXPm6Ss1rtZ7z6lW/MJCG
 KGRP7dYk4oYTWDTu4VpPJl9/ePg6fboZhF6AOgZ50U94xAvxKQarbpP1lNK6f+8QT8vs8M3u78Y
 MG3OWxceMw5xosMFa44TitTmxltgtZsccEs49g1iYB6p7bwxSo9Z8AlG8SbX8OU18HVQfW/g/jU
 pqHpWXtwKJ74ZDjJ4Q8bNUZoRud5+9hrzDuTO5Xao9HJlqzwQorAmuD81dZsSbWpZSi0bAUo+CZ
 4To8Zyb5CyS27sAyDTw/OZi4Rpk3pgeamEbG4VTTJ/k/RQm/7+LzwZdxdJ1t790gOBQnz+510u4
 0RyI1I4ko6yvqOamtfA==
X-Proofpoint-GUID: nlip394NaR49HEvzT9D_czg69cgj5CpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200219

On 16/07/2026 23:14, Rob Herring wrote:
>> +            - qcom,smmu-500
>> +            - qcom,smmu-v2
>> +            - qcom,snps-dwc3
>> +            - qcom,ssc-block-bus
>> +            - qcom,tcsr-mutex
>> +            - qcom,trng
>> +            - qcom,tsens-v0_1
>> +            - qcom,tsens-v1
>> +            - qcom,tsens-v2
>> +            - qcom,ufshc
>> +            - qcom,usb-hs-phy
>> +            - qcom,usb-hsic-phy
>> +            - qcom,usb-snps-hs-5nm-phy
>> +            - qcom,usb-snps-hs-7nm-phy
>> +            - simple-mfd
>> +            - snps,dwmac
>> +            - syscon
> 
> You lost me here... 
> 
> This all looks pretty unmaintainable. Perhaps you should give up on old 
> SoCs and only do something on new(er) ones:

Yeah, I think I over complicated this.

> 
> select:
>   properties:
>     compatible:
>       contains:
>         pattern: '^qcom,'
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             pattern: '^qcom,.+foosoc'
>     then:
>       properties:
>         compatible:
>           contains:
>             pattern: '^qcom,foosoc'

This seems to work well, I'll try more, thanks!


Best regards,
Krzysztof
