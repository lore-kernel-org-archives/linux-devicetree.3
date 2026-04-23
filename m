Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB43E92AB
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944202; cv=none; b=e8ow/H7oLb+VOnHmMT9hyv9qDVUGjar2u7Zgn2VjGETb/rIAvWwL2n5q3SiEwNRNZrgyjO7FoWY1QKE+k3F+qussrNJ5UBPzt0pIWlVpurXo9p+Aw+VP4m3Nj9UrHnGvukr6tHHtEcXi0/mf83AeqcImUyOXv2JaxkeVxezpxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944202; c=relaxed/simple;
	bh=ycCYcFDws687lzPHf4a7ZDQa8w8dkehTffSeJoBHKeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqL32PrDNcA9UnOwZ3MWHhx06uYDymlYURd448OhZ2Zx5Uw49NT1i61Js8eo1Dh3bJL2wnFmiEfNzWbuKyLr1pfzA00K8U0xEAOg24tUdeipZUubbbpJoksA7ztSy3BzUSU2dW6GIAK0ppGCwOJNKtZsVgJjSWbjwDPPE2hjoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgZfOxAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo5nJ0HJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgZfOxAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo5nJ0HJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uAYI3294959
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=; b=ZgZfOxAjPxVx5KBz
	M4gXrD1z8OdjWaxuRMaot0/RjOdVU1RYD/dM1HTr//hRHN+xF3/na5P2y6mrg90e
	YwgldGzrmoeJgyfeEEzINXBV/Z20joUkbIBPMq66Y2vw30egfAKkzKnBTumdOjdy
	vd8ecnk/zxAHGM4aL9YtFLmwLQlY0KcEvqiw4rLF38LnKidn1MdjsJAu7pXTo+mG
	KPQ/c1VPaiGvpw7IlBi0ejPtjBKDVOqawKr28ODDmB2pJwXA+sn0DJUF3kDm0R15
	nwEob8lA+70+zFhOFMqpo9Z2JmrBx/FsE9wYYOGIg2mD1y/0HESSSRc7U3tELC/u
	zNkHPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282uha8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:36:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso126329685a.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944199; x=1777548999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=Eo5nJ0HJBKnHrOR/uinb0nAGPzCLDRy8cyNOZIMJ4p3Dsi0dzy/sYNTHcV1Jqv8SxV
         3tapUhWzAfz5XkI2F/G8A4XWjeA7hE6J4lb6qdlsFUWX1MCd8evMQXp2mHX48tDoBWbJ
         60bpVud79Sy4m+2odkpSl3xnwaR6Fgm5y1iF6+cg7I42MOei9eT5VN1FUtU/o1I2Fe67
         /+OXS6z90Mp7ZzDFQ03kncYs2oau4j5OI9FWf66/WsOHRtx8+jskLNUxTfLqiqy1BFGG
         Bk0VzVm3GHyvbmfCMECyHG3UTRZWiBOUM0YvCHLtCFT5hEcLk+iu64gehT6WsYgrb5vN
         73pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944199; x=1777548999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4IVUQBFdsEG3fN5g34uqrFUD35jsuqyNZ/138Z4VVw=;
        b=ElIbnFSz/GRcxg0rLxmSECpl+hAJT2hTxAk3AzAtE2iB7soC8CpJxKb/Cw4N0UFqTS
         kk9ZB40AJP6bAMH5I4qdi254o63CAA+Rkif+fSQy0TwOdwSQhIVO6GxccQqgPY1JvO7V
         13/xMEGmskrwCtBLmVTiSnHrVOZ/2ypzz7RZOjhT2wgIoT1IJBy66fslvkZPJ7/bt1kt
         EeCbVplQYcq1pD8uWRm4cK4GssCTC1qcwQ4OXTZ5/qN4+bhGcMUIyD5urzSmo5kgdt1x
         Ew96rU3ehSd7UxYkr1+qqadJeuDoxB3Qw7+bYFF6H2P9jaSDqcs2+y3u3KvwUErgLzvR
         Ws/g==
X-Forwarded-Encrypted: i=1; AFNElJ9X8+KEDNWK2gmMhRoFDe04N0KsxmtfMGY8OPkkBlq8My4AuaJlq304P3WrF4gAxEMD1rNB1gnQagUq@vger.kernel.org
X-Gm-Message-State: AOJu0YylGer0eDze4yRJZMTk0wS2ZRv18m6mjzAJE6F9lKfSXsovXBc1
	H724PS90VCK2l1gPHz5KHbj8rHTH+hHzZN7AAItwX3q1rxAE6O16d7sqnh9+g/b4/iycS+jMs53
	QGBaPC+f8FRMK3L2DGg0mB6uUvnGp3yftyrj2NloRsZW8ePboz351q2AFndPRhcgK
X-Gm-Gg: AeBDietpHM3JH8zB/Ea+Q7KK/WpOMzjUUTs962yLZTUZArQaC19QjNIjkeVimgBB5R3
	/Oaub1TWrHkCjVWHyKn9hX5euZQhW9ij8BgyCI8uLbuGp2JJKK7tTWTmk3tnPEm9d03HRXwM58j
	fbLPxN9os+Qzt8uO2N1gRJR8VP00yDs/wfely4xfdVlQmyQa50jkaxO7qLRsS/+c/dsg6fe11C1
	anIR/uFhmjUx/MFYOjFtO2w8EptDMEvCVD+LoaYKKoPLX7T7M1ycGiiwnsOx/AHwLRvy/jhqJQZ
	CowRrF7zZtdM5NM02xRKHyHC8yww+MiqzpVJqbTiXHqmSjSDkuYTvoWWNCESNF9YieIWJmTOfV2
	83Yw0uHoXdxzxrpZTwgUu2z+bK64H5DNJys9lxs22eFiLCX5XYhlO3K/q716dS2CObSn8DP4NHg
	SxH4rKXFDbtP4crQ==
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100777341cf.2.1776944198951;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr100776841cf.2.1776944198503;
        Thu, 23 Apr 2026 04:36:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533bdfsm648444466b.57.2026.04.23.04.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:36:37 -0700 (PDT)
Message-ID: <ce26e0f7-a07f-4e17-a790-fd4f230c7e90@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:36:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNSBTYWx0ZWRfX5iamYCMXluoJ
 twj/6zM68ieB1QRfmv2BvPX7JcULynSadQIC/7kjJl56wC5fD9Tlx0cDYlZ9frEkic9eYXflz8h
 PBoKA+X0wrVJQyiFfklQAYu/OU10nk4qzDERfTc+rXLRzNnlOHb4es7lwnDCFKl426D7QKeIBfN
 N91/VenBv74Vuq4QC/9FC9lU2eQsY5ItlT3/tvt/WSYWWJDsq2ckMEj01/wGJZMkds3+gtjFHpq
 G0bD9sKwhwlhjcmLtCIHHu+XwuZfeP6qc9EoLa56wD/lvusF53//XoiJJoQl261rwZNIW3D1klz
 6eVuJgi3gN4qGDX2rkh4MdXWEHcgs0bPu64LpvnOvlYx15odVgSnZOmxUr31WfwepT6l5K/pzaF
 l+t8QC0qHNuhRzOFDbXbaS++Y7yebHW9FRBqTzRGmDf5XfRVHxp/9kM9AcmJtF8f8WOcb0rBb8B
 vPyFgzUWCsl0BFMmvZw==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69ea0447 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7luhnmdphBsOXQ2kz_0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HpggUCabdOhrqLPaibCMlrqSXaE07R3J
X-Proofpoint-ORIG-GUID: HpggUCabdOhrqLPaibCMlrqSXaE07R3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230115

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

[...]

> +	i2c-muic {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios = <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;

Is this not GSBI2?

[...]

> +	i2c-led {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Likewise, GSBI3

[...]

> +&riva {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;

pinctrl-n
pinctrl-names

in this order please, file-wide

[...]

> +&usb1 {
> +	dr_mode = "otg";
> +	extcon = <&muic>, <&usb_id>;
> +	status = "okay";

Nit: please keep a \n before status

looks fairly good otherwise

Konrad
