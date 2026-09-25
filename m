Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C84E06D2
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352691; cv=none; b=anBFxQO8pM6/lMiD3WE4gOxe5RjJLZCOvgO+37zjbz4Rts9arM8MdCOKGFUa/4P4rc42PiB5BDzW1WXMJSFk3urPmFa7NAaldbkC//x21NKMpskHN/1tSwt3YXCxcjFuNGhxQq+wLf0gjVi2KUMs3zKi50AqDtEkRPMjEYtpHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352691; c=relaxed/simple;
	bh=douSvQILf4lK1+GO5gdo+xey66NMUOhTZjEDKURQImQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0GozmygYYbOMGy472UZLjmJK9cnZC1GQe0ytCM08y3X6zgsfyzAvxKBBxhL4rzZFWvAYhPF1AUJHxRojlpJKMNDpJR1mxGhhdQjLaLOnsdcTirncgVcmYIRKeA9rfnynn4jbFi0NS8rUeKsBXLiHoImlQPX5XKkZsZGrRnG6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5dyqxvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McGze7X5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5dyqxvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McGze7X5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0gZP2515748
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n008vkd7l5C
	Q3lAYXLQWIEWyHEVRrMHLTWM1GFY/1Vk=; b=l5dyqxvK4JurYTBWZDJOXyT123P
	v1ImpIU/Di7HWf9OP1JJM1/b8a0EGUEjKySHPbcwzrjHjaGkD/yCrcYn4VpuSq+6
	LZHFGZ3lZw8vSFvbL2dh7zvjOngY9xOAq2AsHRmWY9Y/o5ZID+FdSLdDnPlodAX6
	gQQqltsjQoeM0NYPSNc38wMAhD2u5J+/8ja7sCqCGUJ9goxNi5TAm00Fu+rZhCSR
	K39YAtujtadK/oPpmAurQLQL5lDZqk40lG3cYHn2gQ5WettUYZVMW5I1n3QJ+Seu
	vc7h2cqdMMWGPRw0d1ebmxnfK8icPsyDep3Vuv50XnoT6Z01Revm4MBjE3g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b84a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78faf713ab2so222266137.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352688; x=1790957488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n008vkd7l5CQ3lAYXLQWIEWyHEVRrMHLTWM1GFY/1Vk=;
        b=McGze7X59SBSwmgvQ2E/iYRNmllqUQN464i/oZt5lRD1YfSxxWoi1nisAejmv0ppg/
         p8DeDFi+8keVac/i6tt4wMz0lDdpk4fDt43KoQ/HcV/wGn5NKklwto3ZMb7dqw1xXcR3
         cic6D5LmOJynNzN8dGZv8+jg3iI8IVvevLZh1DjQp/tXSSK5hdVA2wItGJt3V2u2EcuA
         /ceAly2TnotgOn/8Z59LhejOPFsogSTKqWgmTYkPQwVA/3avFJv4646Dcl4pzGpEEmEW
         qtS2/tkU4TP2FalXvuoXisz61oOWmjxHwcZ/Oe8v6vm2sk5KxV9LPMI/dGaiFrWPdxN7
         g4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352688; x=1790957488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n008vkd7l5CQ3lAYXLQWIEWyHEVRrMHLTWM1GFY/1Vk=;
        b=vp/KepDQlrhKppvrAG1KLXJYYoYrtnfdutllVWX1UURK82Ye4A025vMIiiAqgk3Jve
         fTLwiCCmsjlrEIyJsiBUgRtYiKX08NBqzBd8Wj0MwRhRtfVi0mo9E+NdVWeBv7b8fFak
         nbjcEPsuXkvOfZngV/miA5u8sr6T1dAquRpjWHNVnHaMkporMY8I68ONHCAKx9TIdSo3
         DBrZsfjH2KCKwtisyrbEOjC/5bU1i7x1PJNqsvAUu4TpHnTuFsylPE06q9U+LXHT4xiU
         k2XfcLBnVRDpW27NjRlhLMBpB2pqnEsIiBysXB077vy6/t51U8AZVA4S6NCN4g+oP22c
         nuIA==
X-Forwarded-Encrypted: i=1; AKwUvBwo3kgsF2+yTvMKkB+c+OUzvzMJ9zLeiGbd0Sn2JW+y3gjr20kUmF6D2N7qLGPSwU66N67IpAIIezUN@vger.kernel.org
X-Gm-Message-State: AFuF++nxKdPj6zEHNy28ohrB9M46b2TEFmzM+HGYtklUHwJd1bIMkAFQ
	QH7FUQxH5kl2yZerd1woJ7oAhvGHzcyVw+shs+ghnJ6VNfxP06uc+OPqihDwWu62gytcFfAvmFo
	R5TjwojSBItTHJrU12vjJ+GBXYsOE0gms20Xz2Qa69Yz2ZJJE+bc7ZR5owJw3/eeo
X-Gm-Gg: AYBFou0nOzYYU6XPYTSp8m54jdK1ptSdvLQrw52+q2WPHKBcz/aPOVAD9RH5eK+H+3U
	6rkEENypeFHLaEKdjUONlHP+C0MS2XUdh1vtudFXr8KpqRaDqkkplyCI61+QkPhdLv5tdtdnuI5
	b/DO1nATRCYyOmtIkNb5G+7KH0QuJCD53qRJjEAiQ02ja3L1pm0hB9YiF6EyiLntJwOnf0BIbFG
	keLcvynhz9diNpslR7X1E6XFo1LuOz+Yt162W298RkYXKn8bRQT+I87GTli9e+A8M5LA44ZXzL1
	XM77GpvV3UuNusi2O4VTKhJnhLEe9SmFGkBap437lvh2SiE5vV+6iRYsY1SfJg7+OSsv6rluoha
	/ZiqMgzEUfjPd
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr2209717137.36.1790352687654;
        Fri, 25 Sep 2026 09:11:27 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr2209685137.36.1790352686926;
        Fri, 25 Sep 2026 09:11:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 4/7] ASoC: SDCA: add class_ops with populate_function
Date: Fri, 25 Sep 2026 17:10:45 +0100
Message-ID: <20260925161049.758913-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 81WNHS1vek78486IAgEuswFihA40VqG0
X-Proofpoint-ORIG-GUID: 81WNHS1vek78486IAgEuswFihA40VqG0
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69d30 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX06UFrFW9SRoW
 lDeeMFklkjRQGptCji6BRs2KVs9YN0kK3qVD7NMhH4AXV+lmLDy0qAiEtCSJcS1AxLm9aNpFOyC
 jBRheZyp0lPiJ7QQXxhnkmn2ILVHqraXaHEpkXL7ePqqXgggV18DD8NSzXk2JVX6Pq89sEH8xRX
 3ink1ey0ZTdZwyFXBHAUyRS/9Y9WwADFOtzTspP1TjnKq2cmwARb6XJ7hy++x2kye1jEwxlcVLV
 6jN/PB3GNToxXg0m8FyB675lM9WkVTlrU8LNnXBN4mQc1bZfdKpsOJb1pU0+nGLZUc68quVNhkZ
 YCCOmlCyubZrBjYSS5Yi1ash2lcN75UbwanVof5Ki+2wj5V7HGveB8Qih9FfKXTj4e7SYVE2Ul5
 f2N7D41bQOSnVouXqtKsgtkvhIKYd+9y5CD0Zgj1BXrpL8f4DyVgbUmFuhZ5r2gfC3qaJHV/tXc
 ZQnsajGPEhsMS5WRTnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX1MzaTyxxjugC
 6gG9UwoIXa1GWHuyR9D7445IfvX+J7ef7iq3DL07u8U3UPRNp66XTq1YyuWY0raxn1uK847uvKG
 MCH25da3uqKNjlzkrD6IISoAGTq3EGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

Add struct sdca_class_ops with a populate_function callback that lets
codec drivers supply the SDCA topology (entities, clusters,
init_table, ...) from static tables in place of sdca_parse_function()
on DT/non-DisCo platforms.  The callback is a pure data source and
performs no bus I/O.

Codec drivers embed sdca_class_drv in their own priv and register
their populate_function through class_ops passed to
sdca_class_probe().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 19 ++++++++++++++++++-
 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c |  9 ++++++++-
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 890c2dbd88a2..794a756472cd 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -19,6 +19,19 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_ops - optional codec-provided class callbacks
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Called once per SDCA function with
+ *           @dev pointing at that function's device.  Pure data source;
+ *           performs no bus I/O.  Return 0 on success or a negative errno.
+ */
+struct sdca_class_ops {
+	int (*populate_function)(struct device *dev,
+				 struct sdca_function_data *function);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -26,6 +39,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_ops *ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -33,7 +48,9 @@ struct sdca_class_drv {
 };
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 0e6dead41495..79fdb672be1d 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @ops: optional codec-provided class callbacks (may be NULL for
+ *       pure-generic SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -151,7 +153,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -169,6 +173,7 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->ops = ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
@@ -213,7 +218,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 411e3d717bb6..c49afa2e626d 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (core->ops && core->ops->populate_function) {
+		ret = core->ops->populate_function(dev, drv->function);
+	} else if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

