Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39A3331ED9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604540; cv=none; b=jxocvfTJm6v6+nOkMCFRaE6GzecW6zSh+csaJO/n9zC4a+3OTVXayPHmauuO7J32Qgqi2qgEDDss6mGFuPiKbGnRyRiczNxmuKW4B6L4R7SXWNmt1MN+GM0QjH77fNAw0osXhbquY2IcI5Z5J7aS4kuM/LjxoxefYjKQntH1Op8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604540; c=relaxed/simple;
	bh=Z9YVCIn9gOvK6SSCe/yg6Q/JOR3Ghll8qnR7XK1MFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rok+VVSgyZb0YQ9EnqspwRR+0RcsDSAxbohY0jBiok4HGpE/U+qDXca5Bn5mbhJwXgoZW6jt0OexE4/OUnzUs+VH1SNWyJj0bHE+183u/yd5+AV9V1LXzII7UhMU16rCIIKW+w6FMDJjNOt6K6OOfrJzlZnkgSPruNbUhQJ/acQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyS4pocp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R748MZuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyS4pocp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R748MZuG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNgP51628795
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=; b=kyS4pocpxExDq3cT
	0B5icKa0By4sqWP9O6TCmghtCiUBlzzlsx3j9O6q127gZKpFKXde21gdban0NTer
	xptbIQxqrycEqQfdJ+GnDjiMJpmCkV2f3PYn5PwBUcUErIWELtiCaJpwcK0uMd7m
	xDQHzWYqZoc3RyPa8w/+TJo6IFG1KkSeLeQihzACqZQ5KwyZIjz9LxFWQXslkml9
	cvKNug4qQVXaLCOfzuR2+NOvLy8MB/VSO0ygCZryGr/i5NDnywpt9TGakVwRG6Uh
	F/k9fjq2hD0antF3m6/nOIljrwF8ppzBVicQoz7+DDrza4XZTYSVNP57Po1S7OOq
	ld17zw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuxjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso247662137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604537; x=1784209337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=R748MZuG2Q6DtwebJ/9eLkCiqX52+WcTmavWohPGCqwnP14BUja6h3/pzcWFCTtMG4
         bE5qR7+SfHzifnX8Dy0CSR6UY1zGU6PAxSI7LzcF+WE0arnk0XkHk467pNCQYoRrva6H
         orW8c7zImS/fGnbM3mN1eNCHZ5MgQrSc7QIBO086mFyRoAGLjMRP+/19Z/BtfXjN9AuP
         mqmmGFaPNmiYtU1LJgdC3EiS2hvt9UmMVldlJele9reTOSioJwTlKguJXn7K8UC8NzaD
         Rzp2b1O4a+fcTvhPhvVNt0n+Yw95QMdju0ekldefgusRJ5lvtfapapLfd73PdiSdHAVW
         y1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604537; x=1784209337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IiDXvUnbad5BH0dIQkKVscltsnZRJvuwXHI3L5bnEU=;
        b=hGRegf2Wuv7yIvjYoXRvbcvmYMdJyaahkWqEz1tvbz5ca1F60ic79RdSu1vVBVTsiO
         dR1yS3ph2AqafwfsH5nTaCjjIutU0WjgxuOcNoxSOqCzr8GNt+VH1Q3n4p/s9yrwomXf
         g2OxFXE0HfxNgKeUz/yhr/AwgOTuDanNW1xcK+zgL4tWuBn2C9xDw+fcjL7UrmCltZHl
         IPuz4W7JOM1H36kqdNfK+O773eL3pWN1aHaP9I/yP6p/V1LyPWj066PuLtDo8iOOUu0z
         pbRjFJdLg0K6+0bzPRas02FbQMMFSWf6r05huKgALENZOgz+jMPT+kR30mqWwq88dmhi
         qpYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+tjwELwpfF84pqYOsXlQy2xt+S+lhsFTYRj6Ee4txGlAYhMsLTQghQlKwx8UZtK5GsRqNKypekD2w@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkGbIMmdKNc/dGXpXv9ep9MNGabKLw05rBMhA9ZZid3I8Ss2u
	cjUNtPMUkqkEp11aPkTQSNtl+MfFpSLUY+sj7Y19B93x3lIpPYyIofjOPBLwd5LyGa6eW6n0ROK
	/hrKMQGQzKOYVxyuGizU6MKjCVv61Ab2PScLNQrGcIHWFW+HCcp9ywLYezle7kF9U
X-Gm-Gg: AfdE7clBe4co8DnOf0Oj5Wt97cObUIQ0H6XDH2m8q0S71cfIifQyDa2NkX0Y5+JaqJU
	xgYFpMLFO6LtbUMBmCHRmNzkGDrw/SqushNVdWt7K6LxmZG3xwQeT3ocp62u4nWVvk+ZcKs5v/e
	8Xn8IaPK8mogXp1ZSAm+g0k/IKetOhW5gUDGyzrDKq4yG9+yk8KY4RDjCE/WVeNvtDoItCd9X1J
	EPRS55xskRRKzjMHxe2DDeI4ytOVcT8EWyQCyDHLdlMjOY8IS3CeWuMx6j7ZRX9LbW00fN3pTA+
	sJQd8ct76GCVAkAUATGzOr75RzYBZlCBslMiWdgiaCgqUvb8iawYgKvHSVdQPEBi+W3wx+v5uWA
	w/jN4FXx1IJ+Uecjo5/CmT7+xUaOV8kr84fLytQ8GzVGg5By5Bu/CXU542ihtVDbX/JXDfmQK/C
	1K2VAZA15afVwB3aiyoN4FVO6B
X-Received: by 2002:a05:6102:4489:b0:739:4470:d8 with SMTP id ada2fe7eead31-744dff34fc0mr3792981137.26.1783604537128;
        Thu, 09 Jul 2026 06:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:739:4470:d8 with SMTP id ada2fe7eead31-744dff34fc0mr3792962137.26.1783604536525;
        Thu, 09 Jul 2026 06:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:58 +0300
Subject: [PATCH v7 07/18] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-7-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj8UzQSoTEypLFxWuTJ9OPEMEGui3AHWwyMxcB4RZ5E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkBBsw5WrJ2W+jVIrxke887wis1lYUq7Cp2
 9RdC8yTnKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1VO3B/4+2TvtE96xk9YU5v5tY8+QZAa7K/m87QiXRZE2O4ZSEWwL+6GZUPN5ug0cC1G6k3zx6jb
 Q8mqKDRLMM2Sg3pGphMr0TRS/O/csc/iwokck0b9i8FEbbmQyjGgrYRYnBcNuv8Fm2poQ66g2a9
 NUzLZ6FpN66dVQi4U8ZDgfqrBtYE7NivVrFZIuAHf6+JLw2dpyN68E9yHLbsvVnB4iZbDq5yp+3
 7bYM+HsJbXmReRYhRTvvlrFpjKjY2mt3YZzJDZFOxeD1LWSD7IKqcEsfQwmqKZWs/WKsgl2l428
 oIj/ZxJ/uDbPHjM3j8Y6z64kUh3J2SQm9ObHdmaKw3B+b0RA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX494UKA4t7SOM
 slpwdRg7K6H3cY+S5hglcUlmZsi5UWMcmXfrilzpnPB6L+CHHFJlUhEr1Kl4Lx93zbLPMg6haLO
 lRQue6fugfoU8wfsHukOwTTVX+f3XGQ=
X-Proofpoint-GUID: Nt62gjXkPg1UXvxeHCC3PGcNdOTRywHf
X-Proofpoint-ORIG-GUID: Nt62gjXkPg1UXvxeHCC3PGcNdOTRywHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8FMU8anDuk84
 xZRwIUlkgEcRaD6q142EJPELcIFUrSEl/g0SpuChNKvngMjj9Oa2xmOIs81d3TLtqhH/enHlpXb
 HYCvOJguu4KgZ8rVMCcrzEBnuKO3lBf7iLfYIAng3t+BLIqWxSDBXd+a1MrBcfFXM1KoK3l+cCz
 a5xPYgcCinjjd/ZfcTpm41tiusF8QvKgexjhMOU1ZrEr2M9w4j8E7OnhcNYO95WbMhGrRcJaJEf
 RjzIw63Xv3DDbmBo9Se1gL85ptclrWAdXPc9qIzhetCLY6Yarwbj3uYZdDK9Ki6dKbZgCA/Rbas
 H+ZulLVmlcraG1N8wkjmzf0sktpbgpimmSWeBQBeRZiTSHsm15PzSPSvcn4EPOz1pVbDhN4TsH7
 fjEEnc8xS/43I7qVjrgYRa+epQqX/yFNqw+bPndgcWlkBcswKEk3zzkBEXDBx00eh0BptfXmi21
 imLcDuBLoDV2RT5zxhA==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fa539 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 6dbe18be5b49..526f92575264 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -46,6 +46,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -79,6 +80,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

