Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFA348866
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024593; cv=none; b=BPIvEuh1p0O8gx0UOTfURVugZKu9CTaiVVefL0M/6GKq5ghsCXJ/2kEFOvFWJkmRxbo/v6vQkY6CZ1pTTot1RPgpQSdz/oAbTCtoQnWjRW29++jpZu6yqkqyDKEzkU+EmjmGxRhIlioEh5IozLTI/vvG9r0m3kvqv/nzb0/Dg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024593; c=relaxed/simple;
	bh=OxsY1NQ2q3ZtwcrnbLGAxVCWFAFAmaNt08c8i3cUUX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpDMo4U5eCkhS7x92P2lcGoc7irrMDPWiNdts/do6O7lcALlL+UKnvJJmm0QIH1/wIXamFNQJiz85wJzh7Vp6/l7Oi5ROGQtAQnyZnj7xrIfFwEYJiF/C7t8r4q5uB2L5KINRaDFWiQLhvx0zdfMpFj6bZFapDGzUkxsHQz64mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCl2OeGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hW+VPIxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCl2OeGH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hW+VPIxB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HXfT2710492
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=; b=PCl2OeGH9MzWTa3G
	TFhkOw6DRSHsxewKYBbH4hwHKqp1CyqNW+Iy2yoMLa9lBqZZPpGCRJs+tznDFoEo
	0NFZSmQ4Tg7+wk6Mzd81/8VDsrlsFbZnIUDrugcp6sZ7CM8paBnIA/GnqojsGQlm
	l6vFFsKz2CKzZ06Qiq9it2DF3f9R5acK1gYFO8M+LuwJ2wchWhYQ+u6j+aKE84Uw
	3Nf2de7oUp4DXY3XaaCPPJcvO/tkKWnMQmBOrBaLQuQv1FiIuqm2xUFqC+a7pDJ2
	p4uqAJNZ1ik62+e9jKrhL3xG68zYQy71P7ImGw7QW0M7IwZKl0lA2Mw87XuHO632
	6Wofnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uggd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:56:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso153843385a.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024591; x=1777629391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=;
        b=hW+VPIxB1uXTwkZ6NvgJqa0Mtv8+Hye0ADtdVcaEpjEHdPcB0laR7HlWabb+b6D+R6
         Kt9NxhMxKtDNE0m9GSk6vdHkG4en6KKHEGeHi92SFCcSa16AKQARrFXQzoZ0dEA+WW6w
         wJKb+duk0s8pC3kOuDndbkMserTMPgl9PN/PYpcKqobnxcQzYCaG/dNwSQG2CbSTT/2d
         za5Jc5Pcv/Y+E+w54ImO60+Umhp0ajVsopcyzCNOFHYSxIAeuzcsFgyxA5wjKmcGxeqS
         Ajy9NQz+kGGEMuDuPWNOusIv9HFbK/Kms0fBo6AfinfPjF51MxU+ptDK8CTYxgv9D6Xq
         FeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024591; x=1777629391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi9Sg2XsDgjEFJOWv+3J51hYfzFPN6QZcVkOSlM1zUQ=;
        b=GBEX0fnuIMOKJ9QlxqZ09qXrLfHyL4AxDGfS0my44PN4BAggElvL/02xYmmPJwS6qC
         eFhY+Egn0GyzcDtt6VtercAvWQLT5YZc7lIRKsFhI2H5y4+aN7T6mqNz6G/Tj23dsTge
         WwAK+3RQm42wffFH6l6NHqzbQ6HNEvwYO2kbheOk01h2TkU03c+NhzkaiBM3TttffANP
         vkrRBNSitnA1OjrI2yVJB9UgogDLXqlP1hiX07aGysr6HZjgrBuwaAyi9n5J1ya4Mm01
         alJ8KJrvK+RnKm0L91RKJxJc4dX2VK26GHyiMOy8+3wRKEefz1uT8/3NIgHQH0oc4aop
         9j9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FSq6nVGttVAPkqbHx0f8q02G4i16KmmzH0iw5Z62qyfg3zb+QWCYhqH/C4dC1mjVo43sJP2K7/40Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzjPNcrEvxSIl8tY+IcFxINW5iT0tHZw3hU79JUgvGmjWX5wpUE
	Mb8iIZATprQEIOvRsVggpM9/2cavMI2SIYDdkg35A5KGfDOJPdsv9eIV4YMqe/9ALTl3kZvqHSg
	jFEWML+qPxuGq/r7c3d9fFWJTjiAdTDIuviKq4TGHzypIAjmVCs/s3V6c0yU1eXGETvNvoOmI
X-Gm-Gg: AeBDieumRg3f/+nfLf5ik5nOGZzvUiZn++X5CJsQPm9O7R2AidTLIucrHGeYmrWuQeQ
	b+Zx4Fh/D8tbD0ZZixgeTwdTATfRrJv3gsmAJHuDoN+5X8zrifwIgJCMwUQda2NPQYaf6pUnwVJ
	jd9hBVEZZkgxt80y3EzkabeoaR+jmMG7GVgyQ62JUeEB5TCsB+acD3soxL1nOH4IQb9Y2OuFS0q
	Oyfndo3LKrGf8PjyCgNQWoELhbwL0Kb/4bcfUXjUOXNIAYoWf9BY28L18+gSt9mCmqiJq1BP6BD
	sqMParTpBdO8Dy3s/vWZEeztyrfgsRLzB43D2wjEcOGFWYTDQXYq9N+8dTFxXEUSZvLMC/PLzR8
	eKXJQmlpdZkAveCTUu+BvaycJmB3HZcikx5i92Hz7GuAl7sX8F1zUzZVlZawuCDjnNG6NoS/5FB
	IYJ4iL4zrDWd1nKQ==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr188100061cf.8.1777024590697;
        Fri, 24 Apr 2026 02:56:30 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr188099771cf.8.1777024590144;
        Fri, 24 Apr 2026 02:56:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm744881466b.63.2026.04.24.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:56:29 -0700 (PDT)
Message-ID: <e1246f0a-f205-496b-9105-8308ffd68fad@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:56:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: William Bright <william.bright@imd-tec.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ram Boukobza <ram@imd-tec.com>,
        Tendai Makumire <tendai.makumire@imd-tec.com>
References: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-sm8550-sdhc4-support-v1-1-93fd81fea5d9@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FjHxKWQhUx40lFutEJE64UIpc5_kwJDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfXzzkKjiNlJlU6
 wBbToTpMXdHyjgK3xDWdSlW0IbsFLZ5OreMHPzI1KQoA53NUvyVzRacd8FU+5nR2q5pUz0rEo3A
 mjNQ/oEp0bT3QFeZdFQDXeto9cUgwuxQluy2VAgHSDk2xG+cgxW37bxLMMall6nDcwAdKkTdoR5
 gBJa+nQkcUGIU2cbt1HM596WsR9IEeX6Lzdfhf0qIPH4woXEBN0Wgynm6/YOn7Fu04nkcKMvuMM
 soRAGn+FgOAE41taRrop/dlbsNLIHdMx25POvt3E/gETI/qtKyGDem93Ec9uqQbCKk1wDVzsaPq
 tnFq/OF0vA4GcwuGMF8KB4Y0qGDEWoS2KLF+XPzQI/Qg2pFpEzW5wWlLFzI74BFuZRlxp1dyl2T
 /djwK2SMgxKml2cyo+cjuil2RgjlmpFo8KOesmWTNOsQIvKLssux5U9Wbxf0muaijto5RBJv9q3
 CNMZutWfUJGuJTI5weg==
X-Proofpoint-ORIG-GUID: FjHxKWQhUx40lFutEJE64UIpc5_kwJDN
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb3e4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gNcS5RXMAAAA:8 a=ue3Lulql8caq2XOSR9AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093

On 4/23/26 6:50 PM, William Bright wrote:
> Add the SDC4 SDHCI controller node for the SM8550 SoC.
> 
> SMMU stream ID 0x80 was sourced from the UEFI bootloader IORT tables,
> as SDCC stream IDs are not documented in the register reference manual.
> Unlike SDC2, the data path is routed via aggre1_noc, matching
> MASTER_SDCC_4 in drivers/interconnect/qcom/sm8550.c.
> 
> Tested on the IMDT QCS8550 SBC at high-speed (HS) mode. UHS modes were
> masked out as they failed to initialise; the root cause has not yet
> been determined. This board is not currently supported in-tree.
> 
> Co-developed-by: Tendai Makumire <tendai.makumire@imd-tec.com>
> Signed-off-by: Tendai Makumire <tendai.makumire@imd-tec.com>
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> Tested-by: William Bright <william.bright@imd-tec.com>

(we sure do hope you test your patch! ;))

[...]

> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;

I think these properties are invalid for this SDC instance (i.e.
should be removed)

[...]

> +			sdhc4_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;
> +				};

The only entry for this specific instance should be 75 MHz-low_svs

Konrad
