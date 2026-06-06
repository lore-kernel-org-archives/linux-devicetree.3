Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B939022E
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745499; cv=none; b=EK59QMMbw0tsObmJzbLX7lZ0aBa4/n3z5r4QHCQNTWP4gdcCWzR44JZy7EawZU+XgT2SGSZ+rLZxO898jeOp7piaXKA5WTc69r/Eo5ugG2+ynUkFDzHkr95wxNr3DhLdJspA8eTwbyopCV3tbnL9qeHjBxVSRXPnNxMpWtcQgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745499; c=relaxed/simple;
	bh=aT8eOo0oxEu8CziWg3ScWwepp+rHcL5Krv4dBvdnM0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqbE7qnaaMX/zbHqe0WDQwpQ1sJhySsm6d5ud4o6CfMfl4GWQ1CSdRL1UaJE4pOjoxl8enqUgnXj/r8AjNJY4rsUv7N8tHFQNIeQBYjF/VO0NaSWDVcaNIXLa+/QfCo9xa4MqE5KISyA1wyW92vEqGhZ2ETim2BxCiOZPFDRxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izXU77Rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGtW9KDa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izXU77Rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGtW9KDa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BIGem1313149
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 11:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nV0WGJYJDrl6fP2+qV8UtMKe
	e2Fm8LZB0V38Lw8sBJY=; b=izXU77RvDT/hlcf6urCt7Ce2LjK7MzKvxWxq0xiX
	+uYrmvgeE/iRtSj47qzFz/mPyk0JpRJSeCzp2mg10XeZolnDnudH1Aj54zwD9QX7
	83/MOC5jYglr9rlorFfltPBKe+eVAODZ1GvbrPbFXDVojz27FGKAacQcDZxH4NvH
	5pg2SpjHMqlHOQYNUBAJGarP29tYvh4dmxudqJQmcrrV8n/yT8P90Wq2+2NbUX3v
	5E6GsOIDhVokhqiliTnXbfF2vA4h5/BjHueNVPuxKiv8cEtD5w4oilBptneaek6q
	ZJkUIXg9n2Runcq2G5y0FVG+cE5PrXYjm+FHfu9YUar7bw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w13jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 11:31:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf9627010bso3374107137.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745496; x=1781350296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nV0WGJYJDrl6fP2+qV8UtMKee2Fm8LZB0V38Lw8sBJY=;
        b=kGtW9KDajnqCgmAoc3DeGiBN4po6vY2WmytM3u9h72+K+F66zlw1jXOaL65QY1/GeD
         pUExkhpzwgG8Z+kcemXL5nuUWk3ntNem4D6H/+YyUGtSDBilLX4fBXskljzarSiIqoW/
         m75k4ymcXOaQpzp7ZyTPCJhqLJAztwLTG6Wj8S3nHEjBG3VwkNoJCNq+L/O1ra0QWn3t
         FRSsP0IhJkzpMOgWmG1oPa66jdQmyjZZLu8b1Ps1izlrdsG4FSRN3dolf2IkpzvBJk0y
         Y4wZ6DcNcboN7tAOmANFzoiM1IIKUymsYmvP66ylv5t8wlHB6Xs36JvefCU48uZ/Vl77
         h87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745496; x=1781350296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV0WGJYJDrl6fP2+qV8UtMKee2Fm8LZB0V38Lw8sBJY=;
        b=hX2+LJi9gXMO/EmhNOFwPu7H2wsWHGJvYurvNf1KH/2fEOwMFLpG0JWBuAlfAWZojv
         YJkbmv0Im7A6TxUCyLLmLxlTNAhKp/5M7y+rNMf5LSk5SdN8lCXM9N2B1IkUx0B3T/zo
         YXXrTOOR0dZEBIjpMFSc3EDjCgtxnAWxgnYW0TtPz14mkfW1v2nbLEJAsvSs70Iw+Jwk
         BOFgpg48FxSYSXw2ZuPbDZwl3kP7x9J1B2knlTiKARZcZvNqnB6J+o08Q/crTkhXq5Zs
         gdTQwrX9oeaB4c3OMowFtBnPKpZWec9UKdfBzlyTBpJd+p215txYU9H5lFA4v1Kf88S+
         xraw==
X-Forwarded-Encrypted: i=1; AFNElJ8txa1KweOO/w4MkRNQCw/LDbKsJK6vq2mHYEdRHzmDC1dxUklBbn8e977v7PM1juLa4FwyCF8W3RTf@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtKdzqAAX7Cvc1GMJra9j5+i2UgAmyyKQ1n/eCP7R46oaXoLF
	xudKHdotaZqvBbOrYWrLq1WNciXEUo083jYxCm2dzKu7w0ZjFNfElA5k5qw6GZaYpi6famXxdT1
	39MtXW8xGPnbsYQklZLUCbxAiGLO0vMDb3UGXVPjbJLb4KmZgeVwHUTSpJnh7re/c
X-Gm-Gg: Acq92OH7svg7TMgU8sk5+5JVnkxbV/6PZclanPusWDM7zpGhZ9954eGopO0VvVQ74yF
	hTKz3vXTbTAuT4ZKFQbOT+W9g1SC+yBeBy5DKDFYe0vkytQE1XMgBm8Ao0ktxbMZSvweWsTmg1/
	coERWqFwkp6DDsjvDZM8hv8u3iMGob+B75AHaAQpxfb7QXf8udHISvdzPjNlWg9Z0yesc+VWzvk
	5BSoNtL8AeYAN195cLjZqqc6kR4SyAqBav6LnujbeNrO/VZqD6udJxmRfdhsTsWP4nfNMFdO8DW
	y3jMi1Ik46V4xM+nYDedcAZTVGx7rtdp3kIs4kPFcwA5enX3hsnvlcnT0DZDh6UECC0RrTIBIbH
	ln8qPJkHjOyOg908Yd+bS6cb8uU5BLODmqu8QKY92hKkccA5fK5Yi8EFtF9zlruLZywvORrwFuw
	dbX8mU0pHbcpzg1U2Ukk9o0COuGc/w9JI0MU3zzKCuduxUYg==
X-Received: by 2002:a05:6102:c47:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6feecfb6b46mr4044648137.3.1780745496507;
        Sat, 06 Jun 2026 04:31:36 -0700 (PDT)
X-Received: by 2002:a05:6102:c47:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6feecfb6b46mr4044622137.3.1780745496140;
        Sat, 06 Jun 2026 04:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99cd4asm2401374e87.83.2026.06.06.04.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:31:35 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:31:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Message-ID: <xcujjo7qdgoupayq5zrddl7gii7s2ljhunvav2jjzynykg7za4@ifykyjburvea>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W8Dr0fHcNMBMyLQ8bkWvz8WO-YX2aSbu
X-Proofpoint-GUID: W8Dr0fHcNMBMyLQ8bkWvz8WO-YX2aSbu
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a240519 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Wcw2DPdNTWUl35SL3yYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfX9u/OMeRBkhUu
 Rja3R45AFLK5aRTtL1+v2gUV8Pn6WiS3qhVJtmY43WDPETCan/qjfm5nL0p0HLTkDI+XIEIk5NV
 BuE3tUYUO8lYM9Se1zlExMbDXGVYk9fVoP8zYA5DLvsPrOq+0tsqggDkFeSyIPWp2GswMBtQ8Kk
 9Hyqh8Llct+H9i4tEVgHcBVSmSyhQI22BLmsEkOHvADARJNGZgAhs02gKcBEvImvES7guiznhub
 SNm5XBoYDeI455ldZc1I15/3vs1w0JJ1egm1v7Lq16VWYPCpP8bxt9Jaod4gIrTfkwYi3H+7Wbu
 H2VKxT5tLjsysuP/HGW9PfNDbEXWnShZR4DC7HUE0PFRwqt6ErRSmppX/celB95Yc8qKffj9GTh
 KjAHAoSU6KcqqjxaybScTIOwN1BSzPXHkAhEffvJDOZ3Bmi8t5n2qTIZdgQr4MCdgY8NCrV5wWv
 aygFBZxYutGxy74obXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060114

On Thu, Jun 04, 2026 at 10:56:16AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
> values. Incorrect settings can cause the GDSC FSM to stuck, leading to
> power on/off failures. And update the GPUCC GDSC flags to retain the
> registers, and poll for the CFG GDSCR as applicable.

Separate commits, explanations, justification, etc. E.g. why are the
flags being set only to the one of the GDSCs?

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
