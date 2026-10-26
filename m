Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995852;
	b=n45MnNIQ5ermAQJi+/6yNplnSNrTHbssxpGdzJ1WOzGtzRteCzP+EEuWsbmennEKmb3n
	 HgYBzGQpxu/C1M8Ret57GVO74GrfIIRmKRBC4PqVnhomvVk1S9/OBITFUwdWTpFAkOOEa
	 w3ACgADXRtTuOirTv3IBguA6oM8UMQtW4F1UvfVP3+RC839tr+EONuoRybcFQy5xoLjgm
	 EZpvsrv5kuQ8LDsdLNM1HpnpmHQoIT886lyjyUbjpKoaEZukjDMhJtbN9ms/8bH/AKsEp
	 /wDVNfdYBE39zEeKJhcfxv1iBBMGPwE98/GUrafY9KB5O5u3Rk5LH3yC8TpdD1uuo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
	b=V/npIihqMkVRorOHzgb7sFi/DjSER5hE0HIeFC3bjpMYAOrul35JFTL9wnKlq5MWjTBp
	 wQc1m/ZuNQKApao61S6e22WMyPG+QE2YJpc6HGWshcl+fwinnbc/qA6gY4f/2mcfxquNR
	 05S+BrrD18GauxUvvyJFI/CeCJEHds8WM61Ly5NlEQSNeihgnUBqtpxJUx2b7m8dtPlm9
	 R+vzgjo4pzJBoVQX8dq9FG48R7PfM2eQ7eqm0XPBP4bZYcjPL7k+z8hkBJlSBBf9xnXjH
	 ekxMy14ohIiUexToBs0Fgu/xIUwRUsiOZl6idCvnATgfugktzjP+3D34Bx/guzhLB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ft8d/0/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D57606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D57606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ft8d/0/n
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPDK2222520
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=; b=A2CpUTms71nD3qMT
	L4/4i1Uxo6TbXp+ULA2JOUWJq2RPs5f7/Is5LQtEIqUBqSyJwG5yTytIEXmlYRnO
	LlnaVPZUXEekEjDBabYAdzux3qlYkdyLq0g8l1+AvZZWmFLVO21gMmpWwEoVt1qj
	YsSmT283eahVnjKt0dFeClSdA8tZQU6rF5Gn+syDn5y98A4CjtkOzmeVfWv1onop
	UWGrWmNmrL5TfcN9N6C0sVttd2bdPucg+iCOMhT3yuWDzTo6Zlq0H9peHrL+DlC8
	iPvSEXoDaHTUTjKzgijekV06B18x+lZcNECmkQ5j6TXlKExQXExoHjPWjGHppbzU
	uXYOEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8tvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so29784115ad.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995849; x=1793600649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=Ft8d/0/newVC9d89LHXpmUPlohQNak9h4/+zpkjzEOmPHPMc7ZCaPMBylqHblASNi5
         EHfoTRdFvm9RvSFQGyNEkuFq+UOn6OszCSWMTXpEIEPapVBhEhU5KKaYGCMmPMMhO6pN
         fL9kdxfvqDDz4qdmmSvE0iEjM3D0rhpxBOog5OMDdENKeAXSw+PhvSwZ/QkyqtSYmxqg
         84UccQcHaTPQ5eR88+maDpjvUCSz31QF67uHXUzKH5ZrHMonsh15QNnuzP6EksSvl3wA
         QswzmzV+6QTEDyK7N7kC91ICJUADYvMyQxeAdHUucc6TQlSUlfJy7PkVNASF5waQktl+
         E7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995849; x=1793600649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=TrytFVoOHE1qYdQ4l+uPMNev2F8CTRCgVgKzJBCcQLZcW0Xi2jFjN1ISM+o22OwF/X
         e0R/tzIj+HbDys4qgUm+CHX8/FWKWmUo3jxdQjVjjAnvcZDyLm3O05sQUeEJAbe9PHt4
         /hpK1cTpzQWdV4VcpDpaNtyDVWOy2crVavFMs+4Wpy6fz6HotkzOtYdRRcXUEn+LhWEu
         SO8l9f7LLs/20apI2wqwHufewXLKM0lnzQZ7ct6XRYOQ/Vq778LiAPh3unOtSAQh9z1C
         kSAPRLnLxWAsfzxSa75SItiJfZ62hGwhSNTyJBHf6d6Z9IiNcFYijZVZ5P9nOqv5rGki
         N9Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzggIxwG/QfURtcyAU6nnHK2Ngvyh+fWRhCWw7tyadlAJI5TL4PHba7h6p+H1kiKZIEn2Sr1uIHjVfe@vger.kernel.org
X-Gm-Message-State: AFq9FYKBzzlHphDB9P/SoaOCsA+Ma4h5yr+tETtK8WjyCiBGrAQpHjVV
	NM5Wl+7yp5kTYbZmXC2sgEYU9EPe9J0PQ5HDQb5UVNVwIqWPv2sGK/CDRbgDq0biHQ6nQ52exu2
	zQeYVoCGYWsg5kztSqJ/C7Ncb8OOH1jvsAP9akUAmo22wOj+8xyFKUDFZP995DTdZ
X-Gm-Gg: AYBFou2N8CbzrFWtooeqQrMwegdfNFk7x27TyXw3sKaNTwVJNp3gePInEAy9H3/6fHM
	8Oj6sw4qjKmOR1w8kFXDzwLgpusUnt4b5sNXWHdwr0rwOZ8q8CH2eY94Nwy7/fhaPQO1U+44hN3
	7pOKFhBgXwh6n/iptOPpuEpvChZeVC/ScFuXDdlDH+aLgolL1YaMZ6hqPgw5X1qNUysiDRQkkH0
	YBXtlvyzSFjLa7E1BnP3kvzIRIoPmGZTZqlyw7kfbd3O7D/1wkrX/3ZfHYmglmAMk9OMe6O+/5H
	m5BhmvQhnduXi8+heV9La9qrg46zxoZPMCAR56ZrW+NGYQhr70OCQvEMQnBBgt6fpSDAF1mfbpv
	OzM+hh+m/ncpY0Y3jbinrzUXblCbgCHLU2A==
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43098855ad.36.1792995849347;
        Sun, 25 Oct 2026 23:24:09 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43098645ad.36.1792995848887;
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:24 +0530
Subject: [PATCH v2 14/23] drm/msm/dcp: Add DCP encoder
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-jshekhar-dcp-hlos-v2-14-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=2736;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=13ayK5iaWertmFXymKPgINfX7fwgPHD+tgYvEDAKLs8=;
 b=zmwgbeRZoqTMrzpI8+a/t3MlIu3IDSlRDVgwwS54kYHPLh7/+sgEF+x7gACCHhdFfzZZj8Vly
 V7W/Eljs9FoDWuakAW53sDKzOr21oUkTPeVA72jFeTstFMQfl57YL2J
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: pNQioUl98uT4Tm4ZNlM-fw82-UY7OH6g
X-Proofpoint-GUID: pNQioUl98uT4Tm4ZNlM-fw82-UY7OH6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXwZDg3PkQYGOW
 qeC/qdOLK2MffvOEGfrKwzJeNVdJ7KRZslss1dX/iO+gVB1HGSNyrz0nMIO0Nock0+DCCY7gCUj
 lYTo1d0OsgnXnFe78DCmE25xyGuzuXatMR95F+9PEc37BWARieqxWaLJ8kf8MY2QQlq2VYtDZPJ
 KEvbQ4dJZrAzo11DaIkVHcllE7qcPn6ngdDiwa/O2OHaBmKE/FTT1rKfXOVZRXBWrMN5HzGxGJO
 ++dPncPOabZne75oFxKBroqFDZ/VaVZa7z2zMVq4Xt5mgUkq4lKJkGCYPmZ77pY/nAxhxmdBbRy
 i55/rWe+++JoEyDmn2ogZ63BESjRLUlyFDC2+GQNxHU4avIvVO8mvRyGNO4HpqJAOw8Ev24NiO9
 uNEVxhsTJKa7YR6KwRbBJZb+ahkhb/fSuqrrz/khPvxVRNE+qxHUOQMNRG8w0i4scWnHX8tcadJ
 ppa2MNvDtjg33iFd4EQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef20a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXws+i4hZcx6Xl
 pO4PtDIJAm0MiFNJZ8IIMrLXDNSnDEC8e8VczHdBr3SaiYUDTi3cfoU0JJj4J/mPQ0NhnhgQyct
 s0C2Oy3NO0/ofSP9VhdTFG2UIxfmb60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Create the DRM encoder required to connect a DCP CRTC to its
firmware-backed output bridge. The encoder must fit the existing MSM
DRM object model while remaining independent of bridge discovery and
KMS registration.

Implement the DCP encoder wrapper, allocation, and DRM object
initialization.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |  1 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b425fefda890..4024f6b1e3cf 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -83,6 +83,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
+	dcp/dcp_encoder.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
new file mode 100644
index 000000000000..e7a64c960bdc
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder wrapper for the CRTC-to-bridge connection.
+ * Hardware programming and mode sequencing are handled by the bridge and HFI.
+ */
+
+#include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
+
+#include "dcp_encoder.h"
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
+				dev->mode_config.num_encoder);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return encoder;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
new file mode 100644
index 000000000000..de40c9bca4bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder interface between the CRTC and bridge chain.
+ * Hardware programming is delegated to DCP firmware.
+ */
+
+#ifndef __DCP_ENCODER_H__
+#define __DCP_ENCODER_H__
+
+#include <drm/drm_encoder.h>
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
+
+#endif /* __DCP_ENCODER_H__ */

-- 
2.43.0

