Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26614FC8FD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737585; cv=none; b=YQpv2I0revFqEeC2C3WD2mo77+YWFdxt78BaKfbzsbV075k75EppzWjD1LsgY+WsMk3Z5O9wtFl9jIwz12PDhU8JES9s5EK4EGtZqCvySm3UBqmBPeOq4KA2gtPZ3fZtc8KIE4bzuN5F1/r5WHBwOiltN6E6L6SVPNdW2iNQG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737585; c=relaxed/simple;
	bh=sTtAcC6DTgTsyia/QnLhKcG49gomKemayk5z0N7ppgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6aPcf5h98OJGaPug+SI5tHD3U2nJ8lGKWdFJKOmERPNdVhJW2tkMnxG4HkuvN7YTTrjjEOsJgRAsLvJfBxg5h4GaTOtUaGd7l1bMBSvqLD+ZX4GIpTPpwWwFVmEef34Zq2cWnu5TrEeRzAhWjmMqmwD56mGt7nokQIySFe6cTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEHxDQUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx+jJPF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEHxDQUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx+jJPF1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuEYN153263
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB2gDVEaK5Q
	aG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=; b=TEHxDQUSuk8pVqu2FLWz+zV9Co2
	fBsy7HYnK+E036ypihcHZTaaHUF9I33nQI9FdBm+aDcFfPNtGpCRjVNEE4sigIxk
	Rl4e3Ubyx2ImRffUkjlfk/Y9PQujLU41MyQnp5sYP1nkkfGmIHyp1+NZYEdumpqA
	xovUI33QjdoA6rfd/gJ1ZFdNaKgiW4NcjxOVCqMCGrjIBJ10laR4WQ4+fPbm3Rmd
	2B9NnT/iKICeEjHSHkudwAO1bzAglIr844ue3dDtvD21N6AHDgGiBHP+G+p7rTDN
	6SRh2vPfiIt9L+gxni+3fHY2svCh8+b5amez2wKGmbwf3N79xZDrJqtTEtg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdua9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7847917c402so649242137.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737580; x=1790342380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=Wx+jJPF1ZqOPzNfXnslk0R4H0KX/POh449uNk8shxT/i8ANEaRP4PJ/i4s/Iszp7/N
         ySyMrBUNuj2fR8ZpA/XtueJbJ4zG5/JSFiz9j3Ycw+k3weeEFKo0mIu2hMxoB09vb4oK
         qIIWiC7X87AOKfE2clh5kaQrKMnxirzzSNdKTAzMi/iD05AEWhA0QfXIhkJ0EaUMPi8N
         EpByCQJe3C1UDM+WcBBs/ASTKHKYk5fyinT8OGmlEKx6ECg3szHngqEZvBXV6nSaRslw
         5ruXr2TIvnnK78UGnuM4i/Z6TjmGMtzK1nxMySHZLDLM96JilASGb7UyOd+zxbZnp2YW
         LoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737580; x=1790342380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=hksVXonR2tMzB39bg7kU5TYaZVK9L6oM93F6a5yaOCGV3VxIS9iTitfF7ouMLTxn7E
         nf8cieUlcHEVWHfgHwrqoK/ppxnWrZo+NSpXyAFzunpd4iV5lnrTiX8sTigMqn0h8110
         KAf0LtxL1BZFBOTf9s5JyRxo4EUz5n4besJbtQ3bb2ce4jOvnKZwdPzUX2hYPbWn2nGh
         1wzt17lKNb5MIIDef8D3Rj6ReJyMk2VsYqJlEs6k0ZKMavchq5BDLhV3Fk6q/KRzQeoo
         1o70AMDq6SlHW1vgEZQ17zBbyI9wTOPX5DTmtRnl90iAorHKHrJ/m8uhsi6CSteLCHfi
         xY+g==
X-Forwarded-Encrypted: i=1; AKwUvBwsx1ziqQZZ0KY90JA5f5zlQBGy/EV09KvLP8w77oDry7czPhlvS8ZuCKj42NRXidl65HUZ+q7xqSPY@vger.kernel.org
X-Gm-Message-State: AFuF++lgExe3tt3QRN1yk0OXGIsJBu5gvoQM+xeE/VIBFzBWgoqvE+ck
	pI1hiOrbnS0NxM589rgYbjgM7Ere7mmLrq7qSABgwWzWr33EVi0/ilyqp3lV7wAgTbG0X/CltP3
	4eVajb9zOJTeTSKwnFb1DplqD2gjRTES/9CXnRD1cGAHBM59/YrapvnQSRw0l8wOs
X-Gm-Gg: AYBFou1xtvoOO9HRhfZchCB90/6f1mWDD2OH0u4Us4CThcJn7s064qerZshXVJSk3Hu
	IZfF+sOzRCMg8aUhrHHw10EsnLKYtIZUOA/LCL7es6Rko8h6HknEkiqayfcyERy1y6S4ZbAtufZ
	3yCNVBX4ZHbw5Q9ZxyOosmbO8XKrzUJ2I+mdw0ClfhyYw6VveoehpW3PwxeuskeH7lt3Xg1kdz3
	lOWl+OQhKD1dC0FqJdmT8qa/k2sArmMzlLQhJSupDHEo0cszphhgjWcs3N6Bsfe4QHnuoTVt1/3
	KPV37hd3+saRBszfqvRp2UAbUDnPNSMhk3HOiEb4clzhwjidO/5Q3epx8LO8Y1/6Dw6LqRUSN/F
	7k7zl6XMvJt5iVg==
X-Received: by 2002:a05:6102:54a4:b0:79e:221f:704 with SMTP id ada2fe7eead31-7a55ad375b7mr1085404137.7.1789737580413;
        Fri, 18 Sep 2026 06:19:40 -0700 (PDT)
X-Received: by 2002:a05:6102:54a4:b0:79e:221f:704 with SMTP id ada2fe7eead31-7a55ad375b7mr1085296137.7.1789737574250;
        Fri, 18 Sep 2026 06:19:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 4/8] ASoC: SDCA: add class_ops with populate_function
Date: Fri, 18 Sep 2026 14:19:09 +0100
Message-ID: <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX875pNiSNDELT
 9M3g/SX+58YvBVq/L2N2z6ENueaUQyiRGbiw7vGoF3nhHMSqCpMZLsxGwKcH8sm28cgHegboC7J
 HpjeXfVPK7+KibgUpIhl8SDNxLYpl7Fb1f4vMQ7hZ2mn7C44K8RDeQTd8etOaI81cMrRgmzajAH
 4mbmZbAC+Te9bmGjzcS04xPXRkkBYyeYfCY379KRYWTl6ARU4R1etNV9fTD5iIqRGJRdOzL11F5
 YV9GqIEuzzZaLBsx6M+Fv9NorE13hFQQILClIhWO8L0IPhVz5c/Kl1KcdWSlB1S2KlNsECb7jI8
 B0LA83p6gl+UeSfK/dmAgkvQQLM5CC7qK+bmny+zNyaZC9tVx3MSlQ52GJHQWWMUe9XlME6z0tg
 dLvXxujMZRbg5RdS95B6bzV9EvBER+QEC5Ya1OaLJWH9YCuxPwvdmjFfpXkl62Fx1sMvkpM9hnq
 OOa8eM9hXdsFGLLY70A==
X-Proofpoint-ORIG-GUID: aYX4utp_Ag6M2UUapi-Ebvi8MKCVzkiR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX69iivYJIQRYJ
 YPRws8phuDqoUhG0bYwJogrkPHCwXUfIiC6AIYY7XQxth6+PKuL4LYRSOibnE9IOOSc3r+nlu1v
 NcluF2vJow1Ze4AjHmbQ3ekMj44vDP0=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad3a6d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: aYX4utp_Ag6M2UUapi-Ebvi8MKCVzkiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

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

