Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1F3D47D0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877166; cv=none; b=rIjIWA0St5VgHmSuC8mydQq7hsefi1gKo+qLmeuQ2yJQBS21crEaMyBYOM0EeRMWkZAeKeL1jUoDHdQbsZdObCqojOBflwllsHnNtwsiame1B6tY1sK/AxPz+RQ4xi3dMZ0f6Nf9biJkf7M7xs1NdGqBYWsR8wY9tnjO2PD2fwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877166; c=relaxed/simple;
	bh=meceOlV150x0P9d/dYupXFReU+UI7nyTwt8EPwSQZRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6pXDJVY5zO+s5hHw8v6JUgMaBaixflnYkAM5UeZifz/sYAAZ5BB/D+M1X3OAsTCHKH0dfrOqcCeJvOCBo3h4K5GQAxoisyJCSjb92ZLXsHUWT/Ga00z6NQ/c9QA2DBp/63ZEeFGEVWLmQFVx96j0+ZXhLbOA8ZEpX99e+SINWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzI+4W5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3YXSlsx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzI+4W5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3YXSlsx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCe0jr3198130
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=; b=kzI+4W5zG0i4XgG0
	PxOd/0wh8ZPR0lx9MybkCc8bnUeqQgkx6lsaByE+N0jjR09D7rmUTZPnkQ0hEfYT
	l3rq05wbFPu3abnRrdLN4d72AY5aHOqpZ8wskPaTi54AEAzVlgIj2wvLiaLSmzd3
	j26M0wyT1sQhJfzYrttZVkrwyVyjW83xu6zX5EhPft4AATFql1zGsymcTAXuaVJI
	c3UGLdgV0c4hQTGbdU3e90d1di4+8ABRHQATX9rBbWXlVvxWi0HtlnfVCQA+CUui
	cyzU0IcPLkTy2B+rLaENwhx6wqcF3h6xHM5+SSWuCzfDo7ZIyPvBKtsAdATSMvEq
	AGO6Pw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwg5n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:26:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffbf6d209aso8053522137.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877159; x=1775481959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=V3YXSlsxnplCnlMlfNRZRICa976WLAsqNqc6JE6acW492DaAoVREbeyMCKIjkM1E7b
         6ARz18+tfXHeeDrRVOamhdauPm0bUkpjt/K/2jYT7lH0EueNgAWQ0Zas8VNCl4eaKKW4
         IB94jDBogHjt1/pMkFNV0PU2mDH/bA4yTNAHAiEOLKyJlHQWhou0ipFTrca7OuQHq5Hu
         CNfxCGqbXYw42BdP7/OjdPBm1whsFLukU53QuEJDCnQbBc8J0e04pa6hUHh7M1xwua2E
         JrMYtiN+V+31sgRJ2aeeqfi3/XX4snFG691A4wAZeC5JRTIOIiL64KMCfceXkL7yOln1
         0suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877159; x=1775481959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=JbcflQePVllx629MuSbYKl5w5TmY/cF9QKAbGdN5pf5LuyLWP975mMD/xWXypdwvn2
         wA+qypTqgieQyLZNXVJ5I+r3hpWy2p+gTlneTp50l/gzZy1jwCL0G/N8Elk0GBXPF/tv
         IjPpJmk0umxFUGb0RSZDNzV24c1Njn/g9RRx/m3fCAT9LPjUHjbi9yo4yubQYCgrD4hF
         ObkAS8NhzqFMGmA/r0A4zR673/wL7Z84jL/q1ry8PCo7xml+lgB2INfePzyAOglt9mid
         g0pSZ1T1m9VmCxeqbLrSeMPuitNEpsgt5diz7TJp4KDW9NDYbqMc6dRX5uFBACxVRQix
         arhw==
X-Forwarded-Encrypted: i=1; AJvYcCWp2pJRyW0teXjAxY0e/ivr9pxthB49+c7WRfZMVjDmnV9/qTeejgTiSXlQJ53Q60IPT6i/z3U+pUEU@vger.kernel.org
X-Gm-Message-State: AOJu0YwqStrDQiMwaI5oTB+Rg+woGb/Tin+c5NasU924EVIag9i3PXdv
	/sk8R5c4NIVLiNN1RTq//E49d03YjEUcBirW0pqd9qABnaGJKhOyK+wBwIv9FzM75+3nNpUW2VO
	O4ia1RZWGsO1zFMKb0chQoKcAo6SNBy5VwYM+jheHkveM9EpSLTzMn4ur5F+pelHg
X-Gm-Gg: ATEYQzx9bkIw2YyCtrHIAFHJzzTCqDDrQVPhuDDt6HSSshtxcPsSLL+pZcMRWH1C7Tr
	YVTXFWfBs+bxQujIPmbK84EhjJMMSS+0ZhHloiWEMkPnqN9iMTwSCKeycsBaDBQvOfK6+R20gAc
	mfuZtBz/0zuQnFV+jAQk+zf0oy/pvCoGN1jEYmnYpEjC8HRjvnP8/zcc7BAotcUFzBMeXcyYvWc
	B978f4CLcFN+1d6E9ttVC5AEq1FnE9qheQMY4lZCXsCHVwRWQDX6R6unUcfjbPac7RHVT+Pt7s2
	4tE/XfFCHsVykile3eSevS+yBpi8X8uBrKdwjGo2qzqiZ5zHfNlIE5rqAE8vI2NO8Uxahf/a+2q
	9oeRi4fiJ9U+KGBoXUGklILGGN1z0znwqfopXfzNC8kcknO9rb0MZCt0CEvkjcgsLQhR8in1X7G
	+Aglue6KQwcqBzkqjJxmzKgFxBPeXBJxBYIXA=
X-Received: by 2002:a05:6102:3e13:b0:605:218d:ae0f with SMTP id ada2fe7eead31-605218dbbd0mr2312296137.18.1774877159177;
        Mon, 30 Mar 2026 06:25:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3e13:b0:605:218d:ae0f with SMTP id ada2fe7eead31-605218dbbd0mr2312278137.18.1774877158734;
        Mon, 30 Mar 2026 06:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm1698928e87.18.2026.03.30.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 16:25:51 +0300
Subject: [PATCH 2/4] drm/bridge: waveshare-dsi: support DSI LCD kits with
 LVDS panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ws-lcd-v1-2-309834a435c0@oss.qualcomm.com>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
In-Reply-To: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=meceOlV150x0P9d/dYupXFReU+UI7nyTwt8EPwSQZRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpynnhq9AsFpxr9DIE5JwZcFpH/66RQUMPsVrqo
 6/tGrsw6o+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacp54QAKCRCLPIo+Aiko
 1ZS+B/0fVMmfd14zWGRlG0KQxSXBE8RKxXQgN2rSh6rowdrSMYK6MDMxB8habiOcY34NVYxrh9Z
 LOshYatSLBX7BlFJITdGjBGdw40K8qmJA7Tu9pCqcuweS/FXtrdjlRUJe0mgVviENvpxjkg+AFk
 2xqZwgDmEhnNllqQ05zdtbYEuqUQ+NKFajXkYXnmIarqjgXfLsLY5yHW+DwhC7vGP52YYXIvH+0
 WP4lSLFhJG/NmZr7Jw9OjSDxLyNIW50nfWTXSL+dVUPQxOGt7PGo/jrMBi8pxsnh/loCBXvd5jB
 u4SPHSuvYIDuFt3apNIPj69btx+C0PWR7Tuu1Q7o4PImNCIJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: PQr4_g9MIvc_FH8hsPrhoDV8h_uJgEJH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfX2lEPBZ+MkFs7
 jiYJinrKHE+dUL5NkLJTWF3z+0fGtfuuPry7kuV45dBFvPE6quSQUds9coI4dOkVmhkakDgA7Su
 e9qJQzSzX/Af/KVW4yDIv9N8wAK2mLjKiFgZ7fypgMnkh1kugFseMvraqkyMD2Ei6jWYM6UvSLX
 xqL4y2R++Uy3BWuYzOYM51TgC0i5WyVGeuYwYGj2gy2J1m1SmqJo/xEADuV5Vv8LxTv+776E4+W
 enwS+R0dkLZLb1Imi59HVYDvkH168jbG9hQlQ/tXHgkGs4q47yId+S+WPdu0KOLfPxfKMdYOWDH
 S5IMp0G7N6EsHURQ3BLdZMHWI5P9qwcNWFhEjbjIj0jDPZeBVRuj5zVwmWKNL6yoIFMu2VFwPtE
 dqPuo4yiKEj/bvvSh7Nzctc9dZ1kpQQaFDid73nSPp3sYKb+9Fn3gFTHxf7men9AXGlNcplUpBt
 gPyZAhRXjvRUEKgaCwQ==
X-Proofpoint-GUID: PQr4_g9MIvc_FH8hsPrhoDV8h_uJgEJH
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca79e8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2ETHJKsuVJx8nypl5XUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105

Several Waveshare DSI LCD kits use LVDS panels and the ICN6202 DSI2LVDS
bridge. Support that setup by handling waveshare,dsi2lvds compatible.
The only difference with the existing waveshare,dsi2dpi is the bridge's
output type (LVDS vs DPI).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 32d40414adb9..ded57f298d64 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -177,7 +177,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	regmap_write(ws->reg_map, 0xc2, 0x01);
 	regmap_write(ws->reg_map, 0xac, 0x01);
 
-	ws->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	ws->bridge.type = (uintptr_t)i2c_get_match_data(i2c);
 	ws->bridge.of_node = dev->of_node;
 	devm_drm_bridge_add(dev, &ws->bridge);
 
@@ -185,7 +185,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 }
 
 static const struct of_device_id ws_bridge_of_ids[] = {
-	{.compatible = "waveshare,dsi2dpi",},
+	{.compatible = "waveshare,dsi2dpi", .data = (void *)DRM_MODE_CONNECTOR_DPI, },
+	{.compatible = "waveshare,dsi2lvds", .data = (void *)DRM_MODE_CONNECTOR_LVDS, },
 	{ }
 };
 

-- 
2.47.3

