Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB735E926
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041526; cv=none; b=OYta9UR8kCdJZnjf4cYnI3xCGF5aNaIV78sjzZ8hk9/MJElRhBDKOFPg6gncs7Piu2CxdUcEfCm7LqDtWF4NfXZ3n/VR4/WnN7l3c7GZXE91w0xibNs4tmQ6AIUueQtJkJqL3KpZE3LRr0U/BxeiYXwzJgkJOVs30MGdbqKqqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041526; c=relaxed/simple;
	bh=xGnD7yBHQ+nLtVK6MSzRD0aOKM1eCs1UBQP5IPYsJcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryq1fUi1OiTSGATyPO25krbOwx/dqdOpAexCJ1JxmWvGFtIe1LstNjoi9hrMKW47gaRnHovCZTnwKuz3K807Kbixsqt7TwgzhR5w5Q/evprP2jVkykhhX6g1WLoLlgZ+NRH0TzQiGkCSzxTkTyP6ICc+o0RRYLF9G9SGGUMHixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVcA2+Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImyCPieG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVcA2+Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImyCPieG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HD01713876487
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lF3/2RUQuRYMFEAVIwRWtW73
	IO4hVQVV7I19wPH93XE=; b=GVcA2+Ub5pG5pXpJrE8DbKK6ExSfW7+aZ+zIInGk
	ow6t3kNJ+7lu2BA542LYfO0ixTjYbaZG8ExG7fS8jeZPBTtlLxHAinETuh9WIwCE
	Kux6xv9FjTGjm3OR3IKmqeG7saaofT0rLw0ORGaOzcIhtF1LXDxU2Sn2BND4R132
	tGy72AAitoVJWOlNsRlLqqQ0Lw56G0hEQW+N7vgeU6kOyAWJqDGlZuKqTM+F2jYJ
	slOPpqpoRjBaPXaYB8cwxgaq76FIkENRZNQZfXSGu/ejUMDBdK3tsrhlxTrg4oal
	/FJNAgZdQHFG/r6RmtxURkThGD5iViWoNKVlgrns5McnMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj7ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:12:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so44038041cf.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041523; x=1779646323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=ImyCPieGFRNdylhhnLcXWiDGMiNPamob7x8K4+Rbtz8RaswxzWbgOyHmF0OahHKXIX
         3isw1EmgOmDjlL5BugVK3KXs6+fg9gB3iwNL0GmzeOuvrlIXl7dQqMf5sLuej13wM33+
         cJ7WiOVFWUbNlDjzd9O4wuRUXq6kPML1P4c0iFVap+zOIzfJ2Vx1YTw40RuNeAYRq8ft
         X41VJ11+8mSlfy4VEy8r9mmTn1D+zDg2QzwTL+gTZXYbjPiuggy2JmiCPi3T7l7+9u6/
         d/5OsdBu6vL/mTz2fPMxsqG8xZiPad2MQIor70+rQtLd6vqwXmauMSOZ04nNTsoydHtJ
         6TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041523; x=1779646323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF3/2RUQuRYMFEAVIwRWtW73IO4hVQVV7I19wPH93XE=;
        b=j7/5MK+CE5KOUq5qVo9AizozXpTgyBvSCEgKWLbUpjzmSNM/Q3Bt1e9taNbT+Bza/V
         dsTsCHVH62DxB7TKTZBs+7zwQWqyqelAFrh+frvsiFcS7nq8u8HFunXWtr8ePuYhXcwO
         FusJd3rfVOPEp4Kz30NmXNh6GeFKSudCUyEMq95mF1l9bUMElUmXrSI2dzzNTNlRNJyW
         AEeS5EFwbmcJlehigJn7zsWywhy0YPl1qY8es1XfSZ6LBnKmxLhiidWV++galjC7x83a
         CDJUEXrEv10EBqxCVXMuSu9mGtWzg19IUxCnZXx8a9XfyFkPr6W4wjl+Hz8YCJarGdIY
         M/xw==
X-Forwarded-Encrypted: i=1; AFNElJ/00vql7APlx3AVl8Rftdhkfhl19bYTkq1Pe3KsyORGFhse00GV6WF7FQIWBORgcT3tYPl/+AEyUhTR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5CegTIntXkb+plRh2K6ToFEPjl9djt5a7s8+Vr8G/WzOURNR
	d4NkVYmZRpmdcLRNVwvTrV3ilKz4Nmi2oItqZCzJldfDG+0obyJv7ZUjSKtFqnV921+EYLn+nAn
	YHVFXrjKv8746JTQERevghefw/esbh+nX1jb75vgBOxskefaonWn26FQCiC5LMDLB
X-Gm-Gg: Acq92OHRdbXrT8ji9bHWRgwtM5YdwyTLB1dZwD4Fh4mT9nbaaxqL3f9KvyX9oHR40dp
	h0rhurhg09Cz/KxbhOXPr3s4IXYhAN5l9gnvK8MLkMj4IhMlcHRYhDgRY/lPtvOWb95UpLZpyvT
	UM9h8b2eJzXRVqeN/JWP0WHmY//adyC7n4+YvRypZgMxEUb6NDFqDEutjMr8eE3AUPQs8nmmtI9
	DiOIJYhuhCV32BssqY0hKKy4ZrYXEbXuGNFihnm95Pr1vr06VN+pREEyjUfkrfRxuBqUZ4EODkA
	CrDnqQc6XLiwA19zBwlrC3uk/zJgDX6cn1S8IDZpoC/KOMxcIRs5FMhjsc5JOa6M1bA9pZLVpcY
	i7FPAUsHQ6kTf6k0Ecf9HYMmJSAObyKYnmv5vQmr2DRcx3j9FuI8KqlNAWaJIAVxGjUcOrLuZ4j
	PeLvfVi7Tmh+6dNy1THbev2qH5bgyCoZBcGiI=
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111951cf.53.1779041523235;
        Sun, 17 May 2026 11:12:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8cf:b0:50f:be4f:465e with SMTP id d75a77b69052e-5165a25ce43mr184111521cf.53.1779041522805;
        Sun, 17 May 2026 11:12:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b6cb8sm6721051fa.37.2026.05.17.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:00 -0700 (PDT)
Date: Sun, 17 May 2026 21:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sQ4R6_i7a0vwQOJoxB-XWTCHeArmfT1b
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0a04f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0_QClZtVb7ToMYl6Za4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sQ4R6_i7a0vwQOJoxB-XWTCHeArmfT1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX7/xnUuoiwtuh
 1iBjnH+9/Ed0pqSnlBCcYddwoLrjCOcWlycZFfMYoon8TGx3wHRde9PwA2PSv3mvnIOAPA4Un+P
 N35KCXZNKVhnWOCkNmOSYjumLGrm1t7ejkjPs93idIAS0Pw9PCThqOqUQc1zbvlBR0BcYhm8z4N
 Xel3Vevxcb2FC5Vjrqkz9QXO+EgMwtUjlIVXeg3J2yT7pEgi8uq2zKSalz6Oopp/NnhhAuCgk8g
 WtXj+1s4jvNcTlT2aW2ujTL9JrEOoCpBGgEhuu/OLuz6sHuj/sO+/t+/32S4g0x8Tuv39nweYLY
 ZOox5wV13O13FQBLdsnyCJ/+LVgZPI3YhMIboZSDQhE1SLqAaSWxiQhYV7PnMROnwXP+J28qIjI
 LmZkByNgtgAdob4Ol/YCzap00vbC/LP7WI92rGG6gfWRRybYsMywr2FxcbUNrVaFkkDCarTw/CD
 ehGNw03UO61rRMLWtOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197

On Fri, May 15, 2026 at 04:51:28PM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",

I can only assume that it is "vcode0_iface", "core_iface" and
"vcodec1_iface".

> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
-- 
With best wishes
Dmitry
