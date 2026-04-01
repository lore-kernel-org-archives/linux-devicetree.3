Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26138229D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028420; cv=none; b=YVHHyFUisFVZCE/+1JHTg2Vdvjgf82L08KvunA1LOB3nnplfIejOfEdqkz6B2ka3QxScu1Pp5lLe7e4S/1u3/VnPyhufnrcUapP6tZvE93RpfdWTU+GDaAviXRbI8YiF6Ut3AYr5cB6oZDdEWVxN9+25pbn7quErs1NET3bhYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028420; c=relaxed/simple;
	bh=ICRBrnQij3AHdlL1aBsp8l8GKgsmUylWuvxjYCl0Jww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xj6Pik7YZaporaxolkwTxIPerm6s27XWqlhPFbsOOmuyIucJnFV1eY7eUFDZXJdyFLCkeIAe7h2jUe4B2iGfl3Vrf7/ywFCmv+O/YjKPZ9hGElBFAORnYsCyJamjv1hGE52s0D0FmuctaYr7uPLFRklmBg3JjmICy4oGqkF4O3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEYcjqyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hS92w7Sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEYcjqyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hS92w7Sb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Ep484106736
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=; b=IEYcjqyUP0UQxGwA
	Z6eTHdZQCkC0M4R+Nr3UYGtd/RwFFgVoRKq3KW8ZmwE5LqanPkuMMk6ezagYt7k1
	UUDce9ahN3n9SC4q4Tm/Y2gtbAv3VIc0HKM5eNFmGLCUTr8Iswi6Tc59VBI6iQGp
	GLZuKqh5/fwdkq8myJXyj19G1oVoRn1NnPCHXCDJlxEixTWZeB/NZImrkEpm1+xH
	ke6kWVWhPPn2HquEasM90JbfqauQMVEF12TAMOAdn94uDeQFtn6qtIrsKWCKNdeT
	dC5HTsV3aCF9KhvXD+XFT/i5YNVHKZOPBfyNuZHQxn6ApiGBfyPZc/aM2fziGG7h
	GLExnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso86753161cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028418; x=1775633218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=;
        b=hS92w7SbnuB1ZWRwUlL3sEW90M/ZBkAuNQCoV5H47EkOvlBqxyiwWEkSO+bVKr7eem
         BMSmUeV2BNzdQuYM0+pewn6DODIqdIEU0B7s1WZ9NTYzAbwTsW09/2mLLfyuA3slyHFT
         JAm3xeurkK5fZ4BuDkAK/eIMGjIwgbpnAHBFzn4MWsuJo3sirDWFDFXPEh72wXhW9fOT
         2scY1+e8BhVgl6hjZte9Ky2PG6B0VPdNnKQ101uJmzQrIMaN75l8rvQGlvUpxpeVh9dv
         3QHbIc0Us3fsADeT6xPpVE0vCIlMSfnh0DjbWhcpJqto9+mI7291Abce4CdLWjuDLhPA
         mrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028418; x=1775633218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=;
        b=N5aRuEQsgBpUwqhEarTGZ7npAR2il5TkQekhY11SFxu/lAr18BU8oWauPrkz8ItUNH
         WLQZZk23WtF8TltIHRYFMaQ89fx0pG9bUr1BlC3qUaqz6iPvOQ99NxVC8s7jpo2N8TQp
         K2xdPFlOXy9PZIbTsjzLo9tMDwIsrg6KwNlxcZjgBG+XVTwBV9Dy3GFtumviK2AFawJ4
         nkgoDrSmd3ig2obS7LnBFbY/WBrW/FWWe3yvM+g7N2EzAjTXFr8a+UltiXyHmVwsQDEL
         rjPDz+TMuHj3r5A22Q1NogLObbR5mFotlEVH8S28IZWbjCn9nom5VCOSugAXWDN8c4Pj
         QP/g==
X-Forwarded-Encrypted: i=1; AJvYcCV2JG3GRAfx+ta8iIPi1sVYKc5TKnhAMbbzC9mkLnxvWcg4pvHIvM2hRur9srG4XdFcqqNKcnQKS7Gh@vger.kernel.org
X-Gm-Message-State: AOJu0YxOdO/caYfKHSY4kp81YafZTSGP4qUpgqmajZVCp2taPFm9uIxN
	cRHrc3jMNV1UkAmdss72Bza/F+IXjGaPsDlQBWKN1JMPk87oZT8UW2T7atqxvRD3NbUiypzWs+u
	3a3iA9Np5rN5F9Ewsp16saMEQ9vf3GdjTCgFIM4hi/j2JOYwNecucGupw2TtuEqsl
X-Gm-Gg: ATEYQzyesX+tvDSiNWE2s/xPH4QhB1WqPnjH5gLHaEu/s/+1spgIwCyw1NUzIHuYfHh
	xhmZ6i+rTe0PyxPeOcXK73GX6WGitVNb0vSqZLGvMrr4Zu3ASOOPIarCV+OEtdGS931u14uri1X
	YlTlNKLTSZPtnLreTs2HwphHxjK6hcqNM2l1fWdWDmPM0Nrdh7KgMfPJykDMoLqBBJvgVd5QDNu
	Lr0poSa1uiqCuihs2wzDR/76amLIr0SakjFC6/11EVy1SxNniwhAF/YQJjgTLZ6P9rKJq5o3DMZ
	WGqIbumI12J07iXLvTGiE3DKLuS6R/vVXeYdRDkvoGPpKpOKySWPf7dXPuVVLeY07kSQQcn9mRw
	XU/7IHI68zMC81MdiDNb4NCpHZYQl0QRvAOmnvVQMYJF4zUEbqw0T+h1Pnzkr0tH12NyaBTdj84
	64cK5LVPmXABPwTcyhbxoQdCRpJJrPJTFh4xs=
X-Received: by 2002:a05:622a:5448:b0:506:6caf:3cab with SMTP id d75a77b69052e-50d3bc0a9e8mr37476791cf.26.1775028417626;
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5448:b0:506:6caf:3cab with SMTP id d75a77b69052e-50d3bc0a9e8mr37476651cf.26.1775028417263;
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:27 +0300
Subject: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ICRBrnQij3AHdlL1aBsp8l8GKgsmUylWuvxjYCl0Jww=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisLWXFY6GGXVfAmBGZzwLhMyy/wiVS8/GGS
 nXgHm7+YeiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1fa5B/4rA2razUl1EdKZVnBd1wxc26tJ4GQzJOG182PKBt6opAY/YjmYxnMi0rVWhK8EhFW3ZGa
 z/8BC/+RpXTsXxC7wQ5nM1kzZtzCkDX7xt8ySloFRcZ8iijpwg+K+QrNzk8oYDFuq80xgG/I3wL
 TICqFlNA8yC4I8cO4Fi8NK+pAKSGxYkdN3ctiBIWLYuPqaZXEF3bFAnvkQT7BLBVxPrSuZ8m8dN
 BHAkPNJJp0rLagT4+4dHo6nDuP0sm5m2FGnu0uqaT0IpeRXnJsY00MQSZBtddkeFK3Yi5P9TbdP
 dmCkbF5OeIMrwcMX/zeVXQuGThvrp7TPXiZwuCjPAQqErfNH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: D9K5mW_UnGiLL6wCr_vnv9lLVeQIAR8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX7YLvFK6OLwhD
 lU9jzbKuqDvas4MQRi81CJOIt1NScJkH4Lwq+TZMzGKXdECtjNhcDSFZppaBeiK++3KeCtycb5/
 CQLuADRG6Up3MmOr1kWU3sb/INq5med6hgoorWLOwQ5hH+RiKx8jJydFmXXm5ncwdxvQ9Qc+gbn
 6KnrnAc3UR6ejKPDTQIqlewQmQ0IIlKcW39uzUWlQ/zwWtb/mcrFi2b2ojju8yMseV+i7odLE6P
 ogKysUw+zGuFIYXjeMyYRjusiNZhLJw9k/uuw99Ye5M7tkPvC15cjZ4vBVrdeRfBuBns0/teuwE
 naSXa+DhDFDMK3W6qMA82Icx49cBHWSGUs1jAEROsXzp6Qi8fqEz1L8ZQdG3H8nzwbtgKK9odg8
 HHuzWgKYsV7mYWcyIctoCj6C6rpMpX3cuT/yZFegiJM1uQQXpO+P2LdwsjaMnwJVEiE76kAYKE0
 qTJX3pIa3BBiX4j2yPg==
X-Proofpoint-ORIG-GUID: D9K5mW_UnGiLL6wCr_vnv9lLVeQIAR8P
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cd2vOsepvhAVWqutC0UA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..d64f3521eb15 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.47.3

