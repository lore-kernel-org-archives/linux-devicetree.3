Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F93AAF65
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434554; cv=none; b=Ars9GQhEoqG84y4Xw/WVuEfUo7kRP2+3zZ4LZZp34XWGAjoLlJ/cCKvqANBKnTDxd98415T2wW+gtXI1FCnj3s4QGNXXShNf9Wsfq85TluxdJrXL8ZFSvacddRs+e4la4YEX7CEFNmLQFBzGnCBlNrjuCHPGDTVP1gwMyzsd8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434554; c=relaxed/simple;
	bh=BJ/4rtxLJ3OUT8j1IeHIi1+42TYtIAWMAyf8v5atvH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAh1tTjOUkPTCMF2IWvXr/yAKRaVw/4Qi9M5QhFNX/g7LWwpivtcWs/ZPu6xX5fg4XgNQabnVjKE/5DWBH3FC3aNbqH5P1GodJLZVPSuuD5TRwbV9ufoKy6GOQ7ABaiCMILDu5qeYNAhRyzJ3SqoZY02LQblz/RSXIsoLHaQPr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPW+HIhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKLmiJiw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPW+HIhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKLmiJiw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXVel1571690
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmpZDlvYo4bIIHmIKcULNpFvjwTYQhKuozzyEdxOXis=; b=hPW+HIhAFVnfK6kc
	CvMOuB14DfgJNPj2spVU74+ZUZuo0QrBSTskJUVN1KMHMamhP/Pyq1fyCkdlh35/
	g0cGMZzvMDTShb1KlpVPnW9Ys5PMgUWHoOY/R0Lv7XZtomPjwgcMJah6/k8gb8/a
	KV+FOb4iJLb/bde7RIXB96PbIS2nCM4EmRzaAhJ779hpnFc3UzfPcZHigXmNmhE2
	PV1J7JS9JPZUuf1OgU06wk788toSZToaVlcy3BMSjZCo9ZRITbktterZpBSOLdfj
	RxRvNelnH7zkTXTU/+7sZpZ67xd/IOlWsjI2p8I0Dl0beOv/ZygRxPfLs9g1ZxTq
	dWKNAQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891h7k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:02:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73760a7cd83so105983137.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434551; x=1786039351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmpZDlvYo4bIIHmIKcULNpFvjwTYQhKuozzyEdxOXis=;
        b=dKLmiJiwnJab6MkllE/qLIe7ZCabO2XJllk2fFhL2WASHuH0eP0Yvt6zUPai+/C+Yu
         gMBx6WaXDGEMYVgD7Mow65Ix8nNtSfZQ7v0/U1oqni7mVZPIE9GQybLj/O2QxJ5gvfNy
         t+ZOjvN3aIHFaRMuOlGbUVSFiE5TarA0cBmwSRKPMqpomym2OnEWx1SHtgvmCoATAFT0
         QEuXdDblsPmgTcgou2b0Skbc6f1jAWyv17Pk3AQqcl7TajNhSN1p3dX3DtYotrWOFuHZ
         jHgVbZwXgwKuVLR3FDKG6jrcZWGvMuQjmMMANUxhaw1Ts5YoldF8UNGSpjFmF/U6W/yd
         QiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434551; x=1786039351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmpZDlvYo4bIIHmIKcULNpFvjwTYQhKuozzyEdxOXis=;
        b=oKkqr6GKjlmAyu1TO1jvy32BT/ZYGLAaS9dtCtDaVkAIN0Mn2EVhw7BGaWJKufE/nX
         dFUCObWqYTxzgQK/lB7e4PIDvZmrIUAEEJTvQx7n1U60Ch1sj0PuOi05LZu4c6UQZ0IB
         C/V9koWiZGg3O/nELcE/mcDlmDfhXIn9kQIsOjPWngNbD/NS9van4kBAer8oi0wQ9sHd
         e2USeirKR69K68+hIc3RwNN8sfxKYx8ODIO2+MWkkYqgFbHbHjjiV1NqBtb/EdcZeNr2
         SqO86jg65svj73/VIVRsGYx76FsBVqMiEyx95vlrUxixRvtjpwCYL1jzY6pUUyTUrNtC
         FXGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEq5JmyDLQpP7jT5XEGJnsFdHAg0SPhgr3Guka6ofk7NqP4YCM9aWhNWnIJiyA6TxxZc0j9d1s4Q5/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6EaPO+ciMSKvbevXYmWIx01xudbCQUAqjMroEUPS225IoOfc
	opN4htqvTbCH47vKJOmJQZhxIpm/cLBFni2LZbbdoIuhakgqWJ08XG+EypCtLYpVGc7Tt4ldDEf
	VSfxI3rxwna8xfEGj51mctOl/q4FY8itOUSfzhnlfZH/jBZKkmjQLXh4303AxTq9N
X-Gm-Gg: AR+sD12+88nPPiYBGkcW+bzQW+p2/TROjV9aBKDm6HbM/ma/+9+D/0SulZ4tYuyJ05Q
	kP1edm8XYTfDgT2m1rhl1b13CKfEXW32o0SicF8CUr66Vu5xBCAMQWWZlkw6nhrnx5ha1IP4NoB
	NZc6VDlyDmfYKBgokXYofgLHRpwIuDXOadIVLG3QAP0qr2LcTFXVrF5DX0bQifMeuXlKedsQ5fs
	XZtq8Ey3tyD/W/zKz9JFXZGwVz9JiOwJ9h5IwwAPH0uIGR7b6glm8GpEqeOM3wQBFfochs9Nkzg
	LBfurQ57PJbL0FhtPfxmMG9iMZIn+FQakNsWevc7i7N0hC5BPtpLDeJz4z8rf/46qmq34P5ao5b
	R3h/zTPzokRdv8dl1oXuJvQqYZPWrZ/Ga
X-Received: by 2002:a05:6102:4415:b0:740:2d40:a234 with SMTP id ada2fe7eead31-7574e4dcc08mr1462817137.9.1785434550594;
        Thu, 30 Jul 2026 11:02:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:740:2d40:a234 with SMTP id ada2fe7eead31-7574e4dcc08mr1462740137.9.1785434550047;
        Thu, 30 Jul 2026 11:02:30 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e83sm98649166b.17.2026.07.30.11.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 11:02:29 -0700 (PDT)
Message-ID: <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:02:26 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzNCBTYWx0ZWRfX2MxShBBWy+Vs
 fL6lrodi5WdWGR9Omxjxyru8NNtNh/N6G5auLgK5KYZCQglHBC2jl3eV20njOAVumxKIGSwSKLx
 G/0S+rHbyHYhU6wjbsyacFuoLekcyYDDxvBgTuCzsUG+R4FHELLPwMBy8ceioL9SLp8GUHJrl4g
 9NU7+2Y88BtJMiEDC1zIHzAazMM3z+6UbdBzD/42+I96Ly7Uzl+TqjAniEd94h6IGwbzv4Q8s6k
 +SUumwm1Klal8hFOgKopgkuY2e2QhCRA1ThbvQoXpxMfZyzZueXCDJZ8/CcNouM6WIZtyL53ENN
 oqv5Zlptv+ic8RkMuTSG50dv+5f5dEGDN5nDX7A9QRB08NRaHVfG3JOtu+Cyuf9nkMrLh5xEccc
 fLMvnTrUIhK4larNZf0gmEjd/JoJg86bIV0vL0H4rEhRKfkb9MEA/XS76i4qgb5Y12PvguqN13R
 HsiC1Mg9I2JHdZj2CDA==
X-Proofpoint-ORIG-GUID: J-zoCzAXTm1h2eMQUIouQt1307TF6fhl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzNCBTYWx0ZWRfX5Aye2fdDXtHq
 4pHZWhdOBxAfs34ftscmP7XVOWUK1ySryg6u0DqniHbtz3qp62M2JprJTIaIf1DtwhKoV7mt3jX
 Q+nTvsCqLlZDzote1AAXXT6j9V3n82M=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b91b8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O0DfClCy2XHIW_CjMjMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: J-zoCzAXTm1h2eMQUIouQt1307TF6fhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300134

On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f11da2ca4181..d42b29419320 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -13,6 +13,7 @@
>>   #include <dt-bindings/firmware/qcom,scm.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>>   			};
>>   		};
>>   
>> +		jpeg-encoder@ac53000 {
>> +			compatible = "qcom,sm8250-jpeg-enc";
>> +			status = "disabled";
>> +
>> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
>> +
>> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			power-domains = <&camcc TITAN_TOP_GDSC>,
>> +					<&rpmhpd RPMHPD_MMCX>,
> 
> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> please drop separate mmcx vote here and let it come through the
> titan_top (it might require camcc driver and node modifications).
> 

The change was requested by Brian, most likely in connection with 
upcoming migrations. I think he would be able to explain the exact 
reasons. As far as the facts are concerned, this is not currently 
necessary for the driver to be functional.

Regards,
Atanas
>> +					<&rpmhpd RPMHPD_MX>;
>> +			power-domain-names = "titan_top", "mmcx", "mx";
>> +
>> +			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +				 <&camcc CAM_CC_JPEG_CLK>;
>> +
>> +			clock-names = "sf_axi",
>> +				      "core_ahb",
>> +				      "cpas_ahb",
>> +				      "cnoc_axi",
>> +				      "jpeg";
>> +
>> +			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "sf-mnoc";
>> +
>> +			iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +			operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +			jpeg_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <400000000>,
>> +						 /bits/ 64 <100000000>;
>> +					required-opps = <&rpmhpd_opp_min_svs>;
> 
> This looks a bit strange. Are you sure that PLL levels match the MMCX /
> internal clock levels? I think you need to vote on both domains.
> 
>> +				};
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <400000000>,
>> +						 /bits/ 64 <200000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-400000000 {
>> +					opp-hz = /bits/ 64 <400000000>,
>> +						 /bits/ 64 <400000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-480000000 {
>> +					opp-hz = /bits/ 64 <400000000>,
>> +						 /bits/ 64 <480000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-600000000 {
>> +					opp-hz = /bits/ 64 <400000000>,
>> +						 /bits/ 64 <600000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +				};
>> +			};
>> +		};
>> +
>>   		camss: camss@ac6a000 {
>>   			compatible = "qcom,sm8250-camss";
>>   			status = "disabled";
>> -- 
>> 2.34.1
>>
> 

