Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93124DE706
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974023; cv=none; b=tqIfstW6KU7/cOWEbHwHGhg7ODgbE6c9mKD9bZrCkpVa0Z9GcE+JNBVhvhewW/0GmNdiawsnxIrnHhJwaTD4m/COXIFZwW8TMAPthp+nxlsHc2nvfLRvO4Tq4YgGVHXF2wSTcjUBD49T0EBtZDOnAELZkQwwvoXvgv1LUnsfpYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974023; c=relaxed/simple;
	bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MF9gtrh+5sxK6SOxY/vdlrgfN1b60JwTsjC47ONPwFMnRZHVqKleEgYAvihWVqBk4E8A5QsKY8sGJsodyclGe0Q/7cCVDqQW1TLOzO3l1jXdWoUxQSDk9aOvaLEX3zCD+cdP9+NxVB/InvTOyJS1LcjlkVk0zuvUjr8LuTQvJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAH/+4HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDTVZXcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAH/+4HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDTVZXcD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67pGR2685707
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=; b=kAH/+4HAiNunpkmQ
	QTW4kTAfdcM5OQpSxHhwyyLB69YptJeAANXSBbpsX8ZRLCfYXYJqKZGuiDhiURp+
	LDuzZ9OdshcuIVQd9/C7hKG7MN0CaHQt3OZpp63gLHYZOPh7t33Le0XC887NoE1U
	4MpsuRoJtA7Yvb3Jx2DjG6DIp+OJq3dlsMjtMoxiyZP/3/ZWS0Dvc+IFa5A5UrTD
	QwamdLLhf1YWdV16oJw3QMQ65R+J9IH7k+Cw71pVQZcOocViE3pfBBHBe2wtUMZY
	IsgNcvRClptPAr2CXFr4/p1kFqch/IJcFefZh5l/xZTESFksP6dSaNA4tIYanoeR
	8+99cw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1383-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso4297236a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974019; x=1792578819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=TDTVZXcDQXxBhCHfk0wwkbcGEHCP908vtFTzhTFYlbBE5Xr20xNEW75vCf9CrQK2ay
         /1rEaTckX2hCaySt1Q62g6GcwCQV8yDQifyMxWJ2TzCGGHrHtnxhtoDVss+kKY+CLS62
         8RDkE91ig/SlB80QPnjO+tvejIn7Pu+dYkVrtu85sryoLpQAYWljqTFLgOmuUe7THlyQ
         uqo57ZPX7XvIeO/IwzJinQY4SlOeIb4CK4cYZcupFudJPxprGnPR+6PZ6g109IPgwlq0
         4dAmvKdURLw3U6C/i8u+ybG3QHrvzTJHDz5PH8APcZ8jPCKFfV6TD1KgW/ZUPGFi5BFa
         qwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974019; x=1792578819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=NDlS9z8gqUmp124u330lZIXqFJFUSW4l10JNvRVCLFgcGY5rX3wUw7GKxegcvVQzPC
         IsCf91bx9cChuxoREvrML3Q/JVJ7O2eoNTHcE7TY6Du7v+fmHIOcW2xqPULg/VgbQpBv
         MM9uJN9ENKB36eiqS4IJX5pI8fbqaH3XAllbPTW8lyIcvuAaKiGov2n+xBLymnoYVd8k
         4DjXNT/cH6lwrIlBKHzRizH4GpMagUJ0dtx+R6zAzfTMeBO7Ug9ECp6Jr0adjISjsn9R
         LmEtg0LBXnpEWaBH+d3Jsy1ItPAgEL1iamgP8kkuKeFjbl7gocgQHnD02qJq9cEXw525
         icUg==
X-Forwarded-Encrypted: i=1; AKwUvBzgaaSBtCeyLkwRMJPdIKjAsuunbsCC4vGm4QPl61xmom4l0bSedPTd9pNqjOjgDgS8Duf1yLPusaHY@vger.kernel.org
X-Gm-Message-State: AFq9FYIoVfFSY0eDxuhoo47wKWSppKJcGWdZtsHHppJD3yiLGSA0PVmg
	gJvcDOs90GvMP70j/xvOebCOcyKx5RL2DRC89Nr5/JhZNNbeOvtFgdvp944ivmi/xgd9SpT3B+4
	R/NbrgRdBTAE4qx3zNk9KtRGCqQ9wZCpTUJLz75bgMdgJMPWvsKa2cMlWa8MOXL+a
X-Gm-Gg: AYBFou1acoraN3hjn0jypZK2a1JihZ/ij3DazIAptAPMAUarGPBWcBWk+Vg6Mv0sleM
	NwLG3bA0T245tVK5UoEMaxHiCN6J+MSnq+qE0MphC1uX5YHnIMs33lwIi/d99b3MjtghG14ZI+B
	4lXhPwepUJeu7i1cPaADT7gXnayhMPKSlvYZlCigRp5TCqu4Hr2pYcibysA3mxejEgqItBu4Cry
	sONu2F/6bjsQap8LmRIBpJzNI3FV4Q/Ac3c9KgKI/yY1bn+Sp7CI0f+UkKJLB+zvkyony2OUVjF
	HDofT2Fg8LkznyffBosA+5Pj+N+fP+p6tLa15X7KRH2ZZlhFse0feSkdbrbO1bys+3mdqhMqfNI
	v3Pi5SzQcj6QN3mnwwEY=
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456436a91.51.1791974018531;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456410a91.51.1791974018007;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:01 +0530
Subject: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2664;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
 b=AElc/WvIvPXIUJVp0/t2t/wfMdZneAGVDMqv6c1eqg/ofRpLZRnZCcWvDZpBFXFjwNWwthwB/
 qvtaWtqShfSDU/dqcmBCTSGlT4kRgk90gPSK8IDpPe0RlysHN7nvVKc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX177YCU/xJOKZ
 xVn3oKEB4hhwbbriJjgvvEubNKSCXN3+z4XdM3iV1cCmMAzSzQcCOhhdtkf3tnkO5MfMPGtlmd1
 3bamh1bBPPbo29+hLjdjJaClHSsfcxU=
X-Proofpoint-GUID: cITIapYsbOqUUtgR7GlECWq1qKwbH15j
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf5a83 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX+8KEcPtMcpMP
 kFj1ZsUNHYU2FZLWOF706OuNF6n4/PqBmZmcFeTSmUrOYbnBOHtqyefd+blllNIC5bkQ+K2QpBt
 koH2CR/O7t9mMb9Vx3bBwMtF9KBHzGEPifKrAFFaCyLGQWTh03mmO7fQQ4x38BloOqVMTVTaU86
 SDXF2d3czDNvbe48kcPn3BYVYOgtTawlirmXYr/ur6xxhDAAjtFLZaVmOXxdUXkUqzTtFOVgsNV
 JYJ+hcd/GcqZ7g3sh9swZoqYoVY9VMFh2vIzQTB5Vr+39thcr1kteKeonm5WFNmBqlNOGMv62AD
 7jxALBzCgGqmo07m+K066w2IEdgFVw2RoQ2oF1Zmkmrs8N1MJmbDMtyZVreZlv4SxruS4iuINQv
 H61mdL5qBbCfAhaF6iCT0TS/E5WMPP1pKvVf+OQXV0+jxsZ2rdxsidBYJeLSZSWKMmwDS6w9hxN
 aQDjJ/BHHEQN55m3gPg==
X-Proofpoint-ORIG-GUID: cITIapYsbOqUUtgR7GlECWq1qKwbH15j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

