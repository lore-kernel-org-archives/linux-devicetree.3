Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F58A350298
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847400; cv=none; b=hOSBl8o6PbaU3BvNDTWrCD9voQQ6DDLmlKhd7KnMo/1kNDychv29cgYBnP83HF+4dxZYzyswh/M6xNdZZ+Dq6GwS2sb1yxbZWkUXf08gxDGNHFCP8W5DWZ2WyDW4XqV5Gz+QY44HIVRYNajegFDPODoAPWHlSCgFIWPb5wWXLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847400; c=relaxed/simple;
	bh=eLTXmZ1JepO9DXZHTUUe5FQ+sKYQYfTLhnkNdqVZ1wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHPwgcCFV5DUIk/Uru8sZLTFoNZmaEJymv4HMk4TUdoDOFm/I4di4Iqvmdi0TZviOa/SRg52afyab1Eh0uy01XsDJ+DmtnIC5Y6+Le5DESCQigdaNodjYJWAFKzJNNrXl+mI7a9zYWOhfCDYYrn4aLmatX8DO6fBOPd1ms/ZFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glt80ZL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1+R+m9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glt80ZL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1+R+m9J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAVEkt4020834
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RauJCwjNs6c1IAD2cI6+lktF
	AP5npagaxwu7XB6lenA=; b=Glt80ZL8FDYXgbl85O8yyce7deoTVIksn8NpccVY
	KhDXfpSdgcSKAthi7s5/bTj2UvEEArj4Nu+W3AmEEM/0gAagoxfMkW8B+B/2I184
	stW4MhWjz1dS35ynxetCwfklcaxTcq64RsV7OK4AzQK54FGCHqQCxVaoj2GJ35XE
	VqIoUbRxZ0X+8qeieDjEIRb6NMyhRom7DI44abviShv81NTwnD23lkJJubvNeYjH
	mT9vOrJnzYOWUIwjo1rrDZPUune5PjF3ijLm9R0ZNacAHpCpf5mhaPDrPrBHTTM+
	wlFTceCTeyuwojbCDWryBWugTKNHEtgegC2ns/zhGtVezw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru6jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:16:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631455685c5so2477336137.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847398; x=1779452198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RauJCwjNs6c1IAD2cI6+lktFAP5npagaxwu7XB6lenA=;
        b=E1+R+m9JL5C0Xs24s6cmadoOHnDxlKgoFPTjRN1RxYlyAlduJyaEZi3bUbKU+XSqeV
         L8urUPbGgwXjCeOPCBm8+zCvCNBlWOly0nkbZU+o2axvvh0bq4gIumOSBTFDhpzyWtQr
         /BwhuTADi2ROdIbqsnwVWSqWw/aLs2LY4ti70HKhX/4K4cpFOp2vHExizRetj7Qq8Y+w
         +iOMSulqTQ1PLG34Hq/r0omnNO8sZn14OOwr587kSehl9G9TPIFKt/RWTv1OjsxztaT0
         V5kOjLp6j722b6s1BfR5lJrB97aRssD2DlSGoNQ7IKKxB/Vx7ZHCpRUTsw1rHQYQIzJZ
         9Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847398; x=1779452198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RauJCwjNs6c1IAD2cI6+lktFAP5npagaxwu7XB6lenA=;
        b=pe4CVGMI23g3xmKrQFBvtTMhmPg2jThMb9B/Ts7bBaNBy/NEHgoJpkSE0kmhdTCosN
         0O0ta8S34+U89T5961tnF8oaqlQvWcTLzA0ylhvE7C/v/eEXDwt0TwX4w8GRt+7ErV+s
         oJ4aKbkGOs/BqhOHsps6LiNwXc9kwzANtTPN7pRROSXhKEov/HvoBOuJYnSMfS9WEE0g
         MsaHMY4gXDl9XrK71m81zGX0ANPkFO1kSt1+CUYGnUrnv/zwkDpukqHZ4hhwrM2kWMbx
         oxujaB3E6dVB2o4DdgQjOLxLmdmf9gomN1P8F2Ic3EKbXT14TnHqImG1DvlR0S+1ax9s
         JF6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mm8NvXs5FCObrF3ndbqtt9qerP6/oRfMiP3VgQjFtpJFfmYiEPanwmivXvyFO/zFgk0vZxVKz1bC2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5RidBR+buJoEAwLLYXunjmW/SZ53La66KxdX4YAIsgr8TeVCx
	xkxFcBrMT+IPlCh8HCbQFD451juda/36OYihfdt8EL1MlsM4koE8t1O0kh+V/a43CKh+QReXru+
	nTXL3/F+Z4NGtW+uFjgRlnJXLe8IIF+Fr1OjQMkrDUk9yXmBivsVwYOFzpKYhaW42
X-Gm-Gg: Acq92OHzmGfY1fnt/QU5jxzAG9tNUfPNI44wVNPgVMfh8tjhu5N80isrAe9j5vlItXg
	Fiw1dW5shaRUlS/4skiRYz50NOpaQU0AMaHh/N6l0HmDyypEuBXoBcpjTA1PbM7aFml1viA9xZH
	U03IGo4ghgyqFQCZq7fRQM/fpuwW+JljtaKi/EWUlKz1pCuG/hdrgKIiUKVnawLJbKfuUV6EUMo
	HOfnFOJVysL6gtJShoSOV/VO2v1aSkfZ8s2CT4DZTIu/lrg2P0Q59z8gboxMgQZRurmKP0QDRrJ
	gDfYbEgh1VSBshyuVFmBGsVRCy03FX+yzqKXOqVuZNxQmaOF/70ffW7ZnJIXewSrIxBN97+xwqb
	OE+JwXgeg3Wq9A2S09uLuCFz0Ha+FL/K+iKM2QoIq6447mumxugdAQJoOavcm4PmQTNM8tbGSJ8
	ZLnKNGk/PWr6xO/Jk/uRZYph2GWuiIXnM2644=
X-Received: by 2002:a05:6102:3053:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63a3f68e6abmr1493572137.21.1778847397607;
        Fri, 15 May 2026 05:16:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3053:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63a3f68e6abmr1493481137.21.1778847396985;
        Fri, 15 May 2026 05:16:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm1306442e87.25.2026.05.15.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:16:35 -0700 (PDT)
Date: Fri, 15 May 2026 15:16:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
Message-ID: <xaz73xozqqcnrxdmxizt7wem36rwqe5ted3mkofuhmr4yqcsdi@3d3tav4pt6ta>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
X-Proofpoint-GUID: F3Ib9NBCSoPgMo-f6I1Hn2YZanlDmCbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX2+eOog5SjXJy
 i7xUXnbBgcye9woZgEZvSPEWmuiI7blyOZOW09D7/wxVQi5Avc6aN80WW5m5+pnd0ddBcLLFYoo
 vIGTcUoTE5mFxpn36rYso9bgywFwFJ9xJqCZyHzlBU6uwEs4Xm2smnMIVsWfxNJgv/hlEHOHe1k
 K0U3V7ciUsFeEyywv6t43lpatuKGwCm49yoifeQTDl+PfxcZWWR5qq5Pa7wGIuQj0/rRiEH5OBo
 lBY8iHic3pzl0X1uc+CVzT2SI13l1sDPjPnVi3tV8fAYFpv9Ux0sBaQJ1JDR6IXd1AJY5pB9w5e
 P0Ol+D5PgVFolvefMoa+dcd8vYSzffa145BcIkYv9wR4JJJ0ELjkEc8t6F97GIag0utGRIxMUf2
 bPJc0FM094DeSpXkQS5EmWtfKca3LlfNt8TzwG6vzQFJXti80j6g35sGi91xiiLn9gLtxu87vDY
 ayWZ3WKnlibecbaIreg==
X-Proofpoint-ORIG-GUID: F3Ib9NBCSoPgMo-f6I1Hn2YZanlDmCbf
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070ea6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mHUKrEjVT4bwi_mjxIsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124

On Fri, May 15, 2026 at 02:47:01PM +0300, Atanas Filipov wrote:
> Add the required JPEG encoder definitions to the device tree.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..dbfc6cc051f3 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5198,6 +5198,58 @@ port@4 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
> +				cell-index = <0>;
> +				compatible = "qcom,qcm6490-jenc";

Huge, huge NAK. Wrong indentation, wrong name, useless label,
undocumented cell-index, wrong format of other lines, etc.

> +
> +				reg =
> +						<0 0xac4e000 0 0x4000>,

0x0 instead of just 0.

> +						<0 0xac40000 0 0x1000>;
> +
> +				reg-names =
> +						"jpeg_regs",
> +						"cpas_regs";
> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +				clocks =
> +						<&gcc GCC_CAMERA_HF_AXI_CLK>,
> +						<&gcc GCC_CAMERA_SF_AXI_CLK>,
> +						<&camcc CAM_CC_CORE_AHB_CLK>,
> +						<&camcc CAM_CC_CPAS_AHB_CLK>,
> +						<&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +						<&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names =
> +						"gcc_hf_axi_clk",
> +						"gcc_sf_axi_clk",
> +						"core_ahb_clk",
> +						"cpas_ahb_clk",
> +						"camnoc_axi_clk",
> +						"jpeg_clk";
> +
> +				iommus =
> +						<&apps_smmu 0x20C0 0x20>,
> +						<&apps_smmu 0x20E0 0x20>;

lowercase hex

> +
> +				interconnects =
> +						<&gem_noc MASTER_APPSS_PROC 0
> +						&cnoc2 SLAVE_CAMERA_CFG 0>,

Wrong indentation, use defined values instead of just 0.

> +						<&mmss_noc MASTER_CAMNOC_HF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_SF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_ICP 0
> +						&mc_virt SLAVE_EBI1 0>;
> +
> +				interconnect-names =
> +						"cam_ahb",
> +						"cam_hf_0_mnoc",
> +						"cam_sf_0_mnoc",
> +						"cam_sf_icp_mnoc";
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,sc7280-camcc";
>  			reg = <0 0x0ad00000 0 0x10000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
