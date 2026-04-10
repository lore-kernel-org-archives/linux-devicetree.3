Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E03E4C74
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846534; cv=none; b=EbFtw0Dn6bgias9c5zdDms1lu3H40bXiLLQ5La5Dq+1nT9l8l8yBFenwLNuSULg4vxKLPe68Xh/gpJxdCfZ+KdEdgLZEL70Wgm46SsRXqTCF1dUfUWqpR4fBe9B3CHIDcBr5GHH6bR55m39OLxWrr1wAxE0CM0LRoBnA352+huQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846534; c=relaxed/simple;
	bh=xyArX76Xqz+izb7H/ueUcrZPNdakdpGh+RzpHhujRNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rb1uC+KETQCt0YQfI6ZrpHUnqxfTSgYzMrLaHF4ndBhI1r8z8iBJkSYkkx4z6P8sA4yS8ZP2uztA7q3Z3gmUSEk78F/OVhTTeT3gL5zZVrX6CxB8XCcAp3t7UlSA0awUsh7tpqEaItLPA7I9B/hfVWJ/Qib8oX1K5jWiKbetUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTnrRsmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj3+eO3a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTnrRsmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj3+eO3a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH4WE2709104
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CIW3MZ+AFgJ
	HcOuoXboQfh2mjI50RXd14rVdL1yRUF8=; b=mTnrRsmGSbGM8p8XXXFYeCY6qTH
	hyLYUylXvxRJelPy7rbf6X56N3erWnZF0K2ADRQJ143pp2oLYKLW+vfxq1KeqRKA
	1aniqiZwUZxzf9avEJEL9KWrbZ8lkHv+le/QCknhvti9sqguwXrulaQRxHHg7on3
	fMb29xiaMBbUgNJfnbl3xh9T4TxtOqPS3Vb4UtXYpQky2GUxIGjl/K2DMYvU0e4m
	//qcpABXxT48XZXLVPyAExv/zKZANWjNIUv3lNycBZidMywujvyj6Y3XYCiXKhcd
	4zZQBaoofq+lsSr/M5DdIcM5C9la7ZfPUVuoCsAp+gGyZrgGD3XO41emEag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c83bd48afso1279242b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846532; x=1776451332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIW3MZ+AFgJHcOuoXboQfh2mjI50RXd14rVdL1yRUF8=;
        b=Qj3+eO3aIGxzCAStMtYgmh87Sm20JtJVGAFeaCIuSlQobNc3DImoX+qv9+n2cvqiUK
         9q/6qDMMKvS0wMA+ckBsmuaLkKOw/kQare1FmRVl1FuXD3IEwb/67DcWKMUft1z1rNbA
         +FlBZY77dmKikuryEN2Bo/Hy4Uen0H5ZubC+Yq53Ev/VKWNXpaTF/XZfUHqcW4mN/4D4
         qozAcYYnR67ZXAR4bWSR8b69T4bAg/FfkH+H2d6Zybi4Poy3ukDTeDtXkrd0TSG2L1ZO
         ebjKQzgzQr9m+jjOcr9hHw76irUf3F5b3chDyMR8GnbbKFUmec9JrRywgRXmI+lgeccL
         90qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846532; x=1776451332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIW3MZ+AFgJHcOuoXboQfh2mjI50RXd14rVdL1yRUF8=;
        b=B1Fml7YeE5lwMwFUPvT/tS9lxTtYTCy9Sua26wiAoHvd9FGwO07ItEBUB/mWZooL4p
         68tvAR/ha5Fs64chEEBvm73xJgU/jJI9abNUPNfgZ/lyuMh/vnpN6zS6MftnbF09M/Hl
         7jj/RR/siAYkaFvQlbTB3+AsbDk3dF3D37vsTt6GfCIHQ60VBZa9z/qGKEreFuc3OZ35
         P07O2GUhpXOcg8KqCcIeKTgRsPmtG8QSrz6z+6WGDh6XxFj3HYgruaYLGStvcL9me27I
         TgV5AlB+1czmnIdkWMnFRo+j5jBdS5QY3nxXDbknCcnc5KF6Ub/EYlzOy8C9pRKsAxUL
         vN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW058hkbozNIphkpvYn78Blm+SMaCsdCxbxVVWU8J9U9yvKH3dcgA88fGU7dnx5TE8LqLXodCfUht5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/RdWTh9cXHvRPtnJytoVwiUBwLX1hQBypenK6gnSQPvL7Brr
	O5yF1FTyrd0Cg9oeawYRJllRicvcWpgSC1y9uJUSFXqusG+oAWacVcxZf6tiiRKHy2ZatPckLuN
	p8z3eZIp7n+FWLfANn+84mVbueiEn0Ywgi+1udnxAadvVxcgOH3vJOWdAfvMvMS9H
X-Gm-Gg: AeBDieuw6ptz7JPkfDQwv0+hsP7EEyEZyrQKW/8jDA/ViVZAgdwOi9X18YoV3fROgFd
	zleVGU4Y1EJYiV7m9bgr/OiZ6USIAoYcRh+Gm5ofeyEhzhQG2bkvOehEh/gE/3X2G710Za0ozi7
	J79Mb+JN2ZJfIzR+G/0Qbd4z2rh1z+0tRa/UxjKbwsNrPRMMb67pxHfJwTcZcUfTc1i90WsB7j2
	qfAs7q9QyWpAYo8ZY0RrZjZx1zVtVxR3QhtYe8WbG4UlwRPDyVIHUjRAYhFFfVIaEQ5Dm0FjqTz
	DgoiovU/4KSrRuPRTiAo/itJVgYFF5K4r5IzYxQRjW7d4Kce0ES7LmH/Wj8A8KDbXAOoDZ+FAJR
	Y14qJV2Eq7GHA7+OumAQyfhz8cgTBuVSRAansbhPoJtQ0odBG
X-Received: by 2002:a05:6a00:6c88:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-82f0c24e1b4mr4025946b3a.36.1775846531517;
        Fri, 10 Apr 2026 11:42:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c88:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-82f0c24e1b4mr4025916b3a.36.1775846530818;
        Fri, 10 Apr 2026 11:42:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 02/35] irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
Date: Sat, 11 Apr 2026 00:10:39 +0530
Message-ID: <20260410184124.1068210-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ThLC5nTix6pk6soi8abuoayYpydV7N4T
X-Proofpoint-GUID: ThLC5nTix6pk6soi8abuoayYpydV7N4T
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d94484 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eikPim43zSuFQStimlMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX11QmHXfgHrnk
 SY0tUVTe1JwyKTugBeJq4gJdbOWj3AsNd6Y6fMo8Orh+Rn3crsziIqmK2AbNZg7pmGMbbsUJobJ
 UyscyGAOYRph7nXe9cwMfAaJ3rugZz0WHURwh7Yz9cwfewQMdn1eg64/7gS4q75jGtSgJAV9eTy
 +eq/Oht4N7xqWUO9iB/fUdu2mMb4xoVydKCATV8mPIlEcaHAP4PKLbBN+GbenJjN+lu+A9g2THO
 DGcejCgXw9rL09Arya/YM6W5K4L/n+GshbyIRA7mNHgsNWW+WpGcbWbYuydNbskEB4CYTkqxjV6
 /+2/iLRQ5lWsjTuTtvwy7S7krGkLiLaeT4K/uPTllByYb5QMD6f/3iVvqHozxSgUlahJt+DPYx2
 Y8rLvm8g/nsD7xJ3iWldDnMrdlE0N77N8hCQ7isuBEvTgtIoIX5OAjE8/3U8aiNvidPOXhsy/9E
 YfcMW89g4CQbNP9fcxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The __pdc_enable_intr() function contains a version branch that selects
between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
HW >= 3.2. These two paths share no code and serve different hardware.

Split them into two focused static functions: pdc_enable_intr_bank()
for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
change.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32b77fa93f73..a72e32896e64 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -97,28 +97,38 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
+static void pdc_enable_intr_bank(int pin_out, bool on)
 {
 	unsigned long enable;
+	u32 index, mask;
 
-	if (pdc_version < PDC_VERSION_3_2) {
-		u32 index, mask;
+	index = pin_out / 32;
+	mask = pin_out % 32;
 
-		index = pin_out / 32;
-		mask = pin_out % 32;
+	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
+	__assign_bit(mask, &enable, on);
 
-		enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
-		__assign_bit(mask, &enable, on);
+	if (pdc_x1e_quirk)
+		pdc_x1e_irq_enable_write(index, enable);
+	else
+		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+}
 
-		if (pdc_x1e_quirk)
-			pdc_x1e_irq_enable_write(index, enable);
-		else
-			pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
-	} else {
-		enable = pdc_reg_read(IRQ_i_CFG, pin_out);
-		__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
-		pdc_reg_write(IRQ_i_CFG, pin_out, enable);
-	}
+static void pdc_enable_intr_cfg(int pin_out, bool on)
+{
+	unsigned long enable;
+
+	enable = pdc_reg_read(IRQ_i_CFG, pin_out);
+	__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
+	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
+}
+
+static void __pdc_enable_intr(int pin_out, bool on)
+{
+	if (pdc_version < PDC_VERSION_3_2)
+		pdc_enable_intr_bank(pin_out, on);
+	else
+		pdc_enable_intr_cfg(pin_out, on);
 }
 
 static void pdc_enable_intr(struct irq_data *d, bool on)
-- 
2.53.0

