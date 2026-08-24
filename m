Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3B43F081
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581584; cv=none; b=YS4W1CNETY12sGp4C+M0uYPvCRYt4fmzuIDndbXzgVhhHo9tPNQA64MA/PxlFEbDyHh1JEl9OMKjXPi3Kav2J7L40FqMBiRPlug9piyMwcd6nf8uKuHdvCKBeXUy8mhESQuj0Cl0J05G4lpSA81ZiAhiARlPMudi9kyIfg2ucGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581584; c=relaxed/simple;
	bh=UvVHpzmYAfm8x8s9r5dn96M9ZLyoJz4Am9wFhLKObB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4fDLxg6KaDEKDF+/KYc9Egs2n067lA/8ab2LM+tcRCjOJDvvjd5E40ygy9LMLIdYF3W4Mq3sOAQYU73dRbuCAnvsAcPcaGDt5GTv76bKTJc+b13iP18ksrn9tOBhqKLspEUcVtRq1SBOK7IUQU3QvQUfM7sABdvAywomx/e5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZ5w8YL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKwz7HbA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZ5w8YL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKwz7HbA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv5a02006633
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=; b=TZ5w8YL7tZ9D4XNX
	Z0avjLn3CoGWJCm9YJIX1Ud4RHpsOKrYTOxHpgq6uMR4tN/h3NhJeZI44iqD0Fhr
	KP9VGI1+gRlBoFtEOzVJAwjVuICUbiD/JODsHTOemIXREBeLhoe61Ny/phWGU574
	USrlXlTXl6CJCy756HBk1abakKjx7QUaybi2JAXUO/YT6VpBttUws6r3lHKsR9eA
	oMJQ9+LIJVwtVgaMenj2NgOW+zuKK2VPo93fPYm9yo2bMMjXy/1z3wjh08o/dvxL
	tRnBi8RXv6jOHnZsMzztUbfWBZ9ftWRUi7FUzOj+rDNw3IrZJJHiCoWVXu/RtCZG
	Lnwy/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv791ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d5d00fd19bso69684835ad.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581581; x=1788186381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=;
        b=jKwz7HbARe2kNNTwjkdsIePbCAkoXg2sEUgF04I611m4nODZWEHHB1cxnife6RmQQ8
         qISB3gXWI38kIjjVgp2Q+IL7CZdz8QZF00S60ZcV7+OQyGhTnJXqWl+6NSdSiiYy+Ofg
         Z5mYPFA+PGzLT89fztDB7mUnLZb67znB59FgEMoUZGN9l+9cNBnGX/D+9l3uB1L4Q7Gb
         fTSap23b8UY9ox6k0A7w9tqk+kQ4TNZOa0B4v42I/zgS2F4MhY2e2O7zJIdfsnzJs7Cx
         6SfBgsG28t8wsrhseJxyTYGfB4bQDOClRIBlQnbZViUtPd/Re752n36D4WTRmk+HsDB/
         lQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581581; x=1788186381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SReanLla1WlrfhYe7C5Vi18U84iOx3ldphBDpFUirk=;
        b=TgmAKvcqVFO7/ME02zhT+fACoc8N2MK/FlzCrt6mogtogSv3VqlnVOyFSIq8EIJBPv
         bgPy73UpHm43X3DOUCwliETGBXYRYeo8jV/i6EEF4TGfr3rqnNGSYuhh0+8A9BUqYvRh
         VryyeUQH5a2VmPNK31dKhSpB3QekbCJmXlyrW2R9sp1uzFES9SAMp9z5BjEKduESyZjK
         KujubYLV35QbwlsdqXniFEhwXxG2nBAukEOIniz+mpOfaaAEQdoso3rdq17GO8ORvOxG
         D3kGQL2ZocdAWZH/rFBpPPU26trzADcoAmg+tFypT+D7odqstSJpbWYmJ45zH6TcDBbf
         49ZA==
X-Forwarded-Encrypted: i=1; AHgh+RpEM0ZK5uFhT+t5gfqZSltax3TKDpTFpApv2vdgtbpKhwe4qUuEHkrfS1vhCaln865bpL4mP3plf5vg@vger.kernel.org
X-Gm-Message-State: AFuF++laHHxMnzLtmEIqhbwyClhF2j+GopvtcQxBmHiSjA6b46O0Cu2Y
	8ixR7EFJj9FEQnmfrDCAhzJHBUTSUegVNdA2Uk5jgS9OOD1Lz5TW3UcjE4ti48w029kcv5icpto
	VHEf2z7JyF0EyqMYRx55bGHCEXKV2CVRWcjjHsTYBmKbxeoT8QmpgeyanbwROt8Dc
X-Gm-Gg: AR+sD11FPVkBDSbYSQr7YOMrac/SltqNonrI7NJEjABL+xx3KKR+5Sw+uS6g9a9qKez
	qowsB4S/GpbZm1cUR4SG4ptloc0N/xA6tXxEF2oD1XNlk7olE0zrr/vlRzK4AHORK081rJsOHq/
	OgQdUWNuX2chHDqTyECPla747nlikNmO5xaER2heXal1U6liyTowLqrYNjtS0aFIjk4UYYGDzz6
	Cbgy2HM5ZDxz6on3FPS9LAy/QbJ6zDClyX87BzpsHv3bEEIRqLlOUWdzL8Mp4lZIHl5VAiEKySx
	bwVibJv5OhTEal8fsDQOrLb3FqRXEHbKjP4B4EySZiB6lK9ZDEL9Irk14wdX4rzeQRejrfceVlJ
	SJkonKPPNF4UzZkXjqt1wRhpMVMc6G7ynuw==
X-Received: by 2002:a17:903:b10:b0:2d5:cc73:c744 with SMTP id d9443c01a7336-2d64aa24c1cmr511930565ad.0.1787581581527;
        Mon, 24 Aug 2026 07:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2d5:cc73:c744 with SMTP id d9443c01a7336-2d64aa24c1cmr511929125ad.0.1787581580922;
        Mon, 24 Aug 2026 07:26:20 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761fbcsm18523275ad.4.2026.08.24.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:26:20 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:56:00 +0530
Subject: [PATCH v4 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-2-fde2ebf043db@oss.qualcomm.com>
References: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
In-Reply-To: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787581567; l=3820;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UvVHpzmYAfm8x8s9r5dn96M9ZLyoJz4Am9wFhLKObB4=;
 b=D+LF41ff00aEPftNbkzyMj7eBA5Wwwnv7ov7txMg4VGd1h+0I14kFKGrS1/XwCGh99RlKPvG2
 1MthrE1hihrDxrIDIBlrydaX5Dbi8vNn/r4al0kbsjNxo7TN+4IeWSi
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c548e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX3NRhvaRoCkSg
 7HNsLx1aNBcJNYLhG/fDimA2d0YlMelIeJ8U81YAVLVMu+/Dtlma9LPV8/oULqQVnl23YSMFATZ
 05RIgrK0HX4SkDZSgXhTXVc1E2tEeLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX6gFifKvryI6o
 CMBjk52EmTnmwUwmeBwNnOa3tFSKXDzpURJuUr5oFjgrPDm5gZHCSPeSDJlm3nu7x5LKfFzBbCN
 luKhJ/pI0oDl6bty+pusTdo79aXUiIvSRn0WnlqKscDRdFg/vBRZNhoP1AS0pt5IC6sloojd/uX
 uMa6PsrteSBPZoZFdbltJYc7BXNQd93NvV13TF26tossHCIhJL0MUUxe/EUVDRwUOrDJzBRmdDg
 vkrlbvbFzU9uR2ER5h2e2j+aCGalZ9u5ODOhHoQngBRHzAWLFlcML2YoNBaukdrkfmD2twxNK87
 LGZvuXY6m1Es+2lAb9csVm44xNcuIzp/NkGFA7tPDxsvPflhVa+hkFnYbn41rf+WiUCV79FsJ9S
 qpFAtF/+R+KT7ViSOae4ujiXOcRCPzfazNF7Cl84CWbCSMg3xR0TH2bEWQMGcm+h6x34Wo5vBcz
 +wuzBnLM5Vyijwdw/Sg==
X-Proofpoint-ORIG-GUID: ygR7_obDnJEudTs3EQVJkcpSQ04SCwE0
X-Proofpoint-GUID: ygR7_obDnJEudTs3EQVJkcpSQ04SCwE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240121

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional ready GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6c57f8309a3b..fcf5c3f057b8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma/qcom-gpi-dma.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -115,6 +116,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct gpio_desc *ready_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -173,6 +175,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target)
+		gpiod_set_value(mas->ready_gpio, 0);
+
 	/* The controller doesn't support the Cancel commnand in target mode */
 	if (!spi->target) {
 		reinit_completion(&mas->cancel_done);
@@ -938,8 +943,12 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
 		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
+		if (!ret) {
+			if (spi->target)
+				gpiod_set_value(mas->ready_gpio, 1);
 			ret = 1;
+		}
+
 		return ret;
 	}
 	return setup_gsi_xfer(xfer, mas, slv, spi);
@@ -981,6 +990,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 			if (mas->cur_xfer) {
 				spi_finalize_current_transfer(spi);
 				mas->cur_xfer = NULL;
+				if (spi->target)
+					gpiod_set_value(mas->ready_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1027,6 +1038,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target)
+				gpiod_set_value(mas->ready_gpio, 0);
 		}
 	}
 
@@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->ready_gpio = devm_gpiod_get_optional(dev, "ready",
+							  GPIOD_OUT_LOW);
+		if (IS_ERR(mas->ready_gpio)) {
+			dev_err(dev, "Failed to request GPIO: %ld\n",
+				PTR_ERR(mas->ready_gpio));
+			mas->ready_gpio = NULL;
+		}
+	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

-- 
2.34.1

