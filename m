Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C43AFCED
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 05:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315478; cv=none; b=UhxMdf7vdkr+riiikWKLdC0BHVwNGPp/Cr8IuLTVS8YQRyfZlBKLiXTnCD1lnD8ijTgGm4DIG4BxSfz+0uE+UrnHYYN5s8b0acvzJes2gR+HbIHQT7pSuHIzq276GX8JoK1adyaBjdRvYsqu09SgWbqATq6aPmenc2Blr17u9gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315478; c=relaxed/simple;
	bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OX76UKcT5f2JbqARlZPJt6A5CdASPuHHUNBJs9QOBEH20mMmyynIpn+1hJb/bf9X95HASuhrJzNc5T99GBFTsYiFZrF8VUmcszL/smFOhMMw6lFwhSeHJaN2zCiY0h4YeD9qhjYLR3id8+rVuJ0BDH89t1B74jmw422alxwOlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRz/lNow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LicW+Zl9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRz/lNow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LicW+Zl9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66642CWf3618319
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 05:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=; b=TRz/lNowIFIWAeE1
	bM5uwmqz7wuLhj6jDrnsb7DBqu1R+X5NMnuz9fvdlzsvk5pxBPbTtJtKKMbpBc6y
	X51ZeB2PfPtptpbgEBqdZrwtJvDQPOI04QGacg4LmrbFJtUJKNW6pUHBEX0vp6NR
	+4S/t+h05GwLFTXjgTxB5SPOWHGZhUwbRQzCH933h0E8D/hL7hq22GjIU4vOMKPz
	FJW5DcGIvDIillMbItlGjdGaMas0xpX3h3SPmhlSX3L4pC94liit2D8MmkMVnt9t
	yfSwNiQGJx6JOkI8M7Lop/YD6OAX6tCR7qU89zxSq589PS49QQDW8XBiOU1hd9oP
	cAhUGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64mkk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:24:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso3463868b3a.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315475; x=1783920275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
        b=LicW+Zl9cSGzTIY+8umCG0FpbEa+uRvxyolcHKdilHDEg+P6nECM7PEmcpdM2xC8wp
         BnfjZAUI5SobCrEczaEgfc6QF9E1FeDpXRoKm/kKTMX8A9JR9ar/zHk1W12MD0OnYc5H
         N6sxj1Ap5WL666geWijZ7BwmtDoruOl+4lFSF7TrbBWgzdxdlgBeGJfJWqEQuy3AHHlA
         ICqAE9f6ibeVrTvKibO2kYs05cHywOgvCU7/u9MQWq1Qm0H9v1vtW7058HoKymgpQbwq
         A7r3hq3ZT8rM/iWR59RC2mJZO4SfcwDjscjekln7516SEjQskJwEmZ6Di5HoHiWlnzs9
         uUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315475; x=1783920275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54M4x0iuDK2UXrkzp13pLq1NrmFyuwgubbb91mXLI0U=;
        b=OgwOWMZxMvTMFNNQnFwJToQPFq96tgcD4yxQEiXZPAUhHLh4z35/YNbkDzTRm/Murb
         T50oCxuvIRrX1JVaWDXgVE1vRJgUaRHZsxLBPUBiXjlHhn0j4CMv77muJKeTXtt/rT4I
         lgq+hQhdTQhLtmHFAiBH/TVdMfWIjfQmffNHSUhuBvR4aFO7b3GjlX9v7/BnP6y4rwlP
         ESYfIRFU2jj8GbV1pGDk62762ujvBm1xeeX+LkzOvHlBziB63b5RWwv/HC7qH63CsSE0
         74at+wT8NyZ2YaGwjtTbGohHUJtoIyug4ugY0YUMabzb7aCkNVLAsmeWRNqlpOA7Vt43
         u1Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rpiiqc/dyou160+31GhE2tYI7xN43dp+sy8aCEEf1mNoYVr6hOO8KspBgDnsl+3ugv21xq40c2wN6Fj@vger.kernel.org
X-Gm-Message-State: AOJu0YyO2XVzV6jF+E4yAK1t+bmE6ll6bpSknd1KQzlff4nqn8xNbnVl
	szUZPkuI6jxqolpFvvuloyiwhbgwqm0Gz/BY5b7fZG+HNOSeF1+jt2jPq0zzW4Bo4lelrpTGGV2
	yr9lQohrM6d3fm45BtbvUFVw9fCD1VSrYwj2ePEsUkKqSuWv1q19ZDGh31a2HTSIr
X-Gm-Gg: AfdE7clkUZPrfRq/a0CloRmoTJb3s36RtkCQc4cq70MK6FsRcTOPwemaC7SUGsy4uZh
	ah2c3L0f29MWhiPpyvg9yGIOhskhqDOG9xY3vB06iil4ZonL9fyeGZaD/3PQ4j9L0X4HSvgfxZG
	akirG8iE7fW7PnXI0K/pYXXqhr1J4cRncupT77fvk6YsnabMxbORhvY3XyeP3xjVGzEbqZujpzp
	IXMgCrzbWygtns9D73FALqEi8iAskG4IPLWXfhxOBeqmK24Bm5I4LY/TqLiDwS2Sw8Xk/2OKuIn
	VHneUJ6xLixQWF1WQd7wjqTQnkmDLc2BjMpMdM7YL3LqEoMWyxC1SvRlPLaEku7r7sbO5JP58FZ
	4PP5AadGzWVWgLostqyDvosMxwFVdewR+UiJCLxQ4WQg=
X-Received: by 2002:a05:6a00:13aa:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-847f6d5a46fmr7785395b3a.2.1783315474541;
        Sun, 05 Jul 2026 22:24:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:13aa:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-847f6d5a46fmr7785383b3a.2.1783315474083;
        Sun, 05 Jul 2026 22:24:34 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm3083865b3a.38.2026.07.05.22.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:24:33 -0700 (PDT)
Message-ID: <797bba33-17fa-4fbc-a4b1-55735b3b5d57@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:54:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
 <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <926681E76F71D6A7+5482f550-9a97-4a01-95dd-6d4083bcf5aa@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MSBTYWx0ZWRfX5SjCxBSTfKy/
 VsqI6+Hqpgf3GJ7ypFoBjinX938b05jE3LHh1jaFokzZ37Uf/Dss2YUWAg95a+gyMP2HHcjdmBX
 6nmmDMPaBLNnxxhpubqff4MlyQ/P5l8SRJKnrBYaYs0pS9biLt6dzs+xetLDpJamV+5xVZ/6KMN
 G8/5hB9Z/EshEA9+UIO51kI8Erz3CfZwKiEFa0SdhFle6QOQN5JmZ3K1FajIGM5uY0KLJwlIrP9
 nlaXQ/8Tns0SaHEv9Jhu85plFM0F+7sPn6DN324VlePAla4y92uR6wzrEnFMckNlwjLaYa2uAP0
 gMLpkk7OIWf5vywMqsUW7pMTzLJCr+WvCM9TcMu7XSyySyrJ3VTAuEmDnP6vNo+DHNNwUTNtjSu
 ZEzTxhZzO/3Pt9/fawSbwPQ7sn8erwD9S0/ius8WiBNLbCm4DTZBS5Q7djKFTQeNnJlZDJMOgjy
 ZC7P/phziRdfRCPSQ9g==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b3c13 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=znafaEsSs40IBW6ZQ9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9xNodh_KY25SrVJKEHH1xSygAQWdWf3U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MSBTYWx0ZWRfX9qA+Pt/D4xoe
 HFXfFoqeXDb37QCdewOF3/xy9s6XvHb1kgprut5OfZqNnp204n6jUkSdPYDBLMadVVJDefO3nhI
 6YxOI9qHhMCkFg9zI8IdDmfbemlwK7Y=
X-Proofpoint-GUID: 9xNodh_KY25SrVJKEHH1xSygAQWdWf3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060051



On 7/4/2026 9:37 AM, Xilin Wu wrote:
> On 7/3/2026 8:38 PM, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>
>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> Override the base iommu-map with the expanded set covering all the
>> switch's downstream ports (0x1400-0x1408 SID range).
>>
>> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
>> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
>> from the PCIe controller.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 141
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> index ba41dbc34b81..c2afb8372ab7 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> @@ -12,6 +12,26 @@ chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>>   +    vreg_0p9: regulator-0v9 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VREG_0P9";
>> +
>> +        regulator-min-microvolt = <900000>;
>> +        regulator-max-microvolt = <900000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>> +    vreg_1p8: regulator-1v8 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "VREG_1P8";
>> +
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +    };
>> +
>>       vreg_pcie_m_3p3: regulator-3p3 {
>>           compatible = "regulator-fixed";
>>   @@ -102,6 +122,104 @@ pcieport0_ep: endpoint {
>>       };
>>   };
>>   +&pcie1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pcie1_default_state>;
>> +
>> +    iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
>> +            <0x100 &apps_smmu 0x1401 0x1>,
>> +            <0x208 &apps_smmu 0x1402 0x1>,
>> +            <0x210 &apps_smmu 0x1403 0x1>,
>> +            <0x218 &apps_smmu 0x1404 0x1>,
>> +            <0x300 &apps_smmu 0x1405 0x1>,
>> +            <0x400 &apps_smmu 0x1406 0x1>,
>> +            <0x500 &apps_smmu 0x1407 0x1>,
>> +            <0x501 &apps_smmu 0x1408 0x1>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +    vdda-phy-supply = <&vreg_l1k>;
>> +    vdda-pll-supply = <&vreg_l3k>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&pcie1port0 {
>> +    wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
>> +
>
> Just wondering, is there any side effect if PERST# is described here as well? 
one of the driver will fail as both are different drivers both are requesting
same GPIO.

- Krishna Chaitanya.
>
>

