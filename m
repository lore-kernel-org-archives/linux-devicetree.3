Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772A383C9E
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028427; cv=none; b=qAQ23GHxJTtqDNAVOvDyRgb7XWWwyGVXF0kqMWpgLpO+x54sMlx8mJ7ToiMD4LR32mdDpt0+K19cqFiCe7ynoqhje49JOYBmZbmRGANhL6IBXndMbWwap/22ZEsP11D+iF8AQreMwxEPSV0Go3u2S8D6VHgNuImEa6ezyt6Cxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028427; c=relaxed/simple;
	bh=8tZscVF4LDTph0agFYVE6JixtCC92BuTMt6rtWJ2nVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hwls7yjwoS3M5GCQl2OPzLMAT8jAj5CH3S2Z/pgSYks1hoQK7Wv2+onRLRzJE6nt3kyH4tyimHR/148XhoCcEagAMfiSB8aTi2X2JRa7Jvj7kxuEQKGWgP8ED3Jx3kQPLj27lN+1ZPWbfvsXXRFp7JY0b+qGkIgf72GyHZd6dNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqV4iPUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfLK15Ng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqV4iPUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfLK15Ng"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VL0d1459470
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=; b=XqV4iPUSpsD+anTu
	IYck91RTks0ZooYyW1QSXoXMWdi4fbUD10dwLwIu54kAMFbZ0u+qlPv9tKBEAW2a
	7y9Zb7FPiKBbjCFHIPt5tDILTR5s3EuVx58iKSyy1EmEzXxFa6g8z+XTvymBcJhZ
	tlX8YSbquq2AjoWwUNSVxWYY+FAGgY/qcGOSmKWMfzuZRxYV7WPRMzdyBz2EBDdA
	2cfeR6Cej4JD6VQZ8+1x1A6nSGpGsRFunB8hAA7lJAET1mtZjgb67ZqH56Av9Syh
	ng7D7iOPglhgWNSurV5w6/FcBgkTszQa0pe9ITZ02xflLahnS/RLfDni+1bM+Njw
	87Xn/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0uum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:27:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so80213991cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028424; x=1775633224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=;
        b=YfLK15NgdhcoIfG7bwnzULsY1YHyomz0HQo/yM7bmu1g0Z3+T6qPr8sdX6nxZv54Ts
         dUBDuvBezP9WH8iikGqFEM4T+uwVgpSHdIDhSP29n55W+QZUI5GAdwXLhmh1e6t+KIif
         e+Y9DNcTgp0f6H0RXodsXgAh7kTD4VCirIxhDjMuTmlDCOJ+Sy8yHA8udLNL/b+gZ+EH
         dhTUne1g0lhVhuhqHjLLk2vV7mnwBL4vQIx9vgZriKv/Qk1NBTI1J+NdLh7yqHIq4Hz0
         pq49IvZiwIzEFFmJMYZ0yR8RMcc2F2ESjodcfgIqXVv2uw7xyFWTCeZ5L/BivzcOjRUt
         BXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028424; x=1775633224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=;
        b=I5J2qtKu9ea8OB/vxtwiO6MRkUFJ7MkjY3Nd6C+F0+cQyWiu+xbYOQ3spiY7SgHqZ8
         LzkFDA6vPXmzaV+6A2aP+t6rRiINHEeQAhpHHmZG/nLU1hD99W7Bd5GzpzwI188qH/5t
         5X9LzEFcp0OipJH6RdpWSldDjJAgpj9xRxeAg6JFoys90V90QXBF5x7KfPVpW+/yghkF
         zi+PmnXM7S3nNbN/Lg+qvwwUWPSCYB+jiVq/5SYqk4xc1ry6uZXenwWXzgqN0vXwms4o
         NgIIkvPhxKc3CI+8gYqmj5NEAaPmAt4sJCFlMMfDC6O9Oc0yofBUw18VDUkj+xqDBrxl
         wxIg==
X-Forwarded-Encrypted: i=1; AJvYcCUNWcRHZUmDMcUKHeFbs8/33qYMvy9S/XPfGUydAnzBUHSCvu6bS6HtM2K+SyPdJMYQrQyD/2Qza5vq@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfjZ2bvwq9m2NCZzkg3zUJ4MZ/RSeNmtSXCEGT8KgygRaVTRQ
	9JtNKQcbURo3G9oKGBn/WYGTfIkozKl0O3k0GG7Du8HJcEpdPS5D9lZJ9TThRHFM1X4UrRyOwSx
	gh5mKQzxsT8fM0O1U7rm+xxI+RV+UQdIvKnYqJQsmKefEbR6UovsybtRHJlGzA9q0
X-Gm-Gg: ATEYQzxjVtzS2WVS9nugzN6Cu8hKDgJbqUns7iIjqERXTfmUQ9zxtwfAz3c9Sem7XuL
	Jr5QCRVf9gTCuXvdw8Ulu46HPdgfqhBJ9PTenM46CIxW/4r82hZg1KL+D30CHJqUlt3KCe3u0fU
	WezNmV54wRb/FSMRhdA2W+atyYHqSQ7MUE8u0JfNVpbnonSMOvATneeJxFCfHrjtTBTiLyjoCmr
	M7XUNShOzcedl7IlxVbIscriOERNwMU80DW4Xo9+TcP52QCE/pbcQMz5hxZDWpA43kJuLhYhlqJ
	nPhNJxsqmXUnLBnzNnVvJlt2SfpHKgdxaj/A3eC43VdHBtzqeyAuxyNV4upq1/GabamRCNcMAw2
	jiwJL+B6TFGmWF0xFekO2OQH2qvpH90kZcMLBV3dUrjrBJqIePt6TNDpSg5pQlOr0vg5Nq63Kcv
	hwwWjtknk0sTeYciXU+KoZqHtmjb55Km3+jJI=
X-Received: by 2002:a05:622a:1f92:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d3bca3ef9mr33564841cf.44.1775028424030;
        Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1f92:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d3bca3ef9mr33564381cf.44.1775028423522;
        Wed, 01 Apr 2026 00:27:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:30 +0300
Subject: [PATCH 11/19] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-11-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8tZscVF4LDTph0agFYVE6JixtCC92BuTMt6rtWJ2nVU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aZE2ueBWfYLpmo2dTDwR3qESfD9bzvyo/9cS8Wf3qu7
 viqqntXJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYr6H/X85Z73Aa2WN3/zG
 V2VUbntaLtG5fLpR7MXSo7+eej3Js2SPDVRhnG8Uyy0kuqD99EoLpqYmkZUFnHUnVjio2XTaXWZ
 bFl6xwjGhZOutTuYbIemNTvtvFnosF+364WugcLS6bYfoxqyE1rbzHHkp8ydVsnxUVg7dtvSKVE
 9LseqhY+HiDfFB9oFP87O6I4M/XDQ+/XNb8+w717/pXvMo5DHOeD/vfdAlW7cVgUsLQtMKbbwL/
 tndm7jHzfq6W2rfqptbP2VM7ZK/pTkzvtUurUxb1yAx7OlrVqezmREBZe8nZR5/NPvgg8nbDTok
 dmzLqndyPMf3k13KNeXlP7lpd48vWlJrIBHAWWv4TDUWAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX8bZiBhLL+++c
 ab34TTxYSbIORscq3kb0BV+KRk/+kJtWBW8FCapOWsYDA4/de64gh5rYOvrdHpJ3I33ZvxU5A0q
 cbDO881jawJHdsz/fl11kG2ZdFmMI37oY2PHyk0HbphfGWvxSBVNa0uwpxojc3w6co6zi6yepHQ
 f+2GGDnB10yfr2kBdETjvAkz3bJAZWZSJmJS5lvMJH/727S/YIVn+diH64Ru398weA9+H5SYvtG
 ejTWpQE8ewHCo3s25ejJzG/f8DrLfLyWhFuQhZCpVjTVVyMoe2Gg0l8BuaWknaZkwDqwCySq5Dy
 wyEAxvURMfAZcmS4nSFtoMKxxH7LhpmQ6pdkBWcP+AxgNKEX5NNPCiwFCRPJvs2MUs6M9BHsQz9
 I0YpDX3YJNRQS0j2nXPFG/5GeA9u/jPouwlEPTsZFghm4ohMJvmngQVQqzf7MT4S7PQRPHtFstC
 qgzKHhPvgukr6X708/w==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccc8c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=51Y2UJ0wBrkUc3uRPtwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DI68uU8PHk56SM5WXgJoKrJqP8DoVwXb
X-Proofpoint-ORIG-GUID: DI68uU8PHk56SM5WXgJoKrJqP8DoVwXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Use existing helper instead of manually coding it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                    |  1 +
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 19 ++-----------------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d6863b28ddc5..ba527b4d7737 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -337,6 +337,7 @@ config DRM_PANEL_JADARD_JD9365DA_H3
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
 	help
 	  Say Y here if you want to enable support for Jadard JD9365DA-H3
 	  WXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index c33c611e03c0..1884ad2404cd 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
@@ -149,24 +150,8 @@ static int jadard_get_modes(struct drm_panel *panel,
 			    struct drm_connector *connector)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
-	const struct drm_display_mode *desc_mode = &jadard->desc->mode;
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
-	if (!mode) {
-		DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
-			      desc_mode->hdisplay, desc_mode->vdisplay,
-			      drm_mode_vrefresh(desc_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
 
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)

-- 
2.47.3

