Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060A3B47EB
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082052; cv=none; b=q1n5vVQzRTF3tF6OjskZ713p8NXmqA3UGx/lWMJ/o+1o38uy/62UIMzyM6WHNklwvLU8is3ofi5v/ncGZN7UXLMG+MG7g7wrGtekb6GdTjugJ9RFKQPfa4QL1fru5BQntiZUwulKCfgzpKi8F/7iA+c5crzmn/VnkLEpyiwFqx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082052; c=relaxed/simple;
	bh=9ceGvv7Xy2/z5wz8PVmbBE2zSw/gGDr8DgK6m4A747A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeRKWWoQArv+cWuF61ldmTZ+sm3Jm4hLy5iy5AjpHognyFmgOvMZpWrxPlUxgijRxg5iuIVtZdQVHi6WO9Xo4vtQXssTLfW7ieLMAHyLDID2N/XZSHwJoIRbtP8pVkpzCb27JMPqG0SUvn1Lzhtyd0Iuv/SRY5aO1KrR4KVqnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmMy8GZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWZHlfUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmMy8GZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWZHlfUz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639BqX83694381
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6HClnpnLgJbZHiHBgKqUqSMf
	hI5+WcDhllChwXjvU14=; b=gmMy8GZrxbIduqOKBeFagsh2XOQrDhN2bhEGB4lx
	Pe/Owu0Aj5dt9x/pH8X1YS/Yu2+GabrPT3UH7gfqxZ9xgWyuua2YNFuKtxJyWwFL
	J5GykYorOChso0ca1moVo4Lw8DBVjf5tXmRaSbKkb/cijlF7NRS7SrLBjTTC+LKl
	Nlqs3nAR3kU0XMFmJ/EvRchk16z0gNqiM0qjxzlWqaEok5N9VxvPkATD8zTl1msK
	XH1aG3r6JFlVTpGM3qbaLkIx8oM0Pkj1hyD2bjJJUbqpglN/talkG6I8OKgpkRZm
	yet7S2Mp8QvuBBUwNz8TY2vJECy4Rhvaj1bP/5J9RPhcnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848reg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:34:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1011013a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082041; x=1783686841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HClnpnLgJbZHiHBgKqUqSMfhI5+WcDhllChwXjvU14=;
        b=kWZHlfUzEuQRYnhKr7Au7hLc2jb5P3RMJWFTTelL8IISTLmv7t50KSCwqmLlwgkdoR
         +msx50MtUv0mfrQl8pIUV5CvT2wIzRfjnpaC0TqmB2rpiFLFlbXxoPOwhDOAEeo42sKE
         IFYzi7K33uBvgETPaYQtB0qYISk1g/Yu8owLrACNndq1DyYER08neLN97DvZlxclKfkX
         9WMOU9wEA8dJ8WMJWO+GOoLH1fJeM0ETNCc2x9AWCLrtQwT48+rXT9D6lWQyvosIqxwA
         EInBEujbiFagMX4+7tse7Lrd+zseerpRfhKA2BxuQt5UA70oaAgqlEdKLa/bHa4hJSEa
         cVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082041; x=1783686841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HClnpnLgJbZHiHBgKqUqSMfhI5+WcDhllChwXjvU14=;
        b=Ds5zr29+3gRDsdZc4R5QHu8dR3xomjaXCw3OvGjI/cbLf19/YCxq00Rd/WhgA5zfNe
         AJT43Ie2AU+RLkpjU3/fCEhQS8ebcEDXjgwNupquXpUF2bF/wVS5A5/6M2lmde2I4k4y
         9xVRvlVA+okx1Zbm7oUpWuJlTzjsQeDReBfEub5lQTIKO/DLBAi2D/ACVvQkV9to+H+F
         IWWgHniHdBWGI9DIY4mVv0UtosqhYFi3yOVsZO6IGTEKIdTkULoQJMhi7NThwu8gHeLb
         uyp2kK+IGETMquj0NqgnKLKgJzD6739rzgqYeOrKdZMnWUCIJ+kgVf4wGcKz2mAftEtW
         vnfg==
X-Forwarded-Encrypted: i=1; AHgh+RoHhBewrZroAJs5Z4YFH1YcWXQok6mYY3mDBdWyzj9eX6DRS1uf2H92vt4t7WR5Gdh+zewfBSxs2Otp@vger.kernel.org
X-Gm-Message-State: AOJu0YxePBZg1C4xwHOPYrNfF2FPwX+mqru8bgpb11LVrQxdojaSKQME
	Hy8mvWEKKq4xfvJUIt0/BjroywfPUikPNqvSoPtFPkzUK8PuvQOCHbx9WKHfBX6ctzlzrLmCtmZ
	FKO8dLKrD5PkFIgkBWhgkqNIrcZ0/3YV6Xo7QtiUNDcxVWf/vULntN3aMJ7dH41et
X-Gm-Gg: AfdE7cnPMHAaeJT5GPDVabsIFvi+tZzDqVD2i5+QcPLhUjcyDXFgJfVdcax51DYWCbc
	tswbQi2jNaK8CV8a5vcLMMVZPpcjr/heLiuZIs5pBE08XJa9WA0YezBU3MJBQhADtJNncsZbYnH
	fmZpkFar+3osRrvcwxj+PupmyGm7fm78qLW6zR26MQd//i7syKyfHm7IaokiLYq2s75bPSTWjzJ
	NOPewHr04kfgFsJMAabpxJPyFse2Am6oGdpd+D1p1unenPmAtBpBL+jFbVqD/Kf805viPWDNTnW
	hi7CqevcufbMOPaBIvcxiDXvp7cD84qSUuSE3cTkEnm9zRR6qnm9FJqbQzPdf6sGjqvUDZn/BKz
	muGjANEVmXLHXB+vV91enmG1vi7jh3NqIRDHu
X-Received: by 2002:a17:90b:1806:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-380aa1cad60mr11111793a91.22.1783082040558;
        Fri, 03 Jul 2026 05:34:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-380aa1cad60mr11111740a91.22.1783082039974;
        Fri, 03 Jul 2026 05:33:59 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f31e7a2a8sm4556282eec.25.2026.07.03.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:33:59 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:03:50 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <akesLiXidOELLya5@hu-mdsor-hyd.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-2-42abbcd3bb1e@oss.qualcomm.com>
 <jtzitxsoqhuohc7ztpo4rzirpt6gxo3dcarztw3smn6pnr2vet@vmli6nyrhucm>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jtzitxsoqhuohc7ztpo4rzirpt6gxo3dcarztw3smn6pnr2vet@vmli6nyrhucm>
X-Proofpoint-GUID: n696UzZzeOPBOBcH2d7XSvXgq-1538mj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMyBTYWx0ZWRfX4jaSswKP+aXa
 /LBKBGMeFZ7SvWLv4EVBb71MsaO+zAdlGJzNcoSfFxpI8eQ6u0FMkufto4TIb/XXZa+RlNCNtmE
 lei7b4zJN2VOT6OhaLOCT7IZSvKsvoA=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47ac39 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wn4IccVi28QXfKnItucA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMyBTYWx0ZWRfXxPU9KfON/cM2
 vYSJv+lvsNLPPHV4ccllqgygmYXtTNeeORzh4+n94gqAoPVgHNb6YhGIk6WBhNVgh9qOdx/2NcD
 PUD4Vom82/seqiJG+1KKO1cgOFBth5QT+nqdMLLOf4rAgGlIK2scK44dDnCSaUqBy6q2or6bRry
 FNHtXmCrROMhSDBtmW7Sc//adiu/U+wV9n9QZeVzs6ZQz3Z/l6fS2/PbukI+Ah5YQwa4PLaozLf
 8TCnQIgv6r1fivY1Y2tlnA84HtseWQCGzvWqH6iTBJ8epovyB8RxzqBUZPiVTxDfsbo9RZL4SFP
 2FKdgXAHn6w4dnTh/ECH9XF7smRJWaXPSHdGtgK0A+nEcT/bbkBn6xA2MZD5p8ZBU9fKvHys+VO
 BoOlLwTrJc0RlXiOWheGojU01y88ZBKPq/EoSGfVo+DU0F7hijUtAFUYIYUl4MhHFT/AT98ZOK8
 IPsFqGFwWt7xiUtooSg==
X-Proofpoint-ORIG-GUID: n696UzZzeOPBOBcH2d7XSvXgq-1538mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030123

On Fri, Jun 26, 2026 at 11:25:03PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:44:57AM +0530, Mohit Dsor wrote:
> > The on-chip MCU may take longer than 100ms to respond on some hardware
> > variants or slower I2C buses, causing spurious -ETIMEDOUT errors during
> > normal operation. Double the poll timeout from 100ms to 200ms to improve
> > reliability without changing the poll interval.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Fixes, cc:stable.
>
We will add this fix as a part of base patch.
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611c.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
