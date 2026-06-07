Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98B2EEE76
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828157; cv=none; b=JgVEdV+IU8yeVBB6WDMD3XuXQOXltW+QvapYZhj8y49qfEnlGrBxgm4OBfJjnP5RWtEBJ/b7o+ggRNln204vht6pnK2XTJYylLSGXyIviQTn/azqhrNYtzZyghf3ygg8/p2jwqSMfvkN17M453Dc8INNv/XNdYZcDjHwpkkfurg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828157; c=relaxed/simple;
	bh=zpGAW9tYCes4jygC5Ch4v/XC2hqs2InqXCOcVgv91pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agYec+9traOqb7ut4KzN6LGHAo6qdigDRTbR+bEOLVKlAX02SuOeDbbAwcbJT8NXc+mTkoPmPwQ4LpMH1S2r9Guen3rTQ9TYlh3tfk+lmRmtb6uc5oqw2X4ekFtvvE9iZNAl6TTp0wUFC+KFCvB2yifn1v7dvlE5tMUK+nNx86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAdl/Bdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsK197E6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAdl/Bdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsK197E6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65778nTF3720581
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 10:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maV6ymIW+tN4bTb51Mh37tnM
	ZGwL9fhMtkQZiKNq0Jo=; b=ZAdl/BdgOqdteeXLfmxajMSt2D/VX4kOEy74z8B0
	6D0WNqWQkwPm29FGw1ajGny9GPfwk2CaPdfxWiMy305DMRPP3O8VL4sHVm21GdY1
	j3ztiO5/h/dy7JdxePkj/6GDm2h68tBggF0tgmMoiVLOr3i/iDy27LqG6wnMsgIy
	Vz6o25g7QfSbt8tTp+M/jtWfiYUiMujM+AG3Ut+dZws1utS53H4BXhk+46mXUD74
	Cf9DXCteW9/7WMOvk+Wp2ehIQSFrW3yTQk9WC9JT7XAn6cEGFORvyspS7sDv4rFr
	ZuulobkEzzV98XTTRI5MvzDwi3GLEBgshjkcHjQ8JdOnFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cv32e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 10:29:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfdce65690so1216320137.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780828153; x=1781432953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=maV6ymIW+tN4bTb51Mh37tnMZGwL9fhMtkQZiKNq0Jo=;
        b=JsK197E6r4qS0QVVJsRgFp/dogX24+Zo1EQxHa7Lxqv1vaRx1d7SipJ7wOQjPU+Nzb
         sArKlewpj9rg9bAnzkN8IUOl9A9elBLs7DcdC6UZLz20X1IPL/3n3SwFRMUqdo3jap2m
         iivIqpKmbsii1bXqeFQQLUY5H54SsQ8AUlmEOqLwo5AktculeWY9gRLt6mt22CzJSGk+
         CvFvjnjNoBJqE+s52MhxwpFBqxWquZUAYXqh0+RNShLVH1lJzTNtxTNPVfj/nmLr+D8q
         5bAApUWS7kSEcbudT8x9/yLUsVpP5MKMBhJsKfzwdAGQg1vhaNL2E2GVwEZPm8uFhaGk
         +Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780828153; x=1781432953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maV6ymIW+tN4bTb51Mh37tnMZGwL9fhMtkQZiKNq0Jo=;
        b=jHR6U1XFcojL4shZGfZEyOqoczLdv2M9phgYr2+bGZjz43YzPKqP/hLGuNuqmmokrE
         655wDpffb7gw9sLKSTwfGGVq545bmua0DP+SGJWnK8y8b27giqYaclR3+hDbCO9g+l75
         y62wsuI30I6K93pJBUJH62H1vJaEnZg9fnmiH4O+k3vHKnlF24NiK+9K+KnB45TFvxc9
         q5amcT8IUlWa7ZaQ40MUbMWG+UI/Ncn0Lq1iNLEIjrxDI/88oRJCqOopby13wGO26mRe
         p6efZymlTpCI6DlYnnuURb+TmN2irV+DF3TxkClR6Yh3+IhR9/D9B+qbP8vo51CsYl/p
         1lfg==
X-Forwarded-Encrypted: i=1; AFNElJ8RnOcIyx61JgULPNmcSyeFehSNCvINCwZojtHfSuEubdWvAAiUgPO0RC0GXueW5L4UI/pn9g8+Jnpv@vger.kernel.org
X-Gm-Message-State: AOJu0YzHI5UBNsQ0oS6Vjf+vaST3C/MEXAy9+52xfI4o7bE3mJ9pUY/h
	O+0NlqJ/DrKYTU63Ess/9fC5DGjihUOPkkBPSh/Vl5DO0Bcmc7Ha2veZwhQyXVIsR3Eq8miuZRD
	m6WoVnJSgO13chxPISieJMfEjyTo8sXinkWETg2CS+np3vSV0mUmXN+hZzKw6Pi2p
X-Gm-Gg: Acq92OE5g3s0ZLAPn2SQNkmYlyICcMmLWiEjyzF6PtSQDlI74EPJQxjqmQ9n6EXJZz6
	LXP0LyaOoNgQFIvJH6GxUdoOLHN91QII/+kPcA89kXRuQ8wPxOdjbP0PkYuiBIpKv9MKGD2XIdj
	QeJJQgxSRAu6pTt/KeCl2tVaxTCTloAJ68M/pTE4i/TlPZHpVMv5OoxJf0CBtzDGMmc8do40IEt
	R9lH2EteZ2thfQqm4hdBs6c4Q/Y0e9I0JXdyT/y2ZzOVJTXZmXspiIh/jQPx2Dtas12BOe9gBmb
	uvOtQ+TVjCbhLPoM0+lSfQG8acT6RzZZzzDNmCPZekWjHeCptpq1RDLJlUGvPGv/1W3vK3EyGHO
	5iYad2HuaQx89gDBHBZQTEx7lKn3ppjZRSHWYOXKsxdsBmWWJg4+FnQfa3K5V6t0rIuZ7MIgpK0
	ElRr6Xlc2t+l/XLE38JRkakAgmmrKLveKlom7IKPScZcBC5A==
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id ada2fe7eead31-6ff156acf6fmr5264033137.29.1780828153516;
        Sun, 07 Jun 2026 03:29:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id ada2fe7eead31-6ff156acf6fmr5264023137.29.1780828153136;
        Sun, 07 Jun 2026 03:29:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed8e0sm2995208e87.2.2026.06.07.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:29:12 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:29:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Message-ID: <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMiBTYWx0ZWRfX22miXFbt4xFe
 zdsP/GBd7j48flM/msy3TiveVlMyf2C9enYpm2ZVvICU9NhFtJmAjoGaIcsyoh5fuoRRth3DZCg
 QHKaQhzjOX4MxdgSgeTmtrWcNbsUluBW8qfv6V+1Gea9Hjzx5FW9SX2eoTppAhuGRT/65cVfWbP
 T50IQcQc2cZedb74On2SP/LtZyzKDw2Pu/vDh0eOOXqztgYZ/4dCHPUGb5pJnVcejyKhzrkmppV
 krq7SYIw2FYJCfUzmAPRs6whB30JcwvTKpR94WVBtvSkGOPyLLNXcie7c1ozA7DamDrNJRds04n
 s+pc8U7iIRTC84A0/ACV8dZrqJJBjDk0Yn+/XNDrvez0W1jq1gUHqjn3K2DDSGlc96zx2C5INJ5
 edfEmAnrDBIHr5Z+zGjl4UqcEh5tyow2kVRxQTL0OEjwe3LnaHyjLhy2umC3f9bj5f5iuM7Vfe2
 0Lj5wPArjaHs6NcbM3w==
X-Proofpoint-ORIG-GUID: -rN9sh92U8L3uOZU5Zsy59mVgm2JWk0a
X-Proofpoint-GUID: -rN9sh92U8L3uOZU5Zsy59mVgm2JWk0a
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2547fa cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=M-jGJTmE-ygQmRKCDXMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070102

On Mon, Jun 01, 2026 at 10:59:46PM +0530, Krishna Chaitanya Chundru wrote:
> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
> configuration with Eliza-specific initialization tables, and reuse the
> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
> 
> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
> definition to the PCIe V6 PCS header.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
>  2 files changed, 140 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index fed2fc9bb311..257b4df965c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
>  };
>  
> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {

Thisis exactly the same as SM8550 table, except for three extra writes:
QSERDES_V6_COM_VCO_TUNE1_MODE0, QSERDES_V6_COM_VCO_TUNE1_MODE1 and
QSERDES_V6_COM_VCO_TUNE2_MODE1. What are the default values for SM8550?

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xb4),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x24),

Other than that, looks good to me.

-- 
With best wishes
Dmitry
