Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809655;
	b=Tm4dxneFq6QGNtxO8EFw+5yV+E1/K0rYGv+D6zhgSYzG0T1Ce7/FK1d5FatvYpDb7Z30
	 bcsvIL4nF/dpGdxXY9viEAvgo95fKrDAbnCVO1k1wC9Psn4P4Fe6nHoUr9fZotIpQt09Q
	 EgDO3EjXNPRL8+QpVzCdUqCcZU//0O4ZYz5hw+AQhgkV5wFCPjVD4sStqlJalEsqZwr4/
	 6KPTID8WMtn5WQh7e0x8PJYnytUjK8dlGlqDWUFd9u85uPyDd+60d7vs7NxAc8FOAwE3+
	 vYwajQz775Ej3RaCsjFMTq1dBiQRRanmDx5NIyXCKgJL0qrY9iSF6Y9Aqk3o/PfzFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
	b=FU/7HldjoCgnDrGQwZs6VNG8ExG41VQPnF/4haMlbdgoKZwVokDFGW8wBfFSRLvGL/xK
	 QLQzpMC6qgBZbga6FU1n/5/K3HoMcOlnSdlKnAMoXlUHF/fHNGQXrFPi5LqNvZZg4hFLU
	 SkC4zP8dOOdshDC1bkvoqNm74S2vqgzP85B72rdK7CYK5NZx3jiAkZh8n0v9ncV0B3Kof
	 Vqr3sDV/Q8yEhegEGmVSxNIKt/V49QvtQ863DgfLmcAUR1SsD1wXrck3jtweWwhdxV0a8
	 Mo8ryp/3uxMUjv+AUtsn+9ZpCOGRmsTS1uZmdubP5ZyH7tm3rk8SU0zPLvxMt9A9I8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9GTQgJ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j/BXIFId";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF8606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAF8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9GTQgJ5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j/BXIFId
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LFKh2879974
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=; b=I9GTQgJ5fThr88HA
	6edxzgJIp0tO7DvV/Lt9ZHxPh3vHNmbtGosDzAawp/UL4EGAuBVrVeuEYjHSrIh0
	QfqYliwbQbFuykggLCrfqt5Y7vUDUXBtMF41+BxvvYYe6RL9C17PG+oHzx1gh7Mb
	VEheSvNSqzD/i5pzSKHuALZxVUPQFRFT1yYy3Gw9K4Rkeptem8ckdsFfF4jxKWSH
	ak1gefkkCZS39jdNn/XuOi/jpVZ0hxW6/0/fvRX68w7PMcY8ooCIxITDxvLYTphr
	bzSvWkBRogcqEXNnX+4dDxKUFwoBUyu2vIe+DYuIb/eEHLvVYumFe9vBIxnSuoDE
	ZQ5+kA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj453ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:14:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso1531555a12.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809653; x=1795414453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=j/BXIFIdz73QswUnQNQQsptyOfouJZK4G6kAkWCpUkCb3WMzdr2zzCp+bEMeWSFlQX
         Co/lujDCjNMO0pWqTLmZ8m7ag8iBJU5Dv2uEEUD/cvmsvzRPKogzqUr1DcXNlGD7evQU
         uj1Wd9fKpVfXkhfR2mcpi+KbZgU/8UArFN+4iBo8KGXCHHW/l/J6LA66DjNcnWv55enN
         05st9Yv03ndCescxZAb3G5Emh0OwP6ECMugv1eCA3F4YhIuvA4OruDpqBmImvLidTmf7
         0/n4tACPp6HF/RwQq6iiGo+NS+6WEuEZaH8+VgcpYDWTuGnlx0AWn6FLhgWTHvAsQfOh
         /ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809653; x=1795414453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=HhYccSyrqGMAjEZVojFBWSoEQKE568m30nIw0evCdYHeZUiT0tlMJP3B1AKrDGwa/m
         y8zq6/SZhKWoR+GFvC4FZq4tN5y8FvAuoU70gj7MGZyDoln2OoDsxQqTUGEdyznGXelR
         ymn87netfLfZbznt+p4Ti6XfCPEMT84jDaqnsSIfYJo3PXt/e8ed1x1TpxJff0QB/6aX
         C7GJwVP9UziJiUltRV2V6Tab3fGtjLKbNBadQxhxGelRX/WxYynAmMmzdAjRiRX9mW0b
         uT6buORBtvCfREGuPtuJ5tz8bfg68I9K3xMIdu5e0OqbEeygyBuYTiOAOvNu+fP7X77m
         yOHQ==
X-Forwarded-Encrypted: i=1; AL+hErH8GngZa/dNH4oFXRKtHago+exxzMTDdq3LuirE6NzMB/y/egTjC7XC0fFYe3cmT/KxSiYYGbb5HHcZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8llPyZD8VscAuIukLFHda2c7M+jhryRyL+ZBUtp/fSH5u8mYh+
	hYLna7MDW9YSWiIuwy7cY7QfPnbqUgSG+0Bv1RtbzNhJDCaAwAUTud3Kq08Sov7a2Qc4mfB+ORP
	dOMVvBCumf3BfB8C2pP1Ghrq+zTIiGLcdCJSY7CK5nycGpwDPeOlxgyE+nvVlpOQo
X-Gm-Gg: AZFdTZcpF/IXzjqovOFVh4e34AeHk8KBGERTaZw8TLjZrj6LimdgTb8rvnYEBZ9PLoJ
	LpM2lDLQTAKiZvvBLbFsgoshfPJ092sQBdCUI5nRncfsU2DvhollO041kg9Gq+YMx6YDgTnsHFw
	e2QgAfjJi38f4bnqOSuLxaIFVl864vhfc1+e8Zc29QEGYrQ2xv+6l/DVChcr/8ZB0W1wG3QFwXk
	wbVIQm1NbwuwaSEgzvKkxOQPyRnbb2M/Nw8XTErBwaLmyjrc1zfJT6zcBeezG1Dpw+eA2q9xiXE
	i8QypGGqX+t3AAwBwR9fPN1gQpshVH8lV3qKlDjVkCNCRAEzEaFhx6DBJLN1d5AFu3H/Eci2lu9
	+n2JW7bXTMayqsvgbuad8OdKftVstmPz7ANIELRU6Hf4XNJ98wA5UetnzTuetaBBCkToG
X-Received: by 2002:a17:90b:53c4:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b1b0b531cemr9902977a91.39.1794809653047;
        Sun, 15 Nov 2026 22:14:13 -0800 (PST)
X-Received: by 2002:a17:90b:53c4:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b1b0b531cemr9902943a91.39.1794809652577;
        Sun, 15 Nov 2026 22:14:12 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:12 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:23 +0530
Subject: [PATCH v5 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261116-pm8010_i2c_support-v5-5-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=5611;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=166k5Fjo+XzrjC/k6aDFuh8Bh5vkTImFiY/av/N3V9E=;
 b=1u5ObNX3LHlif7sq5a6AC9HdPT6fGRodYuUuTAqE8G/1N8A/n7FuhEhGds6Mu67bbmfbHKY4w
 1g9+IBnULP2BfwKS9M2fG/VvWRdkQTa911zMsK5SEfZ2/g0/E52cLjv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXyPRTcZ8pv/HP
 CdnYR7SEk6tPVn7G3ImVWOKALbMJslnAXBZkNQfdMtg/SNltMpnBQPIoAskXc9Da/d7LJ5tSm6Q
 mDBk2qcdfYnlH+pGC+LKdQ6Fllcoc2RtfsEOWzZ9SPdxtRFApoaDDi69zcS9RYrfJ9ITgFF4k7b
 wQGK9exknXR+XJEHNB3ZKRcHzOua0hnbrOMpQ9ODSvkIgWMsLSRQr365TgimFD2hMUYFJlDMEl2
 PvXERmVGBmtP/IZCqI7vbZNXnJlKx5NlOJv1X0eVqSdssjgwZ7eBwV//1viw0wcMHw/TA2Yzmoy
 tBMnv1Da5WtYiOrvvtVD9CW8cOBe75mgLed1keR8lnpVhJCeZE5dq+oKXXVNtOwvb3qYLwqrA1L
 5zFLanYwrX+9ruKohC2PPokRMO0un5ua75kz9rhXQoBEbZgE9OYGduSUo2bk7W4ZDGzgTByEikM
 2Pbtvm/ANWhzmLxaOuA==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa9f36 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: BPIL3H6RqXH4WhP0Eht8suxNPEG4VdLa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX9LaDFH4PO8Xo
 cuaM9ernLEzAJ7uryH7xK3Kv+VPk7GKFGQAot9ydJTeJXTX6Cayg6jxZKwm1IgA/E4SEt8FzxTD
 4sxlwLwm9x5jh3F9QCTyGC4+d5z9xFM=
X-Proofpoint-ORIG-GUID: BPIL3H6RqXH4WhP0Eht8suxNPEG4VdLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 76 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..39fae8d48e46 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008 = 1,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,43 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	const void *match_data;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Failed to get driver match data\n");
+		return -EINVAL;
+	}
+
+	pmic_type = (unsigned long)match_data;
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +300,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

