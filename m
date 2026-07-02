Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B739182F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984582; cv=none; b=dqLUgA4NNhtpBKv8uxfc0ICn8HgQylErqYFTz2aUE+8koriu3lTeLOaQx196+lSNeSvmVpXcNaJmiwMatzuxr/Zpfv4GclyJNoIgNUWyLqRxshgx8RTp39C7L5It9v+XcafnGnx1QSuis2zIG/FxDqxYX0wL9ba+jdUYIr+ke8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984582; c=relaxed/simple;
	bh=yU/jpemcy7tvW3jtXBoDI4E00wHWts8RzfqbrMOa93c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omM30tZLsJvyGdxWSIMefNdj2JCLMztXcjUpJtNlS7Qc8ds+xj10otVjhhZjZHjMD0ex1YFUMh2Arj5pl03VwEZn2UxWIOKpB3EhgDNdUuQdnV+7ED1dkZcYgWNkC/D4P+I7mbNyjbFJP9HRvw3YA+qp+PYuoiosytfiFuWYhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ago6FKts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvuLy1By; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ago6FKts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvuLy1By"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242tXg3460377
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=; b=ago6FKtsuAh0thR4
	vgWMmcmuhEcLEEA95YZaPo2CnT4Xsr8gbODgmvQbKMQN9YW+sqheZsZLflSMwpy0
	3946ZOI7AvCTBOwzf5Qllf2tcYLYQGHEquoddNJGJhsoDSP3fAQzxkLk50XIvdvM
	vwheQ6SgQLDccCieknY7jKi174/gh416HDQ4QrnI4mg9Y6zyc2HT7IEXKmT7/52k
	NkyTNTKNogvWO8XqXAyDUlPh0r8u5LOwemQAhThQznKHI088QQ9/hsePmWOgW/Le
	dGI+dl8gCtb32GVjPtrH0rt/tVCvYK+xz7OfSgWhb7myliguUrJe5Oq2KRITTtt4
	QhwR1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb154v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:29:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso3467576d6.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984580; x=1783589380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=;
        b=WvuLy1ByE0o7lUTqvjflTbDrOPVaI9vU4pu0Lpi8iwFOSNC0AX277E7Bvo9oVQRtcn
         icuo4F/As8lVUJaMOl+mrm9jykQXdfuAMxs91euLqL28JWUDuWNACUULfoIPBur3MtYn
         VRnTr1PzO1D4GCk87+taB53iZrGhMUb0feoCn81lHEqI3X6/o5PQ5KjZ7c9mCMS4bmDm
         jcIrElS3+gqQL1DgD1CXIznYzrT5T9HfGQ63rFEPBgdrHwZ4okJiJk3Ur1XUajqBYipf
         rarpAbwekQToVWWvZEnAYpVm1o5PUXqfC0D6lLn59zudkZLeblYBeeAs7To51E6UCYu7
         5I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984580; x=1783589380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=;
        b=jo+Y+XOOM9WfKLGp4RmldAOgYg4FpEHhvqkWm5JMT73iYjvi+7cC/4I/AzLXLFbfdf
         wenRATZa+xRnEt2RE/wbDuCPkzTKZ9gpTJIGQJglCY9LNb45O0bfKYhF9TDEtvzAlPCB
         +P6Escv58NBg3WzPw1Tj4jfdnbhthUigisjsVYT5SZl1dmP/B7thXxpIT5ESj8x+1blm
         V46X2cKngFkIPJHQQ/nYcqr0adCKenEd8BQnjYY+6FyAPkIEPQlrxsu2EI2qskLa+Y6l
         P09Hkc21gyqEjh3wNiRhkaTeUzWPZZBqhtGGosZtfl0bDRpm+Zo5puy2LGu8gjDoBv4f
         t0Hw==
X-Forwarded-Encrypted: i=1; AHgh+RrsAAuAquKXQ5A6KmTVPFs6liau1fV1KgHG7mG2SWGA1LDtFwUITwxpZ//osmS3uaHdwU5AwKBBx+Dc@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPvFOfMAbkyTsE0YcF4eYutMUjTGDjTKuvU5wpI/XJ7fxLzk2
	CzlpD64IwLuy7P8Mt2YRRTYsI+DFlUvxD/KzUEpnQFJ2XqFQbA/8vEY1Pml1HH/mtDdmCdUsUXn
	4OIBp131RQADbRhcUQykAkbTPGHhEF/JfZAh8ybnQ4UUOvvJqU+5Jy19H5ffaeby+
X-Gm-Gg: AfdE7clLeU1e1U5M3+zV/iZZNviNuSkGgHMlaKCOCLHUAYqp4r8+2Zxpuicfii8wriq
	BZ4Clcs/LA0rOyWab+zUURx/7661uuVWbhrKGlbxeHsluhgiYQWpNfh5KH4rgEvEi6Lj8+oMF1L
	91urgywLA8XPHjBF3ZHc0yua1UuwpWD1PhjNGAWZ2yup9s8wHnUtCsn8O65ADoTu/0ZTRcEcXU1
	KgIdyoAQ8/iNr/hqcMwnmDm8Uo4gaGRAYlTAj/VxExg857lDBuxr49OvZaLzMWiVNtu5W4jKfAk
	ss74edzpHzfTwTpnhoehWlbz1QAk46aYOjVV8mxgziIJq5jythRmJv0xBP4l12fazPa1eipm+UO
	Ilzpt30cVAcvtNMuIKKVY8xyJSTc4Xf4nDmk=
X-Received: by 2002:a05:6214:238f:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f3c5afce03mr48023466d6.1.1782984579641;
        Thu, 02 Jul 2026 02:29:39 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f3c5afce03mr48023266d6.1.1782984579167;
        Thu, 02 Jul 2026 02:29:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm669267a12.26.2026.07.02.02.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:29:38 -0700 (PDT)
Message-ID: <bdac77fc-41a2-4c89-9f60-3a8eefc9b9a4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:29:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI
 (SFA14-11)
To: Krzysztof Kozlowski <krzk@kernel.org>, Kaipeng Zeng
 <kaipeng94@gmail.com>,
        devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-2-kaipeng94@gmail.com>
 <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v5IJq7zNUWiVso-GSz5rjXTShTRGJyU3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX4ZKq1qNnIjCU
 zKOQeRrWi5ERTjuKRHUREHQXkCH2TSJBGtbOPM/AZwUPNBy4S9veWSUT7ivl987mvCRY8ippnV1
 ZrYEWXeTKQcPoetNvRJ5kDZ6Oqm2y1g=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a462f84 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=HugCYbCrTmYlQir9MvkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NyBTYWx0ZWRfX8QX0kfJJPVrx
 GVXZiraQWed6J8MD8g1pxm80fvYud9lmvxSvVRKdWRz8rdmtd/VwWSua+kNm7K5kyp8Y233EdXy
 i65/yQajAkOvv3voiNmD3sGnNmL7V+UChlU1DsOtH4Ud4mRix+hCBBfU23VouK1SdI10vExMKD+
 IdExGrslBDibhgFuPPiUuIdAl1iRUpe1BCTgahiYJbr04eXK7HYBG2z+PBRZZmMQHGdSMZavtXb
 ZCIy/gBSCKax7Woo93HqLp1s/Bo2/cWrZRm9ThEuSWNoUO9lD/izt7uT9mzjStg+cjCwAcVV2xX
 8RJKfAsie4eezDml9x93ppLYIdubuRl4HfhwnPo8CiKmWa3eocoTD1msZeTkF1ueY4uMkXUoIAr
 xc4ch3E/AArLjtYmRYZfIRRyulumf5Oc0UUjZQlrqKL4HoOkm38BMNLVKC81FMSGfo0eJguaMQq
 m6V7LBk+0zEm+ijTeqg==
X-Proofpoint-ORIG-GUID: v5IJq7zNUWiVso-GSz5rjXTShTRGJyU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020097

On 7/2/26 8:27 AM, Krzysztof Kozlowski wrote:
> On 02/07/2026 08:31, Kaipeng Zeng wrote:
>> Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
>> using "acer,sfa14-11".
> 
> "Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
> Elite (X1E78100) SoC."
> 
> That's it. Don't add unnecessary boilerplate.
> 
> 
>>
>> The laptop is based on the Snapdragon X Elite (X1E78100) SoC.
>>
>> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 50cc18a6ec5e..6b997d615bad 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1142,6 +1142,7 @@ properties:
>>  
>>        - items:
>>            - enum:
>> +              - acer,sfa14-11
> 
> Why no user-recognizable name is used? Look at other consumer products:
> lenovo,thinkpad-x13s, lenovo,flex-5g, microsoft,surface-prox,
> lenovo,thinkpad-t14s-lcd, tuxedo,elite14gen1, microsoft,denali,
> asus,vivobook-s15... and so on.

We have a good mix of both. I tend to dislike relying on marketing
names, as they may be similar (or identical) across wholly different
products.

e.g. microsoft,denali that you mentioned is a MS codename for the
Surface Pro something something

Konrad
