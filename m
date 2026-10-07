Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB63C0A04
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363674; cv=none; b=dJaBwuQUKoc5grL3hlwEF9So0rBIZ3fvzc0HwASvvAPtcCfD9pZ+a/TtZx0Lm0iKtTPccaC0vPHhplSIy2NehY3sVcT7+ofAbQiXrg2L1NjjrLj3Vr2M0cpDbS3Ygl5y8L3W+bkTz4HEBfaRAl9em9FTnDyxGVTTWgLj5xu2QbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363674; c=relaxed/simple;
	bh=wwNdqBKydV3sKNndIKMDb0duUxJePVVmM/leJ1sDREA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qw0G4ipOQZd67U5lcjw10wdu03R+EDPVcJXi2XbjCa2lRLiYp7jF+Flnm/0QSWTk/y3GeQvzG6TgUF31vbEzfVEafx8RGsyScXPNnXQaiNH0Leq8ZmRmKYvQua42kYbU2gCFvOjL3TU/eEKPAxu9DPN43YG9uQsJJOgWbUbcDzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3j3cCeq reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3j3cCeq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jtIY2312965
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cU6cB7tSn1l
	wlOWS7+RD0zc037o+olQbgRawKxC//3Y=; b=A3j3cCeqGrP19piBdMyWgCP/VZg
	5lUsaSREZEQJ4pVbfEmWdYkN2tCD+8X8+MSG+msf0GoiNSpSm8S+jsFSMZK3Mitr
	j24YHA5ARBWN0xbT77aIlncN9GexcGDj/dU5fZIAXVMfHtGMrhuRg1RmAleaMVrC
	yax9NWrLdj5yaT6iHmNxXRYEvUwzMESmwEepzwBYF5U+Fgr3Z723BF34Q+2WyJgN
	ZY6m17S/JJ4mdrRvKfstusEKC5V5TWi787TckDM0rMzSfTPBg/dC+5rdrbttU4qD
	35hmAON970b7qf4KkWLMOAqLF/pmgJy4oRXHCbLz84QSLvtc1a2BWLwgnsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askna6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso586213985a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363664; x=1791968464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cU6cB7tSn1lwlOWS7+RD0zc037o+olQbgRawKxC//3Y=;
        b=EGcg2+cOEQikDSRWC//YvNRb4bkgTDA8fGKBFSmbcQM1rvnfo9+PWd7Qzdqb8JdN4T
         qMK/5SkhvsEBHxs2fS0TOrEKnPGd66QYaKWxkmSxbE6ESFUo2QPownVmfBlXfQtiEKe5
         tujREX4zqCaFUQOPxvPjD85F71x/FGcUR/1ZGnyZpZQKxHUULwXGQ9QsPWBOdCBlF9eS
         9Mv+9INCu3wcfvUkwxZef1RRsDlZ6BdAMoK20DfvTwfueTGCBWjvUWyKfogwJ6Sxr53g
         jlDoz5yOxJyRqmjtNmX12e7hULiwm4Cx8K+BCO5+PnYLfNZlJgk/vZi5R0MeMDd07Aes
         Dquw==
X-Forwarded-Encrypted: i=1; AKwUvBzRKWHn/GbghWV6w92SgEapauajRLYspLjMLU3KDObStbYeSNs7hsYwfSvuFcCFV1OQXtd4G6i9iqDx@vger.kernel.org
X-Gm-Message-State: AFuF++lumom6g/oCPvvVgcMLM5MFgQGl35tDQCydQvjCNgwc2EaMJuUu
	vvL2Oah9lQjNBiAgjOXtqQ+gjrSA5Ss3QLj4OqaVh70JQXyMeDAQsibXcoBkDZvoi0KNEMmFhYy
	f6NJszD5Au8FNhwZV/DBjC43kD2SWEmSCbx3HM8WZgPs8DtqPp2v5yFJMtCEwaNIL
X-Gm-Gg: AYBFou0RSY+2nu0eyujcc8WTP/KRxvpO5nYv5C9iraF7LPQkH5awnAzh/3fQmRKtZNm
	eACcSDEF4IZ5gaVC1S7GrCvOnc05h4e1xGJCvV0OcfWbmFcmmW/0vkpSe+KHGuf/Ad4PSrtMsCq
	KddQpSGcrGHvOOrgzM5jAhV5HVPpy7D3YdRdVr0X0HCEZzCEDTk+upHz/re9mKebNJbaM6SxSBW
	aPEEGF/gZRYL4ffw8AeDVI6Mgv7soXKjw/lMNCKEzAIfA0VOUlxQNbcGLW8EN1u44l2FAEdw0Yk
	1CBbGtI1eiZE1+uvBGXFm3cR38LLv3xfvgcANnzA/29QZ2tSygoHbHcXZRM=
X-Received: by 2002:a05:620a:444b:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93e86055e46mr1042312085a.17.1791363663637;
        Wed, 07 Oct 2026 02:01:03 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93e86055e46mr1042305785a.17.1791363663083;
        Wed, 07 Oct 2026 02:01:03 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:02 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 04/45] media: qcom: camss: add IFE subdevice interface
Date: Wed,  7 Oct 2026 12:00:00 +0300
Message-Id: <20261007090041.3732717-5-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YkaSX6BqiIQ4c8bU9iobxsDd7uV4EK_D
X-Proofpoint-GUID: YkaSX6BqiIQ4c8bU9iobxsDd7uV4EK_D
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60a50 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=95Q6_5sKJtTNXQvUJdsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7x9RCvXZabD9
 xQpj+v3L/YiWsrg8UMsoF9zSDBcq1DHBqRPnKq/60r/c8i0zF3AdBZVyvq5aNPzp/11Nf9QZpT5
 z9aoiEp51mr2LUUEkM1zFHJfR3BFdIzsnKafhl8b6HwNVh6rTlELsNrvMGolOwVo0PpHrL2tVLJ
 SJ5/blrloo5f6Xtgl5s2OLCaKyYE+Zn/84R/ZKSF4t4a1TJTDUqSkY8ide8U9twuWXTxmK5G++E
 TC7+W2jZb06P8x3+6t7SD45famIfw2IhXXroWrBvJ4zROE5lAkExxjD25XLurvoCKu6PHTPHmKG
 6Y7lTLmYN/1J4A2pzeeSoqP/UWVWjrplX3kEshdHmm+OT76KT9gKItlUfRDCpJrNEkWq2BP9PuE
 Y78Q4CW25fN5KQTipB2IUOgyESdS17VBUKC074EAZjfHeNGsyQaOLxXPERfy3+Ge8/IMuksSV2v
 QhTmLXuBPR24WgW2CFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX83NIutKjqQem
 0YzWnLpVb0bUfsnvWj1WLRVmGp4vTE4UX5EbDpofq7dcZc5OsCnl6q+5hksIv18ZfEl4P1E+Tnx
 VSWU6WDPlTLrFKVDVRr8mA3lC7aCnFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the common IFE types and hardware operation interfaces. Later
patches use them to add the IFE engines and subdevice.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.h | 392 ++++++++++++++++++
 1 file changed, 392 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife.h

diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
new file mode 100644
index 000000000000..39e8cfa74909
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -0,0 +1,392 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#ifndef CAMSS_IFE_SUB_DEV_H
+#define CAMSS_IFE_SUB_DEV_H
+
+#include <media/v4l2-isp.h>
+#include <media/v4l2-subdev.h>
+
+#include "camss-format.h"
+#include "camss-video.h"
+
+#define IFE_CAMIF_HW_PIPES_MAX	6
+
+/* IFE irq 0 status flags */
+#define IFE_HW_TOP_IRQ0_RST_DONE	BIT(0)
+#define IFE_HW_TOP_IRQ0_BUSWR		BIT(1)
+
+/* IFE top */
+#define IFE_HW_TOP_IRQ1_RDI0_SOF	BIT(0)
+#define IFE_HW_TOP_IRQ1_RDI0_EPOCH0	BIT(1)
+#define IFE_HW_TOP_IRQ1_RDI0_EPOCH1	BIT(2)
+#define IFE_HW_TOP_IRQ1_RDI1_SOF	BIT(3)
+#define IFE_HW_TOP_IRQ1_RDI1_EPOCH0	BIT(4)
+#define IFE_HW_TOP_IRQ1_RDI1_EPOCH1	BIT(5)
+#define IFE_HW_TOP_IRQ1_RDI2_SOF	BIT(6)
+#define IFE_HW_TOP_IRQ1_RDI2_EPOCH0	BIT(7)
+#define IFE_HW_TOP_IRQ1_RDI2_EPOCH1	BIT(8)
+#define IFE_HW_TOP_IRQ1_RDI3_SOF	BIT(9)
+#define IFE_HW_TOP_IRQ1_PP_SOF		BIT(12)
+#define IFE_HW_TOP_IRQ1_PP_EPOCH0	BIT(13)
+#define IFE_HW_TOP_IRQ1_PP_EPOCH1	BIT(14)
+
+#define BUSWR_CLIENT_CFG_MODE_LINE_BASED	0
+#define BUSWR_CLIENT_CFG_MODE_FRAME_BASED	1
+
+enum camss_ife_output {
+	CAMSS_IFE_OUTPUT_INVALID,
+	CAMSS_IFE_OUTPUT_RDI0,
+	CAMSS_IFE_OUTPUT_RDI1,
+	CAMSS_IFE_OUTPUT_RDI2,
+	CAMSS_IFE_OUTPUT_RDI3,
+	CAMSS_IFE_OUTPUT_VID_FULL,
+	CAMSS_IFE_OUTPUT_DISP_FULL,
+	CAMSS_IFE_OUTPUT_FD,
+};
+
+enum camss_ife_hw_pipe {
+	CAMSS_IFE_HW_PIPE_RDI0,
+	CAMSS_IFE_HW_PIPE_RDI1,
+	CAMSS_IFE_HW_PIPE_RDI2,
+	CAMSS_IFE_HW_PIPE_RDI3,
+	CAMSS_IFE_HW_PIPE_PP,
+	CAMSS_IFE_HW_PIPE_INVALID,
+};
+
+enum ife_hw_planes {
+	Y_PLANE = 0,
+	C_PLANE,
+	IFE_HW_PLANES
+};
+
+enum ife_top_status {
+	IFE_TOP_STATUS_ID0,
+	IFE_TOP_STATUS_ID1,
+	IFE_TOP_STATUS_ID2,
+	IFE_TOP_STATUS_MAX,
+};
+
+struct camss_hw_version {
+	union {
+		u32 hw_version;
+		struct {
+			u32 major:  4;
+			u32 minor: 12;
+			u32 steps: 16;
+		} ids;
+	};
+};
+
+struct camss_ife_wm_config {
+	u32 wm_id;
+	u32 width;
+	u32 height;
+	u32 bytes;
+	u32 stride;
+	u32 lines;
+	u32 mode_config;
+	u32 packing_fmt;
+};
+
+struct camss_ife_pipeline_cfg {
+	u32 in_code;
+	u32 in_width;
+	u32 in_height;
+	struct v4l2_rect *ds_mn_crop;
+};
+
+struct camss;
+struct camss_subdev_resources;
+struct ife_device;
+struct ife_pad_desc;
+struct ife_top_ctx;
+struct ife_pp_ctx;
+struct vb2_buffer;
+struct ife_buswr_ctx;
+
+/**
+ * struct ife_hw_camif_ops - CAMIF hardware ops interface.
+ *
+ * Abstracts the CAMIF config/enable/disable operations so that
+ * top-level controllers are not coupled to a specific CAMIF IP version.
+ *
+ * @config:  Program CAMIF registers for the given pipe and pipeline config.
+ * @enable:  Enable the CAMIF output for the given pipe.
+ * @disable: Disable the CAMIF output for the given pipe.
+ */
+struct ife_hw_camif_ops {
+	int  (*config)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe,
+		       const struct camss_ife_pipeline_cfg *cfg);
+	void (*enable)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe);
+	void (*disable)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe);
+};
+
+struct ife_hw_top_ops {
+	int	(*acquire)(struct ife_device *ife, void __iomem *base,
+			   void __iomem *csid_base);
+	void	(*release)(struct ife_top_ctx *ctx);
+
+	u32	(*version)(struct ife_top_ctx *ctx);
+	void	(*prepare)(struct ife_top_ctx *ctx);
+	void	(*enable)(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe);
+	void	(*disable)(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe);
+
+	int	(*pipe_config)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc,
+			       const struct camss_ife_pipeline_cfg *pipeline_cfg,
+			       const struct camss_ife_wm_config *wm_cfg);
+	int	(*pipe_enable)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc);
+	int	(*pipe_disable)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc);
+
+	void	(*reg_update)(struct ife_top_ctx *ctx, const struct ife_pad_desc *dsc);
+	void	(*reset)(struct ife_top_ctx *ctx);
+	void	(*irq_status)(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX]);
+};
+
+struct ife_hw_buswr_ops {
+	void	(*acquire)(struct ife_device *ife, void __iomem *base);
+	void	(*release)(struct ife_buswr_ctx *ctx);
+	void	(*irq_enable)(struct ife_buswr_ctx *ctx);
+	void	(*irq_disable)(struct ife_buswr_ctx *ctx);
+	void	(*wm_config)(struct ife_buswr_ctx *ctx, const u8 wm,
+			     const struct camss_ife_wm_config *cfg);
+	void	(*wm_enable)(struct ife_buswr_ctx *ctx, u8 wm);
+	void	(*wm_disable)(struct ife_buswr_ctx *ctx, u8 wm);
+	void	(*queue_buf)(struct ife_buswr_ctx *ctx, const u8 num_wms,
+			     const u8 *wm, dma_addr_t *addr);
+	u32	(*consumed_addr)(struct ife_buswr_ctx *ctx, u8 wm);
+	u32	(*irq_status)(struct ife_buswr_ctx *ctx);
+	bool	(*is_fifo_full)(struct ife_buswr_ctx *ctx, u8 wm);
+};
+
+/**
+ * struct camss_pp_cfg - PP module pipeline configuration.
+ *
+ * @width:   Input frame width in pixels.
+ * @height:  Input frame height in pixels.
+ * @in_code: Input media bus format code (MEDIA_BUS_FMT_*).
+ */
+struct camss_pp_cfg {
+	u32 width;
+	u32 height;
+	u32 in_code;
+};
+
+/**
+ * struct camss_mod_ops - PP module ops interface.
+ *
+ * Engine-agnostic ops for configuring, enabling and disabling a set of
+ * post-processing hardware modules.  The concrete implementation is
+ * provided by the IP-specific backend (e.g. pp_v10x_modules_ops).
+ *
+ * @acquire:      Initialise the context; store @base in @ctx.
+ * @release:      Release the context.
+ * @config:       Program module registers with default values derived from @cfg.
+ *                Called once per stream start before @enable.
+ * @enable:       Enable all modules managed by this backend.
+ * @disable:      Disable all modules managed by this backend.
+ * @apply_params: Apply per-frame IFE module parameters (optional).
+ */
+struct camss_mod_ops {
+	void (*acquire)(struct ife_device *ife, struct ife_pp_ctx *ctx, void __iomem *base);
+	void (*release)(struct ife_pp_ctx *ctx);
+	void (*config)(struct ife_pp_ctx *ctx, const struct camss_pp_cfg *cfg);
+	void (*enable)(struct ife_pp_ctx *ctx);
+	void (*disable)(struct ife_pp_ctx *ctx);
+	int  (*apply_params)(struct ife_pp_ctx *ctx, struct vb2_buffer *vb);
+};
+
+/**
+ * struct ife_top_ctx - runtime context for the IFE top controller.
+ *
+ * Holds the hardware base address and the CAMIF ops pointer so that
+ * top-level pipe functions do not need to receive them as arguments.
+ * Initialised once at device probe via ife_hw_top_ops::acquire().
+ *
+ * @base:      MMIO base of the IFE top register block.
+ * @camif_ops: CAMIF hardware ops bound to this IFE hardware block.
+ * @dev:       Device used for diagnostic messages.
+ */
+struct ife_top_ctx {
+	void __iomem                  *base;
+	void __iomem                  *csid_base;
+	void __iomem                  *rdi_base;
+	void __iomem                  *pp_base;
+	const struct ife_hw_camif_ops *camif_ops;
+	struct device                 *dev;
+};
+
+/**
+ * struct ife_buswr_ctx - runtime context for the IFE BUS write engine.
+ *
+ * Holds the hardware base address so that BUS write ops do not need to
+ * receive it as an argument on every call.
+ * Initialised once at device probe via ife_hw_buswr_ops::acquire().
+ *
+ * @base: MMIO base of the IFE BUS write register block.
+ * @dev:  Device used for diagnostics.
+ */
+struct ife_buswr_ctx {
+	void __iomem  *base;
+	struct device *dev;
+};
+
+/**
+ * struct ife_pp_ctx - runtime context for the IFE post-processing engine.
+ *
+ * Holds the hardware base address so that PP ops do not need to receive
+ * it as an argument on every call.
+ * Initialised once at device probe via camss_mod_ops::acquire().
+ * @in_width/@in_height are latched from struct camss_pp_cfg on
+ * camss_mod_ops::config() and reused by apply_params() for modules (e.g.
+ * LSC) whose per-frame register values depend on the input frame size.
+ *
+ * @base:          MMIO base of the IFE PP register block.
+ * @in_width:      Input frame width in pixels, latched from the last @config call.
+ * @in_height:     Input frame height in pixels, latched from the last @config call.
+ * @dev:           Device used for allocating @params_scratch and diagnostics.
+ * @params_scratch: Scratch buffer used to validate/stage an apply_params() buffer.
+ */
+struct ife_pp_ctx {
+	void __iomem *base;
+	u32 in_width;
+	u32 in_height;
+	struct device *dev;
+	struct v4l2_isp_params_buffer *params_scratch;
+};
+
+struct ife_pad_limits {
+	u32 min_width;
+	u32 min_height;
+	u32 max_width;
+	u32 max_height;
+	u32 max_h_ratio;
+	u32 max_v_ratio;
+};
+
+struct ife_pad_desc {
+	u16 pad_flags;
+	struct camss_formats sup_fmts;
+	const struct ife_pad_limits *limits;
+
+	const char *video_name;
+	u32 link_flags;
+
+	enum v4l2_buf_type buf_type;
+	enum camss_ife_output output;
+	u32 hw_pipe;
+
+	u8 packing_fmt;
+	u8 mode_config;
+
+	u32 rup_group_mask;
+	u32 comp_group_mask;
+
+	u8 num_wms;
+	u8 wm[IFE_HW_PLANES];
+};
+
+struct ife_pads_descriptors {
+	unsigned int num_desc;
+	const struct ife_pad_desc *desc;
+};
+
+enum ife_subdev_type {
+	CAMSS_IFE_SUBDEV_TYPE_IFE = 0,
+	CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+};
+
+struct camss_ife_stream {
+	u32 id;
+	enum camss_ife_hw_pipe pipe;
+};
+
+struct ife_subdev_resources {
+	enum ife_subdev_type type;
+	const struct ife_hw_top_ops	*top_ops;
+	const struct ife_hw_camif_ops	*camif_ops;
+	const struct camss_mod_ops	*mod_ops;
+	const struct ife_hw_buswr_ops	*buswr_ops;
+	const struct ife_pads_descriptors *pads;
+
+	unsigned int num_sink_streams;
+	const struct camss_ife_stream *sink_streams;
+};
+
+struct ife_video_pad {
+	struct ife_device *ife;
+	u32 pad_index;
+
+	struct camss_video video;
+	bool streaming;
+
+	struct list_head pending_bufs;
+	struct list_head processing_bufs;
+};
+
+struct ife_subdev_pads {
+	const struct ife_pad_desc *desc;
+	struct v4l2_mbus_framefmt fmt;
+	struct ife_video_pad *vid_pad;
+};
+
+struct ife_device {
+	u8 id;
+	struct camss *camss;
+	struct ife_top_ctx   top_ctx;
+	struct ife_buswr_ctx buswr_ctx;
+	struct ife_pp_ctx    pp_ctx;
+
+	const struct ife_subdev_resources *res;
+	u32 irq;
+	char irq_name[sizeof(((struct v4l2_subdev *)0)->name)];
+
+	int nclocks;
+	struct camss_clock *clock;
+
+	struct completion reset_complete;
+
+	struct mutex state_mutex; /* Protects all pad states */
+	spinlock_t bufs_lock; /* Protects buffer lists */
+	unsigned int stream_count;
+
+	struct ife_subdev_pads *pads;
+	struct media_pad *mpads;
+	int npads;
+	u32 sink_pad;
+
+	struct {
+		unsigned int stream_count;
+		u32 next_seq;
+	} camif_data[IFE_CAMIF_HW_PIPES_MAX];
+
+	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
+
+	struct v4l2_subdev sd;
+	struct device *genpd;
+	struct device_link *genpd_link;
+};
+
+int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
+			  const struct camss_subdev_resources *res, u8 id,
+			  void __iomem *csid_base);
+
+int ife_register_entities(struct ife_device *ife, struct v4l2_device *v4l2_dev);
+void ife_unregister_entities(struct ife_device *ife);
+
+int ife_get(struct ife_device *ife);
+void ife_put(struct ife_device *ife);
+
+int camss_ife_link_entities(struct camss *camss);
+
+u32 camss_ife_stream_id_for_pipe(int nstreams,
+				 const struct camss_ife_stream *streams,
+				 enum camss_ife_hw_pipe pipe);
+enum camss_ife_hw_pipe
+camss_ife_pipe_for_stream_id(int nstreams,
+			     const struct camss_ife_stream *streams,
+			     u32 id);
+
+#endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

