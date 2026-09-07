Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A337DEAB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759999; cv=none; b=sYJh+EwGm47pCbFM/Ep8lQuSd4is11oJGxRb9qbEllJo1plQGLtnF1DaFpHrqb92+rpJO2r84RFgPNU2R4JX7S5QE5IZtOrQCZHDZtCejz1L0xDpJVJIAyN2pcli1zpwm5rUvF2X0b1/5lcaiSe6fLYUQnx1f7UnpQkbizpZNIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759999; c=relaxed/simple;
	bh=rL0frKHxgnmCItVj9IJ67HgoHPnZ3HbF9GZQ+/YiYjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXmsRa+f8WHOdxV++ElnGCaubGnPkiNLdgiTNg5JuGk9t/bqj7ZmdCBjyminiEX11ihmhKy8gn0sC3rHX0otmNI/lyYExToTTssYnvpIxndYQKhExu425iDN8GsYQSdO6vNFrQnsCwRllqC0t9Dng+HH4o8L8ABlfx2PrxlZZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPlBoK8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvR/xSXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPlBoK8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvR/xSXQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lBSV2821008
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 05:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=; b=NPlBoK8h0mynd9mq
	4YJSOleCwCJWEr5/+aLxhPSrsmSVoJQarbKlm9mzaeDTHLcW9AjehO/v05J+KNiJ
	cpV8zc1WcR7FIOmw4SqRZpLURWvYDhoBeL6ftfyL20P3UhQP56u0MnnfHgjjyluG
	lpsMkgVUOd4Iw6XPuwRYDLpS/k6F3payT9bAq+JylmIvU4wCEBsS2hiGmvtiZEvk
	NF0eBoTm25YibJeN4kjITrO39+81p4HTuZItooxfW2LbI3iNgwdVLctMho0NsGte
	/B9fvxf8O64eiKMZiDm0r5GaBwjOtu5hvMpQtvMio+NPT2XapdZWTKy9uRkwEcOF
	Ckzd8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhn7h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:46:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so4707812a91.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759996; x=1789364796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=OvR/xSXQ88MpcrSGgqykTQ4TqH9fNf6f/eKza8EZmFNwOazCZ5/V791YEyf3aZw9dD
         Nm9SOKFC90wGR2j5fgQsPULGGdsCbDUHsTbTk8b3jzjWxjRyfwMUR8oA3cglU0r2/PI6
         2ugpgSkCWbTM+dv58USyWkQzjdqiJS2YCvS4nr+TVakiyq6+Dv1idI6t4zP7xVhJDrGO
         RVeMLTSXynfP8MEhbm4S0H0Ox3Gwdo4eGTkdF4h8CAad0OnzrEzTK7ttoSt+/CesgQHN
         iCeD4BcTtOJEDLtUOzUQZ4KmV+3GtHvsiiG9XORH4UvV2ayPS9nUjikdsStiLo1MbPM2
         Ovig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759996; x=1789364796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ml4Zr8T8w/TDmVLa78Ik/qhJKpgMAmTtlHs201KjIE=;
        b=ZXGsBqhxYAAe4KioYfLLpKUysV/3k5yzyPNeDkn88ANKeD0IKkxFBls9oWaIpECvWl
         UsokFEHI4ikQMnP0XFWisz2DrD2SlCF+Nyf9mlFqqS7QxNSwFG80zegYRsxKlTIItkn7
         D6DucvYt9FcjEpa54vHTu8H7E5WLImtFx6XYQFXXZp73f+IrQjU7GBFKVvVSWbEsSV6b
         VPgBi/dEcKLoTD0z5GD3h4MaRQqtd+hPPi4Ymj5GgPLAftKdYEUn4uqlj5vj2/W3shmd
         l3WFnZciw1o2N90bGUpOb/LNFervlrMak/r25rtT/n1wKr7e39ksWWidtcVwKuaTqcgK
         TMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8E4sc9w/Rh3JmIhX/LaMOY29BpOJhpBK8K3bQFIZPMPPMvO/1aoiAHlp53XPrTZCi8Yk32MyqPPVo@vger.kernel.org
X-Gm-Message-State: AFuF++ndsDE5cXoutQiJho+4Yn/PuYvaNMkCpwmya60Vo3faYnVDM7oC
	MM+2D2jDLVuSHWxHNHBt5YTUk5v3nMLpxxWqWejmIEov1kbBYfGR3IB9dEMa5/UzS2BimOSIJPy
	VVEAy+T2xRO586VUQVBlmTftW/kacRRObmtbKFQ6kd3oDRb1GE+BTg8u1u8R03j3x
X-Gm-Gg: AYBFou30ukgC5stUfv3FugMGuiqDuWdgU2MB6YZyXCCFcmaJhq0UBIem30ZEhYD6Fo2
	ZedKHFRCgvgkGElB5ua1AVf86xmF44eFNljtUy1VUgSERPhNmwHtc/G9vAIaGW64Pjz25D6IthA
	nYK432/nzhZyrEZj/TdGQLJ65FndEQ9UYZYXIpEHVChbI6HvckmxTwYCVHdbtm9oyXN7+yK3B3o
	Tz1rVFz6s3iXZKMtQSKTvFqudBQHV1HIT6YhkvoaUnRZbu9YL9Kc040aNHoXtqSAbOnjZk12cX7
	i6RJOldiIkeoROYqgnGBLtSnjRRcp2Ens+CdcpndReA1yXNWPZnykYPgqmwGbFFYvDKoe2WFoLo
	7+1su4wYo17EC43uL8ma84HTjnFA+3y0Gd9ns
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855617a91.22.1788759995951;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr30855586a91.22.1788759995515;
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:35 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:08 +0530
Subject: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1489;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=rL0frKHxgnmCItVj9IJ67HgoHPnZ3HbF9GZQ+/YiYjw=;
 b=VQFs6XoU58lnpmyWscfaTZVmMbtHPpwPPRNycQpO7D3W2XAg8qJ6UqWM1apJfX7GzZjDZSxjW
 XaHkw5kMk5sBNt22mxtR3UZnIOUM09SuTnpjRYEjsegYfJn6NF1NxMm
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: pNmC9ecRaQ83W7Rwc05oXPkzH6mXyfND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX6yue8e4ggMiv
 qIopGTHXm3cIikC5bHzhcu39w1V94+OpGwcZjz7xqcEk9NAgQuVWgaVlZhHEg7X6jpb48mZwAgQ
 lMVCeIRuOMQ5qPgWTghBtCUvHfXXB73TETmBi9TZ278p2j7dj0+A0tzPRoa8VbtTdJAJNk02iYi
 DO6nfLLzOj80ia2FFrb8jaGHuJ9T5LjJcQiycL/ll2qVHSMhg7QivBLcF+95UuUDdEABF8oazv5
 ElfsO1ZpByez9jc62CQw1MVNFVN/oaKyFf0bY2HKqWk0IX6sbsjF/BRZ4om5LZASuBJhAcC/i/Y
 Fyy01IXj61+8DXLpZaRsIkHCeejXaQzKhHFR2JY3SfmC7Nza12xyfwVZ48fVbb3RsWsp8v77jfb
 pmpnRzAokHDU20xAfqU+mOhHTGsEwaYih8QRW7r1OjShgwIJIouN1yKyImtHvF7NylqckIeUhe4
 ACzoWw4C2zgdBpGJdxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MCBTYWx0ZWRfX73Ed02NavJXg
 bAU13+Fd5Pq6ppkCwJq2K/SSvE0CNmLeZzNpNXwCx7oYAok0qBa+rBwHcsc38zWlrbGPEsdUKY6
 WcU1ZLZ8IPoiqJLXgmZesDDZQnDndfQ=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e4fbc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fDsZdG4RzIHTu_4XfosA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pNmC9ecRaQ83W7Rwc05oXPkzH6mXyfND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070060

The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
rail to be enabled before any I2C register access is attempted. Use
devm_regulator_get() to obtain the vcc supply and enable it at the
start of probe.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1

