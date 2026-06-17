Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367233A9F5
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671854; cv=none; b=HRsAmJTRdbcE59cIkdPt/+hMD6dhoemaEZu9Ptwij7+XeVRdJNOfE5Ep61Tb/UwpT4cszujgY/YmaOYySIsyfCXW75UAH+GJaJQJ4Sjt6fJmcytAFWkc2PIZl/AgRtgnEy6KQPj1Ofp2pr83WDhaX5O48rvoXag8uufRxB3KLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671854; c=relaxed/simple;
	bh=3TFRixKUSBaNA/9bG5gD8oxXYKkrWW8JQJihdOw28zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPSTV3yM3Bt1gVOu3CAtdHeRJMwssNc6YXF/ze45J5usNdiqTUF8BoIudP5JbOPtR1swsFJl5W3qBjfSKNOHr/t13uXEEBOiMESaSIE5kPA4ye0vHI7cIc3Agndtrwqu3zXloJ9dRji0hfba2inRUdJ/kw3kVWdS6PsovlBgQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMhuABL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4Fi9RU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMhuABL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4Fi9RU6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTkS3834020
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=; b=RMhuABL7bhcRwgTJ
	VCOGxgL4GvIp3RljE2b71EczD9+7C8zx3JZLBE0AVU6Jwe4bgR9ZSpW+HGDNuOeG
	q/UVwVkIozD7trFxbokXmknWGX/3/r4Ff8AdKBy+YRuIyIEqm/VzAJv3eIzJchIk
	h0kTkNr2LaUzOxkCgAMw8R3tANAmP/0aWNEyIWBl27Oi3YyiTedSnIlU0qk/Dwoj
	qDzkd0lGH5UxLnsjW/5hAL/Ha2VLZd/queyuXkE2sxtvJdwdRS2R0nFxHK/7hZJj
	78ecJJ8lqt6L6u1Sj1m4HFpjBXfjBMqqP463EhSrOavbrQ5HXbp1CwTU+n1LzT9D
	FIPJjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevhe9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:50:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32faa62so79972025ad.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671847; x=1782276647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=;
        b=T4Fi9RU6XjgLg16m1LdjWx/H+p4a+3KxEClD570WvgxxTfwra3gkzytLuunX0B8vfC
         ScsFcP26PQzBhJELfTvi3frb6xs6le/g0YpJm13Wb+/av16XyV7rj6BIe/V+C/sJm0vY
         RjYJewjHz2RWlux3LbSB+33xEgEa5lHoFWpGypwkiYgn9mHvAjIxgwfzDU/QmbwlfLRM
         ZZfDgimn+05+8Xq7ndUTh2Ptq6d+3GF5zJUMW8O/qR3MQNel6YcxldNiJaAIakBgz89a
         5+VjZgZYeJ8rhKROAKYrZjvbE3uzgfR6nO5bglaM6MpOqVPY/zm85te4ZkO+Hze3SLhV
         nHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671847; x=1782276647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RmZNXIxlmOrsR5DVru/ETy3abT9vEaw0KBgzkoo8z8=;
        b=WJf9n/PK3BIbAqvraUftHeLIQdQqCStlYUhWfmjEC+4F40q10fpG2FMulHMHOLjbh4
         wp2HFD470AKB013xuiO79RmgZCp8JNQv+jF/fCh3yuCGRaU7mJwgK3Xe5gVouIZoLviS
         daigj+787bpOAI2mM3YolH+BCJQRyzNKVS/mA33NGpP5PgIdWoqnjyDCeptuR+fPvErd
         oDa89z+2imimtwdgjH4ZSsH35MJwzheHof+o8F9V/fi4jJ3jWOmASTLx5xTN0hKq4B7I
         kz8KTtr8xNoGb9QzGnfk8igzLsrWhTUhCd/6QBIQX/5ORvnzDyBYSmbj9CD/0c1U/OtU
         1iZw==
X-Forwarded-Encrypted: i=1; AFNElJ86GdtiCGmvLhX9vsByblq+sVpPdld7LMVjG0cL1oFgJsXqyIqmjWME60+LmDiOrQGge7vNul9WrEhy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrayn1jEChUEMKotjXmcbUBWrqvCOH9Ksczr/j6fBXnQkPY8W3
	1K8iD1ZvtM9gMnyVDoqxQWG/upJGMpdYilAY1abJeh6EofdkfEAfWDayrz52W7ZWL2eRZZUSSmv
	ZfWzv4j+n9Whes9RZxVgLx6V+PC0xQVEbGiykK8Dmo6AvJcIM2fpD65SpbobSBfod
X-Gm-Gg: Acq92OHm4Q5UAAP3iTAUoz4zTMcQnR9lSr2jpm0vHwvMYwFqLvXkI/SN7RUxo2dapSb
	olxt+42r8re1lzoulJzf+gxzFKm7/OaKqBdHZ2pyvFqUKUWnTuB6zXICHoQx5e8FAeHs2iOsAo2
	lXH/aB1GfFibJBlZP1e3yiz8YZwDET/3cuAPT8jU+4Rn2BvxVxgo8DZktHV5+pQCfK94ETI2cUs
	DbI0LChPwrUFWkQDgjLNxNzKXD2ph2mfa8trjObABptnk7HU/MMdcJV4wIliuxvtyapn/5EVhs3
	LxU1Nh+Fp3gEO9dpm0sy3lMxFJvsCmhMtgQaf0S9kMIg/2RcGfeLSO+3/nLV8LfbUYszbA0OYig
	bjf2YjnzGPI3Cnx09Pln/+ePPz6ZQOE8i0JTMHKNmC+iF
X-Received: by 2002:a05:6a21:1645:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b8be9aead5mr2394649637.27.1781671846801;
        Tue, 16 Jun 2026 21:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:1645:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b8be9aead5mr2394617637.27.1781671846225;
        Tue, 16 Jun 2026 21:50:46 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:45 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:16 +0530
Subject: [PATCH v7 2/6] i2c: qcom-geni: Isolate serial engine setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-2-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=6246;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3TFRixKUSBaNA/9bG5gD8oxXYKkrWW8JQJihdOw28zw=;
 b=WdcR8scR/pRQgVu8lExqLTP1FQVJHozxzcMxAscmxHIsB4VjM9N9V2EGjlNdCpuCUceUfMK3o
 1LCyWtTVdLZA85UJwpw/YJ4vo7xfmzDXFdGezmbp1IPWn3TQ5+IlGFj
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXxqR370MH4ZsL
 qQO4PHaW2E5mgAV+mmEIm8CjGkzecSDlud78nSZzgK66JxzDXq1xI400i7V3Sd7kAJ8mQAr7CPl
 7sySA8Hl9MN/WcgpgyfSHr/2enO8w7MYE1BAYaaAV1is+7TPvgH80ZPhgpP+B8sjMUNDZePAhBG
 vC7tMWQM3NxDDQCmr9UGXW43qeGIPiTPidHGu8Qc1LDVAoCMfm+DLKSPwXoKNACeSIDufGjr9xy
 RvcOZCnaJZZX+ktAymQlcps6bpwwcH6hrtom3+URLu5sdeuAXMc5Whq5FGLjiiS1oSlVghwZZoE
 TygJnJSAjy2UHRNbkj72PY4VRoRU1ejyaXUkdc9KizWP0aWl4uBrtuKhThf5+3dOS5uGJXU070p
 Y/+Kzo5hTvdWI8uDai3X3J3piXabRxlG+BfrAZr0oO2e09kM3jL36DI4a3Z9tBh8XKSoNwyKaLV
 XJz8AID9B2nCQMMicXA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a3227a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AmfWAOgrV3IZIKlFI3AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7XhckyrqBWcFZ9HXBQqFZDhYEczu3iXa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX/7b1u7gi0ASZ
 pcJU2Ufo5yK2AELKx5jjU1yrjd+sCHRMa/Zsf2xkTQpWH0VSsmCQpkU0bIWoydHm7W/AKWu+jyD
 aEwjV3JW9lZCPwGX+ZmDimjv+KHAroc=
X-Proofpoint-ORIG-GUID: 7XhckyrqBWcFZ9HXBQqFZDhYEczu3iXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization like
hibernation and deep sleep features where hardware context is lost.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7:
- Added Reviewed-by tag from konrad and mukesh.

v4->v5:
- Added Reviewed-by tag.

v3->v4:
viken:
- Added Acked-by tag
- Removed extra space before invoke of geni_i2c_init().

v1->v2:
Bjorn:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 158 ++++++++++++++++++-------------------
 1 file changed, 75 insertions(+), 83 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index d2f5055b0b10..3ee0be228d7c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -990,10 +990,77 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_init(struct geni_i2c_dev *gi2c)
+{
+	const struct geni_i2c_desc *desc = NULL;
+	u32 proto, tx_depth;
+	bool fifo_disable;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
+		return ret;
+	}
+
+	proto = geni_se_read_proto(&gi2c->se);
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err;
+		}
+	} else if (proto != GENI_SE_I2C) {
+		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
+		goto err;
+	}
+
+	desc = device_get_match_data(gi2c->se.dev);
+	if (desc && desc->no_dma_support) {
+		fifo_disable = false;
+		gi2c->no_dma = true;
+	} else {
+		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	}
+
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret)
+			goto err;
+
+		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+
+		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
+		if (!tx_depth && desc)
+			tx_depth = desc->tx_fifo_depth;
+
+		if (!tx_depth) {
+			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
+					    "Invalid TX FIFO depth\n");
+			goto err;
+		}
+
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
+err:
+	pm_runtime_put(gi2c->se.dev);
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 	const struct geni_i2c_desc *desc = NULL;
@@ -1073,101 +1140,26 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		return ret;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning on resources\n");
-		goto err_clk;
-	}
-	proto = geni_se_read_proto(&gi2c->se);
-	if (proto == GENI_SE_INVALID_PROTO) {
-		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
-		if (ret) {
-			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
-			goto err_resources;
-		}
-	} else if (proto != GENI_SE_I2C) {
-		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
-		goto err_resources;
-	}
-
-	if (desc && desc->no_dma_support) {
-		fifo_disable = false;
-		gi2c->no_dma = true;
-	} else {
-		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
-	}
-
-	if (fifo_disable) {
-		/* FIFO is disabled, so we can only use GPI DMA */
-		gi2c->gpi_mode = true;
-		ret = setup_gpi_dma(gi2c);
-		if (ret)
-			goto err_resources;
-
-		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
-	} else {
-		gi2c->gpi_mode = false;
-		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
-
-		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
-
-		if (!tx_depth) {
-			ret = dev_err_probe(dev, -EINVAL,
-					    "Invalid TX FIFO depth\n");
-			goto err_resources;
-		}
-
-		gi2c->tx_wm = tx_depth - 1;
-		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
-				       PACKING_BYTES_PW, true, true, true);
-
-		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-	}
-
-	clk_disable_unprepare(gi2c->core_clk);
-	ret = geni_se_resources_off(&gi2c->se);
-	if (ret) {
-		dev_err_probe(dev, ret, "Error turning off resources\n");
-		goto err_dma;
-	}
-
-	ret = geni_icc_disable(&gi2c->se);
-	if (ret)
-		goto err_dma;
-
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
 	pm_runtime_enable(gi2c->se.dev);
 
+	ret = geni_i2c_init(gi2c);
+	if (ret < 0) {
+		pm_runtime_disable(gi2c->se.dev);
+		return ret;
+	}
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
 		pm_runtime_disable(gi2c->se.dev);
-		goto err_dma;
+		return ret;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
-	return ret;
-
-err_resources:
-	geni_se_resources_off(&gi2c->se);
-err_clk:
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return ret;
-
-err_dma:
-	release_gpi_dma(gi2c);
-
 	return ret;
 }
 

-- 
2.34.1

