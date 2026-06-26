Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA63502A7
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505484; cv=none; b=be+s6UQnhZ6QNmnCPsaUUWHZZDFkLkv2sq0rz6flMsA2xn782XmnRrf6cWSLZvgp9SmA2V3QPqvFsmL8+0iEju+si+oiQOMVyP7cIAqhVbEM/GbBA5wWGZLbWO7jA4Lopn3MnBsFTs8jbKRKvUj2nWANGm3OycV0gy2khzJph1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505484; c=relaxed/simple;
	bh=/2XqHUgTJCaxaRIebZJio3hj+8QSFAJJqPB8Po8nUdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SULUGSlQKzTT91FJ3cx/SGX152ZaSTyoguCjlH30Cj3/ejpv2wFQDhhyucxFdBsWHTP7g/Hy4Cw43BO1HRj33++kzQz9rtXI5yU6iA/nGdw5FWRoLNGNMSBgVxgoAP3tG+i3ZIpfjooZ9WKn7d1Rqf6oG2exE2H6W9Hnh6BLEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUAesGcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyKOuE6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUAesGcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyKOuE6+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8XiK2194444
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qRLn7zE1/l07EVzKf2DixLcz
	lAPgdebamMdISm5Dlbw=; b=XUAesGcF/cqu0QYAtr3EiZWvbdSC5E2/kHCJgyHV
	+FIvLcU+mE/BJd8blUxitJjVUsNk3vQYZMva0nMuPQtbCjcSJ9udOkXgimv9e3vq
	gqfelvzc9Dqxam6c7DaD+ug5FEOXq2R2XZS3HoL3ThtHaP8K1Yt0bcSYLpx1dq3B
	rgUTNzWust+YTbgpYgmrS/NhQU2/ZBhZN0QL7iH37FyIbV4fqauJs4ZEUMwj1Y/H
	8xc3T+OS69qEgwJtEBebLsoofSdyyMmrR8J40T90Ash9nbablRAOjHTI3C1Lk218
	961HitVXEMRS2qnRe+iQ9IVb70yVyfkygGpVZSZINnYPtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8c19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:24:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9254309dfd4so281074085a.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782505482; x=1783110282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRLn7zE1/l07EVzKf2DixLczlAPgdebamMdISm5Dlbw=;
        b=NyKOuE6+47JHtbgsykx2/djG6NuVdPyv6DucYCEtZq3APjEZTkDLvZUAGza0L6wm0K
         +9SgY2a8+oFcY96tY7Rkvhpk7xlXI9nqo8EFWAy5J8u3otCPq/p2doq7+R5l6bBsgFat
         1EAhCiRZ7NYxHrS8oRQCGCcuv8EZAJ6L5CkgKB9K8F3nzHAldhOUnN5j71mPSBP1hM19
         iMOnTKMX1IcQ0X6dNyiN3oByR/0KeB9T6WulFOkmxREgtRdm/WqwXL1FXCt8IaiUeJl2
         g7ug8HYmZ6bnHW9O+lA5ght+Ki6u82mjG8oPlFDP8xJoNZtRNRdfbZYDXuqfkZcSlgB4
         Uvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505482; x=1783110282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRLn7zE1/l07EVzKf2DixLczlAPgdebamMdISm5Dlbw=;
        b=DmdLF/vm5ezS4TOOmznqqEcWny+x63sndMJ7LFgtyvFXNOocg1FJ/usT/k2dO++ZPP
         gp3IBScL4mlORUyB5S4UvDTkOzjePZM4ed+EKm4qwl8HkphayvAUPG+jTdOVj6gsFUxj
         /jUQylZtnuUheP8P7xHPz/aVPi1uK6MUJ89N37nvhzYUQ7QL4pZD/yv3MJxugAhlze8h
         fkeIxOT7QnW6SP2akQWaXnIJCdqA7xKfZsKGuakGGp7ge76Ou3XM7kZHPLJXjQPO+8Bm
         G37R1BU4p3vp/oG9Nc10mXTPu/pc8z2lL5awDkcuI71DrfF7A+2PfJ6eqbnFwBbzN3U7
         5wCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v+mqdHuBHB5styTv4yU3IUg2I9q6pI63NZChn0h3EJSkZ2ZunNDybPBa5+eJb1qRE4yYG5txR/NAF@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXbYMSnNMrhYiQ7UfE2FKfW8Xgn783veGMTRa9RNA9ZaIIzfK
	tc/k4JTgAd+qCs0UmG/E9eH/aqH53iDQx+Zbe9LQA+tZ634ijSQVGbOYRz7qkm582VMGbLMGJ7C
	LmeOQ8Qm8/tzWKDjMpK4bFSpJaCpRIoxytEANZIBkDh7FM8e9AC+cLMpBvqokHxas
X-Gm-Gg: AfdE7cnfPx2MVoHIahRnpZu+HZWck0OcPddrF85JAF+YzcK0bv4c3Zi6kTmAHMTYFaD
	+dUXIgrN+Rkyc76m+K8+pHCsXsnTRg+ASx4f6xkG5Hj+4jmdrviHckXeyjw+jVWG7xWO+xClpf6
	8x82LVF7AXp99jXnwbAO4ykZs99/5rh0FF3g+pETOC9vJ57LqTyZ9JCrIYqQakVMkGD/FlFdbDB
	kjG3vhnqyn/ADCSPXI4uQNnjz3hMwgSZ5rLTbq/d+p9m7XqWomGcWMbDNdabKJXBMAGwuj3m/ZG
	nI7nJL3Rc0qiQ+bs17xXA8y52tnXymVowwaZ9YudQzfx1LNgGIs0TwnWOKx9qZtyWtmDMm3Ahkl
	ru8riahhABF1Mf7n8DOxJsuZj4p+PVd2mVgxbI1QrSm4X0RsaJ6XkMLT7tsYd5ZCDNyHdWGdsyd
	VYQLF5522DsLFFYEwirPHSggQD
X-Received: by 2002:a05:620a:25c6:b0:915:92bf:560f with SMTP id af79cd13be357-9293c5fcd5emr1352923385a.36.1782505481694;
        Fri, 26 Jun 2026 13:24:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:915:92bf:560f with SMTP id af79cd13be357-9293c5fcd5emr1352917285a.36.1782505481133;
        Fri, 26 Jun 2026 13:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ae9d8fb537sm2601790e87.21.2026.06.26.13.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:24:40 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:24:36 +0300
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
Subject: Re: [PATCH 4/4] drm/bridge: lontium-lt9611c: Add DSI port selection
 via DT property
Message-ID: <yphfxybiao4ls4gnjzjzkjg3fjgn6q3rr2hzxl2ved54ettmml@sdpdoxfh2p46>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-4-42abbcd3bb1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lt9611-b4-send-v1-4-42abbcd3bb1e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vPxQBbSga7xbcwtKKOz7TG9k_4lxvxaL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfXxPURVX5rzvGk
 /JZoj/KGec1D13ekJSR1cQxOUDDtgFVyq4GkzBP5gmxDHKvO6JY342YuHy6CbyYOWfBo+DQN5/5
 Eywa0qUMZIy0bDWAwDVaqkFdSeiaH4c=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3ee00a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W3wm3ICrMjM9hY8d95IA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfX4MCcU/YEMOcg
 r+yRSPdQP7VRqDUxPrdqMvt1KedSOVwbGq+Zxy+TZC4gB/4jRbfLdeiPcIhSWIVldLb2aJnlRs1
 ajimVr0Av62D5zxM3ueEP65JiuQ7u0Mti22sRBlBjxerCJOIm+QDSU+sMjuXNSPhqSamTW7phQ9
 mDwJDURgFbBUXqY8nJZjCUrqJRwEa+JSuugcaIcb6w+7Yy8KgYnsO1S74fN3Ra7Pm8NT0yYTwh0
 jkco+tF5N+G9k1J8b3J9xfNjIOiHC5AUr4s7GlJy6lBiSj2vQHBYwLi4HJtTIKbOC7Ljip0YzQU
 +44XcpbnQMYVZDSeMBCfkto34JN5k0Ha7WA3E06NldHt2ki3sI153vKy0sHZcAxsqbyCXv2SFLV
 D2mpIfstvcHNJyf1Q3Pf4WK7OZChQrao21I3zQtO9QGRg3ObDK3YaqmqNYMNCiCXSOa/huXh+Fs
 b2zt3ATPGjwoWDq2JTQ==
X-Proofpoint-GUID: vPxQBbSga7xbcwtKKOz7TG9k_4lxvxaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260169

On Thu, Jun 11, 2026 at 02:44:59AM +0530, Mohit Dsor wrote:
> Some board designs connect only DSI port B, or both DSI ports A and B,
> to the LT9611C. Add support for a 'lontium,port-select' DT property that
> allows the board DTS to specify which DSI port(s) the chip should use:
> 
>   0 = PORT_SELECT_A  (default, single DSI port A)
>   1 = PORT_SELECT_B  (single DSI port B)
>   2 = PORT_SELECT_AB (dual DSI ports A+B)
> 
> When the property is absent the driver defaults to PORT_SELECT_A (0),
> preserving backward compatibility with existing DTS files.
> 
> The selected port is programmed into the chip via lt9611c_select_port()
> during probe, after the chip ID has been verified.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611c.c | 44 ++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

No, existing LT9611 driver doesn't need extra properties to determine
which ports are being used. So, I gues, your driver doesn't need them
too. Follow the OF graph description and drop the property.

-- 
With best wishes
Dmitry
