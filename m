Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F364C3537E5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804618; cv=none; b=mz3wSq4kwGp03oTX3cPI/TWn20d5ytEpDu6MNTolE5C3EqPCilgjQ9t6UMA5OXvtvDQ6A/sawS/RqwrHwn9Q8iSD1IVVOWFBexc0raU12vN04VtfD03fduNyYT4t/wRtjMAzf/XV5hOHqtubEoThrwqow2Lfo+Yr490ZacaxwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804618; c=relaxed/simple;
	bh=q33W/QIDPpcW82+RedjgZuMTbU78MNYup83VXf3u2Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUHbgyYRBU3qnP5oKiNdzo0eFKIE0hpriWN1c2jlootI8893SSjFNFczGMEWjjm5IjC9Gh1NqVStVCPSq9WnmBR+7GIlrr9mHodxtDS4mVFuG23R5gqhqzOZIatcBV8e859TRYy3280u2M1YsxdclnljrSrJ6N/nUbghLT+lfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX2cfBR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0HOz/d5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX2cfBR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0HOz/d5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7tbP3484773
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 18:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=; b=RX2cfBR+It7mDI3e
	cJi0k7BbqZOSdOzU1WT6/KtLLmblGVyNqCyUoLrK9V5YM4qHY5TTF5m7Fh3wvN8K
	V+BFTkDLUI4Xu71ukcphqqodf42ZDMuXV8vpIG/UlDAdcW6Yz/NDO8xb1Oxrlten
	lXZVAjYXXCce8YsSWzTFvX7H/0eIqyLCqmlbXc4zYVsycBeuvQvLc00EnArtQZRq
	1b28n7JruznwSW8zDLivMxRaET6Jo471G3UaSj1jsNMg8y3iPPTQ4OwwowiBtAwq
	3j7AkaTIF/D69xIsvJN2pWz3/k93Kd67PH9zlK7Y5e4R4xS6p22VdX50bZvFg9Xg
	vBk3tA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty1tpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 18:10:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so47052255ad.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804616; x=1789409416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=;
        b=F0HOz/d5CpxV7U36t6C2lV2mrHlb2W9mkr3ylbatdYKZTXuNXHbkGq0oXY7ts5UCsR
         w8WSqh/iIL0zu6lHrJZpVGFT4/niPjBAo6l9econ9dFFrh0L2zDT/0y3jyT/8R9An538
         Se71aZxLmnfFoRqMXXXjdLLF/JzU3bUUVwRL+tOYRk8EwGgsdumMtrONmVPSBpv20Xke
         54c7UfL2wbU7O6tWIGqHWZGFBgUXx1kARfJSjTrwR+wAOLe40r8Sga7UjA+PNdH3nWM5
         zOZrMsRgda326A+wZSYj83sGOPaTxUjfvwJxg3TZ/sSGRu7AYObnYtmjPJ9WrAs5lqN/
         x/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804616; x=1789409416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDHaFBKThZjD9RlQav4iY8aV66oPdkuvNk7UibY48mY=;
        b=ezPxcNKq/xqn44UUR1aHFv5bYheKnl7FtbziOHdFirk8vnn9wXWm5b3Qd3DriBhECX
         kqXFT/Zh0rocZKSYZdVBJGmtGjL2LlKkDiilT0cMhpMb1+3CNHkiiGA1+IYXemWIEjUw
         pWh10jHI1+y9+Mnp22WDDDmFCjvePu8lvd7TJ/a5qYNJ2f8VguPHQqJxMNGpsnQR78DN
         n1+FAx5O/OEeW79ne0hUbIDEHkuvR9Ehnkhru+EmlpQKkgFsW4vz31m2Yzig4He3UM7I
         qKvKKuH6IorZT3L53URAjMiphnEW4c96E7eBLeTuR07yy0LON6hW3Jo3UJ14O56h+96C
         3F3g==
X-Forwarded-Encrypted: i=1; AKwUvBzd6LrZHEtP92kMsrE8NELAAq8zQuoHjRtdeYHHfsIY1YfqeFUSE1dur1uIMsoBcsuULE1hCcu1clh9@vger.kernel.org
X-Gm-Message-State: AFuF++kzZe0O7PUPpKej4si0j0DHLQy8q8ym1lkhTS1t7E911QmCifHP
	y0qxJrWSrmfnQKXSprfJ4bTZoJTcQyY2a0vmID+1oIcAycQg7dDWM5RK1ghAT1GDBDzK2NpHGea
	w2eJCpjU+JUPN+BXCK6XYjcg58oZ5gQs0SJu1nd9GpFjtrLRKVepa7d9xcNhtwj7b
X-Gm-Gg: AYBFou0g76aegspzlQwXqBDep0/fEspziRDFzZz5lkFAtLG9sysIt/ol4ypqL8sLnH3
	sQLoinEX6p03zllx5ATwKTMJL0u6sIr3pKEWWA/V2GydoRlXxFvZgFCfkiQgfHaBSXDIhXrkvnY
	KnWdOM5HSOPBe3Ivcx1tCgxkbz0iTuQ9thO3DvmTSaXZNnvNLN3HR2Bq1Nt2xiNi3QQqW/jR8IU
	xr3h3UREQeKr+kS6yVm5VUGJP3Crjf7xR9R7LAMZwi5syxLJrdqI936m52W0S66rLX4qXz2jTBp
	P5/OqBlJTuHz2hxklEBXCSwBCBSW/pBWubkvzPf+fREikx27d/bOfmn/SI48GgChhH53wmwIvUR
	lnjJbR8fA+ARWEgoUeVGYS3+W7oqqL5gUw+Mm
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr38847072637.26.1788804615562;
        Mon, 07 Sep 2026 11:10:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr38846995637.26.1788804615145;
        Mon, 07 Sep 2026 11:10:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:42 +0530
Subject: [PATCH v1 1/5] ASoC: codec: adau1977-i2c: Add OF device match
 table
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=1998;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=q33W/QIDPpcW82+RedjgZuMTbU78MNYup83VXf3u2Nc=;
 b=+oTay6szKtCGRPYNGXq+QRWc9G6dMEKlRiXIi/7vD/iIHtIbXC3XPHSE+THx8VXYbrf2oUbrc
 SpahW07x3hoBXpP/4jUw0+ULERBAuEo41EJBGn2dj0NR0C77zcBSXxn
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9efe08 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RY5VwJC9HJP-BV025wMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: l44VfvSUVg7mW30sdo1lk32tCEGPUys1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXxqmtf/d6avIj
 xzBtHKyLTJ7Dej4JtOoUuJ1y0OI8u6a8Y68Jk5xEwaeD4HVdJNagt0ZJF9BzhKCWp+ef9roJ2Ti
 B2QdpzMTkg3GyADe00Kc/H7+X/w3qnA=
X-Proofpoint-GUID: l44VfvSUVg7mW30sdo1lk32tCEGPUys1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX3D9S/zsKOFwt
 fO7QyGINlaiawRFR3r8zczf1JnJRxmkU6ntke7fkuCI9rWLnBjSHgpEGLyvgeIkDiG4MAxBpXlK
 agAQ1Q3SNC+6VOfStTxnZvrvcsK4cfqvYlffCDoJ+7eYoi60uY/m1VQGZsm97tFqDtu0y6Rtd0e
 L10VCKeCHNypjXvylwCl7CeA2RtUYL2pBpI+s8q0eZdB5Qer3HKQ3cPo3y6883mLx7Q9YRIGoxq
 Rzoe5FKKNYajqCDCvos0hNMHVCaYMFMwRciqZZW6pQO8rCmjPn/gxRJsy5cZhGilKyasrNUFC1F
 sR844X06kXF8YS1jvVB4j4XH50Ka9z5ixLyNSCef2dOGduSgs3Q6DdM8GKiKEY+R4iLtdOVrcqS
 r7cPiuL831uxRoc1/HUPAXFHqoZhtrDtZoZN/B+Zcrg/MgGCPpLse3wMVZ6yzw9tH2k+O50dBqZ
 iDecID0OHN/j1i8X/HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

The ADAU1977 I2C driver lacks an OF device match table, preventing
it from binding to codec instances described via Device Tree. Systems
using compatible strings such as "adi,adau1977", "adi,adau1978", or
"adi,adau1979" fail to probe the driver as a result.

Add a descriptive prompt string for SND_SOC_ADAU1977_I2C/SPI so
the driver is visible and selectable when running menuconfig.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig        | 4 ++--
 sound/soc/codecs/adau1977-i2c.c | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d3730c4da51b..6f481a54313f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -526,13 +526,13 @@ config SND_SOC_ADAU1977
 	tristate
 
 config SND_SOC_ADAU1977_SPI
-	tristate
+	tristate "Analog Devices ADAU1977 CODEC - SPI"
 	depends on SPI_MASTER
 	select SND_SOC_ADAU1977
 	select REGMAP_SPI
 
 config SND_SOC_ADAU1977_I2C
-	tristate
+	tristate "Analog Devices ADAU1977 CODEC - I2C"
 	depends on I2C
 	select SND_SOC_ADAU1977
 	select REGMAP_I2C
diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-i2c.c
index d1c6c4ddf506..9f54fa8375b1 100644
--- a/sound/soc/codecs/adau1977-i2c.c
+++ b/sound/soc/codecs/adau1977-i2c.c
@@ -34,9 +34,18 @@ static const struct i2c_device_id adau1977_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
 
+static const struct of_device_id adau1977_i2c_of_match[] __maybe_unused = {
+	{ .compatible = "adi,adau1977" },
+	{ .compatible = "adi,adau1978" },
+	{ .compatible = "adi,adau1979" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adau1977_i2c_of_match);
+
 static struct i2c_driver adau1977_i2c_driver = {
 	.driver = {
 		.name = "adau1977",
+		.of_match_table = of_match_ptr(adau1977_i2c_of_match),
 	},
 	.probe = adau1977_i2c_probe,
 	.id_table = adau1977_i2c_ids,

-- 
2.34.1

