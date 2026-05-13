Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD840B6E3
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691105; cv=none; b=oWjRHuTWtUipDMuvtVXp9u6MsKaJTgrE3rrCGLwdpMPVqw2WQ89JCl9/oSioyNZqIlhCtH3s0EMA2JiGAmm9qwc6TIQLdBUjMyUTNE7jVeaLn4WV/A+i2UyjnLedsuv60dxflMYvcvohwurTP0247h5eCX+ByE9vNkf0pl2Ty6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691105; c=relaxed/simple;
	bh=uquoSwa7ZwAvpTOAIW92nV9OPtPJezsv1BSkxTCjGQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx5YNo+GpJaUmPYZe+uFRJbjneFhKOVUeir7dYw9VZ4wnCoiPzyTRsgumVA5GhBi15b70n4EPthHzNF4ykeNavUhcGjZIC7CD0rsn5RITuVD7kRa/MYWxllzlG/FDLxPIYF8Gia64fOvnADLnl2iBCYOG0iR+Igstw7DW4XaLdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKhBglmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKNVRZET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKhBglmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKNVRZET"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEgDaG2888326
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvW9MFUmG8rvh5PNkmsY1wyy
	sIDeA/uWWz+EQKpqk6g=; b=OKhBglmbyQEX6oq9vBhZaGVssws+8Oa4lvLJQKfB
	4FEJkO4YRuPf1HRAdUShy1fygbwX1pfjz83GjEUwa93LLuDPghfBuLMvFuTG2SLD
	+65p0KgExqbkudiKV2L3KmrxwRmWK6rQVhZrlmOeYqa2bWAX+GcJA5dtB8wV3MiC
	GnZ3NhJtQRhAf+nKH6KnRWLrfB406qwwwvtg0i/brx3tQ7mz47ZA+FOIjO7TZx4I
	4kb1qi66BpS1Ytc8S25d0HiTqTyte/pKRc0O9kDA6FXxAa/VYyTTRoUVFDq585jX
	2c4sPuGmX84QWsN5ESl9w2jikrBUf0wOO+0tNGV5gplOaQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghx3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:51:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-634ce585b41so2068734137.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691102; x=1779295902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=cKNVRZETc42m7gaWzcrpWTJw2qaMhQITATap973a8X5aw7m+fx3qEjzERGXAhDtf4g
         PlkwDLpjQ5NnYQ1wrrfj2vkPdmfBa4Io5uS74aZidvqSp3XqhOPjW7VFX4/Bagh10U9b
         kW6JuODI8OxwGdt+EpwR0oRyTu+O252sNMBxT09qZhJnQhWku7m29sR1BFP0QvgRrFI/
         FnlZajzmjReNJdotNJX6FLuz3SZ5xQpqtBIchxYSy6xVuywNwZd6jzUKspiJrK3rAaYj
         Zw/JOYhH3x1GhyCU+sAY5RahnJodLIvqTReWQZPuK1vqFA5x3NDqefBB3tdyM0Lw2ugM
         R82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691102; x=1779295902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=Ebl09QyzuPnwfWmwCrRRkTw8HftJJ4DV26MMFlpsvBLDtR0KkBFz6gHHKkxvb76Ye+
         x1QRUAgPdTS4eqjqvwtiW5rwys+lbu9RovZrs9UFOaabEad4AS05+wik0L2JPnKzGtjp
         ZRGuNmJp01Smexag2/B3LJGiyw7JR4PqeY+ZoQFgmbyI8JgKC7eLbGJwQIzcg7QK38++
         NxDnv9Tfo9jHdEFLGt78LdlzDXlEPKhzVZNkuVA6FcrF5pHaCT2wjydUF+uWeA5nQ11q
         F4ri3wcW3HQq/obzpLlWjgkmTSEVyfzq/lctHCIaA1Bk0O97DGzl7ECUzPGQkVTXUVzV
         8SJg==
X-Forwarded-Encrypted: i=1; AFNElJ/EG6JCCN6xUkN311jsViXLXTceJAnUAeD93ClJcXUfhqfrRNEZAWPYx38jMt4Xqch8Nx+hAOIlVt4x@vger.kernel.org
X-Gm-Message-State: AOJu0YykWTBtW3fH9iNgJciygvTs3Q3N2fzPaXl8SauKzWQPX0mrclph
	0Po9RULc0xYB6Ycd7dT8MT+Z3HiKoAuWzilZ+AxMbiAOEmHjbydjWPBx3PemXT86+S8xTfAtgEz
	FAmBIvUAWdVAP5wHFMCBCXS7Mo72TBHPFcMKp+7I0uLMn3N4lQIErbAIj2CCfSN6o
X-Gm-Gg: Acq92OEho9t229cLuAo7f7gROStafpnlUFJL9YPCxgQVPMW52TZvNXfTlz0OCvtbxYO
	Z/p5vn4u76q4U31Z25c3ANpbBqKKmmg5Oqx73M2LVxJcCHfIJ1GP+yjOLzKZSeNP7geEuZNzztA
	0Hx+yI4t1txJjiIkY9r/91lOP7nOKbqJAmsajNMS34rafNhHg7xFoDVgHIEpa91QOrGcSjbAJht
	+iim8rHhra/dvaoBZEnvqqT4hRkNNh4erPFt8grFGdZaq7zYz55/HC8j8rQaOuZ3fYamEL2YyCR
	AWn2TBzLoAf198ljRbiK9t1ttusYwfnZhu5WH6hNUIybC4u/u1ktuDAGV3AwkWq5eEWtpih1Zs+
	mxcV5Gl55qonV229+eBlY4rgiBE+CVMW29ZNHQ7sT+kro8vAGS+L6415fK7va/yQcaUN1wsw3tD
	Xqgya+QC0+t/y7kz9hOFdQ6VVEiqaZodOajbg=
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437814137.7.1778691102144;
        Wed, 13 May 2026 09:51:42 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437801137.7.1778691101711;
        Wed, 13 May 2026 09:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfbfsm4156067e87.46.2026.05.13.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:51:40 -0700 (PDT)
Date: Wed, 13 May 2026 19:51:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <ergnufuk7qx7b3xsccdifdhlwfoxka5k4y6s72zpqvcfmv4uxm@brakkpiqkqhy>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: shzcHcPSoQyJ4hfLUsWyAaEGPEJdYomL
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04ac1f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: shzcHcPSoQyJ4hfLUsWyAaEGPEJdYomL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX4nJfp2kv+QAG
 HImJDPSyfnYs1K/3aKpGN0sHySFMKbDuz/Lmast2IgHisEuOoRHON652R7uryHDTHNMziSRZiKy
 +gyZ2NES6ye5z8vkOxpyIFTye/ugeIPbeI5MqZpWiy9JoR3ulzMZIs4ramXQj3AWlXkHzb3YcY/
 xYNnzqjFnVv/tiwyHYnfg5sCqwR47XfrDOufmP81KGYCuSLnz4H6+FNuzeq99AScVXEU24Iitw9
 0a6kwlfWHuyn5Fb4gc0bTUw2O4gLf0r7FxCF9ul589OIxVfy6lEBNYyN1M45n6zLurBWz16NH8i
 sx7VehaydBH+rrBp4V9ER7YOmrN3Ys9pVZUkohS1MBKVNvt3G+mCm7YoA2t2gqUUGofIp3qA7rA
 o7STC9T/2bNdsy9YJiKy9Tck0UTUMAvvwOD3GxjmCajQhKY7c24t03VAhhq1U3HReAhjJcwOEW0
 oduhrrjmI+nodKUin5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130170

On Tue, May 12, 2026 at 03:53:17AM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index bab654bbd6d0..26a4de9c8d45 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
> +					"qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";
> +
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,

Please align on '<' symbol

> +				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,

-- 
With best wishes
Dmitry
