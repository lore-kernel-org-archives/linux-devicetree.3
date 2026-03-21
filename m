Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32663750D0
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076318; cv=none; b=nHFLgJ+pBt98hiBQNZjsqYgkw6LwhxFqX6ka1g78ihQFTUjUXnFek0mKOs0uoGrWTS50fOnFvHDlCJMAoXajXiNdJELDd3WA6uEhkmCcp0xC3YljZ4zRfBCl2t1r7N4Gcfu+rqQqDKyolOenbgl+ZFnMU2XtLVd7pnQEHDCp6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076318; c=relaxed/simple;
	bh=8w/zODLveHtE0IP60XvUcrbU2F6f7Uq9BB8L37MKFvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SC06dw/i6gC6zOeO8sEyXTo6HLtCKV1SYRpy/4Bx22iQ71WauWAj5CcmSn1NxrWM385RLKsh3Op0vkvZrH5951omNEKDAsgCeleY0CkIf2hynfP6fXF0zWODNkQoVLP934djrEnzHzFW8j6nCK7xTJ1sSc/ml19l3Rkw4XEkVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSQfUl24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6rpIj2N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSQfUl24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6rpIj2N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4mjIx3548594
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=; b=jSQfUl24jTU+BYAr
	cKqQgU28PzHNEd+6XYbfUO41jB7YzeOxvD3FVArvR55SjCHdzDrHBe1PGCj5SrUz
	yW5lgvDSYaWb7udTgCGNBWHuT9Ca6lRjBoXrPp1/TxlWj/UVaCVA1KQjWuk5SxDJ
	L/UAnBLodCOGeVJrRfAZxZOloTn6re7LDrAWjTIU7ov2EaXHaUBoNy1GQ5IVnGqg
	INDp5/WnIGWa4qToEnCfQNw4fbFFuR9rnP9A2mU6QtHZJ2othAads/wo692H80m8
	BsWTlGLBb8SjFV5WDdXmhzJiRk1rrvXKQsEVDPlhMkrVVlm+ESuunq46z8BkR+fk
	dhptkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk0fnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:58:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b05a3c2421so30667635ad.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076314; x=1774681114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=;
        b=c6rpIj2NpDm9gXBva8VoNaVR+89N2lxC0iEoEXxZBeHeCIru/Ez7UAkY1xFOm66oFq
         uOzIKdqrntqcPk8MBDnRLPuYOu4vkuT5xR7nV0zy5JnyN0lAoQ+LXcXwMGsa9kgUl6+A
         LKerWCMCv5CkotPgGYC0hubBWVVIjbdCMZmm/jYpOqpDCFLztOXuCQs18wGv5NCzThMW
         Ls4nDpWW2FtS2OeTrUiN98a489+Py+oB5I9N8JGkxiiUd2zFirYW3KPZpsBKHfmEolq/
         Qk2uV8rk8FiyS3OTCcqAqTK1/ovgrLA3PbaIqBOZg7XcoAgFcXCEPMF91KOsGwJWjxyq
         oZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076314; x=1774681114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fx9CE9f51VzBgzn1kxsg7836BTv0Nom3EGRHf/E0df0=;
        b=dtVHy8wAdAQ0Rx9C0ot8J/JRW9fJZMH9bCo3azJmroXEbuqV9biz97XWic2rZhiDEl
         eurkOiwkGrSqV0IWx872FDQlP/4kBmN9UHd2V0QJTTgKjWrxKPDu0Kk+e6HZwd2WNkSe
         P7b3/WnDcHi5OHRwxARkne6xF++yttx8PSmDKzdKuChKtmoOMTJoQSdKKqrUQAmMHcy9
         nE6qBxvVpmj/FlItqNpLtfTVALqRh26TrdpkZNp4EJ4dfm4haEgecCBKn4FVbdBdPnLX
         4y8j3BdrKtMPF3ume7EHFTLQEk0/TX65iQ1jKEaT9oYBZ7iMuTXNICGh/Yc/8d7Yv/2P
         frEA==
X-Forwarded-Encrypted: i=1; AJvYcCVBAV1JytWhCelRJOg3cHu1ugbWhV9o9+AbJg+lSwrb6tRVbus6pkBDFmpa0ZNMFRWHCU8qEp7mcoUB@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqxmLMUuMT9L4G4ydTmYzQJToNahqZ88YUvD2vArMiZfipblD
	tlLBQ49+hMx30s7GFtbkPebNLhF8CpFaSCe3wWZu052jk3+ssNczT3VmwCoDiQmfIQHRzn91ayY
	s5KVPCjYyGJPNcdIM+OXslvBwya566h4pv/aJa7tq/OksIDKsrCIprENwbhqJ+5ql
X-Gm-Gg: ATEYQzwtp+A6x4Yu7fB+9DsGAT+uXnlTJxgKSP0JtkAXHDdH8sSBySPIFebBkhUHjpO
	P/cqYu5r3Vx/vWGFmaSuTEVB1IYrYd2YbpkAFZUyhBW6NETzOjLCJhzF7QKUcvj+MZtGm1+v8RB
	6hq0Yl2Drmq8LOO6GO+zV2Prz5sdqympl5QuxytNE4bOzJt6yba2a4h4Ywkhk3599oqAq7QpByT
	tFnEJG4pfdpYP8ZhWwnMiWFIwCesxcK3eDrkjmMLJZ/kapA0bSrNKCCyeJJePXOrjHHCivQENwx
	UlHtDxT+SDXBvp5kA57XBTXC/+tf7sR+xM5SJN/FFoHJBNE5GtbL6wUb/hh3Yg/u95qzDSYdCGZ
	At4PlTzGKkmSrYQzpYTsGTDpkZ20zfrUSQcl0lkgxxarB+5mcPlDMUGMLbg==
X-Received: by 2002:a05:6a21:99a6:b0:398:849a:847a with SMTP id adf61e73a8af0-39bcec0c6f8mr5028575637.42.1774076313538;
        Fri, 20 Mar 2026 23:58:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:99a6:b0:398:849a:847a with SMTP id adf61e73a8af0-39bcec0c6f8mr5028560637.42.1774076312974;
        Fri, 20 Mar 2026 23:58:32 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a9391b0sm3085441a12.15.2026.03.20.23.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 23:58:32 -0700 (PDT)
Message-ID: <f99d4889-7334-45df-9148-1f2eb54010e2@oss.qualcomm.com>
Date: Sat, 21 Mar 2026 12:28:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Enable PCIe1
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
 <j64qo4pnfviycyb32fuva46j54sb72djapjk2thqho4j5cbalt@4qykle6nrizo>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <j64qo4pnfviycyb32fuva46j54sb72djapjk2thqho4j5cbalt@4qykle6nrizo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WZXSoa5gAQnmOOEFSxe8PPA5kVeOU2F5
X-Proofpoint-GUID: WZXSoa5gAQnmOOEFSxe8PPA5kVeOU2F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NCBTYWx0ZWRfX+6Y5etO/yvxp
 DbuIyo3yw236BWa6DBdRrfZ2L22nmioQAWygTgNp8W39Ys4qr2PtAwzhaxnwK83ybyhBhusJp80
 NgKgjxHlU+anqFL40tJrYqWQRj8kWHqanUNOudbbORBSwWYbX6DCdOnK9GGiUnvEWBk1Ft0Ap2+
 2I73O7DBb3HNfFNpTPBqADRPaLvdvs0YqNElbQcKeBu0+37BjfE4whETfiSCLgMbhAeydcxgP1j
 lZThmEZc8YAviIb5r1lWkvqkYY+XhKDbRCYouKI38QNtVKfZrdncc+vPvx5BE5dNQpLXVAvHwzQ
 3fC1bg/Sx8wWJNQdfHKd0QhkgPS9pnnm5KgXqi4BX7OHGGEdYD/n8H4/esf2sWu960zHMtUTo/K
 lGqk6+2rG+B5OAtPQLKG2WZJgb1dHQrzDD4tLwtkRSjNu+5QFxLVQ9XNRTiJwqp35BnB/4UGU5/
 0dWBo/WtJ8KrQI4tD5Q==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69be419a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=RObWm1bxEibDRpuCBrDfiQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZNl6TJjcOq9ufUx7pSgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210054


On 2/19/2026 7:02 PM, Bjorn Andersson wrote:
> On Thu, Feb 12, 2026 at 05:36:29PM +0530, Sushrut Shree Trivedi wrote:
>> Remove PCIe1 clocks from protected-list and enable PCIe1 controller
>> and its corresponding PHY nodes on qcm6490-idp platform.
>>
> Does this mean that the firmware has changed or does it mean that the
> protected-clocks list has been wrong all along? Is the remaining part
> of the list correct?
No, there is no change in firmware. During initial chipset bring-up, 
clocks related
to unused peripherals are marked as protected to prevent them from being
turned on by mistake. If there is a need to enable a particular peripheral
later on (e.g. PCIe1 here), the respective clocks can be removed from 
protected
list so they can be enabled by respective drivers.

The remaining list contains clocks for currently unused peripherals.
>> PCIe1 is used to connect NVMe based SSD's on this platform.
>>
> "used to connect" sounds like it's optional. If the NVMe is soldered to
> the board then say that in the commit message.
Ack'd
>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 39 +++++++++++++++++++++++++++-----
>>   1 file changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 089a027c57d5..1fac051ab3e7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -533,12 +533,7 @@ vreg_bob_3p296: bob {
>>   };
>>   
>>   &gcc {
>> -	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>> -			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>> -			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> -			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> -			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> -			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>>   			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>>   			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>>   			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> @@ -615,6 +610,22 @@ &mdss_dsi_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie1 {
>> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +
>> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie1_phy {
>> +	vdda-phy-supply = <&vreg_l10c_0p88>;
>> +	vdda-pll-supply = <&vreg_l6b_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>>   &pm7250b_gpios {
>>   	lcd_disp_bias_en: lcd-disp-bias-en-state {
>>   		pins = "gpio2";
>> @@ -920,6 +931,22 @@ &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>>   
>> +	pcie1_reset_n: pcie1-reset-n-state {
>> +		pins = "gpio2";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-low;
>> +		bias-disable;
>> +		};
> That doesn't look right.
There seems to be multiple default pinctrl configurations for perst.
On rb3 industrial kit we used the same output-low & bias-disable
configuration while for other targets, I see we have used bias-pull-up.
I feel the current config is more appropriate since it ensures the endpoint
remains under reset and doesn't try to link-up with host until the
controller driver initiates link training.

Do you suggest a different configuration ?
>> +
>> +	pcie1_wake_n: pcie1-wake-n-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +
> Extra white space.
Ack'd
>
> Thanks,
> Bjorn
>
>>   	sd_cd: sd-cd-state {
>>   		pins = "gpio91";
>>   		function = "gpio";
>>
>> ---
>> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
>> change-id: 20260212-qcm6490-idp-24f7b6a1812d
>>
>> Best regards,
>> -- 
>> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>>
