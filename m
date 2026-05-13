Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701A477989
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676568; cv=none; b=svBaT2IS0xyzDpXUxQwSVBoqgFPSOYl0me1YAXvRGkCecVz2oblFAQrzm3Ltigyegjzr8F572pc3pdyDw3yFy/eR1IvGQqSTDcMjIrz0eJZwlkqICyibk/6M3Cp2BYrTegodgekiMuUsxDQa7ROZ6CP+RJNae8iC4Umrv4wAQhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676568; c=relaxed/simple;
	bh=9MMSW5/Ed7QpArLAviQFc6KStndAKsio49V65Hx+FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plxdg9lUEHVpNfxQ7zyZd2pKqRKLulT3gNRZWXLfQbblPGOdFcD/WbPrL/3L2bUDY9QU/MZJyqvg/NpIYZn8nUbO8WSWoCCk+PA1xRgxs8C5ycF7UyvIBwth10eD3WC45tNoOfCZan+Gk4IcQX3snsIIbzBTEua4t203bQhbST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkgrZ7k8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0J9wCTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkgrZ7k8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0J9wCTm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nT6u2888500
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=; b=YkgrZ7k8Hz4DAeEE
	CLjsJgOhs/4ujwqz11UXV8rm/ICqMwveksPbdXQvq2sL/lwd8vTHdTsNLs7rCDRk
	OueDZPyWs2BzYF3/gRd8+si5ZHM+YjWoTA25Kjy/M+F0Z9OsV8zEzueNLVcbNi45
	5YpHQMWnqsTLRHjfcy0OITa+K28wn2EWJ0WC74mY6gXO1JSaDil+OEvqHePDKCML
	VMLV8SYHNFHnzz22GQ+exwyPUgowGd9LiXF27Oabm6umL+/sc2p/cSIcYYML/HVV
	plte4YEe9ESoVEmTRZIwm32axmOeZPH32jElMeuf8IO//lbDTsg9FrS2iFFVwid/
	8iKxeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggv60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51605cf3c60so39900251cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676562; x=1779281362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=U0J9wCTmLBNNXhooOZqVWErwShdTuUuBU7b98doilAahRnN18f1rKLjJ60Z/J9tYU+
         +Pe8akQP/RJZmS2fo8lhq/zQ86S+jBOJUinxBXrKMY9R//ZBotbbsHei8SoxSsi7htGM
         GRnFHyj7Ec7UHmURv3zBDUj/5ogN98QuSZvI4dRAJwWJNu6KHIsijtL021o/Uram/mS9
         ovmPs7yxfRRNAOG4weZZNHN5oC6rdhgD+OrCfDyaj6CyJdzAVLn5JJw8Fg2yOjRKudB3
         hF2B138SZwZfx1YDRnPD6kMVVMfJNhBoj9WqSbQdccpGSjvRCpI9YzvJWmMMurVD2E5x
         amXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676562; x=1779281362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNMcPvu0+FyJ/bhqguS0n95+1Sk/5HnVopj7l6K+ut8=;
        b=C9ntxBovZhY8FeMvxVtNrDTO7bkLIhsozK+Uoz1h6KhVA3UuBWCbiLGqQK58M2KVXC
         lp1WKvIis/sRncgh0jxeUr94vxbb58eM5vNmqaZ0dcBMXz6nAAziXzGCv199H9ENh6MZ
         H6eTbcM11AeeCsTIVHx1cqzKZcsKmxerUnY6KgB0b93mNIresgRG9Am7DGhLDxyr6S9p
         7h6tGyMCLi7fUipxdZQakygM2ynVWAJaZaU3nVbtom1eUJ4eXN9OoOh2i1NVA4aJ35i5
         0qGj6fD0I85bvsyMHOBn2COdDGuJbkLAaVhrrB5qs3wQR47iH4Zec5v3xZN+UH03ZqVf
         Ig5A==
X-Forwarded-Encrypted: i=1; AFNElJ9lpfn2SEhev3opvVj1RPgIbnLNlWYj71cnKMVMCn/PRsLo6lQcmmnMHbtUmqEJ6BrG1Y+Nszoevs+M@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOiTOJbJ8ORaSA3OynEHWW+sorakGij3o3wJ+lCu7m7h0ioSZ
	GjdIvv5gSxwMPWELyJplPERgKB6YzT3eSEEbBNLnFfH3S4ExTLP23lPgcW18Nu0SOWnP/iOnHDg
	vwkhHTHwgg0tV9WUaSeQ+mrJxf5krMbbwLlFFlGip3Vbmcw8clYN0n/qGN+hF/uyT
X-Gm-Gg: Acq92OH/Q7ejsRpzBOY9SgcRTSl5g3YWr+eWS4zbUCKxlmNA7z77HVZnurpcflFDKBZ
	WbrQYV9MhJ3xK/2WD4DlJkAheqZk/5K94Ny6j7Ks8gVDlUMiENVyKlh1jlbyX1Euh4AfuFIsQMa
	HoDmkbeFA9GinHucNFYatf6GXy0DRckPYeM1RQLqEvf4SFK0z+KrzUTTeDoxSChhkaitSEfBE5r
	E34/dAGFLqrVMh7BxNwbvQU+M6leNWeKreb1Zf6AJpFh7kcG8lsrTym4jvpGMnHsdWK0bIKKWLs
	3cpefjhPrSMIbbb3c3LNTDt5Y3HSwVWqEXf7EwxhRyTpLTFXFmfG5XQoyRZEpBSojuZEPgV/MqV
	vMwSxrRitP2MO+k7MCwLcdwPBGABAC2//4GyMfQL5OfAg9g96N07fhCc15OY8Bnp5Qk9eGkiDuR
	mzmEtBgm7W6/U/gFJKWLEJo1YYtHdfbhtKkM0=
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40360491cf.48.1778676557531;
        Wed, 13 May 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:ac8:578f:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-5162f60846dmr40359961cf.48.1778676556935;
        Wed, 13 May 2026 05:49:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:38 +0300
Subject: [PATCH v2 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-4-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BLAFo17mDNzRt3RGOIKqa5vQlLgViburqFmg/i4bsbc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsUPCzE3Zx8QCuksX+jzjdS3bvLQpvY3t6nvfZNnSW
 s5o0b5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkrAEHw6awz3NmOHiyzrV+
 aupn9Ny2Y1X6CT51qUttL3ZenaTE/rOn3bx4x6ZHjlUH0t1zr1fyhcr7JdhcTElWfsr8TW1d2zL
 B3LythoFfHrYu31Hp63lvt7nNg/bCzf73z3vtT2sQuF/qqSHAqP329+PCQw5HG5vKNziUMWqp1O
 sIMu/gcjrDt4Bt3utdDiqMT+9m5Yi/Fr0zR97Za8VyvZIpPX/4Cst6bZaJLV057Yc4g41+TfvG6
 W1hot++aV4y85xpvadIg+36eUP5+QI7p6/7ZrnzlROj4EbX1SE3knrVW5a4WN4x78/k1Xn6Z9aF
 tDNff8j+kPscV3oyrdyz/wFT9/zeI2vP/Hz8xMi82XsNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -720zXoGnMNml56yaYSBlteRNEP1cqdM
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a047353 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -720zXoGnMNml56yaYSBlteRNEP1cqdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX44znWVL00jaC
 KFVW9MshCDD+ES7y1Bx+J2sGyNKJBT5cAoVHUieqbRAnkE3HTUPlZx5UwW+Rz/CGyANiOq1QMQC
 AziFiuCfGgcynPBSZmO5wDra1/TVNPVQtzzjNXB6XMAVC51olkwSdKF+AcBW66G0GmydepKVV32
 datlrdG5NhUUSaMAnFyWIDTL7IMZQuiwBxsOq/Qw/N1Ec8gdJ1bdUJWPA0MEIUsPHLu7oRy5P9+
 JPF038NqhaaejAR9IVXtE93SzIz4RHTgbbtDZ0tFd6cKtChO+e2efstkTQiNoE/7M8sodHeK6H9
 JSrUG5GYL3dSAJN8RWVNzVtPyuhFP4KVP9ozfA1Sf7xwgTljU4iZnui6SdpETIH8SP/ro4AGjdR
 V2UeveqxgLieehAnY1/RbvmVC0LzeiWEMKx/faFGPZt2MCiikCcUgklqMr1W7PglsFlODakSsqU
 YAWoz9Jkyju1ZLBUelQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index d61902c9a213..d49d22b14753 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ff0070c85ccf..59e4d68d042f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -474,7 +474,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3

