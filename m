Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE0425CE1
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971859; cv=none; b=Ezf+AdVmEA6fyoBza+SJByPdlVsGJf3nfzXkj0tVLzew6aBGawxYcwjE/UDkKojG3uHcRpAtq9/NMea1Dv8ZMm0PP2SfPt+isULUAHN4a18aWc6/UN7TxjoMMdNCYFiVricTM34y+sXb5XdkAsmULzgZisAlbY+42L4LR8UQglE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971859; c=relaxed/simple;
	bh=meceOlV150x0P9d/dYupXFReU+UI7nyTwt8EPwSQZRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jsCHxd3V3mnfdIDO/e2b4XkQiDxMkvFZqLBf/R+LFpRh3+K8PDDvFlmj3ZQYfbUkLBuLbsderxIRQ0WiQowXitexJcYFXj4zSJEj31IO5M9ON7wQXVcaVJ2Tacj1+KpzLGw346I8VKkEkbGtFKX3NZ1prktKQT41L6emvQt3Fx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeqgwOyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzlKdO0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeqgwOyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzlKdO0W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDLvMp430858
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=; b=WeqgwOykyOexKNJh
	mYsFN1r2+BeSK39ey2hIuU71SPfRa9rLG7VkISsV7iBNrna+1Lz/p8wyFPpvZ/ee
	TkyJ3nrW0uk+QCyMBl2Obkfbr87Sa8n03pMMxRQkryY3t0Y5CkfFzA7WNjUrdD5D
	G1zxOTa0bvOT3cJz30pzH56B1MDxX2ilkc12hCz0FMEMNWua5ktDppjn2sov04HA
	40kjsH83EIgN/8Be2gb2k1EAcaKxpzN1QJFNvFxJp9GNfxc42yUJI3Cv/cbN8zLS
	pcAWpTeqQ+HrQE8Jje48Biv3e46EtT3RbMKaL2C6lg7OZgH+di41D1zbKNz5tLQX
	XmtodQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfkba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso185626981cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971856; x=1775576656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=ZzlKdO0WSDFfvb7TXAmv9weFrmUq5YuIawqCdZfrgciA+OHGEP0NOM0NmnN7582D2o
         qSSHckRyDEwjPtIvaaLOJY1q1SAdUJFIsUWtKVzKM+XymP4LIskycVFrgytKc7XGOuwP
         Uo1Lo6a3j8srf09B7Nf8oOUv2yxC7FvlLWUptqBwisV5Ldojq6si6u8LMXlENcYl/hRb
         V402du4dwAsSweyemHG08LbJ2VZYhxI9nCu3tjZUHjgoRMaR2mjIv3Q5Aq+2vgGwiHUF
         RwlIjmSWbk+n/QHrkq96eBs9TXJ3KsAntVaoTn39ou2KiKjPSNQHQj4tjLt+7FqCzID+
         VdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971856; x=1775576656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FkLmSLP69kjxpeOM6oO3fuI8XSWjhOpqQ75tZ0kttrg=;
        b=olXl4bjPXYB03zuf9s70pCS7wDmCLTa/ENtaSJzQaq7n2lrFIrlfes2fIrvFMGut1F
         ZwnZa9xKu9zxtP7+C2KX1PdjFuUAKxlYnnB9lJoiVBwkOmlWPPHgaOYYqw81ha+J5awO
         uBZom9zwHUZk/hqlAlgmaSYJNGFSh4IyxUWyJUxLvn6VRuDxOntNKKZS7QtLGLEPPdqZ
         Dz43iOl5QzOg3BCL1FT8rzx/JESqC+4f/1HwTAByiJCJAtIM+yXdVpsIU2Z/Dzo6FEN5
         adkBegQ0tM3LJM/2bY7e+xmTSCaHn1pXT1yIYlkK29OHGIaZII3FuZ5tpGd6kKK3aVke
         kCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8RmFH6o90ZDlvJBSqzJeei6VIaa1pkZjZ5HyWvE2Uhsd9WX8i7hItwHYqFg1dlT2+5UiXgWPWuA9O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ImclZkN64Kr3VSZf/PVwzbNEUers/VQCd1QpPmswMsLThZgz
	SxN+9qIOjgDCsNB2RgNFiUvm4IT4pk7gIT17cNvMoxXJqGYx7RrU2pKdlwRPug6+WRte2aQDy/f
	V76pZSyC9PaTXRpdJ/HlPXf8pN40Edw2qgzKHCP0RPWXt521QTe9Iy8eYtxxf0uLb
X-Gm-Gg: ATEYQzyWvNsKr6yi00oP87mYE9iAcWyt+58lkr4wRtNo1waKJny6orAR6ZMOuuqHYey
	DvnLjNHiL6KSp0dAkP+Mhig5EMd3HZz8n+BCBUrZLv6UFx0k9si3qf3UYyEgvBnUBlxYZmiOKJ6
	9YsbDLqfsiAJYQptk3llKS8NnzjgZuVzwYQuXLDmO/iRwO2DcjDN3M39dtJzTZY2+g8+sAv512x
	YaQek27i3U/kUBo3pyd9KxKqyFUmzSyCIOFqd3P4NrW4PAhdM0Fl4Q5tANMtamqKWn+c1ob8zaK
	62VVNpEiz9+yN8Qra12Js3wweAJFE6MsaN9TBW/O8Ahx2Lb0q8zZ7oOwmAtOwAM2fW2vh9LDfBN
	aKKKTAsl6MsIYKzH05UKmx3SnWbB34hlwcsqJgXUm6mwLpjbEP6BcjPadiKIQk/Y5Jk5vBHtTd7
	C4TSoIilpmCh2qh0q+XKsspSnkcGF6oszZsyQ=
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr234508371cf.52.1774971856320;
        Tue, 31 Mar 2026 08:44:16 -0700 (PDT)
X-Received: by 2002:ac8:5d4a:0:b0:50b:3b54:d78c with SMTP id d75a77b69052e-50ba3948161mr234507661cf.52.1774971855860;
        Tue, 31 Mar 2026 08:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm25387461fa.23.2026.03.31.08.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 18:44:11 +0300
Subject: [PATCH v2 2/4] drm/bridge: waveshare-dsi: support DSI LCD kits
 with LVDS panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ws-lcd-v2-2-a1add63b6eb6@oss.qualcomm.com>
References: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
In-Reply-To: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpy+vKRzoSpdaY3DpnDjQmiteFmEKy1q1NVqnjd
 FqjB4Egz8KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacvrygAKCRCLPIo+Aiko
 1ZvOB/0Tm4fejfgLri664iDJ96c5+5vVgH2yrmYylCAus8f6TMXK/onUIiyhxR41Tqjg5VjBJFB
 TG85SWopMKCSv6q7udlQUHFLU0fsDgLh7JHWC2LzbtkJz0RBnavHoDDaAqxh22lJIcGJw04M9en
 ZczkTswl/U88Ei/3FUhQr1uRcuYUOh7rS9iGYB4ey3GIHttg7AfCG1qsfeaWJLpHvimX1S2E4Jq
 6Dv+kfw43sJOBiYKJtdqIf++DNx/eqqeBJMOiRhSAnctPPSM1KTD2GVU9JoAE3ZQq0TMiavjx95
 dteOHVmNtYNpGFhh2GxoBmHS9nJy60GRw5ruzYmfpZul1hXZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cbebd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2ETHJKsuVJx8nypl5XUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX++aaB7Uogry7
 xEnHXhztAyeTlBKrXZ9QqnPDsE/6cE/u70MVBbZbmG29maMP3onXWsjy7X+IFO85xM8JKM5O7+u
 ueZM7X6bBKccbwztvspGjN/FJ5Q+6kihvK0pU+i/mgfbvgLKXpJ0K+Bh2KyEZXw9pNvyGzMgUJI
 099Du2yqFvmrc9X30ac6tNKXNtcBI//YJa0xBsHQtjcKbvejIanwnElerzIqcvS16JORKOsex4U
 aQgsLiuW33IUrIeGhP5+X8J2vw/oiKlQjiEaiI/JUaRE0lgkD3EP/KhJC8KiLChi+he+BX9MxVN
 t16DhKJtSsnYpQ+YFy68jYFnqXdCUfnRwW6vfgu10C8j+uNZtoV0peJQqXEZzBHiKEmXjMo/wYT
 7NOnuLAHvkdwjAShssy8caQZomAWD3XR/k3X/XDzj/Cm/z0MSyo9gyGBS0l1pbxDroJbo3f7QTs
 ghSKGa/8CQXjafOvd3w==
X-Proofpoint-GUID: gfciq2qEig1S8Q8CzdYNEho-6fGam2NS
X-Proofpoint-ORIG-GUID: gfciq2qEig1S8Q8CzdYNEho-6fGam2NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310151

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

