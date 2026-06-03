Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E04D90A4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528195; cv=none; b=lDPMHvao1o2IdcZfgljFCt2z04P6isT/qleRS9IHJk/tw+C+zk+F+IvCIPnzF7t6JY3lM/U811zfWpJ1ZaObQQMZdn0cSB1t2hyFVs0TebfuTs1z0LZz6ayDwqA4yjdXihJInSvAO9bg3CqoN2HUA4LKaLpPtSNx4Dl5c5Uye4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528195; c=relaxed/simple;
	bh=M6PaO15AL1les95fs2M50qBWvkR1+aozFPKRVFNrcew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOw+bzmhNnZSyaHLCP2GnOzJNTb5H2kczlohmDugdE8K/wIx6IQVMc0+jLj+SehCX8IxV1+mjQgeTYXdhXcg1Swt7oUAg5BvIxTFnWm6BPWOMUVSBKCQw5j0prZmSE/jgB7Acn/YI9F4TfjvQsKK5Fx+uuuXQ+bCQ6nOW196FzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItHNQFCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbpPk4Iq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItHNQFCV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbpPk4Iq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653GUMnT2368305
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 23:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM7re91kygzVwItS+ciTwBT7
	UhZcfvCtwxBR7/9Rl6k=; b=ItHNQFCVXlcr3sWHBPrR/Jiyl4WNsdz75NYJwNVA
	u9QYRBhxqmnTBQ6F+9QHJfy37sA8aw1eh+flWW0DcMAOSAncb0ALAbwf2oEwVI1P
	QA6KKlRW2F7birwA6SoFimt7A3uGH4cy3TNDkc2u6n8pcpl0nE5G4aFicrt82W53
	xwnuayjo+lnqnsFItT+VXwZplDO+BbvxbXdnVLYbEXLtVZxdSA4mVkzaCLFzh2Wr
	0yed7dV3ssEW8dSjmHN5h8X+Y6Hvh5/HOMMoOOt0nM+u1LXpkSwQUJOO8aqtxcTa
	3G44XaKRDxj2JxBKRuPcYPc4UVmMz6FyfZltEbPOipE0fw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gk31t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:09:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b099b539so1466948241.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528192; x=1781132992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=KbpPk4IqRievGLHjifRzgL9oCz557MC1dga+1BySGVA7NR5I2BRpLL+ALA2QNJcDQd
         Npkj9pow+DkH6ZtJWtKXWqGvrtCDaYEhIdCFpDxiLaGOdN64Hvou5sLBTcA9XGbZZHSw
         N2R7RZmDbGoqfxTB+rS7Nf1Vz4svwX9YWj0AUsAMNqno5g/gOF1to0Ex7wUVM0j/HDTi
         q1lCluBZXCklbViiG/2yQqdma0YoHD6PQnxq4fUtxf0PyD/R55ezHTgruhoIqfK66JVn
         FLm9OQ2M60QHdBKJyQYYCDs4BiDg8oZo8mOqtxusZJcauu12KRUnEqH6Q9UMF6dkrBie
         +3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528192; x=1781132992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM7re91kygzVwItS+ciTwBT7UhZcfvCtwxBR7/9Rl6k=;
        b=goQHV+7bFd3btCjQTp9ZG2CjMA4+akDLosQlnovO3Hu3EPCWl2vSBCij7pz7Bwg9Df
         V22DX5SEBdljhiKSgOAbYaH+n35LDYaXNZdlgR7WcIEAD/iQTKeV1u8pYrWYTONn+lzm
         dQJw+dt98tQlGeBUhFIrM49czL1RZTLUdCj/hF6wmW6qr7WC+QWMiru5fovW1Dpf2HtO
         wNu+9F5Zk/6oKUvvv/XekYrG5cZ5+fvhdqwWdGthd7VwGFdZuzXVE6tqYi7m/4RDVRZN
         iofSfgek/bv7XLbjdHx07NMRGo8Fqk6qidRcngOiK9jXvxAG0oQuiSldWnpxD2McPyT3
         QIMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yFEP2Oi3DDN/tqJsH0/TUxxNTSFz8vTxnjF+aoIPG8C3zVz/pYGMvGMnQMCaN3/LgeebmIUkpEdrD@vger.kernel.org
X-Gm-Message-State: AOJu0YySLsFAQh6WwVFLow6CHhe3gzP2xz3LGeY5iVEthgOoGMfj4IbQ
	9YydLOKNXxgai+WTkIfg4wrrodAZ4+fFqKnJpadWj6TbRbIRZXAavsKD5Nv3kJjq+UClbeW4Kg1
	lny9Og70E4/BWwiOoFPlJBg7UAlbIlna/8DWIPCsbaD7dzveAO0MRr66v/IqfZpvR
X-Gm-Gg: Acq92OGBOq22VplPDXCkpT9xxJgPeZntrjYiUI6wN87sUEgyTuAz10WRT23OiC1X/4p
	p8YrM+8e7TWSZ5x3De0s8++fN0w7RVg+Sm3ARPR89FaGCMOZvpMVY3GOeQMtTZyDCG/SRfCD/lN
	8vLRPhLaMGExA3QtaajS+gJD5bniFTDMqj3MoRtsQ9jzxDQMsyQb+ttO0uDp4yJ2Xg6tJ5+W8Lo
	9SisMsQWNat+CMnHuHpgjHgkxGJPU64GF2f8pnQCWb8K9oRGTjt5qLIfDIIn3VBVLAqtT2sh59l
	lkXcD0WiHW46AjO4rTklIYHgaAdBQ0/gcQrdhH9A+9pFykHkWuM7QD2pS6PA4eVq/ysJ2Bd4awZ
	8JzKcQsjHxbTBIXOHat0V6mqtOGJfrLvnbuUAPCYDb68IZLggdjsJ+MDjWFu6t8M4/FFSxtyf25
	yuRfjxu7WaHZGSg2s9TJA0ksGUPgrFZoQaj77tYjYDlOLN2Q==
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606527137.19.1780528192033;
        Wed, 03 Jun 2026 16:09:52 -0700 (PDT)
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr606503137.19.1780528191675;
        Wed, 03 Jun 2026 16:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9082b7sm883863e87.36.2026.06.03.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:09:50 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <bhq7pallav6wfni7l3xtalv3ophpoa7offdzdhfoqk3a6lj46e@ke34hu2ukig7>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-3-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX0n2jAxWwGcc/
 jTYoIg+S9JG5JgZIeZiS3sy4EoO6Rc95kpnoppWFefr57W/O0k8wpZjWswAyGLCBAQS8BqP5jEu
 0/LpO9XVv80eAlmUh/I52lXC2QI07VX0GGkNx4mDV9NyQrS0jJ0y7iZTLZ9aTMkKxQAuzRl0Cc8
 DJaYRYrKYCsx2jJ3lh66cQ+YnMEqD7b/MgfYhtOxamcDulMuXFYQmwyIa7kpRQYvcEEXUlr1A7i
 XUREgOssHQrzFQs5PTWngXe6sRZ5XsXqOF4w83Ma+YopACVz7fDWoyL9prR1E/OAbCL0BCVwshb
 3jkHMv2oYzHcRD3mYxvL+IgYybkc9JSvUeQz7fPq4RA/dd4ZQHZGZbCRUOzrX3xkBwnhpzfnFWI
 yq7iab3sU5cAdM+sd+THiOv841y1ZLzfD8SqBwVQ8Q/d/HhTUU6OrfL/tU5TnRAq2H6eP3gqmMJ
 miIL1arHT74G9POjkIw==
X-Proofpoint-GUID: wgUKfaxsO_XvEuVtI-CwbnssRkYbfTR0
X-Proofpoint-ORIG-GUID: wgUKfaxsO_XvEuVtI-CwbnssRkYbfTR0
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20b440 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226

On Wed, Jun 03, 2026 at 08:29:28PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
