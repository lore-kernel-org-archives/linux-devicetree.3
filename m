Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71FD3DDDCF
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249888; cv=none; b=KEoPVkVbXLhwETyNXQF8DR5uHnlpDq2BBSknPeQ165zffaCtoTRtqEynSrSM+bWCbusDbczKodfZDP+jDSTPE1OrZ2VekuNBEhZZfG8qMV2UWssdGpSVw91emPIOYEhZdpIJjfHQSd6Vzx3/BbSPKfiFEGduiJk8XxolXIN8ZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249888; c=relaxed/simple;
	bh=DOP+NEjs0aZ8AjB9Kb3C72IcIFeqDyCdhC77UBl//ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKTstBb6nafRpiV29P0NkFsruXe1PeOEURWm6aBjdObgGomVl0kjmHyxBU/ZParuiIodvPh9lXNF6iPgedQL7sjMc0Gii145Snw+jv7N7BLyQw8yDtnje8qC2GXfXa4haIpKMoYyS+iF2WclIco5/UYVpUdIhPDS5OIIcWGp+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8SWiVAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCdcuW49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8SWiVAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCdcuW49"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Kss2502019
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtRrwXijfX7jRcNOtiyO9WkT
	MQFqO0ZC2KWKNOB7OPs=; b=h8SWiVAOr/HjgZKoNKMp97PEMyff1+X+dwHmAj9x
	Jqsvu+PfBmQkjdyCDR/OT4ezsJKcW62RC22owB6l4PF1gIQ1cgdUMeNrsQxyh4gI
	KwxjsjKD1qOK+8GtryA6UVJRuYYP407gxUG/Mri/1IAdeu+M76ABVs9DP3zBMTu7
	gfo0GvoEaG+TPBP4HB8gfsRmh+/Yxm7VolXeJ2h3Dl6nbEDiOH6Orml9DkKcWXYG
	ZuEJtCKbDZG1F3bOaTqmg+EzGdAmJznz8TLvs79QExokC1PAB4oO40nGJiNc4EIU
	WkDO1UATKOvTG1Q96GvwwWvmZ1oWt1zcvr2PWsR7/57K4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2ppw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51787404d3eso12993691cf.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249886; x=1781854686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtRrwXijfX7jRcNOtiyO9WkTMQFqO0ZC2KWKNOB7OPs=;
        b=UCdcuW49u6DGqWrj2mOA+BPv3gyNkR+erBWzO9czokPcSWhaEGo+arhA55gNhrRXCz
         d4xc8qmPWJ/u5KgReZ3CgTXFctZweGt+epb2yODkwH7TP3Keq0KdobZDX+uog0dUeYDU
         ejErasHtznHDIGw6xc45I8NbAl2TYFKSw8HCNXTlS63+AgcB3xyIx157XwqzuRAPNOko
         L+hsi44+Upfc2bef4zaeet8d+MJ3pS6OcJJzB9Q0HeRmX1KhpSJ3mLKXdaG7I59rD7IQ
         1q9FfwkwWIq/PxnY97EMMFlPVc4WkAJHOe8KmT2X1eEV7cQsH9Zdg9PXuhzQRyJFO1aU
         rFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249886; x=1781854686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtRrwXijfX7jRcNOtiyO9WkTMQFqO0ZC2KWKNOB7OPs=;
        b=R/24b18eUWDB8xSBx14S3eJUnCuGsVSJEgFGOMYrwC2XAmgy6ahyByFbOQFJlKKlUp
         7jpI/3G+7fa5KcRocnQ0XWLnWkF3tN0Azlqcr1QyPsX0jSRtjS8KwFgM357XKKiOnkS0
         YZiZQuU7cI0c3V6bLVVCHLb3L+Nj+WayWg4zWrKLPh1MjUyfOqgipM60X+hfBfWCuEX/
         40reidhUk0rUSCe/wP4ac5l5f8pfoiU9IjZGBv4o7qPTl+K+l9HJRuhr+9zJV62S7ALq
         pZBo5BXE73sGV+eiI8eUfjmcXpmR8GYeNvvtiOK8JCANYNGVSUfjUfj/pPQSUDoEVa9X
         vS3g==
X-Forwarded-Encrypted: i=1; AFNElJ9InRXwWD01Hjsxu8qgn4J6FnRxG338El57PXheQFZIXBmPf4LQWZWKYibRM0nH7amLESdLWPe7zUao@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8ZobjXH7IGkz7SF2+XyWWdS4lzkmc2bQB492FThrdv3z/rzC
	P2LopyQQaVZkzXpJpxfr/J+pvqm3/P/HEHECBjIdFfGGkUgpRt3sep6YQCDEI5NBcZe9zL3FS05
	MbM3TI9iJ0irtEEU9toU2hjlMMPRCBZ3hl7zFwUzexFiRjtaZ8rLQsmIfgASmifm+
X-Gm-Gg: Acq92OFk9yza4n4yg28BNaWpxer6CwF+oALo/0lqsWyQ9Kqhv0ORLxCAydPQ9XFDFzr
	vmVdqf0BA+VFPPAm9WQTP1cMMJP27yqhYZpJpHdhfraINKhHK0R1iwOJ1axu02S/AmMVKj2lzER
	+YavNmjaCVSNFTg53EbZjDlvQVS/JiJXUkn9fu4GD/05moOZsCGACi5hqlqh2C7/uuN6RyfjslU
	doj/Y6YuR00GuLvOrM5Slqbo5SWjSpbf77u5hQ47bLS95C2ulYUW/i3Zhnp9E/3ws+2Wa9wqzq2
	HW/xJ4QyFjjwOcZYMrhNxuvRMHXxHvvsH2UVutwm0rF8vl4TDatcloPTSl3Ul3d89dmRL6SWW0G
	XJpxJirolQEgMjHXib8zF4Lsb2e7TfC3OkMa4NW+WzyQV9ViYL0KvvmJDNBlfmaAnAyyUHfGZ1k
	vCxUlnsmZX6rf5Gvu/usVw5uiibwwKt26G/2A=
X-Received: by 2002:a05:622a:24b:b0:517:7d9a:a88 with SMTP id d75a77b69052e-517fe4edb35mr20865731cf.37.1781249886109;
        Fri, 12 Jun 2026 00:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:24b:b0:517:7d9a:a88 with SMTP id d75a77b69052e-517fe4edb35mr20865481cf.37.1781249885707;
        Fri, 12 Jun 2026 00:38:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7283sm302576e87.39.2026.06.12.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:38:03 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:38:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
Message-ID: <po2gqpbmqw2tnkjn45ywgnsiaz2tpsprr5yowe3lw4y2lxk5ga@m52i77h5ymu4>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gEfAsi5nBGQdJ0BLV6LaJzUGZS0O1J2m
X-Proofpoint-GUID: gEfAsi5nBGQdJ0BLV6LaJzUGZS0O1J2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX4MFDqI0v+B8x
 VJMmt4lydo9ir8G0vodB1U8Q6DU3AJGFSzXFZnV5JVLSoGrkGYvQ/P/eHTN6w+MTYkVJo5WRdRF
 8wp0p81saFqlYJqJGlhc3Ybk88NOulLVs1Ed3oMmpu+Puqa6dGo2NUkMPmNYeHfamvRmrwcIBhP
 EJ99FkyByHY/w4YD8+VjuuSpygl1WJkeYV97Cg2+/zbJTbBwSWyt9yAE6/uiEuGs++ytLX1U+ZD
 ircbfEFgDgTK3gFjkTIwaXgFXUEGqRqxkxJZuEt2S7NrqNXWQSvCdOYScaGBB69M3rBkQmLm7ty
 WqpCFFqan5d2p+d3tw898qNAcDNhCDzS84POKLEVVHQostQXwF3D0DQ4Z0CMgzoJ9yK+yLI+4ca
 Jb78NWaWGx6QawgJM59l049ZJ7GwYhoXwqAL5rJGvqIGqAId4K/RgcMHHFpaINfp2spZFpzu/Su
 bG+xXDC6uQibZHeuAOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX18PiWjJst0i8
 dch1HU2u28PCiIXVBxI0mZ87Q3Z+mmVBkVspaD5SAzCDGTpEQzR4SRBChSJSc2KKHMPa7jK+4i8
 Wr5lxpRKTIuhd+jCzTrcpuu11FOJwqo=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2bb75f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2wNq6JH_cIzNK18R0_EA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120068

On Mon, Jun 08, 2026 at 06:40:28PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
> IQS EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
>  3 files changed, 57 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
