Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE23DCDBE
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089184; cv=none; b=MYQfRMFzJ69fqAz99hk74ovKh5reJ0qbnrEDQxMToc+ut/ffIFfVjPUpBbd9g+qys0PfDj06jkaco6UGsSLhLeE1en38doawgspmF8OrpqDBFzwDkdJ3+o8xjPGC3IHlNBKGmtvt98VmPedQUk8GdhNFjq1lBuaFZcO7jn6Faro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089184; c=relaxed/simple;
	bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6+WRqNFIKnhjRH00cfTXbqDtaMT4Xb2yvvEcLPOikkG3l4/WCf/ciR7ppEP9GkHbMViLlINqmcf8bUurflt0LBGJNaWXlkkjrbs6nXHgKWbVy3WIUTY9k9P6Elsmyjy4t2zjQbIHEsHyZix6McRpDPabn6fMjjEySyiE+54po8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjweD+Mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxwAeoG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjweD+Mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxwAeoG0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDT5n2479858
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=; b=gjweD+MvZb4xDCac
	gVLHxNRsljPEDeeOlOG7Tu5Hv448YRH19hYYrdNm3/mQ9Lo6LvzDz9y8i6CmrdTO
	UeaF79i+hIA6WpZxen+QcE7xtA51GLZ7/6GlXb75CKbWKpyM1WkBXAJl2qbJC0iK
	TBbyEfS9RNTpsfC/84I6KXO5mWtHaZr7GCxkETrtRn3RJ/TgQHMPQ9NNEtYv6aYQ
	4BMZU25EOM8Br3NZ20CLlyn4grizBEnCJZ2H4vxeWDiyUrD5Lpb9jQ4eptbE8gIU
	XDJcO7a0GsS2ai4jUpV6e/j2vNSLbf3zFthttWRtk/sjIMENguj2CI4EQCQTg1t2
	SDL1cw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9dqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:22 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467e8ec004dso5457767b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089181; x=1776693981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=fxwAeoG07JmubUmH+alxtm3a5vr1BdoFytAN2/P1t33YWbM2G5hXxFFf4zh78k7tS9
         +tYef4uWfMrmU5Spq1QtGsPlBJghKM4Lh/Mt/N7Zn9RCb/d2Nt8cknpiy3x5MYbwIoL0
         dwe/aSaL/mMOnnN/I7M3AAlZpE01COFsQ3AH/qyH4S3u/UApgTav+mkf8xfW1aVekuDV
         hrltIMC008o/R7iTw2z68qXoIDvfpiSgmnh6kixdnElv+5GUThNWQNKDZqXo38jHKnMC
         reZU6NW0kPDstxjXrKrFJ42mGyhOdTwVmHd+oKL+zT0QJnlEzPufw644WXOdqt88NiJf
         QtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089181; x=1776693981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=W551iZ9D3dUQQiap+vplSsZitnLY8RuroW9pzUsQ/hFVz43VrCra6kU85RqrwWtgPE
         1UmMkRJRXFOCqC1nnLKWzlhukd5HYS2NXIt2G0R2cPHRWxJ2mSisMIFQViGzyo6GVj+S
         MLHGAUJWUprKQ1vszUNcT0ybTkvBYEbQcth0vxB0eF0kw/wyuIuLadECZKgA3DUps/F+
         BRV5jzftlVbbj4PEStZJjMxOwRvh+4gtzcrVxiFnKI50ozfaHhWGBoL2EpDvsN0sbNM4
         nNVKPvhOVTEqp9RjtbQr2lxUVfirvHDcPcKWu/7G6E9JfwNbPImfCaNvNSE1mAq7HNAj
         wbPg==
X-Forwarded-Encrypted: i=1; AFNElJ+qYVFLtTHs//kaozJK61IOmwPDwfTFpta3NFWjhP+IQL17DNfDqFcAb7VQ7rI71k1homsveV93w3qg@vger.kernel.org
X-Gm-Message-State: AOJu0YyH84wZGCbJUlCIGrJpU9btAkACqH0D6JsZiswYyfBSwWx/mY+w
	SOtEqKr/a+GBkixGRrb5juMObV+zYIuBIr6MTtMk7IpKhJGfkRtiQlj3sWU+9EO2ttBXFbHVllU
	ll0IWol1/2NxhbLEq4PEhfso+K0eQLq991PK7IwXTblfK4+2QXcctuCw5j4dHeAbK
X-Gm-Gg: AeBDievxjyHw7fE8VjEmqJckA79sskSQN0hX67p+gNQH5VTp2XsXmi9WFIK/PNsjVRo
	jFbsGSMLU/ir2E6DO72ix5GPSxZ6S1LbUDa+vKXRDcwY+p78tmwHbirGps+jTj2bmdnVpBDQFQU
	QSLhiPLP5Mdsy7fo3+MC4C4EXyuz9QQSBT0SPvihrG4SuOYC8QOq+e8Ph8cjRjfPyDoESFsl7DK
	jwThLveDoh+Hm4/wppEnGWXlgKNEwmZDElQy1my5S1ObjVffo2ZfCzxYMgDKzv6PHR4s5hDWoJw
	L99940YUkCs9DHaHqYQTzB+sqzgF05j4sznmj8+UiHJqC7IyzVSy6YSaV5QlQ5poZAzcyDGwUtN
	YNdq+PKH9Ul0Qb959ixxDfMibASFOUu9yzd1wyetwCqNWEKNf7jsiOQ9h249NZogWc+y0QKGmHy
	5s4OboWPRTv52dF5Sg+T37XxSnTPajWDchq2M=
X-Received: by 2002:a05:6808:6713:b0:467:4939:9666 with SMTP id 5614622812f47-4789f9ff5f1mr6710715b6e.47.1776089181423;
        Mon, 13 Apr 2026 07:06:21 -0700 (PDT)
X-Received: by 2002:a05:6808:6713:b0:467:4939:9666 with SMTP id 5614622812f47-4789f9ff5f1mr6710663b6e.47.1776089180901;
        Mon, 13 Apr 2026 07:06:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:41 +0300
Subject: [PATCH v3 18/21] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-18-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgp36dO9d8sfKpSoa2iQ31yyNO8Ctp8WrrhH
 LXL4NK7WQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KQAKCRCLPIo+Aiko
 1V0QCACnAkb/uJNfOqLJvZOMdoZDHqS3A+CKkd7WrYSl+1DpW8RrS7lFtt+GehaxZYzcW56jM5u
 BvUELCsVb4Q/AI4RdseuaZRFDN7hhZ1ZVNKsU3J4xEPBKdazX3fFFnhMjzxVfpCHYTIDFBCNoIQ
 NhFP52aq9E74NdJTipo6BVBjUGlir4QDFO6emDGGO5Kvq7ObR99dqNLfbjVApJYGhXQeDVyjhkg
 VvuYhVzBihGipeqVaknv8TNMagcu8VOCGp77OGd54TYCr3X1Pan8faJzNbk7jbNA6jvaDsQRmeE
 b0hFftgYc5yx5LWiG6lWS3gf3iQtgc8QcFSPUxb35yrLyVzJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX8msYAGjbvJMp
 tK7L59ET+Wd4Z4cyR+euQBTXBynXgO8GiFzmhAc9lZJwAk9zIC1pYFFj2rTDf2YfmCuuCASiEUh
 ejdX0kGZ7fos8e5u6jLUSXtLtdyl68SLyP3odnhjR1ZWLX5ZIj7+LpzslYU8bizeSSkK034obWa
 M/PlCUpiuvbZEOnZWhKwm55RJaPwp4A0v2cow8LaeqYDTtU3DYPkQdlgWLyd+bA48xy5fd3VR91
 E7BIeVStUeGXPaP0L8QIFf0SacW2pfkeLWBAxGHtmzQ7rnzILA6+AgGKEovUwRi444mH6+XcYNH
 CId7F4MNqvFZcbijEO09mVOHWxjk3P3F/8oTUTWmYQwIdKxi5+iU/+zKV8/rTAAyQDR3lPmWSSv
 IL3DHcQ0aYE2KQAw32hJX4H5BudmyGCWPmOJHACWepTBCv8hW8P3pTMau8T/8RDSM86r7lmHnrd
 EpbzEAKzw101N/vA5Ow==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcf85e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VYOP6asi5FRKG1UsDooA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: N3y1lQ5y_UMzHlt2yzlBcDsHPsUWtSsx
X-Proofpoint-ORIG-GUID: N3y1lQ5y_UMzHlt2yzlBcDsHPsUWtSsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
It's not uncommon for the panel drivers to use devres functions for most
of the resources. Provide corresponding replacement for drm_panel_add().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 23 +++++++++++++++++++++++
 include/drm/drm_panel.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index d1e6598ea3bc..a6029b699b73 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -101,6 +101,29 @@ void drm_panel_remove(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
+static void drm_panel_add_release(void *data)
+{
+	drm_panel_remove(data);
+}
+
+/**
+ * devm_drm_panel_add - add a panel to the global registry using devres
+ * @panel: panel to add
+ *
+ * Add a panel to the global registry so that it can be looked
+ * up by display drivers. The panel to be added must have been
+ * allocated by devm_drm_panel_alloc(). Unlike drm_panel_add() with this
+ * function there is no need to call drm_panel_remove(), it will be called
+ * automatically.
+ */
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel)
+{
+	drm_panel_add(panel);
+
+	return devm_add_action_or_reset(dev, drm_panel_add_release, panel);
+}
+EXPORT_SYMBOL(devm_drm_panel_add);
+
 /**
  * drm_panel_prepare - power on a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 2407bfa60236..1fb9148dd095 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -329,6 +329,7 @@ void drm_panel_put(struct drm_panel *panel);
 
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel);
 
 void drm_panel_prepare(struct drm_panel *panel);
 void drm_panel_unprepare(struct drm_panel *panel);

-- 
2.47.3

