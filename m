Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30321D596
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550165; cv=none; b=XQJidM4ZZTgSxpcVYFdkKuatH4C5aPrSVV4X81R0grSHQbc8ZIgss7GuxISKd4IMRsEKljfEIBRTpvrjlujPLCsDgRM/KVyZPuZaiusNmLrmiJXHZonRko593P3p9NPODO7gssJl9u6D53hjiqw1UwKDtRyHz45kNYEfOHYcW5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550165; c=relaxed/simple;
	bh=/M8+n/5UrKqJh506pdRADgednbbTX8KAPo50ezwOXxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPcpYPE3ww8iBFMf+Cq/JXe1x8gdj1P+wmWBvMLi+UG0h6zSjxd0PLej6qijPNWcFTgtdYsxMyQV/ND5Ggw9m/gSLtyn80By5BOrlrZwaUdH7SSq1eQxOVKKZvH9EnUaFHCoKcuglJBJ0XJ62nxpofEOP4Q+p5sMlr3OXQ6JN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXb6G1hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSMks5SZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXb6G1hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSMks5SZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ0R9C1389815
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=; b=MXb6G1hN8qxZzW+u
	znsZ/w75fufoCLHLgjLOOblNrlx167+HjgU/JFD7gZujQhx8jVXMK6b0bKdnUd8J
	OhZzKxMP1Gi0PdMgGmTpMqF54XprE1aUk2xyZWYe6hqBpNzDiFYSou73NHZOZ7vG
	a21friFRpoekX3D60ysB5pgObieyosfot+1G8lQ0ke+J2NBAasM1GlAglWVVh3GI
	Tce8x1g+43BPvZ2Zn+NHb4PBfKF+IrFxEJfbQV7EK9KLkFS9pTx3CkYMN1qQC/pe
	zSapHwSLhnYKkqU2oevDgNOiiUGKKCXSrHO0MbOKB44rSeMPFWBgB/J311aw6/MC
	YldLOg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter22gqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 19:02:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ba395b047so541164eec.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781550161; x=1782154961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=;
        b=LSMks5SZuziMYWNd05E9pTN2/xsuhqXp86jRaAnwYT+oJYBcqctQUzI+qCYEY7sgbP
         zKy/JMQEsUp3dJh0MBJda8bZCIswjT2MttB7rJdsBgFPNKpk9gNSoqNDUOqaJiyPgK3K
         cPEA9Fqd/KzRzEDM8d8wzObBgi4cpOrM3jVYH8CnRzZrdSNTFrOsxlhtEFEPJ9CeOo/u
         ZbJVNou1cke6drzLUawRBrxPbjsJSZqFaC0SWw4cvcfqn7pqFsskDgznqNskXeWx/9sO
         UAON5CfKa951KwoQeQ1fxgJ3O5CbpApP2x0CfDVLfNWPlVF2zqOAC+C8mIWxavsLTOrE
         +W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550161; x=1782154961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCIFI4ENSoLpkomFqMplNv8XY2zjIcdh+jKpROESdcI=;
        b=kDDs3eScbFvKCdmgsvLVQwShAPUlm2O0z+WPAmBmZ29Uf73f5LwxNcaLNbOcrNEsUe
         /lNajV3nDYJ4vruy+3GVbw29MvwT7lXK41YUOI/jBmgbDKAmjFEFYCD1xEuEJxUFW2n+
         JLjKRhqSMVsGlE0M1fUw0wtI5utDOEfVnTVmbBGtkcLeGpl+aUDU8h+QIJDSfzn301c7
         1gr1/4JXsWD7De5SaIsN4ZChphMDkUn6CCmSR8TuMqIVyn0DXUvAoHDPdeQLeo5Ro4+2
         FUJ0ldXsWhhkn8CrxsYbibevDConBghF3WBO8Ic3iIDFooyt2fGe87eQS0ez2TUyQmXx
         yagw==
X-Forwarded-Encrypted: i=1; AFNElJ9MnO/GpqROZn7RDhmwR+nMsDx7Z7+jgRknuR0g0Kbm6to9Dtqw8dwFv9MG9jSiFYrLxMmlSfS+PCLM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jRZhYqwaHzFV7T6wAHmlqEtiiE423K6fxGwmVx4vIwGIyNBZ
	8l07nGridIdcY1tYa7Szt0K5oFr+Yagvh8FJiL64+zLSKbNcfhgi8hT1QSxYdxCMvxHVmbgsKbx
	lSEfgsmNCsU6jxcvbqPrEAc0c2XpphyP8HIGa5FXlUGVKkOEkh1GRzJWA8F9WxKf7
X-Gm-Gg: Acq92OF1F9Q3brjLeW8RgEw/fWhMlJl/UdCMMuW7xds0cyDG8e13uLRpH95wBJ2tvJO
	JTC8QaNXsPDYdXwiCfm+rRTrPUHaMSPVNAY5LwePgAidIa1kqyGwOtkBPpONAVAZT0it1eAr5Uu
	Vy04d/BOEKSesx4McxScJEfWXy7Exu49z8Xn7m81ZJx8aL59B4hCafzPmseGvoqWzc5tiP4dbQu
	XKIQw15ZEiGo5J5VgKRJozZWtbvUNAznnIymXcpn2LpUyp/9JM2Uswl4ReK2gIq/l2BX8eFW4fp
	M3pHWa2ryQJB7PYwYXsmFvW7WX0ntFe3ig0+/1zvT4i1mucCkLRX3Ssv6fBDSZWfJuIouzRSseo
	kAKyVCJESgZX2OptjmoNMl+ukhUMCD4et9TzP2xVR5guA237nPK6fajlyhsy5LrZcK3P78W+F38
	ImJgoY1TdN7sTwzA==
X-Received: by 2002:a05:7300:542:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-30940075f68mr7135067eec.24.1781550160566;
        Mon, 15 Jun 2026 12:02:40 -0700 (PDT)
X-Received: by 2002:a05:7300:542:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-30940075f68mr7135001eec.24.1781550159656;
        Mon, 15 Jun 2026 12:02:39 -0700 (PDT)
Received: from [192.168.1.7] ([122.177.240.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e920243sm16062283eec.18.2026.06.15.12.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 12:02:39 -0700 (PDT)
Message-ID: <9569b594-a4b8-4e67-ac61-5eb2914bfc76@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 00:32:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
 <20260527-lucky-porcelain-bullfrog-185f1d@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260527-lucky-porcelain-bullfrog-185f1d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX8DxrO4GKL0Ob
 15EO69mLKn/ze3iOEyiDLj1f0cHVp1E2+gaXiNNJJw0y16nu0yoX6OZ9jxdXUPIUenNwv/ObL9H
 B92TMj++F6o3iOUglUL9KhqZ7TeRs0M=
X-Proofpoint-GUID: Qbu_6mThj_JuYOkcKuOojmBe2uZ8Umht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX0KAXXy3rLiGA
 a0tBQ1qRP3hZeoZN+HP/1o90553t8NMySjzkAU1iuJ8cM5HRkLRxSkC5SUpMSE5MLDrnlRB2C/k
 Fx0qPTF5UuqTMgY3wd8m0LAdfFZbV+4/u7zkNDVaU9FJQZdg7baZtS5nUqvecQ/e2qt/aa061e8
 hHd1bzA39ifngw69FEWWrHT822L22xVxDj0WcaAMx90vDt8I5AMR4E2KD3ztmo8S3PT6JUuBKnr
 ARPhW9W8INS+r06//+zV+rUav44NKxaYOeE2IM2l++5GvOIM83SgjiS7uPj2RFFvkOLo7eh46Pb
 PEGYDkLsJ2S7YiQICjiFmhjLNiVtMHq6UwYFYVIxIm/OdzQhhUuV4OQRJCVMvM+XPK6GCg18zV3
 xTTK0IziTBoIGIVRz8IUwM/YpQr4v3BdbEi9M0Ewxv3TgiI+EliXqftWoNPR6EEB4F3g7dZyC/D
 uyh66bN/ACxd83bDpzw==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a304c52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=6oJ3Pe8WsobediNJCW6FeQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uytp2g_U9kgvtl5AwR0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Qbu_6mThj_JuYOkcKuOojmBe2uZ8Umht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150201



On 5/27/2026 3:16 PM, Krzysztof Kozlowski wrote:
> On Wed, May 27, 2026 at 12:13:59AM +0530, Pratham Pratap wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
>> there are DP registers, the required internal pins have been removed
>> and hence DP wouldn't be operational.
>>
>> Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
>> as per hardware recommendation. Extend the bindings to accommodate the
>> additional reset.
>>
>> Use QCS615 as a fallback since the software interface is compatible with
>> Shikra.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
>> ---
>>   .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml    | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> index efb465c71c1b..65ae4c6e09db 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
>> @@ -16,8 +16,12 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,qcs615-qmp-usb3-dp-phy
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-qmp-usb3-dp-phy
>> +          - const: qcom,qcs615-qmp-usb3-dp-phy
>> +      - const: qcom,qcs615-qmp-usb3-dp-phy
>>   
>>     reg:
>>       maxItems: 1
>> @@ -33,12 +37,15 @@ properties:
>>         - const: pipe
>>   
>>     resets:
>> -    maxItems: 2
>> +    minItems: 2
>> +    maxItems: 3
> 
> So QCS615 has three resets now? This needs to be explained in the commit
> msg. Or fixed with constraints, see writing bindings.
> 

Ok, will separate out for Shikra and keep only two for Talos.

>>   
>>     reset-names:
>> +    minItems: 2
>>       items:
>>         - const: phy_phy
>>         - const: dp_phy
>> +      - const: phy
> 
> Not phy_phy_phy? Joking aside, you already have a phy - "phy_phy" - so
> this is not correct name. I don't know what is the correct name, though.
> Please consult device manual.
> 
The resets needed on Shikra are:

GCC_USB3PHY_PHY_PRIM_SP0_BCR
GCC_USB3_DP_PHY_PRIM_BCR
GCC_USB3_PHY_PRIM_SP0_BCR

Hence named the third one as "phy".

Regards,
Krishna,
