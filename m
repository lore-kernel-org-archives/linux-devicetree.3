Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CE41D13B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040604; cv=none; b=Ie5sLI2ycV/ua3mAG16f2CkY6DrKOhfGIIZ39/bb6hTFYwFy24ZNPRNlUyJTf4HFdiyqrg7E3DSzynUmvRzggrk+Vs7+IB/SOMNkbwkfaEPAIOsQiSzLB4kfJ9op+6xSvUUzn8geUJIfo8YPGxnUSh0507vNigdf772p+l7RXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040604; c=relaxed/simple;
	bh=qQICPmagQceePADymQ8ywe6Rv8/qg8sHQ9Ym58dfGrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKpXyqEfbfxZDUHziGF4mI6UtPMdRErDLjgOnW+Fi7RwGq7wUemjoemr5dNBjZ1jbkw5yC3SrZQbUZV4JXtuLzrajw1VGJenTlKWhoREaCdv952l4gILGZRvSM1D/Ds5XEgbPYjRNIJbTJWovOxlA9njVlMBiGelDYT9kzvttLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKKnwwrZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmrXyFeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKKnwwrZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmrXyFeC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7j34F251994
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lp9Uw1m65gTl1edjgkyrhzRm
	7kPQJ64tvUDBYNGbC0g=; b=QKKnwwrZ+8eXRtDsV0t1WCLVTqRMUcpVVym1xwNL
	uY16v1cJ5eDp3mddq3J4WAmLMqZRCJ7zmck+kAcMln2dHaD+ifY8qqM1Ljh5vsi/
	Fys7Jlg3+p28o93wOPX0dO3ECz0H/6VfkaeoVJyyJBBifFBKhvrZhDlQKldG+w/a
	3AQ1YIalo1Gqps79Qr6KPGcMvSkryc/Vf64UrFM0TafWG7INl6SGeyYJM/Mlr3rO
	6QWUQOpBW9U6++fbx3HBVjk+uDqtTLCV1zt+2PMUsgVXmX38Zm4NO2zE/Dm8JA9D
	0uFrYbGl61dIRVt047eWuPHZ0rZftAfbtd/uvfynhGJeqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba95tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384cb1637c2so1433811a91.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787040602; x=1787645402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lp9Uw1m65gTl1edjgkyrhzRm7kPQJ64tvUDBYNGbC0g=;
        b=YmrXyFeCWG0WW6U4IiOkK2pThVbwKsFsUCJJeJ5/h2maw8CwiP3/QWEQr3TWN51RTM
         5WiYgp796y2GLvlmv5zmFBtMW0Wf0W53JH22v6mDX1ZUxrFwdwdyt3CosjkWQ1F8puTR
         RA7soCo/EVFzT6CLch2NfGr8ueZEmNWQEa6d7oWKVUn7QwZDr2OtG9o63StJf+wFJZm0
         wscLaWbtW/UfZPu6mECq5WTixRSnix2UsnvRvZIc0q1qjyZiIuz4jyT8bC9BbSl3+HYh
         +I9rhMbKSqK4b1pj2UXBA0TAxWbNRnI9/H6Pej8j8L6nHpJZMm0zvqgl5hWY4PDHzKY2
         K5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040602; x=1787645402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lp9Uw1m65gTl1edjgkyrhzRm7kPQJ64tvUDBYNGbC0g=;
        b=COXRmMK4iYcGIzkfBtcs1s+2jW7rIurkrKGDX+1ZgSpNE/9Y66HknlT/OK0lTEA9Nw
         bdb+b8UEVdqq0R7mnVf9kInZ+jnfKTu222xUx2N87VhWFO71nF9rwPBptbuOXNh6AOwk
         h+2YjBwgjO4I/AKQGXy5gk9yOaYS3vgz+GOYG26kyx/d2r4S6GAnadJpNXZXy8NJLBpx
         OzGEGO7V4JiPTeOnhoBbN9rl6Jc9omNjDvXp7l5QKCnAt4pcRzz7T8zICN+MtAP4Whf1
         R5ezswKzXqEqAsRaQnsCVER+OC/5nzDWDg/Y/UNGcjq1FtTVb1YR0A75WOsdx1KJq14q
         DlMw==
X-Forwarded-Encrypted: i=1; AHgh+RqABVt8417pOC9B4dyvvQbHga59W4yD8n/05OO1xXApJ2XrbkmJfpO72/qcvVO0hvscRmbYOHNadnoq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NJQFhrQOFQC1WfeE1r7p4ndpWfphP0sQhQc32XPvvsCRwHe4
	qI9nJsNa1wRJk3lLOGQZwqhjB5iLym6+V2Og3Le+NpJsgJ0MwBBqDyxB3EflLcJRFM1jgF5NjvZ
	uCzLvs7YacLu4DIRJ9SClPlP95tHOxHOkTywnvRbHfodFQ9faMxMwwCLEvGYWKgW0
X-Gm-Gg: AR+sD1014wuuTmipR8XiPLtBpc/nmyAO67DxPH/Z5nKfAWsrkXMWwpP9j1Gl7rqLhu1
	dL6Qc3PdcJtBH000h1D0+II5Br5UVJcCWW1tFWujNnKtR5u/k4nFzKPzSbxT98BGb+qhacFzSwd
	yPbn8vyl3iyhPtSXth5tW8gRX2pypAI4xKmehHVQ6HN45iafuPz6Mj13whnoNhOFeXhAG4vxuY0
	Ey3x1Rat/f2jBqRhvq5Gz8AYcVpwZ1E1f/ECUYXXgezuNywb5caoHifivQR+8kbXKljW2urkkPE
	ueGgL53ea+tr+TYaz/d0vljcQy1T4Zy7nxyg5zfDt9XTYH6bKkUXpPODiA1Ne2S7A5PWQvf20Ye
	cvzS6xy9ITo9KtNxkKwJsC/tkWlpMZFc5xkGtzRLDvuQbd4mdMaLKkW9pcHiNvuXbh4frxFvkn2
	ktdUoztj9ApUGj1aLCH3u5
X-Received: by 2002:a17:90b:35c4:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-3933b8c4c87mr23466459a91.3.1787040601655;
        Tue, 18 Aug 2026 01:10:01 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-3933b8c4c87mr23466407a91.3.1787040601105;
        Tue, 18 Aug 2026 01:10:01 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531ff5dadsm7514904a91.13.2026.08.18.01.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:10:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:39:51 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yi Zhang <zhanyi@qti.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 0/7] Fixes for lt9211c
Message-ID: <aoQTT1x0bxDS9dxw@hu-vishsain-blr.qualcomm.com>
References: <20260719-add-lt9211c-bridge-v6-2-e56d22152586@oss.qualcomm.com>
 <20260806131715.508557-1-p.zabel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806131715.508557-1-p.zabel@pengutronix.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1OSBTYWx0ZWRfX/kxfCn4tMDO/
 BIX89NgcN7h1sVxmmGS3N0LDRIzFBk9EWgQqrvQLMmTyGZMoOGag6T8qRkJAJeC1MZut6huonKz
 O/HDwrF+ATK7LHOe2PC2llPjTthno9A=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a84135a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SOQmYn6PRUrcGKOgvcAA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XK247nN49eW0PeXm_xvDmVH1XqukhYq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1OSBTYWx0ZWRfX6sLp+yqeCBpt
 U1kpL7w9Nsf0aBWEgTQwA9D0Xj8PRiOJm59n7jhXxiVhJQsP9CicA+4kuA0yW/aiRNsVQpXMSDI
 ntAFwxrrQXP+/27qyNOKOqNXQUnPVhphxRSStEFjsp3YRQeLIpy4VWrnSzsG36JUH4JiLgxnSxJ
 8+xix8YKkwSN6lSURnMQbIYtb7pbbaE9bEWdwRsVlj+HpzvCdh7ZW7kFMc+rNDLP2cMbtsi+LaJ
 ELmHl6dqLki+XzTtwVsCiayPOuOGBnZ13N91MFbS8dXdPdo+QSK0neq9oHTa2C37VgqxnvAgIcj
 GRVl2V/dsecGd8l1RpUnoSW18LBT4a0L8R23X4fc/xL0qF4IW4gIsraVGx/SCkD4BDshxkiM6/a
 GHbC+6WrMF0ACB7SDK9q68D4xprHQCKOH94eXQAaqW5+X2eFMoonatRP+DN1LgtF4NQnQEPfYf+
 VVW1CA3162eUtIeQjEg==
X-Proofpoint-GUID: XK247nN49eW0PeXm_xvDmVH1XqukhYq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180059

On Thu, Aug 06, 2026 at 03:17:08PM +0200, Philipp Zabel wrote:
> With these fixes
> 
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> on RK3576 with a 1080p60 panel @ 148.5 MHz.
> 
> Feel free to squash any of these into v7.
Thank you for the fixes will use most of them in next revison.
> regards
> Philipp
> 
> Oleksij Rempel (1):
>   drm/bridge: lt9211: Enable DSI burst mode for LT9211C
This fix will be included in the next revision. 
> Philipp Zabel (6):
>   drm/bridge: lt9211: drop delayed work
This patch is not working autodetect failed to read format/width/height.
1. Tried ading more delay upto 5s before, autodetect did not help.
2. Tried adding a dummy drm_hook hw_timing_enabled, which is called after enabling the timing engine
with this synchronous approach is working.
In the next revision i will be keeping delayed work apprach with some improvements, by reducing the delay to minimum and wait in autect_rx for correct nonzero format/width/height. Let me know if this is ok, or if any alternative approach i should follow?

>   drm/bridge: lt9211: fix regmap_write error handling
This fix will be included in the next revision.
>   drm/bridge: lt9211: use regmap_write_bits
This fix will be included in the next revision.
>   drm/bridge: lt9211: reuse lt9211_configure_timing in
>     lt9211c_configure_timing
This fix will be included in the next revision.
>   drm/bridge: lt9211: combine equal branches
This fix will be included in the next revision.
>   drm/bridge: lt9211: use devm_drm_bridge_add and drop lt9211_remove
This fix will be included in the next revision.
>  drivers/gpu/drm/bridge/lontium-lt9211.c | 189 ++++++++----------------
>  1 file changed, 61 insertions(+), 128 deletions(-)
> 
> -- 
> 2.47.3
> 
