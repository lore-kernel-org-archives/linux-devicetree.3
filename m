Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42293FFAAA
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041399; cv=none; b=Hv558J3wuNVjhn9AWHEttqax9fJq0zpf54L0ygfyZMQ5QQajeZMu15ITNAnS/rQ/XBkRcMHVVQ6Y+iUYrS75Ubff8Ibx/G8dgpiM4M0I78J1KrgeHDQxavRLByjZZX9nYbmcEDQjFmqlcIUt4WQ83Fh5XgDxJgBaem5rOahgxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041399; c=relaxed/simple;
	bh=MB4LMwSHBiafUcSOtiLPU4dOU+C2pFEhAewMAne9QhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4YO4i8SvdP8/0mGWngbMU3fRt3a1/g3D2LBmBD9DoMgQ8p/r1jpzpdN2gmnHLnaTYlgTFBecdzDrreY4UpmbmOrMgJw9M/UhtNBegGNYdVNS28TXwArUWhGt/zjqAVLbJQkkTvD+2ULDbSNO9wHQtcV6vySokckZt2VIfQZMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M24NojE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBZ2LbkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M24NojE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBZ2LbkS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63182Bwl1004296
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SWnjJe8ds7N8QygyW4Df4rFv
	J0LrwnucUsnXNEwaU1s=; b=M24NojE2g/hqDt9cNm8hFNW6ZMoQGEZ0F/Exmmo6
	0KHFYpxNy02wYxSs8D26RplmzysK+e2Ch2aW8jvD3yC0LoAjzIsxyzY09NhGy1fD
	Y76t4r8wC5n5o4pscDt/zUVo6DElDICEZvYBxgWIYax9fKx+YhtM/VLWhPPJBmc2
	5XOd3nEXM/3v4o9X2gIHBNBIE8QIwRdYCt1+ZNy1SSmS0tqhRVvOAv/XvxUpJFvO
	nn/TIxv3h0/QZp4c9CBqRpQhwv0OXsNqVYfgP1j5AxR7m0YTbiI7+1I4DwhufCJ5
	0by6xx3ivdFaTcvho4+sjmbmR48MuOAHUtxEcIy4T7dCpw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhy4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:03:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56a8c0b9ef9so5110094e0c.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041396; x=1775646196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=GBZ2LbkS3NWPUxX3BDpqm176zzEfNxU/se0JNHD+dqYsOKmdViQHnkPSEe9Yt8feMI
         CTuRLibOROVOf0mhj7NGm+RUZuJZgakwD1TvsJQSO2DTC+QdwkvK08+G1M1dv/xVnzvO
         mFbeRaeQXlNRwNYZVSTU4nGl6yrIc4aVbN5LfEFXcZ/k/H0uFx9DJAskny7A3I2WOc3n
         o/PU/PPACF2mwSjRuJJvpWIYAT7JHIlm+HaHPx8MctNgvPf2f8fWwvgrxrF5edLGdpA6
         kiiqaU+y5zVgldzaPi0NnZ48AVulCtXISgRlKvOWswXluZsABLBdCxOjghvA1OomtkuP
         7T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041396; x=1775646196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWnjJe8ds7N8QygyW4Df4rFvJ0LrwnucUsnXNEwaU1s=;
        b=qj40ysmpS6gnBVYpMlRMb+BhQk8eAahUzs1jqwz5bTi7XUdZLPxI0Gf3NUuIo/zyHv
         MkDaBoNTWisIlsOM4X8QRgL5y+n6jOb5mGE+rrwl9Qbvi6/0ivwgPhFfJyuwf0anaaUx
         H92FBnvhBR0nAQ8pxz/CCWLiIjfaAI1/YKaghVadwboXd3WDlTMUwJnA62AjF+o6dUK5
         eRQQsgJui7JCc8gbqykVe7eOY6jG9UTICjd7Rwy2Dg/X+J4jHr1hMD43W8OHvBo0IXu9
         I8reIsNEgQ5FyoxjyDUzWg1TObdgzS8pXPrA9fHJ1AFjT1Ut2fWDZd2CsGmtBEPckQdO
         Yu5w==
X-Forwarded-Encrypted: i=1; AJvYcCWLavxJ/ZUDAXxf0DyEgw8Q5HxUvr3QX23rZ/1QQ2af3WPP4zhzUc1E+8+SgwyAomd/aqyL3mkdNYIL@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxCbSds2ve4TXuJGMXcWFwfQczVuYUPa7mwEh9WulcR2Gpbie
	MFno1HzzLk3IP0oahk8LqkxlUdqiQt+5vHtKYyW8zDUToQ3ae1dnAqFOWnXoVi1LMOTJ4Itthvd
	Na2KcIQgIxvBP+9qBT27LECzCjEwKaXmzW+qZRjDHCXNNwd9193jTe4HZVBHUvkQ3
X-Gm-Gg: ATEYQzxygIB0m4tnMRSbOcdRJ09bP49s9jkG1/GWXqgIwGMddjzVBmsOyhZ2h3DqKJ3
	oB7OH4rm1Xlk7si+HJt4pnUvt/uhdAl1uCsapVEUSDkIbMNQgfmPlYygY1XjtnsHiXmtARZ8bJU
	9l5+f92/AdODewtgxD0cLWLlrFzmFSkkQu2ztVfelQP+mqw6zxViqk0MOa3F9E7sGR4bHbpnHYv
	0c+Ec2DvKyG47VK+OPsCkNHNYrOF5WVhyCPzaAdGTwH8VwRFnYp7Jpd5Of1vBRglqE+kCFbESYO
	M6Ih5rGFUndD20frYdzzYupj4XfhT11B88NA1V173eBzk8GQgORYxZwZryFMlYCmuU3Caeq67rk
	OKvo8yDs+6DCu6BqNgW6SBMhAXkvuetGL6nGB+i/Kd0QeRGq+R0e7N125UBut5x8DNY+CQeW2qI
	KbW2RrClUIEq1+qdwaI2tgm8h3erKfnq+Bj0E=
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385080e0c.8.1775041396078;
        Wed, 01 Apr 2026 04:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:6089:b0:56b:960a:a4a7 with SMTP id 71dfb90a1353d-56d8a85f818mr1385036e0c.8.1775041395591;
        Wed, 01 Apr 2026 04:03:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456dffsm3176792e87.70.2026.04.01.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:03:14 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:03:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Message-ID: <q2vthozftjqrfnjtm4e7b56wliniic4toqoeti7rzyqev2yupm@nxc7ejpfa74t>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
X-Proofpoint-GUID: _qeYocv_RfuiwZ1QqpD3gVjNKl9CGrk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMCBTYWx0ZWRfX3nfpNUJoP/15
 ThxR67Ssm0YVbA6D0X9I96pAim27MEGc3/lo/SlU8WR2Zm5LdFCRteuVljpzb3R2TBN4yMw41Q6
 vxbMhxZwH/arsY+EfJcBBnw0NYueZpsYayW4mRc/YM5bNxKqZ7w0eUrNEUez5TEybEVq5Grzvm2
 2inv6ippIIleDrcSlhbYVJ/2VbpiBcT6dxWJVsG96hsCqF3qAPw9OXER2Ycd3gejP6QzygbV2H3
 vUWVUTPoMcaX4FlS6F1MGWBTjsmu4gnTb2q+vJRCqH05Sz/PzqFBfFBid18N9YmPUNIUfWeHVf7
 fmKLYCbExfK44ePaggivevq1Sx0J+d3jrn5T+/dp31EwRXES0iGwgWLTPmSHPTuwhtXYdcIF5lW
 7b6ovdWMvHWkpX4l1P9746WZoNK+4+Yu7XPLB4ZhvGmV6wPBbZ6fRnpCyyI4/eOpq9Gj6IWFzMx
 +vLHMXoin7Jg4XfaJFQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccfb75 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YfhdKQME_ACdFzVZc0QA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: _qeYocv_RfuiwZ1QqpD3gVjNKl9CGrk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010100

On Wed, Apr 01, 2026 at 06:24:41PM +0800, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/

This doesn't make sense in the commit message.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
