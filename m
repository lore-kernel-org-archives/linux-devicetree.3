Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77C30B53C
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 02:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775354916; cv=none; b=gAnXEHIkjWs1I3izbialndYSlvHkkLqbpdCXs+9pfXDERbbpIWTXrLzh49qasYOypzmVAS4HBebTt3Q5BCtRG+z51SSFJipHqHIfxLot87BAPXhTYHpwSYUQFTFaVjXK/7H5zzeEvFcMakDZwCWB/4luOOAE8vHevkDpkqZ6EUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775354916; c=relaxed/simple;
	bh=UZR6ZgaB/UQAWvVOjh2YYmG1g3SH8G2W2hRAX2qTbHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVHaHz4Rqo4460q3PCD/7tUQ4Ig5StTI2m08Rzbd3lEn5Mftz8DFwchq3jYEHE4Lt6aKoEhfOB3hMGmf+5Y4eBtxggFCPYt9VoJDiHPt24g3rqmIVNQZVXgofGbpz+pGxeW6GrEt1QhnJhuKpigdEgKuma01eI8brCk8fOD8w0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHS5l1IT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=En9P8Jg/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHS5l1IT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="En9P8Jg/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63521j372971660
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 02:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQ+C8B2+GVFz9XgKRp+WYhAw
	NEfDJtAsm9FbCzmQGDQ=; b=nHS5l1ITFHZKIKuI0GmPZcrEMbMnkXpdrj9oMD2G
	kIXbsvtUqT82Qs5C/TymXJ1Fyie1F33ms1HB5FNJYBj4gvEXAzvBYB5+pJeaR2Ce
	xgfbLVd3owA5Gt3rjQAOYa+eWVrdAkpQrgqEnrI2jovouKz05dFSWINLJiWVrTcK
	ZHwrpdEk+fkVswwhH0g7YsOrZBLgnkfOYhXmHjDMAw3F+Ok9xZ9LS6jVzkVwMnYY
	zrFA6hVFoLlcfjfhyH04jAQ32r6gZcM2XOTQKvshB/6qyLgMdmHsOtX/rzpKxtYq
	jNeD20cpe46TShbSCrMsQvHV+O2e4wrAU0QuoGKuzc1yZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth9pyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 02:08:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso103096081cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775354914; x=1775959714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FQ+C8B2+GVFz9XgKRp+WYhAwNEfDJtAsm9FbCzmQGDQ=;
        b=En9P8Jg/LkpLsqVcdZqb4H65ikLz8g88Hy6w+4wnGYUNXZI54gC4FTbGIjyQQdntjJ
         HkZxl2M96s2JEpNqQRhdSbeWAitUk4isHy+B+XLOByBddyAtw3ENaaC6bIhGJX931Wzo
         BdVVHFnnwRxQd0RrBUtiw5Uox6BSA/5Ryjji/dkW4a8lCEHr27UBwxFYPf+JVmmAtFSt
         hNSnCqipy5VOrYFWmXw97y/kJrvFACWVPk/6VHutBKEw3xq2V+7Ivyf2NR35EjNbV7dy
         rm1QKRYr0ttfnzZOgu1uF9k7ryJ3f4Cc67AnASUYwnqdfrJYIKyFWhZhBBqxmMuAz7K8
         bUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775354914; x=1775959714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ+C8B2+GVFz9XgKRp+WYhAwNEfDJtAsm9FbCzmQGDQ=;
        b=j3bAqTFVZYt7FHGjMLZUq1obTZo5FI5M/uXPy9P2xQuJqZU9C3rEtIAdO+d9awC40D
         RreumetDi8u3sOpz8ZrAidPV04nysQHXKMLUafnSlRLY4QvGZ+2LBgWr9eL9TE0M1S5w
         +HDon9/dTkeVrr1aAkeKtR/g5QsxHj190Flhqh0qJr1RenlVUjz771oUDyOQIGDWiHJe
         et8YBxgIbb/cM7Nb7FhHBDqvS/OhWZtZwia8PPcrv424vopZCDRhSMfyRmqQO6i6M+Jq
         o7DjhUjYGBiJOvtTx3E3bbWNKI++OfRndTGdpZDZG4/7WESzF+kjWzOpyx6XNNLJM0jg
         H6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/DjRqGk2NxD7a69t1LVdgfM2bCNc3kTGjPO7imgibo6SdbgQ6BtrOyNNG0U8UUOWCNCAJLrcv8zB@vger.kernel.org
X-Gm-Message-State: AOJu0YwdndPo36Yxm8rAy9x3o/gDNLJyBKIsc/tBFIiDI0WrTwHtY3DV
	pSKllupx+AHIpa4w5Kv0BLoicYldmDB6DPJcizCRTd5JxspJB9gUIcLrqyg4KnjSdzc+uyPwvDh
	aMz/XqcUo7rNWSwifF3n+jr9JpfiY1O7B1sHeWYzqs91aS54N3HGZ9W9YzMHcwtOB
X-Gm-Gg: AeBDievM0TTn5S1eO+Dqbkl9hgg+R60MjMrQvV6p+//PV6ESxVKuiG3lxo3kQ0YbU38
	ckAU0Yk98Kn7ODlVTmQx05YU6SNgfKgZfJcVFbxWOWVMGY12fNYZMpbPeAbJ7I9FOc0TILtu3lG
	ZsCmKcu/ezTE2zgmCjUPPHUUnEHQROyGw1ba/3PaR9tNdntG3E4IN7utyKrZkUevNa2wM4mF1p8
	f5YEyrQjp7yw79Q+c6Z9XUCtdkxiHmlrpYwWX1dXcQZ9nzpHqfM9E4v/01u69qjZb4cQV3bb4QZ
	mDBk0mT6+B/ZHSpPrNeS+QG0feKtgXVd74eGR8s+cTiF9p0e3kcpNv6OiR1TLlBCyEVjX0/GCUw
	23MgILxXhbj7LrMuvjF+dprwu40yjbhTlSJ4rvNVkzgvUHjGy4xlgnl0PhA8mDEA9K7WXPgtRQd
	K2/wQfITlGkkD9oXl6xIsjIFFKsYCwLM8Apac=
X-Received: by 2002:a05:622a:1f97:b0:509:2b5a:7ff with SMTP id d75a77b69052e-50d625009c0mr131779471cf.10.1775354913903;
        Sat, 04 Apr 2026 19:08:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:509:2b5a:7ff with SMTP id d75a77b69052e-50d625009c0mr131779061cf.10.1775354913454;
        Sat, 04 Apr 2026 19:08:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm2426269e87.60.2026.04.04.19.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 19:08:30 -0700 (PDT)
Date: Sun, 5 Apr 2026 05:08:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
Message-ID: <wg45gdnnkqulbmo7ip4drddksmd27ronqen4mftspbs7tjjuwt@2ymjmymxnfrn>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-6-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDAxOSBTYWx0ZWRfX0CBL77SxB0i5
 mhyeRCLz/SXegyrnjkTIlmdn+liAe5T9PP4e06o/O4biFbHgZ4UcnQU73eIZYlpbrgqwlZZ/jgr
 oksRP/qtNB/I8JmMUQbdRxQvcPZXhtvzn5cetvbUZDhLx0L8RtayxoathWXdhKuREq/K606MVlu
 nX3imgmvuV753SkEr7gstKHnJftbNImmXzVgilmJpAnTFte3H8wVoATRN+pJcjH/xd2iZoUeEQr
 7wOmwbemjrdme2gJCssQVmnzEWgYNOscD+KYd3fsBKE7ZUO/sLn+Awhw18qoV971viEG7QyHKIL
 nPuir4qk3pK0ZgS10HeGUrqCVXD1SAJtRtOctgLFW1f0t+Moxb2cJpwHA3Q//IGV4sUbp+YTNx5
 siNkjbeYADSHYuveTqLBlKzchhAYw7b6SUT9POsOUN+fAVq5sMEYzsPq5zFS6gNbGAFbd4w+uv5
 NmmseBB60EAIxSOME4Q==
X-Proofpoint-GUID: 63HhJoLmzBLJgZvv2_2oy2-4Ji-foh2A
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d1c422 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EqZgH2Tm9vfPv3d_J88A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 63HhJoLmzBLJgZvv2_2oy2-4Ji-foh2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050019

On Thu, Apr 02, 2026 at 01:45:17PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8750 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> dtbs_check success depends on the binding change (first commit).
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
