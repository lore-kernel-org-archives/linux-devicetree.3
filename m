Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A27F423A6B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509652; cv=none; b=lxJMuemNfXD+P801hfZ/TU9d/eJ9/zN4Fc9Y8vkheHoSw+F1bdgQIe/DvWLIFWxHn6Yir8CIbnuE7lVRTYW8URUPeVFMrJfOlTpy+4eHTmqUyEKCm/KSzT8kVFRXsyCzcpEKq9aNbvhbZJAtmfaILMtWtW3Tg0tQoNQZQUzttFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509652; c=relaxed/simple;
	bh=bsYDXS5C4GvXU/TFcevKzxUY+JHh/61XacQEpUMHrNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ8dXCH+j9rpWc2j3iyf18I4ZYifrJbDdoMHxslITpup25ocy6HksbZ9mFx4a0sSKEQQnkOXJdRAmEeCZO0rLuYLfWW00erGcKRKURLP5SJmUREhEUmQpcSJivuJ8Dfu9yEfx0dARf0XPVHMCwvJnNMa0ewqHnfLyxJH62pPfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hED6AmTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVKO7Jp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hED6AmTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVKO7Jp0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668891Gd2083334
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=; b=hED6AmTANVr0FKWo
	KSZDL+qWXzGquH7l+5c9yzMc3WUDX2qUpTehv3iySLFxT1FD3R7MgiF/UG084htx
	a0TLOsBniydy0E/1mfqC2lGJwPD3+5coXGgj849Q0OK5v521oGfO9szK3f29cA3W
	5TF83+ocaWqbxJJVg6lJMnEi1jaPYauGXb1yHo8HiIxq1KT3aA7bp1pjLChAfY1F
	aes4NzXvEq0Vb0Md/325rwo8pH23lUgOnInLlX/yHXTgsVj5FQrPqRuf7LfBTc/u
	gmT4Wzert4VYZo5YSdwbydeiSb/xCFOd01teMzenVZ97rN5XHGs5tjiv8qwiyv5r
	QFlMqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9956-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:20:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810960140eso1139467a91.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509650; x=1784114450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=;
        b=EVKO7Jp0FIda1fDrGWKuZcGiugpUoVvK78nslZZk2Y+f2VsUIix0rIi/1jBugF0Ylg
         IwyNlUh4hV3EhbaaiGzAnXQgrnMvwjvxhpooLNqaawtPLEh5vvYHcBD1JIcHqSJntFFk
         ja6ewO/9ETKr9Jsf0zij8tsW07ULE63sUp8nXJBakA3izz8nJz7imSKBo6xeh/4GP6eP
         25sIe3D7NKT26VmPyNhsryrAlfL+hNVfPr9cmsZOnxTFMhbQWkEB8J1YNfXp8l2O8r55
         cEDOrQAO8701HCDHjDyUj3n0x1G/trREVaE1NfKlLJZa6iM9nAsF8jd6eHvUoe1PN1iE
         p1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509650; x=1784114450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZnM6JCGZsCJGyPLZ6/fOZkvDAYanmbDOiM+03tfMxw=;
        b=BnkIhoc4v4nPS2ne4MpRo7UpU9SaCnU3XFEQWX3g2gx3oJivSF3uUPoxxocLPJyTfe
         vZ+StkDXF2yFVCyOI2Y5JbyrIcQIzK24eYNZv5iRXhZJ0gvDfXXIw+7KPbSWY6sBTTAp
         /Mm381c5C6ai5bODPMxLJKmbHGc/lW2cjgy2lXqL9FWD3hjjQgZM8pcRXF+ohu/aGhfB
         JCO2+5s1HtEgorhmKqmEfxyYalBGTkg1df69g82vxnhr8qeuaEoZkvP4qf9bpc8sd7d4
         mcGkYzK/Ep01XD36qqBHxONZ5A+OBJ+1P9RdfNkQDwvyZDqjKX5XyEWIhptdnEukaY/N
         BWfw==
X-Forwarded-Encrypted: i=1; AHgh+RrWikF+AnOak5DUSSB9R9vQczc0RdAAnfDkOZBiZdYjFlHgV373UvxK6IL9qzLQ6Obp937BkM6Sdex6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HLVSVX3SCaI0EzVi7pnu0ySgK8En+lpPauR7NwtBZGVVjBu7
	j4F4Tdc2VYdSjw9x41yBUDHWhUeifXzznXXzqHkFjVYImJWnNl+f9IXVjvkZ12+T/f5jIosMOV1
	fJ5EW4IvS0Y8jB2JJXvh57+y7nFnhPQ18yTW65qWgRSamSAkhuKSeIFIw8ANDZ7sC
X-Gm-Gg: AfdE7cnQ6BIxBisvaWSkF9UkvPTAu7OK+Y8bAf2Q2eeDDMLJewj9oujybd2pR/JH9cI
	2dYFA5ySjPyhxbB2c2XZC+l0wB++ocMZg7SfjHgsz1hMKGYe1x/mz/rYDKqUwztibzN3EdI8KIE
	apnDQ9f8xcwg/bdMFLVN0PsxSsETAeS6mZIW9fT/DpHt1oqO6ZsrasAw6pPbbjOw9LYcA57mIRn
	3kKJNdt6x24AQ5d8EpvXoJD+3AScxag4C5FhMsh8aB+WSDwPfnnx/pXn8j21ZvJQQ7hsbOP39IW
	Q9GEKQ8CbUAo2iQje7YjnvlllGlGyi+C/3VNVKmC3HN9r8hXGuaVqawZ5uTye8s4FPqkS/iqZ+I
	F6mVoIurLNaW6rrdF5w3FmymYnvgGu8TPoUvlPw==
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr2227666a91.5.1783509649775;
        Wed, 08 Jul 2026 04:20:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr2227626a91.5.1783509649274;
        Wed, 08 Jul 2026 04:20:49 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b7acsm2552717a91.4.2026.07.08.04.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:20:48 -0700 (PDT)
Message-ID: <aed53b10-31e4-4fd7-9dd7-7f305f69a8f9@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:50:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
 <399abb64-be63-4944-a8a6-3290cdb167ea@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <399abb64-be63-4944-a8a6-3290cdb167ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXyHHHmxacHxwn
 uoB5KoTiMoDhR9UX1rshNt30q2uL8AxsFUN+DKzzBy+dEbaidOPzE/fYwHeDRGzvAmfUdVFhbT/
 aBWk68DVPG5RY/C9Q7TdlbkuPW9DxHETmuGW3qqt4LkycH7z3UWGZRHP9kGHquPJWV1na7fyH4t
 UlWDtX+c+j4komLMRWBQ4zTENi+6+s+5GcAtMbJC6pfyOzYX0X+/xNfQpTY0xGbrPo2E3V8aYZe
 LS1/W7YbXW3yr1CaYkKuX7e89iHiPJhZsMOyesIZMFFd/UOmnz6w7/9n/SvWGjxQpAXWF6jwAT3
 k8oGA4rXgDFaQu6eHEARqPPdwQwdJBQc7aIdfLDbCk3lGPSs70pnFVW0bNLLXM+SO7tWIBSFo5i
 yyCuurJxNc4GRgZYhFtEAgm5Z2sXcWc5AfwsS4Vs6bE1FoFWR+M3Hk3LQ1xIkQv6yNezOzA2fg0
 BI3CkqlAyFm5X+4Wn8Q==
X-Proofpoint-GUID: E4klEHIuWu5cuqdbLkvFX-9ZDk8jmpgl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX2igdjDnmoMo+
 jtDE8e3ygTtwwxmvcdqMk9eou1wqTqOqJpH7/9y4lH3WD2ZoSC46ab7NPvbf5XFuAMABwE67bUm
 0xtknfXQVmxL9B3HIDRguH7Y4+2D3VA=
X-Proofpoint-ORIG-GUID: E4klEHIuWu5cuqdbLkvFX-9ZDk8jmpgl
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e3292 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HZW75wkqsflI3e3NRAcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 7/7/2026 2:12 PM, Konrad Dybcio wrote:
> On 7/3/26 10:34 AM, Ravi Hothi wrote:
>> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
>> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
>> defined inside the LPASS LPI pin controller node. The hardware is similar
>> to the SM8750 platform.
>>
>> The WSA macro, VA macro and SoundWire controller are kept disabled so
>> board DTS files can selectively enable and configure them.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
>>   1 file changed, 193 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 8dbfd0504598..142f43a1e6a3 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -19,6 +19,7 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -2072,6 +2073,198 @@ lpass_lpicx_noc: interconnect@7420000 {
>>   			#interconnect-cells = <2>;
>>   		};
>>   
>> +		lpass_wsamacro: codec@6b00000 {
>> +			compatible = "qcom,eliza-lpass-wsa-macro",
>> +				     "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0x0 0x06b00000 0x0 0x1000>;
> 
> Nodes with a unit address must be ordered by it - the diff hunk
> above shows you that this one is out-of-order

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> Konrad

