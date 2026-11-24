Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516399;
	b=O1ZrutR8w0YiauOfRHEyqPHqPSU3ZCCnBiFkmG2YLO4p9bqE0BaZ0dEo8MW+EZSiZa3/
	 lT5fiHWdtDKHBW6IyocherqTrsT3RxeeqbZ1oKx8KtQQVroq8g10ahRG5zcdretT7uML9
	 fHBZcxpB3xNCNqhMbM8iP8zjDGxZ3+r/qDPwxwo8FDEyCbVnU4fHEG6u6aAMQb5UfBuAT
	 InARsTBsTBOTyLCGXAI+GPLdsbxqzXPM1P5YgCsvboEDDg5VhrqcvHoSXHvBx9f7YiV1u
	 kjAi8INGhqGl5s9dzgODRYgyYY6Sz18iyXQ3wOGybI0LVBLFnGYKLGjtTeRzpD+5cDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
	b=maPn75818w1e6U7jFh2y0yeXXZEg8vhptRaQEfNKwee0Fo+F6RoFvTyU89P5GgC3Nplp
	 d7GUzvqfhAOR92g7wMiltYyvBDT32RGKn475meIBWbkmfiFxr3peKRMTmk/DWoRr7nWF+
	 iKM+Ea+SXEwh8oaXgEFjw6UD89rWfi2xhSeYbawn9ax6Xf18Ik2OzIi4s2+09Y7GZQ1nf
	 7HSRWnIzYk+cFyH+DW8ph7s/uUWYsD+yLh9lq/2e32yeoVWl09NOkkRtAbPKMJ+of1B3X
	 wSKg9tDji+09ffQiN2YmFHmIZyN/PxmQYwf7ef1cITnBz9nmFraF9/KRtQuZ2X1YDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVjdWauo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxQUq4PP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A26606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVjdWauo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxQUq4PP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8VOls3701098
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=; b=LVjdWauoyhZ/uSIq
	BEb7n/QlYwSxCO11t+jwKKq4fjF90in1+PzjDRbT2fE/w4FcjAWSaCV+cONMGBuA
	94F4vdbc1cxSNDeNQ3LR+yykWJuy8pOfaH+m1KaBfYegIOzALJOzWDR7YMnAMpk1
	6Q0+j2JJZYftiIUKMPDk/NF+EgDg+0+VSmwJi/I/pcEYTPjVKPXaV80tKoazVbU/
	4NS3OlfZ13qkjex8o+JHjuD+uGyi9zX0A+ddZrEVNmE0HWa/PSB7YMegyeuz1kZV
	g/RUGmFmZ5Q5cptAYx9h8LL+sKoHMOuWPCU5sqm6LsCrin3/7nFkvKbA+DQI6XyY
	k1UREw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky23bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:33:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so59598105ad.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516397; x=1796121197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
        b=cxQUq4PP+O9gGV1EDHjX85sZ4gDKL/KAf7UXLl68nZygGliCykVAYt1BZ4hf74oO4Q
         xy9uBJCmAA8Q8NHcnGuAP5o2U05zrDlyDk4hNKPkOsDt/QkAdp9rqYNCYbMqFsSRjwPJ
         daR6S0W2UeSqULo+qn37XqxNrnZcrIPvYMNSjsBzlvLFHZx5bWBphByGAWHYmmUUVtKZ
         zmMM0lSGpxkKxBHEElkZTfAAHvIxmlbbONeCMfJotr71c1m0pCQ6eAgoY1XpSsaDZAk0
         raDRGEUAY1hGsiWWxLfX9a3hueKySaPKWiyLRfVStXGFU67W59wwIqPyD04PdwJZPCiA
         pdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516397; x=1796121197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
        b=kEMVGEXcj3KW0ci2pACdkUMe4lZNzYnM/ZOjkLxLYko7eEtQD/G/wxd76VpXHJXduW
         1rlr3j5xQsvYu8kA8LGvl+4AwFO6D2F3+mz9qCK1UdN7VoMkmXOqjjTMdU+Ftku+f6tQ
         iEwmUTcigwJagBdOmqJOvsZAWB9Ebz5sa6HpVQvl4xitLdiLnU5+rJJ/Ha64frLRBq1o
         utJjraYbpGD0Nal9d1f2dKywcKfIIhr6TLf7CbXjKkmnZpN11xlJA2knwP2TpKUhecGs
         f+lIRW24X1nvjgbwPSMSeTzDrmMNXEGoObtLCqFNxc7WUv4WRSq7N8xKmnWzK7tA7dbG
         CmPw==
X-Gm-Message-State: APuU4Z+YXE7HLHANtSDlIM68S4rhQrz/cCFGH3UftzvVxLILLiNu3hZ1
	T+WRfDF8xNFKy+eQEI0WUr874rL5whyxl6YFlMbtieP54yyBz6FeyePpdQQneyUH4OHYSeoJJ6l
	8E8c3p2a72SYIi7HfNlUqqKHHt09C81qqA5bS8GBoGiCRvNbCuk7hRalcXLS4e6CTwm317WESJ0
	Q=
X-Gm-Gg: AZFdTZd0qJ28a/J3Aeee0cQYENNJkOG2sJemvNcccjyv2T+kZdL9KGQgty2Ul8zLHdv
	b1vAsoUyXVc4x/Boc5dZs04uMXni/FWpASC5kqSqwNPyFrrYL3K4nEPtj+hsyRm7TtgMY7gjwVD
	hk3SLiNX1WM8i5fNDoFzIv2wOsdWd1w9Fqwi7YBcv5wk6icpVK1kiYV/PJ6wMKndFxwUAvjqJvT
	g+YExHTQ/Lfmc9rETDKyA1sK5yrAFZuL0KsKBgtnX/RXBlr6W89vmcQBAgxa1J2L/gugLcndqUP
	QoWGWzvfJsutLEyELF619m35qWRxTsFCP1w5fh1wrHhlAVpskK5g7VQlC/4jC0Udya4xxULrjoT
	/dPUPWGwbUYM6li3ChG9uNCeCTZrcwML2IBltzZMF9jnzCW428pdJNUZNZZJAwstxUd/JZTYUau
	2vKjMaE+vbZNXR68cfqjLjJWRJoxrkPNDKQ1MGZA==
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr132507065ad.42.1795516397377;
        Tue, 24 Nov 2026 02:33:17 -0800 (PST)
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr132506795ad.42.1795516396925;
        Tue, 24 Nov 2026 02:33:16 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm66044105ad.9.2026.11.24.02.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:33:16 -0800 (PST)
Message-ID: <1c385845-909f-4e1d-b1ea-a17501e641e6@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:33:13 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
 <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
 <sashiko-outbox-230893@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-230893@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b0567ee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NOqMHipF7Z7UA0BjjVMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NP16YA8AgRADTJCxZc8dSx-IOsitOp_6
X-Proofpoint-ORIG-GUID: NP16YA8AgRADTJCxZc8dSx-IOsitOp_6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX0bH1ICJXj4Au
 lnfTR6O0EyfqFlED2j6yOb6cTVsVCuPzZZe2F7h+Xhh7hEvmatOTeiZmHZuecGVuo1e6MBNYYzo
 604ljGIgk3TcXVVxbeha1UYDgjOFlEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX6909d4UtuY1E
 0Rhc/cCBZgOHC1ymqs3XPUoXvHk8iKO8v7d7fA44C5o9em0v4WBNOxZ1qkXL9NYEM8zTZXH0D2B
 CQy1gtE/Rn4fctSDwm+d7iMK8+RbvyCagm/A/PX9RIgcM1dnwj9Q5rLvsn1Ds32LX1a6hG0ci8T
 QrYHqlpYdX0hrf9NCEn8wXViq7V3YVe40xxfFyHUVo4acvrJ57lwcXcVtzHcJjbjdEQZRxThaPS
 xse9QeUc2okusQR75WH+el0YpTlaOq9uVS2/566KSzBCScIPZnBkx6D+37+FKKxJC39EctzI6l+
 ZOU3PFcRB5IJqJdbL98vcg0MdZEYoyiOmlU8zvbtvLLkyD4lmmrN4Tw47SKVbmz3vU349sdXHuT
 FxSX28njQhhVYeNJc0DTC9e7wS8bJBS9cNYzb/QxnnaufrZP2l/g6jj8fm6tKAhRS/gRqOAHatb
 RPdIxd4mlbVfZQGUTeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040



On 11/24/2026 5:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: eliza: missing element-bits on static TPDM
>    nodes
> - [Low] arm64: dts: qcom: eliza: wpss-replicator port@2 violates DT
>    binding schema
> --
> 
> commit 54f1938fd654d770e58cbcb66d2760184479af8c
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Add CoreSight debug nodes
> 
> This commit adds Devicetree nodes for the CoreSight debug and trace
> subsystem on the Qualcomm Eliza SoC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 4a125ef386c02..7bf58daace9c9 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> 
> [ ... ]
> 
>> @@ -5430,4 +7484,127 @@ timer {
>>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>   	};
>> +
>> +	tpdm-ddr-lpicc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_ddr_lpicc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_ddr_lpicc_out: endpoint {
>> +					remote-endpoint = <&funnel_aoss_in3>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-lpi {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_lpi";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_lpi_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-rscc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_rscc_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in4>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem-rscc {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_rscc_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_crm_in0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem1 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_1";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_1_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Medium]
> Should tpdm-modem-rscc and tpdm-modem1 specify qcom,dsb-element-bits or
> qcom,cmb-element-bits?
> 
> In static_tpdm_datasets_setup(), drvdata->dsb and drvdata->cmb are only
> allocated when the corresponding element-bits property is present.  Without
> either property, enabling a trace path through their connected TPDAs
> (tpda@1080e000 and tpda@10803000) fails with -EINVAL in tpda_enable_port()
> -> tpda_get_element_size() -> tpdm_read_element_size().
> 
>> +
>> +	wpss_etm0: wpss-etm0 {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "wpss_etm0";
>> +		arm,static-trace-id = <44>;
>> +
>> +		out-ports {
>> +			port {
>> +				wpss_etm0_out: endpoint {
>> +					remote-endpoint = <&funnel_wpss_in2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	wpss-replicator {
>> +		compatible = "arm,coresight-static-replicator";
>> +
>> +		in-ports {
>> +			port {
>> +				rep_wpss_in: endpoint {
>> +					remote-endpoint = <&funnel_wpss_out>;
>> +				};
>> +			};
>> +		};
>> +
>> +		out-ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				rep_wpss_out0: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in5>;
>> +					filter-source = <&tpdm_wpss_dsb>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				rep_wpss_out1: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in6>;
>> +					filter-source = <&tpdm_wpss_cmb>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				rep_wpss_out2: endpoint {
>> +					remote-endpoint = <&funnel_dlct_in4>;
>> +					filter-source = <&wpss_etm0>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Low]
> Does port@2 in wpss-replicator pass dtbs_check?
> 
> Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> only matches '^port@[01]$' under out-ports for endpoints that carry
> filter-source, so port@2 falls back to the base graph schema where
> unevaluatedProperties: false rejects filter-source.

Interesting, I have ran dtbs_check and did see this error.

Will address it as well.

Thanks,
Jie

> 

