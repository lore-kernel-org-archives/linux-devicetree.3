Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E97226CFE
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869044; cv=none; b=FpwoSq8S1sVQQx7hDp3DxiU3GnqxS07FNa/Nqx4acrZuLa19JPJf4VRqDDyeXjG7zl48TgIC6bd5Y87ME/O55nTgNt8MzOjRyGh+r4Cp/lEJX1zAe20KAx7CERUnbujIkeTMbWLe3fEWbOGNDrGt+b3n0zO3Z/P0E4X2lZ6dh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869044; c=relaxed/simple;
	bh=UomSXRxMTAKvyZiKT+NoMtsFruOw0/rkwBDWsx5ibcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfxOMeDUxqMVfCs3ZJ0f0kdGxa/9woypAsdXl4AXQkqbrO12+WbyUwvOdzbU5LzdiU0Z0QY/Iz+wKTxYG1uL0RJZ/JBaYYv79mvxMvmQqCTakgMXte3pIfqGUnQ6z8WL8tMFAVxXccQKrI6hQ6mbXU2ZTT6yv1ArMpfv9fsjFjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgPUd+Fc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wrv1ArbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgPUd+Fc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wrv1ArbB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ejr8A437089
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TkLy2ZXcdqLANqAf1PiLH1iG
	ICYsV3dWxbIjnbk1Yz8=; b=EgPUd+FcdAB7PL2qPJ/vI+0nESXL6vFhId9IOAtq
	7jeG2dhxQZw8aHXPbbYw510aUBNhtVlg+NYcODu0m258I3OV4nkYJXWk2VhRlLxg
	WrUGK6o/jvOIg3sM8ZQCsT7U+8j7y0P0Z4GAcaKhYY1HaRu8GiJlJ9DqxvF0XSSH
	AY7wrYWhNwXNcJ+GYSidRcwlzuv1uaCzpjByw5geP6odR/skmt3Dfp08krzlFEfe
	VoyIRRNQIW4fykb0zxC1YhQAZKOZKirvLS72A4FYBe/D9uWVD8ebwkQjhe0WmE6M
	3DA1YlX9GDINfF6Pblz8Q8z6Hu4+x680zlKVoB064wG6rg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8vkkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:50:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b4e8cf8cso5757206241.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780869041; x=1781473841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkLy2ZXcdqLANqAf1PiLH1iGICYsV3dWxbIjnbk1Yz8=;
        b=Wrv1ArbBGjAnv5yZoTdVZ/ZNxBhUYAtF+MUGHVPzyjppcWk7G1WHdgbC/i7Y/yqK08
         PjaYtXyVldZjGljx2JLSBf+Loms3zmpmxMMpyYQqD9U65rJ19ZYhVs0dQ6Mmy0pj8puf
         9ZrSTNTVOSJdf3X4mDz8JX9zT8/rosLrli7l4boeMlKouNoHLqkU+EFsiR1ugFjFJhsX
         Og6SItLzWDpR9OGTNMFc/sbnHhrsJOToN8bMtPrxs6nqTehAUVGG9HoDcSw7hUvncBAl
         gm/JlajPJX49FmKOS1Gd6CP4QmUHzjOPrEEaGaGqmQHXyb7b9/pukXUO3HPhRTpBXgHb
         fJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869041; x=1781473841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkLy2ZXcdqLANqAf1PiLH1iGICYsV3dWxbIjnbk1Yz8=;
        b=RFcp7/yRd5D3kPyqVgv6tGHOVQ0O3j7SNfYk4DB3RgPMQYNJt8BHxvqG2Z2mmNUXVF
         LWXD9zYzb5ISRvGfjQwBtg/V+iIQ5+zQGtCowBnaMSkVr037q3bDulHJiPgJR0p4K6Bt
         jjS6ehWYx1RtJ4jQVygkPsKo1khZSkZnmxOp4wPjBSn93aAWAWlCM+XwcXw5vuQg86w3
         Kc0nv945R9B9sh4vAsLpYrHaWAbe21aiWAkKu02c1iF8ih71S0Vgf6Kgs0ZOedaiYKpa
         m/Edq6KgMvkXvDu9OkXwDrn9lBQqScj5lYLZ9SGXBUc+upyVvBc6eJA4EnRW0KISyggn
         KTDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P6byN1gkLdRqdlkbXcLHwiZ8PBw3xJ/gej0ODeNvwt1NXLAop3P7KLCVA7wuhAnL0vBuB2ZRRwB9c@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCPFOAOlRdwGUUESq0Ru795/xpbsoovuh1vTzktzh9G21r1zn
	wAkbj4GYhA+HvRyrUDLXhQ0g2GszT02bvMJx0WiXUeqku10J9/e8WbdA59QxdWvSgC/7ZBAOqV7
	mxhY+vuUrCrEjt9UctI2cS4Ogl4vwYho7bNiQQTd8QFPaznWPNQdbOJ6Snl946pEC
X-Gm-Gg: Acq92OEcU/yMh02vJvXGynVwcR1AGW5TdbuBU2rDWNex/PMoWMVNBLg6GmCSvYDe97N
	qok68wV5zHHmVfgqaq1FugzWIfHvFlIQ2nOwlRT0ux7nGpw7r9ZFb3Z/+Fmb27Qnzd7m3mQQFLZ
	gvbmgkhpPvZLPuLDfp7bGBURBOjBkSC32w99xbiYxI7tGHqgBu2xdkAE5yJriAkklD0hWH8ZzHR
	BK4/fovG9sfGBRojgUxEBrR4u5DSI6/JHfUUCSZLBm2y4FDLXFcCPba2shWYWA7xt5AMjhWklHQ
	JAvuXHpgiRgChqfPIUynAlwPwlCtl4G8Ed0byAdqS9gKMIKMBNH+5DGPUFtzX6DhopCti7lXhv1
	mcNtkaI8kQUqDj1NJreTot+lAFbjK3htIv4/WA+dDIDQSCLhgms3JdSq/tdBKx4Yp380I5m+zb/
	5ZMDfZKe7Qh7FjKqQ08wFTlz7pqb+NioBlhri+N/LZ7UIs3g==
X-Received: by 2002:a05:6102:1849:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-7002d6b6b88mr2938804137.7.1780869041600;
        Sun, 07 Jun 2026 14:50:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1849:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-7002d6b6b88mr2938794137.7.1780869041184;
        Sun, 07 Jun 2026 14:50:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985ed4sm3271776e87.55.2026.06.07.14.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:50:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:50:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
Message-ID: <7s3vxq5pd4oc66hygmpl7ku4kh4jwztls72dw4hswxyusrzfrk@p7s7645qjxor>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _TeZQB-PAlxi8PGjstvPO6OAJeUrY7p6
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25e7b2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CfngaO5SQeOV7zP3I9kA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX+k6jR5+31iVC
 V0j5RSoQbId5iS/GHm5Qa8jw5ljXruYTgnCd+CX8ntpFwuPzIXOIxLHc7nodp/nHFKlPD8mwXMi
 VU/lQAAbOLQ3rOs/thB0SMCWd7Suw8MMScaVaaJ0MXKvUic/b6Kde1EYbzVXy83KgOfJmWsA+Ru
 RhNtA/BB1jnTE1nnhuJoZYqfiiftqfNpgrOLteNcX5DQdQZZEQSqFZOZqf40Iv0rsA+moM/UjM1
 0qK9wl9NxIg82OpLR9FeHO1tpdMOheCN24UcNht/8HouaWmqsVFezX6SUjAQdqG8/g79Q+U1lJB
 uq+BW8H+X3DcNGwCtD7fWS7ppfyFEzQ5ohAT9BKJFX0fQJkbtXr/QflNvq8nQXGTkOpa1Kdtd40
 g3ep/T/ln+xmpNrs3rK+5jzwwz4iQAFWt5q++8pLw/PK7pgzqprhoC0My5MEaZjyPkRCxHC+mI9
 JgryS1ovdofInW0O7NQ==
X-Proofpoint-GUID: _TeZQB-PAlxi8PGjstvPO6OAJeUrY7p6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219

On Wed, Jun 03, 2026 at 07:48:48PM +0530, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   5 +
>  .../platform/qcom/iris/iris_platform_glymur.c      | 106 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  35 +++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |   3 +
>  7 files changed, 171 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
