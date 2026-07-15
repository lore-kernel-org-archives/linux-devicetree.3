Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF5370AE9
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124629; cv=none; b=GCxAukXQfci/BTDtW6zzZIXBK7cNwB7iOfG+ape3lQ65a57FlYTPAP3HYPGj6RiP3fPZfZHBSESfeYA727gxOgMpEMZoa/SU/FwAyySrxd3L9HTN/dsIa89bNKjk7DSEOfvDmQLEZHMKi87AZla+nbxDTtQOMWxl+FgO7w3V3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124629; c=relaxed/simple;
	bh=tBM4xBzn/Xu0jRn9xB3qtH2PBSvLI/9VGMLOvNw3o5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duttjls/1I7TyB7mnX6oNdbOkoyGWX9QPzqvMt3LOijXATqgR5ilrGj22sbXHae7rvsELSQjj/7ehmBVpXg80ytBBL2ejtJvyGSUhHYXDDXWGAvKm+vj+fSXN7bzyOxEHPbNbQExDrrAzzX5tSjtiejyaCi8pBxGiFbgZ+Vgy0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQDuOgD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBzC8+ZD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQDuOgD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBzC8+ZD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3PrA3957727
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=; b=AQDuOgD2MPFx9Qk+
	jDvhXq33rTOeaktqP5IzDqtn7k7bRJ27BeoGxWQnnqKJTeyJ9jyUp7Bny46xAdlF
	lnNSJoTCCuVoXExD8ydeftMvOkU55zKEXspr5XGZMJIdC29ACW8zb6falFpcQ/2L
	5Pk/rZ/NIBc9my3hCuSTth/vSzzaffFvpymxtBT0TKH11L5iLUj7p+DAmAC2m5k9
	KBSP/DSRmS6JVykgq97Pg06r2UraJs1Sw0VVn3SthKWQcYfvItovrrWc65lpmTwp
	xOgUHAtfORPRnoXZyaxfZoxGXaRhzsuTlCq2lNfSS0+E85yyYDirV/ycLwGlOtrB
	GNrtWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg79c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso1979202a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124624; x=1784729424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=GBzC8+ZDEvbYmXuRmK2bF0Yr55/kcXiTediOT/PxWpfv519tfkJYjX3hCAySPAjcuQ
         bL8jx4PB3Aa5XwJSENOAzMt8Es+yquzqHWjbHMSteJuYVc1PW8hOgpfaMtRy6DnV63iU
         OrJQwLFh0g9smcb32nHEyvF5T73x5Je6lsd6X5f79HKuFxTz6robnvPZUmtxiG+WWW/H
         oNH86b3N90wIdxE51A2HbPcajzeug13Elp6dOAuILyzWS9TszLlHq7t7qxkcFbjE93pU
         2drJMilbDrK8oARylOBRTNDKyR2deHMU3rs9xkFgPduXt3mPTaZOFtUj2/m5sQInzo8F
         qwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124624; x=1784729424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=lk67RH5IcThQkwa30+pNp7418U9lPVPelxjUhOTctUOuG8sIRK6fw5ZDXrumYD5+Ce
         M+S14B3fM+XndHV+MaBWYRKpGJZHJuM1Qb/2g0gc7ZdD5CbUXiZeeA1Z0RKEEFhpfTvs
         4lT43hcaXrQ0UEtMjn6Tp9QeyEsRh2Bw66wNiJczjQLiSPh70O5vR/csZrfAiVtJ8/Mm
         62x+5RDqleDGVlzlTLxQvLyrLKnuKSkyYjJyrejo3eyU/M5Vy9/cFc2NWhV33iV2yAZg
         r5T/6H9YCFMNndMXZoi0kOPjrqN1RR5U1LeR3zncCufSnGxWDM0dHL4IO0nIeD3DINuR
         QNFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh38OSkzgNkC6olpTvsqIC7uhpklETddGFNRv7/q0CPMQUHL51Sdl7mozE9mkOwF4GwoovGTvUBXWf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp42BNVu9LlfCnS1t8osC+WEjhJxJ0CE3gkbZO7EUa6rm+cEyC
	fQF7jRx2JGmhQ9KIz7ZLUf9mqu4SUmQCu9prXxBDnAomZnXKqu1h44ZW7rhasiCTgtIJoD3+ovQ
	JI1m2nMIzMu4zhepVx0+tgvAeZtbUGm3qKl7xelQ7q+1S53XSxaZNf2DviTIshpGR
X-Gm-Gg: AfdE7clF0HKMSVvMmXWiFIbIOMetitVMeEgUjrU4rZ1D91HlPQdBHo/fttejrcghTXa
	AC+B+LuEVwa0qrCODm+SicRuyIGWXIPxfjwNTX7OKeN0bfnh2fL5/K9aARLO9Iw1I/cRwfEZ/5M
	XKwRtyn7jyK02PDqfp2caOJ2tSNMwg7LN0GudyL2xasEGi2Q/bcWxLvqGsFqxuln7Jy20pIOB7y
	bgh35e2RtK3z1/POMH7gRAn2mHDFseOu/x81iSrrTs4iGVetpK+6BYoYdyJtkOxyDGkDXbRJ/sf
	hcnjDlmeToFCiJ0grjzhszFEdR0D5JeL1r2ODl8HWkmhxpahBIJ2+eZqHyo1cLEvHSh6UgWrxl+
	t37Nxp+4c2MD4P3sR25THB2SP3PkOc4L78xQU/x5n+m/n
X-Received: by 2002:a17:902:c405:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2ce9ee1143amr182310165ad.31.1784124624388;
        Wed, 15 Jul 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a17:902:c405:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2ce9ee1143amr182309755ad.31.1784124623841;
        Wed, 15 Jul 2026 07:10:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:56 +0530
Subject: [PATCH v9 02/14] media: iris: Add hooks to initialize and tear
 down context banks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-2-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=3226;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=vPJQbRQVpDgoYGPs3GH5JVsYjK3ZXwBn3AcrWWr9aTo=;
 b=YMlHOOpdBxPUQfilr8FFvs7rxdpEwUrOIv6CUO72aj/DfFHXZ1yBpMUAyh3JdQPWw6a4B1g7i
 0vDkxE1LkISBimhCDQKIHtl9/ukK1HkLgY3dv2aXdOluIoc0X7ucy6/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: I_A768cQ2U9_DrEnGBpsUvpquo3TzrCk
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a5794d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=UiTy4FYwoVgUUf68WHMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXyLpVpEfvP09B
 PdW71wh6ftGgzKMxk4ffNwlI67SErin9I+5v+u7QNfqrTnjGJxhiR89qXhFFet9TMMorMceMOV7
 +Zm/dhH0FIzLvBO+aJMLecKllMBwUoUWhtNquHGz8kexYV0JfKEgWzSpSCfRR1dTjMW0QpbwYKu
 CiWsUjkXQyvXQ/KhHptycwlMeGbqc2QZMNQmksENH0ugUJhmdxYczwLqVZnlT5rs5IZHQfSndNL
 qfW1AeqFEt1tWc5rIl2P6vLU3Nj763F3rQd2iHTFShuEaT7kdmtx46k4r6bszq4j3buasH84dcV
 5ZsdtcBSyjuc6t6KAqQ5xox5lfGs+jkFSeeKyhPfy91nAsW9R2qLl+nsm8COsgT1XN/QGEJphOA
 k1u5gKqMoOtRv97tSPgvtTmf1VzZKgE1yWBlDop92lf/j99QupYREU6Gq4ZIXgH4umHtrVSwDJl
 3NM+XtXEOFs/UQCHEZA==
X-Proofpoint-ORIG-GUID: I_A768cQ2U9_DrEnGBpsUvpquo3TzrCk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX40I/drlRdEp1
 W1Pm9gt47El6oKARIMb+aD4RS1Ko0sZlE/sHl9sT5hQzcpkSg4ZQEiBaUfTr4ZfC4qL0oBUhczR
 Uwgx3Se49ODWpDAWWrTJoIHcf5i2WMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add platform hooks to set up and tear down context bank devices.
Different iris platforms may require different context bank setup, so
let platform data provide the required operations via vpu_ops.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c      | 25 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..2594f5a67378 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -15,6 +15,7 @@
 #include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_vidc.h"
+#include "iris_vpu_common.h"
 
 static int iris_init_icc(struct iris_core *core)
 {
@@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +290,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +331,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..a8df9af0d3da 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1

