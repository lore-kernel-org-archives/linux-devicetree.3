Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5C4052C0
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373877; cv=none; b=AflmOeaNATkLj/CJp+xrLrVcQ6Io1qomEW6bzyRatUt3hk0EZWAgoW8/ixa6+1oHo+cFo30HmWRBExedqYjIKQoYbCjPKtxAMiZVvvInriUsT9YsyOsEvce9im4cGSw7tVl1rDkAq7qaJOVoY5dwJEydJrWBGAHa4B8MHqtofEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373877; c=relaxed/simple;
	bh=cQ/G3aEhZWOPjiM3+RnoGE2b9r5TAm6tR5Aox6TLgqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTvk7V9XHg2YJQrsQYSts1KTWTDBnZFbUE1GuhLBqFRiRaG1SNYXqXsV+I60eM9rHCKIcUmaBlZEwV+CIDKtCWjy3Wptg0cr25y6wT7sPSQJf2mdiODU0fFAwOI09bje6B6uA123QlzxB6NVfAegac9QmNEpCgOd5OUYpRDkk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxNytXVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9bk2ODe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxNytXVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9bk2ODe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj4Di1343065
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulUX1PfhXzORXHlWABVwqkmMfOQ65Z5Tu2tsRkN5/wE=; b=SxNytXVpAxkuWwOP
	qah0ztxp5H8GDVJvce8eXo2FfOoFhFB8OfLe+wq1HjjxPl+nGFDXD6UYe1j0hbte
	Wa48GRaK7rVQ5l8iKAINf7fRiqjWxDMljVFBUvmAgmIStowruIGY1ByP9NMQdWqS
	Q/SBo6fjE9ckfvLm1Py9oLilEwanfhYBSFGzIBh/jRecLHCaeLeWA3Uc5t4Bae8k
	NzkSqDWOdLku8/xj7MpXjJmIMjyjHTIzm7u5IV21TfgVn4cKEJtzvsmX38Fsf6WA
	KQL1ZU2owtZ6pfiN3sM8D/im91SGMW+g7IUH4DCg0mfmwlDKZmTAhUAZs4o0qKNs
	tI5BrQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:57:53 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f18b7ea78dso254160a34.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373873; x=1786978673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulUX1PfhXzORXHlWABVwqkmMfOQ65Z5Tu2tsRkN5/wE=;
        b=O9bk2ODey85HPnDsDSCtSe8KegM/Ig31vrlsJvo0HOx4uLkP0javULD1dpd5TiMhTb
         idpC8IMzMCxh2wm1k3Ob+sCqlWREKJoGseJlX+LMwQqSHfd9YSr4gzxsshctanjNphjj
         R2upO8kpj8rxGHOu72mFUhd1UX+AQvuCBgDSjQQnSpVixGLi1N4ZWHGEQvOSuZPy+ymi
         ji6/lK7uS1WL0r3+Bb66000x/kTYl3K96EcVbN6hsoan51g2Svok4WVc5sKsHhg/cVdk
         ojlmH87l50HjeEUpoGqc1Ksn9dFZEfxgH8wmepaYdH6/CQeiPWNGNvm0l/JcSYv28yZP
         3ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373873; x=1786978673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulUX1PfhXzORXHlWABVwqkmMfOQ65Z5Tu2tsRkN5/wE=;
        b=VcOjgsDSQ+POIYRYvoOxrxgA3Vwd2kdaZlISGcReI3jp6YLZsXCdT/gXpxfzbpLbch
         FVF8crVSej32osMFfwtKalmAMO7hYYS7cosArRbkFtyUuxfX2qAI6xIkAUZYepHk6V+T
         PjeRf6VysxSJC+Ul9fvrOzOM9jr3slMtbtEV50uWcxirT9vsaBpli0PJgcF4Ok9+CPrH
         AZDR8lxCptUyrgegljd60vOJR2b4sr4xu7cFiSNDWIhzIZnMnLejOUzJj5S0/M/8FDVs
         drY/PGnlJinRczulPxAOxdc4pgx7Z1qGIUtlRzcLZsjcSyfvmTT3W4sy5mYf+1Clw2Zc
         ExxA==
X-Forwarded-Encrypted: i=1; AHgh+Roe7ui+KoXeENz/c2PlLzsYefOxdhFYTtBoDg7kMJK0K3L/Jm5xyefMxebH3R51Qdspo4q5as3DMjES@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXh6WoKBE9DwFxfy9EyImUfpbBm24PqPTrGeN5LCDOAHbBqEH
	bFni9lIJIFoS35404J+EFADxvVbcOl+qYVnCwJGk/mp2g16IyO1s+VEF9+KgW2ouv0imyTWr+qs
	/JPHIRnxqlzsS19gGi67Iyt7gBqgnT85nW7hj/mUZWJDsvG3+D8nteKCUWKmNziHH
X-Gm-Gg: AR+sD11ohS1OAzz1yyA6F9n5l7zk7gCyX7uAZV/VG83xc6l9pjKZEuGcYwV54rQI1Ab
	hw4sNqowqHdMIfAoX0K5tM/5f0GurVTo9WOF/LmVRJGFf3LQEONenr4fZ/m8g2QfzbpxmpyssLW
	94UE0Kdww50DhpTA9etTIiIILie3k+sx/LMfzuq6iPK7UeuWo+24etrPr70ansd3JFCsiprjrbJ
	5/aQj2At5hMFWeWZI+VHIQqtK2lraulLoNpifkLvfwyPGhhyk1EaHsLc/9gCYel6K6ElOp/IeRu
	yLP6bS7/weK4StXU24l46QlxGYr6jvsyJk7R2cTEasNiO88Rz9j31IkG6iFQV3oq+PMqaG5RUm/
	zQEy+wvpo7rlP2UK9+9Lp2Uq5dCfXbi4FQljisVWOzi1I+0yrj/4pI0FGEbkfVbUopZ5G1ew+td
	m10/IQU4eKvqA5ycqrahOf
X-Received: by 2002:a05:6830:82f9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7f1e5c99307mr15648197a34.1.1786373872731;
        Mon, 10 Aug 2026 07:57:52 -0700 (PDT)
X-Received: by 2002:a05:6830:82f9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7f1e5c99307mr15648180a34.1.1786373872313;
        Mon, 10 Aug 2026 07:57:52 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b806fb3sm7609792a34.25.2026.08.10.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:57:51 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 20:27:29 +0530
Subject: [PATCH v2 1/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-lvds-panel-doc-v2-1-f2c2fe309989@oss.qualcomm.com>
References: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
In-Reply-To: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373857; l=1817;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=cQ/G3aEhZWOPjiM3+RnoGE2b9r5TAm6tR5Aox6TLgqE=;
 b=Il+7fsXSCG1eYMlDZaExA1yvXek5wQjItDtpDvc6U+EwP53FIvp2frbKbqayhQSss3iBThapn
 9I69g9dhKXwBBmFTiycu1yth33UPaTlMA9E7ZWpJfjX5ORAnECkzsPE
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfX9nsT9hmUMRzq
 RHs3L4IMXsoVoWGoaZNMB+SFai53jkQZogEPwGA5YzD+cTPCKyCQKy8GB/dvC0yCb6hk28mA1xL
 Kkqtiuyhl9A2fwPY7VDVsuzF5VTYxTU=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79e6f1 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=27YqphpXfrAMUR0MhhsA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: wIEq9VHYc2wuwMiZ-zrhkn_Mriz1AXM7
X-Proofpoint-ORIG-GUID: wIEq9VHYc2wuwMiZ-zrhkn_Mriz1AXM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOSBTYWx0ZWRfX3w4SELUGRe/X
 UC5vIOlMwM7HA5s9XsBZdmf/e8yW0HrQUnB6qSUMjj09Ykc0PyD/VusmkvXRpMOZAkcdN53VIaZ
 XDZlgYlrzC0WNbjDzljzcAEhrPRXd210h/knaJvy2p9BGf4AW4T/fbM6/9OWpyIdIS8HHjfonvv
 OMpx5+T9NDMIhu4hDjNg0n6gLx0TZmhZRlm9MKufsRCnzbV933J+tuz2rFStFKYCSK9SJcQ0ieh
 GYY/7Hje9/h2MVK9KGbK2ZRoK058xJOqY5EP/3bTAw1opE6qnFNdzVt11ZmOng/Ij1eFN9UtFtC
 +MUj68+Nq89jF3dVgp+O7zIuVe8454hBRqZ2noYSatKk+SghIxk6vrkzVOXS9Mt1Jkb3l74CntH
 9UR0Czrs6PZWOImw0icpK2eZl5HXcY0/oiFcziunan9++vXzmHqOgEflfDf95P4d/X9FT2Tgx24
 n1y6n5AJTuxEww5/ElQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100129

Add the BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel

LVDS panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5c169fdf265c..d95f842c8980 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1563,6 +1563,31 @@ static const struct panel_desc boe_bp101wx1_100 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing boe_dv215fhm_r01_timing = {
+	.pixelclock = { 148500000, 148500000, 148500000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 88, 88, 88 },
+	.hback_porch = { 148, 148, 148 },
+	.hsync_len = { 44, 44, 44 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 36, 36, 36 },
+	.vsync_len = { 5, 5, 5 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc boe_dv215fhm_r01 = {
+	.timings = &boe_dv215fhm_r01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 476,
+		.height = 268,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing boe_ev121wxm_n10_1850_timing = {
 	.pixelclock = { 69922000, 71000000, 72293000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -5726,6 +5751,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,bp101wx1-100",
 		.data = &boe_bp101wx1_100,
+	}, {
+		.compatible = "boe,dv215fhm-r01",
+		.data = &boe_dv215fhm_r01,
 	}, {
 		.compatible = "boe,ev121wxm-n10-1850",
 		.data = &boe_ev121wxm_n10_1850,

-- 
2.34.1

