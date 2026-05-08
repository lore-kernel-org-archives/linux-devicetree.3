Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2A379EFE
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234154; cv=none; b=ods/CjGK4Wqj+BzyUtt/J1hzPiDxAno7cdJjEIgZOOHCMc73DP8NF3+N4OeVy1in2oCu21qgInnV4bfbbttpZa2N1ZSVteSUMcHoZYd9h5j+pxV+8cX7pQyLyty9qx46VC+ABC2l0iedgS+JXxoXjCXrP2M9JpnpvGrGiKpElD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234154; c=relaxed/simple;
	bh=k4zoYpeu5k04Aos9q1kyFrP4uKk4iPakPDCZyzvnG9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGsBjO2Y6Obe8vkTk15PBf1RMJnTZXFB2vpOu7G9VhezHxD8YaqTB4w1ewkkvRohIyPEwagLV6X9cZz7UH8icF4Yw5pXVyWLQZdOuWSz67k4XWpgZ68Fn8DDPTGnuiDS3zZlBXfpBTVt0ZEvkCbKCn22fRgKWvrGnHTPoCqVALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzZKL9T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boAi4K8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzZKL9T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boAi4K8H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64872ULp1062036
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=; b=EzZKL9T9oAoC1GbX
	xH29Tm/N74twH39FnJlygMEQw/zpULDWWv6Hlrl9k84kxWoEr1KxTf5fwwS0Cgam
	qDgLh0A6iJoOtHcNnU6QXu12t3kJ/I8IuSRbt/kXFzSRjj/EHMXqhDY1JUP92RA9
	oedLgFiF+UeQOVS3DxcEtET+pHH6RvpsZDicLtl61q8P1krVIadJmAF8UvVYtAKi
	j1JB/NbqNhgo/T0Ag++N05v9Fb6ODSkLq+NjtIcHwSXqjznj95FKlWfnJQPN0VzN
	MX8F52aduNw/YEMSCIAZAY10XGGUW2tI7AZ+uB6Prnzik/pNevFq9fptcwEDR8+3
	c/m9JQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fgnfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:55:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e62562b6aso4496091cf.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234150; x=1778838950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=;
        b=boAi4K8HeIi/7tR10PIKKwIIdkaR6uvYOmu5QKXCq2Ig4lN0w4NWI+WG34ATo+xy7C
         0BJd+S1ushY8dAzgCJbGZ86M72MYGOaglxvukWWjDFx1jiBuC4pbN7eyilZRe5kGD3Dh
         9XyIcVJYPfFzH74r50uAYTynnjloNDFvtajkVNhPlVQeMsYpezz56BgqCVyVOd+5XRYF
         WlEdb7VuUc21rQxPjO7ZCUFYUYWmuCoHSXyCAY4KJGKtfkDFSfzIg3u0j1VBiduPK242
         4j0HPZIgKZMcFN2dZzt8niAJafR6qgw8hWBnO1MzunYIasbSb5I4POfh9hbxiedJ+l6p
         QC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234150; x=1778838950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xatkqkYgItUYJN4TGTyoaYlG8VMTkVHfKPbi4R2Nwpw=;
        b=Fa3R/0j+ZlrK+vJIFZ9YBbg9FQUSpwgrKrx71y0eDLUpRmLJZRFc1QA1lbcXenKZhs
         Lt2gCB4MbqEjH6s5i57jLKDcLsNOquM0ftqDRdqLp2QNM5HU1A2hEvxKbwUh7o8SRLLe
         2pn1UaCa+/Hu3EaRWFGkXhiTGRZCPSVILpJLY2EusKdhXOqeVn58985eczOndNsjfxio
         tlZ0EV2qBl2Yg4sYvuIbMlKTX2NDMj7eamx6PF9mReRPRKqJuQH48qKfU28t7kb0EmOT
         3SlidAHJ8b1uNbHwVSWVmO77gJR6Y+TxMohYxrf/a+v/vE7tzd5FFpiYxOtozYKaEGv5
         NUhQ==
X-Gm-Message-State: AOJu0Yy3tfjJKcOTRHsdmZkzN8+MOgZTn2/NxhqmBmxXW4PX7X28nGS5
	pCpXTpKcfPdL+HRJ03s/XPAq1JYJ8fk9Byh4H/1MQFXXmgqAr1mk1n/jzDraw0IM2m9h5cYRY7O
	tRjRDZzbizxlkNGCpvVDLgjt5llzz9rpMsZogufvO6FBYwbFyIXGaWACAbsCeB6rq
X-Gm-Gg: AeBDieuAAMkqJP9IxdxbrgWRC94MADeqAcEkorXMuUgARGef4IBZ8LtNRrx4m55uoul
	7mDzAJtqk+6TcMmW0+Abs3g5GdYCIDkA5e2AIRT1OWskX4x5VUvfOFvh3Hucwju0O2iJIqMJw0f
	9IKiDzu5RyHczKYnp3TtiRccGW2YgYpszmpb8YUwlDe1o9wvKvsZxttsFPlQ2XayzbAYO64Xlda
	j+ADjs510vY/xI+Yk361hK42hJwIEPFcnCWdiGG2Jylaf1ZKESMNjWM2yC/QzzoMvYGGu8XN8iC
	wzhbr3BSaafBVEIJlPi3pMY3uiF/7uQ72hgu+Tc4QsUW34Rkogm8/NtFse6lz2QFsIshBUkTwq+
	zJFfFFXpWyhFMJq62cYh9U6M1CBMpdc5u9EnjYgOeaoiSgzlrbF2cUrTxsY4x6Gtw9HGaIFwZTO
	ZeIRQ=
X-Received: by 2002:a05:622a:4894:b0:50d:9138:3322 with SMTP id d75a77b69052e-514621d3ea2mr112862531cf.7.1778234149581;
        Fri, 08 May 2026 02:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4894:b0:50d:9138:3322 with SMTP id d75a77b69052e-514621d3ea2mr112862321cf.7.1778234149185;
        Fri, 08 May 2026 02:55:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d132sm477266a12.20.2026.05.08.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:55:48 -0700 (PDT)
Message-ID: <7cb8c0c7-c697-4d4b-8769-684e80f41df0@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:55:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
To: Adam Szyma <adamszyma@wp.pl>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_bjorande@quicinc.com,
        val@packett.cool
References: <9666c1f5-722f-4c90-8412-19257a4afae5@packett.cool>
 <20260508050828.7442-1-adamszyma@wp.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508050828.7442-1-adamszyma@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3DDeodlWq93Px-8cRlN2X-p0nTffEqrH
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fdb326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tJMTg3xK4LZRUi73EXAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3DDeodlWq93Px-8cRlN2X-p0nTffEqrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX6OjrjKQxULWo
 0THrvciI0F9PagyMmwG6CbJfv0K4S3ftLJOdBzlEAiifxctE1b+fup23H02GZdiL99msuS35giA
 J5ksV6KBSwJlaWCn2Mplnh1w4NS+eUjbVFMd3bosIsttH1f6aDc1ABHC1xHkTsZ22g9VXxAFc8D
 5YPhKMlaTDR9yLHdaBpvvD4fe4OJN78Nx0eDv/J0R2VvNCibngnlTaEovLR89g1o7/tpFsc/oWP
 Wuwyh92zwjeqDDhoKJXuqPzADmw8iTeooTsuNJJBlBa2TvIy+TlO5HDFSA5mVBIoK9o9ssDAtT1
 77hH6sVovPgfyZ3jL/uhC2MW/mz2hxB2dGPthF+yZ+rmQ0csCAoyOZWA6whFdQ+ijoVW61V4mxV
 4IfkFXvIoO/zFdaSa6gcQlKkp/kwKEFTxC8D/5XQTe+OrUsI48wGciMCDswlYC7F4FJnW83BHOW
 dBxKLNl4/VIyjfWnR/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101

On 5/8/26 7:08 AM, Adam Szyma wrote:
> Add device tree for the Dell Inspiron 14 Plus 5441 laptop which uses
> the Qualcomm Snapdragon X Plus X1P64100 SoC. The device shares the
> same platform (Thena) as the Dell Inspiron 14 Plus 7441 and Dell
> Latitude 7455, and reuses the x1-dell-thena.dtsi include.
> 
> The 5441 has 2 speakers only (no front tweeters), so the tweeter
> nodes from x1-dell-thena.dtsi are deleted. There is no touchscreen.
> 
> Signed-off-by: Adam Szyma <adamszyma@wp.pl>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  2 +
>  .../x1p64100-dell-inspiron-14-plus-5441.dts   | 44 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4ba8e7306..81e058a22 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -449,3 +449,5 @@ x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
>  x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
> +x1p64100-dell-inspiron-14-plus-5441-el2-dtbs	:= x1p64100-dell-inspiron-14-plus-5441.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-dell-inspiron-14-plus-5441.dtb x1p64100-dell-inspiron-14-plus-5441-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> new file mode 100644
> index 000000000..b9e9ee417
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Adam Szyma <adamszyma@wp.pl>
> + */
> +
> +/dts-v1/;
> +#include "hamoa.dtsi"
> +#include "x1-dell-thena.dtsi"
> +
> +/ {
> +	model = "Dell Inspiron 14 Plus 5441";
> +	compatible = "dell,inspiron-14-plus-5441",
> +		     "qcom,x1p64100", "qcom,x1e80100";
> +};
> +
> +&sound {
> +	model = "X1E80100-Dell-Inspiron-14p-5441";
> +	/delete-node/ speaker@0,1;

I'm a little surprised this compiles.. but this doesn't do what you'd like
it to - it would, if the speaker@0,1 node was a child of the node bearing
the 'sound' label.

Also, I'm going to assume that the 2spk configuration follows other
machines, where only a single soundwire host is used (i.e. "left tweeter"
is actually "right speaker"), rather than the two soundwire hosts normally
used to house 2 speakers each only being utilized to drive one per side

To remove the inexistent ones, add:

/delete-node/ &right_woofer;
/delete-node/ &right_tweeter;

And re-label the existing ones:

left_spkr: &left_woofer {};
right_spkr: &left_tweeter {};

(customarily between the includes and the root node ("/ {"))

And then because these labels cease to exist, you'll need to make
adjustments to anything that references them, which I think will be
best to do as:

&wsa_playback_codec {
	sound-dai = <&left_spkr>, <&right_spkr>,
		    <&swr0 0>, <&lpass_wsamacro 0>;
};

And at last, to disable the now-unused swr3 host:

&swr3 {
	status = "disabled";
};
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcdxkmsuc8380.mbn";
> +};
> +
> +&iris {
> +	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcvss8380.mbn";
> +	status = "okay";

Please also keep a uniform \n before 'status'

Konrad
