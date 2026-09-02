Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9F4A2E24
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359970; cv=none; b=PhXJrfb/Oy9okJFRrZ5JwHBW0TG/QhzsEPKuNNFNxieZ/ijOevYHCI3NiYKOVsNqFkabLc1CZ8TrzTVrcWfnMR1lmzpSRcLe8Vz2dlfOyUbcpHLFcJSXaTjTeUJAMHwkqbuTnG0mfhuv0YQsv8uYJGaQxndFENWhCLDR1xdQ7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359970; c=relaxed/simple;
	bh=V4z6pzEm4WdOtOaVMMD8VExZjegi74wTKedBZUUwy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1Gvn8M7JF9BFm3NqgL+BwIwZ8cI26nrxAd8S+p2TJyvm8nUJB4sjoCQYxyTZWXaPe6nPj0JQjT0L9aYR+uWEcHmXCDcK5znnD5dMzTKecD8emyHTDxS58+XRRYyz0Y0a3B6Ad4hm2ClsqBvi9fdZ8lReucQKTqX7qbK21sWhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdiKrmlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFCZ8pTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdiKrmlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFCZ8pTU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRCWW2252335
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 14:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pvJaW1PmY06p/riBfvSZ/r0i
	tt6WPTapRiIe1XOVAS8=; b=LdiKrmlD6esXbaH36R6WqNdNETL5ptVqj6QkLncO
	RSx71t9J1UZipQHpCDo9FcLoQGSJ8u7KY2VvetMLVd7EcpW8bgAYwKDRcQTS5B/c
	Yw+a2Na6mFScGJonka7exW6cCNlzp5SoG+gv7JTM3jDWX9NPguKBykkekdy+euxG
	7mtCSo6Gs+O/AVE8A202KnKzXkWIYOk8mdMrqp+ldX7eh2600iypiOkdWpwcaSRt
	O5uwO5+aM6FSbBGjLFmpJ+7SV1Vjmjmkgv+AtAjY0io7bvBYZK4yYljpub0d0z7K
	87Eg/iUrjTuiZi42Ww0guB5EVfXDf0ucsVnnbOtoAmPtVw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2fux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:39:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e8723ae1so20225a34.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788359967; x=1788964767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvJaW1PmY06p/riBfvSZ/r0itt6WPTapRiIe1XOVAS8=;
        b=VFCZ8pTUE0kqNRLuyePekurDzGw4hMGBMPZMMwmwsVCXA5PSfkZ7yVfnLJhm0YJi+P
         Ksv5Akjz14VoIl6IdYEhuE82J+ST7oV6f5EzOhATJzCMYLFLtIp6UIQGQ6RgBKz/FsLX
         Qj4lcJp4JdbHF2IizIemFNhith15U+CwY4/zdpfYhdtknD+Hd/dSlvPavjj1Nx0zLtm0
         3qhWgUCw8qHYCyF3w0W5LITefnCmsBfHTAHmY/Q2uGcIsUkul3iARVOcg36V57vGc8po
         yKwS/gdbAuFm0SWxjry92ZUPND9uMBGjCRz3qNqORE62bz9eK3qneygn3rwClcD3ZRM3
         Q5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359967; x=1788964767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvJaW1PmY06p/riBfvSZ/r0itt6WPTapRiIe1XOVAS8=;
        b=d8CB5l5uL7hDS10FOuy7g5qQnYd6J4+KUvmyiHq1O9LM+cPNNFEJ3YRQu+QSGQbhOS
         b77tcCXbZhT+rRnjKReu2Agj184/OWs4DK4tMGMR2xZ1SEN4Ctrz4jaFInCC+Ub9hpYm
         dvmEyvJxyoIGp5yb8LouP1jYPuAZZdgkzmq74w6pS7NP7NcEOK8vOCZu6thWHl5mVQuK
         GiqtodTmr4X9J4bgwbmRrumSXLST84UkgP7kvrhZFwDsGqJkba04tvMzKZW011HOZQSB
         Qz7My7i30XYsyYVZKnJsYtD+IIPWjU4Zd7PA8NkNU0oxTEsRXYadEg6zmg9o1I37c5a4
         hV4g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3JNwFEdLxp6PXkffqbb1iItnl/ZPVk0E8X+U/zx/qJ7QuJXbspst3d/dHUIeaRnFxr6a0aXyRIf75@vger.kernel.org
X-Gm-Message-State: AFuF++mBtYpWA9iVen4/UgzpBI4a/Fo+Ejrk1im9lz4+fkarxTxXC0/Q
	/u26n6tR4hk4+yOhgaEDauFoDFW5pCXlG6r3B1gQ+sMfJPLekoqFzP+1vzA3zZ6JJ/l4kTxVtIe
	us2pzmpNExxt1dB6nnnwiMLn1N/qvI/M/Db9ATir9WJEoAc3U3KTTpRshei4C/qLd
X-Gm-Gg: AR+sD12O21PgqVox18vkzObdpo0H/4WHlXLrbyumHxDMvjp6dUNJMifzLeDAzTi7s7/
	Opqwb9tRwQwTY8WMJwzDsQF8Vos7r6c24yHQgByAnLPAAk9ZFWxpfqDwcLnfmVRRV0TyUuXiJ2I
	OUMz9BgFNqZjJAZBfzPKqXOPctMD4/l1Y3vI39vvu7+XmrOHoENFskWET4JHWVEL1yih8HxwBMF
	bLS5XSCZJW68IOKCUxqEEROKTbRwei6YM4Z/gaS0Qnd/DrU/+QmzgEipDdvXbAz60BZgq3FCB+C
	y5bGYfgrMqU37+3TkknKg1Hq0b5Gckv65U6LrWoSt1DkWLbiiRERKuztiQfOt/nDVrhZB6pzqKz
	7wWSVBP/SBd0181PagPWU/x7bn43iWC35i1TUB6H1EYqkUEGAjPD9/7FbFCmmphNSb0MA2gbtQd
	BQpC1sgTMtg7TLikiWoGN4
X-Received: by 2002:a05:6830:6d50:b0:7f6:6618:e558 with SMTP id 46e09a7af769-7f7812824a8mr2753203a34.2.1788359967304;
        Wed, 02 Sep 2026 07:39:27 -0700 (PDT)
X-Received: by 2002:a05:6830:6d50:b0:7f6:6618:e558 with SMTP id 46e09a7af769-7f7812824a8mr2753170a34.2.1788359966746;
        Wed, 02 Sep 2026 07:39:26 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74caadea3sm2318459a34.5.2026.09.02.07.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:39:26 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:09:17 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Message-ID: <apg1FV3HtU0c+hVF@hu-vishsain-blr.qualcomm.com>
References: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
 <20260814-b4-lvds-panel-doc-v3-2-1ad152a4d3ec@oss.qualcomm.com>
 <1021133b-454a-4f49-965b-a71e065e556f@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1021133b-454a-4f49-965b-a71e065e556f@linaro.org>
X-Proofpoint-ORIG-GUID: X98sg3iSJj7RgKW9HDc31T1c1LbXiQNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyOSBTYWx0ZWRfXw7YGAK8Gw4Ux
 tUd0/7BqJpOJjq9IYOyRtsIjq49NBsPv95A8DTsGKMImjD9mgcp+WSkYoj5TysnPEk0Kvpr71Iv
 1ALTLn2hR9Xqhb35wOZ9y+YRh7rscQVT6GwyxwEwABFcex3dWNQmw9ts1GTASYO2D1zxjH55lxS
 trxwkVM3bb0WXi4z3c6d19ZByOvdeARJflnBdEVI8aWZ+nLTQUcgN5sA/l+A7u93QWbRtQjG0/c
 65FnJyw4vIsFJkG76e7kJlNB2OH3XxGYS4CUAtkT9V1pv03wUPdc7flJRZnpU3l2jR4r3DxDiXG
 qds2GIs7lqH/0qU1pJQY0GSu8FRed0oacHVFnSHrFUUvA6qocKadiid6EFN8q6OEOdijvnKohTa
 mSpfrg847cnTPBlQmdIkucD93stDufvUIRVeFURuThboHqc8foc0aFg8GFGwNOXa0XqWuHy8+C8
 XgzJzgCuAdpgFyMBuNg==
X-Proofpoint-GUID: X98sg3iSJj7RgKW9HDc31T1c1LbXiQNx
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a983520 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F1Ix_FWfVmdgE0jxJrQA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyOSBTYWx0ZWRfXxSWaQspxuHXQ
 q7qzGuY4MMcM99HC1Oe1Fo3YM4Nxri2vcAd/7k6f21/6oXtekQVEwultkxMyQ8GZw2dG+9Ai3UR
 /w5fQOJ9MGLLW38M90qvAGyy5g/xE4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020129

On Wed, Aug 26, 2026 at 12:01:17PM +0200, Neil Armstrong wrote:
> On 8/14/26 07:25, Vishnu Saini wrote:
> > Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel
> > LVDS panel.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5c169fdf265c..d95f842c8980 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1563,6 +1563,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
> >   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> >   };
> > +static const struct display_timing boe_dv215fhm_r01_timing = {
> > +	.pixelclock = { 148500000, 148500000, 148500000 },
> > +	.hactive = { 1920, 1920, 1920 },
> > +	.hfront_porch = { 88, 88, 88 },
> > +	.hback_porch = { 148, 148, 148 },
> > +	.hsync_len = { 44, 44, 44 },
> > +	.vactive = { 1080, 1080, 1080 },
> > +	.vfront_porch = { 4, 4, 4 },
> > +	.vback_porch = { 36, 36, 36 },
> > +	.vsync_len = { 5, 5, 5 },
> > +	.flags = DISPLAY_FLAGS_DE_HIGH,
> > +};
> > +
> > +static const struct panel_desc boe_dv215fhm_r01 = {
> > +	.timings = &boe_dv215fhm_r01_timing,
> > +	.num_timings = 1,
> > +	.bpc = 8,
> > +	.size = {
> > +		.width = 476,
> > +		.height = 268,
> > +	},
> > +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> > +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> > +};
> > +
> >   static const struct display_timing boe_ev121wxm_n10_1850_timing = {
> >   	.pixelclock = { 69922000, 71000000, 72293000 },
> >   	.hactive = { 1280, 1280, 1280 },
> > @@ -5726,6 +5751,9 @@ static const struct of_device_id platform_of_match[] = {
> >   	}, {
> >   		.compatible = "boe,bp101wx1-100",
> >   		.data = &boe_bp101wx1_100,
> > +	}, {
> > +		.compatible = "boe,dv215fhm-r01",
> > +		.data = &boe_dv215fhm_r01,
> >   	}, {
> >   		.compatible = "boe,ev121wxm-n10-1850",
> >   		.data = &boe_ev121wxm_n10_1850,
> > 
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thank you, will rebase it and submit next revision. 
> Thanks,
> Neil
