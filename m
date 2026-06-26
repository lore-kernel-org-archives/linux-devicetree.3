Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5737C924
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505965; cv=none; b=j7dSZ3pvvf+7lIJbDpMPC1PMg8jIQBFBfBYM7h0FIc7pSJ/663COtHWEgkjyEA4Ufb18eboxuWxzrB81DGt2uY5wieG/y3eTnOLmNBzA3UemSvYvw7nf4PFovSctiGRLG55rzkNXgDnYAOkkboPWqAeGoIy28cxLEZl2sofdMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505965; c=relaxed/simple;
	bh=IQ7jFhfIMM+3YH04XDNAQm8atECKJ1ZmDx9IZwQLG4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTVNX/dW6eFaioLhyPew8XWgy5xMp1q2Ya3k4DYGa0EbdgAY5ryb8i3kQPMJFx12DtESVZpzaz1vhbFYFvp0OSqkdRgcw4aQjO77rtmvQlGGUvORzLlAXnOg5d6atfyc3/+YlNVsDRIpa74a5CUNsBvPqFVCFf/1Ulbun41vwew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQHN9312; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuqS9c0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQHN9312";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuqS9c0W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8owL2005805
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTsqUjqMEM2wDTe2a8HKt8xg
	pxNC8Ob7VcHEtgqhrC8=; b=fQHN9312M4A/UHpdzecnMoU5JNPaZbPVmG+9lLNE
	a8KI6xoxi9/kqCSsEKODaCIZnnmUprUDHYKUpBzNsUQHnqggi8gJCA2nh6uYpl+c
	k/PDO3G1DHcyJb3pagCpzI93gTcQ6/m6ITJGINbkE95xwUBzo4WTYFy/qaOaiBBy
	ZQsYCRNAIfH+y2hUENTbfh9UuKNgUtmxQbWb7aIxjqLe/O7K+jStJVTMVyYcksaT
	qzHcsQpP4efdqTNYEXMqlXYKBl1KCIQn2hqDt7f/dg+0lGtYDVHQ2cgOjFGoZvsF
	Za5MYhY+xlL7Bcm9fswliwhQmA/SUKCWNgncrdyzcuC3AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsdrn42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:32:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so144086185a.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782505961; x=1783110761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTsqUjqMEM2wDTe2a8HKt8xgpxNC8Ob7VcHEtgqhrC8=;
        b=GuqS9c0WvpetNw8j1TDZGWHoHERMRGe/YtdY3NDEyP68TMFbLlf/xMa/zMqNLkp3YH
         V6ZEkRVIGxxelpEkWJVwrxAF+p6ewviVH/33VQ7YEHt6ZbQZqumS4cUmbkT/G/1i48A5
         EK0kmBTcMH+pDMCAOKiFMMZEcinK2dpkylvHgPyLxesVyBkaqtunQ3lpp+deolDZiPlo
         rCvfELA3OnVbIe76HBu6AbRAa4pAHpiULIdKjwMT0QhtDA/HYRiaEExKjol21Pf1kHkG
         MSuHzQgsEDUZQ7kf8acqK39t/29hIuF1980Gwf3OypLejBkVK13Km4G62MEv9kUdDA3I
         zjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782505961; x=1783110761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTsqUjqMEM2wDTe2a8HKt8xgpxNC8Ob7VcHEtgqhrC8=;
        b=gpNfcmjXR16wFb6qE1xoNhTGHCXw2fh+8muk2Yqr+ps51iOn69n3S0UJjMpcUTuZUh
         clgTNrWhZ6qn+6Kf4E8F29VVe+LydjOTrbpIi4z+AmaSpwJQ2zV+JFgJG6zUYAlidpJH
         qt9PgSs7klVkXk94LuhW6YjNMrv9ylRlpcFODkYnob4RENa19yo8HESeLuGCYsASgYIN
         E1jSNW/nnFYFC6RROSBAwktfVOzGCgR3B5vN22m8w/Pg//aheXAi7qy2VnSZ+vaIralL
         9QKlC+HPIfSKYg6iFFtRIY8dAldPJEIVyBs6NmEM6frvblz5Xk506GxW6ZMvrBWXh6O+
         jnOA==
X-Forwarded-Encrypted: i=1; AFNElJ95p6hvZhTgc8uovfVqzjMuJJJyNajLR2ZvhSSPtZLCmLlJeSJLpqYs206t1UPSTpAoZpypU4jM1/A0@vger.kernel.org
X-Gm-Message-State: AOJu0YyhO4XmwPj8OgKE6nSRlNJ7CuePnBupyrfQ7mS89ChyohsARAzL
	LfntQs3KFeGaV43NgTPzFRZ8RZ4AqHEHIXEaZVLOsBJrE6N89qwrKgznV0W8F+1mSxeItWGaGBV
	XdpRDh8oIlHVtVJmTSrJ7Ml11h8HhDabNH0FbeDx7LIY5qvegEqD5PgZjGqS1JeZW
X-Gm-Gg: AfdE7cm5FKh8yt2lJBqkn0aHmqMgtEsGzD5GzAoZJ8ass12lOzVVdW8x+mqmxYAdphp
	CFJz4jSLAHqpDwkx9pEMKJPmFNunqJeQqdYZ53VkHOE2wSv2dyl6alCuwvsPhDgGf91I4fGnsEx
	x5pr7Uz1A3/VD+b3ubxZNcJxS+Vqd9ZMKPXziUwffYgC2yo7t9g+NqQupYZoFMXCTU98r8OPlG7
	EGBuImpRduC3SGuC9noB0rlK36rkVL/gcb7QDjOytphCvz/Utsq9rv07yj3d0CT9ZUqLlpst4yT
	Txi6HZ4fXNQ782EhlepuGrXgpxBDrmKrGFyFltKfOE2RKYtdRnuKPypb4hcnp6GGZyHWufOKUJV
	43QVsiJVV3xVLz05eJppmiIcWvXoBEDEby5aGDf8dIjQglujlC9TYvQRRxr4S8t6E0rfK33g2lW
	5E23LDjWsmrWwnIHWChgWAhHSM
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr1287063485a.36.1782505961015;
        Fri, 26 Jun 2026 13:32:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:925:c160:f3a with SMTP id af79cd13be357-9293c121085mr1287057685a.36.1782505960521;
        Fri, 26 Jun 2026 13:32:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954aa40sm3646395e87.10.2026.06.26.13.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:32:38 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:32:36 +0300
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
Subject: Re: [PATCH 0/4] (no cover subject)
Message-ID: <gmsllfyrj5a7u63v4mizde3lmf6kbpnxu5ca73rxkmc57qrhg2@lmo7enmlj7w7>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3ee1e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=epBqaNyAPFBQRbiHezgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: aroS_KjM2HK8Od89A4z6XNyL9Cm016uZ
X-Proofpoint-GUID: aroS_KjM2HK8Od89A4z6XNyL9Cm016uZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfXxoKqSgkW+oyM
 v88ZlH50d8HqIBzAlsA3UKbKFkbW0Z7i2RLXtrOmduUD0GFOOKiE9umSZLFqboWH5IZlE0G9n8I
 QIBOVxKy9xl787FC++qgrPjwMk6ZBVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2OSBTYWx0ZWRfX2KbLEvGJz4YI
 mUimIoR49icSv2UfVuj7TvEK0O8KKlGjd5Xj4/SDNCo+kewH/zUOSRUYMevVXpRoN46CvMEVlbm
 Cxr1gNidYAGhA9KDwa5/2VMOAYFNYjCrJ32UxwymaETbvIYzKBoAuvQ+tFIl49KlxAhrhFdXlL5
 Cjk8Mj65HmPkJzxD9cX2EnLlkkgRleF3iJ7dvz2tPbzEuBFbRr9BFCP/w8kpFbQyjv80NWxHb7p
 K7qaK2R/3sWehNd5zciJ15MPge8xyt14Z/WjN0wKPmuVA5VKSwMO/7XApo5vz1TD87vyEhiRapd
 98gXi6dLmf8r3vfDIX2w3nc/LYg3JLdDFY9LPtSpsefsVpmIqsIDTuN9eM8i+G4ijtlhhnkZGOC
 GGCMsf7s6DoHiTxrmFAE6dc82wYBmqz2uVqoOGOS5nSBt6NpxFv1IHxyUwN66dr5RuVB3pb/R6R
 UktrNI71EwUPBhJLZfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260169

On Thu, Jun 11, 2026 at 02:44:55AM +0530, Mohit Dsor wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> Subject: [PATCH 0/4] LT9611C improvements and fixes updates

Heh. Is there a reason why you don't follow the internal docs and don't
use b4 tool?

> 
> Hi,
> 
> This series contains improvements and fixes for the Lontium LT9611C
> MIPI DSI to HDMI bridge driver, along with DT binding updates.
> 
> The key addition is support for selecting the DSI input port using
> a new device tree property, which is required for configurations
> using port B or dual-port (A+B) operation.
> 
> Summary of changes:
> - Add DSI port selection support via DT property
> - Fixes and improvements
> - Increase MCU polling timeout for stability
> 
> - Add dt-binding for port configuration
> 
> Patches:
> 
> 1. dt-bindings: bridge: lt9611c: add port-select property for LT9611C
> 2. drm/bridge: lontium-lt9611c: Increase MCU poll timeout to 200ms
> 3. drm-bridge: lontium lt9611c: fixes and improvements
> 4. drm/bridge: lontium-lt9611c: Add DSI port selection via DT property

This is written several lines below. No need to repeat it again and
again.

> 
> This has been tested on LT9611C-based platforms.
> Please review.
> 
> Thanks,
> Mohit
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
> Mohit Dsor (4):
>       dt-bindings: brige: lt9611c: add port-select property for LT9611C
>       drm/bridge: lontium-lt9611c: Increase MCU poll timeout to 200ms
>       drm-bridge: lontium lt9611c: fixes and improvements
>       drm/bridge: lontium-lt9611c: Add DSI port selection via DT property
> 
>  .../bindings/display/bridge/lontium,lt9611.yaml    | 13 ++++
>  drivers/gpu/drm/bridge/lontium-lt9611c.c           | 79 ++++++++++++++++++++--
>  2 files changed, 85 insertions(+), 7 deletions(-)
> ---
> base-commit: 7b61c580d964f499f3eaf96d6579a7127dda606b
> change-id: 20260611-lt9611-b4-send-6f1d39c2d6d7
> prerequisite-message-id: <20260420061644.1251070-1-syyang@lontium.com>
> prerequisite-patch-id: 5e0ea8907c87174a28fac5456fc51183d8e8b36f
> prerequisite-patch-id: 6fd8685174c2c83b8871d9e6419c6f3bd29ccc1a

Well... The series is not merged. With these issues it is unlikely that
it will be merged. Please work with the authors from Lontium to
incorporate your changes.

-- 
With best wishes
Dmitry
