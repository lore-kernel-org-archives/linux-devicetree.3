Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26533D6C0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067914; cv=none; b=E/wotU3pQhiyTV5rtPlTl8b7UlC9NpyAYy67eG8/NnD6EwqKo+C3JqWQRV7Q8PgsWV+xg5pJcJi0DZjeE07zNfEHZKt641a75SvCQHAAjxKUKxOQqzYRn/DB8aRs4vwZw+y8oR4Ddwkv438klFSrPLR6oTNjkApBZQHZWgKnkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067914; c=relaxed/simple;
	bh=cdBpJkB4l/ZRo4O9VKG44JGa5I2jAbDW8goIFlmTmp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUY4w362mtbgZcO872CkPd26l/CPQMsc53ojwjNIfAetcExVaUmBEKDSmpBGtNP+Wh+D8wgc5lDWi9A2X38YGLb0eJ1UCLUWc/y6FxcOZwn1TfguFvd8sT0Xfcr5KBqCekWiEKnPn26aXYvDmWvZs/cp+PtHnXJQqKeTsGi/N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlqBeQ60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dM6jI659; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlqBeQ60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dM6jI659"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zv9p3410421
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=; b=WlqBeQ60qkIZLhWx
	Kf4n1LSI6Tw0suSiShNTHd8D6b0jay0AG/pBMBgFrS1kQ1LgxiKay+T5CXIFCr6d
	KXz/dMxeHlxCIhPaqYHoH4DRLcjgIyEi07Rslbn0ne32eSoY/rbl1s17FTwyUAzj
	rdsPz48ickOfyZsdL57OwYx06JWoV4teyhunVc/NUHY7RorO9kjHRQ9MnBEj91Fk
	1oxQjDQedUoz0WxfIhTWbCwnvTs7fTnLhZcC3Q8MlOJd/d7GK8TKRO28/44QQ8XG
	EKdLpfHOzWfRFj/ZW3SHEtaEkNX4EqvOAf4RZkbskcb0PxUpCesWqxsgDI6MFsQx
	XznlXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u307au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:38:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca0d4fb061so7202865ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067911; x=1783672711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=;
        b=dM6jI659XygDcPD9ZihuiG76xg4zPAGD9NmIM9/yB7Nuzn7qKzF7w1duq980gIjqCA
         a8aSf1x3Fx6BftyPJUoPjiUm8XnnqLq65+R9EGax45ABkjUBH4xui3Y8fzFma7hxhOIq
         8yBOkvGQKu/JLn2CHZXG0UFSavc3Ra4KCD8gix4oVF+imLYmMowiGym/I+PwY78mi4JQ
         e09nnPk3SRbufurr/R3PME2Dk5gcRJsuwkaJSIdCqdy399C9hz0rtxJx/pFE8jrqzAts
         EfpMThpCySWX9tz4IG5MNmnRrYZHzkFdvVww0VhYV0gt4lcvVR94VIMMktJmmeFzQsgr
         gz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067911; x=1783672711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=;
        b=URrk3ITUHAXPfGeBjHk9FPVYEHlLtpUmsfCJ2dXtoml2nGyQaSYiEuyy3m4x46BYxj
         liutX68qqw0RfMUVFn6hdMhq/nsVcdUC1WJ0lQmUpRPruEnQ1d/nO4lfZ0BJl0q1B4q7
         s1MR80JTsg3qNa1go1v7eVIFvv+ODOlWg9RicPuitkxsxgcEj2T5cIcSSeLueLjAR4Zr
         P1sYHFOUsMkWr0+dliya6z2CSbUT1NAF5Q8/nh1zsFqS1wqiuUkhyw6CKuAgav+8PRB3
         T7FTTR2AEoymbZu80gY5ugvinmkbsm+AdAEhwy3fOhCLGF3BZ8Bxf70AqTLY0XpvPb40
         svLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp61ToC9HEKvE3zWK223hwT7CGN+X3ZBbXu+HfdA4Q6SfW91T1mTp/uETZffHHecF2n7BupWZesYKCN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Bl36pSP5EDJnZCoBvODsmOSoub4MfJjy31IpDNQq+0fwMHA9
	hMzIy4I6Zj2RnhD4cFKlxdym21qXNn6LtGLfGlvXeroqLVEHAceYrXqTHTUuCKfGlL1fc9qsNQT
	MyLP9mjGQGL5WWgu5TSUUgZ4+aQwBF9vNMykVoCLVw1lRNvIwZMbby4h82vOvRgA/
X-Gm-Gg: AfdE7clvdsdls9joJdu4B2FsIVKl2Pf0wRTsWYNLO/qyVr+fUhrMEPaMmEZdGRiERu9
	OQBQhG7FmT7rDKaLvuVu8Oil8cn9i0YQ2g3dtW347esmK8j1P0WBKBnpZ+KBhsdV9U1ofTZqH+b
	rXGNpwrzArHUzTBjuhXLWJ+ziSKAH2tYXtdXY6CeRebAYs6VJYeYm5I/EJs/I/6L7vq90pbLZRm
	wJrGUmOHDjr41t4wspXqWBsM1QtDvYHT/QVyRCSejqYA0/G42URv9/a6D1zcZ55D/DdCrXJeva1
	kIuLV9bRUh7b1mvuWFz3+X7CBG2mppxWHw3UNVAqsUGI7QgWzOz0QSkv3EqZG5GhnedCTdwHQDp
	eBGQeOJUIFPXeQJQp+/Esdt1yw9JyUVByPsywfvWA7S8=
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr96678935ad.45.1783067911332;
        Fri, 03 Jul 2026 01:38:31 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr96678625ad.45.1783067910779;
        Fri, 03 Jul 2026 01:38:30 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm15875811c88.13.2026.07.03.01.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:38:30 -0700 (PDT)
Message-ID: <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:08:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260703-steadfast-greedy-seagull-ad32ab@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kM73g9jXH3CNIjOY6lR2qJVEdmaoUhm8
X-Proofpoint-ORIG-GUID: kM73g9jXH3CNIjOY6lR2qJVEdmaoUhm8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfXwEy7JjbDhBRe
 gcF6+rypJ6rqPwYrf+UZ3WgDMPS/SJeB9UwyKKRTde5kCa4YuHkb4zjbBsZr2OQ1wWla/wfP46Z
 1KyTjdhhsukIrg9tJ7VCU19X2+oaHxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX2OYU3nRTFSQb
 n1kr2rrGp2mAIc83ooG8NzIt89Sd/f6oOAmB2mZHFonwHHWI/uYrUUEf/hXsDnR5Nc0c9sUDLor
 eiFPC0O9Si0Ov/b9UWcaKdEMZlf0RW5u7J1+BSj8BCrKY8nZLjlboqtdgdnDzJBLD6t+VzERNJj
 CAdDtYSxAAh/4BGIQGTtw8cXfeQMxsDdmqqghupQlIHsS14dHuABiDkZAxWDcebhExeg9FWMrfP
 2Y4s72bfyVowuflqOv73xnDzBOy11R5RGE5MUQibKl2xMlrVGuJCUpGTLPFb7/0ZpkV5dYyYrOZ
 RphBzuUEryxZKowKYLOFn7wYLhmTKI/6LzsA2p7YJQqLrrLxKWkFs7DiJmsHFYGtugl4h2U34eN
 ntxp9gc9DjLlOL+unWRTCwZ86gz095yhPLfH56xuZtzLgf/UCAJrwMAzQTia7/VemqRMXD2PhcH
 kfeii4ZwxyZVU5Woa2w==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a477507 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=B0NKSWsiUjiwxuKyzxsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030081

On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>> `iommus` maxItems constraint.
>>
>> Fix below error:
>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
> 
> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
> which do not exist.

Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
describes and hence, updated bindings before to accustom this which also
helps in avoiding rob's dt-schema bot error.

The same way we add qcom,shikra* compatible before consuming in DT,
isn't this case also similar where bindings are updated as per the DT
changes?
> You cannot add incorrect code, 

Shikra bam actually has 7 iommus and hence, bindings need an update.

-- 
Regards
Kuldeep

