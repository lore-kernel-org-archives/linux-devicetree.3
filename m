Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107D386446
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028445; cv=none; b=Fs0eybHefdC+Bx/NKhUgoVuuhXNv0McQHr9TGy+pxCXytFXyivGKDedmCerKV8BeKZlLkLgGDm9/Z75tPg2eGhHK4DRNmxAG8EIoRNak2a0A/rvDMcI9/mJbilBAZxff66aHT2QtAwZqbwKm1JjrIsRJm+Sk4SZzfZOGMmpBrhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028445; c=relaxed/simple;
	bh=r6Up/NY1fdRwk7oQTpx7zUWlF65EBySH6t0rkQuUn0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kD0H0BmM4sUCqSyTERP2ac1kJmyQBccvpXzhjJGnQM3J7fGIL5aPhneX62DeTtvJ1gzjk0aV5oOQAxreQWnxSD2bf1ViX56ugKb311r2qA/7zpNPnsQbTRIX52zu6+eyIo0N/g0MJZXAgR4li/YohAzuVVFZ87XgzSErSsd5K9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0QwnNKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeWd8fBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0QwnNKC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeWd8fBJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Ep4B4106736
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=; b=d0QwnNKC3tygGyZT
	Ny4G1ErORX4BFvbJPAlWX9OHCYvN8gJeXyeDaNQuyLV8Wpy7tRXCef28V3XZhy+q
	lBoHlaw0BrERHq6255lD6JUCU67adAwsMzaXkATK5fEelzHsoEaoR2ADMSMYTN1d
	ikEIIjN0y3vu+JTcLGTV3UQLCjfDVSq45s5SwyihlAf4zbs8tCjcibwnXpqZqmYV
	JhpUyYX4j62avROzBQl9/U9HnBmMYHETNbazesX0U64B+HFXxU/j4PnhbHnl+syF
	5erMMrNH+cOO0Wpmjd9GRStCi6qciGblhXcss8YtYaHe53t8howI7SkcDzt+kVps
	G528bQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:27:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so205153961cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028439; x=1775633239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=;
        b=FeWd8fBJaEISeXDq/iST9JyY2iOqV1wBrh/sbqjmJfqy2xxBnbDnuhi6Cp3Tl7/7oc
         BhDSTC87/qF2wyXVXPYnZCMhtUDVxmaefsRqukGf+8tujrcjuh6ITpi7v1RlII7bJCFX
         GRHNnBIbhjA65SuLAP5t3zccSqjFOQ1Qfd68wnOu32+lyF5adNxIwYln9jXbXPeLjLu4
         OPf9YWA/1B1JTIKcttYhpNjUAfpuGVSrbIo/sCv3ccOqyuRRWnG4a0KFeOn1z+4T9MM3
         lKI1OVRdfMvqEstBOt8mApwy4muysoAIeISDAxW4e4UgWPDT3ICry7K0OnZmjBpw4db0
         Gu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028439; x=1775633239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=;
        b=s4CJIp217pmqB+YdiIp69woeecocg8RqFMH4SAscBjh4oqTk1IxaWCMGes695hx4yp
         0bM8KonYuMbmIseNEP2np1oT3CG8IPuexQRUWY5r9TKbyhS9UQtKKerP7yPUtniMX1OI
         ijrx6NqOR0a9aN1H6xL9gk8avhnd/2awSEibGvM5l4Ubl8F2fgnhUEMJ9y6B3jcnJV7o
         dZKeX2P09yaaDC+VVaJ2/C5l69Jwhg4MnEXgFjMh6fLmAypoVLX9wpoQMEoerGxmkIG5
         y9qNT8FrQlLA67g1VIHg+aTbqXmUoQ6xzWYpnGOqCuGgx2JvKNlDU3KJtADvswTFV0KB
         U4bw==
X-Forwarded-Encrypted: i=1; AJvYcCW6uoPAMbjJaNDNHkr1MmnwsXD+ckzjxEXCKwcF3FGIjMPxFMPLD5BW8Gu1qc3uvp+kjccDeraojZR+@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQ6xPOT2Rno2QFzBQCu2SSqJ3xJN6wS9XP8K+cm07JnHMWvAa
	GOV9zHst8jtm+0AxjsGrkbd+5iqcN52n6GtdsL661/BQAAtzw0WgFekIuyBv6Q3lgTLHV2ZIqSV
	la0Vz+RE/QN+xqU0DA4MubRfJkWhic3caYy9u1sp36cvNbO/z3jXM7+o+uoGec6yk
X-Gm-Gg: ATEYQzwJGzBQMTMGU8BBAgM0PC8gjOKyZNEVXagU/atUYDFBu7Zvn9lr0Qp1tiCSi8L
	VckpAIEDTOGLxsfhEs7vpOCAad5IKbp0tSQ+lHlOuEveWiqZubzk2KKKN27IXenVkw0ZEFUterE
	NL6cSrKlX/5lIBBi+YARM8BUDrVj9O7YSj7YK5SaHTcxVlJOxD+z+KcVFBP4TvMyDBoGCaPzakl
	EPsYE3a63UtKqneLLmsVdbqpwcYDkDb9BNCR3hEhp6U+vrb5Eecds2W9x+OiBs2exyy62rPRjfG
	DNcaCP0ryC7WxzY5RiI5qy0ztjI2cM7DX88XIVs9uKrk40oWdIzuS7kZkabNWH3tZD7XHnMkRxy
	mO+yJyIoKdg7Tg3Kkrxn9hynG0NkskfNjt+4136keQhSlr5oWXd1c/CoNcI2SCVLLH3qO1bde6p
	jPdqYEgXSm1fkTcaldzBfeJEjFoAaga3uU0AY=
X-Received: by 2002:a05:622a:820e:b0:50b:9024:53bd with SMTP id d75a77b69052e-50d3bb640c5mr30436261cf.6.1775028439271;
        Wed, 01 Apr 2026 00:27:19 -0700 (PDT)
X-Received: by 2002:a05:622a:820e:b0:50b:9024:53bd with SMTP id d75a77b69052e-50d3bb640c5mr30434601cf.6.1775028433711;
        Wed, 01 Apr 2026 00:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:35 +0300
Subject: [PATCH 16/19] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-16-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6Up/NY1fdRwk7oQTpx7zUWlF65EBySH6t0rkQuUn0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMitpf3+wRDDqUwdCq6sQ06Hs9RSUDNOWDd7c
 a6RInGWpsSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1RLPB/9SPmUJI4j3Vi8apJINepSPxkLJCUZaw8M/0qLcE1fosjoRv/KX5ipclM7dMkeAL8dmzbz
 Ft95y84cDkD4PkITNilAdMMUADeetqfXwVy+031S+n6HHFo9dJZLUtm23DQ+X5mp8AFQx0ATK5H
 pyEpkm4rDgF2gBtYsEQ41A12x4fE84g5EMLEtKwqwVvLPs+v1ym5aaL+WNrBKW/mCuY+IntCocD
 L23AervjUQeL3hkPenYtUSYg21EQ4QB5u5kGxRHzn2iYeI4/ecAlZcKbJLQZlCt2cCaHhicS+55
 BTrnI5eUqnPV5GdNCVxIL/OHrIPk+5MWvlzhGebH4QCFPiPR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JsGjoteJTnTsjjtLoDHJZr5YidQC1wTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXzV9DTvJZLwd4
 GvVr5uaxEkBd18BCEd6ok/PuRv6GkDXdNu/bk7aaf6nFd54g+5QT8F3ZijthDIpkAoFO1HDrWyT
 XCED5vZqXrFEy8RdKhhjjfvYDpkLnHbMbTibVSbi12M41i7IdxTQpWrUvcD5aEWyzf1RPfb0t2M
 bN9kpXphB9Mh23oFxcowDx1BonbidF+u+jLk9JWXug1crqUzcj9rDxX1a68rF1wsnwqQKLqyTQq
 dZaGzSz0KhJXM694LFQk4pkN14fS0yRmwsm73iqc/cpixHblWdsxikUnZqCE4W4TyayV/I9L+Cu
 odHQhhzL5qcCf1981urHkUO7rWSZAqD7qj2q2KF8UCg+Mfv0rH8IwuFZKEzk2EYvTuXgGhbwBWn
 Uih2m9KeXMfc0G+iab06SWQEnZ3D2dzNmN2OKGZeRUVhqgeRUu/WbnJeK4UeN/lZW/3l1v4xLnm
 ad2tY0Cn75yhJJ/q44A==
X-Proofpoint-ORIG-GUID: JsGjoteJTnTsjjtLoDHJZr5YidQC1wTt
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AWYnL6P3aIH6T79I5XMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
It's not uncommon for the panel drivers to use devres functions for most
of the resources. Provide corresponding replacement for drm_panel_add().

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

