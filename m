Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1C346E44
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776654402; cv=none; b=ud1CKzafFgpRa/UMLnQxiw38OITHPedX8qh9Gf4jmuglPQpjT52PhKwd+iY4y4Xqn+DW9EEZt5BkiRiXOvPAVTxqnZKN9Bq4EPAiF/VekVsYJE5nCOk6xTPhAF7NcsbSbSk0MnWykmsBsPICp4ae9YhxBlp0mpoNDg/NdhvWwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776654402; c=relaxed/simple;
	bh=9QpjkbzUHj7iJ0WSIpYlaA847KzMl3XyfmSV5sBuy1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTOTpWJomSLYz7HqHQ3ThUv7wJ6KrtNRFDkvEMHDMTuvMCSsxBi6Z7DFmy6CTMlfOnTmurX9Yr16HLKY1GKsUXPY4oqOCrsOPZI4cLFiM8B8Hh1f3uE/PEm4EiLQD41l4A5zjCCw35fOZon5nbJ7duiE22ihqqYvaJom1806cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeAm3O+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqzJ5zKr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeAm3O+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqzJ5zKr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K2ZcP73289478
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rtl+6BW8W96h2knkFuBlb08o
	nlTQOueBJrF/qpTFCGo=; b=EeAm3O+xDAnsqjBWSwWHXLk5w3dFL5VST11xec3M
	cJUYoLpE/IFBcdaW2/WljOzUUeBxyoKuGjdMM6G8j1dRsN4CFMGXyZvBdwnTr/rE
	7GOwa4sBPnBAmAFG29EyLqaSwdYlzw8WZAaAc5VeW8H6UVf5kvs4Cc81H8JvE0Xv
	oRiUSzF9UPLUhbGVZ52mWGcXfFBY7c6krllIcr5bJr1J+R5Z0W6N2n6RvMeydSN3
	A50LJttDcwowVNGL+wS95T2fADXR0GOyCkaOWhNvGXzFXx+iwI+2XE/56qmLNa3y
	LxivIIS/zArdFaR5TDf/ANpnmhHnSHoBzFhVFsZ+8rR8yg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b73qs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:06:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9d52ad9aso49155181cf.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776654400; x=1777259200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtl+6BW8W96h2knkFuBlb08onlTQOueBJrF/qpTFCGo=;
        b=KqzJ5zKruUnuRI9m1NelYuxKgZkriyRmQeFpxcXJzEXxdKEJKp7KWrQ7DdJQR6UE/1
         83a2QeXg9mT/Ym3DzApmciWVohoal5Am2eg0zM+DdpgJ3vxAqbUwq2C7YALLAUSlVSSk
         7rVLLfgvrdNvIgyH6dLEA8LLIJlMAAutZo4ButQf2l4LGSfjYBUQCfwOJ1XjiRFvWReR
         E+0cm8gAV1ALhcylLW5NsWjljqbFazR+DnegSvF3vweBMMTlbElOY0AC2u9MeCEL0HMC
         Tw1TewkytL4kYs2jgJ3SVcC3Wyn5FQnalIRYJKyNl1wyLpsUTFH0r9eNiq2PKP6zmrnk
         1Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776654400; x=1777259200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtl+6BW8W96h2knkFuBlb08onlTQOueBJrF/qpTFCGo=;
        b=NjABQxVbpyXIfNEv6G82A3T+SgUnOq2uINF9wHqoYn3/B8KMrXtd8Y9fuUK8eSBS0c
         nu2RPbiHYSuh/P5xxjHVS4ldiq4astJ4LbSXk26SbDvRp2QFVQo8LGS9IA1qdRh+RnnL
         AVZ5hrjHQ/Dr3xA8XdNISzH7YuEMnOifcESwrJQLzIKxaOMcFHjhOPRkR0thmvBaNJmn
         Ztu/hK8Mji3uaMKW/KYVsiMc2WSBOGASX4LZaA56lPivVjimqqT7zCTGYMvAZlx0VgSQ
         q/Z7zWqTPOT/s06qGlx0T4VgSUxSZ5RuMeZDHI493Zj7B+rCi6W+OJOa8QmDmqSB50ZO
         lW9g==
X-Forwarded-Encrypted: i=1; AFNElJ/P3PsaFHtOks5iGAw2FUdaUs4eH6kNqqgZfVSeNjXcI8VKYNhHN8vEO/mR+ebv+Kj5sm3XPNaDuL/t@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2KW/Yvsn+qvDayxUWwyo/N0poYfQZySU12FgYvrK7h0YZito
	xBwx1Lowlgj/VraB7PNp8wYVOtF9TSAlbm5QG0lZ2H7/cbq4th5iRE20bnZQXSzMEnWL9HMCFC5
	3C+X7F6nXlFNk20n19AT2LNvGw1uWiwZG4sb3Y96amqcC39SQrB9jLRqYD6ZZcT57
X-Gm-Gg: AeBDiesa/hJXg3asEGbA3N4/S827NluxeMnUpRtAPjUNcxK8JCnce/CLZ1l+5PzVsnO
	i/Tgb3aXKddh+QyNKlshjrNxcLHhcp+5qHuciTZTSrmOdBUFieEnBsqZ+cUKUw95XhMZkj/sp/3
	7RzG9wTs9iaf0Ykgjd6/17KfFE934ASQXq87+DWsNvmaN6oxo98sksGUltMPBbiRhynJ0TGCyEn
	4JHRKg1Bywd4vl61Tth+gqqrSkrGXDN/DJ/tjeXgLBQDstRq8UPjk+OJBnCGhK97vqAXjYoMFOC
	HvvH8+g28KGg348EA1jOoLr0ydkdSehO+KESnrzQLJruDtX0frB+WfLEQFe4SqXZMK44claoUv/
	Ip0uds2qyMm8DBHclCBDYZ9+wTOyJOoWfA6z+V4T1qNI97IzpMJXd0FhA4g7tfDIgt/LajqlNiW
	8286kRbNiGMHIrhHd5KAinYchfoX1io7nM9yRUAE6OArUGBw==
X-Received: by 2002:a05:622a:4189:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50e3693d07amr181294621cf.16.1776654400030;
        Sun, 19 Apr 2026 20:06:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4189:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50e3693d07amr181294201cf.16.1776654399547;
        Sun, 19 Apr 2026 20:06:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1116sm2667146e87.54.2026.04.19.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:06:38 -0700 (PDT)
Date: Mon, 20 Apr 2026 06:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        FUKAUMI Naoki <naoki@radxa.com>, Heiko Stuebner <heiko@sntech.de>,
        Hsun Lai <i@chainsx.cn>, Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jimmy Hon <honyuenkwun@gmail.com>, John Clark <inindev@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Opdenacker <michael.opdenacker@rootcommit.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Mykola Kvach <xakep.amatop@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Robinson <pbrobinson@gmail.com>,
        Quentin Schulz <quentin.schulz@cherry.de>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <ilprfltw6ju2jpo4hrrypscljrlw3xqi7h2mf5sv2k2iy3xeu5@4d76innmpoav>
References: <20260414214104.1363987-1-dennis@ausil.us>
 <20260414214104.1363987-4-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414214104.1363987-4-dennis@ausil.us>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e59840 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=R0GiLmRpmYWNx10LZcEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNyBTYWx0ZWRfXxqhb0m00VhTL
 VkBIdZMcQ8PYaXrufcpE2MsFIQGz/q1IM7ytla1YI+4vBCL5AZQv8w9HcKTroU6E4oUOefGP1LB
 dIoErXVs414Vfn1dd9cPVjCOdB4d/6DvTDvpapDHY3kKVl+XIfRvwcL4wDDEs8jpDJMrMEljRm3
 i6Mt7QvqUac3cCji3t6MxO9OYMVCIQo8AfkY/7kp5vQGQDE4G7Q5pYzK1r9nNCl4NiHRIXh1J9g
 agXf1Pmquui2wbTb4MjMWhRQyNFDIcOGZFhdSXz7aCq9FeXlP68yygLxajx5Mio6YK2t4Ll69G8
 Oz9zbHAhrp3cVB/QxFIZAV7bqXroDLiu7MtTyLyZE1Vi4Y34TVcgomNugj2p8qCv+0z2vLl2RSE
 4grK83olCCcTq5QvmdDQK4FDU432nRe9QAjbL091Xj/BeYTQiTXN7KAtt7hcdSK7nLsdUylCD//
 jr2gopmwhSh8kvxNqBg==
X-Proofpoint-GUID: BdcVlhw6xz1oyJiMvDDavYz_DVg2g3Id
X-Proofpoint-ORIG-GUID: BdcVlhw6xz1oyJiMvDDavYz_DVg2g3Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200027

On Tue, Apr 14, 2026 at 04:40:54PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
