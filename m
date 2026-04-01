Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E29407592
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047330; cv=none; b=deB8jTqazXiqJzfrqPGDI1Bt32TlUaxzk6+u6UecVX0xgmAupgKGJNK9uYZNYsI2Ay0PzKWOe4Rs+3tCwFHLZRz0dMzXRnRuOI/Nlhnqey5Mxk6uFlOO0s8hVk4j+i+WKsjK+rns6U0fWy+qh/Oe3BUDtXItXKNwP8AMCRgFUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047330; c=relaxed/simple;
	bh=srxYEWpFQOomq2Hn2s33wqSQN7ZO/LNMd0UuJ0YeX0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il0kZLlkHdRgEn1l07eglPlX5zXlWAcKNRYB8yL8Ka50M0N6QZOhe3rYXRGh1nNPdODt9HVcTILz8JDnLt7jknrF6s4kzanm8KmRhdYPO7PWkoc8OK1QPBEwPwlbNL+tXC/A0RzP1IEWPcQBgUVdbq8JKIgcOXXHwaefD7ykYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+ibQK9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcfJd9OA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+ibQK9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcfJd9OA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C5gas4106751
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=; b=o+ibQK9QI2m8ExpK
	6XZ4iVelITy5tHwqylQyv2Bm9iZk2huZ1Mnfl5c4Xh8Zft1OMfRO+Kh75WIYegz3
	VogdinegegkWMAzyU+2WgdCSde2PMYAr1h5B5WyAXnce4DWsYXbEWxJpKkkhqwB1
	IGpvKMxU0zOQQuboye/8M9Rhjn7o/glxK1EQbsH9tfr3aQE0DhLm9Q+5QCtK+5zH
	wtmRBpPWrwqrnt135gpaSDD+jvue3zXRR9Ekg7ZDD46r+GxeNrSoHGvg2Xmx8GOd
	lccggtGB+KQynygOEEEoCEzDd3hhL2GjLNP4p8UBKeg6pE2zkEAYKm1iaiWY7+IN
	WkMqfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt91ckf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:42:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce1c395ccso2846774b3a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047326; x=1775652126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=;
        b=NcfJd9OA+q5KgrNUQB+aNRnqWubpHq4w3QEvxHSYjaHg+QRCtfeMzt/5uDbf+Ii2ZT
         8dAPFOfviceZTWAeiKUteItFRVCLEf5W+B73o4EK+aaZ2HCl5rnVD0R1cvEqHN5cl9Al
         RMiUPpqhgA8PP/0vcZCgfUgO/Z9Hxh7o6Gr6/iA94x9vPm91Z4vAe1KOZRfyNq7fz2JZ
         NWgpqt6aEa9skEd8XR4nd1139mm9qppXL0QIjzF5tuwCdSCLp22q6frAqm/J34stQNCt
         MaPyTxqBlyKqI7KqtKgQmtqK/mno6CYA9VMIBqSroRIut93VSdZ4BEUGfX7PRh8CWEP5
         /bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047326; x=1775652126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLw4r0OJasPaNxlmt5P5wWJCAn87qbKh4XmyalsNqRg=;
        b=TtaDwZWf2x8CbQBQHw8zkcHPMkK7GrZdnYnsTwX2Yo5OZIiO23d/2WSyrqtMvWa7nR
         LbfoyrdJ0f+4iEyHt5NWYsw5FTCRPHzQ8A+0LgA86uuZhG0o9vGZ/o2iH9/Fblj7Y/bU
         eddZJG1/gNXcOlOYIhDF3hv4lZsmbLpGcOcCWLtoQXLy5jerXDIPBz2zMsln3IFWaVk7
         +zIlejIJ4wjdwydBaz6l0M8Gb9Yvlx5ug2uBIFUI5dsfM4SMbarX3G6nxbMaL3JnVx9u
         Ac09m8b2IRp/n0OW7wqaiDQNzsFGELhezYIFerWq3bjKBEa4ws6bfaa23S9G4rbo4KML
         Q0dw==
X-Forwarded-Encrypted: i=1; AJvYcCXi5RMFvYd4fm9cnI4MGcQhZjRZoNpM8OXRL2RUX+y5SnSFO5+TY/k/mcHabcw8RS40abbn8K03mgYF@vger.kernel.org
X-Gm-Message-State: AOJu0YyCo5wz+DjkkAovDAA8ozTknHsIdaRBQ7jpRxYlx7M3sx5J0ik9
	+5t8Okbte78PHLlV5Xh+qKionhM2xTd7AlXSfkZ2GDUnZ4/jsBfuw8X/bHgfiCan6RUTZjsVXgl
	jQGSWSvdC7qb4pYBw6wEYctcYZ71Gam2i8bDDXeURRzTeRQay8YJQaW7EQvK+HvFg
X-Gm-Gg: ATEYQzy/WncahB+APiX5x9j46TDS2n+TsSdMpYTwZauX0E9yHZRPrHbhA6m7VQerbaf
	qwLUV8Mz8JjTJwCfzn+qZXUKaQCh5e1davzYAT1Uz/AiWpReyWZkH7xdHbd9Az3Rsf+0Rv1ghOv
	Er2Glan03jHAlGlaMswFB93de42ySKIYCGRx6RpjasdqOae1AVQkcvL1gvs24fIibNG9B5Mf2jB
	LY0l2xfIJ3D+Jap49EEo627GXvm9NCnD5L48Kpt671PVtZaUYasiGwU3EwixKJwwvNNtgHJ9gyl
	7hD3/zR210jpVVJfeI+w2dLBfO8B5jZiC6i0xFuXv0Xyuv3EyEHGxLFV5LQRQ1PEY1hIdYDSCEn
	loCbBXYI8ekUVRWmeyZIWelXpd6itQd9u46tgzmPtT9x4cPBr+Zc65w==
X-Received: by 2002:a05:6a00:12c4:b0:82c:e4b9:531c with SMTP id d2e1a72fcca58-82ce88f5976mr3521931b3a.7.1775047325830;
        Wed, 01 Apr 2026 05:42:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c4:b0:82c:e4b9:531c with SMTP id d2e1a72fcca58-82ce88f5976mr3521896b3a.7.1775047325191;
        Wed, 01 Apr 2026 05:42:05 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cde86d73bsm4773450b3a.57.2026.04.01.05.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:42:04 -0700 (PDT)
Message-ID: <849b412b-fd92-d3fd-83bb-f6bbbaed7d12@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:11:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 929OpxXqrN7SkhTiWpFJsZGOOJNz_QFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNyBTYWx0ZWRfX5sH1y42dwGbN
 Syj0XL7JZoGlpDNsdznfp9UgEpk8L7Gmu5ugpyKSC3RekmBj3ZxrtJIRs7+HOeEaufw0TW+xdTZ
 Cy3boiMnFijQ1ua1rVXT6VDGQOi04LpZDsqRfKTqrI0NY7SDIqs7Wqh1ZuSG1yZorO+HXBQNkF4
 SWFRDIVjC0loj3BBElTkHSRwTqLj1dN1d59a2binI3leTv4SJcpc+7OSTgpBCtESYQnd06Pvy2v
 k7dU9/2QAzE1CNARMl4om1/bE3VfqU0s0s/4/pGjGV/IHkrvswHdkEKaDkNnUYfkOmQSBQ2RSSF
 dvhjH6musr2Uxr4kdlswrTBGX0ifLEEetWsuKIUFtH44eNl6fLqgkNBDLUu4KW12ljlYEs/XSro
 mIXyFuB0bzQ+eDHajrkKGgA3WCkK3QjhJvH0zZcL+iQo5ElihOKBAK4Gtq0qMzL4phfhkH9lMB+
 Y1f/pYAc7tSymdZTjOQ==
X-Proofpoint-ORIG-GUID: 929OpxXqrN7SkhTiWpFJsZGOOJNz_QFG
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd129e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-AVdbO5R1FNXJZyXHBMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010117



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 70e37fa91f5db83e66f9706b62637f6e18dffa89..c2f4457b83e193cff20120c50b53bf4c67e57239 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -21,6 +21,7 @@
>  /delete-node/ &cpu_pd11;
>  /delete-node/ &gpu_opp_table;
>  /delete-node/ &gpu_speed_bin;
> +/delete-node/ &iris_opp_table;
>  /delete-node/ &pcie3_phy;
>  /delete-node/ &thermal_aoss3;
>  /delete-node/ &thermal_cpu2_0_btm;
> @@ -167,6 +168,55 @@ &gpucc {
>  	compatible = "qcom,x1p42100-gpucc";
>  };
>  
> +&iris {
> +	compatible = "qcom,x1p42100-iris";
> +
> +	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
> +	clock-names = "iface",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec0_bse";
> +
> +	operating-points-v2 = <&iris_opp_table_x1p42100>;
> +
> +	iris_opp_table_x1p42100: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-210000000 {
> +			opp-hz = /bits/ 64 <210000000 105000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000 150000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-335000000 {
> +			opp-hz = /bits/ 64 <335000000 167500000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-424000000 {
> +			opp-hz = /bits/ 64 <424000000 212000000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000 250000000>;
> +			required-opps = <&rpmhpd_opp_svs>,
> +					<&rpmhpd_opp_turbo>;
> +		};
> +	};
> +};
> +
>  /* PCIe3 has half the lanes compared to X1E80100 */
>  &pcie3 {
>  	num-lanes = <4>;
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
