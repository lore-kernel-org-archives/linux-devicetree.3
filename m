Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390E1359A7B
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909475; cv=none; b=ezJimvTCTdu9If0W4JnnqDUDHKTzIBk05rtWscfedBHeeoFREEHH3XEBgAnMHB95awxZsWJGofZvmml6USVyAgYv+/VL09JuxyGZ857ixhcMRv9eGKClNjJKZ5kpVvzxu8bfgsioQnAra/PWCP+el7jDByHa0hraF7CYaniLLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909475; c=relaxed/simple;
	bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBgc3FN8J13NjGwRzgyikmYQNRfyTpug+akKhcT8fPjYTsu/7WqGuQ3bUcL4js7/kzpdWD3wkLPFnM/m1UHkaLSj2hHBjpSpUpLhTkZDyKTuLZTd5EYuEn83ouk78vWKlvdrt6MELNU1G7bwcxbkeJjW1q5RMsBCL34+zW3cfx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2wHr1uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpPc/b92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2wHr1uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpPc/b92"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B3xqra516238
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=; b=H2wHr1uzFarsnWbr
	RWuyKjINp0F9L7cR4wBFNkE2CKeoiid1RufURMa91EV+DmM/G+Ufoo8CPps1rINw
	T8TwWVgoU7YggNUY2pLR3L3IKyEDEnYH1SMtScZsHqlLBQ/vCjirfTwQSN2Ibr4Y
	/UjgZRvYr7XgcMcklqcvoKZ36ncDkQcFbW2y06i4nMRVhncRKjYX7+PdH+Y8xr6g
	CEplf0vl8zMr0r0gifkSZPpr7bhYNvC4eJxg9tSNKQDHA5QhlFsk7lGlom5P6YFV
	yUjAEorKZSBNx94fkNWkTyevo5DysNIJrW5rdQ4fVVxFfiblonT55kJKrAWXvBEJ
	58Hpqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgnhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso77032061cf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909472; x=1776514272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=FpPc/b92bGr17+qZYnC9ujqtTCdlmOyyDyElo9ly7D1BLPzXw9O5+kK/OLBIGpGcU6
         22NVd7PoH2nh+asv8FHW0+HAZdhIrvsxJw+7E+GfMQPT0udjyW15gZOnCkXMEvZtisNO
         Po+KOE94JB6Z73eWboMltL/O8Sd2iqOKDi7/QmA33b5A4CbCyBX583YdDp8UiJjIMK7t
         P7TVf7mxeEyM3y3iNomyKdw39POKzUPJ2QO46ijblyyVx7UvNToaCZ++tBkSQRKapMOu
         ldVa/BSfAF6y+UuMjpfc+7Tghe+XL0784WTFj73FIayFSS81EhLlDm3tGZcIolFONbxs
         qttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909472; x=1776514272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=kpX+D7I919wfBw47sCbbEX4w69CrqJxK1JoVZoxzJZWCPnqCQqKGAY5oDoxG8Pt/ol
         USa7tLtZIsjMlak9QCCyswvb1MsfE0k8njrdvt70MzGGbq3vnBnD1kG41ctAPrW6+P8b
         INkPiqkpvacy5EEjBe27GuLhTHBMrovieS/2+gFZefKbXLFw9LJwBh/Gd3gvRWi6AgJY
         8kbAaShHkTnul2YZJSjdmxrL24Og9nmCIzl4aQ99WwrrTH0007X0vzG6sXVD02/YfwwP
         f49khILoYsRNJLGbiLilpu1kZG+sVfgIDGUL//JYKquoOCa4CHZAGvUsZevpUDb9TwDN
         P02A==
X-Forwarded-Encrypted: i=1; AJvYcCWf8G2vRxrnl9eYnLKLMwJYiuR6Bm9UI0otBSTNfVIksGsrh9KwYF8+VOIZD/GA1gvfM1TNYkmDtulY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyahu42pOjeDPC83BzyJwG3uL0cPxOiilABwOYjhx2zzxCU4Wov
	UeYyE1UdsjlZeCo5Z9xKnVDkL9eNmsLCwYeMw26UUrsOyXutvIEwoUH9M/XhDHcwd8AYV6gpxN1
	UaqZts3hppcFY3M8SXXYirTi8YFvW7PD00oB/qwPhuVTs5LTC4cdVERK75raVCplb
X-Gm-Gg: AeBDiev7QpauvVJX0qMNkcmDYzawlZ1ThbvDiuTFp+g+h/5tUp3Dk6hdDWzBjwI1CZf
	nmo3AOMhAOxdidRlA9wkm5fDaVmzNu5exRzz/Wur6fYAfvBxxfx7wsRWN2mAJk424FSO5YFTb8Y
	qgRCokkPuE/M4mnmU0W8RTnIJeyk4h2eIfFg0X/pn9PY4wJpEgBCzrMOQkgN/gh3vlhZ//Xqg8s
	CcPNzXUarZF3nYZUTGybHCoSD2K4Tu7cw6rQu0AGn7G4egokgDhMR50dYsi33omEOGfMuxzMrnI
	5+5e55yal8hKv5CKkFqnL1bgXNjRxuXdJRBQpg6HHu9JOYcNfEfmurSQvCw6q1IPF86v4SOqhKe
	ipSGQn9XXvKJWPCC2KbKE3V9XFzx8bwWhiWAUoDhZtJM6PzSQKeB8fgODFlEGwRyD+XmoM1vxuO
	YhqrHvibSaDScpQejkPaLc7z7Xc0nMCDEwG2M=
X-Received: by 2002:a05:622a:2b0b:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50dd5b52faemr113980211cf.17.1775909471675;
        Sat, 11 Apr 2026 05:11:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0b:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50dd5b52faemr113979611cf.17.1775909471243;
        Sat, 11 Apr 2026 05:11:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:31 +0300
Subject: [PATCH v2 11/21] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-11-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGp8PsS/O2FCpVORjQ8wZCgOK7n8tnCfIT4
 9ECz74fMDGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1ROWCACOd00exKXMQSTte66G3uQdSbvQqD8KnyZbu+F1PqhFoHjoN/Y2KtbqtQogzyAlM1PZIfr
 sfGgRrt7l/KndKUUm37DqFEJlv9tt0v8WmdwSyxYSLq3FTb6BKGf2UGNiBvHUZQZE7yjZ8lQOLw
 IDUxvTpTPdFgORnWeqkP6LxGuzx7s62h1uxLtDdy60v5MQjR8SbTN5p1Mt6K+26KtHgoTKzsm8k
 w2PaC8gb+AN2kYeNkk3GFLky24wfNQT9WhZtU/Kx7zRIEIqL1KJwXvT/mXOwCqWSly8pxO3Cu/g
 CudT6YRygiFI24casp4MrxAZqYHa6AKL+0Fs7M9qDoyMHmeV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da3a60 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xve7C_kOZ5OF2CZn6hQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 4Bw6idnCDX6bc-K7bgHDz8zL02evwI6k
X-Proofpoint-ORIG-GUID: 4Bw6idnCDX6bc-K7bgHDz8zL02evwI6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX8LtQk/BxMUeI
 lVbKTeTJUxJGjz3AM+WnZkj8FOE6FdzKzE8gheGxQgUmSh7DrXeD/MAR+GvfI/HLN4PH/PYPJCF
 MX8SqIA+PR5NVYewNFdLbuglsbKROFQOIlE3Bn2g+BlnEHXUbsGaQUDBsKwsXje3fbXPOREkOGF
 oJRr16MD1yu3Ub0YO9iVGlDA7tkAS4Zes+Qk3hNis2OfrcIy0f19E5yM9iMGqRK3xoY3CIyXCmb
 uYseyLKOFvf6uJImNEC9EeZobvwoIIByOBXNeUyp2Djpsxxqwbqgdokr/VzOH3tE2yuywLND4yn
 uifrTRbal4Jg3r94xWFRLq3NOSEruw7/1V4k5XD3nIziabREe8oWray7H8BGZ9eOPf5xK+lVr90
 uFtlJz7tltuB+2qrzylU/1CPJDhlxhDDkh6f1YW3h16xI+N+ns1gemFqkT5AraJUVGw7yTr4zyT
 uaD5u1T78BJ+0fkO8Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102

Use existing helper instead of manually coding it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
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

