Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE635CB6F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249769; cv=none; b=u6KCdtRiTGoRlDVFbtTYViFlzDqaqWq3DbLPdtUIRakGti4LPIUowlCp6tel5ywnVtc4FoMsTRjmxfkxzJPHAbWFoDnFIHrkTA2b3iBUOheOabvNEZ7tinG43DxJ46foMLGzVDEf4rlK/Psv6kZqB198npsoU344rNDR8XdHUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249769; c=relaxed/simple;
	bh=ktMsTCSuwp7DQTQ4qVE5a7H4jGSxzAbKMdYRPnwQTRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vr+RjTNIpebnX5+K10B2rvQmKEqCicdhQ4MjxR4ykd3PpOGcCASBPvXl5FAsCbrY6UOiGIiOE+NldvcAjmzVzY6eyDD3I+snZp2alBuFaaU9PS5jsNTca9HgiJgUCRQSPrmRY5/XN3UFbOp01h1+HozW+HGhCAU7igVQ0MqhFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T89rZBjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8zixkJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T89rZBjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8zixkJ8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLwPwu347165
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WeF+Ob5tl4yfjE0W7apTI5WVe1IOZ19c/Jf85omsk64=; b=T89rZBjFyQWCqWnM
	o1V2xg1sEfmAIdvZmDoPnTxn3/c8p/FWdGFgf1hVaNkzMC+gUMGx8tL3VgH27Y/k
	sxJhMrUdh2f7hgDCP+0+StM/NPVFIulIjslPsU1VXQTeyZINwFLwCmiGhJLN6vTe
	JgkhOja8AQ/uW+Dn1gCjCm6bk5Nd1R658/OCPXYs23rYR9A0bdBVHzF4eXQtivky
	Pj7ST1kwNr0DE5tNKt+TAQVWSNtBiQoP/gpZeJz4vjrRzg1WtCqWvHHM+YXKa8W5
	b7KKvTI+br3U1Z6MEXo8P2cRx3xI39Lg8JlU1P5GKBPJ3owT/ZCFdIobytiP0j6c
	uDif7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1m4p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:09:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aebfa0af7dso32072295ad.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774249766; x=1774854566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeF+Ob5tl4yfjE0W7apTI5WVe1IOZ19c/Jf85omsk64=;
        b=G8zixkJ88w2Wcvi9+YRw9ryZVgInpgC8nkU2YGTvd8ZDRq2dlF1ZLUyWfvpCGaQpUn
         AItaPZsP1IKIwerwNx7qaODLBVfGt3MJ68AjBVIL2XRyFQv7L2qxPcPmOgxY1U0quTTB
         oDnbjrJ9T36Hz5tIwt5Xn0aT7y5A/5p+UTkQLnEZeyS7gfz/7Vqfc/JQ6d6UCHgrrCz2
         saRQX44ZAPZdbVihhGd2A2yoLDBsn6P6fLmlra7QmxQcDp/3gZaJSmEV+XneSSm9ZvF5
         ruhS/2yerJwcqGtWaFm0iXPRCb0aKDD3xPhQg5ZU/O0g9QLfBexWkSek+VNET8QuIS5W
         1PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774249766; x=1774854566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WeF+Ob5tl4yfjE0W7apTI5WVe1IOZ19c/Jf85omsk64=;
        b=SUtqQie0s2+JWvpiX9OYfk8Xs7vvDKl7v8bfAR8xtEKFSW/8q6A1I1Wg9caRAscK1i
         qKir+duwb7FVizi5FTl0rwkSWVUrHvF4KUqwN/EACHK881PPCZs07nigbZb59Pyx7UVt
         chEoo0I0uMd+4Bd/Olvy6bwP6RpzTLOnmuldeoSIbggeXxDVzgqBq/mUYW9OTPYjgKVG
         3YEoNmD9dZsGzencFc/cRYc5ZbIOZX4UnIhHEVprzXIiC57IXV2b3HYeFs/4XcP6O26o
         qWiX5y60EGKRsMEoIKZDYZROVd6eI89GaYQhzsXA99YytgdoMqnaNpzNYvtrsHrjmhHW
         ebfA==
X-Forwarded-Encrypted: i=1; AJvYcCUQVuBZVYjtHYCW+9TR3OaLpo3GJGps5tBHRWwYpOMR8cnQZ9HRMYEfpF57yoZs51N09/fwJfQAXVvo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qS9SbgHaPh8usLIWjrPZWSomzNrvKxGe4WtJGOi1vQBL78i0
	JEvlZjOvVNPzrrYtzCWbr5OLJI1YLX6WN/hHxD+OyTZs3GiOi+DypC0jFMuE0bVuj5Ssqd18nvj
	W7ItO9MJL5blwtOfbviblHKwqr1SmV0gXplGg5m8es3K7rUwoLMC6IaqfvjHWWt41
X-Gm-Gg: ATEYQzyd5GU3A8ghyIWYF+ifnCiRBwynAFHqqBdWomkC2OXbuWYo9cKyAGBxPBvsVon
	TYb7k9XMz2uLLQaTClNn6Yz3U1iFfqLzZCL8i2BmmUEpNqEUEyXAXdT24koqslVSbZvD9x7wUDP
	7s4Wf7EfLvyW5Ik9ZdGVQSeRWAVkpcermONM25oNxq+QIuNGBUt6bwgas/AynK5C3BGe3tYGvZC
	EtOinCHcj67ea2OKPw/WlsUBDl5hSC2IGcKHa2NVxTxCHaxZhn29C7g+cA4aq1X/LamScVpYCWq
	a1p6zATnqhIyuzy+NXJiDK4nL9wAAVDz3yX41oVNyna0zGCRCXikUQX5YCvBz5TyTWuRyAUev8Q
	ZAFgWKoq1lXw9raGpQ7HCImxMxzuzakPHvk9215d0P/twB8t2d9Jj6qr6uOFPfA==
X-Received: by 2002:a17:902:ce90:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b08278b31bmr115557655ad.25.1774249765640;
        Mon, 23 Mar 2026 00:09:25 -0700 (PDT)
X-Received: by 2002:a17:902:ce90:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b08278b31bmr115557235ad.25.1774249765000;
        Mon, 23 Mar 2026 00:09:25 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b45sm133118795ad.42.2026.03.23.00.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:09:24 -0700 (PDT)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:38:53 +0530
Subject: [PATCH v5 2/2] drm/bridge: add support for lontium lt9211c bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-add-lt9211c-bridge-v5-2-9c63bb035c17@oss.qualcomm.com>
References: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
In-Reply-To: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774249743; l=26735;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=J9/q/mIqtAnkkFYArCE0DqLE7okUlqTSdFHghAXN0vs=;
 b=txUT0GQ3k1rmlo3Y6wJx28NnI8hCD6yOZ+jrRQ3C6Vdv71PLd88dntvoWvI7dev9HGcMtTwvo
 tM+utMGonfRA6HtWpe3iYDblihs4qESzTpfxQ4ZAVvLfPVz5fwKJ1cO
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: eXyu488HMJC5ruC6V5S9IBH1cZ49tj5z
X-Proofpoint-ORIG-GUID: eXyu488HMJC5ruC6V5S9IBH1cZ49tj5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MyBTYWx0ZWRfX31zX8Zv7bk+N
 ChSJz44K6ORd581rbXZSan6rIgMbx2+i0IrIJugvZ7IGh4lkQySSTz+fortA0lmQHnHsE++/PEQ
 HrjLBP6m8tnGipsIQvBSXTIc/e60GIWR5feEGJV5k9UblCFSkg9br2ommdDN+4EcCSQQpPyDyQm
 QDcSeruVr1RdFmTPl/MMN9GudUReR0iwCZrDRMtD5nahmZ8Knqf7nZXK8y4wF/OZia+Y6OJAvmj
 hwgUJWy7kfECx6nN/sPLmAhyAAHYea/7AOrwXshskIFF2O9Co3PaMrIbUJYgUr5TGfy7hWC5Sap
 Va+BjJX3CXdtij71XbcJn3labekTPMSe+AL0QrEO6hKfdH+zqbjhws7gXWS6kljTED8Wdkq1g9V
 +fGRSpt7JJ/alXmomH9VwCcN09VRD/QknaCuooZtjv3b0KjbnTEs8KVqP+p8h+9K//O4Cm302BX
 lR3jg8CI+FZOA3Tz3Fw==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0e726 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bTVNP_D2NMafA5OBl_oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230053

From: Yi Zhang <zhanyi@qti.qualcomm.com>

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
Extend the existing lontium-lt9211 driver to support DSI-to-LVDS
bridge configuration.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9211.c | 846 ++++++++++++++++++++++++++++++--
 1 file changed, 805 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
index 399fa7eebd49..4a8544eb2192 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9211.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
@@ -19,6 +19,7 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -36,20 +37,39 @@
 #define REG_CHIPID2				0x8102
 #define REG_CHIPID2_VALUE			0xe3
 
+/* LT9211C chip ID values */
+#define REG_CHIPID0_LT9211C_VALUE	0x21
+#define REG_CHIPID1_LT9211C_VALUE	0x03
+#define REG_CHIPID2_LT9211C_VALUE	0xe1
+
 #define REG_DSI_LANE				0xd000
 /* DSI lane count - 0 means 4 lanes ; 1, 2, 3 means 1, 2, 3 lanes. */
 #define REG_DSI_LANE_COUNT(n)			((n) & 3)
 
+/* Chip type enum */
+enum lt9211_chip_type {
+	LT9211,
+	LT9211C,
+};
+
 struct lt9211 {
 	struct drm_bridge		bridge;
 	struct device			*dev;
 	struct regmap			*regmap;
-	struct mipi_dsi_device		*dsi;
+	struct mipi_dsi_device	*dsi;
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*reset_gpio;
 	struct regulator		*vccio;
-	bool				lvds_dual_link;
-	bool				lvds_dual_link_even_odd_swap;
+	bool					lvds_dual_link;
+	bool					lvds_dual_link_even_odd_swap;
+	/* LT9211C specific fields */
+	enum lt9211_chip_type	chip_type;
+	struct workqueue_struct	*wq;
+	struct delayed_work		lt9211_dw;
+	struct drm_display_mode	mode;
+	bool					bpp24;
+	bool					jeida;
+	bool					de;
 };
 
 static const struct regmap_range lt9211_rw_ranges[] = {
@@ -93,6 +113,49 @@ static const struct regmap_config lt9211_regmap_config = {
 	.max_register = 0xda00,
 };
 
+static const struct regmap_range lt9211c_rw_ranges[] = {
+	regmap_reg_range(0xff, 0xff),
+	regmap_reg_range(0x8100, 0x8182),
+	regmap_reg_range(0x8200, 0x82aa),
+	regmap_reg_range(0x8500, 0x85ff),
+	regmap_reg_range(0x8600, 0x86a0),
+	regmap_reg_range(0x8700, 0x8746),
+	regmap_reg_range(0xd000, 0xd0a7),
+	regmap_reg_range(0xd400, 0xd42c),
+	regmap_reg_range(0xd800, 0xd838),
+	regmap_reg_range(0xd9c0, 0xd9d5),
+};
+
+static const struct regmap_access_table lt9211c_rw_table = {
+	.yes_ranges = lt9211c_rw_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lt9211c_rw_ranges),
+};
+
+static const struct regmap_range_cfg lt9211c_range = {
+	.name = "lt9211c",
+	.range_min = 0x0000,
+	.range_max = 0xda00,
+	.selector_reg = REG_PAGE_CONTROL,
+	.selector_mask = 0xff,
+	.selector_shift = 0,
+	.window_start = 0,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config lt9211c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &lt9211c_rw_table,
+	.wr_table = &lt9211c_rw_table,
+	.volatile_table = &lt9211c_rw_table,
+	.ranges = &lt9211c_range,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0xda00,
+};
+
+static void lt9211_delayed_work_func(struct work_struct *work);
+
 static struct lt9211 *bridge_to_lt9211(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9211, bridge);
@@ -120,15 +183,24 @@ static int lt9211_read_chipid(struct lt9211 *ctx)
 		return ret;
 	}
 
-	/* Test for known Chip ID. */
-	if (chipid[0] != REG_CHIPID0_VALUE || chipid[1] != REG_CHIPID1_VALUE ||
-	    chipid[2] != REG_CHIPID2_VALUE) {
-		dev_err(ctx->dev, "Unknown Chip ID: 0x%02x 0x%02x 0x%02x\n",
-			chipid[0], chipid[1], chipid[2]);
-		return -EINVAL;
+	/* Test for LT9211 Chip ID. */
+	if (chipid[0] == REG_CHIPID0_VALUE && chipid[1] == REG_CHIPID1_VALUE &&
+	    chipid[2] == REG_CHIPID2_VALUE) {
+		dev_dbg(ctx->dev, "Detected LT9211 chip\n");
+		return 0;
 	}
 
-	return 0;
+	/* Test for LT9211C Chip ID. */
+	if (chipid[0] == REG_CHIPID0_LT9211C_VALUE &&
+	    chipid[1] == REG_CHIPID1_LT9211C_VALUE &&
+	    chipid[2] == REG_CHIPID2_LT9211C_VALUE) {
+		dev_dbg(ctx->dev, "Detected LT9211C chip\n");
+		return 0;
+	}
+
+	dev_err(ctx->dev, "Unknown Chip ID: 0x%02x 0x%02x 0x%02x\n", chipid[0],
+		chipid[1], chipid[2]);
+	return -EINVAL;
 }
 
 static int lt9211_system_init(struct lt9211 *ctx)
@@ -505,8 +577,8 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
 		lvds_format_24bpp = true;
 		lvds_format_jeida = false;
 		dev_warn(ctx->dev,
-			 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
-			 bridge_state->output_bus_cfg.format);
+			"Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
+			bridge_state->output_bus_cfg.format);
 		break;
 	}
 
@@ -519,35 +591,42 @@ static void lt9211_atomic_enable(struct drm_bridge *bridge,
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	mode = &crtc_state->adjusted_mode;
-
 	ret = lt9211_read_chipid(ctx);
 	if (ret)
 		return;
 
-	ret = lt9211_system_init(ctx);
-	if (ret)
+	if (ctx->chip_type == LT9211C && ctx->wq) {
+		drm_mode_copy(&ctx->mode, mode);
+		/* LT9211C must enable after mipi clock enable */
+		queue_delayed_work(ctx->wq, &ctx->lt9211_dw,
+				   msecs_to_jiffies(100));
+		dev_dbg(ctx->dev, "LT9211C enabled.\n");
 		return;
+	}
+		ret = lt9211_system_init(ctx);
+		if (ret)
+			return;
 
-	ret = lt9211_configure_rx(ctx);
-	if (ret)
-		return;
+		ret = lt9211_configure_rx(ctx);
+		if (ret)
+			return;
 
-	ret = lt9211_autodetect_rx(ctx, mode);
-	if (ret)
-		return;
+		ret = lt9211_autodetect_rx(ctx, mode);
+		if (ret)
+			return;
 
-	ret = lt9211_configure_timing(ctx, mode);
-	if (ret)
-		return;
+		ret = lt9211_configure_timing(ctx, mode);
+		if (ret)
+			return;
 
-	ret = lt9211_configure_plls(ctx, mode);
-	if (ret)
-		return;
+		ret = lt9211_configure_plls(ctx, mode);
+		if (ret)
+			return;
 
 	ret = lt9211_configure_tx(ctx, lvds_format_jeida, lvds_format_24bpp,
-				  bus_flags & DRM_BUS_FLAG_DE_HIGH);
-	if (ret)
-		return;
+					  bus_flags & DRM_BUS_FLAG_DE_HIGH);
+		if (ret)
+			return;
 
 	dev_dbg(ctx->dev, "LT9211 enabled.\n");
 }
@@ -672,11 +751,6 @@ static int lt9211_parse_dt(struct lt9211 *ctx)
 
 static int lt9211_host_attach(struct lt9211 *ctx)
 {
-	const struct mipi_dsi_device_info info = {
-		.type = "lt9211",
-		.channel = 0,
-		.node = NULL,
-	};
 	struct device *dev = ctx->dev;
 	struct device_node *host_node;
 	struct device_node *endpoint;
@@ -685,6 +759,8 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 	int dsi_lanes;
 	int ret;
 
+	/* Check if the compatible string matches lt9211c */
+
 	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	dsi_lanes = drm_of_get_data_lanes_count(endpoint, 1, 4);
 	host_node = of_graph_get_remote_port_parent(endpoint);
@@ -698,7 +774,22 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 	if (dsi_lanes < 0)
 		return dsi_lanes;
 
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	if (ctx->chip_type == LT9211C) {
+		const struct mipi_dsi_device_info info = {
+			.type = "lt9211c",
+			.channel = 0,
+			.node = NULL,
+		};
+		dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	} else {
+		const struct mipi_dsi_device_info info = {
+			.type = "lt9211",
+			.channel = 0,
+			.node = NULL,
+		};
+		dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	}
+
 	if (IS_ERR(dsi))
 		return dev_err_probe(dev, PTR_ERR(dsi),
 				     "failed to create dsi device\n");
@@ -707,10 +798,16 @@ static int lt9211_host_attach(struct lt9211 *ctx)
 
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
-			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
-			  MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	if (ctx->chip_type == LT9211C) {
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+	} else {
+		dsi->mode_flags =
+			MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
+			MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
+			MIPI_DSI_MODE_NO_EOT_PACKET;
+	}
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
@@ -732,6 +829,7 @@ static int lt9211_probe(struct i2c_client *client)
 		return PTR_ERR(ctx);
 
 	ctx->dev = dev;
+	ctx->chip_type = LT9211;
 
 	/*
 	 * Put the chip in reset, pull nRST line low,
@@ -745,13 +843,29 @@ static int lt9211_probe(struct i2c_client *client)
 	usleep_range(10000, 11000);	/* Very long reset duration. */
 
 	ret = lt9211_parse_dt(ctx);
+
 	if (ret)
 		return ret;
 
-	ctx->regmap = devm_regmap_init_i2c(client, &lt9211_regmap_config);
+	if (of_device_is_compatible(dev->of_node, "lontium,lt9211c")) {
+		ctx->chip_type = LT9211C;
+		ctx->regmap =
+			devm_regmap_init_i2c(client, &lt9211c_regmap_config);
+	} else {
+		ctx->chip_type = LT9211;
+		ctx->regmap =
+			devm_regmap_init_i2c(client, &lt9211_regmap_config);
+	}
 	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
 
+	/* Initialize LT9211C-specific fields */
+	ctx->wq = create_workqueue("lt9211_work");
+	if (!ctx->wq)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&ctx->lt9211_dw, lt9211_delayed_work_func);
+
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
 
@@ -769,17 +883,667 @@ static void lt9211_remove(struct i2c_client *client)
 {
 	struct lt9211 *ctx = i2c_get_clientdata(client);
 
+	if (ctx->wq)
+		destroy_workqueue(ctx->wq);
+
 	drm_bridge_remove(&ctx->bridge);
 }
 
+static int lt9211c_configure_rx(struct lt9211 *ctx)
+{
+	unsigned int pval;
+
+	const struct reg_sequence lt9211c_rx_phy_seq[] = {
+		{ REG_DSI_LANE, REG_DSI_LANE_COUNT(ctx->dsi->lanes) },
+		{ 0x8201, 0x11 },
+		{ 0x8218, 0x48 },
+		{ 0x8201, 0x91 },
+		{ 0x8202, 0x00 },
+		{ 0x8203, 0xee },
+		{ 0x8209, 0x21 },
+		{ 0x8204, 0x44 },
+		{ 0x8205, 0xc4 },
+		{ 0x8206, 0x44 },
+		{ 0x8213, 0x0c },
+
+		{ 0xd001, 0x00 },
+		{ 0xd002, 0x0e },
+		{ 0xd005, 0x00 },
+		{ 0xd00a, 0x59 },
+		{ 0xd00b, 0x20 },
+	};
+
+	const struct reg_sequence lt9211c_rx_phy_reset_seq[] = {
+		{ 0x8109, 0xde },
+		{ 0x8109, 0xdf },
+	};
+
+	const struct reg_sequence lt9211c_rx_clk_sel_seq[] = {
+		{ 0x85e9, 0x88 },
+		{ 0x8180, 0x51 },
+		{ 0x8181, 0x10 },
+		{ 0x8632, 0x03 },
+	};
+
+	const struct reg_sequence lt9211c_rx_input_sel_seq[] = {
+		{ 0xd004, 0x00 },
+		{ 0xd021, 0x46 },
+	};
+
+	const struct reg_sequence lt9211c_rx_dig_seq[] = {
+		{ 0x853f, 0x08 },
+		{ 0x8540, 0x04 },
+		{ 0x8541, 0x03 },
+		{ 0x8542, 0x02 },
+		{ 0x8543, 0x01 },
+		{ 0x8545, 0x04 },
+		{ 0x8546, 0x03 },
+		{ 0x8547, 0x02 },
+		{ 0x8548, 0x01 },
+		{ 0x8544, 0x00 },
+		{ 0x8549, 0x00 },
+	};
+
+	int ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_rx_phy_seq,
+				     ARRAY_SIZE(lt9211c_rx_phy_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_rx_phy_reset_seq,
+				     ARRAY_SIZE(lt9211c_rx_phy_reset_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_rx_clk_sel_seq,
+				     ARRAY_SIZE(lt9211c_rx_clk_sel_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_read(ctx->regmap, 0x8180, &pval);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x8180, ((pval & 0xfc) | 0x03));
+	if (ret)
+		return ret;
+
+	ret = regmap_read(ctx->regmap, 0x8680, &pval);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x863f, (pval & 0xf8));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x863f, 0x05);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(ctx->regmap, 0x8530, &pval);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x8530, ((pval & 0xf8) | 0x11));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_rx_input_sel_seq,
+				     ARRAY_SIZE(lt9211c_rx_input_sel_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_rx_dig_seq,
+				     ARRAY_SIZE(lt9211c_rx_dig_seq));
+	if (ret)
+		return ret;
+
+	/* Give the chip time to lock onto RX stream. */
+	msleep(100);
+
+	return 0;
+}
+
+static int lt9211c_autodetect_rx(struct lt9211 *ctx,
+				 const struct drm_display_mode *mode)
+{
+	u16 width, height;
+	u8 buf[5];
+	u8 format;
+	u8 sot[8];
+	int ret;
+
+	/* Read the SOT from the chip. */
+	ret = regmap_bulk_read(ctx->regmap, 0xd088, sot, sizeof(sot));
+	if (ret)
+		return ret;
+
+	dev_dbg(ctx->dev, "Sot Num = 0x%02x, 0x%02x, 0x%02x, 0x%02x\n", sot[0],
+		sot[2], sot[4], sot[6]);
+
+	dev_dbg(ctx->dev, "Sot Data = 0x%02x, 0x%02x, 0x%02x, 0x%02x\n", sot[1],
+		sot[3], sot[5], sot[7]);
+	/* HS Settle Set */
+	if ((sot[0] > 0x10) && (sot[0] < 0x50))
+		regmap_write(ctx->regmap, 0xd002, sot[0] - 5);
+	else
+		regmap_write(ctx->regmap, 0xd002, 0x08);
+
+	/* Width/Height/Format Auto-detection */
+	ret = regmap_bulk_read(ctx->regmap, 0xd082, buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	width = (buf[0] << 8) | buf[1];
+	height = (buf[3] << 8) | buf[4];
+	format = buf[2] & 0xf;
+
+	if (format == 0x3) { /* YUV422 16bit */
+		width /= 2;
+	} else if (format == 0xa) { /* RGB888 24bit */
+		width /= 3;
+	} else {
+		dev_err(ctx->dev, "Unsupported DSI format 0x%01x\n", format);
+		return -EINVAL;
+	}
+
+	if (width != mode->hdisplay) {
+		dev_err(ctx->dev,
+			"RX: Detected DSI width (%d) does not match mode hdisplay (%d)\n",
+			width, mode->hdisplay);
+		return -EINVAL;
+	}
+
+	if (height != mode->vdisplay) {
+		dev_err(ctx->dev,
+			"RX: Detected DSI height (%d) does not match mode vdisplay (%d)\n",
+			height, mode->vdisplay);
+		return -EINVAL;
+	}
+
+	dev_dbg(ctx->dev, "RX: %dx%d format=0x%01x\n", width, height, format);
+	return 0;
+}
+
+static int lt9211c_configure_timing(struct lt9211 *ctx,
+				    const struct drm_display_mode *mode)
+{
+	const struct reg_sequence lt9211c_timing[] = {
+		{ 0xd00d, (mode->vtotal >> 8) & 0xff },
+		{ 0xd00e, mode->vtotal & 0xff },
+		{ 0xd00f, (mode->vdisplay >> 8) & 0xff },
+		{ 0xd010, mode->vdisplay & 0xff },
+		{ 0xd011, (mode->htotal >> 8) & 0xff },
+		{ 0xd012, mode->htotal & 0xff },
+		{ 0xd013, (mode->hdisplay >> 8) & 0xff },
+		{ 0xd014, mode->hdisplay & 0xff },
+		{ 0xd015, (mode->vsync_end - mode->vsync_start) & 0xff },
+		{ 0xd04c, ((mode->hsync_end - mode->hsync_start) >> 8) & 0xff },
+		{ 0xd016, (mode->hsync_end - mode->hsync_start) & 0xff },
+		{ 0xd017, ((mode->vsync_start - mode->vdisplay) >> 8) & 0xff },
+		{ 0xd018, (mode->vsync_start - mode->vdisplay) & 0xff },
+		{ 0xd019, ((mode->hsync_start - mode->hdisplay) >> 8) & 0xff },
+		{ 0xd01a, (mode->hsync_start - mode->hdisplay) & 0xff },
+	};
+
+	return regmap_multi_reg_write(ctx->regmap, lt9211c_timing,
+				      ARRAY_SIZE(lt9211c_timing));
+}
+
+static int lt9211c_configure_plls(struct lt9211 *ctx,
+				  const struct drm_display_mode *mode)
+{
+	const struct reg_sequence lt9211c_dessc_pll_reset[] = {
+		{ 0x8103, 0xfe, 2000 },
+		{ 0x8103, 0xff, 0 },
+	};
+
+	const struct reg_sequence lt9211c_pcr_cali_seq[] = {
+		{ 0xd00a, 0x5f },
+		{ 0xd01e, 0x51 },
+		{ 0xd023, 0x80 },
+		{ 0xd024, 0x70 },
+		{ 0xd025, 0x80 },
+		{ 0xd02a, 0x10 },
+		{ 0xd021, 0x4f },
+		{ 0xd022, 0xf0 },
+		{ 0xd038, 0x04 },
+		{ 0xd039, 0x08 },
+		{ 0xd03a, 0x10 },
+		{ 0xd03b, 0x20 },
+		{ 0xd03f, 0x04 },
+		{ 0xd040, 0x08 },
+		{ 0xd041, 0x10 },
+		{ 0xd042, 0x20 },
+		{ 0xd02b, 0xA0 },
+	};
+
+	const struct reg_sequence lt9211c_pcr_reset_seq[] = {
+		{ 0xd009, 0xdb },
+		{ 0xd009, 0xdf },
+		{ 0xd008, 0x80 },
+		{ 0xd008, 0x00 },
+	};
+
+	unsigned int pval;
+	int ret;
+	u8 div;
+	u32 pcr_m;
+	u32 pcr_k;
+	u32 pcr_up;
+	u32 pcr_down;
+
+	/* DeSSC PLL reference clock is 25 MHz XTal. */
+	ret = regmap_write(ctx->regmap, 0x8226, 0x20);
+	if (ret)
+		return ret;
+
+	/* Prediv = 0 */
+	ret = regmap_write(ctx->regmap, 0x8227, 0x40);
+	if (ret)
+		return ret;
+
+	if (mode->clock < 22000) {
+		ret = regmap_write(ctx->regmap, 0x822f, 0x07);
+		ret |= regmap_write(ctx->regmap, 0x822c, 0x01);
+		div = 16;
+	} else if (mode->clock < 44000) {
+		ret = regmap_write(ctx->regmap, 0x822f, 0x07);
+		div = 16;
+	} else if (mode->clock < 88000) {
+		ret = regmap_write(ctx->regmap, 0x822f, 0x06);
+		div = 8;
+	} else if (mode->clock < 176000) {
+		ret = regmap_write(ctx->regmap, 0x822f, 0x05);
+		div = 4;
+	} else {
+		ret = regmap_write(ctx->regmap, 0x822f, 0x04);
+		div = 2;
+	}
+
+	if (ret)
+		return ret;
+
+	pcr_m = (mode->clock * div) / 25;
+	pcr_k = pcr_m % 1000;
+	pcr_m /= 1000;
+
+	pcr_up = pcr_m + 1;
+	pcr_down = pcr_m - 1;
+
+	pcr_k <<= 14;
+
+	ret = regmap_write(ctx->regmap, 0xd008, 0x00);
+	if (ret < 0)
+		return ret;
+
+	/* 0xd026: pcr_m */
+	ret = regmap_write(ctx->regmap, 0xd026, (0x80 | (u8)pcr_m) & 0x7f);
+	if (ret < 0)
+		return ret;
+
+	/* 0xd027 0xd028 0xd029: pcr_k */
+	ret = regmap_write(ctx->regmap, 0xd027, (pcr_k >> 16) & 0xff);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0xd028, (pcr_k >> 8) & 0xff);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0xd029, pcr_k & 0xff);
+	if (ret < 0)
+		return ret;
+
+	/* 0xd02d: pcr_m overflow limit setting */
+	ret = regmap_write(ctx->regmap, 0xd02d, pcr_up);
+	if (ret < 0)
+		return ret;
+
+	/* 0xd031: pcr_m underflow limit setting */
+	ret = regmap_write(ctx->regmap, 0xd031, pcr_down);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_dessc_pll_reset,
+				     ARRAY_SIZE(lt9211c_dessc_pll_reset));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_pcr_cali_seq,
+				     ARRAY_SIZE(lt9211c_pcr_cali_seq));
+	if (ret)
+		return ret;
+
+	if (mode->clock < 44000) {
+		ret = regmap_write(ctx->regmap, 0xd00c, 0x60);
+		ret |= regmap_write(ctx->regmap, 0xd01b, 0x00);
+		ret |= regmap_write(ctx->regmap, 0xd01c, 0x60);
+	} else {
+		ret = regmap_write(ctx->regmap, 0xd00c, 0x40);
+		ret |= regmap_write(ctx->regmap, 0xd01b, 0x00);
+		ret |= regmap_write(ctx->regmap, 0xd01c, 0x40);
+	}
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_pcr_reset_seq,
+				     ARRAY_SIZE(lt9211c_pcr_reset_seq));
+	if (ret)
+		return ret;
+
+	/* PCR stability test takes seconds. */
+	ret = regmap_read_poll_timeout(ctx->regmap, 0xd087, pval,
+				       ((pval & 0x18) == 0x18), 20000, 3000000);
+	if (ret)
+		dev_err(ctx->dev, "PCR unstable, ret=%i\n", ret);
+
+	ret = regmap_write(ctx->regmap, 0x8180, 0x51);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x863f, 0x00);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x863f, 0x01);
+	if (ret)
+		return ret;
+
+	ret = regmap_read_poll_timeout(ctx->regmap, 0x8640, pval,
+				       ((pval & 0x01) == 0x01), 50000, 250000);
+	if (ret)
+		dev_err(ctx->dev, "Video check not stable, ret=%i\n", ret);
+
+	return ret;
+}
+
+static int lt9211c_configure_tx(struct lt9211 *ctx,
+				const struct drm_display_mode *mode)
+{
+	const struct reg_sequence lt9211c_tx_phy_off_seq[] = {
+		{ 0x8236, 0x00 },
+		{ 0x8237, 0x00 },
+		{ 0x8108, 0x6f },
+		{ 0x8103, 0xbf },
+	};
+
+	const struct reg_sequence lt9211c_tx_phy_seq[] = {
+		{ 0x8236, 0x03 },
+		{ 0x8237, 0x44 },
+		{ 0x8238, 0x14 },
+		{ 0x8239, 0x31 },
+		{ 0x823a, 0xc8 },
+		{ 0x823b, 0x00 },
+		{ 0x823c, 0x0f },
+		{ 0x8246, 0x40 },
+		{ 0x8247, 0x40 },
+		{ 0x8248, 0x40 },
+		{ 0x8249, 0x40 },
+		{ 0x824a, 0x40 },
+		{ 0x824b, 0x40 },
+		{ 0x824c, 0x40 },
+		{ 0x824d, 0x40 },
+		{ 0x824e, 0x40 },
+		{ 0x824f, 0x40 },
+		{ 0x8250, 0x40 },
+		{ 0x8251, 0x40 },
+	};
+
+	const struct reg_sequence lt9211c_tx_mltx_reset[] = {
+		{ 0x8103, 0xbf },
+		{ 0x8103, 0xff },
+	};
+
+	const struct reg_sequence lt9211c_tx_dig_seq[] = {
+		{ 0x854a, 0x01 },
+		{ 0x854b, 0x00 },
+		{ 0x854c, 0x10 },
+		{ 0x854d, 0x20 },
+		{ 0x854e, 0x50 },
+		{ 0x854f, 0x30 },
+		{ 0x8550, 0x46 },
+		{ 0x8551, 0x10 },
+		{ 0x8552, 0x20 },
+		{ 0x8553, 0x50 },
+		{ 0x8554, 0x30 },
+		{ 0x8555, 0x00 },
+		{ 0x8556, 0x20 },
+
+		{ 0x8568, 0x00 },
+		{ 0x856e, 0x10 | (ctx->de ? BIT(6) : 0) },
+		{ 0x856f, 0x81 | (ctx->jeida ? BIT(6) : 0) |
+				  (ctx->lvds_dual_link ? BIT(4) : 0) |
+				  (ctx->bpp24 ? BIT(2) : 0) },
+	};
+
+	const struct reg_sequence lt9211c_tx_ssc_seq[] = {
+		{ 0x8234, 0x00 },
+		{ 0x856e, 0x10 },
+		{ 0x8181, 0x15 },
+		{ 0x871e, 0x00 },
+		{ 0x8717, 0x02 },
+		{ 0x8718, 0x04 },
+		{ 0x8719, 0xd4 },
+		{ 0x871A, 0x00 },
+		{ 0x871B, 0x12 },
+		{ 0x871C, 0x00 },
+		{ 0x871D, 0x24 },
+		{ 0x871F, 0x1c },
+		{ 0x8720, 0x00 },
+		{ 0x8721, 0x00 },
+		{ 0x871e, 0x02 },
+	};
+
+	const struct reg_sequence lt9211c_tx_pll_reset_seq[] = {
+		{ 0x810c, 0xfe, 2000 },
+		{ 0x810c, 0xff, 0 },
+	};
+
+	const struct reg_sequence lt9211c_tx_sw_reset_seq[] = {
+		{ 0x8108, 0x6f, 2000 },
+		{ 0x8108, 0x7f, 0 },
+	};
+
+	unsigned int pval;
+	int ret;
+	u32 phy_clk;
+	u8 pixclk_div;
+	u8 pre_div;
+	u8 div_set;
+	u8 sericlk_div;
+	u8 val;
+
+	dev_info(ctx->dev,
+		 "dual_link=%d,even_odd_swap=%d,bpp24=%d,jeida=%d,de=%d\n",
+		 ctx->lvds_dual_link, ctx->lvds_dual_link_even_odd_swap,
+		 ctx->bpp24, ctx->jeida, ctx->de);
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_phy_off_seq,
+				     ARRAY_SIZE(lt9211c_tx_phy_off_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_read(ctx->regmap, 0x8530, &pval);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x8530, ((pval & 0x3f) | 0x40));
+	if (ret)
+		return ret;
+
+	/* [7]0:txpll normal work; txpll ref clk sel pix clk */
+	ret = regmap_write(ctx->regmap, 0x8230, 0x00);
+	if (ret)
+		return ret;
+
+	if (ctx->lvds_dual_link)
+		phy_clk = (u32)(mode->clock * 7 / 2);
+	else
+		phy_clk = (u32)(mode->clock * 7);
+
+	/* 0x8231: prediv sel */
+	if (mode->clock < 20000) {
+		val = 0x28;
+		pre_div = 1;
+	} else if (mode->clock < 40000) {
+		val = 0x28;
+		pre_div = 1;
+	} else if (mode->clock < 80000) {
+		val = 0x29;
+		pre_div = 2;
+	} else if (mode->clock < 160000) {
+		val = 0x2a;
+		pre_div = 4;
+	} else if (mode->clock < 320000) {
+		val = 0x2b;
+		pre_div = 8;
+	} else {
+		val = 0x2f;
+		pre_div = 16;
+	}
+	ret = regmap_write(ctx->regmap, 0x8231, val);
+	if (ret < 0)
+		return ret;
+
+	/* 0x8232: serickdiv sel */
+	if (phy_clk < 80000) {
+		val = 0x32;
+		sericlk_div = 16;
+	} else if (phy_clk < 160000) {
+		val = 0x22;
+		sericlk_div = 8;
+	} else if (phy_clk < 320000) {
+		val = 0x12;
+		sericlk_div = 4;
+	} else if (phy_clk < 640000) {
+		val = 0x02;
+		sericlk_div = 2;
+	} else {
+		val = 0x42;
+		sericlk_div = 1;
+	}
+	ret = regmap_write(ctx->regmap, 0x8232, val);
+	if (ret < 0)
+		return ret;
+
+	/* 0x8233: pix_mux sel & pix_div sel
+	 * To avoid floating point operations, The pixclk_div is enlarged by 10 times
+	 */
+	if (mode->clock > 150000) {
+		val = 0x04;
+		pixclk_div = 35;
+	} else {
+		pixclk_div =
+			(u8)((phy_clk * sericlk_div * 10) / (mode->clock * 7));
+		if (pixclk_div <= 10)
+			val = 0x00;
+		else if (pixclk_div <= 20)
+			val = 0x01;
+		else if (pixclk_div <= 40)
+			val = 0x02;
+		else
+			val = 0x03;
+	}
+	ret = regmap_write(ctx->regmap, 0x8233, val);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, 0x8234, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* 0x8235: div set */
+	div_set = (u8)(phy_clk * sericlk_div / mode->clock / pre_div);
+	ret = regmap_write(ctx->regmap, 0x8235, div_set);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_ssc_seq,
+				     ARRAY_SIZE(lt9211c_tx_ssc_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_pll_reset_seq,
+				     ARRAY_SIZE(lt9211c_tx_pll_reset_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_read_poll_timeout(ctx->regmap, 0x8739, pval, pval & 0x04,
+				       10000, 1000000);
+	if (ret) {
+		dev_err(ctx->dev, "TX PLL unstable, ret=%i\n", ret);
+		return ret;
+	}
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_phy_seq,
+				     ARRAY_SIZE(lt9211c_tx_phy_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_mltx_reset,
+				     ARRAY_SIZE(lt9211c_tx_mltx_reset));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_dig_seq,
+				     ARRAY_SIZE(lt9211c_tx_dig_seq));
+	if (ret)
+		return ret;
+
+	ret = regmap_multi_reg_write(ctx->regmap, lt9211c_tx_sw_reset_seq,
+				     ARRAY_SIZE(lt9211c_tx_sw_reset_seq));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void lt9211_delayed_work_func(struct work_struct *work)
+{
+	struct delayed_work *dw = to_delayed_work(work);
+	struct lt9211 *ctx = container_of(dw, struct lt9211, lt9211_dw);
+	int ret;
+	const struct drm_display_mode *mode = &ctx->mode;
+
+	/* For LT9211C */
+	if (ctx->chip_type != LT9211C) {
+		dev_err(ctx->dev, "LT9211: Delayed work called for non-LT9211C chip\n");
+		return;
+	}
+		ret = lt9211c_configure_rx(ctx);
+		if (ret)
+			return;
+
+		ret = lt9211c_autodetect_rx(ctx, mode);
+		if (ret)
+			return;
+
+		ret = lt9211c_configure_timing(ctx, mode);
+		if (ret)
+			return;
+
+		ret = lt9211c_configure_plls(ctx, mode);
+		if (ret)
+			return;
+
+		ret = lt9211c_configure_tx(ctx, mode);
+		if (ret)
+			return;
+
+}
+
 static const struct i2c_device_id lt9211_id[] = {
 	{ "lontium,lt9211" },
+	{ "lontium,lt9211c" },
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, lt9211_id);
 
 static const struct of_device_id lt9211_match_table[] = {
 	{ .compatible = "lontium,lt9211" },
+	{ .compatible = "lontium,lt9211c" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, lt9211_match_table);

-- 
2.34.1

