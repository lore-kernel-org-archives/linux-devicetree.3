Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C6E3F4116
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621313; cv=none; b=PpYAlUKdRrTiwVdFWO5q49vkXfVnY2Un01dDO8NxioAC61JKxFjUPMM7uG9hADkFi/J0b0XJymw8yujUXzmoxoqyBYFR/xvVnBPyY0u/9JjwdQC9WLpfVjD4/OgpJoh7ZrCelBhiEp6VJlOvBvFXL2Q+Ddm8WROEsYUp88BhVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621313; c=relaxed/simple;
	bh=+ExuaRBxQIaOHG6mrK/Olyf/dxovfo+tA3P6mPihs8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8ZcCrb2t5jn3Bo2DxGkLwd/L8Ams2DJOwXyju0xhMepmG375YhrNxvZCo+rQcfKLMp+lCsCYN2FoBnPejaQRorzkFVS/5ILakzCozvZIizOBqmCzfKHHuTZFjReF2l3SM/VGRPyyWUasc1ebDvbdU1RfhnExDsfGnR+NUp3IBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y62x5qCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhcXbB3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y62x5qCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhcXbB3+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMgHBp2600860
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c+MG9f2w/9ybbVeA1E4MIJh8UMHBeh5BTpy0MtonQ0=; b=Y62x5qCQTF5ook6J
	0nK2Tix3+5H03oXMxmc9qYQE8/2I5EheFVotUsT/MM8dMgI+VVO2UX4YhLa670Z9
	bRcD31EPz0rfWVLmbUWYUDQAjGDfIGfcFnnv772GstdDEAsgH58odezGkiP2wmKY
	9nSS8X0ujhLiCY9a/6CGnSY/mTeOeksUT5P8aaYVvBu+mufBTIMScZa9q7URKLMt
	Ko5ZdJlhAC5jDdZxcLYTbyjReXijrUFWM6ExjPDImy7UMeb0vIcydKZ+rVR5Vqpw
	hetMBWTd91lA5mC0RuZp6+Fs0alDfiOlK6HmCZR0VzfjbBtp97GxSzVmbjnZuqqI
	VwUT+Q==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb3kkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:01:50 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso505398eaf.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621309; x=1790226109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c+MG9f2w/9ybbVeA1E4MIJh8UMHBeh5BTpy0MtonQ0=;
        b=KhcXbB3+etRiRs28ckoIMlclR9qEdK2UsuoP6wF2hBY/Rd/uPO1cAtak7751U9uUWx
         mI+sT40bQCSZ3F+01YJYC8zQ9mbmOXebtDduW8FbGbIWxDwdr5QsKgWmhL/VdTIa00NN
         ihPDypll/43dth2fzSoIVQqckhhZ224GPZoOYZs5jIidPt5TKzboSOddCCRHmOMGNI5T
         HwJvPme66AsWTxInjXEPf6H+0bktpyhiXKMPXdP+fW9y3IiuU2NqzWwueFqxc9BQMygQ
         vzbfrWrJqP1zLeL7uD5uGIeaIwr60PuWu4c81E5L4fIg/Zx2MnHL3+AKf27+Aj5V5POn
         jbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621309; x=1790226109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c+MG9f2w/9ybbVeA1E4MIJh8UMHBeh5BTpy0MtonQ0=;
        b=C9nVeSAEL8tF7Vi3et1HnqS5FzoaaInGnn1tk5Zf/jfRzgYmOtN3BsUzJDw/COtO7v
         4z8L6tolJ8UrM42T9TEw9yx0JjCXm7EyY9H3E1HwC9wCdbKd0t86FDVW2QcMqzVKjyKx
         RgGVWq+PkdeWmC4EtaAoPTjVZOXX7i+hlLU5mtxJYnL1jgP2nrSmgn+AceWbBOoQPxjy
         fdUBvYgRbXWshclI2BqU/ylve0pasUQuc/VTuwwDvjE/X+dmDL3+kqh7315yjcAwUi/x
         Etahv4saJGhLw/4S3m2Xa6i0QU/n5ysoKZDJcjSd6yEJYLolcXMIIcacla5JEdC5hs6M
         P2wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXTeNiAvTAUE8HpCVCqlno2POgX4tyZjZcNsEGmbUyi9vAq7fE25lTB3C74nAqWsGbZk3Wo8bOnNJt@vger.kernel.org
X-Gm-Message-State: AFuF++laJBrCeniXFIBYz72E9f3dlqi/Ptt6bxDINqxRCAISGN+o+n1g
	TBkwac6rmnex0c4fPg/qwpqqxEpsBwcPTgbSBXCyFdDMVWZaz6zg2DvsftRdcTcuqS3K4jeppKR
	B4W2us+LUOTsGMtz2uNGszo2Kj/YqfxRhOnafdcdObg/Qufreps3C1xrJCOvcZ9yg
X-Gm-Gg: AYBFou0d5LA1LiZJzcu6mRzMypMKOcUjh9zJL7S8fVkhuj30B7bP+luVzgMCLved+o7
	50PWKO+NSL0A43NlDMBljBPk3h3nhi550AIoaVdzmf/kkbJuJk2MhqwF78bL/vIQ2c8XmJ2RCB1
	fF6XBNRAjOGJpBddKDKvHnUqk1yOPiEFPh4cnf82oXTJnHaJNFmZRnEbLz5lbwzQ1NHCO+C/xSi
	hsEVeJwTisY2rc6SJ3/fOsBER2O6Ibs6hwMNY3gihWliMc0e3b4ZsNfay6BDeOthS6LRNfiPooo
	LvtyXmxml4X0vqoSr1VrohPDndAanas1FKMuMkByAChA/S+vnlKxQH8keAZNgOI7vjeC5+bNcDN
	detrxFwxis83DMxCfDuc4IUbtbI6LxnN8EQ==
X-Received: by 2002:a05:6820:150d:b0:6c2:396e:b991 with SMTP id 006d021491bc7-6c7d4df6cc4mr4855171eaf.61.1789621309380;
        Wed, 16 Sep 2026 22:01:49 -0700 (PDT)
X-Received: by 2002:a05:6820:150d:b0:6c2:396e:b991 with SMTP id 006d021491bc7-6c7d4df6cc4mr4855125eaf.61.1789621308953;
        Wed, 16 Sep 2026 22:01:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:01:48 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:24 +0530
Subject: [PATCH v11 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+ExuaRBxQIaOHG6mrK/Olyf/dxovfo+tA3P6mPihs8I=;
 b=oxKkYS8uSP03D5D1o6W47/aBAr6ogm01LzMPwRe6kyNUm66j/zgrDfDNo2umQ1RojllKlhbk6
 xR/Tc7rQMZxCqqYFOZf4OZxKREVS4PYX0XQSzk/m62wmob2c7UhHCZp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab743e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: MtGBb6XGqum0QbDQNLBajlVvibl03zSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfXwE9M94d9QpLf
 4tS88npBy6d+Jab2Afq1JWvlrqBdJsJDgbYL7uWEbIZaF4h6qHM8iCg2H6pl44kPQ7OFwrSF1GU
 waYg3Esf4sxl4UFa7yo0Ihrkgrg0nP0kJVk4l3dug/9lGfoqPPkhlWp3ZdeZ92+X26bQ8RD5dys
 BAj74Oo8VyV0nhjwedTneW1wwGloalCP898Cby9fxkKIK8JPszj+zNh+FHogitto1a3Sb3VyAv0
 a1dqp6Ydos9vtGXwYntGEwTV9B20gAafSSI2x8ZIznJdN2C1kUAs1pFeLXIn0/GTK/z/Ujwmzth
 6lmFmGjPDBOQEmkRzvpyUGCXxAuWe/lALsTSrC/ogoHRjXFWYbzHUS0oWt2r+4OcdzpHB1YqFjz
 RQnAeeyK1MfNcFa3GERG/uppFrnItAPHvT5PlADyzmbhEmJ3W9NbE5UTiacolR34ZXkRcKLV05g
 vbli2hTcXChqn5tn8Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX4+862P7VUTkt
 WjbfiEb88UR6hzWxQpMW9MmYfJ1U+iHhLoyFPQaLlLKjIJwdMnuRHqQ1DI6acZiOy8vk65qUj16
 t8w73rvK0U17Of3SbjcnHPxQx9TYdHk=
X-Proofpoint-ORIG-GUID: MtGBb6XGqum0QbDQNLBajlVvibl03zSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 7b07d33d6119..f3c4ee2c4003 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -329,6 +329,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -362,6 +367,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 06e15ea6b58a..e357887624da 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index c44c85eac3b5..3782454b7d06 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1

