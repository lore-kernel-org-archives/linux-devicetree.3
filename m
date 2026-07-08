Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB1303A37
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516823; cv=none; b=P+MjJ1rwstM5kaCfhOw9MZUBJ74a0uH8wARu8KgQ9h9sYuAxVqhB+TVwf9d+rqbpi6wP2108eJVDw9tDRROVBs509FcKG2BkbGTaRkQXKlTqq8NwNRz79ptW0tByfIZRYrEuclC3Brkx1qH008+LFLYrgJVU2bT7liQR29ca0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516823; c=relaxed/simple;
	bh=9YUnHE9Qgj/siIoXR4rr52kZJ3GD6CuoGt+K4X0HR+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1zwiOkoDqumNC5yrHDXfLJPTQpSKvCLQZf7bNAc2BVMCHkUh4Bn3KOH/xqiTjNwkRuVi8MFyaprhhqxcj4RB5GPNCLPhx6HXZc55Sw/oDgPpMKF3cOYs1Caa3Nrcs81UWwPNwHXowXUV0HZnrZcmKE96BT6utQQ0RVmouqg//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtljhVoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEPgXHTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtljhVoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEPgXHTB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TdS2617318
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bfBaTt2vbCjk1B2Jo6sg0jpl
	Sh7IN4ok/ouN5deZkV8=; b=VtljhVoYNJyAFd3V6Eqpoa6CMYoOG6kmfYLd4xHv
	wKKaF1ghwNY2r39KUgeONcJYawGn8OUMqZoWbjGUJ2EBeuNS/YoFNEpMpjDMZffA
	eNxyp1xz2MzcY1IJ3WxaGLXfEO36NZLgqW7Y3PuW6tVo7+mYS0v4B+kRZWSgv+eJ
	fA3r1bR6IJCElAzg8OIXQqHAL4DvLwCbceFVbqTkuKcj5coD5CKSiBQiZm1tYK2E
	sUs+R4aOOMMdnE/XEUB2Ky0xCAL6hbCceGGTOcJlYeBXnCB2WYkazk+dKb/4TguB
	bzjx08bbd8edQ0PpcapPSzuF6aCxpqb9fMQ/5JeBi1uMjA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9nv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:20:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f08560ea44so10181616d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516820; x=1784121620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfBaTt2vbCjk1B2Jo6sg0jplSh7IN4ok/ouN5deZkV8=;
        b=YEPgXHTBtXm+BRKQggGFLbJCJvP1TXj21n5kk8IuY4p6fCySWhGdafa2494cECohQC
         TrQPev6EIP+s7RaLFsLhDL8b1U4YYUC3eI9M1mYC3c3JYcI2QWk6nF86ZGgMTX0Y5rrz
         VQPM3luOI7ioTIjnE6yIM9jxq97hC+Zl+LIPFlaIYIZMC2HAVjy2ZMEvBBPVSbOuU7DU
         ByAFD0vSV+M6P5UEMtotQeIg7CtYV/jRQsGw+VfWrkyZReDRW/GXjsr3b6hO5W/KKJsa
         aS17hUvL2Pkb8nEmB/f8C8DDAcx5GqQpzm2gW9ZpBnBI1yGinJSnQ4g7toL6UNRTiaGQ
         LTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516820; x=1784121620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfBaTt2vbCjk1B2Jo6sg0jplSh7IN4ok/ouN5deZkV8=;
        b=GqYfVsD27TGChrh/3a8r2GGaq3C8lSkrSW56ReQsAIK0VWdM0FRWmL+3NC5dHTjaQg
         f8GR73nq+k3GhHTnbWaSv572pwoAtlKIIjSUoCcWx75quIORhM4i7m8yAah7o1tZ0LZn
         eGD3QvHju6nyQEz9A/CECVEqQTFiEaqd9q8/8HKMrSx73MnRpimhogt1nzcWWrSqYuYb
         7U+X+tUsWsIiv/2QKobB+Axfq+J0C0nZvpg9JSOXAxAFOfVaXkoTIUPkeYTTcJqk5vb4
         rtbrYpMYU8skLPYNH/46yRaUKVFYq1hhNFDtOnOKar5z1Gu5FUn+Tv4EfUG8rkYIsd6V
         D74w==
X-Forwarded-Encrypted: i=1; AHgh+RpT6NMzTbWxbPNZON/JIgDPsHsxsnElzGqVpB0SbLqTX6No6alppGpg7WHTF1zOK5YmIB5BNaMNPwOg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc1utgzggmdCjaHctDcRVZvx6lVsJyHyo41TQcQ0yv79hthTsq
	VBAnc2VlHVuJPUubLedR8yecxLQoa6rqoLmShLsESsrA9A0F0iMBU72oSRaHirXTkpi+E0DiO8H
	cV437rOr0Dhzu29UsD8nY4XmTxZGQm52GqtKQ3e8ZA6f0YbA78izYf3+hSzk3soi/
X-Gm-Gg: AfdE7ckEfQRsuIh3cCs01cs0YM5ScNXQWct5OF+rBabRIv3JuWbTp/MruXw5HTn6LnO
	DggRSn6Y9hSyL5JaYl/krri5nOEwqB1l7poPO+vsGqQMab81FaS7bbToquw1uPsLLmHnMSTkUzf
	rWfBzfw/y6aoeUI9hMKA9/o90bMlSAeHzHPpUaUm8WVFyAIJaWGhSACjeqZVL7j2a30gzrndJ20
	EAaUiGnwdT7nNbMRamqf/mnj2FO3pKf2O1yXr/ZG6ns+go6b/CCxgJdsxR6cDAgTwiEwloCKOER
	yTENHw773QFqL+Hb0b88DUblK6any7DrnjnZIG1vnSVHsugIxXF/eEBAOAhAZLhLIVEQm+chtUT
	VZ7KcKKJL0YlpeTUGsCtyqDsiQezekLbw0MUcTrw7VAyiZ8oKUHkoxjsqe8d5zNUKP8Ih80EUua
	AoxdLfGJjIqyGEGP+3Kvm+BaZq
X-Received: by 2002:a05:622a:191c:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-51c8b40e801mr26371251cf.69.1783516820250;
        Wed, 08 Jul 2026 06:20:20 -0700 (PDT)
X-Received: by 2002:a05:622a:191c:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-51c8b40e801mr26370771cf.69.1783516819685;
        Wed, 08 Jul 2026 06:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb868sm4462264e87.47.2026.07.08.06.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:20:18 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <quic_sriramd@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Message-ID: <5ucpcgiwlhbhn4m63gydrioyznpxnfq7rgdxf637qubikt3gqp@kivbak76lvtp>
References: <20260708-phy-qcom-qmp-usb-8255-v1-0-8d852a9535db@kernel.org>
 <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-phy-qcom-qmp-usb-8255-v1-2-8d852a9535db@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfXw7Ds2jHUS2Ki
 qbCYtkucF2qUAVAU+leIymU5HHVnioFkTVTN95xq45iZ2HzZ/6TzA1XUq3L/xNhO2dXCwb2bvCr
 fcLrasGlk/6ogfTMZ+LroL5zOYR5uTEJaeN2obeaY9DyJJcVkAOgoWDbHBfL/vhtOslZ5EXmUKY
 5yoVjyHKC+7fmsnsBxijixUQ5JMvbPoiEEDXmnGfqjjGnZjfaQkD/1S5XeBqmOCwMYHmezZbXsT
 HxPUAMAuUrUD8nPy/GRmtUnYJUvxaISX0BY3iTwmmkgzEE7UXp3dW/doUPFaZ9GcGDIqPpTwbNK
 /Rhx4qlNu1dAScE/swVSwoN6+0bcNEcoss7QniLDbWH3HkCO48CYDRRyxyQDHsEr9tVZC3BIvWD
 Lwte78qD7PM2yxfOsrFidEbweRBqg7gi8NaDWBxLAQM5pDdfB/9IOyDQwvc8/IPvka5nIcG9NQs
 QfFMyKdtXzDotywYJwg==
X-Proofpoint-GUID: A9QYmc6wz5-4ZB2ydXJ5NR63GlvpHZvf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX366oam8ypzOn
 wZpZ8D+ppcXeihQml5O12engKP3gqI+ZdqBop0MCdGH2Zsfs3MjRqzAz018cN1uhlW/0rNarJuy
 r0EXfR6ADjEZmQPuYKwGjcSZ5dj6Hew=
X-Proofpoint-ORIG-GUID: A9QYmc6wz5-4ZB2ydXJ5NR63GlvpHZvf
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e4e95 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=_PjiPlVerWLE5qlwrMEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080130

On Wed, Jul 08, 2026 at 02:54:21PM +0200, Mattijs Korpershoek wrote:
> From: Sriram Dash <quic_sriramd@quicinc.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> Power domain "usb_core" controls the GDSC, resets, and TLMM (GPIOs)
> whereas power domain "usb_transfer" controls clocks and interconnects.
> 
> In this variant, two disjoint sets of resources are modeled against
> the power domain suppliers which can be turned on/off to achieve modeled
> device states. Two modeled low power states d1 and d3 are supported.
> 
> transition: d0 <--> d3  :: both core and transfer suppliers
> transition: d0 <--> d1  :: only transfer supplier

Sashiko warns about PM resource leaks and those warnings seems legit.

> 
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 175 ++++++++++++++++++++++++++++----
>  1 file changed, 155 insertions(+), 20 deletions(-)
> 

-- 
With best wishes
Dmitry
