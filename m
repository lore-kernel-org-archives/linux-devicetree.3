Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CD2C21C4
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130152; cv=none; b=BkFohPQl0IzKCMno1DKAtXb6u+PqndQM6A0qfmi1Cw9ohg8PDYfpA0NPzTtWz1fogJ88ZadJiUBbQtpb5MoNBPph7qK36xZ1qK4TbaOSJUvl4nKjdug6a3cqqSlqOE2zceFb6ZIEleqUMG2faogB1RorWZXO1xaFjrOhbQXAx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130152; c=relaxed/simple;
	bh=7YLz5To+ZIkV34shy9V6QrkVpQCMbPuaIsxRc5ZI0fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U72BpZqHNbUXO2g8YUhQpIB9yZikDpV0hDufRKLAAisQz3WW/807UhdliHxkzwYhWwsvaU6LWcoXzjdvQuFNF0SqrYkyFKNn0Rg5YdSj38ZDqJs4DJhbjUNcet86HsE+nQXdnsEdt0yucwDhNAXl3q2jNxNbehGjvKqKkWuptJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2Jy+v9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9uI7ccl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2Jy+v9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9uI7ccl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnAV73213581
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mr4b8FTNexAmgmJ4RnPwr7PK
	MazeMTB2C3P0KtH/3lM=; b=E2Jy+v9zgX1nmku4m/z8gU5ZwNFUqSxWQRgVVwXH
	Krc9jv3RVP2Blv4t3AN2C727h1uu1ApiwcRwAP4BR5zV4k5cWFtZmDpE38nJyOut
	u9ADrzfrLLTyEyw4izytmlrHASxQTA4E+4pvV0EtJqjlHUpJnzBHi0LICAsv3S+9
	a+bmMAs+VN1+KAaa4Gw62fEvWk3R0tPokE+jqappdVA/lhFc5wBIZPfE+lOuCvCo
	IdPBfmH8zwZSlrmHp6beb4U6a7aOV5K0v+FmYb8/zGdeYl1bDi6PMFl5e+fcLCb7
	9+oniIWm2LlGppv02W2SlWfXYd5+uVUl4LP31QRiSxPmLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhrd1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:09:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84531eaf8a8so6350325b3a.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130148; x=1782734948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mr4b8FTNexAmgmJ4RnPwr7PKMazeMTB2C3P0KtH/3lM=;
        b=V9uI7ccl1Jx/ZgVQ2Emjiw7D/9+4Ju6DxfpNHtk5F73jGlUJKJj3YIlvKUR0k4Oziy
         CDBZMTGI39ArxVuTvmcEVpVXlWNKRCVm0zVbr5G21ARhH/yI3K/Tm5EkqqLBCX0FmjTG
         GZCGqTkBmnqVY7vuI1nkFI80+UWnZMGGv7xn43FUSOHN6jm/pfrQ1LPRRjwuxXw1wiIc
         5G0axJfgFDgxcfDpJHCGWst3ivMfjRnNu/F7C15fzdKcPZP5Fuk/896z6RIvvG8f9Dzl
         DIQDWxdKtFqlXgV8qZGCwQ7yPCeWx+KTezqqmMVr3cyp3YFYEVK3KE58JV7OFo0PC+C5
         RMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130148; x=1782734948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr4b8FTNexAmgmJ4RnPwr7PKMazeMTB2C3P0KtH/3lM=;
        b=oLYsOColn8GI+4v05b1OvhtSgIWDGdxl4Q+7DZxTHQdrRIWYy1FlXoN3l9DMiJPHeJ
         G/Yh3TAHDuHSqKUye2Y3+I4aGAkejnZLMF49a0yBqJ3tcc54JlsL8n3eK0xJ5zSJPiBr
         MutF2xcbu1oygvvG0+0M1aOi+QTj5X6GySqtjNrOLbd5kBVrxxjUJdapk7PWPrnouqSk
         Bu6isiwB8cl3HH10CNOEYpMkUzxGEkjKPWLQCpol5XClDcF2jGv05S6ls2bYF/yW3Jqd
         xw77pwMXJir0YrLlrSqDtfro1Vp1w9jdP4bal8LgUPxmBEM0eUFdenICfkaEDQ//fD/K
         ND/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/K+gkUTo6fglIG111mV0chCaenBId2gRJONv+dB9X0p3Y/QpVgc5xpw/XIESWwZUumh/P/1ZhhGA45@vger.kernel.org
X-Gm-Message-State: AOJu0YxHl1ZeZKb2k3W28ER30uIa7h0aKeeTfsczCfKwZEGZAHSL3LmB
	sA4uzyZm7i8Ao2G6rve+K1VJWuNdLmW783b9BVIyyKw9KDQ/SYduEoWfaeDgAovH4FHyFgQouZF
	7il/wtCf7Hslrh5nKEIEn+Z0jJnqPk4dU75kq0Gbtu/mshUM+BMsyLTAo6c2e1AYZ
X-Gm-Gg: AfdE7ckVx4z5e2CgeVyDR6jLXHHOt1Jyajanf6YOTBfWF/90QfO246kzw3tUwmex6g8
	QQWYHzLTAEW+XDMt9ahZAjXbyyrrrj3SDxuagQoiX2wZrSCE1RbFuk/7VDximBfQF73Ws4V4xHQ
	gTY7O0SZZ5Q6A+9+W6Q4ZWIUfNsf2nISdcUFmZSbg/lFQzJwQrGhh2Y8vkf8L1tB3YA2UZMYzdI
	qaMwyKzz1+FZcSBpSbgL/i1PfMhZwm8ns7/zpK0BcJR3w5gMS3IHdAaM8ZHb9hvexBgqFEeBug6
	AVRlxlcFNd6zAfOoduYOScnon2DQ5CvH/lsqKKKu8IpK0G9ZWAQc4YrOFeImkBAlWcUqaP/BmrF
	EZBG60tF89gqrkYGffpgm5qy7wLreg640n57O
X-Received: by 2002:a05:6a00:2288:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-84550887f06mr19610378b3a.34.1782130148080;
        Mon, 22 Jun 2026 05:09:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2288:b0:845:36a0:9eb2 with SMTP id d2e1a72fcca58-84550887f06mr19610315b3a.34.1782130147591;
        Mon, 22 Jun 2026 05:09:07 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6813bsm7651346b3a.8.2026.06.22.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:09:07 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:38:58 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, boss@oss.qualcomm.com,
        qc-display-maintainer@oss.qualcomm.com
Subject: Re: [PATCH 3/4] drm-bridge: lontium lt9611c: fixes and improvements
Message-ID: <ajkl2kl5oFh5tNG6@hu-mdsor-hyd.qualcomm.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
 <DJ6YOZ4G73A3.37QF618MHAR4F@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ6YOZ4G73A3.37QF618MHAR4F@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMCBTYWx0ZWRfX1PNW9P45KD8s
 FAm7pmcnkxCwUxdaUG25xIExIMoWTcAHukrfPChYgjPxZK89zT5zLt0f0mj8pvAalsRVFkMgzOu
 B3YlAyeuWq/CLheAdsz/gZHcKFSzb5s=
X-Proofpoint-ORIG-GUID: 9NbaaKrBQe9fKwxQ0imTd1W-22ua6SXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMCBTYWx0ZWRfX5djMIwZ4LRii
 sW0SLQIZ69OZxno7ey9hLg1/1WahjCqglpr0QPHG78m7/Kl7YXUBoUrRlofKlBxOehDpXLrcH0L
 iMFuLf7/XnHq12N/1O1Y8SU+yhWfd40sDdlho5hVcLjCCcm2uKVMzgc+/4U7F7WakExPV0VkB2n
 C8mRQyXZf6idvZDbT2lsXrQdj65sEOHDW6qIyzH/bdyGG3ujxkXaOxHpQK+DzcB8/60L5U3lZf2
 JGFz1pPxrt0G+Sg7Ho+JxppEZD+dRJWUJutT75aVTmMefvxkIZmKiQzZDflyHbNeNf3cvX74VBq
 KVb9o9rCy2mwLW2YBT18WxK/w/mq3uEuJTOsA9FZiq7Z7qUYeViUbdpg6t4Q/SPA8SiZ/ZKeRo3
 4T+Q0SFDs8S3yUKAovpbVJsnFn4Rh7igVG5OE16zqSgntCicGVs4v1MuLlkFHLIl+k7NDrGIqU3
 tnrmoigsH7PSJrF8bCA==
X-Proofpoint-GUID: 9NbaaKrBQe9fKwxQ0imTd1W-22ua6SXI
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3925e4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=hmx0KWIcr96AgVAgIYIA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220120

On Fri, Jun 12, 2026 at 11:26:34AM +0200, Luca Ceresoli wrote:
> On Wed Jun 10, 2026 at 11:14 PM CEST, Mohit Dsor wrote:
> > Remove two redundant lt9611c_reset() calls:
> >
> > 1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
> >    during probe and resume; calling it again on every display enable
> >    adds ~440ms of unnecessary latency.
> >
> > 2. At the end of lt9611c_probe(): a reset was already performed earlier
> >    in probe before lt9611c_lock(). The second reset is redundant.
> >
> > Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe and
> > hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
> > (VSI) support, used for features such as HDR metadata signalling.
> >
> > This patch add stub implementations that return success. Wire them into the bridge
> > function table.
> >
> > Also, Store the chip variant enum value in the of_match_table .data field and
> > retrieve it via of_device_get_match_data() when probing from a DT node.
> > Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
> > paths.
> >
> > This is the standard kernel pattern for passing per-compatible data
> > through the OF match table, and avoids relying solely on the I2C device
> > ID table for chip type detection when DT is available.
> >
> > Populate bridge.vendor and bridge.product so the DRM HDMI framework can
> > report the correct manufacturer and product name in the HDMI connector
> > properties (visible via xrandr --prop and related sysfs entries).
> >
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> These are several unrelated changes and should be separate commits.
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Luca,
Thanks for the review.
I see your point about separation, but in this case I intended this as a single cohesive update to the driver rather than unrelated changes.

The redundant lt9611c_reset() removals are cleanup to avoid unnecessary latency during enable/probe.
The HDMI VSI infoframe callbacks are required to align with the DRM HDMI bridge framework expectations.
The OF match data change ensures correct chip variant detection when probing via DT.
The bridge vendor/product population improves user-visible HDMI connector reporting.

All of these are small, tightly scoped updates that improve correctness, framework compliance, and observability of the same driver without introducing independent functional changes.
Given that, I felt keeping them together makes the update easier to review in context. However, I can split them if you strongly prefer that.
Regards,
Mohit
