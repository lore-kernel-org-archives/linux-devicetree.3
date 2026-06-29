Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129740627F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738176; cv=none; b=rZR3adG3oshUlQqbhaPBzcGS3ng0OWn124aBp0TqFlK0aGJoWxsUdVzrht5fYR71SUrNFU3yR/Am5RlBZ1Amb64Ka7I2zENuKusfszPj8/fdqHJcehpY8q+hk2dxIlH5LsAgJwhn4bITLnuJo0isd/9iK4Mkd6N9d4N4cpd6IzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738176; c=relaxed/simple;
	bh=gZw53pFMcQgCYZDJinH3iCRFlyEYE5MBia8cml4tAH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUoX+wjR7q4eGn2ZK/3EeDbOI0RSMwFEkKNtPSirCPWPyS8IfNT5bnWVF3B7c5JuH5hF+tpk0KhKBBd2bJpxgd2YiBnoGs0yiJdMNnRBSA9KvHI2mFi1stzFgDS9omFH8ndWR3KneHngjTu2jRJS0Y9LvImXhiWQBGjI9DuCuEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxJMVguS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNGGij3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxJMVguS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNGGij3t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3e22641697
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ml68ks4UWkrifZj3ri7MUh/7
	MoKC61M3Z9NIEdR3OKA=; b=FxJMVguSHIhCYSrMDlHY/FHUSk+Unkab9Fmtcao7
	QzbTO+wktHQAIImxVMB0/1fp7fceAmVGL0ERc6bKog7wU864Qs9PFgyW0aKhar6a
	zTNZ2yd+NVHJgj6Ib1sHHckk0DCzaKppLixohNTBNHMW3fsKzo/sRsv0s9fRW+3y
	03JI5cjVuKGKu5SZoPe/PiapZDTFUDB8KNImKXQzgRCC9vnuLF/d6miyCXtDg6gc
	5hHfncBUrbe2gYdFa1kaU87cOX9BJ+aHa/X7lpm6Fms3GhBAotHZ9OGzqymEmKp7
	LF1sDuGaxqA2C7kwBF0N3CE9ku4cRgob1/P3tC8nVTmZ1Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperwh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:02:54 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e74781faaaso4485996a34.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738174; x=1783342974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ml68ks4UWkrifZj3ri7MUh/7MoKC61M3Z9NIEdR3OKA=;
        b=QNGGij3tm5QIcfZKqIuqv0zjUH+5NokcikGdXufq5YGCoTVn+fOu7PFmoaaTokDoqA
         Qjfnwp5fSZgsP1P6dcghI36k/VK+/t+nuAEcHh3nV8FJzhRLseGXOTDEibTq4hNA9bfK
         d7OftjnUbJW6ewmRrKODE7xXElMmCTsk42+ICSWYVT1hrG967IBQaoz6TZpvQ6rttJ2v
         CZUdyysQLizp7yDnCLOlyepSKSpltMrIHPGxGTAseB4SIq3V7pI3u7cyeeKn0l9cnc7n
         YZwpUSSaT/A+B9Z/iIMLwVZtfOQMcknSO8teWOtcK2V9Mc++YQ3NGXQrw48oDCx/MtJY
         Fn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738174; x=1783342974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml68ks4UWkrifZj3ri7MUh/7MoKC61M3Z9NIEdR3OKA=;
        b=hKqp+u5WBvfXT8JisEcUfEhVm74Oxao6zr9nxDW/mrizxEYUwsIUvlz8hE1PK2ahe7
         S95sxGfhskgrDxyQ+xfqT94mGYx6O21MqFmkbDsU/ZXcOGQVZh3FCgYx4LjItV+jmWXJ
         MXU7y2gfoA6OjUStGt+80tvS9aL6ChFLYtXCnxFRnDyh7dMk6gvIPW5z5X3+0/Iv6Wk+
         VGCAK8sRg1r3azVGbhiMcIPYhxc1jCCuGNYCQafKfO9j+EBVNl9lXBao/PIeIbA9y+WW
         X33zQsHMixAnXaWrNK1G9gY6NnLlPPq9MwQkbjNbKNvZiTd9nuSn38Oh6ZC4x0ryOhsy
         LNHg==
X-Forwarded-Encrypted: i=1; AFNElJ/TEFj6oHDibfeVba0+FZWQHzfUOPGx/3fuJvyPEfUBcfWclJSBiRleDtmqad+J0/OMZsMTd6haobX6@vger.kernel.org
X-Gm-Message-State: AOJu0YymJ5YzEFONzhgPgilsHGyn5jc2trGWfzzlk1ceniB4/Y+75wg8
	Sze1abdsQeXtxuzPj87xnbqeao+Kj3h9zam7XG8OWZul6qXLPff0prcAB+fOGib3dZlJ8BGWHtY
	vglTMsK7AFj/yupImDL8oM9VrKmv0L03eB4yQ0WLr7a1ArQPB7U4agRQT4GpgRuPN
X-Gm-Gg: AfdE7cng/lLiWxH3b8PaspJda3d+v9lLhOGd3qd13U6T+aCST3qcoUBc3VNNLSRJf/+
	cJqVLMlXik1kYOQd8yyGmSQsiApD2ycAxDNoeEqjnipah1X5pc8txkjK5Ak7nEsuYc0YIsGs7kQ
	tNyaDS6zBGdgJpzxzcUwnbHU0Q6olXV0DLhSKQPJuKv8749kH9apleLIlAEsPkWH1hS0sFTMOwm
	g+DAR8FZ8797b2LAtcqkte5DgFSxQLf7yb4oJis1gLYVn1H5ifhy1DkbgWQtR9nEkSbeuTQYl+2
	x5z0r3vW6kkeqomwPq6HTTjCKBjXetyIL+1nmST3Peu5Lfg8dxeqvxKEm5nrUrL2tzMPcnObnMF
	6B8zRDd4r0sU9vzfyr/F79j9tomuzjOnnkw6jy65hfftO/uBrHPqR1VN94InBBAQlYhWbXXtvM1
	1IDZUm5j864XTyrSDzJqGkFzPl
X-Received: by 2002:a05:6830:81f0:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e99c22242dmr14258416a34.21.1782738173672;
        Mon, 29 Jun 2026 06:02:53 -0700 (PDT)
X-Received: by 2002:a05:6830:81f0:b0:7e6:ece3:80ed with SMTP id 46e09a7af769-7e99c22242dmr14258337a34.21.1782738173084;
        Mon, 29 Jun 2026 06:02:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a55bsm5960604e87.6.2026.06.29.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:02:51 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:02:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <nrbztmmm7j5txtu24e6hy3g6kjbxk7mulcx7jv5zbnexnhzwr6@ddbp7av7hpbc>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121750.3469292-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX18aoVJys82Jj
 K4enrRyheFfjlJUWiV0lWqg6JVE1VJlXTJOKmftneIa2XnpQXfgBXcGLVHshQqctJh2xEy+Bk9c
 VRShtSDoHsxdRcBk5tbJUmUx/xy3x5PxeO1RJhn2wurS1x9cbnzqpABn2K+Qm4m6B5FLDU3F1lX
 yRl4kFaL/vjaYxSUzud+8p4CWjD27vgjnV9V3JD4IN8csuK3SBP4qYHMR/Hl/mnXvDsHB7D4Zm5
 yCJDrEFx8MXyzKQ7Gen09PFSpWO+VMqf9lOiqkvglPbBdesxic709mcBvbGuPz6b7xPY3g01YuE
 PsUC8+oJza7u+AmqHQUrEB3PApZwcDmaLzcedCAmh7Afh7RDuBJ7LuN52leNG2UGiaeBcKCLMiY
 HmtqkBLo5WC3cX4FQW8OEMEwRBBCz6jM+5fPDFWSSuNJydO0HcAvP6t1OsXjqtuV1azNQMDllB+
 3zLsh8OBY+c8YlKU15Q==
X-Proofpoint-ORIG-GUID: sbcR8aeKEiXA6F_uuxPw6w0gslKibmnE
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a426cfe cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=enru-rfrgKOJ_pi6DpUA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfXxC1Pi1llSZ7d
 f5PAUyMuBE/TZYCQ+/h+ixROmqsavaYI3eUQtk/w6Ddp84nyuMZw9ds0YnJl23M9I7GwO8viP8e
 0wNddAVm6hI9j7wcY3d4GkIzrdbUgfM=
X-Proofpoint-GUID: sbcR8aeKEiXA6F_uuxPw6w0gslKibmnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290108

On Mon, Jun 29, 2026 at 03:17:49PM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 78 ++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..d0cacb4ec35b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4472,6 +4472,9 @@ cci1_i2c1: i2c-bus@1 {
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

Status should be the last property, add empty line before it.

>  
>  			reg = <0 0x0ac6a000 0 0x2000>,
>  			      <0 0x0ac6c000 0 0x2000>,
> @@ -4616,10 +4619,10 @@ camss: camss@ac6a000 {
>  					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>  					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>  					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> -			interconnect-names = "cam_ahb",
> -					     "cam_hf_0_mnoc",
> -					     "cam_sf_0_mnoc",
> -					     "cam_sf_icp_mnoc";
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "icp_mnoc";

No, that's a part of the ABI, you can't just change those.

>  
>  			ports {
>  				#address-cells = <1>;
> @@ -4649,6 +4652,73 @@ port@5 {
>  					reg = <5>;
>  				};
>  			};
> +
> +			qcom_jpeg_enc: jpeg-encoder@ac53000 {

Unused label. Drop it.

> +				compatible = "qcom,sm8250-jenc";
> +
> +				reg = <0 0xac53000 0 0x1000>;

0x0, pad address to 8 digits after 0x.

> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&camcc TITAN_TOP_GDSC>;

This should not be necessary, if I'm not mistaken. All devices inside
camss are part of the TITAN_TOP_GDSC per design. Handle it in the driver
if required.

> +
> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					 <&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names = "hf_axi",
> +					      "sf_axi",
> +					      "core_ahb",
> +					      "cpas_ahb",
> +					      "cnoc_axi",
> +					      "jpeg";
> +
> +				iommus = <&apps_smmu 0x2040 0x400>,
> +					 <&apps_smmu 0x2440 0x400>;

These two entries result in exactly the same base & mask. Why do you
need to duplicate them?

> +
> +				interconnects =
> +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,

Move to the previous line, use proper tags instead of 0.

> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +
> +				interconnect-names = "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc",
> +						     "icp-mnoc";
> +
> +				operating-points-v2 = <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						opp-level = <0>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>;
> +						opp-level = <1>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-480000000 {
> +						opp-hz = /bits/ 64 <480000000>;
> +						opp-level = <2>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <600000000>;
> +						opp-level = <3>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
