Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F835B632
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866100; cv=none; b=MDvMz7hxLJ51uE+LUifDNN12ohumHNjSVyOxycc5fofZ2qUZ4WniL+DnsoQb5+CmXxkgfg1008TorkW0i2WjGFyCp/2HBQ8pxJC5TkvnHH5nP6fPU5dGKHujcbIFNkBEtuaEW4fpBrKykZkGQKqOXEuSjiEqczcHuBCj8upEAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866100; c=relaxed/simple;
	bh=4OBfFkP2MR5rRsAuPGckpZyAxiwK6hDrBhXT2Zor774=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lE6Y6SEfgLBQPi/wzsPSds9fPlxsJyFyEXvPp41cM+I+7c0Nu8vXoOVTdzLaRBT1uGyzr2NVebt1eBB13KO23rRpcGjRdGu8OvXpwigMesSzgEK4k0jideyteefBTSqRY7UwviO3nIWV4iw8cVxdE+eS2TWQMSjJPKm4caCD5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqrUEkoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNyh6xNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqrUEkoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNyh6xNw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9lNvF2197293
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=; b=RqrUEkoj+timjdrw
	IywQYX9btrS8DcFXbWDvulGWZmC/7IA4zp/8bW28dEwYvIY/E00DTnCyG9aty3nN
	IiR9V+Kp5Cfsqk6+h6dl6IDyjm8aG2CjPuFJA3d/kokgZ5hQz/aUurt1uFDU5F8p
	vkLBKKR54tzh1D//sTV8AMh5EovQZL6CsSBMXXsbFq1ADY7BRxOee9g9oo4zGF8x
	Pn3mq7/lbwKBzm8wrwaeMVa8J4g0+lYpzTfDKJlh1ajUT48rGKRAmmiICNNPXmP/
	LJYjmeyV9LA9zOFkN9V3RV0RpsLC2mgqg7dWJq1O7KRRVPiS878rW7CxguQ32qIx
	D2+onQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3mm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:21:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ab2733686cso13353385ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866096; x=1775470896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=;
        b=YNyh6xNwUUrFcDbcrRxO0nQZTxvsvbqA0uZg3LisOEMP96E16fSkNtjVkCBGt9iCrb
         7vZjhPSBUDmUDL/7mE+0ebVip6/kmB+XETcXt3tDTJZHlMovZO8cVKriQyrcIGQYjpF3
         OgCN5PXjnCRjBWgeDaqwiDiy223IFUGekHu8u5DDOPC4gfsrFeqLcuIh8duPWgTYgqTw
         XIQI0sPHLbW4hOBljM5AHHR3aNnbRDMfv0f6MVC2S0fIm/tUfWBOUZythwOYoe8sjCmo
         ugWuDSdA+xzKRwdhyKJeEQblOu0J9TlmRzwHifeciDpjeqUfJCuWywewqkoTZV/pyoBQ
         PD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866096; x=1775470896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJpcZ1xXPK3O3he194ASU4hAMZEwCVNlpL8m3IxrHxQ=;
        b=itolyRCbuM41Pb6RvBLyGr0+1xUHPCvaS0hBf7OGLxWYqdRZGrctpwpjhaeoTcxVGb
         DqcJmhxmO+kw8Fms2kQJFsEFxNAUPgYVhL6gLAgRmRfyARAPlG975eiWYisyPWXLsISP
         bG+F6GgOAis7/MX2TdAjU1LEe5Fz3zC9x6ogsn+QPxhHlKJx61nDUjZvEvak1bUg6Quk
         eJbXpU7i13ndg0EFpfLw3lHr66LCCPGcLmi0+clog3xljGJZCNpbgmF9vAU3eWYF0f1Z
         1XkT3n+KzM+PCpv3jXuVxFWu+aF57NhxirtN7TbqtICoi6DBE4RsTL1nNA6IzinvtHgB
         q4jg==
X-Forwarded-Encrypted: i=1; AJvYcCWrpa0WMVRpHS/K/lru4sJ0lLFg0WK5QW+93S5KKJ2rL0PMa3+K0UtB+ywCNy2FRxdpPqU5XFB1YLkZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7sGx21SwZSD35x7Gku0S/sWDBa0rrh3eeociz/Yh47yk/9qO
	ag2RxcnA0wDEoRluImkpxUF8MtwNxjxCXdSMobL13x3mnyvkhFrgktCxr96HyWOcEjmLiHC8YlD
	YSvfTPOlXr+ZxEKm7eFASjZ2LNM1B3AXOan5QhgR9r101opfI0Co6C6LDq63iC/fZ
X-Gm-Gg: ATEYQzyn7hdIlyuWORrrl6Q9HhjbtbLKYDqt9xrorfLiPToS3edm5GkKmPT3cY9Evf7
	jraGuMtDD5kHI/xknOCGqn+d6w5VEKBR8UVTzFTwRioaPzNoIkTBdC9Kx/qRb0fhBRDuSVcwQcE
	mPR/rYUb9oigSb4K6b/PowB9JvEMt+rjHniLrOlmUJm25iaVpxOcK9Z6y3Jm0aBXWnNTvWDkwg5
	tGp0O/+i4a1MFm34GY65nuaW3+/IAPRtGfjaMsrxDwsBUL9CEFT/11kuw1Nxxj1csgJJBl5ZlUb
	sHHfkSeriz+f/n1NjeAsSxJ+ZGw9cIU59uOYrnK2TC684ktGGLNYOIf+WfYIih4YrTANK/uwwhF
	tZamQwGZoG0Pmgp94MSjFz23JzR3XVklM4uR6Y6yBwQY/09zb+w==
X-Received: by 2002:a05:6a21:700b:b0:39d:7344:633e with SMTP id adf61e73a8af0-39d73447b6cmr2877947637.4.1774866096029;
        Mon, 30 Mar 2026 03:21:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:700b:b0:39d:7344:633e with SMTP id adf61e73a8af0-39d73447b6cmr2877925637.4.1774866095535;
        Mon, 30 Mar 2026 03:21:35 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917ba961sm5583852a12.25.2026.03.30.03.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:21:35 -0700 (PDT)
Message-ID: <534c5aad-13eb-409c-91c0-b92602313331@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:51:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac-sku support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com>
 <20260328-monaco-evk-ac-sku-v1-1-79d166fa5571@oss.qualcomm.com>
 <20260329-accelerated-pigeon-of-joy-c6c903@quoll>
 <f7e63fa7-2579-4dce-974a-8c81a1aee00f@oss.qualcomm.com>
 <7f5bfeb8-7d91-419b-981d-1f0f568f01d2@kernel.org>
 <a39ca7b7-b277-4518-ad45-1f42506b615e@oss.qualcomm.com>
 <c7dcab44-68ad-48b7-9ad2-8e2b15951fa7@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <c7dcab44-68ad-48b7-9ad2-8e2b15951fa7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MSBTYWx0ZWRfXxLn/9xee9N/8
 t1nyGZCR2PUqunNRJDVQYThCSyOdPyWuKSjl9vPES96Em20wvc2hunym8nBnCL4HG2x3MM1kYuU
 QMu40Es4OunDkoXkwPBQxJIYr5TCCSdA9t6BwPI2tLjVSW6c5Kg+tyqrrjXZNw20gY15rsLp8DR
 n4saXXm9yOY+TyG5tdEVya0U0QTe8NuGnuxUQl5nm9ot9ZDfY+73dY8dXRAnx0SUohlHYz/r47y
 Cdw0PSs5PR0p+AydkBqB8df+l1Z4MTHmmAUPLkYcNTHb5QVpPD21Cv2Bs5W6Y5jO7csobML1dx6
 HNEWZGVuqkpx3GhamQvVfYflsbEgCWEnNmXUoNGp4kbiR+ybMrW6djozmDAPwZZRyvTu7xMJzyp
 JZRw5tbrsWYY+SPUYCp5GDvR5Hc899XFVOMJLPROg+2HM2ByzfSWNIp7h4NMrTnS4sru41QQAV4
 rCjmbFAEMTKZfSQfNKg==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca4eb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=8vZeovsvqUcOHt4vsk0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: hq6bSqfDSXw9BBDQ8oOsa91lokY2JGzs
X-Proofpoint-ORIG-GUID: hq6bSqfDSXw9BBDQ8oOsa91lokY2JGzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300081



On 3/30/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 11:36, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 3/30/2026 12:24 PM, Krzysztof Kozlowski wrote:
>>> On 30/03/2026 08:50, Umang Chheda wrote:
>>>> Hello Krzysztof,
>>>>
>>>> On 3/29/2026 3:22 PM, Krzysztof Kozlowski wrote:
>>>>> On Sat, Mar 28, 2026 at 05:11:17PM +0530, Umang Chheda wrote:
>>>>>> Introduce new bindings for the monaco-evk-ac-sku,
>>>>>> an IoT board based on the QCS8300-AC variant SoC.
>>>>> Please wrap commit message according to Linux coding style / submission
>>>>> process (neither too early nor over the limit):
>>>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>>>
>>>>
>>>> Ack
>>>>
>>>>>
>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> index ca880c105f3b..07053cc2ac1c 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> @@ -918,6 +918,7 @@ properties:
>>>>>>            - enum:
>>>>>>                - arduino,monza
>>>>>>                - qcom,monaco-evk
>>>>>> +              - qcom,monaco-evk-ac-sku
>>>>> Why adding name 'sku' to the compatible? What's the meaning here?
>>>>
>>>>
>>>> Monaco SoC has 2 variants  - monaco-aa and monaco-ac -- "monaco-evk" board uses monaco-aa variant of SoC and this new
>>>
>>> so ac? or ac-sku? Decide.
>>>
>>>> introduced board uses the monaco-ac variant SoC. Hence added the compatible as "monaco-evk-ac-sku" to differentiate it from
>>>> monaco-evk board.
>>>
>>> Wrap your emails.
>>
>> Ack
>>>
>>> "ac" differentiates. Why do you need to say that a variant is a
>>> "-variant"?
>>>
>>
>> The intent for using "-sku" here was to match the existing upstream
>> practice where boards that are otherwise identical but differ in H/W
>> configuration (SoC variant, storage etc) are represented as separate SKUs.
>>
>> For Example:
>>   - sc7180-trogdor-*-sku.dtsi
>>   - sc7280-herobrine-*-sku.dtsi
>>   - mt8183-kukui-jacuzzi-*-sku.dts
> 
> We talk about compatible, why any of DTS names matter? You don't
> understand the meaning of sku. It makes no sense without the number/ID.
> It's like you called it "-revision"...

Thanks for the explanation - I get it now!

I agree that encoding this as "qcom,monaco-evk-ac" is sufficient for
the compatible, and that "-sku" does not add additional compatibility
information.

I will update the binding to drop "-sku" from the compatible.

Thanks for the review.

> 
> Best regards,
> Krzysztof

Thanks,
Umang

