Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671839;
	b=01Lxz3lMeOfVCGADx6LEN0ntvyrRzfm2gn2+zNN+jokYNP11G0VGv3C4ipm4G50BJKPv
	 1RSTSdhSEEN6PkLxXpVLuwbPTJTueAEZ/QQumnP9gzz5jI4gy7Iy1rw7XJri8FmxCty9h
	 vRt9B6kxWSDN/Y3MV0m3Ni0WUcNAWNk3HA0XsIylakUdM6SP4xRgbLPAqwfuod/n3TJ3V
	 WXfmzgTN50jXK1JQTNAiLdSRxKEwxba0nS/qHWjUrJeZ1ledHqAHdCpaleH9Zu8Qxrm2t
	 xjQXOT9DfkmfIRDQYZVNQ2CNqTuLa+buqqWqqVOu0IJr/2g+xRnbPFEjktnv9sM7vEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
	b=yGUoLqbqnEkAGKUfP9wcCgaTfx3Ur96N3c2d0rtEyGjxzoIDLOykaECVjuAofxCtuene
	 EvWSZLcghjrz/KpTvb68JQ3Uw3BIZWcRmUU3Tgvdin5eNwoRbTxW92hFHpoPRd/FQp2sO
	 BdYqlqn/nDW0cBFaHf4AcMF1K9PZnNV0s1FXqVYTGZMalYhjvLHYWGljAqN1WKsenXyNr
	 RQ3Mu/kArvWry0/rlgF6XOjnjy76tK38o28U1MEgK8CFuXiz9fdFZmBubb4nWrIdh6K+u
	 C4fL70X0cy+JiJ40s1lrn2hgJfEk7w9dc91WdCrH5ncqMzEBGJxITeKcEaoCie0o0iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/cFlrzZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8tTvese;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E106606A333
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E106606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/cFlrzZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8tTvese
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ37Sxh3731021
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=; b=N/cFlrzZNj7XDye5
	syRQ8SFYvor8t6HTBHKjCkrn61vQU5KD9dGv2acaAm8m1LqvdPF3C0S0lGCQSlRi
	nAuba1z+6S0TWblPd3bP1LLmddmPlITL2Z1wZMV1Xm5gROEt5CxJMkFM8X/BXURq
	kjzAG60U89rlLavYFvI2RO+c9lT/Y0yowPulsZFiBWmgJcQS0EprQ8IHMJCNr6Hf
	99UW07KS/M2xJZG0ecE5dJJBN9bILOkDfcVprxKAGpbD79qyD6vsnACGt5KzeTMp
	NAHUKpAOhPZb17qgtFxxsGGfg3eYO9LhSm2CPE4Xt/xS42xNDvWp6hU813/h47k5
	KSglaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arjv5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:43:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so5648253eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671836; x=1796276636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
        b=P8tTvese8t6uAvihyx8bOqZ0+X7/4u81OmR/S/s6HiYkC42Jb34FrOwXyZ6QECNE2Z
         bDSF6SLfNTPVCsEcAAgSudgbUcS9r1nlbrF6b7NowQw/moDkrfsvomXOth46S+CIzmsg
         HqMPKKQ04qpQ3WmQVNd8gU+3ivT/jnHf82PobmUng8lHcSb7rDnJWfchhjVq4M4QMJsZ
         ZMuqE8xK2Wntrdz6S7+241FbGic46S7HMrqlufgla/Up/Cy+/vuaIhkN4skqClMxi7uX
         S4t6j81uN7jBmLIOopClA6P386CczoDyVKoSbdGKSRwm83OHNazAR2DeFrgTYXPCr/J8
         u/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671836; x=1796276636;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp6RLSDQrDH/2rsp2oSnV7qIHz331N3sNpUWBPirLwM=;
        b=zhcxqnjxHFdzaKmZmf6PrFL+7mD+18eVDkh8leomYsCUEzkfH6j04lR9Lu8+yk/lWC
         g5B58aQDh0ccPqaXMqRqbm+7f9nU2ge4Z/LQvHroJtk7vgccNk8MjwmxgIX2YY2MtBmD
         /iv7L4aFIZ2DLafBMCudbCN4hnyjylONwXKqtEbfFBJxA0cjGnMCCNED9d09aJW6cA6T
         k1EXLbrhuX3YIi2+7qztsLp7j3A2QNp0vnFheTTYTPj9WDrBlxECWfGFUzXi+bd0aByN
         8YUBhrt0dCID7z9vV5pCw6xv23AUMA7xG8uDW/FUw6xumwJpTZjrLnjznaaClV/QOHrH
         +pig==
X-Forwarded-Encrypted: i=1; AL+hErGGfvLmbRizzq3KE+nxUoZZhMQV1HNcTBBNefIBmUX1NLVAbkwj0bWZp02DJHiliPpW1QbrQjqazeyO@vger.kernel.org
X-Gm-Message-State: APuU4Z+c848JcsTzDWEp1GUBfLb0wHUqo2yzy4NiJbT2KGCiz8LWnK4V
	5Tq1oFZiQugrQGB1USFpGfLTSXuTjrNLdzDtiGL1HbRLn5OF0oHrg7kYBoL3BURBchZY2JZnwOt
	X5H8q2lK7wcOYOm6+19MDpHgkNsZFFKkkupKMZpkMUGs3g1uMlOvLgy/IF4hTLXR4
X-Gm-Gg: AZFdTZe92z/cuNFSt3rmw7VKOSLBcYM0BxC3torzmPGBlsiQMBwM2pwZMINnLBTok9i
	X3F0wdtxA2d7zfy4aZjqUMNc6DBYVUvUZ86VcSdciEU058zOsZ+ffxkQDmHxG+o4YzAztwb13fz
	qOhUWQCgNJStW+fsJ4Zq//CH1Ri6GETRXoFLbRbycuJw+HG6B4T6D0Ms6LED0enpi1D+tg80GeM
	5i2TmFrvIkP2UqwZmXw4T4KMAb2YOul+HQEG0C/GN0NkeW3utUUBSgELbyE4qSyz3IsgSgT/opl
	i2WkmoiGk6dj+ptWl82e9p3NjtAkWsPUjc+AUxn7RpEJMujoJkp1WuEhr5A8vezbj1Vhm5qz3uP
	sI+rbXs2M3wsYjrl1u8Kty2Ju9Ud5JO+tTMs9TsmsVW2NXHQzC7nezI1WczhDw0huLfLul5TeMk
	xzTCYc
X-Received: by 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr21370797eec.22.1795671835823;
        Wed, 25 Nov 2026 21:43:55 -0800 (PST)
X-Received: by 2002:a05:693c:2181:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-3856fd57eb1mr21370766eec.22.1795671835256;
        Wed, 25 Nov 2026 21:43:55 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm58415850eec.23.2026.11.25.21.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:43:54 -0800 (PST)
Message-ID: <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:13:48 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1rvggX4cMRURJxUulkjgtXgnps7expGx
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07c71d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=8NJSptN1c65XPqnLaKwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1rvggX4cMRURJxUulkjgtXgnps7expGx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX21W79LEETHPp
 fVU4YkQj1hosAnWsA5ahbaGhQJmF1opmMbzNswp7HQ2GG2+pSgBQT4bPFFhn8meJOkaxhclHa8U
 vTZU4YGCq73Z9vq3reToojw4gCdJv50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX0rx84Uzkpyev
 GUmgLANF1z4l7RPbKybvXkPYeqx4gdjr31kfATqKqNetGtkt793GWh/0qw4LtoWfx1ff6YkMhss
 1h41RMidVfsuyhltf83IBwAqtCYcoCOijKwWpIdCWh4F2Z5mt074uUhLgNXCles6KqSy8v7yF20
 DM4NZQF3w4eJD3/SA7NggCFZJELBk5DJAn/vemG1ktTiPUacHolevBKJY6iUwxYd18aaPWMlioI
 BPlK7MmH8jd/tvY4tpK71gjZj1KmKMx8kpte33h/60Gw8ZE6LADWdq4TtvUCXMp71aGXvuWBOP8
 BXeh5AH+n96YTINJPhVqHgKbanobE4Sdt2vc2BnAq8CsFuuAcqWLdR/5BxujBG6M/l1VoQzm09z
 GO+p99Jdqhm3eiOvXY5qWijvPtgx6k9UDPIMJ5SwJeZsY9AFaMG0J4VmRFT2XHuS4f4zu2WKygV
 cA4CERwYrtZ3eF3RWNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021


On 11/18/2026 3:11 PM, Wangao Wang wrote:
> Add a devicetree binding for the Iris5 video encoder and decoder block
> found on the Qualcomm Hawi SoC.
>
> Compared to the Iris4 generation, this block has
> - additional power domains for internal NoC(cx & mm).
> - additional clock for internal NoC(cx_iface).
> - additional power domain and clock for apv codec.
> - different reset lines.
>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
>  1 file changed, 256 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..13e346414a231af9a146076de6a3fa9e9c488624
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
> @@ -0,0 +1,256 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Hawi SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-iris
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 13
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ifacec
> +      - const: core
> +      - const: core_freerun
> +      - const: core_ctl_freerun
> +      - const: core_debug
> +      - const: cx_iface
> +      - const: vcodec0_core
> +      - const: vcodec_vpp0
> +      - const: vcodec_vpp1
> +      - const: vcodec_vpp0_vpp1_gating
> +      - const: vcodec_apv
> +      - const: vcodec_bse
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  power-domains:
> +    maxItems: 9
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +      - const: vpp0
> +      - const: vpp1
> +      - const: apv
> +      - const: mm-int
> +      - const: cx-int
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: bus0
> +      - const: core
> +
> +  iommus:

Since iommus has been moved to the child nodes, it is no longer required in
the iris node.

> +    maxItems: 4
> +
> +  dma-coherent: true
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/clock/qcom,hawi-videocc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@2000000 {
> +        compatible = "qcom,hawi-iris";
> +        reg = <0x02000000 0xf0000>;
> +
> +        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
> +                 <&videocc VIDEO_CC_CX_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
> +                 <&videocc VIDEO_CC_MVS0A_CLK>,
> +                 <&videocc VIDEO_CC_MVS0B_CLK>;
> +        clock-names = "iface",
> +                      "ifacec",
> +                      "core",
> +                      "core_freerun",
> +                      "core_ctl_freerun",
> +                      "core_debug",
> +                      "cx_iface",
> +                      "vcodec0_core",
> +                      "vcodec_vpp0",
> +                      "vcodec_vpp1",
> +                      "vcodec_vpp0_vpp1_gating",
> +                      "vcodec_apv",
> +                      "vcodec_bse";
> +
> +        dma-coherent;
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> +                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg",
> +                              "video-mem";
> +
> +        memory-region = <&video_mem>;
> +
> +        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_GDSC>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0A_GDSC>,
> +                        <&videocc VIDEO_CC_MM_INT_GDSC>,
> +                        <&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
> +        power-domain-names = "venus",
> +                              "vcodec0",
> +                              "mxc",
> +                              "mmcx",
> +                              "vpp0",
> +                              "vpp1",
> +                              "apv",
> +                              "mm-int",
> +                              "cx-int";
> +
> +        resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
> +        reset-names = "bus0",
> +                      "core";
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        dma-ranges = <0x0 0x0 0xffc00000>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1540 0x0000>,
> +                     <&apps_smmu 0x1620 0x0000>,
> +                     <&apps_smmu 0x1544 0x0000>;
> +            iommu-ranges = <0x32000000 0xcdc00000>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1543 0x0000>;
> +        };
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-150000000 {
> +                opp-hz = /bits/ 64 <150000000 150000000 150000000 225000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d2>,
> +                                <&rpmhpd_opp_low_svs_d2>;
> +            };
> +
> +            opp-285000000 {
> +                opp-hz = /bits/ 64 <285000000 240000000 240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>,
> +                                <&rpmhpd_opp_low_svs_d0>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-420000000 {
> +                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-560000000 {
> +                opp-hz = /bits/ 64 <560000000 533000000 533000000 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-630000000 {
> +                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-800000000 {
> +                opp-hz = /bits/ 64 <800000000 710000000 710000000 1260000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +
> +            opp-1000000000 {
> +                opp-hz = /bits/ 64 <1000000000 710000000 850000000 1260000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo_l3>;
> +            };
> +        };
> +    };
>
