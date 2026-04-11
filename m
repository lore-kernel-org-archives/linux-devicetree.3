Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6993603C9
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909491; cv=none; b=axB9qjUqIfdmbgYt4BKAkdUwVKNgmN6IyZ0TVlU8VUsKwoR7uCziEMJnE7udbV/otoYC7xs87wd94QblHA28wSCKzwRIX5UMlLrP8ocgPrGBrLODoU6SmG6G0JyD+QYfjRxEkSW7uGWBFIRxrgxsl1DBoNiNV1Q7NluJsy6ALDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909491; c=relaxed/simple;
	bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT3H+lxFI4NVYTypyRVbQ8N94uSCmWDeBH6K8SOhpRxkvww/yP0PToTnfGRd4LcHajkLGVJFIHh1SigJj3oBPRhO5JUqctyGfRIvLvFuuFKLMmiPT2x5kOp7Qi2/JllqWgYrsKjowZjFVAHaN10zod3ub9e0kXny2lBtTEtU15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vs9pX17r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V47bSwwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vs9pX17r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V47bSwwl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4Tvki3679650
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=; b=Vs9pX17rEvZCJU/5
	oR/lUvbWwG3vzUYIVLFj4RIdRazZfdYBaVQCmITh9XgDOzbRzUVvuZtrB8jtqYcy
	0CzUo0fACwCigiJSH5UqZ6nnHsWtWlAxNS8/97UN+cDidJ2ljJYwEHa3ZSYKKM+n
	1sztsrYOYEKK4en7P0t1ZMwsPyxL4j6bZXnl1dP4BIyhQRgwFSwZs1PrxAP22BUM
	+b9clcSAIU7kwKsoOrgok1WUFABxGlI0l8Jf9p/p7YxwntQT9DRbYCxRsjtgOY4U
	IblltI34k5Sk3XRnPSxYYY2cINCTVwaAj0SsUIdxA1xLtR4qurOAgiGKiZxZcNHv
	X9bOPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0gkwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4031b86dso77812881cf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909488; x=1776514288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=V47bSwwlmal/1g+ndili7Z0kaSKMLbMxtnU/Rb4Csz/823/zCY27gh8uNc46haMK/p
         t47IxFqS7b44XauA0E/2DXh9+CpKZf4mWk5m1roDU4kGj/OFYGZnlVsxunhpoXjBOt5w
         +mwHkTknoYBjbmORSRXOmpsRIo5++IiOVKeUfqTIYSID24mh9Gi1H4h+eAWy4iJCQuLr
         vyk9auU8hzv/MwBJIn4iVdwCyJoWyw/8EomH/cDeJLhOI2Aw54moZu8iv77rCeI/XaNS
         VAnl+QMtTk9QI6fcj5PcUBgcMrOIqXj1N13WAjul033FRGRyVtXcSIcByN+JHx7rjSUb
         QPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909488; x=1776514288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=C10rehi2rMG8C+HWrxMIY0pmD+mD9PENgTHJlP9iRvCjgqxMnMAL3tBUs6ANV0OVT0
         UJRnKE3P6TzpaQ6Z4IbKjfqPZdnEDZMovf+gP+tpQTBQUdiHY5O2L5RozjvO0c3i7/yP
         qLbqhb5oH1K/IjGBvGtZP4urR46dKBUBfCgQ1LFblmPnahQLXo1q+0MuWj/WqrXoIWUS
         Sc5et2ZqUN53FjdwY+nO0m+Dw0tcsL/isyFPVCGZC4dhZFaQY3YhQN2ffvdePaGW07Vo
         VKcx1nGr0PUGex+pblIXXBqsLnbzv52wRrUhT7CYMkbuc/JaJG3CWmDKxbeDE4d8Mb/0
         DZxA==
X-Forwarded-Encrypted: i=1; AJvYcCUzCtQ/T5lOTo7pBryDBJoDeUXqaLlwyAMBmeuVYiFB5CNScSNcfEQR3pn/SikpaBxhNfHtptS3xq1L@vger.kernel.org
X-Gm-Message-State: AOJu0YxBG61TTdrFKCxVqg6xdNzl09X3xsdFpGjm1QkEzRRCfZyYIVrJ
	ISCO4aODCFHTOYeXEoJMij+1Iq4wG2w1Da3TTdzskpeXmbSgIqWMNzv7dasNwJD8boTQMnLL+dj
	v53NSfCBo/0t0B2ADv7sEwSL3X/hfPwHE9FzUpel/DKvlCaIgMJiLFYnT0bPJulokiwJHDE9O
X-Gm-Gg: AeBDietztfbGDKwipxyPEt90MAgVUyK43pyRHKdmpjPxWLWR4Y2KgQlTfqoww6WK4jY
	ZxVexoPKkFi7EmnD9CsignGbryfZXnwUS2Txml9cmTAnithmfLKHSa85t4AsUGMFCQ442Yc6azn
	Ad1eF/XEf1Yk8/f4QBh+WexBKQVd6jyReX6zk0mldg5Wnsb1B97KOEslIV/5uDcSL7REmpIWEfm
	CDBEOd6yti36Zi99YPu8NiluSaBZzj2jGeTQNfAobZltPfnejRDGZKQCYqhwOd0WkG/JF+J7lCb
	drExVMVpWeKXKwagoy7RUti9jpeDpBGJb+rpaTLne96bNXdsE+Sr/t3dNvEPM7j/t+RL5AXC/SJ
	SWbu63U7eVvzaoUIOuBdum81yR+FkEDhYATgDux7Lal8+JgmJzVC+IXgy6Aeati9aTKTmerrBbu
	t20EC7FchJl23oXl3L0AneygS4S4bXjeQjNfw=
X-Received: by 2002:a05:622a:a548:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50dd5b7c79fmr77592621cf.31.1775909487814;
        Sat, 11 Apr 2026 05:11:27 -0700 (PDT)
X-Received: by 2002:a05:622a:a548:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50dd5b7c79fmr77592201cf.31.1775909487381;
        Sat, 11 Apr 2026 05:11:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:38 +0300
Subject: [PATCH v2 18/21] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-18-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpHm6fYy9faeKzAMPgr6LGW7nVgHcX8hKrg+
 qopFVe49u6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RwAKCRCLPIo+Aiko
 1RooCACTizZflR7WKB6rcWXc9mVqam8f3y7ZEymyQjkmYT0Fq5EoVed/5U/A/eHZbscogqTiZHo
 31eHxncXOZIKlam+Rv8DV3lvfmC1W0NvHM+NKkJrxtKTV/MF8b0eO2A1uHFp1ys+EDjst6dPB6R
 Ny1kZAL7tOKNTUiHzdl2K954tffQj8KMkM02GaQSYuZ+RKoakeIaPDDg3cOh5gJxi4HdQos4Dtt
 SMUa0tZ7SBIcvkji9Xckd8bWlaMtm1YQE06k7qPvyWJGsK3i/0wBY+Z57Yz9bjKZfXh/hVdUGM0
 iY1IpWo+PdeQ+t27iZqaqWDgaDYRSZKqbP0s9N/dvJIgjK4K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69da3a71 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VYOP6asi5FRKG1UsDooA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX0jzyO/s9rwWL
 UbYAhmFBJdfFWQhlKfUtCs0Yr7BDFZxRcZtRt+jDVxa7n/ltsnIy7D9GzHzIWN9uQ8mRFcEKyZr
 pavFFJ4KZtPiAbGpbVb4ztkNqCvh/+AEJmBpMoZkmWWdUgyYvnwnc3l656YBFuMTXjGOQoV5mpV
 w/qZQNyYjLPX+Akvk5WgDTOLq0jvO70xd0TGA2K08tiZng9RrNbD71n3PhT/9qwHnVUriwtT7jG
 hwTnoSkTt59jM0GLLyaN6ZN/l+6guTFpM3Gxemkil0Uxipbur6pufDw6A66d00slvDhn8Y/3dun
 g+cGNA1wKX8a5vX49g2YpWbQwFVZ48Xk9HlH8PGS99WSwukmZz+6GIWAyYb+hU5mEqIy1ScJTwI
 kpYRpWuXnHNeOxNH1Ycu+t818JsjtMXGC2Ak2nzhs5rpLEDtplRjoVqr9zCvFddT2aY7vzkmw62
 haXhvnFQ2PTr/+7sDYw==
X-Proofpoint-ORIG-GUID: nXPq9Z6CYTanxgbGhAqDRwpjqHcB1E7A
X-Proofpoint-GUID: nXPq9Z6CYTanxgbGhAqDRwpjqHcB1E7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

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

