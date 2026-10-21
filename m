Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564552;
	b=ri7CLEunw0da7SFie19sACOPrPjzqen2XhlNsDJW8qdxjUf4qdgzuoD3aEy+HPxBf/By
	 WuvzFqcAcbS2BW9WESNnh5K5g9wGFXLq62NPrXkCRen+FJUKSWi6U5KqWpgGuz8CBk7xt
	 HTtLYuYLbJ1/qMzVrfFAPWlk5ZT565AlmBZuZD/w5lW3iUNohj9DBKJPpRb8YsX7EzNqG
	 6ZYaDCd9o/nw46RQABTMWbBREyIarHLCUUAyrMP0tyFDlohmpaJSCX8n4vJaqhCnpARRV
	 9lKxgtfs0xQq9sRlzvb0ReqgUV9u7iOoIGMsfn+sTQ7lJ2y/U4pS6UP+Pr7HGjhOaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
	b=w/KTqv1kou6BuanQEOrPG6QdmNosUTqt6zGZ66DTX50iFvIlANEO0Fqs2jU2aAzDB/AV
	 le15c1R+O+Gqi7rxsc3AauHRTQwdNM940LxGlgE2UW2ULqg8SsTTybT96lbHS4gcBr8qh
	 XZaUxmVhXPkTNZN+aResw/qwqjtBFWCj8Uwoh0e85XvWFOjLxUoq7FwXWsMiUwblV9R2p
	 +StpALX0JjF1tu/Nv0XL5JI09fOcYwc5V41EnJmE626BcfoFtXHMWWwo1WHcJSq6MvVeW
	 mzsTJ4fJvarf1uCe2fPccdL1qSwh5O9orMOiTe7EoA4UMc4nwqLyD64yuYVuNojY83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhQtrWrF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjzEJhPV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86010606A33A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86010606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhQtrWrF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjzEJhPV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jevF3573555
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=; b=JhQtrWrFB03Lqiv8
	+cT1E2OATm7piuAfcVqLiPA35Tbzku9cv25le9rrXSoqImK/9H+kRDH7RZ7uWF1E
	lSIdBokzciN4b41XaBVR4pc0qdz0NiDCjzrNznqkr5GaqhmkkxH/uw9ABQn9DDhL
	dIcEpCUX7rpOMuI9PbQ5yQRWq+WFkkjuvMdPVDvycTl1/9Eaw3aZWPXi4/MFhUIi
	sGILMc6zERyxcbIPjX8Sl6rW/t/Q9IRW2u96rB1fqcNCfefwBGjqHI84+YHESvXn
	9fJMFVJgev3/H8an815xsR+r7TH3DTCqGALvG/3nHQsLKwI0ovhQfZ9rQHrVc6qr
	4gyQWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htby2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:35:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso648693a91.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564549; x=1793169349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
        b=AjzEJhPVLkxs9IFKt+NianqO1Y3W6p6yPrbGiL50Pc6/7EnIBPar1h1k4r0oJzoGVV
         z/HDZQ0qH6a9FKs1SETlM04pBekOUnRBlwG44hv3Sp1djRVjWi0kCcJNBICRm42SrvE4
         5JdAyc6EZOJirWNmJb6fAiF2x0X0tNf5+xaZqNMYNlvJEFi05+s0FbUybBUFLeRzJKBF
         OhCEelYJv/+STdmXZODdACwyBtE/kBIH1uWyaaXPkj16VtybLYdBFPPAyM82cB8Mm9fY
         PMYpm49ARKhQ/aJOK0t4m6TyR0mxcdeCfPqnPvx4YGwwI8zmKDmMOTlQVyZ1ydCNY7W8
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564549; x=1793169349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
        b=Td6FZOlfHWfeRvAjIigVOqrL70f3OSKzLpFg6IQJrAnn8oiZkwxZk17OoWBU0Iu6Gh
         NLqYkpxCF96/42SAehw/99J3qN72kG6P6BD6Is368XEd0iNDF1UdPk4uEWejb8+DTrLD
         GoKrT1/Z3QQSzqwoBlBQRE4TcjyFvRLs/9AvuRbtPKVe/+x8joV8jmHbhy/JBS7zymIp
         weGF4bnBKmUipDfNWU10GDfp67fgUs3Hcr7iGE22VQEMqRt9NJDxciqrZNwJxUcm/C5O
         0xZm962gCV7gnESbzTlWDFplhMxkQaMLuxTNwDCvFhztrbA7hzF+/TVTj+bMVPKAGIaB
         yb1g==
X-Forwarded-Encrypted: i=1; AKwUvBwN/Cw7tZGH2ADgu/jXfAdCnJJgYFC9AeAMDMHXfqQlwZ2b05KL0+RC6MiyB9QZWP68bd84cvJ0pnO7@vger.kernel.org
X-Gm-Message-State: AFq9FYL9/TSFkrAnpajD7L+d+nL7gDu8dyD7tGw0yKtnPsQ9CuFszFx4
	2IPUa5UIR/jXAZ9i/OhPdZgVy1eAvm5nIf9mxFnALB6ZxpgrONVt/y5DwjQaEeKzSQqXBG07Kkh
	VN8uzslzz4Su6fklZZoy8TMPo4rzXDGUWHLNCaf9YQZklqvzWPi615Vl8bYPjfEb0
X-Gm-Gg: AYBFou1mnEpRAIawbE4MS8754l6lDMK4+SACv9zQj37pVrVNJsKRODXDHVGUGmt4nl7
	QbfuGV9AcMnVPuvcucorgzUL8YRJHYuiEXWx0BMBTjBGYsOyD49nvxKr4ISFG96IDqMSx7gDpD7
	apPx5StoHzu02dm4vesSxk+lp7SNfqXz9VfDHThaDMK03QdBC8W/kqrZbbqAWWfpGvYvJsU4LyZ
	572CofO14rg38/JAWBvgwH5joIPF8R43jAV6KXWX34g9JtH7rUy75ZEdCLEpC8UFTbSFYfpl2UJ
	CYpeIEfscF9oDeFmfRx3t0+D2r/t4IdHb7siDXnlX+yRsCY0+Hwhqo2F8h8pIRwF7MEJS72wyAl
	p6nlw2RH9vueYdwBxPvgU
X-Received: by 2002:a17:90b:1808:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ad86ef0854mr701237a91.21.1792564549210;
        Tue, 20 Oct 2026 23:35:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1808:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ad86ef0854mr701225a91.21.1792564548696;
        Tue, 20 Oct 2026 23:35:48 -0700 (PDT)
Received: from [10.216.19.242] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad812c565esm2727456a91.10.2026.10.20.23.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:35:47 -0700 (PDT)
Message-ID: <610c2dd9-641b-4358-83cd-2f0f209a23c3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:05:42 +0530
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
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-1-4d713d316e9d@oss.qualcomm.com>
 <atW6BKKehHJTbGOn@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <atW6BKKehHJTbGOn@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad85d46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=a6GiBE6abnfRvAsHYC4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX3w7RTzZv9F2B
 ar8hsrVGq0X387a3slg+77o+bLCPy8HK3mXl9p7fTm6T718jX7ikSCmhNd1s7gIwHnkvnvzjl0J
 a8YSUmkJmIA87grxKnGkkWrjDrgB8wc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXwBRrHTjX2g/5
 2fLHPl3o7hqL+bpFJlrjJq6ipqReiJnzQXCmrvcscB8nLWL8PESXGioNs2LpuqbeGdsLaKplwpG
 IPgahv8zSuc9VkVOSeXUbweqr+tybm8BoIVbdHuHl3Fb8ydgz/+pjXoUHXqJFVDSbOGXrzDWPRV
 mJvTFSeX14HwGvQgCv9/z2vlHPncq2JFsVA40wdor5FAzyvf6eP0kDnh9hKp3SSlFnZvoDpUwVR
 bAJxpoRyzkQ33Z9AsP1tDU1Ub32iiItf3EbfDVYc8NuO9AcxaCdUj4dqY0cPPMGer2ah1eJ0lDP
 m8/WRofGD8FNXbR9iiY6HythmwsHHstkC+8wKV2AwhatZUL6bpF7xUa9I/PRppYTYYOOseJj2+6
 +pY2Q1Vi9rbpTWZtOi1yq1FgDxMSlGKfVHfhyXEI06+pT84XYRDl1wLKpJw/jdtOZ4h+9oPehAG
 obgNC1R6MlYwevis1lQ==
X-Proofpoint-GUID: _AiCv5xgmpGYO-21tHzobsB_mlJI7FhS
X-Proofpoint-ORIG-GUID: _AiCv5xgmpGYO-21tHzobsB_mlJI7FhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

On 10/19/2026 12:04 PM, Shawn Guo wrote:
> On Sun, Oct 18, 2026 at 12:46:46PM +0530, Anurag Pateriya wrote:
>> Add the SoCCP (System on Chip Control Processor) remoteproc node and
>> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
>> the clock and power-domain dependencies shared by all Nord embedded
>> variants in nord-embedded.dtsi.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  9 +++++
>>   arch/arm64/boot/dts/qcom/nord.dtsi          | 57 +++++++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 6dc4c871f41e..e21b9ba480f5 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
>>   			     "nsp";
>>   };
>>   
>> +&remoteproc_soccp {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +	clock-names = "xo";
>> +	power-domains = <&rpmhpd RPMHPD_CX>,
>> +			<&rpmhpd RPMHPD_MX>;
>> +	power-domain-names = "cx",
>> +			     "mx";
>> +};
>> +
>>   &spi0 {
>>   	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
>>   	clock-names = "se";
>> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
>> index dfbbaf94a7ae..827531fc1276 100644
>> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
>> @@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
>>   		};
>>   	};
>>   
>> +	smp2p-soccp {
>> +		compatible = "qcom,smp2p";
>> +		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
>> +					      IPCC_MPROC_SIGNAL_SMP2P
>> +					      IRQ_TYPE_EDGE_RISING>;
>> +		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
>> +		qcom,smem = <617>, <616>;
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <19>;
>> +
>> +		smp2p_soccp_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		smp2p_soccp_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>>   	soc: soc@0 {
>>   		compatible = "simple-bus";
>>   		#address-cells = <2>;
>> @@ -1587,6 +1609,41 @@ uart13: serial@a98000 {
>>   			};
>>   		};
>>   
>> +		remoteproc_soccp: remoteproc@d00000 {
>> +			compatible = "qcom,nord-soccp-pas";
> 
> It causes CHECK_DTBS complaints for nord-ride.dtb, so we may want to move
> the compatible to nord-embedded.dtsi.
> 
> Shawn

Yes. I will add this compatible to nord-embedded.dtsi in next version.

Anurag

> 
>> +			reg = <0x0 0x00d00000 0x0 0x200000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "wdog",
>> +					  "fatal",
>> +					  "ready",
>> +					  "handover",
>> +					  "stop-ack",
>> +					  "pong";
>> +
>> +			memory-region = <&soccp_mem>;
>> +
>> +			qcom,smem-states = <&smp2p_soccp_out 0>,
>> +					   <&smp2p_soccp_out 8>;
>> +			qcom,smem-state-names = "stop",
>> +						"ping";
>> +
>> +			glink-edge {
>> +				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
>> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							      IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
>> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +				qcom,remote-pid = <19>;
>> +				label = "soccp";
>> +			};
>> +		};
>> +
>>   		rng: rng@10c3000 {
>>   			compatible = "qcom,nord-trng",
>>   				     "qcom,trng";
>>
>> -- 
>> 2.43.0
>>

