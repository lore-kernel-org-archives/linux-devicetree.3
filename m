Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A749E421A05
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603433; cv=none; b=S3lDzZfkN8a2OI5lBJQ7/7nliIQLamCVMgXml7JZBcd7G/HD6w7/R14TSXeVkV8JvG3A8aLIXAnPh7L9k428Mko8nlI7baXtC4qtbuC3HyUw098rLNNDVh+uRUQoEd5ogEypW45MBU66/y/J/M32bCWeu53wPUJgpUR8YMxwKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603433; c=relaxed/simple;
	bh=eoMATAuaff4rpJuBp0jfLJflfpP07L2+HWCSQU/Or9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7dy/6zdRlWNMOOk44VeqfPLNlKaQQuzRsqEk8KRwRjLP6EaGMSGNORR0SKG8ZZ6XI4T4KFK83Rwr5QFihcZbnGapU8gzJRx3RpEYIKUHpLJk8ts/eRhVY7qerJ3ut7ThrYxnI6IYHQH15CoHA5tWSgta4hG5RN0lcRT2ZX1xoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbxBq71T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKOMD2Bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbxBq71T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKOMD2Bm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65MWL2849840
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=; b=CbxBq71TeX+Ekoak
	Lr+ynkoEdj1zcqidsrSn38QeNLWeGOhqyeLtPPjgMaB2R7oPqTHWJYcZLW3g5Zrf
	Bezo7TbiQ7gA9HopG3BD240GOrzcfZuqT7DI3buVjY4QRP2BlezHoorSJZGSwR3q
	luNynNWBCKe/zxxZdDg4E50cctV5BU4udfdG54GgR60x1tI/vy8vTLAhRhpsnDL7
	XyZKFran3CkRogVc2cBZCFg5MEg5EfU1ARnuWUXtYhB9RtlvBaZPRCJ/s3EAeSLn
	LM+xmccP7Nq+UCBdD83Am2bCRq2EKl7LAf6Gm/zYP7nL07hfelo0epnkHJrUrRIy
	+228jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g948g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:50:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-917fd2bafdbso71857185a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603431; x=1782208231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=WKOMD2BmWDmjOJeAwZQC/XfARCm9ugAHfFDp/Zsf6KooblxTg3EXb5cipNZ6G7B3+Q
         k7/eAmwddxf6DiKp7V5bhbLrc6/ZDz10uP6tCPyCT77uI4sGyk/9gH8u1LF8MUMnidX5
         QhIIsuV2fRI5SS+R1YLREQYa2xCiT3Xc7DlVTtYIDBE297ac2WlpNHXgHc+2Ld3XHRjk
         hEaPHXjaJ7/gNXWa5J9lJWD89uuFCGcLiXYb+IIFd8YubX8NfNCioUY8t2QTEryS/WwR
         yAfbqmytgsH45yz+58t7/mTT6zt7t2Qd3xXFjuQCcA0ujae1r2v/Imiqn2Mld0Xx23+F
         v8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603431; x=1782208231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=Jat/7K4YhYSJ/gDE4grl4HcP1ELp7bv0lhk3yZWc0jAse68/JCopEtObJo2p/jgdol
         9znRF8AXevDuQGgG4wgEU/Ea6hxrd5b4orgqV6v8oXZV5U3PYxaNu+v9ReRpEYlVY0Du
         kwQ5qO8/rbEwNHu6dAQ5Q9GT61iIQ+0MQuqBwpruzSoZzD/75qNOgxTn2SyhSHoA2w3p
         WRiI6SdM/UvbHeP7yEDcjmd7rQJWpGqGISSXWQSIiyocONg/p0sHQQ1Ss9Xds6hhskzm
         Jy9l2UE2KXSiF/aR3ercK/t4AlC3b8DEf3P3fs3r6qIqH8kqysXbhgG5MCErqnFfj7NV
         ZbtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AfOn7pBEtGFqlaIrL4wYWBa36N8urMQlfjW/k1iKsjWpdxoQd4zIcRJtywPc5dScMDJjQsDt1bQn9@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJQN3EsVe2ICav4Vj0M1weBKi7LLZ56dDbKQoF6DO0zSTNqxG
	+ho2nKV1zwJ9OnqcMnZauAw+MSGIxCmG05w46tJWJdDQUnX1NziyKdwLF7uWFd2BxzjF/M95n45
	jNraJnV+RGkPlPwT26MblQ7oYAmie7wAqJHP1Ps2PNsDqcDsRlwgEe4MKfG1L1d03
X-Gm-Gg: Acq92OEkCc+v60LS09lYdPTI6FSYzIzxuSCmO1/tEBTk2FfmA1FbIv7ct/82h4jxxPx
	eC6yKcj9F36ik1f1HylsqRVzdrGIcN4kQuzhNrAFSuDyFZRPJVmvCIWxw62/hlTgHStghzZ/Kg5
	WWicghfc97kwbUp/DcIsVuWZwbsy86HpwPCEGc2g5wvMJ9yafgvQUZwZG+ZrDEnfKpjzVeFkAFZ
	gxm56efgnM7pEb6JUnRtZtjHWBITE30LLVfJ9RS/1iQ5TgcV67Yqw3hw0td2EvW2/Did/wqpbMK
	m0AggGnwrIxM6e4bgcVWyy9eo/92ZydcG9/TzO4uRNQPn7Y7LVc8ssPu8egKaXTiwJWw0fOxGTk
	i84n0g2eKm3kh4WdyHAPk0ydWOf7cxVXhu8IhZfdeqcsITg==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786716685a.2.1781603430920;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786714885a.2.1781603430509;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm630904566b.15.2026.06.16.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:50:29 -0700 (PDT)
Message-ID: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:50:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX0Sh+m6WZWyaH
 rVa0i9gHU3NjovXLbX6tWCwz0abtGyIjZft2VYpe6Uok7TKUEtLPh98A4B78lzGasazpEppMFCJ
 hnIERAwgLXOzfTR9w6eM7YOpTv/X2yBIPKIJlXOi1/QFI6naF/GlQ0Swj21JaAithHS9FU2bH1g
 mMutef677EV7a6NR9wm4VhgO6mVJJs64foTdwaQUL0Kmaf1HOTvCuvmVBe7AlT/fTXMT0kJHf4H
 NkMfueCnBW7THQ9bdBrQ3RGpAsHzhscGro0cs1NdG2TDrqTNxtHAavD2qS7eE+UTtLX1GiVveyf
 gABTGZ6KO0BmmjvtN3M2ToH4YBsgKF8eJdDqiw7wKU5Opdql0ZgpxgkPidUNpHEvkXso3YERDQu
 oNW+TjZzH/z/63HX5I48c2qujP+zNm3PmzhbwyISiBGwYCBVNXyojIgpmBe+rCqw+OWMumLXdyI
 s1ZfcrE8nF799Jae7wg==
X-Proofpoint-ORIG-GUID: 0wDHQQw_BlVUl29ij38uRUVwV0ERRmuf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX7w4gk5OyRNc8
 wLjYoAtZEgEjof5v+k+tpXh57BW4rAMwzUxG5TqploQhyYREziYpW2jcbItXjGIR6nw+8hhGzR2
 ZNz2pIc8TIofkoGuyuOI/UV0vtqhf+U=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a311c67 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w1iEB-1klUxI70mDNfQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0wDHQQw_BlVUl29ij38uRUVwV0ERRmuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160099

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Enable the first Gigabit Ethernet controller.  The board layout is
> identical to the CQM EVK.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -7,6 +7,7 @@
>  
>  #include "shikra-cqm-som.dtsi"
>  #include "shikra-evk.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
> @@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&ethernet0 {
> +	status = "okay";

'status' should go last, with a \n before it

> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet0_defaults>;

property-n
property-names

in this order, please

[...]

> +&tlmm {
> +	ethernet0_defaults: ethernet0-defaults-state {

s/defaults/default

Please move this definition to shikra.dtsi

> +		rgmii-rx-pins {
> +			pins = "gpio121", "gpio122", "gpio123",
> +			       "gpio124", "gpio125", "gpio126";
> +			function = "rgmii";
> +			bias-disable;
> +			drive-strength = <16>;

Let's move drive-strength before bias (that's the order used in other
places)

> +		};
> +		rgmii-tx-pins {

Please separate subsequent subnodes with \n

> +			pins = "gpio127", "gpio128", "gpio129",
> +			       "gpio130", "gpio131", "gpio132";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +		rgmii-mdio-pins {
> +			pins = "gpio133", "gpio134";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};

> +	};
> +
> +	emac0_phy_en_hog: emac0-phy-en-hog {
> +		gpio-hog;
> +		gpios = <149 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "emac0-phy-en";
> +	};

This looks like a hack - what does this pin actually do?

Konrad
