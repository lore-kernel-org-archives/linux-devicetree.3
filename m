Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316536A361
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256357; cv=none; b=NWkVAuEwLRXGV5/lOgElzDgwct95UdP9ki49WzeF3iqz9g+FMElpIz0hzzwwGXeEtOcNDZeQGavyMJMC6U62ZHvGhLw6SLAT1Y/kLJz0qVdLZCxjVTM9Xo6tSfW3gPYoDYaoRonluCrNLp4fxOjBTxwp9Nu3EMUaRJi56EWoEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256357; c=relaxed/simple;
	bh=yyIDQGnpqw47Z3k4tzIXofdpxVdasMXKqZZ+/KV+U0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFxNarFBLQfErQpIX8tB7jptO5sAs1iL3i3fwj7diy+ZwTr3Swn2/2dswoANarsxNwh20ZbP7r4s2dArVFG7WmkCaoC3K1p5k1Ctj7ihHUyyHoiNAbvF4VgiWTlQHQhBo0+vrEp0kMJXh92noUGWZhVjRk4YvzzFtIZY4AX9MOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEkGD1fP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImVs3Ksy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEkGD1fP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImVs3Ksy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3CAc12402830
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=; b=YEkGD1fPB/nIHnd/
	E4Xnb87WuOllAbN6rcVzeLUx1LfKtH1LQKjo4SxRK1VU8WSBmsPq8JG2Tr1+t/u4
	ozX6HcMiLxF7vMFFkbskLdSbyw24JKaF6SueeDu+x4xKVE/wyxJMCEAxZl4USwdR
	6iIbIehoj+8PUih7GeoMZTMoXvrC+hLN4ozxFT7cFltduMxUurGO3JUC3QE1wHja
	5r8V8oG1jeUACMSpP9WHKH32Fx0d8hZCvUwZJvl/GyMP6NqGi2ebp98rdbSy8xKE
	q9DNRnooDRGFm7nwig5FgTRhUoPxolG78CAJGJKkgSsbyd2wWSsMQuV2Q0Vy2zUM
	C1nxyQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30gabjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ece6adf0cso481949e0c.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256351; x=1781861151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=;
        b=ImVs3KsyCRCOe8iL4zauG0XYc83kLk/Z0t6yGeUXjaSbM0DfJSGnhzeNvUYNwwcQdr
         Q1ibNPJa2B6tbT5G9pwRlMhBLIEFp6CpFIyiEHUmD8930maUHBEqh6NduE0dNjTBvxEo
         w76JBWAQJ/iWLzYVeWnDAmrTTXkAdDZSFQF6YFItEIoMiaz0lXdscSKz6lUCssWGyxak
         36AzIeRBBHjFp32I4PvTulBrYuayzhexCOa/yuC3xta+npto0RnVjuukaMgk9POx6fH4
         6ym8GuTsGhRySAlmnneo7PTqle9egZO6vS3yVbODKn0i+2H+bkySL/GZkGg+fyahskiz
         g9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256351; x=1781861151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvnF1OQ4GXe8rJfhWJK1UOc4dDsy8Bqru0sVMGkFW0c=;
        b=YH1/fwDLpCDybQChQPE5aQ0+Jf5mLqvqr7b9yc2muOKjwWcVRIWDC5By/r/6sAKSWK
         DlFC+BcW/28/pRUlE7mYQw1yP+qvV+Ktuo7dhiSBE87a5H/LUFi7k/WsO2UqMGaUBHWw
         6FzjeVqt916cQkt9NJGSrAtg6b6lppYEGWkIH3E6k6sD6GfohqImwQ5idmPaY7wAU7We
         qx7evHsnaMehdn3FKtYeQFUF8Y8zsX4ANp9SVssjhQZelWgfWPix7877h5INx9Mx+gpy
         Xk1zL60swBehXf0LzY2J9mqLIEN3wrBpE7qOVGKjkZwKDNaStrOnLr0oRQ5w8n2VQdj9
         zCKw==
X-Forwarded-Encrypted: i=1; AFNElJ+zH2WbnoDxsE1JDFFHKNIg9+F0riFwhPDJL4ZsBIB2Z2RO9r3DihWlnTgHtJgrATGJptK9WZd2h8Yv@vger.kernel.org
X-Gm-Message-State: AOJu0YxuW/2T0cwYtEAX+IDVceC2OF9Fj1/iNvr/AEvMdLlebqdBvncn
	EAA/OXHGjp7gCrkTlrw4+rwM7IKBZv3+pmhye28itcsyBCVJHdGYOt8Wr/FcuKQhfGQB2OWYJPR
	+guX23hJXc5HEmbIAyfOelZsTVJ9wHps1Xhfo+1jNRJxb3O5ZaOiQ+miZ40tnajIH
X-Gm-Gg: Acq92OHg/y25/0+KzaQY67JGK2Wy95FwyPQHCoL39RX8+Ce++r//+JhnxHXQkgtCrU4
	3aqIpJOojdXZu/ttfI5R/bkplwTkTuMvPC5iIFegqKaAZhizkVK9sVZx1cqWt9BYixOvlJ+H4Fh
	WdIr1MCdn2MGIIxqpwb/tw8ykGcoChyq28vRwONGM0uXEdVhOik4pJG7HpvHjm/wkatVbqt2z2c
	J2J/+cPxco8cIuvZk83o88AjEUYAExk0tJBujltPYlraMn9hGOOAR+WYqtNMlj9+dSMPm5+b4v5
	0PB/oErheo3qxXOeRR/NGHC54gim6P7wKCZb4fGqiJpnV/il+ZVJpJSWj0hroy1lPVSLk9VxWPt
	K0SDgnN4mvOJdc12wvrKHpF9xZilTQNVHQHDiXeExOktjJ9bbTIMED/3qHcoeCurEQ63w5RKGK7
	f+97pmispjEePgJvWqtXD/dmbHmYSTdh5HFqo=
X-Received: by 2002:a05:6102:5e88:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-71e88ace141mr706714137.3.1781256351212;
        Fri, 12 Jun 2026 02:25:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:6e7:5c89:3fb3 with SMTP id ada2fe7eead31-71e88ace141mr706704137.3.1781256350719;
        Fri, 12 Jun 2026 02:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:36 +0300
Subject: [PATCH v4 04/16] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfYu0fyLLGbMbRpjIhlKmEvDl05nyaFsLxPi3elcBRk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPkGQ+TVPUvjX8IvaBOLqAzEX6uTsoYkcGn
 wtBW847r3uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1fN9B/sF5l9MAAlhCJv57XP+BprX7t5xFEDjNo2tM1mka2e2u1ObAp6w6ifEwCWxPTbcAhwecj+
 KBgMCxW5iKUqw2+6P0kBd9ZhHD7m9K42LMmFWKb+K/vtRUfeLQz0qShRT8FsgHbJwjDlMPFIulQ
 w/6GYsuZLo7Dgu9cWwm8VQ/ptnv/HpJb/yPcMyIjCm8pt80P6I9dz8ZXIjQqV+fmYzbB2qdMYiy
 dngrtExuw5AF5abtHduthzPy8mdaXbWMJmSDK+fbxxQ8/t8ob3la++os6x4OF3ZSjLoBxp6/v0G
 znjsEK3ejHrqwlTP7XKA1QWaOzIa+jnAOqEmrrDpqm5E08Ya
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXxhR90xA9droI
 kzl+Iwewn6T39gGjOZcL7NZsjQkQJXM9lyJpUELjuRMEsViw4Sbc6v5/baroEsy8NO1DSIua2qs
 2nmTmYzFUtTof+f8R9XCrxUWhomuM60=
X-Proofpoint-GUID: 4473xXyR_HJVkpUvjpSXEjWNYkt9uX7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX72Lq6cMYF9l6
 8Mj4fb4cL6/UKns0zePAW7Y3qjW9HbhEU5bZhq/D/pOQfkhGm89dVzBfsxwVDKkaYFqLy79d43b
 uUpyiVDI7Tp6oBg+Q/deoG8NnjvT94Zxppaur45Uou94Y7Yo8YIs+vjFw/Nii3gv5k2uN5JoHCe
 fsp0bJMTz1D5c8TRmv6U+5VIr+WWV5Hgx05bqtaSYwpOa9xDZ2KVaXadHyY3IXzSY9ir84XlKB+
 9SldYm/l+YP+i3Z4Nsk6b6lqhH2j5PTxzddFCbv9Su0Mu8dQrPmoqkNiUG0P2BeTy+wVfWG+xMq
 +FRsfB1B6WB/XSjjWc3Q8Kbzx3w9F2gUuqlwhsoq9al4m6isdWgeM0Xm5RGozaYqZj4k0/lbyHb
 0HY5eQeYTzNNizasDYaS39TPkmldnkgSSuBeDdJ7eH6JAP8ecq1E6CnDaGu++UpCAKujQyakzLd
 r9bh/QyE4aRnmhatSaQ==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2bd09f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 4473xXyR_HJVkpUvjpSXEjWNYkt9uX7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

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
index 2dc121a3f5e8..dd2eeae0d9eb 100644
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
index a49113b0da23..375bcd923476 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
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

