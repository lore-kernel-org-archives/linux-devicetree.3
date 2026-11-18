Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994920;
	b=4CuFWTt7PCw6OfzLbbDQcz1+paRmAoOVo/1dMdHOPvdTx1Xz4IArGPJxbB9NPjN9oImM
	 FDBFdpiiYo1YRiGbKqYjgwazpilp+iTa44ERVwEK9oCfVacRDYU0W/KLcGhnq84OzqkIf
	 3lQ4/fRYEIyVFO1C2zoPIaqvhPUezjo/b9x1wpYX/nHG/Ggl+8Hho/HYcBLfjgH1FYgvf
	 sF0qdreBiulozXuSF7F2Qx7fXRDiqs4xe44n7DecEFDzhgDJZnmGkKluZA2CMbvyR6d06
	 togtb57w9Qcu0dUdRH2Vy8rhlD2ycWMKXhfucG6lnp75RxWxjP00uFNVwWXxa8KRfgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
	b=K130w1eqEdHvfZ7adxMEs//1igy1tsm17UgH9xKidV77xRweIvuTBNDVggQIhY/k+Z/g
	 oZoI9r/4rB9Rn8HHx+FkTYIlDUj9j6Oj2XqH60I6PrA2/G3bz0V5BEMQb2dUCFLCa1NFc
	 wMSPjMQSmpvPue0UTVuXEjKZ/UfjrptghHw77rtjao2IhaLfKIz89dMVfaZ+LyLY81VK9
	 ZpJ512GvMYBOfVRnFTZObnQNddMl37VlaNxqnCVMgXa3oLN1TOI2W0MedtpNAF0ChTjrN
	 j1aZ2menH1I5Yj+dvbgy7752kRWSV+K1/OymUBhfbYtuHvfAO8qVnt7dloJfzoeAeaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfyCYF8u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXH37jeu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3A606A33F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF3A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfyCYF8u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXH37jeu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8FbVu2747940
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=; b=mfyCYF8uW6nruTZE
	E/UakfA00SYE3X/Yyc2Y3DuafOQB1IApTZsrnccTt07SKlgJzDgI29fmedAa5p/Y
	sDyuWYFIyDCC6ZSe6lcjJ9a/3GxVnGLwdr+QZ2mD5uDluygadjefQbx8SVEAihpg
	wY8ACEXyNt688C5WCk2CEolCDaw4eghkegzY/B4Fzv0VjNigYAA5pHVHuBFlSNRB
	I8bx0RvTHDwEdH+VYISyUXGx9XVtNN3qxg8PH2SlkIIVemJPu9IUH82o9iGCQ4yV
	FiCWCf2L+J7L3E7EM9QZP8iPTJySue2IcGC+3qRdLPUauxekMjuVZ7cIjZF5JBVa
	jurheQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8jc6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso979869a12.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994917; x=1795599717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
        b=LXH37jeuVGkBzqHyQ5QEi/WX2UVvELuyXUOu9Nv9ejRqVoGXVbjctOz87j1cabeYfR
         /YWH12lxZSDHzAn5Bif7WdSmPRtImLCalJaTanKyI64Ss5tI0eAlrE4Tvzm8tzoOvQ9J
         W+skIdMHnCMYpKqtjcj8ulxa7+BL0tFQgXE6BtLP6nTyrAZLktfyQ9oMdd+aak1YnthA
         TdPC6kFfXy4k5YZxO8txu5oJCFRNx9aJtlG3nOwqdikG5YmPXm5DD1lD75Zd8wWvFLer
         ls/fvrJLPFKZMtuK88SEG1ViC7wQYqjNt/Gih3xPZ3SdlptXJeqQWCsP8rBviV2RHD6W
         oWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994917; x=1795599717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R/MG8MVxCDIVhRXob2kwGouNany+NyhkdChngQaRbc=;
        b=ExESuvH6f9PVEfeRS0bY4Gj4MTRWJ36U7TVqVtgJ2oB71fI5YFmc6Bsoy1wQ9d9hCy
         RNZOzvF9o+aiLbg2QNnYfo2xTgsQMgRjh5YYdV3VcfqjOqeYCf/g9v9mWiWA2a6oX0yk
         MPUmSl+fDQOT3TaFl7d+vJemS92u+WaryMLMhcDk4BHfyrKuktBeywFZ50DLUfhr1EbD
         H/1mAD5ADZCZMIMJCXj7pW+SJNgrOgrNr4lnecDFQXMCZTKjZsq6Ra4Y5Jkj3PMtslJI
         AQkj4zm70RSgPjOFs2GoyCBtenx+A4l4agEBZCo4PJSaidK7qBGVMoUkp+OdwTOw4cMy
         F5eQ==
X-Forwarded-Encrypted: i=1; AL+hErF+OwgdjRYqflcZD/cwNFZ+uI6BJIvDMaSxXlMNdBqhumhnGubLqQIL+bN0NLvoB8JBq/VwpNMFORRj@vger.kernel.org
X-Gm-Message-State: APuU4Z/4XUTLMQZbdmK1EM+4x2iIO5vnLkeHE45FxUP4UZI/gxhvQ45B
	Ke3OP3ZNBtY7mzI7EB3FfP2kSdqsFSTrPsJHprK0JCw4cWxnMWTXx12XecqMN6MyM6hZfCOoNJ5
	27HYXOgJoMCg9efH3SmtGP6Xo6XOU7YTQK/6eJmniqlTKJzN7kGjnDAmnWd4FxEN1
X-Gm-Gg: AZFdTZfvD6xz7B5c8jPVhD/Eqt+cIFDD9QgAVXLYq6WV7POoryrdpMcSncon39RAaWS
	dZW7836ZarPqNE/lgx0vQpLIwumHXXflihc5GqoRqSfZ0ikJ7cEPLjJ9e7FR4s5x5LrkUDGTSN3
	qBzfeckMKkKXgXBZmVKeu2XRg6Dez9Ojk802gPXtVbNGcsLSVv6RqGLgqemZ6mgfDea54xvtr8y
	LdhOLTsMmEbBId/x/JnUNM5wxz66S3ivTnCZ5HpMsVF9cWh07yzoXrc6UlYYgxU4wgWqN/zBMKU
	bvpkVodKGpgYsFXwQS6/kCB5dPXkglT9bgJ+sdPE3fwXqdE0lvgEN0oaG6jbLuCHfzLjB7KtlO0
	cUf46HSGdla9dMqKEPwSgEdZ/9GdbQaeAtJNF52jwtcWUHnh95BnaxKisPeQXkyEB4QuUmZQL/f
	HYV3hITMmc1D0CYy3CAlA3ZttCEzOCXBNsWPH07asOHqpdkYep
X-Received: by 2002:a17:902:e74d:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2eff73f208cmr21227695ad.16.1794994916628;
        Wed, 18 Nov 2026 01:41:56 -0800 (PST)
X-Received: by 2002:a17:902:e74d:b0:2ed:21fb:e764 with SMTP id d9443c01a7336-2eff73f208cmr21227425ad.16.1794994916095;
        Wed, 18 Nov 2026 01:41:56 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:55 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:41 +0800
Subject: [PATCH v3 2/8] media: iris: move shared APV PM helpers to
 iris_vpu_common
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
Message-Id: <20261118-add_iris_for_hawi-v3-2-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=12138;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3IhCXwVThfWldjsctcBzj2ctgAql8P+hgt1hBo96odI=;
 b=gttu+KshVed7AZtQpMq0ZKv3lD2jXSpaigE2W+RHFoz/SNFlaJ7Duu8lGOvmHlWOx0s/BzTcZ
 BKNnoh5oF/BA9jpYktbG4JWRlg0Yt3dDcZf0MpeClKSftAWzdrYO+Ad
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: jqtBbIZUDRsLQNp46CjRKKZh8FJTmlsK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX34lS1ckB93hP
 Jqshw++4mqZgEUlw+JfkR24djKvk8uBbJ1tBU6onGcscbXYcw9uG7gMZMe708DJaYOsjPp/yUXX
 duEYR9zQX0cKu4xybREBxdSuVAtPgA4=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd72e6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kuoUquXy40ERufgRhccA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX1fvqzzooCdbz
 h56ggqKuD80HAeCtqDJIgdI9GzTAT/THZMpeGIAVB6R5t0bjOpdByeVGbaz7KPi7L876Qz8wLZj
 Kw+0sAJR4sn8OSUNnE7sbKfcXZv5HQ7qX4Ep9SByGBJSzGJ3/dmr066wHEiYdzeJ5ZR7Pxdo4NZ
 8kC7LjA6ljsLlGilJIDtOo5JiWQHaGC0/P92jRNpFGrg4eb9kMf1QzOtSM7VSPt8D8VXb24OmEI
 WH5DQlTPcWaFSxaW+ccxlmtLyD3TdYKv+zbUZv/lRdyuBk8Kjf4U7AdCEyeqIrIst+eBI8NtEQr
 S3L8t3ZOFIJziHUH22bRdPoPBHrlQJyYSgVqnsqKbbmWsq39n1RpPaDBOd1z6hm9WzMODyczld5
 D7CFHLdxbvsAy/KQpbUKlBCgu0UA+R63qhXLdoZGzz4KoIhlKV45voRZEhaYYy6yWOdxdT719WY
 /YB9x9XL5zXybqUIyAA==
X-Proofpoint-ORIG-GUID: jqtBbIZUDRsLQNp46CjRKKZh8FJTmlsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

The APV power on/off sequences and AHB bridge sync reset helpers are
currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
them in the VPU4x implementation would either prevent reuse or require
duplicating the code.

Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
prefix to reflect their shared usage.

Move the associated register constants, including APV_CLK_HALT, the efuse
control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
implementations can use them.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 92 +---------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 74 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 +
 .../platform/qcom/iris/iris_vpu_register_defines.h | 14 ++++
 4 files changed, 96 insertions(+), 88 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 9d89d3f00acf7a3a5e1061477c4be5d085ff1a20..616da013a4503086040bddd942e1207e8a10069e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -10,18 +10,7 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
-#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
 #define MVP_NOC_RESET_REQ_MASK			0x70103
-#define VPU_IDLE_BITS				0x7103
-#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
-
-#define APV_CLK_HALT		BIT(1)
-#define CORE_CLK_HALT		BIT(0)
-#define CORE_PWR_ON		BIT(1)
-#define DISABLE_VIDEO_APV_BIT	BIT(27)
-#define DISABLE_VIDEO_VPP1_BIT	BIT(28)
-#define DISABLE_VIDEO_VPP0_BIT	BIT(29)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
@@ -63,79 +52,6 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 	return ret;
 }
 
-static int iris_vpu4x_power_on_apv(struct iris_core *core)
-{
-	return iris_enable_power_domain_and_clocks(core, core->apv);
-}
-
-static void iris_vpu4x_power_off_apv(struct iris_core *core)
-{
-	bool handshake_done, handshake_busy;
-	u32 value, count = 0;
-	int ret;
-
-	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	if (value & APV_CLK_HALT)
-		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	do {
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
-
-		handshake_done = value & NOC_LPI_STATUS_DONE;
-		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value & 0x080200, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value == 0x0, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-
-disable_clocks_and_power:
-	iris_disable_power_domain_and_clocks(core, core->apv);
-}
-
-static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-}
-
-static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-}
-
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 {
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
@@ -158,7 +74,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = iris_vpu4x_power_on_apv(core);
+		ret = iris_vpu_power_on_apv(core);
 		if (ret)
 			goto disable_vpp1_power_domain;
 	}
@@ -187,7 +103,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
+		iris_vpu_power_off_apv(core);
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
 
@@ -254,9 +170,9 @@ static int iris_vpu4x_set_hwmode(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_ahb_sync_reset_apv(core);
+		iris_vpu_ahb_sync_reset_apv(core);
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
+	iris_vpu_ahb_sync_reset_hardware(core);
 
 	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4ea7bfd204df01da65c2c05e3337f1caf1326844..9a32e95b95db844df8298533f875fb0a1dc5c728 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -21,6 +21,7 @@
 #define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
 #define CTRL_ERROR_STATUS__M			0xfe
 #define CTRL_STATUS_PC_READY			0x100
+#define NOC_RESET_APV				0x080200
 
 #define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
 #define QTBL_ENABLE				BIT(0)
@@ -455,6 +456,79 @@ int iris_vpu_power_on(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu_power_on_apv(struct iris_core *core)
+{
+	return iris_enable_power_domain_and_clocks(core, core->apv);
+}
+
+void iris_vpu_power_off_apv(struct iris_core *core)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & APV_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value & 0x080200, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_disable_power_domain_and_clocks(core, core->apv);
+}
+
+void iris_vpu_ahb_sync_reset_apv(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+}
+
+void iris_vpu_ahb_sync_reset_hardware(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
 void iris_vpu_set_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xb0088);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index a62b6184bde7e07bf50b001b8c95e1ffd2b29fca..126555877561e3a9bbaef7fa4da329bbe6645d46 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -46,6 +46,10 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
+int iris_vpu_power_on_apv(struct iris_core *core);
+void iris_vpu_power_off_apv(struct iris_core *core);
+void iris_vpu_ahb_sync_reset_apv(struct iris_core *core);
+void iris_vpu_ahb_sync_reset_hardware(struct iris_core *core);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
 void iris_vpu_interrupt_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 4fffa094c52fe4d05d5e5d52f8c6bf891318320a..60101fdcdb92e7a9f74921e297d17d76faf5620a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -19,6 +19,7 @@
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
@@ -40,6 +41,14 @@
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
 
+#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x174)
+
+/* Efuse bits controlling optional hardware blocks */
+#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
+#define DISABLE_VIDEO_APV_BIT			BIT(27)
+#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
+#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
+
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
@@ -61,6 +70,7 @@
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+#define APV_CLK_HALT				BIT(1)
 
 #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 
@@ -74,4 +84,8 @@
 #define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
 #define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
+#define VPU_IDLE_BITS				0x7103
+#define CORE_CLK_HALT				BIT(0)
+#define CORE_PWR_ON				BIT(1)
+
 #endif

-- 
2.43.0

