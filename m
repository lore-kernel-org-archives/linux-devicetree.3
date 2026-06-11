Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE9138D688
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209016; cv=none; b=h653KI/cAWSKUSMUPs3+KAWgWZ0DSogK421I+ZOwcPiMa9barriEWPF4Mhul6Y7K+Hn4kvVuzNV4J3tHjGN53KtRMr5EiL2nzHfvQsyDTtMx38qdUGuQCvk9CH/Gvw3rS8/jwA94o76mjLBbCMJatP6CCOXKnwnx06hPla4p54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209016; c=relaxed/simple;
	bh=YJq0j55CRO8wxi83erJLxi7d4LJ+0Qu6CeJvyMiZr3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emPrQe/pzpcD7mkMl6Enp6P8oosKxZ/PCyK2Ta2XY2QEEb/Gu0VvR3P7lby36T+mGcB9CW/d1XSRT/mk5zFCPniXpC5qHNEkyPso0OAQaZfJQP8h1p9m5AdfFKadDsbINmnj8gXM+NmLdMI9y3KtDhqWAOYXc8/y9rCK8zOlU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGPd0WPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVNfFLMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGPd0WPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVNfFLMt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Ksv1510543
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SCinHMjZ2J3w4Roqcjw2GQM
	ab17NAGCM+R3vMfhRW0=; b=WGPd0WPCoAB2KyheGqY3gMf6zT9oH5krcp4I+rwP
	09iHgrfa9eA381ElIqjMhyJJQSW8yisxrLMi0h+lyTErbPgKUtz4TZrNDlHy1NvJ
	aLv3xrqVhoVbrD8lVDaMqU1wtW/RWh9oPZV0FQgPddWSUXzY9mWio95mvLpp7//3
	m0yiBi6q1/rHqPdJMTs93UuOmc0kskgNtZM2Py8t2ZJOyGKvwS5XaeQ6vNODzKjm
	yW6Ou4qlAwYMcatqRYSxPxzYBpsXC91PcnutgIo5gRAvr7EPxMUzr5fDobnvqiJZ
	SCyead6hSu91UABaRt/ypq4GYKqRWZNp/SrIG5fR7K8VMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40847-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:16:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177bddf6e0so5657351cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209014; x=1781813814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SCinHMjZ2J3w4Roqcjw2GQMab17NAGCM+R3vMfhRW0=;
        b=hVNfFLMtTUc7/NBpiPe6JcobiGQ3Atjmx0M+2wjHYcfNp46vzxdzbBFoFhSQf5ETIE
         WS7i+GN9Q4EHSNjTRWUvFl68c4zzik3K6Aphb3DzoAXjkdkwS873w35RkCfYUhpf+kH5
         o+5T1QEZw4KSx82W6yNlsU2fRrJer6qu/Spr+ZgqLxR4XR3D+qXogg4X6nnAvIzMuaeK
         jFCdfIFMCWQJ0N/uj7e5Lral4aLWZNy7I6TGJxV9A+ADPlZfbXJ/Wi1M7WY3gq9kGSUJ
         Q+Wm7QtE09BFJJpcLGbeVMXTGHJn64xLhUDU8GeFYfafYqdQ7+oxkMMRiZZhzdIArMv6
         hejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209014; x=1781813814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SCinHMjZ2J3w4Roqcjw2GQMab17NAGCM+R3vMfhRW0=;
        b=RAsWjlP7KhkWsGLXo1zZ5QutZ89HGqtAW70WOM2PLxt0a5gXrQtS1PEehLYAabrshu
         nQHuuJYshXP62PeSRM1iTzRE5zMvHqszQCuGCbVVyah/4l7nRAYMFoWBArXpy7dC8g2x
         u3/OfZQrSR1Fp2LG5Y6bWoYJSo6YA7SYCZYWSB3iOXigu9eWdATM9t12WNvqdT0ssvlK
         Fn/7jvWqzxmCLk8xQrmGIZi8vSghE3npS0mKd2qvDDakxIm3cJtdqvSddQkGJEJbKzGM
         36q7NJw9Cpn9MBF88cRgCml9chix1PSNvOJEnN/4OPcy6ZjnVjw/IOM3DGV2XFxb7BR7
         IDnA==
X-Forwarded-Encrypted: i=1; AFNElJ/dV+oAKTxqWJNT7rhlTdGrsbgb/2KNRC+PZpzcod3LUTGPAXe9ETpItJd3ZGyUYWhOZ2Y1sHzu0nDy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4eHN2Kv34Xe9/aGIGMfQ1rxY80ddmf9o1RpzE6bovrnuhevK
	CpsJ8PJhwCWvAENvHrCL1/3SPVlhNflJtsI58g0bCSG3plOFHoIoPyxj1gB2AmlH9CAYtWJYTxy
	Ff3Sb9T7SFUzmsgFS9bSlR7pEH3uNImsJW2d4Q3YkbFcL3FaiNRw1PtJIb0oarlKC
X-Gm-Gg: Acq92OHHY8OZ1XFf4v1nZxFhbTOpREre9VM23QohNXxrFdq5E0+6HvPNuOJsx5lNc18
	ONY5krkwZAM1BrBqPJwcN7G83KcSgo4xRN2Za4CqUVv1dVtgMMbwhRHwo8SqTHYU5s2XxsibXgE
	KImhhbtuJS+lc/q/0tNsq3yWTax4LVzbHQR9H0Etsfn3OMyXkMFt5SHZ7UEBpostrt1i8sOJtvQ
	Bdbwn6GdLEoDftobT5cVXZZa1r6S1Y/OiLEg3Elg7kg1si/zXk+tyJupT4hAnTwHThtiOnMIeY/
	8w6cCcCO7+ZRyq8ny4wsp8/8Q+EhgvfJWXGfT7LYgXeulD2GitrpKLIs+W304tunQ8mSCBU/sU0
	O6GyhXee6w3y/OWr77tWwU//hSENX+181+2gjKC/vPcBWobG16bRLipWt141HS3UH2pNuXr2yRg
	8QrGc9uRrBVqhRupsq6/48RN7US7fEnIWq6Nc=
X-Received: by 2002:a05:622a:138d:b0:517:9407:5c38 with SMTP id d75a77b69052e-517fbe61614mr3716141cf.24.1781209013578;
        Thu, 11 Jun 2026 13:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:138d:b0:517:9407:5c38 with SMTP id d75a77b69052e-517fbe61614mr3715471cf.24.1781209012969;
        Thu, 11 Jun 2026 13:16:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd97dfcsm114395e87.73.2026.06.11.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:16:51 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:16:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Message-ID: <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-GUID: Ui5OxZRnEbME-_rHTY_2BQ2R1EdBCbWG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX2jQX5yjxllqp
 YmCZ08uGzuvlIOPW/1xizy0fdB4z0DJvAzB4V4raA+DMMqN0msnDdYDXWpf/3bE+GtCP3dz2CvO
 VTxBC3S6ZZMKPdo1nSkXMlrh2Sr/oyY=
X-Proofpoint-ORIG-GUID: Ui5OxZRnEbME-_rHTY_2BQ2R1EdBCbWG
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b17b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=nLTNWNGuSljmtZLY6HsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfXzlzS6V1+5Vvk
 n5ACFmRE5XvNSovTloS8tkxlBwlvOGQTL84abq7qABUGbb1enPoYxaEpEAgRgzo2GxDdZBIhzcX
 HMdGnP8gKxeXrpJGAWz0eLaXI+RHhoEcvBEPgrG9ROAdhAVk8kOIw2b3KsEalU+DPBhoA/q06Bq
 Kf5tepMrXVuuFEsTAukOQh3LOiUKO9nfe39iBwqF+W0uYXGPeV2rNFDMMrL9vhfn4I3hcR8sRw+
 dBrnX0SX+idaErxe/ENdr3oFS2SYkp0BbzJ5MqdGPw6XOZqVxVsYxj+I7yJoF7wn3WD9On/++Rb
 aBXkplG9jY0onXy0GoaHZhyCKF1ZlNr2eNmG/1VJc0huYADrGoJrNhZDf46qo5GGVybHtob7+3Q
 jaGP2P+xIRoo6Cu31RwuxoyK87fIzmvfsdbnkbMRNVPsqOyt7JpPw44ctEzUYTqfzB0fQIfYpWR
 qFygrcokABq1rYhIAug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110203

On Thu, Jun 11, 2026 at 03:40:09PM +0530, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC,
> an IoT-focused platform built around a heterogeneous CPU cluster
> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
> 
> Enable support for the following peripherals:
>   - CPU nodes
>   - Global Clock Controller (GCC)
>   - RPM-based clock controller (RPMCC) and power domains (RPMPD)
>   - Interrupt controller
>   - Top Level Mode Multiplexer (TLMM)
>   - Debug UART
>   - eMMC host controller
>   - System timer and watchdog
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 842 +++++++++++++++++++++++++++++++++++
>  1 file changed, 842 insertions(+)
> 
> +
> +		rpm_msg_ram: sram@45f0000 {
> +			compatible = "qcom,rpm-msg-ram", "mmio-sram";
> +			reg = <0x0 0x045f0000 0x0 0x7000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x045f0000 0x7000>;

0x0

> +
> +			apss_mpm: sram@1b8 {
> +				reg = <0x1b8 0x48>;
> +			};
> +		};
> +
> +		sram@4690000 {
> +			compatible = "qcom,rpm-stats";
> +			reg = <0x0 0x04690000 0x0 0x14000>;
> +		};
> +
> +		sdhc_1: mmc@4744000 {
> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg = <0x0 0x04744000 0x0 0x1000>,
> +			      <0x0 0x04745000 0x0 0x1000>;
> +			reg-names = "hc",
> +				    "cqhci";
> +
> +			iommus = <&apps_smmu 0xc0 0x0>;
> +
> +			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,

Please align on '&'.

> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +

-- 
With best wishes
Dmitry
