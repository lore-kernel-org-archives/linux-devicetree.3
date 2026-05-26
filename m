Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B083E0220
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792929; cv=none; b=D+HojXw8uWSgfdKxSS4Xe/sE7dNW7zP7+X3Yws8fBBVmLZ6PdlX8FyZmSFVU2S995uwXen1UP0V0wWr1TSTJeAumpGGvRSqoA2mfyEXGoSzgibmHhSb9TjjTK1SwtBjBSqqhKKmaNM6v+KJuAT6BgehO0VvXWoSLRfOcHCYHxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792929; c=relaxed/simple;
	bh=Rfnjp15jM1e1uKJp2scHAPjiSn2ivye1imZmJASXQ2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o78EtU/D/J4Z6zCwL2BUKdcVADBvY+TF9ec95lG4+Bq/t/tF3aXdQn/daQBQQeeYbqp5p7Je8jYccY/NpsFmbMgFf54hDeVCKACnpij0ImTEu4/bbAd2ODMT/0dv8wcQlX1vt9jcYP86bvmwDip1F+xEwPBRIymqHEmm9Nf8wtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+XBancH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6hSvQj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+XBancH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6hSvQj5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8piCJ2822957
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=; b=V+XBancHc9+GxtIZ
	yJjHAAz2IAbiVBfV+vVpYf+eHukvAWEBUwaZkAbbXC/ZLiZUJG1R3chRFnNTXQ4d
	6tWmZLzkrnigJFLI6oix0UpFqzFL/hauX19j7s+yK1mqtQaPkotOv3wRQEG/3EOD
	SXNhxVyr8J/gmPbQE1hwxAhiwgQohpJapevBU6YIXqh8HoXpCPfu9f64L6M6LSLW
	a98e+c8/w8HKXpt2VlWuXZF+WVa0lm21OUYieSM16JMMbMvvhfUfnqGd8FckAh7h
	3VbY6mTNVnW2+FeR5k8INE3N+WtEVIHEEa72tjiyBY7f2GG33Ep7pbiHZFuGOo3f
	5ZtvCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwudea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so107694415ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792927; x=1780397727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=;
        b=g6hSvQj5EDi9xMTbZr4yPx26bZqD+Y9FhJiMrhrEkD+WkTuZtMi51ODMJDNAuqmgVP
         mJgP12AT8rMqkeR/VIfauaMEwdLB8SBakaTUG18oZPv+pe8UdyVY2GUZuvqPFohghhoa
         yE6hfr/fnDhI07U7AQ9R1FcIZxZ+GrbsFIqmLv3w8sTCZtOHuT3z+gpqE0aMMxALbLEu
         l1b1uJYCA+hxeajDkz63sdgxEWwK2EiXD2f99mDA5L+u51dr+AmxNzfU/lfnJAwEJuic
         r5r6aVGwzcClG7+mtw+6ZMlV/N4/8dH4S7ckgtTjOzYybLVAAaNqLIF/Jck0E5v8Ijo5
         iccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792927; x=1780397727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=;
        b=WLu5l/fKbFDevTEejZWXujD70TjOxIeP3+OZUrMtlv5kUwc87VsIP1sIDx+rRUYRXz
         6uhLDPHPlYvzD8kYvJ0RdDF2poG7RTlq5j+UJQeNSIFXTM/zN4a53/gzQ+C0UgrsIjld
         2y/jSXe1yOXYhn+DWSPHktenbQO+bWJVxrJ66fT+OH0tDnXwIpe+N2DA3jw4uXEdJRmL
         X7KSdYGVZp0QnM1lo0ccxA4g1H2QFLtL52jM1Fr7MEFgZEw4MQmeLjaDQm4EadP8f9ly
         mGaeyErDJhG/F+gZHtSmFxLxhTPms2gmwfsFaINKu8k1vgcxRXD9w318Tsrtc6yx+uqt
         QNhA==
X-Forwarded-Encrypted: i=1; AFNElJ/I81mZfazQ1ZWfgbWLXcyYCngSyB4epYHOTy7b1TxnWlW41Yhfq4TdhV0w48ZXGf03CB55x3YJxI4b@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXQsLgs7NSzl370viOKeOFhHx2USqH756Ows4sdBjc8mJ3cSg
	tjj7uKCJH/sH0fenXyoTbN0PCpV5aGPe7qooMMm/PWudy36LMc4pScRbzFcBDrsIBAZNHopyaV2
	GA44/CBBTVWE1sKXNt13n8wH2vaeANxtJQxRnUY4kb3V+fBFzHzrJBGdohRz/1c3eCkfq9Tn3
X-Gm-Gg: Acq92OGqCB7GgAKRrcNRCA5LLVLqmyARervbLphhcp/7GAktm1+xva5njq5YUmijdRl
	p5p4zZgT5tZk0ah65jYCkqGXR23ZvuCgeCCfEMgBy8pxGac6PDvD44a47kJcYVtq1sWJcKMLBND
	2SGaNKWYfExDYi6blzx4i0jFif8wARv5zlJyUhTgjjdg/bsoMzLRSg56tLGjDQtTf0GLotqLhID
	AjCkc2G5DptpY+he1ZTk9NW+bpETQ/5PdzqMony4Cu2fW/1v5K8/shNZmmgRTh0jgtmP7M8ljj4
	CrrOTnAP38SXnrw7m9bGRg/j7S60bcs1OGkFzVZnO9baB2p9YCr/7RlS0zyXh+wG2nOOGcmjqNF
	CABzGbuzxtlxM/Kd49t7vtpvI7XfNEEi8TKJO2RVNLd9LyFljuQ==
X-Received: by 2002:a17:903:2b05:b0:2b2:a267:784a with SMTP id d9443c01a7336-2beb07ba97dmr192075685ad.24.1779792926602;
        Tue, 26 May 2026 03:55:26 -0700 (PDT)
X-Received: by 2002:a17:903:2b05:b0:2b2:a267:784a with SMTP id d9443c01a7336-2beb07ba97dmr192075435ad.24.1779792926121;
        Tue, 26 May 2026 03:55:26 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:42 +0530
Subject: [PATCH v2 6/8] pinctrl: qcom: Acknowledge IRQs for PDC interrupt
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-6-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1850;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ikT2v+yobAWYvn85aNUmFek9xDj3YBzqbjOx1qAX3Wo=;
 b=cgJNtPp2OIa+nkiWfB+1pWygWNxOXX7E0TD85O4YI0GWCM8ESdJtJQZRIQkgTB+vO61dv9knk
 eSEEqVlcsgxD1/IB61FkiskENrFD6FQlTTxkWnvPONNAzvp1Y9qhu/w
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: JmB86AHjQipzyViGzlYeMpbtlgi-I47T
X-Proofpoint-GUID: JmB86AHjQipzyViGzlYeMpbtlgi-I47T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX0IJmt/qaeiwZ
 1mvTATohO6OcYuqvJ0khp6Tc8VU5KHJTo4be9CPtv+PkN5XcLhYz9Z/efq34k7wnVL1x9QFvhme
 p9x0+o6kEONc+xUdNCNw5XE7Sw95yUhYD8q0Hb/I8zzZNhzkEzEZEH211QZKkb3P9UcYiqr6ori
 i9YFqLJRSjHyROCYckC1QHz76QGnnHIHwUFovcX5PWdmQKkbDEMK2kk9Ux21sc+9cSTxKI6TpcA
 BDErjkzkvXN2W3KbkLAraSKEq4LUafFWjCxjSXYNmwsif45JCfrBlB2pR0x0hnDE082GSD30oEN
 dD81DUYdtKUo3ddHmXiZBX57U/rbabrLpdnTPlaofywRrPZYIKp9AvxcYlwYeyS9f1eFY4rKbZF
 jdXIrUhs04lRS/yMwDcvugKRjVk4nKKKlwC+M8oH6xUfYZSl6aKU4ZrOFmeeYAf5ALG/M/K4EXK
 +s1JMaAkeQBk+YLSHwA==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a157c1f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6yEXv96CkH8QcgWKpTkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260095

From: Stephan Gerhold <stephan.gerhold@linaro.org>

PDC needs to acknowledge incoming GPIO interrupts to clear the latched
interrupt status in secondary mode of PDC. For level-triggered IRQs this
happens automatically in irq_eoi() but for edge-triggered IRQs this needs
to happen as early as possible in the IRQ handler.

Implement this by using handle_fasteoi_ack_irq() as IRQ handler in this
situation and forward the irq_ack() callback to the parent IRQ chip.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..c2938494c6bb 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -995,6 +995,16 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 			msm_gpio_update_dual_edge_parent(d);
+
+		/*
+		 * During early initialization of the IRQ hierarchy,
+		 * irq_ack() is called by __irq_set_handler() before
+		 * the parent IRQ chip has been set up. This is why
+		 * we additionally need to check for d->parent_data->chip.
+		 */
+
+		if (d->parent_data->chip)
+			irq_chip_ack_parent(d);
 		return;
 	}
 
@@ -1069,7 +1079,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
-		irq_set_handler_locked(d, handle_fasteoi_irq);
+		if (irqd_is_level_type(d))
+			irq_set_handler_locked(d, handle_fasteoi_irq);
+		else
+			irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		return 0;
 	}
 

-- 
2.43.0

