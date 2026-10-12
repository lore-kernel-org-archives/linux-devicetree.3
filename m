Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326873B443F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786597; cv=none; b=Ys2tihxth4R5y8x1TG5WjvVrdZeOSyQtd1X+/YqLLaSvsZPSOc+sNU/t1rgfGUiO4+2zPwJBF1rV4BMmQBPWlMnx6D4odoER6q54e0XKCYDKJjLyGTmAGQyMpx2m1a+3FcEmHU7/MqFKquceBghO4oZ/cG3ajnKMRkCG1yIkhh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786597; c=relaxed/simple;
	bh=TsCwhXKZ2GO3pO/mSGi0kdtxv8LXj8Rl8G7QIr19TPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgmEq5tM1NTdxlY0V/v89DmaEYbkBRhHnc7ex+3w8pkUTD/5zb0L4fVV19rQv3Pcftryw8ZQelrBA/DJPjBcmZmPjVFgevm1Ap2d2stRIcBZYxLiJMg1KyiPGlTkduJuCupbjF+hDLhnowInHuF/G8Y1oJFZarXbaJiz4WwG5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm2ehx/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRB5Ihe6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm2ehx/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRB5Ihe6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y79i1216051
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=; b=Mm2ehx/VMYyJthDC
	xTim3UD7xbJRu/8AsQmHyxVvPwhugZJkRM6090TRBkWNu0Z4T4D3YmFV19ndPUmf
	jv7WiFa/Np8LrhjQH6FluGQwgAyBRfbs6+ym28U12IS1kcgVpBgow/Zq+gG7PJCg
	zc4vFG4RWk/IQiK19ZqUTieoR7tGwr8aRrN/sT+TEpBWZcgAKVqsc76ZXA9OoL0J
	Iz6QdQPVDkqf9D2+dwQBIaaRsln+d0v4qN7PyfoM2mfEhNwCt8K8haulIRhGCHsM
	AqlmqTaLtDJIV4CLkZ6+I8ieiMfK+QkBnMEftDPpTaEh3g1Yu2gOFSVddx7iwVnL
	dss/EQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu08bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:29:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so1000614a91.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791786593; x=1792391393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=;
        b=IRB5Ihe64y7dxWIYEP7aBUrRa52ZQ9RwTEA+ghUOszzgu+wrWpIN/18zTzmDQcUh91
         srGfdfwtkRzSnC5NDjoXt07yE/GGacd9Jqd+1j3x8iLSk8bLgOcQf7dTuu3VNiPJla+3
         vDDkq1Y+XJQZBh1V1Jm01Ka7jC0MycDWfIdJQonk1Yi1fpZlek6ameMdurr4Y0m0CAqg
         K+Iur+ArnPOsXCyc2ZxYaDXCoGL5z5yHYYFq/uVa1ad/b5CEpEsMQoRXH8lx0O+u2Eop
         zKeX8rq3iCAs4ovPf22fu2e6TJ5oMvLNCHtObwb0pgey/B1gCEmulkqAgrGydr/8U/PH
         bfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786593; x=1792391393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=;
        b=oyBfdr/Erm/GYxlHts5+kV9l3ciEqKRreNMmO5bM1qIdgCtwTUhZ1jZocHE03kDOFB
         5vlDqXeleMF6cslLVw8goMB6GoER6X7RuddkIFhyy5PnHOPGmMLPk3SUiEYFTR89ZYGp
         Lq/XUjvvgKw8kSwICAlPU0OeE1Q87WNuAS08QcaOL4qlKpd0shh4CotbeS0p8JNhMg9T
         4rwttjnGDVZLEsXDI2+jPlD2JON9eclKrPjp2aAocrjoNBMyel9r1NmFSSyN08Xwk864
         83N7ZWjEbX8Tj9lr0GSDwngkV61LwA7dqe4SsJEHfeOrEkK7BQSSGR2JJ/lHSLhWWCVo
         yiQQ==
X-Forwarded-Encrypted: i=1; AKwUvByVxADGssiZIK0G9Vu6keC703Ulom/rX0g4xkS9hoZpYUBQx2d8SY2cpX9NtxwCoynIwXBij5iU+Udn@vger.kernel.org
X-Gm-Message-State: AFq9FYKpcZOl5TLSQqJoMYrG6SWKHyAoKJUPGXy6zrA+MsNsspGG7QO8
	j9VwqSUzM34CD5cm/UExRlk+6i5mnzbfTXZej0FnH8HLO29ljwwfkaEL3oUJY0wXPfkTURBhMpd
	d7OoVeHq+ooxgA+CHmk3dy++ikv5cvywhkzLt72WEt/+xq4bxtfN6sAE9JHfV+p4Y+TAFVHOs
X-Gm-Gg: AYBFou32LOxnE0JrVxFhb4O01Ednqoj26N4zzCNqX292pw4chpfTivSjVk9B2VNlkIM
	ThhoFSuncpBKlF6LFBhEri3a0bRFgx/lLopJBlqDRnL/lkzu4kOgJibmvVE7obGCMBwHc2Son9d
	1eDAzKGmrKra22I0GcAH01jFky3CvEnOYz4m2fn16vDG+/NuoVCWNHeHcenb0riJ0sBSWgEagVt
	A3pRK4v5QcDUXi+B1aqXOTEME1ZxtfqhEmZp0zPQbCkcmgcl6xgZvQe9QLKo3VZ+0LjvaGFWdS9
	YL6ZJVrr0SnciGH0q5LIqvJNV/wBslQHBLLrL4rwDl360VJTKu/tT6rRrsPrqHAITCdZ/1U7XWy
	DfhR2C0xMOQEfKH1g34AdArpM5nU=
X-Received: by 2002:a17:90b:4b05:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ab3a912292mr7453644a91.19.1791786593003;
        Sun, 11 Oct 2026 23:29:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4b05:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ab3a912292mr7453629a91.19.1791786592352;
        Sun, 11 Oct 2026 23:29:52 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm3904383a12.24.2026.10.11.23.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:29:51 -0700 (PDT)
Message-ID: <bfea9e24-3fd1-46a2-aba9-39f96c79b594@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:29:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Maili SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-3-965688646c4b@oss.qualcomm.com>
 <20260930064926.551261F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260930064926.551261F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc7e62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nOADZSty9FOdcpvnO0wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfX/EFP2lBbtXYX
 zGOtiDYYbILNwgSZp9+NeNJnK8g4BDmLi+G87w7Pf5re2Wt/Ddo06HEFQWWvj4m4S8hkzPp1a+F
 agqoVxo7H2Z6VO28AB6RAgMZIC4FBzcwqy9vdpAabvd6fw4853IzppReHC4rnXWUVPRhgS+LKn+
 ODO/lKWSOHlHWPjjlgJrqifHBdCa6jgP2obEX4EHaSuC+i5crKIM7OQ9UJT/ZQLM76fqWgF6Own
 Lrb49aDBBn+ZTWcvONvsBL2lALXLgrAYmBweVUN6Iai5G89O5taNeO5Z6gD7tqYmHA18vEJV1+7
 h6o1vetJRO0WJFsJC//G8zlFoFwkOmqKteM4Kch5oS930okxavYInwVKD69/FYGk9YjLJSTm8D+
 iWaB2BUNNuvAqfcYktQamnkFiVDYcLX8SVDBpKWCCiiL4H4aqPtnDUvQprG7bfi4PjSZ7EgtGeE
 T5XuD/x2lj6eXmq5ybw==
X-Proofpoint-ORIG-GUID: OBdv6dTrAtOlQueOcgtOnqwNvo_c88eu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfXyU2eWOPoBtn0
 rIcxggZAJSIbkR5puAOScpOzgBbrwKkWuBNIEpyb0Pc9u9x7ghejznHuuGklSeymiBuTRS2PLC0
 BMK0ZxAQaAYVRtL2vvoLBDbTWsHK2Vk=
X-Proofpoint-GUID: OBdv6dTrAtOlQueOcgtOnqwNvo_c88eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120025



On 9/30/2026 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: maili: pcie1_opp_table defines x2 OPPs for an x1 PHY
> - [Medium] arm64: dts: qcom: maili: impossible QUP pinmux function definitions
> - [Medium] arm64: dts: qcom: maili: gpi_dma channel masks exclude requested QUPv3 channels
> --
> 
> commit a14e352543affb0d0357fd40cb50b296dee6d5e7
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Maili SoC
> 
> This commit introduces the Maili Snapdragon SoC device tree. It includes
> various features such as CPUs with PSCI, PCIe, QUPv3 serial engines, UFS,
> and GPI DMA.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
>> new file mode 100644
>> index 0000000000000..c420b709cc7de
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
> [ ... ]
>> +		gpi_dma1: dma-controller@a00000 {
>> +			compatible = "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> [ ... ]
>> +			dma-channels = <16>;
>> +			dma-channel-mask = <0x7f>;
> 
> [Severity: Medium]
> Does this channel mask intentionally exclude channel 7? The mask <0x7f> enables
> channels 0 through 6, but later in the file i2c7 and spi7 explicitly request
> channel 7 from gpi_dma1. This could cause the DMA controller to reject the
> channel allocation during boot when QUP drivers probe.

For I2C7/SPI7, its not the dma channel 7 or related of it. here it is for QUP SE instance number.

> 
> [ ... ]
>> +		gpi_dma3: dma-controller@1900000 {
>> +			compatible = "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x01900000 0x0 0x60000>;
> [ ... ]
>> +			dma-channels = <12>;
>> +			dma-channel-mask = <0x1f>;
> 
> [Severity: Medium]
> Similarly, does this dma-channel-mask exclude channel 5? The mask <0x1f>
> only covers channels 0 through 4, but i2c18 and spi18 explicitly request
> channel 5 from gpi_dma3. This will cause DMA initialization to fail for those
> serial engines.
> 

ditto

> [ ... ]
>> +		pcie1: pcie@1c18000 {
> [ ... ]
>> +			pcie1_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
> [ ... ]
>> +				/* 8.0 GT/s x2 */
>> +				opp-16000000-3 {
>> +					opp-hz = /bits/ 64 <16000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <1969000 1>;
>> +					opp-level = <3>;
>> +				};

will fix

> 
> [Severity: Medium]
> Is it correct to define x2 (2-lane) operating points for pcie1_opp_table?
> Later in the file, the PHY is explicitly declared as a 1-lane PHY
> (qcom,maili-qmp-gen4x1-pcie-phy). Attempting to scale to these impossible
> states could cause mismatched bandwidth expectations or incorrect power
> scaling votes in the OPP framework when parsed during runtime.
> 
> [ ... ]
>> +			qup_uart12_default: qup-uart12-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio208", "gpio209";
>> +				function = "qup2_se4_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Can these pins actually use the _23 function? These pins appear to be wired
> to the _01 lanes, as qup_i2c12_data_clk uses qup2_se4_01 for the same pins.
> Assigning an incorrect mux function here will cause UART initialization to
> fail or silently misroute signals when the pinctrl states are applied.
> 
> [ ... ]

static const char *const qup2_se4_23_groups[] = {
         "gpio208", "gpio209",
};

function is right

>> +			qup_uart22_default: qup-uart22-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio121", "gpio98";
>> +				function = "qup4_se3_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Are these the correct pins for this UART? This pairs mismatched pins
> (gpio121 with gpio98) while asserting the _23 function. This directly
> conflicts with the corresponding I2C node which uses gpio121 and gpio84
> for qup4_se3_01. This structural misconfiguration will prevent successful
> UART initialization.
> 
> [ ... ]

static const char *const qup4_se3_23_groups[] = {
         "gpio84", "gpio121",
};

static const char *const qup4_se3_l3_groups[] = {
         "gpio98",
};

gpio98 belongs to qup4_se3_l3, will fix.

>> +			qup_uart23_default: qup-uart23-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio161", "gpio162";
>> +				function = "qup4_se4_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Does this function assignment match the hardware? Like qup_uart12_default,
> it assigns the _23 mux function to pins used for TX/RX that are wired to
> _01 lanes.
> 

static const char *const qup4_se4_23_groups[] = {
         "gpio161", "gpio162",
};

function is right.


Thanks,
Jingyi
