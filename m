Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B494BA1E0
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491465; cv=none; b=Z+L0qsB4f9DN9uGXPqBeSeCuesdPvF4sMGwuVbgzCRYnK182/1NBVG98InTbO2byTav0kM2tOVo4QIyc/ZKWPLyS1ph2U8LFQPF0yMCu75yJCJAHAU0mxcieyykLxePNb0vSelAUViFOwOFADGqaZwJUiG0TMN+kzlIAAl4r9Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491465; c=relaxed/simple;
	bh=sTtAcC6DTgTsyia/QnLhKcG49gomKemayk5z0N7ppgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+bweiJTp6rQ3n3kSE3JW+KDny0MirHLe4YDpzynv9u5SCajFNbJ9i39kR3oCdhkWYXDl9PbivT/OV+TAoVTQhdVVD3uRPsFCdh+afA9vPUxkSkBRWCDkKsan3LkXfvDRZUnOVKMfTWF8NJmPrjLUWO6+POK6VxV+wAOVLCjH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf4ZLvAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsgeZnJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf4ZLvAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsgeZnJW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAc7p460768
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB2gDVEaK5Q
	aG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=; b=kf4ZLvAMFX2gazjCvXoux6fxHn5
	jeLEGwxEtZC2q6dAKbIZ0VNOgpzwehzXucmRvXFZtstTT7acIIiFDI9eUbyr4F6I
	xy5IMJ88V0esrL+kowjejST0c/5JPECIeIu+V9kWwCDz1wE5+cU9ymLSkzsDs0rd
	Mqx2BPSxHG+KkjqAmsYGhgl22NIfp58U2X+XDX8EIGI0jR0MELpe4iYYrnH82/Bt
	MwQw3BBPVqImDOIoodlWh9FaQpbyJ0rtQ99yHmOnYXTFEaN1MP0rnXjUdxGyu538
	k9vOGVMDVQmPX0q4i9s+bfrPth+7UbQ/PwpszIN/jGEm/iTU9fB05u4J7Sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jetutf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso854415085a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491449; x=1790096249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=bsgeZnJWubyiSPK0hT7dTs9JLK2SDp+BbjfoeHQACGMO9X6Ltys21fOHrRiinxpHEe
         cUM0tOsTv/NuW7VZzGLDFN3URcoUREPUWWh5k+T9fXxDmKV/05XrZlQqz4PIfT97DEFT
         y8r4NbjBmYypVrdw3dtrs4D+ieerRX61WT3Ma0hvEfAyqibFwv5NxzzWEXzAsiZy09wx
         K9DhlXahuu/xNa8EsIi2OKWWe6FnjlOc1D9YwXRGr9mty8EOHqfPjlqoENw3xQPbqqsg
         zeedvLqTNyDvq/aZgrzjiy6bM24GGBRQPE7N62CBF5fdtDau8MafQtvEsyl7LWwxiusu
         f89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491449; x=1790096249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=fZEA0lDAGDfDlFOo9gTmUvANzJuXMpNkebsAwvKZihAZk2qPAMScyKt40v7tGHu3NS
         6GqYCTsshnKHuwzZQhMSotQtSnehFG96ZKs2MzznlKZhlea64qPcxPX0A7CThIQS9+XE
         YEw+azEaeGbjCFz7urviePCMVhdEG9G35bKgGC5066wR2/yyHtLwDm+U6J+/QIpS9eh1
         8Cbh2ohiYi05BigQp7/StWziM4cyI92vY6+nWPpiGrafkWHvr8P1eZuUn4k9vr/QBG5z
         wlNdrCGa8Yrzyt4hYOYywnDNJl5V3DyYkRMCMj1ivGpLUTJf0jLgOgO8p/TSebUSDLW7
         joIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEsXFKFGOaDlehbyVLOKASMOmxyEX8hnUi6BlgfGBeu6d6uqCN1OuvLaGRhxbk/Gsac+6ZlWyg+dCh@vger.kernel.org
X-Gm-Message-State: AFuF++mttGzfEwAg+knWiLiQV6Kk28lisOG2JARwyvrHq+tUMHzOUxP6
	Ec6P+VEEPdd10Ve/f1yMImRxrIpHGvQ1zfF9WPATdc7mvYdtUu8UuDB5VAYbrB1WPdn8kr0NWmv
	oDi95kNAxxGUBf2mm4mRvbGC0m+pYa0m+M/+B6ikVd1qfxCysA78Omo0wojvd4QJs
X-Gm-Gg: AYBFou2WPzMhmqTbaS/GpS4jlE0AwKcpzi6uzCx7YiVW6jgUIX6f921uoJntA40AvId
	rsTwZyYObS5xnDWxfr1Z1xkmAKlfuJWDesI/psC2+w1+UyvBOilWvJFywBUqtQshTSjASxoitGy
	fqBLoJz6V1YCKTDAG56Hb38i6+hUdy1wD+hZMLs3wzO2OgdMPyvvnfjH3k44Wm7do6uAxMnlnEg
	gqNAAaRzT2cVtLb1rg72GoUOSGf6/xvz2A0PEVU1MRTl35no8G/H8P4k3NOtVtWe/m2RuEPPBrJ
	Mr/avZDKyLFGhNcJzHKY7LGl5dHGNIe6vz+zO2OhtRMFmkxpacYQ3RjYg+X1Tzjb1Vym5Vgmugz
	2OEs5vwYiQyVAow==
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355665085a.13.1789491443850;
        Tue, 15 Sep 2026 09:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355589785a.13.1789491438612;
        Tue, 15 Sep 2026 09:57:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/8] ASoC: SDCA: add class_ops with populate_function
Date: Tue, 15 Sep 2026 17:56:46 +0100
Message-ID: <20260915165652.914893-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX86WlXcvJoheC
 KECvpNPZsPAlUjbkRVWob3bFOsQflj1UFR8yCd9GPsmAD46o38/U0zQRwu/Q6bYxsMz+KZSSJl4
 hNAWi8uQOzrdy+80+uUFtLSb9YjDR0s=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa978f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: E0fN5gbMDbQ8LRvYkjYE3sKe07vJ7-kZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXyRXzRl4TpDxx
 Z2ryhBTk7y2vR1RPPPbFelE5ysXVZmvDXRCNrui36STzlfJb+r3pr6i0oaxE2TuHWDxOmj2QaWV
 ymb1B+ikxcpwYPkmLX2yxszaB93Sl/ry7VANvAz2+rsrvj+f8HPepOkLo7gJf8H/yNtUr3WV2Mv
 sPHCTI0a/DToaSa9kcdM7SdzgehrdPz5XE6DFCzX/ZiBtMwUwMLnAz/bKPd8e5NIt2f7jRmLq+h
 QmfeawW723oey2xMj/R1U+LCjWYcCx1MZDM3gEW+g2AQoczghXNXaeMFsov4VBtiBTacq3jIHqK
 S18Wo+WZ6K7qLzp7XTaA/iT9Oe9n4KKdscyjLBdqC1uHCsLfQUeba0KglvaXheAuIgogLiC4/4f
 5SN2WwWdKAhhvZClYBVESYCz/m+dyS9Cg+icpXEqByyJiuQaniFUU0H3Cvc5GDm2XexuCDmKNZF
 AzSedi0yY034yVxD/rQ==
X-Proofpoint-ORIG-GUID: E0fN5gbMDbQ8LRvYkjYE3sKe07vJ7-kZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150247

Add struct sdca_class_ops with a populate_function callback that lets
codec drivers supply the SDCA topology (entities, clusters,
init_table, ...) from static tables in place of sdca_parse_function()
on DT/non-DisCo platforms. The callback is a pure data source and
performs no bus I/O.

Codec drivers embed sdca_class_drv in their own priv and register
their populate_function through class_ops passed to
sdca_class_probe().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 18 +++++++++++++++++-
 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c |  9 ++++++++-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 9e6b0eab8a0e..90af5b914ba3 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,18 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_ops - optional codec-provided class callbacks
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Pure data source; performs no
+ *           bus I/O.  Return 0 on success or a negative errno.
+ */
+struct sdca_class_ops {
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +39,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_ops *ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -34,7 +48,9 @@ struct sdca_class_drv {
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
index 411e3d717bb6..d83be8474e7b 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (core->ops && core->ops->populate_function) {
+		ret = core->ops->populate_function(core->sdw, drv->function);
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

