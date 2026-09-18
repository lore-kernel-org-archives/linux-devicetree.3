Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854804F68C7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737578; cv=none; b=HIPdX5aP2Oo8qvMI8hPe0DZwlUaLdICemAI0IPmWKH2qyfT+m+wPiLoynwCz9ZCGXSr54XXsi/Wkx1QrnlPqWX+PDw/gbqpVEWc0A9HLdFc4tI12REUtGsPn5Iy6N/KXysUg7fjyc9spf6h0ggOSe6vfMEAHfUuXKeDSz5YMe5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737578; c=relaxed/simple;
	bh=i+O7cZGqDHF9oCN3XLT5p5vttilZ9SLFPpmi99WMzqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o39j3j343DXJ2G2Vcp5a/XDBklctZn+iigsFkGSsTrm0WbCJt8HZintW36HnTicel63n9jWm21mIH9UWaLW/wIzAV30/Mq6BgM5PKpuRO6B4KeHCwK5anKAsHU6y5LocXnr+f8lOD49nqLocTTlq91EE7iDSWP38uIYfVvOP00U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW/to48S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/9Uprm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW/to48S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/9Uprm/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuGuu153332
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XrwBpas1mTr
	Y7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=; b=MW/to48SB18tqKYkapF49++gw8o
	ccV5S6BTy0OT1gQnoG6uswFcLbCg4hlS8hBo0lAFffZ7uZrC11whInUlQobLmfIk
	t6naN7med9lRKzMsVY8ASFcbW01UPq8PO6h2irIsHHVRZYGUUZdNwVh0t4q2pybw
	gnGghnHuMPyw1OqdFoDjrMIFn5HRAxOavFGbTd/gBQBWbc/yKPW9VEg/ioEshexb
	nEvVgSqxhwfBvCXPVzrVRaJWIW7CBbKfp75jtfWbsAJDepGdMAHiTKVlAH5oIpd1
	teRyXf5V5gIvcpzeRcUmzQ20HEhgm/i2jRDI9tuEiKMg7dSl+Mmbezfnykg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdua8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104215fbdbso24539886d6.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737574; x=1790342374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=M/9Uprm/Dmt1Mv202qF9tvZ7RG9p1ueGKlrUum2eaGosmIqaMDFv5VGICWsxaNgUcl
         0tTIkwH/ny3O0ztR4sPzJm0e9HtqEaRu/GkyMjuMbSgVWQgPnahcbOM03B45qHT2lFS9
         EOfYDTlmyReesB8lbpdGdLsVHsVHxLc/a4ICsNTPRcf9Znao9PJt0jx+NofcYRVdYKxU
         a4z545UHFW2zIs6ZfSeWtOlHAmntWBCq61obdKvv8WXyiJhSJjKrf0WYfdsFnJr+IYXH
         3LAvr31KoZ+DEYsF9Wd8kx7YNn5mAY2pHzi4Y8t80Mhdv8mqOCCA9G5asDjHbgv03HTz
         +BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737574; x=1790342374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrwBpas1mTrY7PaKJXk9LXDg4hKLTOIWwidZcoVKoms=;
        b=vIL4+iyw0K7IjFLQDcZFoABJVA6BZJlRZcP/Klpd00IAxvoCiqQ+7SOscKWCN59cOI
         R9K5d/9mRkF94H8nHkxP6foLmDSBA3XSvnvHsPY+1Yk06E+zPYnr+I/pbcPXN/96O3S8
         GNqv1xS0kLXfPkrgrsyStZoHYBNzLimxGBQw2tFZFXLuZ/ArxDCKW+/aF/k5vvovaf73
         CD2zydIp9OXceTQByklWxZL3iFk/xR4lT/piSWbiS7vp3fyRtFHzWImPEmD1rSjJT0uo
         TiKAj+cbRxUIGvQh4ysIrjy/3A8jgvuY1Wpm6T4q/pXV/DUWRsiqORzqFtVKzR0kCK3p
         OKyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7wxN1r8HP/B4U7v8zImHGlk5P7JdjJlXtzOPo3nEKAum9OD4Rd/rTznjulehcifxCIq8lkPurlcne@vger.kernel.org
X-Gm-Message-State: AFuF++neXku2bG/2lSa/f4bT9MZW4yG1/GIcEZzOinySGmIQR2wTEb92
	gXi9+eYhX9EgdYEJO2uECYHotubrwgbk7e9fkVfJGLcgCxWX3U8/LwpDCI2cIU2OU5t5+Zkf5C9
	5lFlpFm7OtBjGme7Z/nwc2V/dmzqfLwcFR3V4weehsZ45dSFDelI6kLoABJTKkOoh
X-Gm-Gg: AYBFou292jwVnL8uIlTxY96zhgOx7l7d890bOYNtTQexwIIT2CVlY9l2C1iwW2nhdlw
	PP62YFePcGZvesO/b1E6vg4gzYLNYDsrlYRzrrDIEuHOrbWTz6yEI+P+ILRD/qPku9uytkgCLbK
	OFwutcJfXcoxAgPvUW1vIDOydXXtzCOF74cgTuNfTsh7KuLYr9uRTaADVyyk9nvDjRwVt+pwA8p
	Tp2zldOyuSety0TizQeNSr13FxQ/YwcMlAdfeDXhWEF7uMCCCcPquLpQKe8CmGVi1weh/GeXDBG
	qx+BDHlVT3XkWFyXVYA+zFQlxO0mOSRROnCvYIYn9S/VaPqvDYJhFOK4JxmMTC+p32Un1GUzn+V
	RHO7ZxMghRBK2Sg==
X-Received: by 2002:a05:620a:45ab:b0:939:4a34:621e with SMTP id af79cd13be357-93bdc702c8bmr348742085a.28.1789737573573;
        Fri, 18 Sep 2026 06:19:33 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:939:4a34:621e with SMTP id af79cd13be357-93bdc702c8bmr348733385a.28.1789737572805;
        Fri, 18 Sep 2026 06:19:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
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
Subject: [PATCH v4 3/8] ASoC: SDCA: expose class SoundWire probe/remove as library
Date: Fri, 18 Sep 2026 14:19:08 +0100
Message-ID: <20260918131914.681588-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX3T3b+uCuquJc
 Gbo+7SHE8/dCeGkCQv+Uajl35tU0FXoWn99bBeR4T570OdH8V6vY4G4XQsSvenQ6EyiuU/hp/zu
 tgfnZkgr1/PnSYFudDiDgLsny3TS3u2EAhzskn3Y7ymaX2pbp5nl7no3qvCy71hRAVuMsb0nHqS
 dDopPYExyJ0qzDPhHEq9jNLo9kVphOSBhwHH8cGXNjdLq5tn7kLbYKn1WIPCSxw2YwHzvwTFQNm
 Qv9vOkN0NOATK1wiUXte8zj0YiOLcX0OzJahrtW1EApju4wnE+feRs3ye2Q4RqD2hj3Vesdpzna
 CqGjP3iCRXLugNT9m9Jm5oLdxGpLkypsqKnpmEHTbyyaun4UezicxIdYUSLZFsI6LHx9HctOsHV
 e4NiF6MY4SdJ0FrqTAP8qghKSPXisUaxIA8z9YOwx/wzClBLY4XFD3MDuTmNa63bpFOjnczqSXL
 ZyyaxINKXYzxZPS0JTQ==
X-Proofpoint-ORIG-GUID: fBdYCnVI6wk3mC6yC8K211iFF6fMgpM7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX5l2Cje1cGuuF
 VlzKoajUGTHWB0YotCIgpdDMnq8ghgwabtMPlyi2iBUrebzOv0+x9ZY5mhKXLh7wAqv3GJot3C0
 6UlLVsZp6rsk/EJfxXiUodU5hs/cS4k=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad3a66 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=mVpuNYMqi7MQLQPxcREA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fBdYCnVI6wk3mC6yC8K211iFF6fMgpM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

Split the internal class_sdw_probe/class_sdw_remove functions into
caller-friendly library helpers:

  sdca_class_probe(sdw, drv)
  sdca_class_remove(drv)

The class_sdw_probe/class_sdw_remove callbacks of the built-in
class_sdw_driver are now thin wrappers that allocate a bare
sdca_class_drv, stash it in drvdata, and defer to the exported
helpers.

The exported sdca_class_probe() takes a caller-owned struct
sdca_class_drv * so codec-specific SoundWire drivers can embed the
class state in their own priv struct, own dev_set_drvdata() themselves,
and avoid a second allocation.  No functional change for the built-in
driver.

This lays the groundwork for codec-specific SDCA SoundWire drivers
that want to compose the class-side probe with their own quirks; the
next patches add the class_ops mechanism on top.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  |  4 +++
 sound/soc/sdca/sdca_class.c | 62 +++++++++++++++++++++++++++++++------
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index ce2ed5f33e7a..9e6b0eab8a0e 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -33,6 +33,10 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/* Library helpers used by codec-specific SDCA SoundWire drivers. */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+void sdca_class_remove(struct sdca_class_drv *drv);
+
 /*
  * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
  * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index a092ebaa620a..0e6dead41495 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -136,18 +136,31 @@ static void class_boot_work(struct work_struct *work)
 	pm_runtime_put_sync(drv->dev);
 }
 
-static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
+/**
+ * sdca_class_probe - SDCA class SoundWire slave probe helper
+ * @sdw: SoundWire slave
+ * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
+ *       driver, or the built-in class_sdw_driver in this file) owns the
+ *       allocation and sets its own dev_set_drvdata() -- the framework
+ *       does not touch drvdata.  Typically embedded in the codec's own
+ *       priv struct so codec drivers can keep per-slave state.
+ *
+ * Codec-specific SoundWire drivers call this from their .probe after
+ * allocating a struct sdca_class_drv (usually embedded in their own
+ * priv) and setting drvdata to their priv.  The framework fills in the
+ * sdca_class_drv fields, sets up the class regmap, and queues the
+ * deferred boot work.
+ */
+int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
-	struct sdca_class_drv *drv;
 	int ret;
 
 	sdca_lookup_swft(sdw);
 
-	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
-		return -ENOMEM;
+		return -EINVAL;
 
 	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
 				  sizeof(*dev_config), GFP_KERNEL);
@@ -159,8 +172,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
-	dev_set_drvdata(drv->dev, drv);
-
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -185,14 +196,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
 
-static void class_sdw_remove(struct sdw_slave *sdw)
+static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
-	struct device *dev = &sdw->dev;
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	struct sdca_class_drv *drv;
+
+	/*
+	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
+	 * bare sdca_class_drv here and stash it in drvdata for the
+	 * built-in PM ops to fetch.
+	 */
+	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
 
+	dev_set_drvdata(&sdw->dev, drv);
+
+	return sdca_class_probe(sdw, drv);
+}
+
+/**
+ * sdca_class_remove - SDCA class SoundWire slave remove helper
+ * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()).
+ *
+ * Cancels the deferred boot work so devres can safely free @drv and the
+ * embedding codec priv without racing class_boot_work.  Codec-specific
+ * SoundWire drivers that call sdca_class_probe() must call this from
+ * their .remove with the same drv pointer they passed to probe.
+ */
+void sdca_class_remove(struct sdca_class_drv *drv)
+{
 	cancel_work_sync(&drv->boot_work);
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");
+
+static void class_sdw_remove(struct sdw_slave *sdw)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
+
+	sdca_class_remove(drv);
+}
 
 /**
  * sdca_class_system_suspend - SDCA class system suspend helper
-- 
2.53.0

