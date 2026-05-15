Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0DD4418D4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852494; cv=none; b=AsrBJ6W9nwbvPlye5o86XKT5RfaCutRn3ry4ATuA/zX8Az7WwLk/0u5uGXzk3PARbZz7xPtSl1qOuyLiTfqH1cfcQwwXmXP2gNwSCnPeleiV6bY1uvkjXNQxjFLEb9fjI83LMl++fV6mVog3KhIgInIoPTGpbIbCQoC/JFqMBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852494; c=relaxed/simple;
	bh=Xca3zTfFC+/L0b3Qs4KF3SoSlqcF3G78HMCT0x7AErQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6MEZpk6OMxYwb37D66Q7jr4C9VmqOtbEHEdvmIqDEkvBc2PgkuHmUfgGw2i918+ghEyBMPJDnXf0GvCN6EQpWKuXx9hit5r9qMJGDKva4Wm0RWrXYylv/GmIrGgxrCaNQDPSGvHrPmyalfq3nckVZrAFPv6304A7esFUKsuh0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejnM0Lhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdHObDIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejnM0Lhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdHObDIQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFvx4654865
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/lAJ3Gn4qJTi3DJUhsJ8KW4K
	gVduivDK93SE3yus+hQ=; b=ejnM0LhuJYAQ3IsN0AF3w6hpOBOEzEKs0brM1LTU
	R1vepMqPr/2v6CIynKZ4CL5TSMjaEq6PnSS/U6lVOBEDFTODU4ybkL8w6Q/VAoeY
	jH9wnhLAcnubOi4pMApLibJ/cPPrXiMYumYJ8mN7/cFWVprSc8LRLWo+aZdeoQA5
	g1tuUBlq6oJj8kzzrIKYEVQDDAo2720zFVgnWPdYcw46T0UMOLYoI75WGfeLveOB
	36jUTtUBt95c8SuwqKqwTuHusgjoiXCcE0nK1WjRpajt4qZknK1oiYb4r+DpEMSH
	mvpzLrEYp7jRJKfYj3BUY20wbks6Mg+vyEXBN5kr4ZQApA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1puggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:41:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so193859241.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852491; x=1779457291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lAJ3Gn4qJTi3DJUhsJ8KW4KgVduivDK93SE3yus+hQ=;
        b=BdHObDIQKZ3eqAu38FmWCQW6lzxzVYPG5yU1C7q1voZgUDUoWhiQ61ZY6FvfuMvjL/
         p52cLP0QvmtJRmpt7zuyWn8MgNq9/hboWgAhRziaN3m4miWNYNwlLpS8PzQlp/n/+AwF
         DjfEP281fYqilXBXZ0Vxo/XDVW++yGuVmMPj4hnW217GuCwkN91w8nkgBsu8ZN+rBo3a
         hFDDnqBrUA5UqYB2PKJihQB3xghEcW3bMNCvjRH4pJJPuvajQyDS8ZcIuWFpPlp1tBb7
         qcIN3bYlrebZMf+2ZBG9rpc5Yeeu8CSp8SoaN5ZSPEXsSC+0juiSap7H8yEp2sdEc2fW
         kxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852491; x=1779457291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lAJ3Gn4qJTi3DJUhsJ8KW4KgVduivDK93SE3yus+hQ=;
        b=I6EJNDtp5Gok5CVgNrXZIusD/jtr+8EfwGQWozQyCbbg8irfdKjqa7hRbDijMeqLje
         vSZLbHsWjIbNlI5tkjcNJx9PcSWYh8QsFF02IkR1FgGeNWm5p+d14sIRlY9qBuSROrIP
         VVpnq9xeeqDYf6X9tuH3OrnqY/un39Pi5Siq6NShbtdAvKODWmw5dqOB7wAxgPcQu6jQ
         1a2zsDnNGQBUueaa4MvnbLstcK3j1KMpZ9pcHixzDlR8FL0ntkT38uPoudeYmFO97qrm
         MAPfj1OFdGKS41wh35ulapRpSSYnnii3D385m9/tVWc0ncAB5oVTfQtKtX0OMHouUUAl
         Unew==
X-Forwarded-Encrypted: i=1; AFNElJ/QxkmT/dKLOViSNfpwbVs4ZCfkffN4a1afz/2lCOIGcM85azD+RRiffxnzMKuE9Ls5lHn5mCjZk1y0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30yPLx8UWVECdyBbR8rI4QLRfVHlQbD7+Jl3AcD4v7GR67xBI
	iIKQBaxEXsrsSwHvrDtp3aZ9N7wKFkeIjbk61uEpOJq+b3jiuaNRWDTn9CrwRghAHMm+TkEqtAo
	WHs+wuBeCaOCezh5upbO5HAagLgccOiQ0l0+KC32SCh3OLPZJmgn4j0MmPVcTS3U+
X-Gm-Gg: Acq92OHKvtsnTWwR8qUZ6/QqLbbN75NHoAznvng2LyCoQTnsHxifc8CO+OErFxAe1gd
	+9jaaJ8QAUmZx3MjyikN86ukpb4P8RTUmndeT9OUYiUI/dLOd1Ti2x8aUV5l8bztSxCH1mgEvQa
	WD3qziyRSOfj34Olro67uavDLtf/QDvvW2wlCO82NBynAy2T/V4DrbyqaCzPVmliW05JTBvU9Hx
	ck5YDR0hxIcWFcDnDCRDwL6NtiBDNMd6/KFuInQOij02ngpwhOlq+KTRP70A7teCsn62EsX4UPs
	TgRAcWFQYHslfmKPSm5sK3OIEQ6/MU79sQPI5qow7mnvSJQoL+YbCk4CrplHwqdQHxfTGKY1Rv5
	U9LqC+k2uP+OrhNne7Z+clW3tS6r2AQKyEW4lku03TZyD5A6BQe059/ApYXGfbiRYwe3ls/cxF8
	PGXDY6dfzNQySgkSmQ/lUUBzcJVBcvjZhxOzM=
X-Received: by 2002:a05:6102:201a:b0:643:80f1:350a with SMTP id ada2fe7eead31-643812e4b8fmr478043137.2.1778852491189;
        Fri, 15 May 2026 06:41:31 -0700 (PDT)
X-Received: by 2002:a05:6102:201a:b0:643:80f1:350a with SMTP id ada2fe7eead31-643812e4b8fmr478019137.2.1778852490735;
        Fri, 15 May 2026 06:41:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm1334777e87.17.2026.05.15.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:41:29 -0700 (PDT)
Date: Fri, 15 May 2026 16:41:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA,
 SDHCI and LLCC nodes
Message-ID: <nns2xhjxhhmcxjgkqhizirae2u6ugwomux6zappebnoam5ocbo@dwaqqmjhjpab>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
 <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
X-Proofpoint-GUID: aMHW7TXJw_atINQpFZoSqSFZ3Voch6EM
X-Proofpoint-ORIG-GUID: aMHW7TXJw_atINQpFZoSqSFZ3Voch6EM
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a07228c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3AismlQB8zWP_hVqSwIA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzOSBTYWx0ZWRfXyZoD5ZRFJcow
 N/IBvOoOeV/E6cMm+rnUCov/XtfHPdeaEb1xjr6ZnZv7VC48nmbl+JhmuosHZrbLiS+6uziWKyU
 2xWAHNCSCXk2n2+jk//JD59YsRO5OhVekFs3RIqnJaQeAdjcB8MkAKTAGqWagqPzOtFHVFp3vfb
 mEak8Wp2bgVyS9V0Q34d+5MDzCe0/V/KwMToG72LUwUWGf7RdsHL4p5wuFeMHjC3EjzqyK9OB0Q
 XfLeLrzjzp0ehKaa4uVODiR1fGqcRSQxS5EMIWWvyGU/isjG0BKQRqoSdHKAUF4uf1EB7OS8JFA
 4PM/8MNmSj4kAEyQ4AOeAR6e03qsX67AXmDtqLFhlvUBSxHAbigYQPqIFgsEFTThDjVh1uOGMbO
 C+ucfKvITgm3BqXaFwt1SHhGrrOhZZDSncvpBcHMzI3/Yn7GNboMhmaFxORX6pOw87mSTgHPR8L
 2LyA4neqmpKzgpJwmTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150139

On Fri, May 15, 2026 at 04:22:39PM +0300, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 1527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 1527 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
