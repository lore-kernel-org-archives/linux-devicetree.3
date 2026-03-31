Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AF3A451F
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951225; cv=none; b=KchSN+pgXru2jumxxQUEUbeqwwawcA/qCh2xRK96QIHWhCNDTv78VZeuOB25S6dWs57Axw8nm8wGU4D/eOcEYAuNk1I0PzxOQePAEsJxFLQ/OFDleuRHOvrFqGvg9+ohGiNMNq7fLENJ9NFaFfZg8G+S/jAtNLqFI90dAKCk1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951225; c=relaxed/simple;
	bh=VioyxeW0D3rtXMywEXxcly1cgOobOmayFnNJNdPGVzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjLBb6QrTx/AAzCXENeBASaLbwyy2tsYir/DrbsnqT5y17HSpB+c3xiWTrAYtZShVLpnyJVufVnmprc0V4rpj4OwDlvo9zbN9N95nFMeEXOZqLwXD1ZxFWAJxLLbRRptY9M4OqznwuUFJyRnI47LmoRoqYXxPtej+FEJdYQDdHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFXevurp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yn2MgCiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFXevurp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yn2MgCiD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4VQtq4054054
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0e3aQFphquzOjRFJVGvhf3/
	JD/EB8IFSfQet6yYplU=; b=dFXevurpX1rnqz4mI1zfqGDdx8jPkVGB8b6WloyC
	lg+vEPijaU+1EivGWCAy0YaKTaOR0+USeBjSj6sUofhxCYC6bpeCV1Vd/HMFkIos
	1bINBvlwDUxLO1KJ1bnpTFeg7V3UeSN/lC5e9JCPLwfznWgX4pZL7s6oKnk1fHNS
	EnX6CEqill7r6M1ngkjdJbkvUThpRznJVsAvE04ctB80QmRYFTrI7Jkc1p6rZ98C
	dFQxoe50OVT7siYK5A8CPaf/jB4dqhMrPipFAxtgC301QgkDE9UYVmMQiLZ53pXs
	3zOXncxD9b9t1M4c55gxALsTH1WwXMszLXOEelgY/pTKGQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3ayp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:00:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1275c6fc58aso7053841c88.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951222; x=1775556022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0e3aQFphquzOjRFJVGvhf3/JD/EB8IFSfQet6yYplU=;
        b=Yn2MgCiDbQj9Vt8Gb6kpkykWR8xsCRcMqVxsTYvGxeC/lHAduHEWgIoUyTA10V5X/C
         HzIE2tQTbbaX1niN8Ly0dhRjZzh8ZUXY26XB1141IYDeSaEyAHzpsSJ7v+tKJakjB0Qj
         aFi2yXHdiFtbF1Qyzm4AE1Bzm4hQJDmrW7XWvbp9LFQEakChEtT1h8aLOUr2wZGGQ7Nh
         UysItOArFNIaK+Y87E0S6Reo43PR4krpCUgJpN6RXL1Y+W9nLccaVaEZds14KxolgOTp
         u9oYY7VgjlpiX+cw5kj/ZQ9rhbFkWcbw08BYQZ+1L76rASukHJCJGPiT0YkFwXmuSZar
         t94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951222; x=1775556022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0e3aQFphquzOjRFJVGvhf3/JD/EB8IFSfQet6yYplU=;
        b=cUWwC3a9fUz5BYdYXFY9YAfM6tF3Lsf2vtbvIoNrd772q+/NB051D5dgFygwchMms8
         euaVZKMw1uo6Fj32hfEIZuEG8DljKs4e/ti+SzqvhqMGfvDn1/5XpHrk99ncuAEOmNbc
         jb9tVpWgY12D7hZ6hOYy/AHU7vhC3UYZo1iFoKEfa1mG/9MwPdLN64fblIehRZeBDo+i
         uX8dvFC8wWheXZKZ92eTDEY8Jvtk7toR/aGW33XlCU8GYL0VPnty5d8qsBdW8Si+7kTf
         v5UT58VNw545qGoUVNdOCpQESa6twFDZYKMkx6ekz++ce6kFe/TsKOWIAs0vXBLFn3pg
         +pEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX386AYFyWd2+Z+ycaz/wv8MqJ+YktReuqIM6yxJsflAOySjE1ubVjkhOvPkDRWGcrqVirD7aMMi4kx@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDRJBCS+FU7SQfWU4lA5blfIPNTNmS+vw3CROwORAjukx/C/7
	anYvOq9eVoEtxnaG/wjygTVjkzqFr7pm9bF476ATIEartwCm0N2aWcU41A83KK3sSOANear8lc2
	iZ6rWUX25hvdgJ5ukMRot8/xrxQrbw2eS/iTLCtMER3/VEaMuheEQYsf8mGhiLSkK
X-Gm-Gg: ATEYQzwbi6bRchaU8MjQxFEYmmV6v07iF03QVmpgUCm2Rmwhuyg7KPnZDBShsdCIjD9
	Y6DV8xVcR/EsULwUAzwrStKdUER6bju+Xz79WEPfowvqxExIbOyXB9xo47EWqQIqGc38AyDMgvO
	u4VyFjsBZWrjsmZwkJpRZAXamKTt6pIQSytx9qj8rX51O+/N+P26k3uCw63r5mxjTKKIMWBFCGE
	VzlSu9Tg6gXc64V4iYzOqfpw/KhWbJ0zj65pSyb+HXO1DktkmY9t6DsZOyWemx3S2IdRrqxwwvu
	KfdlkwdyX+/K7yA5/k/lyGd46nFTUkHqwb1XXeinpRKITpffgaQqFnFXhQwdfziRaiKbEB/vOml
	QDsXDwo4BCltC+7SW5hvX56iO7yt865ip9BTQluAlVNyW+yKygdJcwVd8seqUHeZDfum0
X-Received: by 2002:a05:7022:eacf:b0:11b:e21e:5653 with SMTP id a92af1059eb24-12ab28cb63emr8441307c88.19.1774951219313;
        Tue, 31 Mar 2026 03:00:19 -0700 (PDT)
X-Received: by 2002:a05:7022:eacf:b0:11b:e21e:5653 with SMTP id a92af1059eb24-12ab28cb63emr8441168c88.19.1774951213980;
        Tue, 31 Mar 2026 03:00:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac09e3872sm12108788c88.13.2026.03.31.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:00:13 -0700 (PDT)
Date: Tue, 31 Mar 2026 03:00:11 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <acubK1ITm9r2pixy@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
 <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cb9b36 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P3UjBcrBE1G5PUaxq5sA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: iHYUd41FCtMpTMuVvPh4wMbjv_S4dRWM
X-Proofpoint-GUID: iHYUd41FCtMpTMuVvPh4wMbjv_S4dRWM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NSBTYWx0ZWRfX22I77r0XBvQE
 ghBLd6bf23Ady3gYcKo7PseR8zPQRQZIj2NNLhjEw0nIVITnviMlRs5N2mEE05AGKxIENQvIVTl
 Ei8uMlB9gm8bXm/cC90WRDsKFwXLpZonqBqodLwqWRjX/jvk9i36LhIzBx8xTjLFsSnUl7OyGTs
 LXLMAbGv97NE+jH5U5zcbRNbicL5xPANCz/bt6W2+phROCXjmTKrHukV6utQKNBlgHi/iuCSIyS
 8OyHbeSl+I1ug2DCHtoIZfB9oXR5U9YCpoHlKLMUIld3I/QUZYzlp8nuT+MIuJTSSuCr6g2QqdL
 V5r/V7yFAFaqiLe0ojeXYr8XgP3xjRuodbiUg2/htYkcBHNtXdPU8Sm+XaTyWjhjL4FZN4IyC4Y
 yGFoHpj5lEhaGrNaB6xYRGzTs5u49b7sCjM3NLNR40hK7U8/yJ013HP8twlynTm0zN14SlUI+Vk
 yimKTL2gDiqkfN63WGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310095

On Tue, Mar 24, 2026 at 11:21:19PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 12:15:32AM -0700, Qiang Yu wrote:
> > Describe PCIe3a controller and PHY. Also add required system resources
> > like regulators, clocks, interrupts and registers configuration for PCIe3a.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 313 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index bde287f645ee94116a489c55be3b7b80db3815e9..52104607a1713323fdfe2e7de710e38c1e22d06e 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
> >  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy PIPEGMUX */
> >  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> > -				 <0>,				/* PCIe 3a */
> > +				 <&pcie3a_phy>,			/* PCIe 3a */
> >  				 <&pcie3b_phy>,			/* PCIe 3b */
> >  				 <&pcie4_phy>,			/* PCIe 4 */
> >  				 <&pcie5_phy>,			/* PCIe 5 */
> > @@ -2360,6 +2360,318 @@ pcie_west_slv_noc: interconnect@1920000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		pcie3a: pci@1c10000 {
> 
> Incorrect placement. 1c10000 > 1bf0000.
> 
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01c10000 0x0 0x3000>,
> > +			      <0x0 0x70000000 0x0 0xf20>,
> > +			      <0x0 0x70000f40 0x0 0xa8>,
> > +			      <0x0 0x70001000 0x0 0x4000>,
> > +			      <0x0 0x70100000 0x0 0x100000>,
> > +			      <0x0 0x01c13000 0x0 0x1000>;
> 
> [...]
> 
> > +		};
> > +
> > +		pcie3a_phy: phy@f00000 {
> 
> This one too, it should be before PCIe3b PHY.

Okay, will change them.

- Qiang Yu
> 
> > +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> > +			reg = <0 0x00f00000 0 0x10000>;
> > +
> 
> [...]
> 
> > +		};
> > +
> >  		pcie4: pci@1bf0000 {
> >  			device_type = "pci";
> >  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
