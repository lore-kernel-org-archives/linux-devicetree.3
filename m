Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB13624C3
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015160; cv=none; b=IxzY1ua+HYJALwgOJBOp3/VbZE8zNmUSZRjLjA+n5C1yr0YXXpqtB05bROaMvX0Bcchp+V4aF9NKPfV/SN92Pu7C2BfbA0X8On9f5g6UoP5+o8C3XxHGjIQttiQaCOL0cnQzBADhW8cVifhY4mWOxSrar6TXc0qsfLxgwwTiXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015160; c=relaxed/simple;
	bh=meceOlV150x0P9d/dYupXFReU+UI7nyTwt8EPwSQZRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LinRe0WDSEc7vLM8h0stbvmi2yXgXzS7R5UE2fR9hfiPg1PJC2h5h7qXL2879VHHe3uFPlSNe0cLG8G//ri+CUvzkPa5XUCZQ14zUetnA4vhTTlPHPfZiNigW0Inh9BjMKnvI8WQ0F36VApdrzHTJjScFwqWk/y9YP7yQ4pB2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kltAxaR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LErWWw3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kltAxaR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LErWWw3J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4jbd531190
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=; b=kltAxaR+jvgsJ93N
	zeQaulNOJ0J4TvysYcjpT/c+ORSQpFfGNGCzuSRNp6Qh/ZZnZCHmXJX/aGjx5Svy
	SkuP+PGpPcx9EUy4i1T+PYphNLy+AWh3APIZFyL81/2dnhDHAKbD7I3mnIyyMswk
	81YmMXm0YjWkFS652BjGUnFLM66gqiKwjNfoTDQ9nDtRE1qgQruvYhw4NqCgl5wE
	bkTWC4IdbB69IXA+ohkaIlVpu5aXLyloDyuV+J8VwK7R9J7EJkt4tjbP1ZdqfnaZ
	t7UiJ3mfrMO/BKUxJsej1/iEVJlL3WAoUN8iyQD/hZMXi5phIcNHxO6rk3vmHvXC
	yPZH0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bar3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9d52ad9aso20237951cf.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776015157; x=1776619957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=LErWWw3JeAKRxjkbkO5Ie4/xiaSSwOB+Z4m6m1le4bcQE1pWwP+uJiI4BH1JAuAQws
         svONxLrE0xhXuCtbENzukGVU5r9fVsqhMPqlrAbM72alVbnhQ6U9OuDdKWynymGSuAQ+
         QLflI5bzFhmYhxQ+lMI2cMaoWBrUiU5Qi+Ruelc721h7sc4BSjnVvJvTUKdiYxCSVlZt
         3a2ETfsh4h5EWKZDiuCNcVnvR6uWm0j3XP5av+OV6mIxxmh4k7ohjyOECGM4CeD9yUwU
         Ca54RZWCwwOkM8HhGgh/dBrvJ0AsYZ/qOAsu4xTwAy2V4qxvK2ZidXe8tDYFX2qJvDfC
         E1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015157; x=1776619957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=Zna5g+hhiu20JyDJincpPq1Rxq9KAOJrnCFJK6NSjZ2E+NMrZU9M90ueAfmOlK/CDc
         lr/z0moOIvKNjISq4tVm7nwIhAtRT59EV3yulTQ8/5cjVvVoHZqt0IRkfC85A7Nnhe4y
         7fZq4gX3rqTJtPso+T+9h02vds2z7OxCSLKM85r5gkksKKA22/+cTdYU8W6UyB6spdYg
         0CuPUfaAM4OVXWRabHr0eD1X03A7SNcJXwO1t73/XO9BbTzI+IjKXUTS8KnxOK2/BvX6
         cw9dLie9upcSogSn34wzTYOzW4qzayjzOSZBIcOr+PNCeLfYh7/2AuPk7jBwL5aV0IQY
         rhyg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYT/YIaLtIMKhZZwcAW5dpSTGVwlkw8mTMr+8SIXcZENrbozQ99adFVgDnznKhPoSel1Jzz0xBvpa@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2fKfFIofyAOPv5qEEcpsmmn9GpH5mYHBgtVYF7sUmcuewAvE
	io26dBEh9HF4rna2bCc9eRtK6CwOYI6O2JsRPCdAH9mZPDv1L8AAdso9r/Zj1BTuE9MD3D7EKDb
	kDeuihAHCBq+d0HnMTOHAitZZBKOJe3Ub7nLwRWLoltYxLZDSH+qCJE+AgEpl+mb/
X-Gm-Gg: AeBDiessO04MjAot3b2bT2w4ISkSynyG6MTHvEsZajiknWJ43Z7VEiYU0mNIzWDaAu7
	Dxb649Y1bfaKnlfKpUOq2B5GDgo+Oo2qsJcbDnL8/ZzpLd/7GUH0zNNUrJt1h5unfthXMS8akRS
	Bcer2A1yH3MP96neqzeLAQob65rZjzrnR1QheOUePEBa78zpxwmO+MdvOB1rKbbc1o/wh0VyTQP
	EU+K9ZfnlUEihtmJM+VSnvYXgsOFUbbpTnYZ3KT/d8mUHyqqPyQMPNNclZjk+FnV+QNRWodC1HF
	rEQjNjUlZ6EMDIWmKSRQj7Yc4+gy4w29W/UoPPzBKIQYj4CeDrQb8LmgveOWYbCTLQpJe6Fw5AG
	vjw2Y7Hf5/OE/lId6yFrYmf7C7tIkRjrAW7ADPq0TmeeWbf81YD5jh+LO7bAY+JtCV1xpfJ3l7p
	oq+ihIclmdcQVv8PZVvYRqpDn2CPM0aI3VzT4=
X-Received: by 2002:a05:622a:1b86:b0:50d:8b5a:1334 with SMTP id d75a77b69052e-50dd5aac1dcmr162492031cf.3.1776015157232;
        Sun, 12 Apr 2026 10:32:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1b86:b0:50d:8b5a:1334 with SMTP id d75a77b69052e-50dd5aac1dcmr162491421cf.3.1776015156728;
        Sun, 12 Apr 2026 10:32:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49a4a6f9sm17585231fa.31.2026.04.12.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:32:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 20:32:25 +0300
Subject: [PATCH v3 2/2] drm/bridge: waveshare-dsi: support DSI LCD kits
 with LVDS panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-ws-lcd-v3-2-db22c2631828@oss.qualcomm.com>
References: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
In-Reply-To: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp29ctJSuiWpXukJqvY5iz557wAENv7P3NkHIJX
 4L5Jns7/taJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadvXLQAKCRCLPIo+Aiko
 1WwXB/0WGN63L8Ed3N3zdQJZQn3kajS/9NVSjSPgFKCFaaprxNCcR45US6Vgz9VZM4SjwykdC5q
 BXND90csjOwaiB4c3UYhYtLXk2lcP4gWbKtAQSOPauHv2S7/4uPwKZRQlo9nNeffmwttxFBgtzi
 2XR+zrSWghC64E0P5ABBwN/lfS2lK7Ek2UrRtYlDPR2uSKBoHEm6Bjtu21Iqxz3s1agdrDCrBSm
 QaCmux3Ivi0uOvyCsEJOhc1vPp91h5cnEmFnxXSIHVWuIPKWOU0+vJwJ2/hkMsHFRWzFKfnusg/
 cRe+7pgi4jFBFZZDsc4FOCkaGADAFnCyXE72Y0rTD00+Rrje
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE3MSBTYWx0ZWRfX16aqKllKRoCs
 dHe5bVITrohYp4isDybWSeq7clzAgesAmib51BKSVi/ckB4KASAtgipgYj/0um15W+1B6UAM4ml
 IcLy+i/kaROfCPyAcDPMUbQdzlJ+dnMem3IyVIrlOku50PPJ3t/3OVI3Igr707VtzzAO5Zf+e2j
 FVdgpqfK7kb8Cg0Abgapi25NJeHqCcZwdBOhIwRaDM45mApaWrw0yazk7ixGzFdWYCLfzcCK5di
 WuVYqMof70E0PX1H92/zJD21sm9HDpDSJeo7B7u+R3pJ9mQ63s5DT9mu5ra3fKHUKUwrwy4cScX
 NzWxtY4JE/yhbh+F/7flSuRf2GHlv3aSXOWyTFgWty8TdguPUcGA7FxgDKzasssr78pRC6TJvuN
 WIJSP7JpAeCOIvb6PjTVTWl/VYIRfzchozRjiKhJ84dNNT8s6bzx6xx8PVHdlZpOvTYM6GIUm1V
 27UA7rQSnMquC8XqOpg==
X-Proofpoint-GUID: o7l1DevENQEc1MZ-VIxcm22BRM2lS6IA
X-Proofpoint-ORIG-GUID: o7l1DevENQEc1MZ-VIxcm22BRM2lS6IA
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dbd736 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2ETHJKsuVJx8nypl5XUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120171

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

