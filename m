Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06742317C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432296; cv=none; b=jJ/FkfRnOV6jr3ffb6gemJfazTgfF3J3B5QlvoesvjAq+YLWEcPHP5GrlRfTdsJ/0BcPwWYZWxl1Xj7XfHLIkKJkXvlG4AzFJsg32F/paE0vd8KZlb1PKno3Ow0mNP80UunXSjBzoMc5c7cC5p+zVH20GvWkwQMinssyilcll24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432296; c=relaxed/simple;
	bh=PefjsNStBfDeB2pFXgcSFlCs1Z8xJm1iv2575Ply3HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwbQPHBfogXHsPdSc2SGNLj+35Ze29OnB3Qiv6m+uK5LrN8J7vu3ai++py9a9dVrEkt6C0d6XFP3uhcHh7QonUaiynL5ajVaM3SiJlji/o17mS+7Hnj24DnpjdTlpRcKPETf+YrgCJMvR3Gayv91sMiwlnhku6nENZjAQEv0Jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsMtSmMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKOGcjUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsMtSmMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKOGcjUW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8etQ3616557
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=; b=EsMtSmMpCg9TB+i3
	/jyw+VnHDv4Rax3S0iynZG2hVL4b2j4ZzD7k3HVUX4KM0ld3JhtL95A5x98PfMz3
	0stNVdd3EeOyTIZQc6ip3VTIaZSX/EmyOnHyBO+428ZmxtAHPBmc1FhejwIISwDO
	8ZQdQqFbuJKJbm1UvzQz/jtNZzd9QXElTTYyeUKc9S3a8u+OW+ZcSYkpiEolsXhe
	4sQ59g0TRpkU+zhiaTwYxNuILCToU+nD7gHS5DonmJhHEpQ2VPSa1XCqjRL6mjqx
	DBc+0PxjEHvAL093m2+Yk8nS18jPV+4rq6rkcxcGoIGtW7ilRFRIn5pqCot2VJc4
	9PasTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1jbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:51:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso60290791cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783432294; x=1784037094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=;
        b=BKOGcjUWHORXrq0ogmAnYkYO8q3hBkdKqWSNx4AlkzAYI5cSl4dtjnXlsQrDVy1+dX
         nWELpW5ZLREBEgUEtlJNzFv1f/ZJdMi1KemE711CX2i8Y72OQVAGFjR9ASByByJY3BfA
         1i8LYZzlIe83j3iNkpqFMWMhtD8wO1RYE8NUHjNyJYwHkhT/VwApbUOvKmvhNrzqT1nF
         RU9B2vdoxeCQAxw3VtFcGuKjNT0N0nNrN9RSe3mzu4qs1LYzmk4hjkjl53ux3gZjiilR
         PHIrAFcXOH4NEGCTqtlc+0zin2Nu4liyZ2L2FlzA3/QF8dyQDr6K4LXLXV4OeTnHpXNB
         yxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432294; x=1784037094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oco9DVA+vlSEnwQxlqWoqEjmDHDlj1IHQjijvwotzUk=;
        b=THhYaVdWxDDkGjaoY6fdjX2EJiCoJimvEuof8Ok+I0KRMDH3Wan3SP7KzXMTr0k+cR
         dVig/H62w6uSflcSj1tZRSNw8qrJphq41KlaqF1mAB+vkdT+ObDxISPXEfksSqE8CECe
         h6VGLl72+yVTSZp6lM6Uhs3JZ6EYbodKacQ0JYqDRRVvog59wXCoxO/SIFN2fQIA8bI9
         S3fBOy9xhNzTp53j0XnFVXrHLJS1Y9kUzVIH0yOmy1WQY5t4we4rQeQnCyAPcoSZkHLv
         swqpUQZy8vvO+CecDBrfjunHu6nemZcK3yKiDzC7FUhiYPsYGn2yDoYlNs5u2Iqh9v5l
         p20g==
X-Forwarded-Encrypted: i=1; AHgh+RpLsRM9Uhx+FA9vqjesSD4+pOnjl2lYMBiuGlN2uuB3OefVtH/hpmvcxUSPJwAYgGgi9IVQl+bKkoOx@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiwBpupb4AhHxQ/CZq+LAzjmZ1O+GPq4yfnHhQp2YwvivuXWY
	YDsRN1RpPWJYlOgrDThayCj15mnBNLtiUl5JyzVqICKdfkjZKTdTqjqD+bpeHPANY3+hkg7s3AQ
	8vK450Bdq7UiasYnSkNdhbQz/uQBKHiuVeO5XdlHnPlJgsEg9UpfsgnwQ2Jxf3AJvJpUn31NL
X-Gm-Gg: AfdE7cnSgryRLXpDWTi4M5gwVAu0F6y6kbpUBt7FokJ9qSwcNIxGb1rKm2Nf1dcefgr
	UxBwh8VVBMRWTdkUMdupkuBebB9kiDa+Oxb/h1BsnpMmRvLrSBslhftM4+kFb6P3XOrtuI37msB
	ZZM4FSNYVf6xTkSG9vQ+UC8Xzc4UW383WO0LSmTsMWWk93aeBevQu8H/CXtmAoIhQj6jTu48yQN
	jO+Gg0Il0jB3dRrxs1ykKTmF8A7mUl84TZ8Rv2JJeZ4Z7v1ib3GP8eSRYZG3mBiZLCQnONMEQjj
	9pjmkCmAeeU7kpo5UZCm3+oRoqDnd336KvvlURBcXkOcLAduIvGCYvq0zD30GN9DbnskHa+GMU+
	u6j9ghi48yQKO1DFQChMxNO8mZCG0M9trQDiamiVi
X-Received: by 2002:a05:622a:1448:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c748e0298mr55122991cf.61.1783432293456;
        Tue, 07 Jul 2026 06:51:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c748e0298mr55122691cf.61.1783432292920;
        Tue, 07 Jul 2026 06:51:32 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm31224164f8f.34.2026.07.07.06.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:51:31 -0700 (PDT)
Message-ID: <ee11c1e6-2674-44bc-bb92-07686906b502@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:51:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-1-1b7d695be2e1@oss.qualcomm.com>
 <20260707134830.F28FE1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260707134830.F28FE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNSBTYWx0ZWRfX4IDAkogc4wM9
 rtNvCr576Ajs5tAjNZ5nKQMtaPYmkzwpUSbQ4vVL9KY4Q5TPLdm8/oxT1sbRzzgvRvXsIjaOi0l
 9F+FxZlgK85520SqlNEQQ/Dqtl0VL0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNSBTYWx0ZWRfX1joS35CDwm6X
 ruQfRCERcn4jsqHZCAP/we1v+oEYedoEZR8rL8yIz03DJis1HcaQrrFFw7Bo3g7iCBt8VcHykkr
 D163vD+SkqhPjwtmhJQ6YcFtNg/d53x9SmiGvgh/WYj0f/yz6LrkZ1YtPNDyUKgjB+zBdGRdxeb
 S14MYFuLZMmnsECz2BPgwXRUwrcy0/88Z+Pk2JDrsywlycKrMazoSYrD84nxjyJICfLkojBbrfy
 MDGQwOURlygk+9jZ6mW2Z8R4GxV6oVC9GlJB6j8Nppmg4aQvDPsGHyJ60Ty4FCQC0aNV9qqApnw
 2nru/EKhC35m5XodiIf+KVp35aaU/qhrA0w6etKioqAinfen9SE3l/MuMUc2ulrOpyYnTnJHlhG
 63juMqJQPkO6JuZ8ELP3nHwuvj5HVGmKd2Gj9lrSqmbNJxlOaL/UflhcaFtykMaKEaBPSs03fbc
 LhiAkZ4vLL7cU6YF7Nw==
X-Proofpoint-GUID: KuwORm9NZNZ1Hhk8rYWrTx7RYVDwLbGe
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d0466 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3o2FgGCN_BR4YKjyAHAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KuwORm9NZNZ1Hhk8rYWrTx7RYVDwLbGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070135

On 07/07/2026 15:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Schema validation regression for legacy SoC component node names
> --
> 
> --- Patch [1]: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names ---
> commit 345707be3cd74ebefeb7a14bc7aebf31883f9f6b
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
> 
> This commit updates the devicetree schema to allow proper compatible naming
> styles with explicitly listed new Qualcomm SoC codenames (Eliza, Kaanapali,
> Hawi, Mahua, Maili, Nord, and Shikra).
> 
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> index 27261039d56f6..fecf9dc05b67e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> @@ -25,7 +25,7 @@ select:
>>      compatible:
>>        oneOf:
>>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>> -        - pattern: "^qcom,.*(glymur|milos).*$"
>> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
>>    required:
>>      - compatible
>>  
>> @@ -36,7 +36,7 @@ properties:
>>        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
>>        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
>>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
>> -      - pattern: "^qcom,(glymur|milos)-.*$"
>> +      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
>>  
>>        # Legacy namings - variations of existing patterns/compatibles are OK,
>>        # but do not add completely new entries to these:
> 
> [Severity: Medium]
> Will this cause a schema validation regression for legacy SoC component
> node names?
> 
> Since the select.properties.compatible.oneOf block matches any compatible
> containing the new codenames, legacy-style nodes like "qcom,scm-eliza" or
> "qcom,apss-wdt-shikra" will be pulled into this schema for validation.


They are already there. False positive.


Best regards,
Krzysztof
