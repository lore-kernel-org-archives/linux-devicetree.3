Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09072355F5C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180683; cv=none; b=n00Qmtz5Nc2DE/EmPHEHdiZHYMLbvQjj4j+DsOpy0E1X2OC+V6EG8wH7w1JnlLpDMOKz/5/12EhmK902lO8hwd0b1OhljYOvgElc/PFrITRiTVHyVhlpPSu7dj8qmDw5PNmjITMQpEXUVW71n6GwsdiadmelsMxnGns/HTXjbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180683; c=relaxed/simple;
	bh=ejMIJ7K4AL/QbCIEwHN2FxoTF03Jlrkv3OEcOoovak8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TURBwLHF0AV4ak8D1oAREc4WLaPu0hus9PekE6JCXwZ6otBTFltuOeOQyUGkgNAx53zUja66R+hID5zSKN1OvuZjWZEF7po1fNVltdXqp0fGhj0Irl5o2tNhJCMGu4JvIatHEtTS46OgKubCYm24d1F93nDO6lSxiG+bhsQROjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIeL0d+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JS/sk5c9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIeL0d+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JS/sk5c9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJtp2890193
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=; b=dIeL0d+5048vaw/M
	toCCMUDpgxvu7eqRxY+2cvsABB5QcbNhQFHn7ox/DbZNwDkBucUugiaNcBtsG/5s
	3wqFT1whzwBE3LbOkfiIpUFzuw+SbvLL/Rz8wdOTDn+KQ9vOa5//kzV3xJpGMtVP
	TKxtfYExsp2JNBihmJXTnjsie0iICCVPRDeiva4hq/RS7Eh1DXCGlRiypJr5mRcX
	NChs5iOegpifzh7TB0j2PaJ77qhZd24jii+yHIaJtJyspCHvaKiDXEtxrZcb4tLn
	zBYPALisl0nf/NL56BP/7/oavF54TJSsXdVZs5HWobPiEUW4/xA//YmY+d8qzbdT
	Klruhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79ka99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:24:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51772325a64so107526731cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180680; x=1781785480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=;
        b=JS/sk5c9UUVg+QZmrSgMJh2LzJhLEiEEjW6N1VUcziNcqw7FHmUdWqwU4j5wlHt9V1
         mAmsRkRyEOvU1VAu4fM+s304JNzR9yUqISOk2jfjT6odShjQJyvmWpiTDowmaTjnvJpF
         Pjk/IKT6FrZ7z9SI9cyHckInEgrYQrWtGkDIs0+cxLp34oXOuTMV0vOoVaAihcyYxlm+
         XbU3yToJ2z3bgao9wPryDXaEgI7lK6RTf+Sm6qPn5fCEHNr2b/DCoetaO6Ggmk5C3c2X
         oOZInXC69rb57JzHzOFvao+G1XFm6+GNJHFNKWTu15R4Q4kOvYDpiggNUA1sISdwJycl
         RXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180680; x=1781785480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=;
        b=gG1fS2LUYsQhqrYQNkaqf/em2FaLPuKYkSb5gvFK2a8jOn+Ft7gohilcopepvxGgk4
         FvsCSIukAuEVDdE6GabaN5uTK1Ge9Ru3LVvjS1UIcTBKTM126OfQXqMpSIk/5vf8N8Ml
         +RpN5hChy1osx5/TaerfLQjtttwr+hd50khaCc+Hvna5B5OV8a/jX1fPeMLxZ8MIsD+9
         QI5Kkz2MW10zltX2/Pc8PUwql2KORn5RITkdRBCmU8AKAiA1YLHgvsQlY+heVp54tu3h
         mlI/ppYz2IPKTimcheNgJxWEFRFiUQJS1aL4DfB9SKMJ7tiXpokH6tgST0XU3vL1cWsQ
         biPw==
X-Forwarded-Encrypted: i=1; AFNElJ9/AsSm+TPVZLqsg1aYbfkzXGtyZ2JKIBRVzKMSmkm0CmhkJuSy0k/+jj+tIEwqgBs2WbvKX/I7gnae@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDs0n7LghHqGzciaW25dLqNno1iT1ZjuBGd4pIaUOBD5fhhCo
	2Bxlc79h3z6wGAMyMrPehjdn7ueKbfYZxpV9zQaDWACYVw3bRAZtnZQtvvb91QoAkpH8Hzqtwbn
	/lL+j+lo7Aa9DIT1OFC/D+e8XehofMoh7Y54GlOFBCbsS3bvkcp9yfxqSh9XBE+lA
X-Gm-Gg: Acq92OHb74TCeEyqoKoRHuegjCnKEWa1YLJN7asj509ooKfTB5z0fD1Fh+IwJxOXAfD
	B1ndStKjudJqtt9Z/HstwKP3xmKBO9XBk6xvqn7dfJSzkIL2PivzlCOgjai4HCbseRMS71tgeXP
	+wVCutvuoNC46kCx36/3Cr28vsR9BFKWxfFkoh3AcMvF9wF6lDNXr2qeCJWy8c4xe5ePXwoKcDw
	27kIqVlwujpcLEMPSEzfteepHTZndCuiJLFJ9wiSWgwMDJ8diuPvm9x2MFyrKt0E/rsQkrSCgjl
	a+nMdzo+u7rebe3JCJ8CYWvL5kLUXY/bbzX07fw94V69jSKXBb4BmHZjCQbZEvytZ0KpMavFH4c
	/XFw2gXmZWaneY3433m0oYP2QHq/6osdyDrByHhoRuvI79WZ70QCGSXLrk6Ea
X-Received: by 2002:a05:622a:178f:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517ee26b1ccmr35463891cf.54.1781180680043;
        Thu, 11 Jun 2026 05:24:40 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517ee26b1ccmr35463321cf.54.1781180679563;
        Thu, 11 Jun 2026 05:24:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e47a9284sm39963185e9.1.2026.06.11.05.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:24:37 -0700 (PDT)
Message-ID: <f9d9c630-50fb-4491-921c-0c296ec9922f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:24:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260611111232.EF6541F00893@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611111232.EF6541F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BOrXSZzGBiwKZ0KsBKYJeWbp2JP4884l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfXzWcckd3pztMM
 vT9pIxbWnj31k877ClS6X3iMa7x9hsNiT5Ud7nwoKTaANzHG8MZjcnxJlservMqpQMyQOU09Al+
 AkUhjc0hiXqoLGVatb1laSNdzeTanxjFjFDyCRvhmGRnBV5aJCmOedbrRa0NTy3o3Do5v3tBmPX
 z25YggUb9BngHpyKrQdkvZcZwuIotCtPSXJSyddWH/6eeKOxvXa1T8e+mmOsgd4PQYykxKOuI13
 6fNJ0uBvCMFB5vXQV8E8M/7zIg+N2LhT3V/D5MWjqks7xyGizRtH91SpXjKfph10cmONFA3PMVr
 purvKWaHFZ+zPFZ+Yk9Lk4Lor+XBs37jdTLvAYBJuwBtQ+XNiEcRpa+VD2SFljwHzaLh1ulIPQq
 bXiu/u35+SyIVdBImhjgqj6KMKOS3u3FIA+rPnfdqlhpnnuU+VZh6WDkWyo7Enjr5kzKvP9u/67
 DXLIfNBMzK1ajhEH13A==
X-Proofpoint-GUID: BOrXSZzGBiwKZ0KsBKYJeWbp2JP4884l
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2aa909 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=GKwtICyI_p2dLrIBI0YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX/MfOCwelkd3d
 mdsBsDUq1Vt606Nojo1Kn8xWJSo3RN76YRM9xvBmmOzr0E6CXStYxBICgMmqnYPo/TfopcucUou
 HHkBVuBPSjmxBiXGSktbUV1KtwD5LQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110125

On 11/06/2026 13:12, sashiko-bot@kernel.org wrote:
>>  
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
> [ ... ]
>> +    oneOf:
>> +      - items:
>> +          - enum:
> [ ... ]
>> +              - qcom,pmiv0104-gpio
>> +              - qcom,pmk8350-gpio
>> +              - qcom,pmk7750-gpio
> 
> [Severity: Medium]
> Since qcom,pmk7750-gpio is added here to the standalone enum list, won't
> standalone usage bypass the generation-specific constraints (such as the
> gpio-line-names limit) defined in the allOf conditional block for the
> PMK8550 generation?

I should have removed pmk7750 here :(

Oh, I hate these YAML block re-indentations.

Best regards,
Krzysztof
