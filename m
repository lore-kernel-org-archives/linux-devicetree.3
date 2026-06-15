Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2372F8EB1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509175; cv=none; b=ti55s/YUWWhAkArdkRE/FYzUXZbob/tghzBh3buinWt1U0kbRGxE/+DN09uig52XF7p4iAmX5bOxEhycvb45bzLqMAL2ziHNyQBxDDUCq3qef0+zitIjmnQIp/n8D3vZF41HaDRMRQ+wbKtvdgCGkYG9aHnkQ2AeupUSmqyaeNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509175; c=relaxed/simple;
	bh=bUTD83Pf7C+H3yrldiYUl4te8DBkzpoeq4nNJbvHMsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZdQ0mtrBMw5/j9GreGl6vObYcn2ySVzTwXqkIo3pMbWqmWXUmcIz5kmzTixqSMdUa3LTsSfF9yv4VvJXdkrc1XqJ80rBglkshf81ZNG7htzFZC0Tbpweo7dWh+QpqinqAkMRc3IQJD/hyjiepWIv1Hrq+6sOqbP2YJNOOyfTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKvcTkAT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyxMkTub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKvcTkAT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyxMkTub"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1CS3327542
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZp2CdAOzWMP9vNOOQFjfC/K
	5baWaymmSjQGLpC8WcY=; b=ZKvcTkAT4GvL5Yp5yQ68MYwSnHMLSIV4+ZgzzPw/
	kV6yJSNcbvOabzoUO2gowjOWsFamE/su+n08PAKzUBBSK8ev/KORO4upnF6IuO5V
	v7nfFBe+cYK6eGEwIh0nr6E2u1XPPFPy70l141hewHPUAhmh+SrY1nJM84FRJt9e
	qgDDJmqOfDCLBoJajA9LpMW7Cr3py5PDmAX2jqHotZ+OEfQXrGE0J/uuVCTEi54X
	kyYDRYQsxByTd2VF0NGkeL2/qmxex9Ey1mbkhm4/WkSR+kUZiAZSsR3evr1RJ8Am
	VaF0Pk+hwuGoykPBS/pi8AwGXlyPQz2s9LhXjvSzXUYn4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgp3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:39:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2977187a91.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781509173; x=1782113973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZp2CdAOzWMP9vNOOQFjfC/K5baWaymmSjQGLpC8WcY=;
        b=GyxMkTubtGcwPtiinlMuCSgPDC9cCf7z/JjVtLgv6rwvldwa62VwYR0EHbBp5vTRmM
         Nn0tGj0d3Jo0XZT0c0Ptm1AwCc8xYXXAA1rh2W3G0p8C1C05FLd/8Kwzjt4SbQboO/3+
         grHtVflgRBEubeqwHI3sji/gZX4QXBVq+GT4pPnA6wiF/hBHgy0bd3VYe9rDUVrlrtVo
         L6prHE4FY0CCzB4QgUYayx/skB8Eqf/iFqFiAfeqgsnSdX5qxXDXhR42YpeSN16u1q8z
         ZepvFyi2Eg/O+SybmUGQBViUwwUtk4y8aX0qOOIY8VTxZ4kdLSTFL8sP5nftZnrkWS5B
         SgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509173; x=1782113973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZp2CdAOzWMP9vNOOQFjfC/K5baWaymmSjQGLpC8WcY=;
        b=ZXuJZXjIKPKXlLiFcG07Z3iuXUGVbnef7PX65VnTh15PzvjtFTLAT/bm6j1oP0E2pF
         M8x6Rn+evNggp8cwrIX2UzGnEmgUBUn5bRjWZ5Nv9brWJJWhANpp/v0pa9NQfDJ7r45P
         nLbXtvPUG//F7v9fXzZhRfKxwtWEyYyxtT+XR5ZNRV0eMbRjWkZCDr2sQpYOoGdo1Pjk
         ju4W1zhuVXqIS2k037tmejy9pvi9XRgZYJLBxsFd0MLXnZ2sQSHUH0dOiJBS5Vv1C4hm
         r6qVJJU4sEd0kJitq85sQ6ymZ4hFC3/xrCsDdEcqmZxsATTz5CRm5sDIVJmOeIN9jleq
         cD/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8tDVgHokIkFgeWPS6suF1aSHPsAgC+gcpOGDWLwycRtWJx/5+KB0DpgL2jqC/O5YoRnttwD4CETu6m@vger.kernel.org
X-Gm-Message-State: AOJu0YzrS6fVhjfFhaiZkOkLDCPplCqXghzD7RmM/7lih/J03Ef9cIAc
	inHZ12whEITUZE4vbGTBvBpbn2B5E5aMA+JcQxBGnPZyZ/n6U0NQd8CzLg0sIMzTV88UwBT3jBm
	eAd0jn8m3grLeThxV5ag9L5mV3Mv/h9Ixw+zVkAqunwoJQKltATFa/V4TovWEZ5nC
X-Gm-Gg: Acq92OHs7VCZ8bwJC/ka5jiOlgkT7FF9gnKBDBZL+C2ikwzR6yGRfboiBGtm1nkofFV
	zFzFNFBWGb9z5s5wW7K1bykYUxfmUVC5Ujl6UhK1eWY3Lms/ztxXN40DMHA/snhzOLT5JZAWdXJ
	LBoOSTcm5Exs2KT0ZhOBphKVPjeCbauneNu3QWnlNt5rQbL3ylG3Vsu+s9+CZmvxt7qC1bZnCup
	SHc8K1mPtqChF15/bRWg2Ik2ovSMoqXEmPHs4ZV+tXhzzGGUf/MLowQE2QIr4j2T96eqVRpIBbB
	mRi2WRTs7DGr+7d9R+O1KYGVAK5jZjIyXIW2/0UCsg1DvSpEn36lXm4QMd9Xrm5sxjOethwtEJh
	BHmPNy/v+6M22BICeuh+xr51+U7Jl0U7E3aIAC83hjiLRqKXFUQ8XHGm+
X-Received: by 2002:a17:90b:3f43:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-37c2bd7e8d6mr10389168a91.25.1781509172676;
        Mon, 15 Jun 2026 00:39:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3f43:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-37c2bd7e8d6mr10389142a91.25.1781509172228;
        Mon, 15 Jun 2026 00:39:32 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd66fsm12016278a91.12.2026.06.15.00.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:39:31 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:09:24 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
Message-ID: <ai+sLLCjdWQt3NOC@hu-mchunara-hyd.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
 <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
 <gq54nr2bzvvqkocphvkji7g7rhbsrngsno7gvsfl4nsfvakj2a@wsfsnohrnscm>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gq54nr2bzvvqkocphvkji7g7rhbsrngsno7gvsfl4nsfvakj2a@wsfsnohrnscm>
X-Proofpoint-ORIG-GUID: DnC_uaX5Bjt-5cQQx80Elf46CxaW8t5w
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fac35 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wlKiXeHTwYhgOVykP0sA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DnC_uaX5Bjt-5cQQx80Elf46CxaW8t5w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfXwphntDRsMbeW
 kJNv/5a4lbTRxOY5UK4y414vrcxGm8PupQQIDakZRFe982tjldhKhMm4o7cEPkzE+3DO3zXPvuW
 xHA0Vrs++sv+VhSyaXbzXeB0BVSWA1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3OCBTYWx0ZWRfX/Eep0tod+wsh
 q+w6FCAdpyxR9uI9jrDLKGCZF5XfK+OZeTkKVxXr9Y5luR/MrhJ2dgeoQn+qPNHEavTqKOQBO4O
 T17pXwo5sIDoCs5B/8oF1ayrTZuge7V2M0MBzBUZPdkUZD5SDa25dZrFVNpEVdKQ1Lt2/oXIg9v
 rTk1koBcwcgNE1ZzdzFx/zNPJhcyOuwIG/JgNbo+uAioXVztKdeL9d8pEPIlz3Oj4HM4UKyfoEh
 +z6+4NmjhUm4WZHwAq2CH0oQoiTN5A4cqxeHR5qcZUCxTI+e4R9OTbbfVW5EOssvHdCk0YHZezs
 +fO47OQzMoX0mdSDLyVo7getVgj/8bX+XGSDGLJjp4QIJ5CYPgj/dI63UVREZmIpTNsldeLixHu
 z/qQ2eqXT2IQHJdWfFm9TBMW38lEtelIH8K95OLm7QeVee0G3v+QYhn+Lh+25QD/bDwCHFv4m0K
 CLdKqaNJCbISf1y0AGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150078

On Thu, Jun 04, 2026 at 04:49:59PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 05:50:44PM +0530, Monish Chunara wrote:
> > Add support for SD card on Shikra SoC and enable the required pinctrl
> > configurations.
> > 
> > Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> > 
> > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > +					 <&gcc GCC_SDCC2_APPS_CLK>,
> > +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 
> Misaligned

ACK

> 
> > +			clock-names = "iface", "core", "xo";
> 
> One perline

ACK

> 
> > +
> > +			qcom,dll-config = <0x0007442c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +
> > +			iommus = <&apps_smmu 0x0a0 0x0>;
> > +
> > +			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
> > +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> 
> Misaligned, make sure that ampersands are at the same column.
> 

ACK, thanks for pointing out.

> > +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG

Regards,
Monish

