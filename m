Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437621;
	b=A+y722msD/aSGMTWEsapgjfdrcxed7trh8sGEOkMGEM2js12D3uKEGB/VVZKqTAWGN0s
	 vCz5e61tF2ZJriTT6HyvPS7ufBEFiJXGYRrRY0/QjQMcjjL69BN7JPGKwl4tWGgBidP8G
	 kBPuPE0/JEOerEBjtLT7Vz940xNCnstasWOOjlXtD+DTYpPMpBrjLrswKis/Bf7mrUhMO
	 q46a+zN7nx1pj83cHkRf7v3eQTQS2QLivPnwZ8pzImODHXzXvaWvMgbySMqT4/iz2G/D7
	 hXskdPmAOoVOlYO7S1Q3rKobY9nCEC2Kh4WvyFxCHlth8pOERpnjKJDxEsoQ+IHFdnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
	b=d80pfPhQnB6V75zsy+nqdJ3oUZ/oEPBMrf0CEn7TIgxiST4c4Yq8G3jG/wIBxcthgtPI
	 lR7P6sNaGikGxqLbpiVA54qF36H2rjNsfY1Xc9fCEgNx6Mgz96+VOFWCUrEydILpbE2Kr
	 15kIpFcI/Z4n4QjIoKRr0GdGlUA7RpC2VlUsera0AwUaxNFTPen+cxH2yLOokb9v+D2lW
	 cn+ae8kI5tLrEC17ZDlcFtXFhh91CpcUSGeZo2QNZy/clPn2VE2EglB9aj/3XzE2yBF25
	 A2XubyV7bIzOI1ecUZiJfjmB+Xq8lDS57Ygb/8EAXztGWBShJqERblUhEW9Mf7AM+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMqvsGxa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrNR2wmR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9AF606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMqvsGxa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrNR2wmR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4libc226718
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o6sTbifNJZj9Ss/BoT9XSVvZ
	GvTCCVHXANMlYczDtMM=; b=nMqvsGxah1fsKiSJXns816xmhotP1OZB8YfT5nnL
	xK+CYAnd4e8/o/WArc4tRj8gObOsmh3H46dJ3Y3jr8xIuErwCqhmZ8L9YPr6bT/u
	Gly87j590LZPL1n/jvQ2F0U9uQHkzFaN/YUK11U4r4CiMXoxDXdbuq3Fa71fVQnH
	pMngMsCIW6nVNpODOZ9hSIQcbG+KdMp/gXlUHi//85dblHaD+rZTkDfWhOcvM6t6
	HWnVKHpzdneBflbXLps5WPRaHP2mLWrRkFSCFE3BKHGZYnxtiAikf1Y9IM7dFdC1
	R8VeAE/YIJVMqb8M+71MqXo/UX75MQzeW1EyYO2GzA63RQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98j5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:06:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3800580eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437619; x=1794042419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
        b=MrNR2wmRFuWPFZ1MCfBHYAxCvfMpNDtK4urKRDjrfuN9mCpVdcsktu0QdvPCMQ9nHQ
         FcOfjSucrrlgggmPoTWkXFmDNMgWafdBYopJDNkb+QKdwHEEL836jOtxoboc+uKFK4h9
         OJegE7Ng1CW5CLME2KZeY5rgFrbSlPAXKhr40ZvIlrPQprIwJEEOatGaqVxlMHgiow2c
         BuXN6aOoRPSJSSFQ6jrXbUjMYgKXisWi9fXfEm9ktVGOf5vEvKQtjYYITOJl+Pt/1eBj
         eIUIwUVDyQMJrOcW7aYTKnuirIp15g7w7NL1r7DMSQuzYtcKGxhFIN70PUQQb9m+soJk
         wD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437619; x=1794042419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6sTbifNJZj9Ss/BoT9XSVvZGvTCCVHXANMlYczDtMM=;
        b=FfAUBNqPegvjUaxxjbRbcTzZn2eyNQ5KwJsvKVd0jS1qsxWYSfbqZHWEc9DNpVUhSR
         K5hHr66E9LhwBa1ESTNcozt4TbgxymhUc91bj45GPTsPD3qWbdev2N1yoCxtL4hMip1N
         G5C0Q5IEQ+fYpyPvLSvdL6vMwklRZ06Z3vLmSuSfWBhynGCzBRPkvU4xZqdj0eovI9YB
         WcFtXm2IN/vVzuBP3XK8AtwWgyaBtR05hd/W4KWDQQGcx/5u9nf430kgI4oaHjNiF5FD
         3xZxOZJf6rdcmLtXpWu4Y7N8HXFtzbgaQghkhrVGbvfY1bNF49r0/LJhyyz7qHEsWgcl
         Aaiw==
X-Forwarded-Encrypted: i=1; AKwUvBzvbHBIBkFoisC25+FIa5MKfqohETBxzR6n09rh3pZ1t/gGaZAvXgb34AOXOMFEsNFGxRSEAlmiFWPf@vger.kernel.org
X-Gm-Message-State: AFq9FYL3u8CROMnxysNtBc0h0mckF2FcL/Oui5NXZvB8iw7p7XcUU+X5
	37+Ryb3cLjVwttiJVBsDJdU5oyAykyBG77Viy6PaQMudjBwHtkfDz+cxZRe4Ar7qPaMwsWoVljZ
	KrtLyMrnlOaVpXbdAvljNKDoKWqVzlMkhsXp/HkGcVS8AxcL8IqbXUWGARhGWkHOhw/CeRAtNUK
	g=
X-Gm-Gg: AYBFou0FdALewC8X9kgEQsL+owOOj2vSGP6p2VqrkQDuxp2Pf7XV+siY9myoEYWui1s
	/4z/n6BulAL8hfDoP2mQ1OF1f2K286e8unWF/2W6kkrCDO72kxxX2Q9S7/A/zNhsIEwTBsxHx8X
	iCZAJMXCUQ+7qXQ7fSypDRrpqYNlVyJ3WCypJyFCJ2FbdAS6E4NGkzPU91zhX713Jcl456u8hG+
	P7kehpm94afh45Qp7g+wta43/81Fje91dqpCQwPwLRjnh9K/O8AUlxDcZMbmJbx8fcv9dALV/FS
	CmlojKTF9JamGfg5mwIQ8AzqoTuUDnEYVD+MShoJ/y84iQEZak1sF7++KhX3tVkmObcJz9xc+Fx
	lGOJBBhmvJodD22xDswbNEtSrZzX3PNHmzchOi8b2m2yhDJRr8LGnQIFCjlHyxQvdtjFxCQ0b8v
	VBLF+NXxaxxHDfQO0=
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr6921709eec.20.1793437618681;
        Sat, 31 Oct 2026 02:06:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr6921677eec.20.1793437617966;
        Sat, 31 Oct 2026 02:06:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm17598140eec.22.2026.10.31.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:06:57 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:06:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWvrIrnmC9I2dWE@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46432502-b2a1-4e7e-b3d9-447a3e239fd5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w6AH2eLcb7CwpVo9UbTPiTsIZAPISjJp
X-Proofpoint-GUID: w6AH2eLcb7CwpVo9UbTPiTsIZAPISjJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNiBTYWx0ZWRfXzVwrdgVhnZpR
 NIeTn7BfsuG6AIiBr6wyIALVDhWXWyKsnStEe02sN7eK17Ry/Vyj0XzCxbH/70488R+6Q+woOxy
 MboYrhhh4Wu8k50jT9/YGgsHkuBO2kEfg2JDFg1XFV7mdFRwNlVEzHKh4081yfswaAmiiVNI0k+
 8DiTMd9Ofx4Qb0ufmrwViInO2Pj7APNWqS+3iu5zMmWaEOfdArP7wsT5L9p4zzvXGqestt/LuTi
 djMK1eg2awJxeO5Y5A8mh9vnq1UKc73FiIw3K53EdAaNbeLGHCrUjfNc5cmO3IuzL2za2zn3pdf
 xekxSoN4XWQNh7SyqgVaEQLcbfsu/BSztMegu9DNH3C5GAFKvMNnkXujc8dvaMc6V5oYUZjvk2/
 94sBH8O83dB7hUQQtCK/1oBC3jNrpxQDmK4eRWZaJvlftjtDDpWZN9yQ7gslI0Ab9ioWp2kAJAt
 zwFFEXWIWTZF7NCwv+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNiBTYWx0ZWRfXwvwdL/0Wk2+P
 QU2E4fbD3bQU4PHQVVsckyBTvFeX043YLAs4IHKEmEZ/BdatUFCr8DvDGor86HEPKTbzcO73P5C
 Q0tVWOY5yFrAsEldqds8URMKi1mBUhM=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5afb3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=yIiWiYsqNO_wyTKnxrMA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310036

On Thu, Oct 15, 2026 at 08:15:21PM -0700, Deepti Jaggi wrote:
> 
> 
> On 10/14/2026 7:37 PM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> > 
> > Group resource operations to improve abstraction and reduce the number of
> > SCMI requests.  Follow the SCMI-based resource management approach
> > demonstrated by Qualcomm at Linaro Connect 2024 [1].
> > 
> > [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi | 3232 +++++++++++++++++++
> >  1 file changed, 3232 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > new file mode 100644
> > index 000000000000..4c155cbc7975
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> > @@ -0,0 +1,3232 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "lemans.dtsi"
> > +
> > +/delete-node/ &xbl_boot_mem;
> > +/delete-node/ &pil_adsp_mem;
> > +/delete-node/ &q6_adsp_dtb_mem;
> > +/delete-node/ &q6_gdsp0_dtb_mem;
> > +/delete-node/ &pil_gdsp0_mem;
> > +/delete-node/ &pil_gdsp1_mem;
> > +/delete-node/ &q6_gdsp1_dtb_mem;
> > +/delete-node/ &q6_cdsp0_dtb_mem;
> > +/delete-node/ &pil_cdsp0_mem;
> > +/delete-node/ &pil_gpu_mem;
> > +/delete-node/ &q6_cdsp1_dtb_mem;
> > +/delete-node/ &pil_cdsp1_mem;
> > +/delete-node/ &pil_cvp_mem;
> > +/delete-node/ &pil_video_mem;
> > +/delete-node/ &scmi_mem;
> > +/delete-node/ &firmware_reserved_mem;
> > +
> > +/ {
> > +	clocks {
> > +		bi_tcxo_div2: bi-tcxo-div2-clk {
> > +			compatible = "fixed-factor-clock";
> > +			clocks = <&xo_board_clk>;
> > +			clock-mult = <1>;
> > +			clock-div = <2>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		gpll0_board_clk: gpll0-board-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		sleep_clk: sleep-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		xo_board_clk: xo-board-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +&adreno_smmu {
> > +	power-domains = <&scmi15_pd 0>;
> > +};
> > +
> > +&cpufreq_hw {
> > +	clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
> > +	clock-names = "xo", "alternate";
> > +};
> > +
> > +&firmware {
> > +	scm {
> > +		memory-region = <&tz_ffi_mem>;
> > +	};
> > +
> > +	scmi0: scmi-0 {
> > +		compatible = "qcom,scmi-smc";
> > +		arm,smc-id = <0xc6008012>;
> > +		shmem = <&shmem0>;
> > +
> 
> As bootloader updates the irq, we can add a comment here.

Sure, like what we did on Nord.

Shawn
