Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442019;
	b=mWBRquLoCL9sEVlpoN7TRldy3YLDUvIj6FY5d0juKuZ4rfHJ/eqN2/DU683JPJECpLEc
	 bdLbibQw099ZP2yEeKUjCk3Mtar2GifpLbClm0rrRBvEEVlrWAEbbH7MBQP3Ef9GHNztM
	 mWsULZmPCEn2SjR1oGgWgHsnp6llMoS2SRhfbR1pCbEOZomCOtz+PRzlN813HUKwy0t1y
	 ll+GjhnHDdLfVAXMMX2k3+Mzh23diQdwnihjCLEvk+9BJuPTZi+NTfFE0XWuptqVcF+YF
	 Egl7Jw9zXoHMA4uPKy/seg2QtwN00Gs5cMK18u4lib0HCPUebvvw0mcEJ5ryNu9ysIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
	b=rAHb3dKygCJSQWFw+WoEx6fsiuVBz/PyDXk4daF3iJSMsvmG40tPMP0D89mVh4sCeyyL
	 HMo6VW6j7eJgN0Z5bfFEreNMJZJzuR4Pt+EsTkSiRavirfG4nwGozCCfyOW8BFztdkwUd
	 FI+SFdItPWyDvs8+Au6mcj1HL6LqWQAdUoiBTxR5IKuqmfhatGpvH7Cwkxecq1qx+5S2m
	 WvOhdTK+ifSpKjBuztlkRG6/M+R0CKqBUYgpdlh5d/DoXJ618GIWu+e3iHN2LAyxv2KVO
	 o6kYAo34/XrECG3k/iYvIhBxNH7HyfkaMp9Zi2C+0G6MMYyLoTvTlW0BjgKO3maNokQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4A606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF4A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4eAN43762336
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=; b=nND2hnLI1zEmWaL2
	vU3AomLNPXjNN1HorhEpnxVZSJIFfQTsdEw8Ld6+Hri78d95Q7MWpxSsTkAGhJIN
	3jdn/xFqzWggkAJvnHlKZUuFOXQiwS/uCiB2W/uoZCHy0kaKvUv6jS/Ti+z9HRpF
	Ri1S7DxwoOocwKPtD8C7X2A+lCvhIt5LhlpDPhS4g0i/paIdHxugc+tzoG1TBM3a
	hbRYViQwhA1x6J2L4Dt2E/mHgLsVnwUqRhYQ/EzWmeBtfRhWniC7xWtZGCWP1dqm
	zEJDR9EZtonG1p50YgAZpqNMPa1MYRsM067TKa4U/YkwKLlc4V3RYtz2V93rrMIz
	TVWhrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0p9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso3710523eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793442018; x=1794046818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=AG610c05GoT18y5MVWA+416UeTPBEFN3OgMRRLYAB6MFujaGqfdT3NwXouRmkzXVP9
         bix96VeOztuEOA1VJyM9xvD08nZcpcxG5BL1L9MI4QQiTdN8O73ILzyqF+Wkf9GamE21
         xvbD06+yO7w2owpUJ9E85CTgSlxrTgfDfAFmhquaLAP8X3PrZ0AoR13J8wc8oQUxPNIq
         D3zKAy8mvJCu7f2qB3ubh7xro1A5LEaf5a9M5jfJaoG0jQUQTRXPZgHJk0AYw4C0xoDp
         7DG4iO74ctJVj98Ntps3vSKpBynYdINm8Djk5kBw4JMsUZZIv81cklgHnlvYIFBpo5W4
         mWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442018; x=1794046818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=ay6kpkAAlxQt2i0FfYU+8U8ovy6a5rIvt8ZGZ93aPCl68Ih4os+Gw0ASdwL2SqZTAN
         8Ntczyoeh8AYKEBI7V3682E2tatOEDOdJNn7qMR7X1F9LdBnw8hxlgRjDfe6Fv0uuNVi
         TpjiqnuDFxF1Zj7RT+iUVjfuSf440dRsmwSEE/S4rZW0U8orWLEuxGvsn9uuoGsqaj2t
         Q4Y5fj0EICC0YFD0N3PTEGMQIVi3dL6tUAN1JgZ+J3vmnlCpvdxLZiwTjyLFfv5pnGAw
         MZ+A5OSvz5gqttH/J4uBIomllUBPCNHNvQ73WUHmXeTFVPSJ9pY1+gC8GanGwt6n/2DJ
         o5vA==
X-Forwarded-Encrypted: i=1; AKwUvBxDLMzCoi1CXC2JJDCtdcB0+bpKCxLiuT4LRSZhDr1sSiYyGeDmYPgx85bDapcHiOTUbItq74XJRtWx@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1SNOZesHUN3kgN5t2ipdn475N76Y/ywShIhD9BWyB9x/nkEDM
	/+rljJkrw4IL8S1b5B+DnBpryqbdc2kKs8txbn6KWjQ5VM8lk0xK1xW6gTuGeE3TZLP5e1JReoj
	oJTSFQW/87FPP74KT1eSCYxVhouJH2iRRJKtl2gBixYIDbAnQncRR4tkLLQc8Vy4L
X-Gm-Gg: AYBFou0GMO4wEc7Pbguvh8tFEa8EVh/72qISPCdZS0uP2GNGlnH8I21WNNGb3bqXkVk
	pk7idiDiE+aDB5zOJg3bK1FqwFpugxRD4PiJXDN+aV21GmCrzGyue4jYYCIxtPX15Q+0QMAd9T2
	+4Y36oIVIMQzYMQ8QGtEeERf/xlM8ijTsncWEc214q5FW/Jk/kJlt53kwen+eH09hYZcxn7nFKc
	JsI/swxZQCHB5cQpjY0swrSLQB+93d7dTQXEV2fWcnHV9AZ0zW2RhFD+81FWc2K/dreeI1RScQE
	3obZYJFTt72SRCz/3UOK0N/Ijc3sQXNcP0xdUqO6lDtf7od5mAtQRqvC1ycxUv5L/toDgRzLd+X
	Mw8C2idgDjor5IHgQovjg78/EAkci2L0CtX/cNaVaDDmmp7CA7o3u3YQcqmZ90tp15GH7Pg/SU5
	7zakGnw1w=
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345553c88.22.1793442017558;
        Sat, 31 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345519c88.22.1793442016955;
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm16523200c88.16.2026.10.31.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Message-ID: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 15:50:09 +0530
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
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _OIPw9G2R93GYnD4SfuFSreqG3W34sUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfXyK6UkSL9LBOW
 naFLIZw1wf1v9uVnnJcJ1+8+/0tajtNvQ3YL/jb5RPswO9MepT2LKKwycJoKYB0Vzd8PdrxfHoQ
 s9zOEeBhV/1btC+xvlW3zmHTphSoxiR/oerL6+IsWzdq6Of6JrVQ0+K2sJ1gS30bbnFF6SDrxdC
 2xY1YZTlNUI7aN+qwsp3GZmjiviDpZpb/fnl1oqOQoopdaCTZUcwB7+1swOGx4ZGs3sFmONjea4
 6rZxiMq2sNj1+8JupbcYWSJ6h2QI689H1Lc0mpBCGFpNvXXzgFjr5MpHdvHxD6/Jx/PaD7Ol47j
 abUrrtxB5p/aan7Ed7CN+wRpbnNYw4xrakQhJDmiAcVngOzkaDW0ljU+LbWd6Ny0VuWaXxgGdkK
 SAEJiIfc5YfYLx3DBkmJy1pgwX+QuqPiJlGM2aC3ilY6tGfzDb40/I4eGbHgCsnh4RpEm20BAy3
 kY2g5D4POp/ClsaHDTA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5c0e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=16YkeKhe4TlTIPRGKl4Ycg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GcTTplM3uHFL1Q-H_JYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfX2DbwEoC2diuO
 L9KNdETrjHUWu7+9ohpXCsgF2ak3R/5bZz5VEeaFuvQQFtwrf0edV3FKQZfsf+mqdPbt4+b/QIA
 C27NX/rGKsrPuKNtYW/4vKvnH1A5jzE=
X-Proofpoint-ORIG-GUID: _OIPw9G2R93GYnD4SfuFSreqG3W34sUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310041



On 10/21/2026 7:59 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 49635695f832..fcc07226db8b 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&pcie_phy {
> +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
Hi Shawn,

I did a mistake while sharing these changes, pll supply for b, c, d should be
l2e instead of l1e.
-    vdda-pll-b-supply = <&vreg_l1e_0p9>;
-    vdda-pll-c-supply = <&vreg_l1e_0p9>;
-    vdda-pll-d-supply = <&vreg_l1e_0p9>;
+    vdda-pll-b-supply = <&vreg_l2e_0p9>;
+    vdda-pll-c-supply = <&vreg_l2e_0p9>;
+    vdda-pll-d-supply = <&vreg_l2e_0p9>;

Can you update them as this patch is not applied yet.

- Krishna Chaitanya.
> +	vdda-pll-b-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-c-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +&pcie2_port0 {
> +	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie3 {
> +	status = "okay";
> +};
> +
> +&pcie3_port0 {
> +	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  

