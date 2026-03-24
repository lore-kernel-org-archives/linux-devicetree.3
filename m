Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE5935A933
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385576; cv=none; b=JC5vkbcjLFrbNVN4SDSXIKIv5HT4q4GZbJquFi9BPbkGrFGwOkcYHHCIWWVPlu0oMjcxRprSK8lGhyZGOlSa4n5I/gFnsphVGQTM4VRUObkxwCt4bCUEsKzZ4LIiT9fSaK69UQHsccIGmXqSfzjUJ9qZxjAf3mM7hqeQP8oyPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385576; c=relaxed/simple;
	bh=2iDi1ewMnzAeZQ9g7JuXZipx60ngATftH2vw/8iWOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia38Xm+P5AE1DD8KDTY3F7KT9TjWuNuiJjS5rxvJOZT47/Ge4vQYRt9iVJKD+1OmqYH6Rr2oNafYwLvPIvUjigT8rJoxD5wLT/UG+WXNFnURoLrA/q96HJr7bvo0tWcNSUUyxNGAwDn6lwnXzYONESKPtDg7FvY/XT1xgYAOHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Po2Squ53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyXg41M7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Po2Squ53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyXg41M7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnonW2075638
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rqQjayTeZEhxnqXufBt6gqjE
	f6UwDuN2Pb+F55fjRok=; b=Po2Squ53jnRvXfAhYN2ygVpFKzoBHfaNuuZJu4s1
	hjIKr9JyZ/n98sxB9VR24AM1nqdNrSC2MUNUF5QSem87X/Qfq423C7uK4HugJLJB
	B7rJru3ornynbZFRyFNRtNpYsV0WmVSArtDIJG3oqJSSqu6oEsdkMTbZZiuIi0Rs
	6v/IkvmBg+VM1c9ppSBkAGBc9vVIfWuHuLMTMLnZtZCZYizQo3cejA28csLvltzs
	SgzSjrpYwKg5rn1Ukj9URwo7r9J64jJTABAEqkKZ587ZfTENAsNnA2cUXJ3gOOsM
	ANoLQBn2LhJAt5KWvtv+Pc41JS8SUIHe1Fd7VxBtlur+BA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4141066a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:52:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so98175831cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385574; x=1774990374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqQjayTeZEhxnqXufBt6gqjEf6UwDuN2Pb+F55fjRok=;
        b=NyXg41M73ukjFXg+esiCf5yHYxoPGEtFfpiorG8zu3lPV2OWt7k4ohb0yrRJi1cZYN
         PzpzQzFiu62EpzxgcfO+sZw08y7xti09XEtjPuLk0ahHCe7YYYPO2WO1Htb2NT6rJ1Fs
         jexQYKicuTn1pRKzTBB9prT/D/AGZiGwhuKzW1vsK257qMfaCcfOE4fPOBNgp0NzX1Lq
         EPG5aeQMNgRIzz0BQ8NfkoWrImrC7XUwcQXWjP2ipkkMP8whNtySj0CKGXcqXRxc1ykr
         Ada66px5L34PUzIfrv31q+KBWf2VTclQEZ8uMI+dSaLvDjfxCIBV1uzRQG0Xv1E6P/5h
         P1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385574; x=1774990374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqQjayTeZEhxnqXufBt6gqjEf6UwDuN2Pb+F55fjRok=;
        b=QvUExrIrSvksHTsXs9Sie2Ua0yeogJKMHI1ngY1YYm7oAHQO6VFC49UIFYs4Rdkhex
         DLoD1paFs8uinQp7Ya1FJIB+nnKk+uaH4QQ32j1VaRAZr2YKcpfqNeLLI04DoNy6x0pz
         GOFrpuMaFo1ztlQ+2uwehDLo6VJj3qHL7WvLHnoIVkvDFZwoOfM+oKiOb8TEBowKgejA
         j4A/Jdt212IfTGUexFhzfRRactBvL2UpZuOVTV0Itb+E6uwR1NXEAdK6n+TXJMut7nvA
         vxto3ujExvHXLQfAFcM9L3obdkJh4VRaThVHyndmFBGu+i8pywXaetMrWOf+24sPtLXK
         8HPA==
X-Forwarded-Encrypted: i=1; AJvYcCVGzuyJBASAjNCcVHMq0hXq0GnKNkpAHOy+bSKgbX7gVbtr7V6MJ5iY69VJQkO8XVcI3zrjizuIgi3g@vger.kernel.org
X-Gm-Message-State: AOJu0YytN7/bvCEq8X4Imv2kWlLg41HbkFtQ7+0yM/O/JqjIWLQK5YtH
	da+IzQe1bNNRYsplFyoPNk2LQ3ChvqWrewQ0WY4Zho18Q5pTJJZWdBbdx0YGs3K14pI2CgnbwxB
	N5+HaP3Xhd8cwHf8XmLsDHXQtlC5ya4W3ws57l80w/8ayjEe5mQFhkdywqoEDWZpN
X-Gm-Gg: ATEYQzyQQJvud8AqVaovuI6qXS+ItoM/c8ar+GbAKQOLU3YgyoXy3pn5d0O71BItK77
	NphhttSPCsEDSkQoh7GaPP728lYGFAqBPIr+EiyopGiuwnRZyXIppTnZLM3/S2y9jUeSsRpYli0
	FOSsClaS3y07y2ALfW9y8VtGCxsfk/+aLsn2ocJnnM6V+nUUIq21iGCkCbnK5o//jeCfdX9x9XO
	s3xU5kZTXpUcsDfRexUIrpg48CODHIPVB+YiiIHGuXMrH2iOOXe80V3fvAb1Lr/1yzzpAbOhyUA
	YA/nCbGaB1tI/vLuvQ1rKyoco8liCk2enHeIS7VRVSMwnL3UcpyHXBUGKUZDWAKWm9yOIExttwf
	MhS3+21d318eoOmH4StED3ntZ0JldaLr9brVA3jc71fACs+ge6Rl6XwzBEm0uWJuwmLcaJYMhhd
	2g/sWVyXFj2J9OikjCFKtM9gzof7QtLdMRuOo=
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr16740381cf.48.1774385570591;
        Tue, 24 Mar 2026 13:52:50 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr16740061cf.48.1774385570121;
        Tue, 24 Mar 2026 13:52:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm3503310e87.39.2026.03.24.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:52:47 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:52:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <bg6h26xk7cdpf3fx2znm3y5snxmhtrddvrkn5j5ft5uovgpk3i@ume2erp5lrax>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c2f9a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qq52r8Dd0ieUO58wh1IA:9 a=heC_-aeoyD3psnDD:21 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ALSyl0a0MYyekjZbcX8KWlIEFlB67RNU
X-Proofpoint-ORIG-GUID: ALSyl0a0MYyekjZbcX8KWlIEFlB67RNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX4q6T6RJx8dyR
 plxAIBynrwuIcMCcsv5MiCVp3aOcizX8+7XAlwR/5uzEVchDyLKDDgMk8iriz9EJavKHPP3NF3w
 m9rwvOZAyPrR2dvDLGG4JFEhK880eg6x96t28pAjp4jV7YTF0HRbVpCrSflW6sA2WAptfDYuf7s
 rbGEt0ROIAn98X4l9HdPOYPN0XdhxRqIkmDegiM+9ZxR9Nzd7V5IILkcviiVJRF6Fsvzt23BoOK
 eshFfuxJoJbu8/naOs2U12OSH9CkGdu6gfvouvdpDmqI2TdzRvBC8wUzUoXks/EMfjdLyLSWpXH
 ujHMQnnjNaO+o4KpG++qG3Y/BJz6JrmNj/olfeRjPr5Vcm7X6ZXvCifn2B5G231id0QJ8Gc+UQk
 kkfiKe9YNsrdS7kPgnXK8w8hBliut52M85DvuqI7V0h20mDnAU2S2naInT+LRVhHVs6J0s+zqMi
 zNzxSPC/vIs3CHCsDUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161

On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..fd727924b8ca 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>  
>  	};
>  
> +	qspi_opp_table: opp-table-qspi {
> +		compatible = "operating-points-v2";
> +
> +		opp-60000000 {
> +			opp-hz = /bits/ 64 <60000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-133250000 {
> +			opp-hz = /bits/ 64 <133250000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-266500000 {
> +			opp-hz = /bits/ 64 <266500000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  
> @@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			qspi_cs0: qspi-cs0-state {
> +				pins = "gpio44";
> +				function = "qspi";
> +				bias-disable;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_data0123: qspi-data0123-state {
> +				pins = "gpio45", "gpio46", "gpio47", "gpio49";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_clk: qspi-clk-state {
> +				pins = "gpio48";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
> +			qspi_cs1: qspi-cs1-state {
> +				pins = "gpio50";
> +				function = "qspi";
> +				bias-pull-down;
> +				drive-strength = <6>;
> +			};
> +
>  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>  				pins = "gpio4", "gpio5";
>  				function = "qup0";
> @@ -3682,6 +3729,39 @@ opp-202000000 {
>  			};
>  		};
>  
> +		qspi: spi@88df000 {
> +			compatible = "qcom,qcs615-qspi",
> +				     "qcom,qspi-v1";
> +			reg = <0x0 0x088df000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +				 <&gcc GCC_QSPI_CORE_CLK>;
> +			clock-names = "iface",
> +				      "core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ALWAYS>,
> +					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;

Should those be ACTIVE_ONLY rather than ALWAYS?

> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&qspi_opp_table>;
> +
> +			iommus = <&apps_smmu 0x160 0x0>;
> +
> +			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
> +			pinctrl-names = "default";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		dc_noc: interconnect@9160000 {
>  			reg = <0x0 0x09160000 0x0 0x3200>;
>  			compatible = "qcom,qcs615-dc-noc";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
