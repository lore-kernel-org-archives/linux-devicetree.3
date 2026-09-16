Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92137AA83
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569602; cv=none; b=CPadV+MnvrAdYVA4yMx2znZbL8EX0hkAXN9C0Zt3j+4k4pwSUCI/VrcN1xNtdOgs/Y6NgtpIBqG0s7LYT7JdcIS+7UkwN5F0sSdOyXN9bEFHZnPb2Jl2J/wWjYSF2JyWqHoM+W2sXIMySUxabKzoqHWgn8fNyRuOaAZI/hH75Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569602; c=relaxed/simple;
	bh=G+np0cc0It8i302KUloDocttjC0x6BgQYbU+cAG/nt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBVXNnAfraoUtCqdWh3PdHCkSzhH2h9XakqPZUH7XT5UOxCGos793RwWo5GGD9vH5I8yvkV766RgAZ6DXepkzLS9+08S/nOe/S4LCyIgjbJhW6pU4cTLSpIYuTf5zUspuLtFhb9k/ZfZrw+97qKyYHC9qrgoQk1lBw0La8sZ0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmbpbGf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDZ6k1F3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmbpbGf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDZ6k1F3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYe8C2955871
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0oZAvYtD/3whDsCwaeMTxLwk
	6ROtRTkdevulCwSPy3w=; b=fmbpbGf6d6GKMkaSfdm+GsDbA4+vxi6oxOUStNxB
	a5CXoDbNwnIVIK8GjpT78iyZqM1N4LYRmu6tcst4CyETZENTH0+4N/xRBleb5EwC
	AGPi7jhmo41dPKqiz6110CUg89EZxbrCohzXClrRo/2t6S1gvbbfAkXo/WNzt9LU
	nPHpuZfiLEUlmZqRZsKR3RGqXv4GDwXR+xv7/ePF2hgy8rfk2adv7LZ3MictB6fm
	s7fwmr3umQgyGkoo9rwLYOf53q4NPFP83jmYqa6mikJ2aXCYJ+khY4YwuhUVHrAs
	CsGltqHtTCnW4v87EakeM9UDlzFuXwK3ldiXQUhHExcowA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2raen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:40:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so4697354a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569599; x=1790174399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=VDZ6k1F3pRgvZpcxW3VFXlXxgzSO81RwsB3R1Pkb7bRtuKO9A4Jgdf074bWJWx0WLL
         8BeZ/lDtv5Szzk28pIJa9+CZQM0HXY6EgOX6xL7R5wutyXT9hWRK3kgemCyj+/D8FEBy
         /7OxRCxBXErsHbsYPOZHjomnkjNI8Ihs/g3T5K9Hj0AeGrKELRrbQmLRciemR747dGyw
         8fPEk/ditzrY7+vgJ0W9KEI/wuY1hJD5AYssZW9DgdqKYD53uIii988pCKFiO4mGacpB
         XHgrXEua/2mjGG8IKRAferHxEjzpq261IO6BRbYNx+7yHozrhjRx7sAEo9saREpSujq9
         bUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569599; x=1790174399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=slNxlIdX1nKVNzNHTAuKC8opAA+Kd1Jqy7Jfa+YkNsqvtg35pCzLPxAdGIZmHraltA
         ubPhumNA/yOCE0Wup9RTS2LNlpNs/5xhyGLylSLlvpBej8+jaM1rbTl4p1FqU2WcN3ls
         npyH+HhUnK3A1RpGfKo4mNT61mSQQDzFB3aUhHpCeKNHhVp26BufUY7IdwpiaqRVOpgk
         X9uA9Y6MmfPaUSWEaS64nvxVYx5D7qoOvlyc6StOcLc5ySNv93TP+/OXMgmBeMgAXQ4B
         fTFlKzkl1FYoB98O5khXbixxAuBc8jdu4e7Vh9oeYWM6qTkUA7RKEY6p7u5kCHNP4dhY
         LQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwCRrEhjJCPR6CKyxec/XHDvxyPGFyi7viM7sxasgbTyTODx8rt9+gchcoGvthgXkKlESyl+v33BX3U@vger.kernel.org
X-Gm-Message-State: AFuF++mqx31VksLpwetqSHpn07m7ExxNJmy/vJhSlqe0N/a0Ns8/C3Mw
	WyB2b1zvxUP3js/zKyMryO8+WaVEsNwcJKnbu0WjAzj7lSqGMNCsY12pILN3sumRMI7DVylydZL
	FbEX91o0E5+5ROCy4HogvBkJwtHQOMIQckUGhpodNmUgNwxuxSN7NAc5E3nUCq79R
X-Gm-Gg: AYBFou2t5+yXSAaR1MKbkStUj9mAubxlhPb7cvgBHO5Ao5wlGKAvTNeUEexQ0TqoMOh
	DNTTcbNntLXd0dJrWs7Tmd5RzgBhmaTrWI6IY1zgz9D5T929VAZKMWclM99huG6m9Np91/9XPfE
	HP32L4Kn7+WjE4RKBBtEQHY0ISoYJvtOIzc+og3dMfvWngoilL04mEXcQv1IAzdN2610/tF2xFD
	8r921ttw6Ame1fOYPYvFbnw6tD5w1hwC1ySqKzfmT5mpuFNbCTlg54j6hiEvVLKAck0FtqffdgW
	g9IlknP805rpJBJ6UbPSM7voUm1yR6kE28eFlahrapXxKfF2jyDfbZ+g+0s7s9+vfzR3g5gnS+5
	l0F8Rg56/gFZwHsPalLUAMaH2QzN6iK8C3s3g+dfHtws=
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229561637.21.1789569598970;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229498637.21.1789569598494;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aa9b03asm1782560a12.2.2026.09.16.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:39:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <aqqqOMS6QL3gxF58@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
 <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX3Otd2lH3VtSS
 bwcopmspz4AI7OMdVwWuqV2Zvg4pogq29ZEKBcKPKY2TXGv/TUjHdPJOREpMbESigbz4JuZkzY7
 35UBZAceL8iKhHxsSMsS/HhrV2c5Zpk=
X-Proofpoint-GUID: todZWOd_k9BDtC0IB44ymy-Xz2RNenNz
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaaa40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SqxCJjNS5mIqFQWAgecA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: todZWOd_k9BDtC0IB44ymy-Xz2RNenNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX0BsStiaU9k9d
 w+UITUJjxN8ZgkXd4A6uJywmWoaOur8aCFPdj8MJujT43x6A6lfXJbZ/V7Nv911oXekO5dfs4pc
 zOAQ7nfdkBb1bCL6K/YfJtKI2lhmjMwQ6U+KVpBtq4FvlrBtY3ZRAzYnTtJ5V3e7cy7dlx6WG9J
 zWKwGltuThVrKJh/kJa8ek/dY0b1/uPlvEPSS8gmXraRq65vFOOEVMgT8kke5Rdgw4iuXDRfepW
 CchzdSGqmk7G7Wa9+5/pd26q4BdzyZ5Qu9TEOlswqGL8mqxKAtHiIKdLYoJJ5Q0cjRLpQsUIM6o
 q45RKSrsB0fu7Y7V9POwIpwj+E6/t8Zlz8cqyAdzP10pxtrfCXFGY/pf0M1i6CPQoy98DN5KSgy
 RMi1rPfQ7TaXM+tfXiRzEHni7lOUPppd99Bb+G5TgAFFSxbjvuAb98aNLI3YneT7E/FXAa6hUFG
 c8trhHj5MSz3DAoK1eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160198

On Mon, Sep 14, 2026 at 10:33:06AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the base nodes for the three DWC3 USB controllers. These carry only
> > the SoC-invariant properties and are disabled by default. The extension
> > for the embedded Nord variant and relevant board files will add the
> > platform resources and enable them.
> 
> [...]
> 
> > +		usb_2: usb@a200000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq";
> 
> There's also a hs_phy_irq @ SPI 908

You are right! That means the binding for "qcom,nord-dwc3" needs to be
fixed as well. @Bartosz

> > +
> > +			iommus = <&apps_smmu_0 0x14e0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> 
> This is a suspiciously short list of quirks..

I will double check.

Shawn

> > +
> > +			maximum-speed = "high-speed";
> > +
> > +			qcom,select-utmi-as-pipe-clk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_1: usb@a400000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a400000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 919
> 
> > +
> > +			iommus = <&apps_smmu_0 0x15c0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_0: usb@a600000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 131
> 
> Konrad
