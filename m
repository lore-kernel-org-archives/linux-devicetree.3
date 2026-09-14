Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A723EA97
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346990; cv=none; b=C39BdRMwjFl8qDzcYvHfL/XJhsdJlNVnl0FmycRnSLHUSdLMBPHimDqnFyNPPJRg+8+m8qLTcZP7uDj2Nf+gubbHJnYCyMdUowTYYA0BXs7IAb5Xo2SmZtywlQX4jS4IxPyzM+wCvQrGbvq5zbIrvUvGjdC3J0pCgw7IsP3Trxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346990; c=relaxed/simple;
	bh=cSBSDsxfm4ZE7u4EPJKxLpqE81CRtevp5nYLTpqjDR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejsdI7PEeAIJMgzSpcpnJ6EM+gPHX6dHrdEntIP7t2DsTwtXv6H5DH+EfuU2VGSfuOyHLL0Mmjf+KBFqFJDigowdoBxv5fQo47xg2sgylrsjKNmLuzUuM3Fxutzho8RU2Dp5+2RhbWvsCQFpWg2DMm0ztx4tf6uUCMHPnRQ3MkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPjvea92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3TlfYsA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPjvea92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3TlfYsA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Cp82659972
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krxzRCBNf6IAYBv92gpHf6Fb
	vyiCF798aoMw427kF6U=; b=KPjvea92vvXTcX6alUjNOQuEyvFCVPEEGPCjbaCV
	ElczueZvP/ymcuOD/W4YbmOOVtZtrXXF6gLnUqg58NX2VuW3qv/3pWNgqRzOUhqI
	QD64TfW3Tw1CLaoQ9iBIb7ftxX+ADJHmPbxrPMnBRbdXiuEKJsYVOaLyJC1QTlzQ
	RAAQJDEAe3k4GqQhymLVai7bsmvWQui536QVSQyviOq9DTHPN/DBvVUcKqfk9k5P
	s6xoQX7Ei1wyN/pT2V3sAbIFyn3N4A1DOirQAo/DPD9HdPxg9X58V9hLqBdirxbq
	IxRdZS8+/7TpVx2yEtcdv7v5teNIRKpKwKhfyM3phkx9Hw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4gea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:49:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so623101e0c.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346988; x=1789951788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krxzRCBNf6IAYBv92gpHf6FbvyiCF798aoMw427kF6U=;
        b=T3TlfYsAx+3MkOukpeNzLitaDNz+6ed7EiB2l+8DyW4YxDXh17bqL+oFbBi7FVo5AR
         wnL4/rHS5Hqgj4yeZaog/TdM8hSlpuApUJCfrKKFB7nXqy+eQpbyqrP27vFZI8f9xOZy
         a4wrbE53OMGdgxYDGEoFzaj+lYP+a2B4eGbgSocOazATgNt5nOpd41mD/igL/qPExHvq
         QR9j93Iky4pnY2RXHzT6sPLLVeKpbo5W42wzmhVFXB96ssaVrxJ0NcdxEk5g23l8G6OG
         WbRUZSP+1rN4QSw73o56PaEfFIm671cfGInL96JAisqJYeqRR0IY+Yn01dYQea3oz+w2
         NOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346988; x=1789951788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krxzRCBNf6IAYBv92gpHf6FbvyiCF798aoMw427kF6U=;
        b=JqM5uH2/bWFeTQ/9eaiRoifiL/cNXwqBKnooDT++wABGAyw7VVHTAV00qI79UNI6G7
         bGJJw3qnnCHSnAMXD3VsTngOT3fNT1BPUb7xouLWUqs8KmVVHrwANmjGInaBWo0uswQZ
         jRi6amDQ0ODMHwSR5pH4hV4tbO/tbuhldiOCuBbNNgX8ohXlu0up7WhuBM813rAP2vvR
         MTbEC6YeHcLYh9Rt2Ex5/XM2pVTemRpyXYIE/f3FR3mn9zxKmvddTJDQXIMx3Gpf6hWb
         jONtb7mc8ydhy+BzRZaq/yDeXSp9uck7EAaC5xJeaZtYztGPO9NmaVpHM5ZvRc5Z9to2
         uRSA==
X-Forwarded-Encrypted: i=1; AKwUvBxSOFpMgjEzvJrnmmFHl+vdM7j8lpOndgvnFFoLEHnMBPx+MCNxj/KCsRhEq5DERVY/3bRKcICB/k+S@vger.kernel.org
X-Gm-Message-State: AFuF++l8xEWkk29SD6bToU7kRgMhJ4ddW2PjPsIsw4m6RUYZtxGpoqmU
	Ig4YPllO4nQ6RfyeAzLbBGLROFwH90oJZ9/FM6kHfSS3uv4E/aGpW8l8kOH7mGINF7LPtKn1aMc
	65M6rI0j4wUlzIPorrcTn/edgt4ib1+IIknAauQCYPIPvIa+hOauxn7cYqWrutEB8
X-Gm-Gg: AYBFou3ejmpmeXTSZ8UuVL0tGELeiN00/LrrwpJeyqgC7keEiPDV285nmoyvQPowFRQ
	zjwq7gPFUWza7J5gxDXWjyY0WKUoKL30/hzM04f2mDQLblQITqKoC5NMBEw4kudnSqKVU+W1UOJ
	rnXCB8ml6FpbhM8nzhMqoHZJ7jWTDjg8fpj80/YPJw6DNghBWAYe+4xK7LzRXd/ohovAJmwyrHt
	GAuXzqGbUT7Z0GcoX9hsbWpcymuhZYrDDy4u7XWEB9tzKf8Wgp5frY9pXSP6JtERKuLd4B1xKki
	1XQP758tBO4wLVABvAtaNkXJvujnwsKGmDOQ0AvonN5ewLG3aMJjE9OllQ1PRfK3px3Na8G2Bot
	Bh6Vl9dAJKdJocDCazMt9Ca58hR3qyp7gdGmTzI7Av0N+BMBbkFUBBWaaTEpRdWyoS2NJJqDBgu
	kvSF2ktvO+3X+x
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr114324137.4.1789346987280;
        Sun, 13 Sep 2026 17:49:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr114312137.4.1789346986825;
        Sun, 13 Sep 2026 17:49:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c06sm2106722e87.28.2026.09.13.17.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:49:44 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Message-ID: <hqm4hn56tewbc5xexxtpyiijcld3sy2mt3e4nulwepms44imq7@ke2lzseaieqq>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa744ac cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oMov3bMtrqd5QQYwA5wA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX2Ya1R5bgYJur
 2IVKnEy8vfA6oNLmpgPol3WLF2EhebsvQBH+TUuoWQaLpVkiGHpvpJr6b8iLHAGt9vNIi/ABbN7
 LYP0qxIZ0y4KQFbagk+aRtlwtFX1de9StpSoLcmIVLNNTbYsQPM/uLl5AobVEjAbAnU9hqZmNl+
 ifCEYagOvz5DEetj4LeSLVSsYgd4GeL1OnwBXBitGmYZbW6t49MrMsCjBu1vw5AIhyno7qMPmPy
 BfbLlC39Cq30/iqcm5p63JwQW2gv1vbL/rxherOej0VOWUuY1Vn6Pvje/WStf/CUEzS/GJpT8lu
 b2krVg89HGIVyBYtUey0TFo5wcwa344cbsDRaEYKgRHTd/5UBsm3QNfILcopZ9EmxYKwddwZkqR
 x7EWtSjtTYMbu+PBSg8x1KzIaiqHdQ8VJSmWMZrDdocI3+C59texYjErxHTxL+sddyuWf20vET4
 Fub5T3ZFsl6uN3DVwLQ==
X-Proofpoint-ORIG-GUID: bag2l-WiT7ArbWrDMOP_TJh8Yr2GoCou
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXySSbYfzQOr/P
 vf/S/qjuZpvBmUXlPox5O4enWB//R2Dw+FFAnVu4ln6jVaukPm+CrXHotzmFHj+0RlSAOdlM+w/
 BDfR/5BeC8XzDROy3XHFWej81Cf+Vjw=
X-Proofpoint-GUID: bag2l-WiT7ArbWrDMOP_TJh8Yr2GoCou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:39PM +0200, Krzysztof Kozlowski wrote:
> Correct confusing indentation within else {} block in
> dsi_mgr_bridge_mode_valid().
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
