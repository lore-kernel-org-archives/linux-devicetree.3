Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE63AB5CA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179943; cv=none; b=hHTxZwPkQtc5z78IK6kA1L3/oYsvKMxHsaY6gBdJc0FhlH5HpF2odIryJwb0f8tWetouQLgDgNQZAZZiVGFu041xrkRBAkBzfbUjhwxCqNpEcIM9InFLE0zkJvWsq2qQ0LuuvmnuCev7/sApssFKtrsbkmD46JVDkuSQBEzqjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179943; c=relaxed/simple;
	bh=EA0AUAvk35NQY6LEzUqKFoDKZRbUWX0Uj3FBO1tYFHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2PmRKRHcHmHEFEfO1r0FkWfmTfsO/ZTUZ5l0okxymnVwf9vg31Z1tFj8bliB9spVkEhcx3jHqZJpxVAqn1/+AIuSNmw8IUzV4C8z6lNUjqRmAqbouPVOtGhkv+IA+XF75G0XiuBx8zMmBgvUJAQ6A1YAVzCAuFmE3xxOjvieiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKxjK0mF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvpqSYIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKxjK0mF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvpqSYIo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xDMH263728
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=; b=YKxjK0mFYbpZHDzE
	GEyMKy8QPifImiJ5OX/OSrAmNm1Id0OPwHENm99gxOxfO2vjpGspb4R4Wbwv6Izi
	vsG9+PN4KhqkqEFju0YzWna11qHFt7XBFcmj7/BNyYi45IkaZ6Bhx9ibffn6tza8
	np7NXZT37f0dpgjIn84eKqT0ko9EtUTHiJ8PhEiUWFWEkTs5h8WRB/1iCCNcT7Kb
	vPtde36RHuCpcUcCdX/O88Yw6NH+a/FcaDzNpJFxbP3AnvV/EzeEYSNZ2yDcBuvs
	6Csg8VrjLvxsnjg5Cp4V5K9VMbVs1S4lu7NjrhgFMQdwXwCrd4IJusZtsMf4Lx37
	x5+OOQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uua30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:12:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422f987f2eso12102418b3a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179940; x=1781784740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=;
        b=EvpqSYIoCiDZW10fHKlaDIPBVn3JNe+b6YyCnhJzNoGy2YfruMd0SRQx457iJRh8Qk
         yV/Vr8gj9DnUbYb7o5zSTFscIaoDy8GdLwD6ED2tR12Q3rthgK1EimPs2ZhBjdcqxtfL
         AxVMBMCr9+tQKSmtsQTb8DZ7pMrGPNHsybgcaDRTW2s9Qp3fC9+Yh36g62qPoGZaxaed
         lhHiXnydz6jbXlKQEc15cROPS4moHnXrzK2rDAeZx7FDbGBQTWDOE3fFziQoKhGXnQEQ
         fXO09Ak8Urz1q0mmNDsLiptfeZUuOut7LpjF1CnlnRKT+qmh3EwrisLhpSJww1tMUhoV
         Lf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179940; x=1781784740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=;
        b=GLlBfGUzpLD2EsQ0IPxn9Ep7H/pfnYEL1JquIiu5X3rABLnjMcd9BRmp7uG2h3kjmR
         JrC/gt612ckQ45hPw4DvpSxtUWxZw8rdZDi9MYO5x20h5Mln//vxhvaHHlCbVML2D0Eu
         Zyr8vMjOy5I1niATM4ECfG2+k4mrDAfMWfdSBQs+HpsywzrxAprdVO0KItpLmYbcSL+T
         HDY4sJcGd0Vw9AC53jpcG1LxpINPwK4dq4zQ5zmMkZMNcq/DI/e0qdS3EMMAUyA6ETcd
         Bes9vvlNwh0c+i18n9WwM0QmYKDySeMxXOYG3cn24KOH7E7Bu8/TlCtasHBOxOURp+N6
         pocQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cSNon+/6V9AVgwoyFRYe4c7/s0R0MKDpgoWoVgwDEmceYJr9CrF7xx6MyMuvYrAz3SO5kt3JGoUJs@vger.kernel.org
X-Gm-Message-State: AOJu0YyZrWwSLOZLrXMZjW4z7aKFnFS1rx6FvELW7UoRnfNffsAB3GuZ
	55rIG7rZA/QlJY7AvY1V8YInVUATyRwCc/QIdKYc3UANZlZATM5t6Vn83borl75SuYs+ujiXdFg
	xpAo7ceM+oBphlsx9C7PR4sLik3LK/jyzokMsGxPhjZ9pkf2WZpBmdR58ALBCWzfH
X-Gm-Gg: Acq92OHs8F5WrlBQIwu0gEQDoGlw3P4vE57SLW4CEvxV8vxmryDZCeEzT4T+ryPztVT
	T/bre1BsavskNMuaIwPJJprRAU39sO24R9U8hiiBHZa2fgucp3h5qjKQFh/936FwxfLcgD30t4I
	NE3jprvoN3geTxi08gwtyOT+wK/Hwr236Q9aHcHNoOa5hH73AxDKtj+YNlMKlZ9kVbB2r9BisJs
	nMAEB+10YdcF6dlQ6TSr+K3l6w9Z8td5fMWyKnZoebYbo+76/uSD3gfOrj/L9TQLL075RG4aV2G
	RjzUuOggILfth2legJH09DEE5zeWF+++H6jqaZgHKIkhOWMM+FYtGWyZ2p70WHKkGvH5n5Rt+R9
	yRQ5zmA6HX+4plDJtvuT5f3Dvy3fdeICXU6X2fQn3SEVTh4+mR4dJz/5AMiq916s=
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr2759780b3a.39.1781179939969;
        Thu, 11 Jun 2026 05:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr2759747b3a.39.1781179939535;
        Thu, 11 Jun 2026 05:12:19 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bba740sm1926825b3a.23.2026.06.11.05.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:12:17 -0700 (PDT)
Message-ID: <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:42:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2aa624 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfXzMvMLyqU8w6f
 joq5LWUREYL7iYnUijafJ+LHSCnAbRM5xIEth3IsnMeUSLvKfE2rLHFsALK1rd1ss2C8pJFUBJG
 bW1fFuFhPkuCYh7BDLuN2XlP2jssh8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfX85SYHnXehuDs
 gxRebrQ+Dp5qm3KGzqEXACPsPkU61iz1ti1VFRQKSJ9889t5bwjoooI8+t5g455PToDVfiHNmFR
 NNW+RCtORhUY5My8hNAUt438ncSquCLqmuCzIQ27posmza9sWN1dazRDRoFp2ifqiKuWa4fOVqU
 CItRoTPQIsPXqSK2NrMl8Y5YS2gkQSvT+kEUBKdXXXK4zHhebTNrpCbXY4uWwVJoXBhVCY0bA45
 hcp8ZdFcQxlsB2dH5bEnpW4rsvBym1Z/7TVQ2PzeY/2QTb91qNW8ccM7gpmVHt+t8objCqCATT8
 mJo8Zi0J8QAVOUnq16rtaf4GcU7Li3vKPfFmsaY2RTZVfNec1QJycoxKj7aR97qjGvwfDkdxbls
 ZrpYVVfZd8w6Uh7ts86AlaELDAN5ZRnJt18HdjLZ78d/A8hp6kF0FigSGWysEMN+BCbJXzxcZ/d
 ZCn0k4iL2g5L8+hPtRw==
X-Proofpoint-GUID: eB7vqhqRvrIQbEi9S4F0-8KnjqEN9050
X-Proofpoint-ORIG-GUID: eB7vqhqRvrIQbEi9S4F0-8KnjqEN9050
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110122

On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.

s/eMMC/sdhc

> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd SC7280_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?

With this udpate,
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

