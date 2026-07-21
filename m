Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E53E49F5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674320; cv=none; b=WMbtHrXRG/iRQgoxMix4FOk7hIJhDHdgb5tJRMFnJqptMpdytu4MZa/AYJvdYmsBA0iei8YkdG4WfK+wXQiftZtSaxZx/jWVpdPie71JI2bLLByUDq+YnzAJ7NVUFoHsaTbRWU2r/PV4Y/qekfcn5w7Rj8HOwYnylyNuXm3wT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674320; c=relaxed/simple;
	bh=JrOknWscKHKF6jfjYw8SzYe4PSZVjoyP04yqzjfj/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrLWe24eUbKglHYKm+XJWtw5cCtMfbKTonW19xqofHpt0m0ha2rg8Dr+Qeb+9TNT37p8tMZKiOjDA7ATfWETIAF9P9txwfgegYzeM8Kp95EhLFeA58uTz9+woZ37lcNGF7Nm6qHD0cHHcK3YtM3qUl1O20MZcF/qr8Oa7u5mk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQh34pTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBz4sCE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQh34pTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBz4sCE7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZZVH3196660
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XS7xhh4HCfCvNxpAVUpkGBU6
	MKSoOMCEQaZdxWSYEO0=; b=MQh34pTK8MRFuRZtdTddPb+jXNkA8+u4M4BSQ0Y9
	iOOyv4AoEzc1rO2Sh3HprdK1WcKGFj/ZAbHy0CLewf2fFZX+TYCevx1URsS2xGZd
	VOQqm4s7JeyJ4PDTD/xgRuPNKeEO/fdqTBWmigArdpCzQq1Eh/lb+olIkPVjomX6
	vemmRo7JFBYUxVi9HmdbJa8yCLZBqsl5umtm0mK66NcYK2PyrBsCQEVvxMriE6Lq
	d7M1SDk01QwHzDCY0/WbcNAN+i+lTyZvlV7eDoKAw+bYQwQlxJeNcfOcgvupP9NB
	wFXYpA06m5a9sose5TbTjBFvZ2GmYDbysrNrtwFnmCNFcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863d2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:51:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so323312861cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674316; x=1785279116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=HBz4sCE7/Ml9cDzNL+Ewi57PDfL7Uk2qIDGtthHX3Y2edozlPJglb+brEUil7o1YZz
         Ae3pti8OZgL4EThxcwdzTJLOEj+4b8ORm3yZEOOA0fCs9p5zdPvG29Ml0K8+hsVG8FG3
         Gxm8H5yPhg1VW1fzZ5DaArXV2erZFZnMedWtucK0wby1i1b41vlvKlOLkjezgx2gApLK
         uvGmeUn21/A+r7AeJ4+M6w5EZFoxlfRk8NOi/QMZIvGOSIU46Ife07+rXwd2g4B61Hjd
         L65B2TT8LrBgFzL52rq9VJetRWyFFsqNDj36CQrZKfFyIXpY5H6Wa6ZUFEemcXnbv+ax
         KmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674316; x=1785279116;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XS7xhh4HCfCvNxpAVUpkGBU6MKSoOMCEQaZdxWSYEO0=;
        b=IKrzAnugq6UWw6pBd81YbKz9XFSWiXQvHnXFP7CaAe4NH0v/E7l8Lwy0QBCzojAVK4
         toQU+UGJLBLZAsVyKfWb94MJLxr8pCUVGANzNgvswvRpMO3+t6QgHb+5LP1w8T0xkrx3
         K8dDxxNqmPg6hYTgG50TNjS3bgKRUQEZxvxNvRIN1ZSxL9AK03W5QZdDPp1dZswoxK0G
         WNH4yKjO5HA4T0CCUjM26GoJ+QvI1z0YuWnXGUgOGR+EnDRiVqbsuSXrWHhOkwn99v3Z
         5MTD3+gyQHpD5Ee07SomCd0GyeSmGoeWGiq6C9r/xUCisZwEuDqPTJTTjgqC95UbGZXb
         x2wA==
X-Forwarded-Encrypted: i=1; AHgh+RpoCAA5E6ed+MvZW2W1CUc+IY3oJ3oJzqs3mz4cS4MOuPnSssNaPMURCMY/mwKRnYavz68Xbp4XqMzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yywun1s0bmZ6rdou4z/SqpQn5oxK+GLMgO5CKqwnOfSvNgRGyAY
	LB7rIT8aN/7N+eA/OHnTYlHKCjPXhqlpt3jQ6UknsWqpFqIsjvhx9GqIiaw/lK5N0h310wbaE83
	DgHZ1FzMz7H9yOHFU4OrCmpbTohkF2rH5Tu+rB9jrZjlra/+i/ZAiEVg2VW20c6zP
X-Gm-Gg: AfdE7cmGZXtBKHAapfz0xmgpkTCJ2W17BLOldcwzHoiUGLZiIGifyQmUeyhsp7JT5vc
	TBc9dItZxw6ucWTSStuoiu9yHJUYTaxxyl1nwO/YRJ6OoHHFUbh9Klyfc6Rv1NsKs/uwOLR5QAz
	1SKJrgwO/6viM86lCM60wbcPVoDhjuJEeCDgDdEwIX68xzhAQFvCM5wxDTuFy1+F9GX3PasOLbG
	urPA42lAng9biVPVbwH3DUaLlAub5jmBs3neWFbbOnzuUy3/YVjGK0++TOgZVVueQUPzABjnRGg
	9OC/A2s+BJzdHcrnj/aEUMvdoSpv1HFhNsiZ+qxnlqiAeSyzLPE3+ahjTvdRpJyEe8P1lsKUx4D
	C20V9AoZSXox2dhkQT9bSRQNIzroKDLPdnxTFGrq91cZ9lUDRXRxkLUP2ZkKE0G3VNsMhqRav5G
	X6ssWy6/tVvbBXJQ==
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401381cf.42.1784674316316;
        Tue, 21 Jul 2026 15:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr202401211cf.42.1784674315887;
        Tue, 21 Jul 2026 15:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c82sm151883e87.41.2026.07.21.15.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:51:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:51:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Message-ID: <vnqbthpnjfgwm3bsp3lysfhugxfljd3cictjmwvn4kuavytvmt@lwkhsuydhamk>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfXzLLVKDGadHlK
 Gly+6va0dkII8YANvfZ4gWhP7yim0Rg1MUI3PuCvIATn2OLa4TUQ5eG3hYoH0ZkMPSg2u7m/+Uc
 lBqZ1jUgDh4lFGTUV6Rt/550k55VhHU=
X-Proofpoint-ORIG-GUID: 5ANNbJjPICdOsR3zHrPe77_k7thIFkTS
X-Proofpoint-GUID: 5ANNbJjPICdOsR3zHrPe77_k7thIFkTS
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5ff80c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cyArV0-BNq6UFoJ5HPsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX9hpiLhRa93K3
 yMtwMhRycbdsMDQw9qx4qsAJxs4o9naFLMDKBBLYnElfvTlM5GFM8cw8PnEVV7F8nDAa8vrR2hq
 SduVW2ZuDxgRRxFvlh1+WjGpS9ouvQfEQH8aZ0eo69QNRehVOyxwMEq9c54eDsxGMZtGyua6LX0
 2apo/rm4zr46gn5LgYZT5GtaLk5/FJ/uCPneSTQnVQa6zQU0W2GD6XixEThXzuiRz9MWAu9Extq
 ckIKq7H7n/4la+brSNoda6llMhkFnRjatGO2DIbAyqtN94tipG+nuGcinUI5hmYy9gXJuZb/VMm
 bvgCrFVwiFjKwgwlf2KAVYl4tvvLr7SUwI4Nn+8PAdtvYL9EwLYQxbE1XgDbqvr3qxUtIzb3o8H
 tFQYKm1qWMyilxF59aeURcOUZilvwr83hEI6Isydvye7Dskn0q1ZczpDjYW0k92k4QwgizbcOiC
 uPXe6m/Sas7iuyoSyNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210236

On Wed, Jul 15, 2026 at 02:37:47AM -0400, Esteban Urrutia wrote:
> Some SoCs such as SM8475 write data to registers using this offset,
> specifically SW_CTRL2 and MX_CTRL2.
> Add pcs_lane1 offset to V5 offsets to support this.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Fixes: 0fd0b31965b0 ("phy: qualcomm: qmp-pcie: add support for SAR2130P")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
