Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3837CD44
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028429; cv=none; b=r+FCgKt4V1TGUGuoLAuFCUusxFNNFlBenByW+8Q4bny0mATycyJVvQ92pm3P1va+BjQHUkwt3viRkAASKRKIfsJprk1HPvRKoF5Diu/HcDhZ/CR4tAth8rm5XAqM42fEPZNoH9/gV0w7ahgySj7qhiDiBtqXdaU7E1GI4Sneiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028429; c=relaxed/simple;
	bh=EnIudP2dkv0psMSTc/VxhMNE1Y82xgXO/GhT4OjRcK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4LtF+o8TE+s/f59xrWvFs0XePmtTqXJhhSzU0QF/+4vSUT+k+5c88enFXrJozFHqYQdzYfmGNCJzrvvSTPqc8Wv2upcBVSfYVd099Crb9pHXKWrYeITlxtwoYZpitHceKl6BeqBbHWPXQfpjl+PlX+Jnyh+fFbDIC4tY8R6Yu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuV95Bfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE4/K6um; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuV95Bfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE4/K6um"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VJfq1459458
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=; b=AuV95BfdhL+Opmfg
	jcU4C8KMnOx/l9/5FzjcE5B4pfGuP8jEZoHMQC+hcUtQCtD7o5vRc1UVSEDuzcUM
	HzVOTHep4X4VKRBZ+Q1b+Vc5A8XihEi4Hjb+kfG8XVl+dFbGplSU1ae3LyNnqpyu
	r/XEuaGQs4UsFSeVEgbeLXUgTJIJqyBhdVAAdDuS/7Y1z6cT0nmd2f0p2ZSpvdcK
	zKE+CVGzPNbGIhyUVD6mGF0QO/3aXUhvyhMQTAxzLAIbQj4nnQdIX/DkYBuN/EQF
	eSv9Qiqwet/IlbNfQaHmYbOa2cWVABIxKaicDPO+ZVUeDFJJIKI/NrDhyeGPAO1R
	hfKXVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0uv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:27:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso71925831cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028426; x=1775633226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=;
        b=XE4/K6umO3Z51va4v2bDdh6Z4eiGnbMl3LzEkqJGhUxzO3jqlINIIZaenoevb5lZcE
         rFlR8vjxVgu89nFohygkrhDxiwD0mSy6o+Tzwbw73np9iGOea+hOrHZkvY66F4NDx+RR
         WIScBh5+EzM/pdKGkLQ6dZ92XxB6uNJducLPZOZjL3QdhbDyhBPWq8aKpeQDJ5tD0Dqz
         Cgu2wBSiJ5UQIWmiJzhDLugTUA7ie2phXg0qo4QEYoJ9WuASlebNn/TE8Sbdm5nNNvRD
         8xYrfn7a5tRKjG8DKHZaRXW0XE6RiexgcXxArPqxhtSoERoqzyNecozKRnUFeXCQ+j+r
         mTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028426; x=1775633226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3tt35zca4Yf0zt4f6l5trL2SRMBblb/msuZnR25dvg=;
        b=VKBtHe+IJMv1Irzq3CfwBH2Pg5ke57OjxjgCyxFBZeiKYXhFvWFzE4lPhf2xmf87os
         b7608K2FodtN+wPp9bniuKwQC8F7g50kLAFbC2Yu9pp9vYqlW0yOgl+p9lzv1P4bA/Au
         cgy0HItnHoNcL3PihRbZnj3AYBER14wFpw85LJ/5J8bFbH7Irq9xP3l0kcNJtq4AtN2w
         HfZyg1mUDBbIoCXqmIzyctth27MArZov67lutw6k3wvSF2U+8REu+OVWg7Ygo8x2gTOe
         GViDHTig1Uy2Hy9uMtLYfeUVCy5xp9JOiw6T6lSN3DC3PBBk35dAp2xQ2OBCiglNXf+B
         5dzw==
X-Forwarded-Encrypted: i=1; AJvYcCUFeKOuAzn55/xWXlIfC+8SVI/73MoJeayily/5eiPLxOmMmWe/3WS3KEG9ddiPVK0o2/5s231ppjJ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVfuAoWbSqOIyxg5M6QILYeXPvA8Ymlh3SBZ8MQyOkSdpFv/+
	rJ2YsfiGmtiUabrLmUdwcniHILcx4jYvLCDqRyU1TSLeaGTv8ZYY+BvWneCtTl1vSMDdxBigGjt
	PslSZIwhoJhZ0iwQ+NPX9mv5xhFW00u67AofNJoajc9PfkI+KnL9Hs9vnuyx7xO+X
X-Gm-Gg: ATEYQzyH9GIKsZYnyxLa/3Rl91f+PnKLZOREYT0bOGnD7QP82KTgZXxXi+qoIpt8k2C
	9LeKkHIz5YNDm858Fk0zBNRp2fCkG7xINd/bQFhAKucRHDLpIqLP3POcSP6q2yFBiENSzCiaFj6
	Z7Ju9OUFWtXNs6WfgH9ou2JSU4Aww7de2rpUZlRUmb2fY8Uvq1YF0M2O8ewzR9cQGnY9TTnGvNH
	EC7PmijeRELQoXWhh0lQUqoilpodfGxPKDET1gsZIYQ8auKC3exjzupqg8CS2PKdNmzBDxVbzUY
	fQgtq5B/Ghxs4cZLx9QZmFP0cX3dxXh9H/FO6nMy8YZqGRJH36u1pmwWjp9TfdNhjlLILIn7Ni2
	48Dimw8J4CtAFfcFz9GcRE+xl31pOkaPqFO7mV8628LC+QtTeVL84QsXx+X7p890+N09t575cfN
	evyAJW2m31BDQ23cipUbD1kyT8lZG7OYOLoRo=
X-Received: by 2002:a05:622a:1f0b:b0:50b:2708:6ba6 with SMTP id d75a77b69052e-50d3bd84b35mr33564351cf.37.1775028425593;
        Wed, 01 Apr 2026 00:27:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0b:b0:50b:2708:6ba6 with SMTP id d75a77b69052e-50d3bd84b35mr33563971cf.37.1775028425153;
        Wed, 01 Apr 2026 00:27:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:31 +0300
Subject: [PATCH 12/19] drm/panel: jadard-jd9365da-h3: support variable DSI
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-12-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EnIudP2dkv0psMSTc/VxhMNE1Y82xgXO/GhT4OjRcK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMise5q716JNb6mCOHextVpcrev8EGq1VfyrS
 XejKxWxc/CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1atlB/9ybXh0oNRRyVFpLsEO6chTzWL7HYwNjNu/Pf4qF1Lte3YiAXlwF+e5DzcRdGdmzLDuWw3
 orTibRNusLWwzPjASY44YPX9XKSstSru7XMZUXUk8rBMvlVtSgsvyZOIXxob01kAkzO6lGdaHHm
 75jyrWRT9FIqgGpu+mCBVio7tBEfFziYyTac5rvQf6kwc1ef0/RAiARmtFWFB3hmZnDF8+5SyHr
 OdI/3Lxq4YCFtd62ytRvvLd2PF4YYKttCc1rg59V3+YtPNg+nOvIQY13BMP2D1BNNDR4H+c7q7e
 93BCtdbug9bYsLRpzXagMO13gWpIeJaFyylQJwqYqo+WCIOS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX//QqDXn4Qkxb
 FOmW6CV1rqZQh3Vd3bZKJXY3SaxFQPSnxIKZkwPvYIXw+lK8eVMYnSPjXdcXO/v0enyGwKiFVMk
 +3/MY/YGpagpCPh4pkk7Mv75AJg8RZLEKdVsb8V9190QX8YjKbkPrgeuimHiJ6YQ2xMwGm2sCTv
 riUYARu+li82xu6hNN3qmegK3raxRs9e3b/bZGnqhKBxuhT7bKG1ICOE3PGL4p1tshytVwWPakf
 BY+9paKRKDr0/0b5QRCNRDQro1vyKU3x12IxFtToWEORntRvl2Wua+Ygo/xhmXXG7KUeChf6Ot1
 bi+q5YY0piSMHniJVSWFCCPWUooOPOsTjADNtv4Jtj7QaNPVl/Tz5YsWx9DiF2FX56YZcIMW90y
 /OXITy7Bsr69Pk99wCKggcRJHlBFa6sacW+PIoqXne7ChmXq/SEx1fZdQtSZT33hKRhz7rzQi5V
 W0dB8LTkb18QXjjaH9w==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccc8cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_FY8QkBUUwJpvv6m3lQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AOsSVV4wm8hQ6laiYFl6WylEQIiEqAKK
X-Proofpoint-ORIG-GUID: AOsSVV4wm8hQ6laiYFl6WylEQIiEqAKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Several panels support attachment either using 4 DSI lanes or just 2. In
some cases, this requires a different panel mode to fulfill clock
requirements. Extend the driver to handle such cases by letting the
panel description to omit lanes specification and parsing number of
lanes from the DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 32 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 1884ad2404cd..5d9db2e1f28f 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -23,7 +24,8 @@
 struct jadard;
 
 struct jadard_panel_desc {
-	const struct drm_display_mode mode;
+	const struct drm_display_mode *mode_4ln;
+	const struct drm_display_mode *mode_2ln;
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct jadard *jadard);
@@ -57,7 +59,10 @@ static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe2, 0x65);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe3, 0xf8);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
+	if (dsi_ctx->dsi->lanes == 2)
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x01);
+	else
+		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x03);
 }
 
 static inline struct jadard *panel_to_jadard(struct drm_panel *panel)
@@ -151,7 +156,10 @@ static int jadard_get_modes(struct drm_panel *panel,
 {
 	struct jadard *jadard = panel_to_jadard(panel);
 
-	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
+	if (jadard->dsi->lanes == 2)
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_2ln);
+	else
+		return drm_connector_helper_get_modes_fixed(connector, jadard->desc->mode_4ln);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)
@@ -354,7 +362,7 @@ static int radxa_display_8hd_ad002_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc radxa_display_8hd_ad002_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -586,7 +594,7 @@ static int cz101b4001_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc cz101b4001_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= 70000,
 
 		.hdisplay	= 800,
@@ -819,7 +827,7 @@ static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1070,7 +1078,7 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1326,7 +1334,7 @@ static int anbernic_rgds_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc anbernic_rgds_display_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
 
 		.hdisplay	= 640,
@@ -1562,7 +1570,7 @@ static int taiguan_xti05101_01a_init_cmds(struct jadard *jadard)
 };
 
 static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
-	.mode = {
+	.mode_4ln = &(const struct drm_display_mode) {
 		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
 
 		.hdisplay	= 800,
@@ -1614,6 +1622,12 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
+	if (!dsi->lanes) {
+		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
+		if (dsi->lanes < 0)
+			return dsi->lanes;
+	}
+	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
 
 	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(jadard->reset))

-- 
2.47.3

