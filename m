Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674680;
	b=y/20Ho5NH3YV4nyWaNkS1AWXBvrBTLlSFdy/BiCRQ+oVEknee5iwo2UUsqQkGer8O0ey
	 bj75ocP9UNwKViB3mFp4ZTwguEHVaqWAUvg5i8e3EOt9JKdVROX59nq4SAWPfZd5mAXDf
	 hV2hXuWx3+KOUnwaDPhqFelyHx6MQIyaQ9VV+0zdKEaSppjmFsNzNlc/59JCWNkpSbiYg
	 85kAm/HlTs5BY3nCRKH3Bdl63kxNlVD/ExyyfRZWnmk4tT6idoSBB7WZiLBb+66Mv9KxP
	 ZAwW1N/MTeWFWV504ItSih/vSzJCGmoeCTDRZ7M+iHwfMBnMc+vSPMbB8k9p7sSXstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
	b=Wk7MO391W6mEwEmSxWpMnCC3Acbk+fb9+lHz5AmpsMkm2yJvHp2fmkxcXUPD0an3XLaS
	 ykEzqiXg6uKP7eGlGyJPfdo34V3ZlXC2vMKRbZk15seRnL8rab4IzovaHEZ4V2YtNMfAe
	 u1CDjmy0E0uoCMrVevYp0ukVedgHCCBsCdDzm8qhc3owYlpCB4g5o7Cuat7RNEO5IhJ0F
	 DxeAym/ZuvCftYv0Y1Q8Ere4SQgA8P1NaRmMLglx9xzIjdlCY3vkFPR0tHzrjzRY2tjw7
	 jjKMJhq4EqL84/78DJrk1ldkqETacnKKZV4FM3PoKYd4soPAX3RpnjnUYCrozV1lEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FC6606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61FC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36MHf3022911
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=; b=dyxZAyeLoXziSVdw
	iC+yD/BhrmXWs2Mz2znH4Q01zluMofdlXIxR8MV4t018xpMrfk29vykrKGoBUbjU
	f2KKzPVfy1YMtD/4lI3s7W/3GKUckaDZl+Dsiw5IW/mHCgBUoWbCeXknA9G1vFC9
	HWk9OgkSU+uIOwInOx1JlnNfUAB7gyVKZudqR/kLVUvgnCThtMKyyuAEp1W6ayR4
	9s/3owaeohBfYuXEKomSpIGxrA8Y7UQX7IU3sB+jcmVZ1MIVA4cAFFGEjoCB/0N1
	SM6aqc8pMmSfGNsTaCSKm77cAXs9ZobXeo9LGi6jSyf1hFV9NX2Li8C15GU5TGtM
	yBSlDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatkhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04580de55so35878365ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674679; x=1796279479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=jRVuhtEewchBlGFwxGsGSfrPG1EfDyfgZ+9Qy5hkL62a2nyUFJUA0++aacHqw+iBPb
         e+h0xwhqe1s/DRYtfxVcn2Kns6qQf74ECfyR+zYrjU3mm3SUD/lkfud5ua9a9tZdz+sX
         vuwW+DcXUcsszvxom+uTmqaa2xW3QvSeLvt0gc0An5zZDQne985TcXzDdHkAS+if9X/6
         yD/ptyr35ZQrHTp0dR0dLNDTSXyrng+cvFprxl4gstW1UcpiSFT1NvGZyluUe9q30V/b
         T2YNwFjtY7CqkfrFERpIPjqn1bvxdmONncY5ktGbosX8SMzql09PxwAlfS8BPPGqzUnb
         HDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674679; x=1796279479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=BL+EdQsD7hErHM2DHcCJbmnlkKlEAwafj3xsTa4cNt8FFPaJhau0y5DlaOSdHGzqvu
         4oBcVUhXgGPRHWinxkje6QO4Q4/XD1263l/zON9xCwjP4boQ4+RX7M6S/d4j4yEWPRlk
         NxMBXy5U/gRaz8+W7V3L+uArReFYpEJ2jwPQn6P6tCiKCs0vMVl1YnA/Nfpn+Z2+EwJD
         a8LYLeaHVqwB+809dxNAXXlTbg1KrOXcNMvkTwwiNDK40HFM5y8hUUuQT6I9m2DyrfRc
         95qyw569DcslELav161+xAhkx/XS4kGGkRK7wSXeIhClMMNXSSX3S4HnbwkZRWgin4Mf
         DKQA==
X-Forwarded-Encrypted: i=1; AL+hErETQTJzhYkRTSSS+1xZ5g/s5YQzw84tvW/DBIVJujgq3UqfpzxzGIeKAnodGs7wJorwulBjNnd8UThK@vger.kernel.org
X-Gm-Message-State: APuU4Z8T5SyqEeN/+zMkvwFYPqZmFLMai2DjLK9ejmoGpiV42twd1VNj
	PPQDL60IZtyNepOVBLFda1sw4R6vPQw7T8B6yJQ+WwIiI59k4VILkNhKWXbc6BEJkRLHPiIdYzK
	angopAugLQ67WId9iLWGHkSbIcNRu4vTWrOwUHN8ATKMlkvll2RCnpWGdAteNLzmK
X-Gm-Gg: AZFdTZcfz16aT0aOVbv2UtecM0B/hQxi1SvnlvGJ4llJU7Lhhs6LG7sGvEfvmEKIuWp
	TNGzxlmcPbKPhpTelcgsv7CHY7BmadHqzbWNLxOgj2GzM7CCxhEQgpNZ4iFRy2rzEKvuvn8mEam
	nTBUbaq2L2jGWTutGa8X628TwdC++zp2fFqDl1JdY8vMZwXV8PRs8p1ij/Z/qi3gZTYFoawjcAr
	vt4ZGFsTb5g0wcmDZiCUhdexBs6I0tjwnCxF2xosW+V2OlXB8+DoUBqLBuojUtt2ipKfGKUlt+v
	Yt0KlZfK9OLc0eO3tvChj9E4gQXArJ6dVyK4kTNf5NWn6vUiyhVrAAnS34PSv1EWjHNI0jHcy0q
	9q9SnX7aRe9upUiKDT3bYDupXhApdgbOCidgSCToTcO+o+hlNPqOtQK/wwvAKfyNULO0BZ4t0FP
	WEq1jK01RT
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059585ad.35.1795674678906;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059285ad.35.1795674678428;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:21 +0530
Subject: [PATCH v3 13/21] drm/msm/dcp: Add DCP encoder
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-13-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=2743;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=PpQi3TK+4EMt9gGh4o3vbPSYlayx+DPAkJNGb6fSOT4=;
 b=rHX9dvqcJ5W/eFlpMpuncVY8cgdFvTmHcaNskFjZ1eUytMoYcapCuNhf2aQIK4txbmq7pybgW
 S5L86OZ/fOgCrflKIlH4nYxM8RLbY9i8OdHBkuuUSBl4OU4ccmJC+7Z
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX4xZlabCOBGaw
 GM3zpU/iXvtGuvt3t4FzgAAe6UHjIZ6hkmnr6LxisAKkRihyUbXA6fIBkSNjd25BU4XKgClqHe4
 tleqoomPCHUWXOCFyOgKXyxaGq9axTw=
X-Proofpoint-ORIG-GUID: L8RBgLerJMGvjsp9trbp_expHdSrM1vQ
X-Proofpoint-GUID: L8RBgLerJMGvjsp9trbp_expHdSrM1vQ
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d237 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX5TZUiu1pyXgT
 HgIU2p9SglUkqDGR79k08or29KjhBd0OA4bRnAWuAeQZmN9PaTesY/VWCmS3Loz1M6bHrfQvPvl
 SXR0NDtcG6pXRLQO58PHbGSVjUL+PShEWoRlplrx21Y7bHefXoAtmAXFbU+wbbuxKGlzWjJOMdb
 IlguPfP0+RRIOtcVpGVtp4YzL60fLWaEzbYhJjW4kINPK0vatXGkLzWrgQjr9WKvHhkjfFawBmc
 IVq+Og+1OJcfcyMybrgnldbsf13cxPVmVo7CJOkc1olU4lAu4EzPwO2sykCrn39wd7mydP1+Ek8
 br82TmCZ+BFxNl49ID30zspZcJ2L5oC9eKk8pSAtLSA8h0pPBXttXwOgw0SBzHLG01JtAchkZqn
 eQySIIllXqJ3VyQtSKCtTxUoQy1yJsOmLWCQicWeNnbTkvAoKXOvV0S1z2TZDRjdw0GKMT0DYo8
 SDnEJnvpFAVWCD9u1Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

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
index d0fbd8bdd49a..7fc4861d19df 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -82,6 +82,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_encoder.o \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
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

