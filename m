Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C577440A0C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011252; cv=none; b=PqfgQZH3XEY1pS/yxQpjN2nTU+r6A2O2XWt+dz6t0zC3kOsmX/Y4pVWMxbkMsWjlJKdgbIaYaogiT/c0rUBp/3J70sHkB45Bj4FBeM+4FjsEG4TyPLkT1cF86PzpvQm0NCgthtE/lRwMrMbi7arqCkT6R7xZVXE6+kJh8Ge2z7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011252; c=relaxed/simple;
	bh=V5V5s6ABXoH6ecteKraTt569MwVJ9lwyTYOAYyLIlWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+Aubll8XSOPvsu4wR54zAeKHysIfyhvL/NMC0ZzmLNDPPApAo2byuaJMNDH0fnmcOx41Gxx8s/0t14DSDoI7yBbQYqM4gOLAKVKDmzhjo6vEoFWlN2es1gkxcX1aB6N5Mv+it0RxWdtCqcBmGqERF3cJEIY8a8ClWWUZy6v9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+xCT3Cz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE1LoVST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+xCT3Cz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE1LoVST"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769o17m1310096
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=; b=m+xCT3CzsTA6brgR
	f68XPWovoeySZ9NDumAJ50iZorjaymkHUuFVL2u6/pVcqdpifEcXmKjyO7DZISwJ
	pprDhMFVgoTt3lB8q2wA69T4EOpspzkZLun9wwS+5r0T9rrgj6O3uLhxdXUgh+p8
	sIvbK8aLSO/07hxaIhCzI2J5aJLlpRxOF2R6psnHceX8/fmcyojA33kSgiDXufor
	jBfBIxzdtlcl+wm6TfBGaKSImmWFc8TocJP9reVflUrR2ggcVzr++eE5BU1+Y7AT
	5MjAhgsg5j9ZOV0EhilxU1bnd6BDgBpS17DTznZkKvm8UWN9F7qKu3xnIBxxq2gK
	HWof4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728kyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:14:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so3510976a91.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011249; x=1786616049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=;
        b=YE1LoVSTVq5vVMnM5SLSTvSTaWNViXltihBiIdbKzbuWi+bFVqAwOCYqZ/BF7CXVZR
         C6kY1Lmc7hF1xyb7XYVMUGaRDx+Lm6ets5q/OVQlFktQTaluQ5aqRaxHMJSeJcYMVP9S
         excs+JoZQXpuwG4o1g4uMt+sPvlfwmyhkqcH1ahTPdTH0QmBlOJ7QxKkD9+xT7WX3BFk
         4IkPV+HUorvVaDPEjVVEZXZ4QP1VXFOWnIV5KJgTjFjUKYvbCzEYOHLv8g158ncvDoRN
         itxzhLQ/OEjzsJh31WKRH5QTMXwcDtTbNN7dgv8cYkx4gGBJPsM7RgilAhpWrlTsxOt5
         Ej/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011249; x=1786616049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=416ezvAa7vht3zxlOak+Weqz9U31JUNYz4MnW33AYGc=;
        b=nuMURLiHgUAYFSYG+Ly6O1GeCAQhXOyfmNh8+itrH2htLA3jxaokY6Z1Ek4UHbH+3s
         jxbzBQt81CPyCeg2gOM6OHT/txBDUKAhHn4OB0KS5c/+y34FeHoyIk12xa/90iYAtrsQ
         nVowUrYmIggoF24dlgWZnB5hv5sSETj9q4hzSZnT2fUwmWExuRRrdBuTpLDauAQ9R3pi
         cn9x4Wo0nrjkmVk7jSqSatL73Mtc+Kg93FqxIRp0eB11lVfZEOlZjFXMFGT7ZyOokeHU
         KTWyj+44dMWKOHf/+kr3vW+CZ76mzUGK82vr4uQ+ux/DvEtRmzgQwUNXC0CGUtLRy+6y
         1zDA==
X-Forwarded-Encrypted: i=1; AHgh+RqnLZVLJNtJfqySJfiPuJDDtXT9owWt9+DrWswczL34koRDZCYJlHftmKUnghWgvNnBqmHCl0FSHZ3R@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqq2JnCzXeTY7wfEsvzTK+TizQgzemmxtHomktjgR6SFjXAiw
	mfmBC5PoR/UxYoPlouaYlUI3wGSTT6BrQ8l4xt2QmaaGLmujXJ/1EgzDjpbR8enfppQj9u4Wa6t
	8XnHxbp4DwxerlOSU7u923bkiunvfzJoHLUPKoLKTJUYQ70CUp4RUxVmMS2rNMXvr
X-Gm-Gg: AR+sD10A05gnCnzNUfkiEtXQ6MZUBdpeaBVIWFqMZqxsaw1fuwtUYNNdBTUBBkkkXnT
	0l7b/aGrvoNuGUovZj4WUPtOYtfCiDUis/evT/KeIU32Gz+CrgrTAsv8PDZMZeDQjvtZLQurXzb
	AqMqCkz4rAu91tlSL2ewAsQYm2YyXr2UA/V7Z476PlLzvZ+Xkob6KJqUEIjd8kfuGAOllop/2+V
	5g3VhigdlCLZpMbqlXGsBXFlYtqCxIBefSwS/KZWkr0pR/81zgGRZiDnsgpKGrLpAc6wZvAF6ZE
	LeSpUy5C27/ZDPcE8KtRLks/iqVJkG52iuNnFGpiR46eL1kKMV6emuMaEM6f98B1ZcEHB6XUObF
	h7/k+XtOA2oUbAEFQTw6sRlqNwMRuLiuljg==
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr15100517637.0.1786011249083;
        Thu, 06 Aug 2026 03:14:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr15100334637.0.1786011247257;
        Thu, 06 Aug 2026 03:14:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707c9970sm2668814a12.6.2026.08.06.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:14:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 15:43:45 +0530
Subject: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786011233; l=3714;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=V5V5s6ABXoH6ecteKraTt569MwVJ9lwyTYOAYyLIlWA=;
 b=FMqYfS8Uf9RpOP4VVG+4mnDIrNxYrkCSfp21CcgNIAgopjBtrmSVUEWIIxyI8VxaRQhKGu2Z8
 CrCK3k22DeNDAem4S+X2BvPPJb+XzbcxiXm2FPJSDezOG/I2boLUKgm
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: jjw4mqn910YQuyQmmrxTlH3WSSWEs34K
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a745e72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfXzVxacc8QIRKW
 J+wbSWbZl1VbR+Gx0tWrzdJoNGp8AEqJmpIE0rpSGIcNcW86evxFRRvMG7pLpGSGTjvB3wRVO/Z
 D6NNQSdBjLmzCYZLSnOen+jY+IJ1qUQb0xNEhszm1EqCM8FSvRTcl7ARviWkfnaXtbkk26y0Q6T
 138mg3yfC4KRA5URpB+wn5+pe9m7OrUu0w5aKzKpWCi1ta7jxdq0UZPmge9Vl5qpv0cKncFOHhO
 kcMiDCRvSG6Hhh8xRjF5QUEU2NqPYIbRUarepCgwbWPEeo6abzyOOlKpZtYV/2gdxSv3jNsSDPV
 G7AaM0g7SRFQOpy9xACEjFc5dTWKVry8dz8dx00dP65kYbhlIQxwkorWcVUL1b17TGZK446wZrE
 0Ru+DI1hvmIN+rYq66oztrSM2L0rdxZNh6VcHOJaq2vfuH8cF43yWJq7Kbd03YnVygTtZUUxlih
 vZhviOqo0lSlke9bVqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX9gWz1fOfBc2F
 diKwfbpwOb17MSdn4TCxdP3BB3fl/RD58TFOnC8oKr53b2E/97YLIAck6IR2oxNmvMJCoqFSZw/
 gxkRpMrom2uzX7TAeq8BYHXgRtD5H9M=
X-Proofpoint-GUID: jjw4mqn910YQuyQmmrxTlH3WSSWEs34K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The GPIO is optional and requested only when target mode is enabled,
using devm_gpiod_get_index_optional() so targets without this signal
continue to work unchanged.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d262206ed663..ffb8871a55d8 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma/qcom-gpi-dma.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -113,6 +114,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct gpio_desc *target_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -171,6 +173,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target && mas->target_gpio)
+		gpiod_set_value(mas->target_gpio, 0);
+
 	/* The controller doesn't support the Cancel commnand in target mode */
 	if (!spi->target) {
 		reinit_completion(&mas->cancel_done);
@@ -928,8 +933,12 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
 		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
+		if (!ret) {
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 1);
 			ret = 1;
+		}
+
 		return ret;
 	}
 	return setup_gsi_xfer(xfer, mas, slv, spi);
@@ -969,6 +978,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 			if (mas->cur_xfer) {
 				spi_finalize_current_transfer(spi);
 				mas->cur_xfer = NULL;
+				if (spi->target && mas->target_gpio)
+					gpiod_set_value(mas->target_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1012,6 +1023,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 0);
 		}
 	}
 
@@ -1116,8 +1129,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->target_gpio = devm_gpiod_get_index_optional(dev, "device", 0,
+								 GPIOD_OUT_LOW);
+		if (IS_ERR(mas->target_gpio)) {
+			dev_err(dev, "Failed to request GPIO: %ld\n",
+				PTR_ERR(mas->target_gpio));
+			mas->target_gpio = NULL;
+		}
+	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

-- 
2.34.1

