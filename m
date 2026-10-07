Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565764772B9
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363941; cv=none; b=f1Fwy3+0RDHOR5BXKbgof0R5DTEQn7xJrqbKsr1vlMXCHL74hX8Q4fJyZ5v85jOHKXYDVCVItHQW5rnY4phSjTqi/jRHNZzvuPg/+WIGADPOhbV1VFLmVdmaf2xvdxj2yGyaTW03YBYXzQxyjgvGdUNLdeW4KCPREp2BWnM7TuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363941; c=relaxed/simple;
	bh=lOmfvyw3XlxTtLP3rd4+jL2YmaWRT6O45D7rsJBBOvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrNsgjHo8d2EaYoVXPPMI0HVfJCe985I7toPh89Ukt/PnTG7YbUkev/NsKtmonxbPWKVb/P2IfVXJzMzPk225C8bZHF15zunu1rcKbYCSCjJNX2602BO71CvDHNFsVCK3tVxpKJvJEfYA59rSeR9vOBojdwbCoUwxn98SOuTszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE+zUkud reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE+zUkud"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWLN1873388
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LdndrdMM61X
	79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=; b=FE+zUkuddFs0KpypwXPqPghqFmO
	lSpNbhS2TQjjfybKvUjfL5NR59o6Ds59KmaQL1lxqkyM/wcsPfEqvIPDgsXaktCW
	mCAelTEHb1dF8OzIzQ/uoApE81hT8bXJ28ZUN1uIO3LxXDjCc0D10keMjG3IhMgo
	wO8KRzDH3OMYqcp0uOfw69Vo+rSm4WdtBYxrsEHJP+LNP66jGqfZmsdx2sT43aGR
	tV3cy/9mmwZO9r1NHD3J0A8AxAlnSg5ng2P997yLc7q4Nb8MSGD04dxkt4ULv42E
	KP1cyMxkp2wrykBwbrhF7PJwoC5KcqVHdu27VNlHplYn76Szg2OKU3qqKjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rnrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso731185185a.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363777; x=1791968577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdndrdMM61X79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=;
        b=nbv38CFh8Ydw7mNHY6KDU30oM9bbAXxZ+3BzN95xJAcaM8LZoXQOqBw5xiNynB1Xfp
         M+nBTT9R87Bjpi/0erQCHxrSqz1TNHp8FgyDjjl9e4+dPyFaPwuI8z4IdbssEqDrJUot
         9MFmfj5OAPDuc5lb7pdvJuj/vUEP0X1T3T01H4tBYCFkV26RqATLYBX3kQLvjF7NIj8I
         VE6tlH2kJ9ZVwbCKYOAX99hNmmHEDLwVpqxAn77tJ9JLtHZPQcE/vzXfgT/SdyfpjyQ5
         ypGgWORSGbSRk3n/UTxLCjf6HILyFHes/muIQqDG82YjcVOeWwKJD8+rTTJF4TL3vU/M
         zJMw==
X-Forwarded-Encrypted: i=1; AKwUvBwGbXiyYMlB5AXqrstL8e9ztOWph79LQScmbDBjYWQ/bCLyTGR9vj0nADOXTFvkAB1maimqo+HI78bB@vger.kernel.org
X-Gm-Message-State: AFuF++kWLA0HOKAPJ7/IYxFP0agPbA2+awXOvL740hxyXjf/GMeMXs16
	awpMEZpQt1yiQiur1tc4MOuM8a+sAx+/T5n5mjNPoEc9oik0tVhxuLJPntoRmFystTJpnZK1Atx
	a5z8LbVcn9j67EfgVihRnO1GxNt1/fzRBf2XUycS/SbQZuvtG7ZJe8Y8HI055Nccu
X-Gm-Gg: AYBFou16VEyq+FUQwWM3Ut+unHjBlf8JsrCOGMcHCTidx5GzVpPP/CwLiZHQ7AZLC6+
	hsuxWrYtR4MpQlZoU8F5vSqUZkJoPlauQPLaPpXKjT4hHGyn9aOCWWzHyIBURKrqBX2NTF5Mzo2
	qzG75tnAAnxc8BF7SYlyPPNGJR4+HD/iY3IWFQfaGXsuD+vhFu+X+slLkwJVCm8TI1Jc+8EWSNC
	vIj4W0GPIZUawREOkMZnT99iRqQGwXjS7RDWPEbyR+bjkha7cGBxun0UV3qQZbWpOQ3QdMbQtmd
	0+R0v/rCn1Lith1OZjUPkR8Qy7rKVH7EFSnLfFE1nu5sXV6kA3w+cpqmpxI=
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270479485a.40.1791363777395;
        Wed, 07 Oct 2026 02:02:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270472985a.40.1791363776884;
        Wed, 07 Oct 2026 02:02:56 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:55 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 12:00:34 +0300
Message-Id: <20261007090041.3732717-39-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6Hibf/tuO51H
 WtcJ/q4ENIOm/8K20ntwVF4bbkICqxVCn4xPi6ug9nGgVDUBKjpypepSAS35dQi1QS7Md/Nx3Z9
 GL84oOjvUlPIB+kRm42HLRvvyrXr4mE=
X-Proofpoint-ORIG-GUID: N_Vzp1QaEmIz8giklRDyCpnnkGyQocOg
X-Proofpoint-GUID: N_Vzp1QaEmIz8giklRDyCpnnkGyQocOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5ac/mKFs2WaR
 X/6aMrfh8yNfV1BiNaCsrzz0zeFbPFR8yuHiSHdkNL/5nmrbJ0QACaawinGHleJPhsyAhgBG9We
 Ba5UDZ+fRmlDR4KI/CgSvUGb1BOlJvsaLZvFUZ2eIWcwnc/0ji6v2rku3B63jawcjC9Dj9W+yhS
 vB95uoudpBGTA+u1SIBA/jIx1kDMX0JhiCvIXIAkzdfYc8SK6A93/cDHL4lEolHeJ7AWly1aGDZ
 zCHqqN9XBw//zxReYb10yKUszgdmyCdH3ULAbMhUMXdrlSalzfJkwilVwhRpUNG4avvr+uPJabT
 BQuuJXIjNjM4y2CWNurXrFVk2BkvKPqSo9ciMUYzb6dyr7l6B8DN4yaATyvcpeyhpl45wkkOWrv
 jHEimortkrAnV9Vu8ggK+R2gKg6OsXoZ0ltMqAQ17BV5fUms5eyER0+e5AGHcYMKG51dWT//iIU
 knLZObApE5UYXKnVqLg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60ac2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=fErnbXRPH48mtnlGaVIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index df21ea4040df..77d33c05cc6e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -159,6 +159,15 @@
 #define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
 #define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
 
+/* Gamma LUT (GLUT) offset, registers and bitfields */
+#define IFE_MOD_V41X_GLUT_OFFSET		0x5f00
+#define IFE_MOD_V41X_GLUT_MODULE_CFG		0x60
+#define IFE_MOD_V41X_GLUT_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_GLUT_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_GLUT_LUT_SEL_G		0x1
+#define IFE_MOD_V41X_GLUT_LUT_SEL_B		0x2
+#define IFE_MOD_V41X_GLUT_LUT_SEL_R		0x3
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -355,6 +364,58 @@ static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_glut_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value |= IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_config(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_gamma_256 *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_G, cfg->table_g,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_B, cfg->table_b,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_R, cfg->table_r,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the final (R) table silently never commits and GLUT reads back
+	 * black on that channel. Deselect the LUT once more to flush it.
+	 */
+	writel_relaxed(IFE_MOD_V41X_GLUT_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static void mod_v41x_glut_apply(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_gamma_256 *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_glut_config(ctx, cfg);
+		mod_v41x_glut_enable(ctx);
+	} else {
+		mod_v41x_glut_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -571,6 +632,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -578,11 +647,15 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_LSC] = {
 		.size = sizeof(struct camss_ife_params_lsc),
 	},
+	[CAMSS_IFE_PARAMS_GAMMA_256] = {
+		.size = sizeof(struct camss_ife_params_gamma_256),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
+	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

