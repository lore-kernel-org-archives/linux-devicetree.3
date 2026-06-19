Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73838324B1F
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781843947; cv=none; b=FE80WGnqKczElkILx5pW3YVdF/9x6xxeXh2mdrIOpC+HpEUjyh4IYWqmpE1plucn9MBKbgBZa3TvMIAhLAO3G3UnSgEVq62y+X64UzXVNuBGTmH7snJgD5WG/hS9LRCKq0chm+kjelghpTRW245IMnQuNZeRaJHy5sMQQSRAI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781843947; c=relaxed/simple;
	bh=FQjO08iq/26/OGazDkp6badkB3rcrmNk4JhCePXGmRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVapuld6+vbJTxwzMGDluUCgtroISnjq/10JGqxG3EK6HskW10uTocBtbN2IPZiVCNei1B2WyqW8pjC+ztb4cWGkj9bXBNa1aPzYDEVLVrzT7wWIqrnhU8JUdBZHc8hT4Nz7XBtheNYWLx59eJcfdvDc/FnVYhjPusWT9mia/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxmNR9z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvObQaHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxmNR9z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvObQaHU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J4d5Vf3914168
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=; b=fxmNR9z0mByo5H2V
	/VkhhTD77jUpEaw7ZARwK2JebsCELlQJN/63ePk8mWXnJBF4Eb7FEg9d9LE6tzUF
	1/kvzxgesMSpIbmsqdFgEBWdOXNLpdR+6G20SxYo5seZ4VYfPL5fCHPNmAzi79Qq
	4CQLQI7YghB6fyzLM1NJN7uYsUw0dxO7mTdo2OCtXVOUnivM6nuzIXfJ1qxNdWx4
	oS/9ZcdhNwPRzqA/iDDZuKIwRrr5GxeX03Qw5perBwnW/c5f7P29WZYs4UHHSMys
	sdNoyWkCtKYhlSEh1HteGCFXmYR/6pGaW29Rl6A+RVaI/FcSp7MsZBdFiIi9rCII
	B9AGBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22akbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:39:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8895156101so1287708a12.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781843944; x=1782448744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=;
        b=WvObQaHUJ8Q7VwETzaLOCw7ERttRrxU6yvpdMS/WKZoZg9ssGjRjCOfrjp6M4svI4O
         5yyIvfOpDndzjTcUcSiSy4LMZusLtUebwIjTIlzZm/rdxP7Q9i3Uc+WU3+iIp9n0qZgB
         qLeWXsYiRoJKidaYb9hOUK3QTO50jKCqR/c5u2ANCQu0eSybVmCHgLf5VKVe0V+0n7zc
         DWrJwE0iUa+rdMGdfL1bCBOPR7Uu2J5k6nWtawmAbYWRO4t22mxuc97ePawbr2yfVYki
         tROPfn0aZUtTZU97imsROIMd2IW55MrVaRQ6YwbPZcqrx5YLqg1C0I0L2GjoJh3SDTOv
         vOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781843944; x=1782448744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=;
        b=n8rXg3nwng0P9fqrNhHjMPATICmHDPlxXqBY9dudtncxEXoo5nDHy1iEAo0DiWkEgS
         isTu7GD9Be8gFlv5vyDlvlUSdzmFVr8zgIlXHbaFZyetEmjztwO0dlkPO/y/CYZ4/fOI
         rNLD4hg2iFoPsJmWNY6yvV4xJXxvZDOmQi9OAHsqn7V4fTCg90FRcmJyonXlCkihTKGU
         KichlEkvlQ7m73Yu2pNf0ztEmZCSb4ADWxBqt8LTZPCjlJUQg2NjaY9U5+aTp2LvSndh
         EAkymmfO6dtt3+SSoI4wj9t5VNX+qLQqA9d+R1z3vr7mKDmBmWWChP7Edc7eZ5ZsoTRW
         ceLg==
X-Forwarded-Encrypted: i=1; AFNElJ8hlKgMq4S/wnv6asIHK04YIhptAPd/M3qn+EvyeL2tklHt6JVmYIx4YrC2S9nP52NlQ0+JE9fzMJyd@vger.kernel.org
X-Gm-Message-State: AOJu0YzvE+0nEAj2csE3YinnTST24sZvzSHBZSvIrJTuGUs0g9X2c3T1
	fQHT/mHPjgU0sUPcg2tiZtBhLorhIaxYSwFeRuOkP45Z6kw5ZoGnxXF9hwXLEAwzBamFcjKwYs6
	tFpoQg9DYWcHttVJLqMR5rB2Kx9vvaoLwGMY/zfh60kTbeqPldrzDIAhXKhSQ1vS9xnA+f5dK
X-Gm-Gg: AfdE7ck1dRCmEthH36xpsEWkwD1jlZkLFQra2igllgUrKaVFxNhpzrUyQKApdXDdnL4
	EHSQnZLeIRfLAoCEahnchMu7qcELyYRCukLlmjF8QhYh4PbC/yUhm02/YROq+uMfKDqlhoWAd6r
	hIUZOAsoM0mOiwpJgdq9YmMnuZrI/Ynpy5JRYFgZ3XOjs58V/p9lfVPUGmD4V9cxguWSYSvVyUJ
	yXZ59M3yUuV4CMdqTVfhlJoamO3A2vpfkAkv6vg4QWEpwg3YtfhIQGVC0A5L+b/qZ0vc/GKiUoY
	K/CnxmhiKKKfWLW4dG7UBLRqQ1+K6Ppq8Eoxajb0dmPD60z/a5m2WGwx7DqWB6QXCk3/Tu/DwPF
	EMmc/ksO/Xa46X9gxhyw9Cjfvgwgf9G09snUR8uKPVD2y
X-Received: by 2002:a05:6a00:2e96:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-845508862damr1981926b3a.29.1781843944447;
        Thu, 18 Jun 2026 21:39:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e96:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-845508862damr1981878b3a.29.1781843944001;
        Thu, 18 Jun 2026 21:39:04 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553829240sm864324b3a.44.2026.06.18.21.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 21:39:03 -0700 (PDT)
Message-ID: <c64e8a82-3659-304b-2e9a-fa039d0afc54@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:08:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: shikra: Add Iris video codec
 node
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a34c7e9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ofncl5GZK_eaPPRo4moA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Z1MnU5iq8OWqOZSBUd9K26Iz7SOkCQ6K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAzOSBTYWx0ZWRfX/GQS76x1NN4y
 oWBcSdzG2mEAJ7PVtAMBvFa7XM82vii9RXwP3Tb8aC2d49puQMObuy2D8RC3x5zUrILU8gB9Grg
 jR4Hgq6CJp+YyDtlHE1nzGZsqyrerEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAzOSBTYWx0ZWRfXwYYUyVVqWjz3
 BFPmIUl3MvnyaMlyOZqw0FUt6xvBX+IltEDv57ESQpagxBKhEQEClqZFYXCdbfMf4epGslVX+gV
 fY+7YXt0AxzEB5EbNiBSXc3TWhU7OZLLjaHtb6l/HoSuRGSql+c+sdUPCuh5yeFOky4cdlv+ahT
 Nrw7EnsBnrUr+k+ZtNEh70KkQOHCGnXoo2ObM9/zwqRKXXzdRVVR/H52enc/rN2nLZT5lYdjxk1
 JNjsq6Ux0okdtKehdRTVaDUPFM7hSve2DWhSZrUPbgtYiGijqM3aVMzf5umufQgMMPv8j9kXcn9
 TpcgnYw0EXH2Q0FX6xMIk433PckgNYfG5/+drrYlmMK5PszJ/X624e4SrDW6DQw2I/uhhpbk0Qz
 c5PES8AnNPzHLQzI60AzGhf2kRAejvSayB2YErq6zb8xTeK7+H+DXIWGGFVUXzDRmTjk+F0b29l
 /8dgqNPLcVMa7SlVLpA==
X-Proofpoint-ORIG-GUID: Z1MnU5iq8OWqOZSBUd9K26Iz7SOkCQ6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190039


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
>
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..d8edd14d1f81a49e352f6939d27ea9cf8bb0f019 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		iris: video-codec@5a00000 {
> +			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
> +			reg = <0x0 0x5a00000 0x0 0x200000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "throttle",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			memory-region = <&video_mem>;
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus = <&apps_smmu 0x780 0x0020>;
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133333333 {
> +					opp-hz = /bits/ 64 <133333333>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmpd_opp_svs_plus>;
> +				};
> +
> +				opp-384000000 {
> +					opp-hz = /bits/ 64 <384000000>;
> +					required-opps = <&rpmpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		dispcc: clock-controller@5f00000 {
>  			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>  			reg = <0x0 0x05f00000 0x0 0x20000>;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

