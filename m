Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87548A8C7
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364073; cv=none; b=CSxnu0tfwbHKUkYQ/0+VITDMhFc1iiWhO4f2vQSE8No11rG6e2m0Mhl7wEhf13RPxdcA8ZfaGGs/qsn7u9+gPz5zkawzIeGCUqlElKa3wq/HaQAxulVb5MWTz1xM2pgVsdteB/LddquLHWiiUixSm4Gn45g7+QBwRfWR8iDTQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364073; c=relaxed/simple;
	bh=RYibGEzxtihko5PwDqOj5fA9WIiMP/2MvesgUwHHFM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b5LBljZJpjVwhrCo313Ldxiz/cHJZ8vFxKCpqVqOi6rSvmLO3bjLFL910+MtUD26Ee3NrvUflYY3DbO7Q+cnleNFwOWWvCFtChp4Wossp5kWuOJz6Qxo99fmnFGUi25LrtbHL3mQ3lFoOY37OdkGSZC+vMdAyrhsQHf30iMhElE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLskxHyG reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLskxHyG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jdZE3194033
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AcQv+ESudV3
	lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=; b=hLskxHyGbXu29vaFUujbvarQ0cs
	7pCvhkXHQVgyy/gLkAtZ+TLaukSPIb3594s9U6TnYrimfz30Wf15AchnFPpG1q7N
	x4aFJaALBpbu+ySndW1UquSgJii0sv4HmLjHloQy6sXAX1JLFe7cQXbjfS8pS1dL
	NrXnWUpEyb+Ri3IMC6roJftDgMF2Vee6lBWDh1kKzsEdNFplSCJWt6eMJYohhHZ/
	RdOojGKF+5S8GWixXqnHoeMWFhhy+rUjwC2xDEPQZnTI1wooJ+yXoy/MlJJSiGa0
	DXZDYRDF9GsZHz5yN2nCTLp1ZDpVgC0nxchCrpoW+qlBWMANg5/o2eKw5Vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukh6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so618471485a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363780; x=1791968580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcQv+ESudV3lx6NUJHsnUC9DLitCg5UjxSMMc7AIUxU=;
        b=n3KfnYLdGwc5Td+/Ppviu5JjLqXdFJgQ2CegFNQ4iv3U+RgCopdW56rp3ixawjR785
         vIe99sGXTEfdbAvsOycc0pJH/2wquo2xt+ePsDHiArsIU4MUEfat0Sbf6MjEMrOQuGvO
         AxdeAPNqKlM4sPy200YalEWBTyU+zqr/mIaaVBYepCPv+XTYOQUULl2Hin2OUF+UXJxd
         F/R5ew74B11u2U67LB/BOjmgMfVnz77tyjQOdooExFAEn8w79+1+umMKajHfRr07V6ez
         3WsORDDX3cZsSaPRGpWwjWPcZ/LsXpbEeLdPYIDHq0QU4evuttHTJRqvgSXn2feCiep5
         2QpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx+Gvx7LAjZ1adFeNbd8HBcwukDN8tqmR/1oFgG2YO8dGEeJk5QBdrCReMI/00S7fLx/jk0lECWS9X@vger.kernel.org
X-Gm-Message-State: AFuF++kO9mzxhfyClP4U7tuPGZtMSRbRDrv8Us0JTrfF2ziZOOlQesMU
	dkm9EK2Nb6r37EzveO37BgMx/FEShlVL5NKBY6p4R0VoyGSvqbhGrKwMKXXMfO3oTlxGV0/OlVZ
	fWjmCTIplynw/+gke885A8/cNnOko6dn/VFTXIDrFela1cR4itBvcLFD4g/k3QJTZ
X-Gm-Gg: AYBFou0BNfhODj6o9yB66gE4rwUxZm8ey8s+irnIfpx65uOgk+eD7BkkNPWUpdLd594
	PvMmkp5fB7lggV/wSsQeEy9ls1aF3aepHJabQfwnjnMtzRQvADOoNa+vkIbCu658j1LXYZ/Jisy
	6Ov8I0BoiPILACciJJOT5A6+x+jFU7PK8AiTZVoV1fgHvPgxnN6UNhfgy+yT9zl744fTNCWmbXk
	iYEqCuKIJYwtOqQ6CYYlwhAgv9y1P42A62L71KSzdAR6/diikbWRh6a77P2n/cBeRkqQjFfvtxu
	ERgWFmU9ATvyyofnkH6Rb/R+zQrHTWe9JOR0PyOaeidxCh7V4mLa0zF6EN8=
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021849885a.29.1791363780420;
        Wed, 07 Oct 2026 02:03:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93e:6e6a:b686 with SMTP id af79cd13be357-93e860c61b5mr1021841985a.29.1791363779756;
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:59 -0700 (PDT)
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
Subject: [PATCH RESEND 39/45] media: qcom: camss: sa8775p: add white balance parameters
Date: Wed,  7 Oct 2026 12:00:35 +0300
Message-Id: <20261007090041.3732717-40-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: JwZK9N9ivEO0TGEfqaSbQ7Fy2xIFmqWC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5fB2qiv2N4Hh
 nN009bZM6+WzT+Ks7Ac6TclUjgwfWZIMZJNDRSIHKWCGbnN2oMjtEIqzjlU9dYAcsWcrfncYxGi
 dty97gYMOKYMxRyC85MJzmiRkAd7Tz4=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac60ac5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=rrQ0n_boRlREehwvzwcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5tdVlD6H5sW+
 eL5XTWe3gmPrDp62t++Q57RftrlyASGr2VnSRYXyiye2RO+hPHOwoCLRwmj+zwMvyoact8CU8Uw
 CdwP9rTjYlnGymXEwsn/bpJ5DTtqJ5hojm1TQQt3p3kuKHJV7f3xlLOUevsIe70X5oXU28gFF1i
 /vbpUoQdpbqmz1Hq9uS1/+y+nis5ttOi2Qn6BwUITfjOiv2RsRb3gGM4XSWIsQadiA10VKqAPq0
 xMVlAbxs0LEkVj9dFZcYkjdNOpoUIyXk/V5MMdHoepNJDvpr7j0Ryj63MG06npoBx8plCQ/KHx/
 B4M1OGz4RXyU9lXXziclkavY5uBz7KCIawO41yZUO7pR0amJrGpsAwijR44zk6h5R4KqZjjST2W
 A6goaW/U773JaQ73i2vVaxLgToL/FwoZzM9KtyhBmG98+TQLx+k+vC+GUtAdOeuN34/3d+mDWJZ
 ZIeKA5J/QohqihGRKoA==
X-Proofpoint-ORIG-GUID: JwZK9N9ivEO0TGEfqaSbQ7Fy2xIFmqWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue white balance gains from IFE parameter
buffers. Enable or disable the gain block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 77d33c05cc6e..3c53f585133c 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -179,6 +179,36 @@ static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
 }
 
+static void mod_v41x_wb_gain_set(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_wb_gain *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->g),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->b),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->r),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_wb_gain_apply(struct ife_pp_ctx *ctx,
+				   const struct camss_ife_params_wb_gain *cfg,
+				   bool enable)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	if (enable) {
+		mod_v41x_wb_gain_set(ctx, cfg);
+		value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	} else {
+		value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	}
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+}
+
 static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
@@ -632,6 +662,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_wb(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_wb_gain_apply(ctx, &block->wb_gain, enable);
+}
+
 static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
 {
 	struct ife_pp_ctx *ctx = priv;
@@ -650,12 +688,16 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_GAMMA_256] = {
 		.size = sizeof(struct camss_ife_params_gamma_256),
 	},
+	[CAMSS_IFE_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_ife_params_wb_gain),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
+	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

