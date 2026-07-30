Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADDE39792A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427284; cv=none; b=eht4vNb3iTo8VrwNsMxbYUz6KsqjLx0UYWpupNc7AlvGxbm46buulQUAoYLaao9Swb8dK59nz/Tzbo6nkeprFxY6rg0yyAHyAulDuVY+83NNg5nvP3qELDHCV4P5ARaLMuBAhwwbzCIOiWMwOekRiyMGBsFDPMhyc7wXveR/EuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427284; c=relaxed/simple;
	bh=giKwvRI8qxVC7rCJ6Z/KGynqwYL6qShpon0w/eDXYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJrHwt8ChwmavvelcfYhRzl6XouwXlA/B5HcM8QDQLTtAp0Q3silkHWGIg+viv2YovWVSXucc++qp4Higue3xE3by3ZCdYrCHFk2DGC+SpduMq5hnOF1aIxQ6d+MPuqSE2lSLZcCP3m6a+8jul8z2EVDbMMQXwETaty3ZkjWNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYjTGfFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeY0+yAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYjTGfFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeY0+yAc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQre61145262
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M9+P1xkDs6ffjkHeEwyvoyg1
	dXyOKoXHj7QXs/dq5IY=; b=MYjTGfFnI56GXXWfdYn6ACvVBgRmBx8Wxef2qfK5
	V6v/JU+wapIWKFUQeBDbRk5WdgGLrUgQ57fL+hkOgqc2xBJjtNQGXDYSEzHgdcCc
	+a71hQqIjvEArClFD4QzqQVUH87+j4Au/yVHcKNFLw7NmrZoZmFFixWEBXj8ZwHN
	BBCFaLwqj4jRuX5Qj7NjuQjurrX/k/+P1Ds2OcWf9W3iTNHLgJ1meCWCbriH0vWY
	AyWz06bIb0evP2YY4lQSdvlcVsClcn9I+F86kyQ675PtUOMrpSwOhj5AJQcYGK4m
	+gS7YhVXeJnAvOty/mnqn7Kg4y0j6yIxaLO2iTlY0HkONg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k60f9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:01:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9772e18c186so2018071241.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427281; x=1786032081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=QeY0+yAcyic61eBa8So3QdiqQwKF+iCkSc9x1GgDnJS5Er61Fka+BK2BYk/ifTfoXY
         jZLMARuqSnclsvvNzXlugGKIfSxtN6LCeYYP0XFltbo4Q2AAm1UijaxZfM2aQFOwS9iC
         4bg7CIOUK9BNhYUtrYCXVzpaxTV7ftb0MT4z28O9hS5jRA6K+N68i4xm0joAJZ38uZ7L
         GPJTTmMcKkbUYL3EN4opI+4TVKpG9M60hbYN31UkGioXukP7dp2I4GPmvGx3Iywr04Da
         wPbfVcgtWPURCjHkLLpGs64B8FuGf1HFnUoZIyrgwiutN3QqWSSOn5n3QR6wsYHSSyqw
         UdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427281; x=1786032081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=iJRL9zEcLReH0IP4S4IeQHFkp0RtcBg2BEV7lkDxQhi0xUUkOWkt7opCqpJW1c81iG
         p1HwYV/+JKMRhRptWFx2v6ygu76nsjUdLTSicpeY8dJ5aUxlN22Rvr1aAMxYXPgw78vB
         i29CkP9xH2PytQJaTHEKDqNq9ub3ib0iJwnq34xyiDmTqPwzxCicgfy8aNCtY9wED6PJ
         F4G3r0CGK5nJPmlVhpxiaG8sooVhphIY+05XAcxxYbhBVKzHB4MuqCpVRX8nkl3NcvHd
         ESwKIhLplOVjlGDuxSTGJXdDsWvHO7rFGmyg62b/n3Vi33/ut3DEmqTHt52s/VXs8Q5L
         iy/w==
X-Forwarded-Encrypted: i=1; AHgh+RqguAUM6ZADOpXxfIJWQo2bviu56uRtLWKHQ3MWX7nIc69cak2PiJUhVqlK6nQHoKXx+kCWD6PuZbji@vger.kernel.org
X-Gm-Message-State: AOJu0YySrzRuJjiMMnbcSwA/SvrUFKmTgIsnVr+ERkxcWbLzXeetJdKt
	awePBC5Ha4I8UtxnUSgiz7DLcJfrbvJbMWcbdos6YJFqamBAnqZ4duyJVwsKoritAcJTjEDN0qX
	OwjYdy07/0dYuXQgFhtMwecdGneuONL27DHFre5fdoXbfgd8gK31L1616mt/c8sGt
X-Gm-Gg: AR+sD13Y8iZda3I3xkH1CMu2rlIoZmb1fTjXEp2NIrAejqRvnOgUUseOsn9vid5HeCu
	Bl66tJei9JTcGVlCQm+ZiVqXyqOBe8z9uaj52V8XGG7dHXG76yKZ7f1HXEK8gQWiOzkGCW/ByiQ
	cErO2yzAU4fVASAQK7oBKlxeIoIbVKmZwTcg895RSlsfNMZaaFpDtal1FZQQLF1UxiXoRQr0+I6
	w4+mb7W6eeLW/cRzAKuYsUvd6KU7zIxj7YbW1NZODC3RP2TZaJ0wSnexbX5tsMvF7Tz5k9aU/eq
	6FTnOlcRfFh9s8CXElu6LiZcfkEoGnCj4YTiQbWWMayqJBoVI9Hxw+ACiSkEJ3ISWL2AiARPI+I
	WnmLWtTT993+0qbnRhsSDSuzFUDxyza7qp1Y4jGLHSJrIZMk37HvOAStvnnf0VbF+Y21v1wWmA9
	yNNo5w45+MvJ8hVw==
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1247114137.1.1785427279230;
        Thu, 30 Jul 2026 09:01:19 -0700 (PDT)
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1246612137.1.1785427275568;
        Thu, 30 Jul 2026 09:01:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm450733e87.45.2026.07.30.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:13 -0700 (PDT)
Date: Thu, 30 Jul 2026 19:01:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: CeewRsxVAHYJ7QEECHiRYYk1VSDI5uJA
X-Proofpoint-ORIG-GUID: CeewRsxVAHYJ7QEECHiRYYk1VSDI5uJA
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b7552 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9uBV4kYI648O5uXVwFYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXybbXBkn2njnd
 gaFocVl5JQm649ao7W0pbxlk75UqXvTT0xQChhxIHJChP4OCegIsBpkAdfzVmhAIU7sCgTp7ObS
 pXHcSLL5RQINyHrVS2E8ZRb2RxRcqLZ4Kfh8TasQYyiImMqpOLGUlEes2EdHk1bVnDZSfLjPeDc
 GwOd05P+2KFjctc3HtuxIZQ1PLokkAI59BhMc8hOQC0nke3IMtu+rUFjVuCm2AWD9YpzXU5+yzJ
 6iK329irWXYKiFrTshH0KukmoM0gGlYDUsGYJyKfCvGjcv6tZA8a92Q7JvlLOinkxguTgmFop9d
 EildqkYKUP+sCHi+/WdGs7W+7gYUyzs8KKIt/D/l00GePWtat2VPCDECtNqAxwralApJk18Wy8k
 YiLZpmQwu67kuSN9HdkCcXjqBPaCWSJhV4VX4bnIBL15gauOCPfbnKdxq6IVwJTsw5Poh30bgOJ
 U/OoaFbNhYUVHbwMn0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2DQ6WMLRPVv/
 OKkWm5qubS1avwGsoMMmaDpnmSMoeZHAUuq5XhYEthBAhEsYQ1meiT1DmzJCVF/+jgrjJtvVdEw
 2pohXPNQz0BD/dvO8yUeXNLt8ecOydU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f11da2ca4181..d42b29419320 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";
> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,

Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
please drop separate mmcx vote here and let it come through the
titan_top (it might require camcc driver and node modifications).

> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "titan_top", "mmcx", "mx";
> +
> +			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cnoc_axi",
> +				      "jpeg";
> +
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "sf-mnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;

This looks a bit strange. Are you sure that PLL levels match the MMCX /
internal clock levels? I think you need to vote on both domains.

> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <200000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <400000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <600000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
