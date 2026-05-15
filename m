Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5C3CF051
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840733; cv=none; b=Fc64qFs+Vr4Uy4avpFTI7n2HLrYf1s1Ergg90n/ojHq4+3sWDgjN01wrRpp+2HRWZPcM6b1sL8jvsX2r9BqAOxxaSgGowTbHQx0aILUAfi3kuYtaFQfxIjDQHmcmCZBNyFj/og3AJKLXNnno58dh4H6zaxdXXbwTEGgtQ0Yo3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840733; c=relaxed/simple;
	bh=FIJBGrHTL4FdYrHCnRzSc0YOaWpM7/1dy9GeUxnVF5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHt/6INvPSdco49uJoRNd3zTkG9lHI7zTKpfPeHD6/RcCLCh4OQTo4fe8nid43fvr8ZBcaYnsC9daRibWfO03EuVuR/YJxZFk5vQj/c8izxfd9Ua195nTzpXy3M7FWtfPGyRjmE0DKnQ63EdocGK6d6+U2Xu3Gydw/nQAAR7PKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmBmKlay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfOAGsO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmBmKlay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfOAGsO3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4gdrl3200311
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w
	2K7GvYNa5jVkdlNAg/0=; b=OmBmKlayRNMel9mvbgdMIZEbSilGItVQXKMJueXE
	4oa29BqJbWUkUOK3xI80BzH7SG6WiDAuC39wZD8jCVTqHHbtEKgB7xlHQB13AKX7
	7aFuHh4DtTzWyvaXIr2ZF/YDyPmdgLExzMwPSL8vkaWh/MzloL4ogZ0XL5WKRuEK
	93f45x7Iv9XKk8QeeKWNaWAx/oFBlsjnZdUwPm6kfveHj81nPp0s3o/KaSjDNvTj
	SD9qefJdk4kLCvoPwbpD2MGnbm+b+l+tM+YqskX8HqaPa+NEnJLFFk3hpZsxEZ76
	A/4SXKFrthKn84w/iWvO7JJQF+hGYFyIaKQNX0j7hQdFHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtsm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:25:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so19653991cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840729; x=1779445529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w2K7GvYNa5jVkdlNAg/0=;
        b=XfOAGsO33lM4+D92VLqmsIww0yWc5xfJCqOVDd0zNFEAKI+bwCNn8s1Qm9WIi2AJA+
         hRoaCswqwscD5FXVqhS4+Isa/q/w8fLqyGy5jkaL2g2zcVrV5A4Kul9KbtC82+zGalKc
         GFnrh2brh1XDYDfqUs6BJcBgael9VNQeaXJBQ315LwTR6lxdgF6Ssq4AimzHz2JXAIq9
         886eKnWPGfTX0vxv/2ijWXz7luVoO2q9yVw5s4qTJ8CciQ2+aQRHs2PVG+B9ETe9cJf1
         ww9HoavNvI+DE4YO22+6Tmx9683CSizxuUxGoRmlQcyvsKZuC+siuKLOFnsv4c7XQlF7
         os4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840729; x=1779445529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRSMmQ/Cq1LqIW/QrE3Bu/0w2K7GvYNa5jVkdlNAg/0=;
        b=JKn9kRiCO7zpV5KNNILF5bx+W3Io+4oW7EpbTWx2QXnS4VgEs1TT56P1Tl7tskOKDA
         RJRxUtX5L3fa4IFwnOalyqbQFFAGOLAQAoHnjFr+pVSWk9BQTNuuwFmI8AvPZQybF5bJ
         E5g5F+Yf2TwBJg+l0piFzNHL5peIL297E/Y58qI8ZGAL186Q9P3e6W6hYkUeF7c6USDf
         chdCuxVJurDo6CIcqxfK9qFfTqiqFSVHDV8C6irAXIagWdp0mbfjSgeP/NJBDr74GMe8
         WdMIQgF2PinT1JEqUy4+BT9pF/p86zo96b/5wLGQXRH2pZshTQAwvyYbSyy1t9jiNqUF
         h24A==
X-Forwarded-Encrypted: i=1; AFNElJ9pqbULNkOgPBeL70552a+O8BgCfuDMw5aI6Lif9G0r2+F8qtonzc2hQyptfjHKKyd75NFVN+sDGow5@vger.kernel.org
X-Gm-Message-State: AOJu0YwULV4vfLAP6p6U7sRZIeCSq0YtxwxZmBCskIIt9/FejgwnfTKP
	8p331MZCcpb8Z/zFlX8woGOt2QLaQZCjTxg9NOeUrmuWL3re9wiWVA/83dnp7GCkS4wVexkzINJ
	Z9PI6MHK8XYhvUrTsmIUtKfg4fXoEZnfRHCGh4yYnMOmIcfvyn5nLxaNLWIP78fIM
X-Gm-Gg: Acq92OFGic990QQA98rSNOremQpFAlHPoumchKKAjwZzMY3GQ05vRtyQbJ6Lq6qbvs4
	1gtQhkSFPkDrXb144uiKVOGI7BIGsTcmxhM+EsWBksrmp50a7KujlPAW3NHk4bmPyZmArPIV2gT
	aZFce88zGldxs82v6mmQMgVDTx9eiLE+OFnWCOK7F48HpRsxAYoiQ8CBcMtg0LHxJGCrc0PLD5K
	dM6UHXx3Bj11NXqP7J3Vg8qxBs9kHfQXszsoLkol888ZZZat8oCmXiqdnPKegY98Jm14uptuKT2
	5WcYueJBJNMA0ucF+ShEYvRzIfSIXKIc0DS8NkIOGU3xLuouItc2/AqDizCxYxp+YFla7o1jsaz
	6xySvDov8ajjX+W5yxZqu6FGLrg1pMx4nJWV6ot34/HUGiXRASXO6veRAVL8vM6llk5BeexX80V
	808E2HFTGGLE3aCOIaOYTMJVJcQDtIJksLaWs=
X-Received: by 2002:a05:622a:a90e:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-516418bb578mr75905921cf.31.1778840728968;
        Fri, 15 May 2026 03:25:28 -0700 (PDT)
X-Received: by 2002:a05:622a:a90e:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-516418bb578mr75905671cf.31.1778840728561;
        Fri, 15 May 2026 03:25:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c531sm1213085e87.4.2026.05.15.03.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:25:27 -0700 (PDT)
Date: Fri, 15 May 2026 13:25:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] interconnect: qcom: sc8280xp: Enable QoS
 configuration
Message-ID: <yorktzddkpgf3o64wgx67v3ti6an4z4o7yupcgo4hh6zfrpeey@lypcddxnocxg>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f499 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=NfFXuZlUh8PrNxB2MeMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 3eaIdFX3Xl3PLPsLXClEmGYroaEBPUZK
X-Proofpoint-ORIG-GUID: 3eaIdFX3Xl3PLPsLXClEmGYroaEBPUZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX3Lf+v8cg/uva
 AZxOcOxrBoUw2pNmV4scoDxaFzoNJjFUKB4ztL4QWLPg1P1RHr6cifobx9aqVUvENmS2BjRFoX0
 dlVVcS/a80HJ9YaR2Xvmg3oHYI0C8OGEReWo2rHzloj8S/cdEJH0AYlnu8bVKKFIknxVvNKjddk
 5i89yTsU0PIf8LT3210YUX/Io5eZfPWz9YbjoqgNCj8QznW99JnL4G4u1uukX0TOGyxsVAN3iWO
 7/plDljoKE0Y6BVlgxu+t8RAyG8JD98DC9VF4kiE1XO1TrSldfAEYW363mwOUDXDAWzojVWukdD
 Wh2EXfU0bvAOYUZMVY25RNDwIakyjAOC1Iq9O77kE17WaFfDGFKdkEsiGQd0CMngnZcPF2ojLLj
 9xGwV3sUQsd6R/cEUQZASzhUx4CwUEYbhaMF6TlcJSbOXE5QUg6OWJrCJ/SGUoJjPzUn+KllKWl
 Xmdsl7ZJrrYlmpEagJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104

On Thu, May 07, 2026 at 10:25:13PM +0800, Xilin Wu wrote:
> Enable static QoS configuration for SC8280XP NoC master ports with
> predefined priority and urgency forwarding values.
> 
> Add the QoS box data for the SC8280XP providers, add regmap configurations
> for the real NoCs, and mark only aggre1_noc and aggre2_noc as requiring
> clocks for QoS register access.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/interconnect/qcom/sc8280xp.c | 356 +++++++++++++++++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
