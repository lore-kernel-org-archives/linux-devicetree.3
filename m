Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360D42C4F6
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380361; cv=none; b=fCmFBDWtfh9U9YH3Z1B7lQE/9EGvpaNwQZKBAwYJQ/DS+SXqRhoZ6Gf9+z9AwaZWoOeAc3DgXOpHDY7/OXIfiJGBLFAZTzjVhku9rr9csoxI4egobGtifK0VoxL21QR0WJsyZyj0EqXVCxtM3CeY+xlezUwo2ujSohaB5br/C88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380361; c=relaxed/simple;
	bh=sta/0uXLzTrFDy3tOkABXvQHFVN3Q+XXZzNYZF9yI1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dq/iGPFQT/i+GyqOrgtCPAnOu/mArtS9t+x81GbyqXxQFI2Tz56pzLqIBHUAMaPiWqM/xwLU3B31LqheFg63vwnREsnupa42S6lTDtxQp1n14Kf38dQMc59+qlMVBAP/nxUPqXUa/tjdpgVffgXPiPOQcb3Ju4IFOxxacqjPOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itKSwwlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV1pbu/b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itKSwwlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV1pbu/b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGDnD01786471
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N7ZoU6l9gAur6xLvTry0EmvP
	Ub1/IYFKLAnZnyKwao8=; b=itKSwwlGYDWEEcQ91+aQGmc1hi9gFVjeaN0KwapT
	cXBO0G1VOXnUVwUKFegtpoyw6j2Tfd9SXqTQoBOjKo5DCed9CiLbOk7kdSAZb0cS
	7zcQadk5hisLHpmGky+lH1Ex0mYbC5K71yNd7VIdxRkQbo2Ign7lK8J+0pmk8kDz
	ir0jOzf9zs3eA0o0vLJxYJ+xF5WV3mBychGQd2HJ8XRJXumlfDQAZcSZTtw8VIpe
	hW0iNRXCR9pPDUJYaPl+fDa92rcrefE4WpvMKq+kfFqCsC+anDUPazsbKT7ry+Gh
	7XiWg7fie9auiY80hav5ZPnZ7cP7eGLV0go/CcbNIIDtSw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsryg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:45:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811343bd68so675130a91.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786380357; x=1786985157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7ZoU6l9gAur6xLvTry0EmvPUb1/IYFKLAnZnyKwao8=;
        b=AV1pbu/bFcfX49YwgETb0BWNbNjqO7+3iQD29RH6L07Ae+QW4X1GybAzw4qqyeY0gR
         iye043zG7PxaaWT5AgzqwntOMND6VrdTYJMYqQYNc9w8/nYFPCYWQaURk6s9E+as6c4u
         fihW9VPcUAh6+VFO+5+M6/6lngEkLq1iI7fxnbJNMQWke1bV4zh6Ya6S+bLCJHycTiR6
         pip2bDlx0U0Ivmd0X//ejqJo5UzeXvnEUoSBOjNiczNusYbP0DRXIcVGQIMdYGiHXXGd
         3P+92dAoOlbL5+qpUeFtCrLWO9Bk2B3AYW+26SRLTaekw8gjEErSgEQ1Vw71+uB3zzjG
         6zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380357; x=1786985157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7ZoU6l9gAur6xLvTry0EmvPUb1/IYFKLAnZnyKwao8=;
        b=dWJxs9NEFpbGb3OzskPamFcGXwHc89X+/D4dp8h6IV3c09qA+yoh07bnvMMwkI3m4Y
         8wAaILt8bX1oQm0jhr5/ZN1ekDK83nqoxS/73pcyiQ/BkyiQk1DkTODka6rOgq9wbluo
         EIZjcZiXarydTjVZJOxeqzwFlYDPuAtZEHb2r2qYwCgXpXu38XAEVUOKIJGZ6aA7A9tm
         06bxeqa9lNNNqAZWD+VkALitkL0hXy8bTVtC/o/XxL9534HSa3qjQ+bcVj//YWkGmlhC
         e0EIcl+K528JFcFPAuxYpsyToVfUUhaKypuLcXffaxPz+eluYgP08VmHzxr3FsWR8m6l
         uolQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOhUenYoGGyxd8cqX5bDx5haUobjRJF/Ou9jhezaN/tS+i5p2D7JEX3/9FGHDVulrxpqXu1qf+FmtX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2fzPKir7hM/GJElz2yJICkvV9KNcu3sVArQYl8WOVfhEUYvk
	dmpgtJb91paX807F6kFN4x54Ta+BKMGaokTS1D+XVLU7emWZSqCJO7/j0dzcEhTZ/O4p+Ol+eNg
	DYqAOTsV5vMVnTGoP0vSURNRon7urNAxtz+/WsuIN6+lZMrCa3RZ65vadwUUgxy4q
X-Gm-Gg: AR+sD12Y4EZOt9XAczbmaHJ+dZP4y8mae00Kj1x1tYe/hHq3gUItcYNZlLGKlk0Djz9
	yvt7QNLn3iJJjFViswWr8KhMIjOx1C6bfvDCFqKO1Y0GMujA1WHYO7wxD6YjaDXHnJUTvQBlQHi
	gP5wPUjB5LSZE/TGNG2JDaUA54UsYd4j6JrumIkeUASm2dZNzyRh/p3EGa1gtgdwY1hgsbyqqFl
	Qz6f7SqRd5t0oC/bZu5uAT6i/kDv+4T9Wrp6aGYEfoJ38TTKL1K+zAM6TmdQ55UdoYoZ2mPYgbM
	Rk/Gj6hEIVtMqgId78Kk4Rp/pc+CVr5DcKXKqTxcV6kKdigEQYzfTp2GbHAT5jIKAo/JWOviwF/
	nrXcOO8VibnhLLRY5fI7Es7be2G9kV4xGJ4EVhFOOoes1nnCI8mDIZja7Nr4fZJsOUTIZQlSC0F
	1zE9FSpEkUdUQM9Q0ZpN4d
X-Received: by 2002:a05:6a21:329a:b0:3c3:94bb:ceb8 with SMTP id adf61e73a8af0-3cb85e263a8mr36034896637.1.1786380356771;
        Mon, 10 Aug 2026 09:45:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3c3:94bb:ceb8 with SMTP id adf61e73a8af0-3cb85e263a8mr36034840637.1.1786380356190;
        Mon, 10 Aug 2026 09:45:56 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f370e61sm4307737a12.27.2026.08.10.09.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:45:55 -0700 (PDT)
Date: Mon, 10 Aug 2026 22:15:46 +0530
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
Message-ID: <anoAOgbBmS5iyccu@hu-vishsain-blr.qualcomm.com>
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
X-Proofpoint-GUID: _TZER6MzBoLYZ9zEUXN_04KtD0vdJ1iD
X-Proofpoint-ORIG-GUID: _TZER6MzBoLYZ9zEUXN_04KtD0vdJ1iD
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a7a0045 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=B3w4L13e9EP2vHzqb_cA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE0MyBTYWx0ZWRfX2ty3asj9mHVa
 SDrAmKOcySRfbmenGhfWDnGknkUOnUY16FfgK6jcU8HQHq9IzWgO/9m9SbrxwxleR6pK43bTpw7
 aOMbLYyQ8xCmnKwPJ4rsZ5x0+K4GMm7G2nADUySo7758rnO3IVWCiQOfrS9Q0sNzKcUHai1qgzI
 aKbO+liBBXqD0yEMXkofmiXET55Pm3KIl2Ih6lJiskFbSMy1e0zMQulbmi3TTE0F4naYUuA/beZ
 HqWBp8QdTOlg5l0Un5Mm5qblmoQgEDIExA3hyJQczuWMQZDdvgdcg1YUp+lY0PZD6Ss+PH3ysrZ
 TTDO65BZF6eFcZ9QLDF3y+nMkLAQnQ/MFPXkkXdD1lv3e2mjpbzlMiI3ABv66zjOaeTk5xg5vxa
 aI1HMQR6uyJvpnl8GPT5j69Ou4IKCqPlCCv5FxuWZMDLsF5LZuaK9aMxea4fPNJ5q9/1gpS3Lh5
 +X9ELkHx4eMuQIw55dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE0MyBTYWx0ZWRfX3XXg+L8x75WA
 JdNGhjn3dEyNp4YcXz0E86lLQyLRh7njtQAy4ovvLP+HzH52o31+9vkhqsYvxPrKYdTH7PZdOhs
 dhMw2bHKXtAkTOcntC/4JmC9OEUSOGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100143

On Thu, Aug 06, 2026 at 03:17:08PM +0200, Philipp Zabel wrote:
> With these fixes
> 
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> on RK3576 with a 1080p60 panel @ 148.5 MHz.
> 
> Feel free to squash any of these into v7.
Thanks Philipp for the review and fixes on V6, will be addressing them by EOW.

> regards
> Philipp
> 
> Oleksij Rempel (1):
>   drm/bridge: lt9211: Enable DSI burst mode for LT9211C
> 
> Philipp Zabel (6):
>   drm/bridge: lt9211: drop delayed work
currently droping delayed work is not working as expected.
lt9211_autodetect_rx failed to read the format, Tried increasing the delay upto 3s
before reading the format buf, did not help:
lt9211 2-002d: Unsupported DSI format 0x0

I am further looking into this, let me know if you have any suggestions.

>   drm/bridge: lt9211: fix regmap_write error handling
>   drm/bridge: lt9211: use regmap_write_bits
>   drm/bridge: lt9211: reuse lt9211_configure_timing in
>     lt9211c_configure_timing
>   drm/bridge: lt9211: combine equal branches
>   drm/bridge: lt9211: use devm_drm_bridge_add and drop lt9211_remove
> 
>  drivers/gpu/drm/bridge/lontium-lt9211.c | 189 ++++++++----------------
>  1 file changed, 61 insertions(+), 128 deletions(-)
> 
> -- 
> 2.47.3
> 
