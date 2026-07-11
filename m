Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83A288C81
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783741719; cv=none; b=nmpg05i4OAyGyirQMwj0kbQwcCHH3U3/WHRQ0LoU9ce7PUEjWC8khw2ISysXouUnCxgwVz7JfNxbdYQWo7LXzJxqmJIU0I+nWQF85sknpL9O34z1hAZj4WDrDMILdqy93x8F+0rekuebJHem4FOfQSia4eOmmgC7AyqSCRhzUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783741719; c=relaxed/simple;
	bh=Ei1ZcO1wvdACPMG6sL/wGcRy+ehAtulyMYsMK34GiK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6fAhSSQyATchxF//buyRwRNFVN57tnsp3bEW9nUNEBswSQXtMfekNasSgfAo8tuv0f4YZM+VRQc/qz3bLlUWjmei9z36azVORT2UIZ5FzacEti/Y8DsIF4dHPA5olE915JLlTkfKBuml0Y21hbE/LBV6zKvyFPo1mkQIMZYRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U39rOvfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTxkVKBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U39rOvfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTxkVKBt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3lZOw2793279
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=; b=U39rOvfhQnVrppQC
	LgDFYjY6PRHuxRL7tkS1RfhyuqJ/jK5ZyWvyzkKHcqeHvIQQviS2NCPrGurQ4hlo
	wVsR8eLCg/rKguI59y175ymYubPvFEUzyfM1Y0jYKGv4lbd3HSPf0UCMMGhBNgoS
	DHlZJEoV5Sd7e+MpfZFsrG/3W+3hDJNZ31AiTpg+e61MG4nLgMTELK8KRdfWvrCg
	iPEiocigDg6hxwfu5L89LlQk6CJKcFW541WtmGAPZ99EVtNtKK0fk2jY1Xl5SXmy
	0ah8heVsCKuh7gNyg7QDj1Jx5LnMa4/U5ElSeYQAseXThYlw22P88t2J3VnCPu4v
	apGcDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbbhdg9at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 03:48:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso817840a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 20:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783741715; x=1784346515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=;
        b=RTxkVKBtSBfQ++fdlc86ESdaFVi6g1V37oXQvLbDjG3Br6Hg9DY7hNcVGq4sC7o4OT
         t4LiiUS8PAsr2/x7j9q3PnTPh9pbjGg0XDGDnYeC04ZnLixjZHUD3JsVyc2Y3HpmS4/K
         sh2PUptXs0ldqh4TN2mH9Gn68b6ANksXngEFkRWqKQV/FLhuaYtTvB6B9B/8kVCpPQ4m
         G4nY/WAWAOYOj3r+1nQSmgjaCRT7jfFgvaYa+BycEC9WtYN8PwRDGRUzFFSIJfsvQiG4
         9n5gI7v3XnF+KbeG5rXXTVIRB8cD2W+2CXcAt95nKu3o6mL1a6iKUkNrk4LSkqdBlGza
         j8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741715; x=1784346515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWp3h9IfShwVVthOqsYFNWjXLlqI8l6BavhKygxu5/o=;
        b=jeAh6TnuXcRyjj9MGXlVvL6afGz1dGKU8/T5bIpEc9J1jj6hZCc22KgL2gjiqdenZ/
         PPzvQzkJFElAxHjZXD+2bM8xmVxjjHQ7Lh1Hy5rvCyXRccMQdQepqoWPoqvpK0HJH/c7
         oU7M4Y14ZqaxOxJwA0OJkNoxSX5oEXWMOSugcqmIR6F8C54nvmKuMLD46e5kLETFpomX
         L3CK71tWc5r5rM5weVfAyAL0YNTgSeDDi6XqD9B90SgVDmsLiwpW8gUSHRTDw2/se6wE
         YGg88IP8HEMwbUART5PXECKXltt9gCQa9RNPj1wsgEz44BGWVicCn/rgws2URZwmrFe+
         qXCA==
X-Forwarded-Encrypted: i=1; AHgh+RoKGQvmaQjjKkTkEJ9LhGbzYo/CmGjouYIIZ1UbjU3Ih/QbMZyV86GS1H+j2gPO+t37d0muoCTf6ux3@vger.kernel.org
X-Gm-Message-State: AOJu0YzUeoft6T8i496D+iNcPApjKC4imi2y0/rPpfh3agaC6Ou9yoCu
	J0KYi44cnakMGRQUddJrvgmZzmxZ9c5I9MjH3nDhrHzAiYrV30WotdLlTCwq0sXZoXSYYpHJSdV
	bfm4U6yq84z1QNXnDOSa22IHLtcX3pRz/wbBbaeRC245uGtnkuNJw/8kom/iCq86E
X-Gm-Gg: AfdE7cmyK+nQuBgQumDF6BMt329OxI0AXNNN7cYQTmsbgwvM4QxiZhxC45wcZtbZAsZ
	zjqBOVFoPe90SYGisdr2XAzP5YZOH15SCt+Sh9hL9WI6hquGUSkBZUVElpvUpDtT/qLNv7NVrkY
	G4SvvrwwnKZnVkEVZxhgFxtLODztJD1qhFlxMGOl8IHmRpgjZHIpyhyh7a3lRJnKTikDzB9r8cc
	tlpm7559DpdR8pHY5p1XGq8l/aQp03VCw+k0eHy4OcwStFSRE15KuftzhvWQcuh2wseXBS8M+Vk
	/ojYIioMj5wBIXuseLwIF1JwiogSf4+1i99AhHHohM+0f8xM3FcCZmmU25m6SQfGn6tXx17489h
	Axk64kyCWWt+sH7coWHISKJKS8HnsM5nOXPnieCJP01EdDqk=
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr1569964a91.21.1783741714681;
        Fri, 10 Jul 2026 20:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr1569933a91.21.1783741714165;
        Fri, 10 Jul 2026 20:48:34 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.151.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm48880829eec.30.2026.07.10.20.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 20:48:33 -0700 (PDT)
Message-ID: <6b67c5e8-202e-42a1-a3fe-04a6d60e6083@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:18:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <aip3_fyE8tMtJZIW@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TE4HmdO40QFOyPkYQdv2in6w6Zzs0PAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzMiBTYWx0ZWRfX6cwz7ZF7DaY2
 xayOfThLEikFDkyUX90tF5uF5s7gSVvHsmQ/yMgWSM2cUBxBqmkdxTiU241m8d26blKi19xL5Bb
 i8qpluqifcUdLc9uVVELt/XHm0gZuaQ=
X-Authority-Analysis: v=2.4 cv=Rvr16imK c=1 sm=1 tr=0 ts=6a51bd13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ziBI+Y3eO/H+UwYWWny9Hg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qCRXIqyDeEQ_VX0ZX7wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzMiBTYWx0ZWRfX/Dz/pSapvE1U
 EqG1YYRWle6/K1SDk+L4L+VnL32ku19uWc85rglUWAYIcCRvVnLq8SnbtDtt7wCe1teN5mEDfa5
 1WGPY9sF0/CA/y/iVvM7Y+fbXmyier7QxNMV4hRQqjpuTYxZHKP/fBonH7bxYuytPy6tnE0hlU3
 FXhCo+jdey6D8RyBffBJnJ7j0rSHNkZJ2zDP2Swyb9PV584W+LwpiYcgrwC/CipVTd6+gUhRncA
 MF+xyLcJivgZSR6trhOkStYnBWqoPVP96owFUm5a7Jmso2txNfLQetUa3669Qdi/APpEPA/3plM
 qOSCFOy8vmW3Tyn2EWPc27uds42bsxGpKgdLPCNWYep+RL7pqPTEwL/qem9F3doU7KYVrXM55J5
 pUwGIAEsLj9mG2NdGzR4ILcTZKVR6OSWzFQvrH41E8bFrDN3Ouh1xpDRTlxaC8QngYfAz4JsuTo
 +bIk5+ee6Cgw0EiGWZw==
X-Proofpoint-ORIG-GUID: TE4HmdO40QFOyPkYQdv2in6w6Zzs0PAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110032


On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
>> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
>> Qualcomm Shikra SoC.
>>
>> The SMSM (Shared Memory State Machine) node provides the power
>> control signaling between the AP and modem for BAM-DMUX. The
>> BAM DMA controller node describes the A2 modem BAM hardware as a
>> standard DMA controller. The BAM-DMUX node references the DMA
>> channels and the pc/pc-ack interrupt lines from the modem SMSM
>> entry for power control signaling.
>>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> I'm quite surprised to see this 15+ years(?) old hardware block being
> brought back to a new SoC. Is Shikra not using IPA?
>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -17,6 +17,23 @@ / {
>>   	#address-cells = <2>;
>>   	#size-cells = <2>;
>>   
>> +	bam_dmux: bam-dmux {
>> +		compatible = "qcom,bam-dmux";
>> +
>> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
>> +		interrupt-names = "pc",
>> +				  "pc-ack";
>> +
>> +		qcom,smem-states = <&apps_smsm 1>,
>> +				   <&apps_smsm 11>;
>> +		qcom,smem-state-names = "pc",
>> +					"pc-ack";
>> +
>> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +		dma-names = "tx", "rx";
>> +	};
> This should be a child node of the modem remoteproc. See msm8916.dtsi
> for example.
>
>> +
>>   	clocks {
>>   		xo_board: xo-board {
>>   			compatible = "fixed-clock";
>> @@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
>>   		};
>>   	};
>>   
>> +	smsm {
>> +		compatible = "qcom,smsm";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		mboxes = <0>, <&apcs_glb 13>;
>> +
>> +		apps_smsm: apps@0 {
>> +			reg = <0>;
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		modem_smsm: modem@1 {
>> +			reg = <1>;
>> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>>   	soc: soc@0 {
>>   		compatible = "simple-bus";
>>   
>> @@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		bam_dmux_dma: dma-controller@6044000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x06044000 0x0 0x19000>;
>> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +
>> +			num-channels = <6>;
>> +			qcom,num-ees = <1>;
>> +			qcom,powered-remotely;
>> +		};
>> +
>>   		sram@c11e000 {
>>   			compatible = "qcom,shikra-imem", "mmio-sram";
>>   			reg = <0x0 0x0c11e000 0x0 0x1000>;
>>
>> ---
>> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
>> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
>> prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
>> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
>> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
>> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
>> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
>> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
>>
> If the DT isn't merged yet, you can also just squash that into the
> existing series that adds the modem remoteproc.
>
> Thanks,
> Stephan

Since the existing series is already in a stable state, the author
does not want to add any more patches to it. Therefore, I will
update the current patch with the DT changes you suggested and
submit a separate patch to incorporate the corresponding driver
changes.


Thanks,
Vishnu

