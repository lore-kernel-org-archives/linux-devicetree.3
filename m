Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A32243951
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505510; cv=none; b=JUZB32yZr6xu+36AXEh9RvtxjmlFnNoKRqZH9EC6wyUBJId9jWMfIFp7yQsnPA5pl8jzrIG5vQH1+8yTcFbfp0jCQb2c6kg3Y8Vr1ZeKjjF13NX1b2YE9/iWcd97+AHEAT29jT0cs+ZTi8eBfbPZuW+vTe3QAstB++H0T0I7Gzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505510; c=relaxed/simple;
	bh=io/X4spMeOmBCn6lWt1qHKY804m7+iOE21+xqjQ1vuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/SqHfbMjReZxeV1zaYUvr7V1jXMKh1eexPlzyUKCKEoFoPs7sg5W2iigvitet4In1WycHPXYwkDmwqW7WXvIlIwlcIliIbnqpui26BjykAFjzII+zl7tYDVKNpBoOpWQdnbm9taTQcY9ScFjA16iosNR8k6l35ew8uSmculJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=On+uiByr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNm9Bq1c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="On+uiByr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNm9Bq1c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8XYt1729708
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k6aY8gGwSCxXFhLxb804Fy/1
	V/opTI2mRv2ocqywYps=; b=On+uiByry/XR9t7sZ8pcw+HFRw8G6g4AeFcvEld+
	Nn4KzQ2BlYDSWZdLiZn38nk5cS2bVHJ53FJawYGeQJMEPOb40OmtPmFif7dGK741
	KvToG75J0HasxC1AB7DlBycfthYivrGwqD1/IQLlY/zItFfauZ6gwD4dV05/SWeH
	Nkko3Zwif+w8CpY7zYToC3rLMtpNi6EtfrjX9v3Vna5urTHNxq+peegNMxctBR6m
	OPFrtTD5RA1nBzIBP+a6B7jnXEtH2Fqp6eBvUhQtE2NL0PD3qfroZuuesZYxJ8UY
	NdITZRvwI+kDtH3eGr+Ss5zGH+DBmVThKD8FGT0M6U+eYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qsktp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:25:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92adbf757cbso122547585a.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782505506; x=1783110306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6aY8gGwSCxXFhLxb804Fy/1V/opTI2mRv2ocqywYps=;
        b=HNm9Bq1cBVQeDHM6dGd/RlaqZv4IHUZc2F2a9JkqhtD66CJNdIF63ymwsec3nRtWm6
         0LLdT+kgzcfYps9BCNtmfF3iioZm7kkgCk7dhATSSSSxYH18fM1Y7eSSCSWZc4aFkYoR
         ASqswAYKfVQ8BWDojvprg5COPu+7yr7xlr9sJ94fdI7L1Bavkg9/fbcl8aaaTxrG1DAx
         njdmTbzHEZRSGJuDJTWFVzekNJRUDUrINw1RskYygJt+iGY6Lcp2OXnJUvr5ALDuHXOF
         /vWeFGx0woa2h1DQ4zxiUfOp3Cpu6nzojMpoUtjPCQrzdG+DQKyrI+/N3101fSGQkzqv
         ET6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505506; x=1783110306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6aY8gGwSCxXFhLxb804Fy/1V/opTI2mRv2ocqywYps=;
        b=mopQyVnop7Np9jvYaCi1ZNqnzU4mw65KQ4CScy3McZWrwDesicRWTJZzDRRe4BunUM
         QjaVFcIcju1HtQ/QkyAV6Kce45Wh9HzXvwTfQ3wtuMtLUZxK3mbhs+NS0gkkXWVSd8LR
         zJMTL3mAhn5c632wWCGO6sDfKSv3hz+Dm5/3qSoM9G+yJ+za7cqjvemIK3vlmv3+ZGxP
         r0MAsB+gVqDNWZ4HsvHMw7TnsshjnvE917yvltMq4kPQqG3Lx2kdq15NKPaXo/vEMAEB
         UdX9jkPInoEYywj5Yets/nGKXzqjem8kUpct12VMsavgmrvHibqNCSOOa1zNsBmJOy+r
         W7pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Y+47A/WxtDLJrTVbFpxhuVgd1OEtIgFef26a+kVfLZScl7b5CODKL9FmOFCptj266S9ytjNz8E9Pw@vger.kernel.org
X-Gm-Message-State: AOJu0YzEuEbaj/tlNlpSNnD6IN+I3bRLmmciDNBpmgBeeQyCQjA+ZBGw
	pP6qpzk5Zlh8EwbJ06tFfikasxyPNta0ITsUxU28jdN54Fep2foZgzEEVM8zR28EdqCPt2Zv2kO
	soC9Cx+nqBZcbOj+sLJwDOr3fJVz8d6Hj7nY9OwLLTFvbZsg6WWdNKyQpsgthLpcY
X-Gm-Gg: AfdE7ckffZJBhvicGDwvZ/3g4vA4eR2fITe4cr4Oxj5mxRXyywLMvWrny7yGfwG8iUO
	4vxs/P5hZOXPxOUzWmYnn0iSFZSAnuL8ghRJcJFRAOcpYNo9QTyrlnQgL5hOESIEEI7Ug3S1cSh
	OpUut4qBAuVhEkTb/AmFYAf16++nbUzFILR4yETPcldE5+cvPLS47QibbEMByjIds1QYYDrnRrJ
	CkBbKv9rhagu9giLgCE3+Q73rtfZusHHFZDt269Hf5pc2gvLwrru8/hhRgDCgQLveFJKwbN2KoK
	eP+Z575+N5pqOcWux/ktbgku1um22teFWOw1wTtzSNaoNtA1jrmMj3pCu0SVsiXcXKpcS7l+OLc
	dGJqycUwYbsq3yISrD49jqVD6FeXWYfzzsEbV/UBMLZkyDY8IpSDUTTSHYipSB9MFM5PL4jv6cX
	WLN/ReISUv70K2Cs0uw6ZBwlAf
X-Received: by 2002:a05:620a:1998:b0:915:cf88:1e3e with SMTP id af79cd13be357-9293c5fcac3mr1226304385a.41.1782505506358;
        Fri, 26 Jun 2026 13:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1998:b0:915:cf88:1e3e with SMTP id af79cd13be357-9293c5fcac3mr1226299285a.41.1782505505853;
        Fri, 26 Jun 2026 13:25:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555accsm3711019e87.33.2026.06.26.13.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:25:04 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:25:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, boss@oss.qualcomm.com,
        qc-display-maintainer@oss.qualcomm.com
Subject: Re: [PATCH 2/4] drm/bridge: lontium-lt9611c: Increase MCU poll
 timeout to 200ms
Message-ID: <jtzitxsoqhuohc7ztpo4rzirpt6gxo3dcarztw3smn6pnr2vet@vmli6nyrhucm>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-2-42abbcd3bb1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lt9611-b4-send-v1-2-42abbcd3bb1e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfXz2GJJVfvLzSm
 mMh74nd2g9fF3VdbJ8/GbIDhXHHUVbuhiwgwHSv+2gQyjmchvk3peZTW1Hpy/KiJx1XTCiMkFIs
 3NWNLm1/vT2O6CW0r2BU9zji/t0/KuY=
X-Proofpoint-GUID: VL_f8GF9jF73qI25gLKcWXAG--gryUe3
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3ee023 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JIHZsLvRdsfVHJ5f7ggA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VL_f8GF9jF73qI25gLKcWXAG--gryUe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfXxi9wP5e9l+lQ
 RJBYyBXhqt4nOonnmFI9dVocRde4ZGxRuuBqd6WrZ6Meqb1ih7uA63fW4Xn1AvjENvLGjkNP+kS
 rW9mENuoSKcH/fmVEvn7mg69XrlpCUmwT6xSuG36491Rhk6vBoYEX9VsYEqWKE+H6C4gUMIQakL
 nfP/ZM6oT7tetqCg+6meE6ExZ3djMM296kfuzAirehdt8kcP23pkVH55O5a6WaBUw2u8UUxKFDC
 nnDDSjKhAdFPOM78Xi3+qzFulMlHtZOm6or5OocdegDbNiy6cVa7LnGU/GJZZX8VByKCJvyl0yi
 bG0gy9zJUpoqglhZXqG+u+wghv9iNsITdaXimmSfogjcYzEqdhgq4LUU2veyS1Uk+QZBJtdamUJ
 J5BHSPf+mNm9LG0QLmKYYXLxdVsf1YKu7OLt6LHFbIgWB/jMd4W1lWouc/S+wZWfkF0y4KfJgjL
 oJRAUnF4S/i1D6DSX7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260169

On Thu, Jun 11, 2026 at 02:44:57AM +0530, Mohit Dsor wrote:
> The on-chip MCU may take longer than 100ms to respond on some hardware
> variants or slower I2C buses, causing spurious -ETIMEDOUT errors during
> normal operation. Double the poll timeout from 100ms to 200ms to improve
> reliability without changing the poll interval.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Fixes, cc:stable.

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
