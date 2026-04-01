Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F5382F1B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028423; cv=none; b=EHAMJNRSF6awBaz4wXFDdcYltyZ4HJ1zUuR0EUFcoVcQo4mZ6fIZKIO9fAB3WcJNRH4vli+EYnKBYq3PBR3/tPSy7dN6OFXQhy/g4kB4hrguzTGzyl8VDSnr7UmT8O8iuBAyCWiT+CUy188TW8qOqd2GLxPvPWt2Wb/04st67qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028423; c=relaxed/simple;
	bh=pOgZnrXub3GS8AZAw2xe2Lzvx6vQOVPendpRdgsMBpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WX5tQPsLNakC0J3kusEOGZMpT4+cdGFgkV+S6B1agI/SHYUdInqhrvkB0GZYjDukXQkyiHcZxlZ+v2JU8Qqou4y0o7Rwe1OsID60jBK28tfa1BKVKr2bGm3zjhx35M6R8IWKDvLeM8wJGqR4uIF19XFufd49vuQY5Wo+qeGTErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/dfkyvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMm1flYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/dfkyvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMm1flYz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IxBH1005231
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=; b=Z/dfkyvr8gTlqdEK
	LqaeBk1oZg34b7VUi2n0VRf97nZ+SMyUwJC8MBNnaIeUC7EsHDKnyB8x4xLi7xVU
	cRafd+mj0jA/OmRyMQTBOL6z6Xl+9awEfnXt01OT7CtQr1XECAtpdQ38zoPrmJbQ
	OYG7QPbfTJIx21vpN0J4twIkFZBNnm8aHMoQj/fUEXwBradjmIAyoU0BVwvGmRDd
	l62YOLB6HZYxAmdoVUKWlGM/bKpsIckE+jzKZVFE5AtpNMOrvi/zHbO/Ef+hciAH
	/ZlNiAWEoPIIpX3QJzinC6t7n1wq7vTAxFsuKBirfgsT3m+7Ew45mfkGJTuzr8Y2
	/hrQ/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh345-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:27:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so80212241cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028420; x=1775633220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=;
        b=ZMm1flYzFze19wfi5E4rYYA1PJofPrglX2nnxk2W0IT1kr0QY5ffCqy8g5LvVcqD33
         pvQxqulSf51gMLb5eaRBLd966VW9Sr0LsgdiYSo2Eu/iZuC1IcXH/ZS4ODgx7KWDkdAh
         EkwxZfPc0lKLMwcvnFEvO06RXl+eZS5/rKubOFYcjtGgsw388ShEXRU9jx5B+UbELz0Z
         wh2LgTxs1tyKl0ivYphUGAsjVFzRkREaJcmSws7S6xVdxVgvk5dVozAay/PgU3MArl8X
         555wHL0XgGofqewBIZz4HQ7GpWDHS8LK+E0KEmS55NajdPhTKshdBtLmtOVldXakbKWu
         XxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028420; x=1775633220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=;
        b=OO4nDitkWyvDZ4AzZypAu57mAkVEtFok0rHIt7EfeqZKGWdqB9WIQZ58cJHg3r86D4
         enIriV28UHAE1gfHGUItLcQvfrXM8AMXVskmBLNKHPmxR5iR8288Dfu9dErXb5bj5j/r
         uPtCfH0de0yeeRyNdESUwldfuX7s8JLfopEe/fVPgVwmzPDtnw1nizmh5MB0vaGCK6E+
         YxMcIkAkL29rMllX8zTBTfS/2qt8M/07yE6/vTXJnLYnZ1i8k/EgHVAqLIK9EoLfbYd+
         udtXGjmpP1LOqPWoa0k1pyO6gpzSsVWxTGvQ9uzO99JYs3kG0AZ7HHawPQrobedx9M+5
         S9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqwAUJVj0fnYt3HZ+r1bwVf+ZOzdZpqbnCIjR6DI0jlO5m266FbtFk3ujtiXdhIzqDrC+AiRMKa8ld@vger.kernel.org
X-Gm-Message-State: AOJu0YzCANGX/L9kVhad5/qGP/HuuHDcW2L73Ozn4DCbqp5d5vY2GlTT
	A3TlNy4THHbAXfmh/vcJdS2bkOB64fLc74i2dbz5Jisu9K29Y8i2mVjriz5FTmSUNXiU0fKCaGR
	tSrXSYkdzVZlZiVtE275xqznwjaap2B6tEdIM83Jm8jX4brW3Bgf7qwzLqO2oA7S5
X-Gm-Gg: ATEYQzzv7IC348Q/Eus5/yQO5rilLDTFaDIgGqea2eFxD3uWr7JL1EUdyx/R5oot1I3
	Axd11axEBrRkJ6p6lQdcMZWL/GXUzImzdPoxaQPmnCP32pEq/NyezUbXya1K1ICjjBE/hIMUpQE
	ldFkSut5IIIZG9lZBr5enWvRlW4GilrVPQiEjvEFP0tNFSI3J+NIoLlK2pMMizvXpljPiV1KAgu
	/pEp0UjmUjdjHyBezVsfN6koVvptPHEYb7w7/ikC9NhzXfP0eI51B7kEFJZs5aB0cRL0SXZzvyD
	4q8w0jhJH+3Bb0+8mDLb9nltdzOQF8neV8umHO+ceViEpob8cQ9D9lSragvEbsuRI2eA6XKIBIh
	xCeqR6zOLWQnzPT0JEbq0wIscFG7fSmlAOLUVB1QWPeOnrrW2IQlHzsD51FfvsJPtsIaHhJ1U1q
	J2alvskxhYgWRkig9bUY7t3WJ2VRjw8p1v9lA=
X-Received: by 2002:a05:622a:1f0d:b0:50b:48a6:6b96 with SMTP id d75a77b69052e-50d3bca54a5mr36269721cf.35.1775028419728;
        Wed, 01 Apr 2026 00:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50b:48a6:6b96 with SMTP id d75a77b69052e-50d3bca54a5mr36269471cf.35.1775028419278;
        Wed, 01 Apr 2026 00:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:28 +0300
Subject: [PATCH 09/19] drm/panel: himax-hx8394: simplify hx8394_enable()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pOgZnrXub3GS8AZAw2xe2Lzvx6vQOVPendpRdgsMBpU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisQHL6qbOb5oDSQPV+YXvWKyipTd8B0Ocuk
 17HKBDfjRuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1VflCACGiFUAmeGHUxPcLUIE4mj8HiU/9RP/nPny3hspTKil+4vbxdnaL70iV5S02Kx4btVz9xj
 kSc2CXCuht6nRCvGonbIfT+msxpO3wWFuM7ddnlQKnBPDg4LEHIU7kCtiUIZwbQcHkFrz0x9A40
 cygjsanxfZAG/quPVwSweLsytvo2OTDuYIDzs//sFoLpLRg7Y8CI3I6Vyr2bAIPdprvp89Dm81A
 3h5oW/QNEPEFX4VWUUb7grbKtPzylGFf1AnLCH1WxJ64478Qq1CEAgNFpbP/KsZVvX9dLlORYYA
 RHBfXXP6q4cAygUm/lX2Qp8AqF+zoTslKi+fpcePPvQRb9U9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EmWz6TVxz02tGflzvqfrfTj_dWCoktI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX6/y6KjBDX0xA
 bQYiExfq9PgBodn2DcuJBMLvH035nQJ/AldWoXbFyFxOsaIp+A++8J3tEN41zBFPbB4xyE0roPs
 XFiW5PZuF19qdHX2CKYB2Synhq/vV/0FuraDsOH8Op7z30NGpIjXgk+ndcMDzqRBLF+OQhMxV1t
 WtpNgBvv8ew50om/BBbBbnOk1qUhBSQLAXlmKG2qLzNtSZ3/18XNTBVWnMucLIO/wielmnbaN9S
 175oRhM5TcIklr4wHdrLutHWMe7K5li8vxO0ITZ8qOKDIGm9/Rsa5mNXtgnNmsBcaq1Qm7TC0JB
 zh0sv0XM+Yno25LzR6AsrYUAk6CihwYjsSkWOLQrKunoGFQLmmboA1ANj/gz8YXTKr/U5lb6DFa
 5/Ey8cPL2ro/YjgNyhw9juSBJjXpdVd79WwQQzOXpc29FO5YXMT25mFDsu+BdCW4NrYP/qVrVs8
 0I3VBq1HeL1PRX1D4Yg==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IHUbhB35yQ0xTmbSNgsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: EmWz6TVxz02tGflzvqfrfTj_dWCoktI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Simplify hx8394_enable() function by using hx8394_disable() instead of
open-coding it and mipi_dsi_msleep() instead of manual checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 41 ++++++++++--------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d64f3521eb15..1f23c50b6661 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -618,47 +618,34 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
-static int hx8394_enable(struct drm_panel *panel)
+static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
-	int ret;
-
-	ctx->desc->init_sequence(&dsi_ctx);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
-	/* Panel is operational 120 msec after reset */
-	msleep(120);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-	if (dsi_ctx.accum_err)
-		goto sleep_in;
-
-	return 0;
-
-sleep_in:
-	ret = dsi_ctx.accum_err;
-	dsi_ctx.accum_err = 0;
 
-	/* This will probably fail, but let's try orderly power off anyway. */
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
-static int hx8394_disable(struct drm_panel *panel)
+static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
+	ctx->desc->init_sequence(&dsi_ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	/* Panel is operational 120 msec after reset */
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		hx8394_disable(panel);
 
 	return dsi_ctx.accum_err;
 }

-- 
2.47.3

