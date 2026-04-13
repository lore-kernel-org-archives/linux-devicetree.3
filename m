Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003A3D810C
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089165; cv=none; b=TkewD2ZOieerHqAQp2o+rXdYnwDtbGK4vvgSx3WVWdzWuYSiE7zOZXuyrfWSeCjZJDX111Q31MQnRx5JXRSYuNHWoqFBzZryOeYSi0A84RT/+dNpkF44mf955yM+wuFPK02ZloI59oXi+/eH6CqTJ3icLGWUfzdfhfHvLtNcHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089165; c=relaxed/simple;
	bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crnFMvDFoiu6vf3j0w7QJIzlau5QdN6f9GI3MUYStwgxCW5a7T2Q+tI4p46GlXXpfLZph1Jjhjq7KNUQzqyibC213pdElASvmKQs/hD2CiFKY+B5QlLuuTooWMHGtzxLNquYsXQP/Pp2ob1wK3c7MlyYeUkp7bzluWfdq+LDeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puUlI4+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw5B0lDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puUlI4+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw5B0lDS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCX3YB297516
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=; b=puUlI4+DX4qwGTH5
	RHMURzdt0Lpv1Sw2CFZE3g9NmPvy5smxeDnIavis57cNzhPLcBPhCNYFBmHxSjAf
	3+YG+omEAAdN8ulT34BlMfVwjB0FEHrnKEueZhCKn9MZndzL0e3AyvPbzBzOegA3
	c2uDGPE7hQOk7zY8/6lOH/XzosEKupk+17cfwQtG2fDhQ1Ob4d+MO6WqVM6PfS6E
	uCgaxmH0F3JnuojDEe0aaIgWJ5i7a8EiYG4VDdgunsQerY2xC8HJcb1VdjD6/96U
	v8yC5zdiKTJUdfkIiDIVgnPWKXrfvud/u6ibuMpKd63nWau3Jy2fo1hiFfz+ka/B
	gwxsqw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0kd0bx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-475f6d0de69so6198762b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089159; x=1776693959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=bw5B0lDS1BXBBxwYOyuWXdEmuIw9PK+KhpmGZWO+8OiF8kyS0X2uh9ERt0DNPrHJXY
         MvxKKJ36IuziKX96KsOPJzEoDmBNK6a2Y+Ruq5uAJCvNvYf+D8UZvaoKa/YlaiI20ZWI
         DOs8b2kdfqWrLx4taK8cpOqEPkHDi6eUgBnivI93K7gVl9vYm44TlorPCyUyUFhiSuim
         a097GiwbBu2olo/YviRifgrO35aHAi//B8pqhGHQh4t9K+5hxgUAu3mk7zqq0vBVm50T
         g5WqlBTGcwFjDTmPHMGF5aoyXh/kA7LeZzYGVEraKlImbVRRGAmxZcMJnn/Zp21MNcap
         YBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089159; x=1776693959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=UuRWdqqHsWo6FsgZAUuzJI5nthkTGWatOA4VEELbKasfgbMlm8I77G6uYjfquiiPQz
         CuFz8Dl1MgPK7DfRONdWQLjmraPSKoLYM/XQ98EHu5uh194eOgp88lAcBcPXtM+oYV4D
         Vs5aZDoX4la04hLErBfT+OsLpXnhC2Dsx/CaFSYYOloBZu5VaDtIdbalSoLoRSt/dxO2
         XgtLbIdqcQ/k7EjrsgFPf1Co+PhpnwejpoyEG8E+RQDknqxD2T4vAIFA+nDj1A13l6k2
         YHehoQ2TbkbduBFynvvNTOOKHjaJvzSbKms1ICw9SdC6tFFy2AarM4Z0PDw6aqP4oNW2
         I5lA==
X-Forwarded-Encrypted: i=1; AFNElJ/w6p1TvBozZUTvpPa+bAMMSDfp0b2awLBvhhyGAtpjs3RD2HTFozNjFMeNzQ8vduCELM/WAqxwsBKp@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgtxK9quANxvi3ghLlkLYn+1riMur5+M1mpEZRQvGnGYvywyO
	+sinL8FshrJUnfRsFoTTmsL4a1pdJM7Q/3/zXSBeCFr9wBFVlVKXXfgthM4Hi3G1+o8obcHs76l
	WOqqTmEX8puVuIn35lIjnbmBKrlEVt5iQ+N2NQohv3OZ3xFW+hBRc4UBYvGywyAZv
X-Gm-Gg: AeBDiet1tiT3+ZwPFK7caae8saCzbt4TNrRG+87qL2Kj8TvY+pGlx3qmpGwohWydBrZ
	b3UD4yHZvV3JCqxyCFyU851ysvVEPjYelHf7sdSAHovypgSOBe7eZzfh2JdLMiIVurP8r8J9Cp5
	HohfoBaNybhZTomlAxD6CtrDTDTnpeuxZwCn09YEzn+lzy51o7Y8UNy5iglSGoXfVMucrKFaLTC
	H4HqBP7ZZlI1zGLCeHtcKCUTArbuE9b+5yp8Tk8L1GlShgQ7e6KIfo8x9Mvl18mZsp30gT3w3pv
	yNK8/jE/o23Ii54ZH7bKUsM7QyR3LAZxBcP6p0eTp69CXacLqK3HOSAkjUKVL1Y3rkgfkklQuKB
	OX7mK+ToNDvQX67Tbz08dQEh7KfZwpQPt37h2hxzB4lB6qcmXdNUFFVT1YWh4YlmBpDV7qs4Mqz
	78owsZlYsGtegZhnIvyQLFoXrxzvzyx70YKOg=
X-Received: by 2002:a05:6808:e8b:b0:467:f36d:a08a with SMTP id 5614622812f47-4789ca3af45mr6286639b6e.5.1776089158740;
        Mon, 13 Apr 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a05:6808:e8b:b0:467:f36d:a08a with SMTP id 5614622812f47-4789ca3af45mr6286600b6e.5.1776089158117;
        Mon, 13 Apr 2026 07:05:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:34 +0300
Subject: [PATCH v3 11/21] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-11-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+adH+pVL1xYlbIFuwo295yVeTVtlm5Yj1+raPRrAZF1w
 gaau890MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiEw9yMMzaLRsi+61Q0PWz
 0tkp+z5L+JnyNeosVTzJNcnfU2hFQZPp5yPlR2rrjlq/uvNfNF1089kJVr0/pskLlAu+qWHY4WN
 p+VK0V+Dyq4CiVntnoU6zhOWMpq8kmF8yHEsrOnN4trSfeuUVxvUf151LYc1aLm7SpnGZRUDElO
 Nh3IRdjee3TT34ZbPU1Fsfwo/ld6ibPuZSPRi7NHBZUWbJ5+xc/firnAbNcwN+lCW6OK/dsNmBZ
 ePh9/J7D90wD4y+ZBbD+iLKJ2vHxrvzcoNbGAN6DDJWPGLWlKzdyO58RtPz/KIVD9xeyLkZ+7Cd
 5FatTbIVZWRfnGAbu1yve/las8NHPBnc1HqnrjpleOgjAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX7/4TdQGqSGOr
 H1aTJWSHoec4HuCAMLZrgLI3wIrNaxLGUMpb1lox0cqLFx22imCDBHHBah9/NTt5pI0b9U+ikGi
 Zf3vbDw0rlo0sAl4+8IAiRchElYOJw91JbRK8Bwtnpyw/r9V9Us2YHNAbhkudjZqTgg2LMEzDry
 ee0vxAgfT+AlwECHEMLd9O+yP6LBu/kTb8HItyvporDkPPlFDLj+7QYQcagoF6LLbUEfRyAtuxj
 2PYPG2b156Y+LCAju+LcL7yA5v+rKBGm1VYpH3S6IBQEV0keWWko9QJ5tY/CceF7AyKDYlCq/+C
 FcwViTWtp1PFCi8qWkya8ecp7ZBSZ3hNgSc1LPmBHSNiiSz7pv2Q46J1c7YH+qviPKR2XuczNTR
 1PIY+Sfg6oBzDurzPjvjMNv6yZ43QHSDg/LQTB/+FP5LIc9z1jvE+2KIjhkvt0KflHAB+xEChIL
 +6CicFQS85AHfI3z/MA==
X-Proofpoint-GUID: z402YYK06q3-LZIadJpSs2owFFOFcTFW
X-Authority-Analysis: v=2.4 cv=D7x37PRj c=1 sm=1 tr=0 ts=69dcf847 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xve7C_kOZ5OF2CZn6hQA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: z402YYK06q3-LZIadJpSs2owFFOFcTFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

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

