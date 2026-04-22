Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474B1E7660
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819590; cv=none; b=dUYn9ZSSjzQWKQ6ExuqIE47IjhIY9+7lWUGheo0mLyX44+TqgytqTJhJvZVSJPpCVr0Bd9z9xgPFGO/iXiZzDOtF6+g1QjQDdyR2bJAXS6P62LN13sXg1qzvuiuMxlwrGLDCpgq+vo5GvzvTtBYMtRiWnu+c5EesXeMu2L81s2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819590; c=relaxed/simple;
	bh=lm+XVm4LjnA8m8Tpd4f94amRR/VqY8aEivvhQWHxa20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKJdWTQcED/Q5Io3PxREBOXhqVYjb/V9zxE7AAAwr+R3SP821upaOfg6csaYNCnki534Z24p/Lgeerb284v1NMg3fN7/TKE3OXH/IpzF2l7PzLlanMucjJ0+xYT9DSDDDP5N9Gya9M5cPpXlb9dEFiuH1Yt01Roy8nSaJFzSqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHyuQXwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3VqAByc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHyuQXwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3VqAByc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZmv92123571
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cDtdgFx/StWBvO59JHE0x9HU
	NUeMZHcq/ZWbreMj7zI=; b=mHyuQXwWo8yIC8ppdpSmRNIyZiWKlMoXtghSX7Tp
	IClA6DEnVPUXlISYKl96XjpgHOb9fF2FZu9AMA1wiu6+M8Mf5zNXerq58LZTMJsw
	euL1GszBidd73T8k+czLdYGEatHpRzEzMkSI1xw5JTvnm3T2N0Na35GRGELP2OeV
	oegcjCFw4m/jyTsVKyGsWhSv6c/hGwvnBI5FU5mVovnJxJIQmmgEuNZvqx84AjZB
	vjixcHzzWD7wpXDJozry3BQD0UP7OqPgZ+fAtfsV9flQiYWpoRHzYhnM+85E6Lv3
	5bk0QSZI+D8p5SjqXAXV7nwotgCGYjowss8a6YfLl8MI4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfs01y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:59:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb0aa51c6so29544496d6.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819586; x=1777424386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDtdgFx/StWBvO59JHE0x9HUNUeMZHcq/ZWbreMj7zI=;
        b=i3VqABycCsQVBhGWbxuuLrtzoD2NRlZIWtDJ5Ozo/ZzY3h5s0vw0jN+3m0bXSTNk+t
         2uEg1l5ZFSo60885b12D3qbouDDH+AcQtjJ9gEnJCw+ZsXJXDDAu2s6l0iULOte5NOEi
         8rTs3heF+TovqsieqHd8jvggg0Lae1qBF/pwk+F4Derl+q8vHX2SSAHhy+d+bheK9AkF
         djAQzKJO9l8KJzHvIGC5ReRQAzdA9ZL5CjlkdYW+aaukQmdMEpax0yeTWGNLwsgMkMC6
         4Cb+ndy9/mKxw7Wck10lTOfWMU++7USplOL18G3b5sIRJGT5N+tqxIx7h/EEI/e6KVzq
         rrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819586; x=1777424386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDtdgFx/StWBvO59JHE0x9HUNUeMZHcq/ZWbreMj7zI=;
        b=WsKTRgSMaRq79toPUPmyqLnyY/cUdgkytnxpAdE7GrlWT+wnmXCXSp5PihjeBELEdN
         XjpupgSLZfvY3esp/m82Y09NCH/G40qkD5m1bcN7YZGwsQVjNKaMa1KMO/2NZGn+C/rE
         A/ctb6Mt55ntsdAuXF1GPreym0oHtcScMI4C6OtQ0Pl23a9IFPTVY4wp8yKPyPTXjoD1
         tzosdpmX4rpfvKu20PKTCMbeMWkPeuupA9F0dn4td8y0YJkqFtYVPz8fmu7LVcBWP15E
         9u7plZ4Cs4irEBbePcXbgFy75J98XJ5E/KrVR+FjAiVAB479I0Zti6Qy8c0zvcfqCzjW
         eW1w==
X-Forwarded-Encrypted: i=1; AFNElJ8ZdqOwceu5VRGwypLfA61HhzuBJ63SDi4GwKY4riX+IzhKdui4zD9g1o5EEwla+Mxs6tdKDWX+jiGf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyle0R26V6lRgyST7MO/jmQj9dT0V1frmnb2UI3J70gzzLquYAe
	e2hSwCOj3RzBpOcS9FTWXEwUbjBiRyDEAyoBRWEzsMsICFKG11W7O3laQWxH7+UTDmBqcr26KnS
	oL0L1uLRQq/4Wm/fmgxXZP4oA1cOqK/KWl2fYOXhz415MwLXCo9yvMh3aJ1dtmfIM
X-Gm-Gg: AeBDiesaiih2QCPrU3ar7Zc5BB1WqbRyO4/NiMlbq8dyRSqmYYbGpInKL8yOfOeMjpv
	4C7O57o08sMRJEj/QTx0Zf6ONvOYJspdmvMei9s+aeepCFRSvO1rwEMEtwUPqoRbBMk8gE6SvHr
	Nf1/tY6az3ilCUlP3uLpDLQw5B0kJDyBna0VsbRt3XXc+++6dgtOS+Ep0UhL25aOIplYlEG1oJw
	r+YDDn/R5lG0kB59Rum0yAlCt+n3uNMCvCbVbb1toYkNmOMLc+rPWea1mIgLhf+LyToYImO8+i1
	PxfMbiBIRb0aXxUxg10FUnEAszJ5uqu7YX9K8lMeBD2jI9y6VXmO0/dkId4+Gk8QRzXHtJIa13t
	WXTuJNzytHUPavwhTVRuG8VyLvDPX8F/tJzDF/5d+XlMpnSQm+qyCLcTkP7Drzy6kYgEuGNjLrl
	JWMW1o7kbzkCnbXiTk7tnEVx/MBM+t/LWJuTg6EVyvy0s5lQ==
X-Received: by 2002:a05:6214:4986:b0:8ac:bb62:fe65 with SMTP id 6a1803df08f44-8b0287959cdmr316609306d6.23.1776819586092;
        Tue, 21 Apr 2026 17:59:46 -0700 (PDT)
X-Received: by 2002:a05:6214:4986:b0:8ac:bb62:fe65 with SMTP id 6a1803df08f44-8b0287959cdmr316608956d6.23.1776819585633;
        Tue, 21 Apr 2026 17:59:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad138sm4064885e87.9.2026.04.21.17.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:59:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:59:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 4/8] iommu/msm: Look up masters per IOMMU instance
Message-ID: <g5jfi6d4e3osqe3255v4fzr3eqduaxss42dodogfsn6rji3znn@dlk3tey3p6un>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-4-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-4-bcb0857724de@alex-min.fr>
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e81d83 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qBQ8OOdg5lpXHOzljU0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ej3g-TcCuxgjI9jyDyD0MWMG0iQYJwp1
X-Proofpoint-GUID: ej3g-TcCuxgjI9jyDyD0MWMG0iQYJwp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX7kBaH61TFrwj
 8/Ied0P8JJF3zHZd6wjwwiDtEIXnGKpaVGOHZGitrXuGUA40CWIs6p/GrpEbBpYou7MSnuQnLpc
 /mcX3t7T7fHnyjdKAPRB7aEqPJhHDgi4KxXkh3y/x68PVq3Vaijq5JnWFbWVWHgRAi3ExtswBFx
 LyfBZWOxCGvGlztzh9c1/awKv0bCJPGztEH2GMmZXiRiD/IsPyrwEhELqgPr+M3EbmJkwN1hCon
 a41guCrYGfP57EgLT8XzKP9WRWfE2zelahXU1OuQWETVtaIACDwCrLfNhUQVch9jQd4/ZiH6UwS
 gmuZvhMc4cb2SxLz4Sef1Y7fC3VuKj5//JZRNyVDe/MAZt+52DARWuS9fe8FeIBUqbg2TFwRjwC
 NRHxr17Z27C0cBkwEAKb9Fg4mvn1KuUL29mctlOVOxTcMnkL4OWgRCPzPm/Pppp3PCw+9PdZ1Fo
 VzhMtzuRf7BVh08VRSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220007

On Tue, Apr 21, 2026 at 11:45:10AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MSM IOMMU stores context descriptors on each IOMMU instance. Looking up
> the descriptor through dev_iommu_priv_get() is not sufficient because a
> device can reference multiple IOMMU provider nodes.
> 
> Look up the master from the target IOMMU ctx_list instead, and use the
> same helper when probing and attaching devices. This avoids dereferencing
> a NULL master when an IOMMU already has context entries for another
> device, and keeps separate context descriptors for separate IOMMU
> instances.
> 
> This is required to boot APQ8064 boards using multiple IOMMU contexts.

Which cores / devices? Could you please add a (trimmed) backtrace? Also
a Fixes tag would be nice.

> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/iommu/msm_iommu.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 0ad5ff431d5b..9c03878d0d2c 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -357,17 +357,25 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
>  	return 0;
>  }
>  
> +static struct msm_iommu_ctx_dev *find_iommu_master(struct msm_iommu_dev *iommu,
> +						   struct device *dev)
> +{
> +	struct msm_iommu_ctx_dev *master;
> +
> +	list_for_each_entry(master, &iommu->ctx_list, list)
> +		if (master->of_node == dev->of_node)
> +			return master;
> +
> +	return NULL;
> +}
> +
>  /* Must be called under msm_iommu_lock */
>  static struct msm_iommu_dev *find_iommu_for_dev(struct device *dev)
>  {
>  	struct msm_iommu_dev *iommu, *ret = NULL;
> -	struct msm_iommu_ctx_dev *master;
>  
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -		master = list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node == dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret = iommu;
>  			break;
>  		}
> @@ -405,10 +413,7 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev,
>  
>  	spin_lock_irqsave(&msm_iommu_lock, flags);
>  	list_for_each_entry(iommu, &qcom_iommu_devices, dev_node) {
> -		master = list_first_entry(&iommu->ctx_list,
> -					  struct msm_iommu_ctx_dev,
> -					  list);
> -		if (master->of_node == dev->of_node) {
> +		if (find_iommu_master(iommu, dev)) {
>  			ret = __enable_clocks(iommu);
>  			if (ret)
>  				goto fail;
> @@ -601,10 +606,10 @@ static int insert_iommu_master(struct device *dev,
>  				struct msm_iommu_dev **iommu,
>  				const struct of_phandle_args *spec)
>  {
> -	struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
> +	struct msm_iommu_ctx_dev *master = find_iommu_master(*iommu, dev);
>  	int sid;
>  
> -	if (list_empty(&(*iommu)->ctx_list)) {
> +	if (!master) {
>  		master = kzalloc_obj(*master, GFP_ATOMIC);
>  		if (!master) {
>  			dev_err(dev, "Failed to allocate iommu_master\n");
> @@ -612,7 +617,6 @@ static int insert_iommu_master(struct device *dev,
>  		}
>  		master->of_node = dev->of_node;
>  		list_add(&master->list, &(*iommu)->ctx_list);
> -		dev_iommu_priv_set(dev, master);
>  	}
>  
>  	for (sid = 0; sid < master->num_mids; sid++)
> 
> -- 
> 2.43.0
> 
> 

-- 
With best wishes
Dmitry
