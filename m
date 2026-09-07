Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C4B4418CB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770313; cv=none; b=pBClUNqtOHGuMQ/U0r9FWjQR1OUkOKFmusUQwnL8b6Y8Atw/ilQq44hkig/juN+roWl1EtcNHNs7oZXY+fbob4tuv0mWSgaFevIkcwbhXIHyPl9hAYNGIpr0wjDcX77KkbGpkpDDEHoWmsVmak3xhKMHE2+XSwa/EWP3194Jw8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770313; c=relaxed/simple;
	bh=hYnwdQoH/bPKBbKKe6pzgkii5DIS6eF65mX2d7m8Pn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2lWYunhXye+2mvwWsKUfscCjA0DuCAtinu/CjWQkZGz5S8cW4smV5HjRTg4smiYffVaY/GEkmYEo+qF6Ov5SPXG6zKCvofn3xc/fPkEq4r27nh/JAo1A24hoeolvSFiHP1rB7RsY6KvlZNS44VurIzEcAnV6jut7xFJAwYMnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJaFVAwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TW/8Zkv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJaFVAwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TW/8Zkv/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777eWN3903344
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FRAWMnzsW7M
	9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=; b=YJaFVAwfheazDOQj94HV+W5cbz/
	OpsQwKD0SX28kIAeSu2lc1PtYTGGrlY5AtVA0DjV4EfamJXH3ae3/KOsg/Jx7GFB
	pAbS6lkaU/q5vQ4C1My6m75zAhulBeHE/pU4fkulL5Co15534C1i0iQKLx5NpMhg
	wVdiB0Gj+EGttG4bzKkjs1db2lvOi5/krb70Qq+PcHognSsqsowxF+av/xBAfPQJ
	iSF/At5DhOqGi2yyHtsxeEzZQ67jQz+cq0nCerjbsCA3UGsLPfX/TRGUIf/imKpR
	2FqoDd5KHRosQF7T2Vf60CUwmp66O3nTXsXXlfu1m5Cvb24dadvyGx90PXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5xv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so535366885a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770310; x=1789375110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRAWMnzsW7M9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=;
        b=TW/8Zkv/jQhdLvvlYndemCqNuwcgi1BRDdf6BP/HlJ1Be2u3n3N7pc1snD5YWtHSCn
         U2j3h18eciSrSQci1WPJKgbtiXsumP95gA3Nk2d4zxzs/ql4rRR7CIufSEaWP1cxaNlo
         9P3LwwpdaeparEvMBvVAz+vb3/TKY9KBTDVrW9rxLAk0qUxOFSZdbRR7pDbUh8LznpAl
         fiFA+8Ah43jBtt+Of+fpH+/L8weaNaaCjKhFJzmljOvEuirGdUvQM+zHuTR+CKXV0TXp
         31tqJC0iOiv9T7aswjjTUMumXh7+5yYemmB711M/IjJF6oys3sImKubUHwIUZ9UMlhi7
         +F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770310; x=1789375110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRAWMnzsW7M9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=;
        b=gSR/7dqxn4EndDfW5XdjBctN53ajeJnd1aJc6OBmBKmuxiiivk0zv2WDIQ5M8UV22H
         JsjIpvc3cvfgu7K2KZPVVo2ffJZpQ0aVqvvyO5rcC8pRAHlCY2uLyOSp+iG1Nza1XvOr
         ruQhI7rNjzr+8QrJXd8ETKscQEVo00gXIhRltRfWX3t9REszRvjdZBxtrAoul3OscRhN
         KwQaeZhdpZ5Ek6eXSZORXGz4VgL4XYhL1N4tHoDOl2AZAny+8GWxYfYWy/LrnVoZY8WA
         L7mGca/0j1e5nsR+6kF66ZKt3eyzI6cI+bgmOXiVi5HF0ZWh6vzJc/iv58PdRkQIc33e
         j3kA==
X-Forwarded-Encrypted: i=1; AKwUvBxX1wQpZksWMO/1EykZW5BGZF7L80txEH6vymZlTFtq9FcCoHoVcZoQcbbAsj7wiEOiZt0GkW3nNVLb@vger.kernel.org
X-Gm-Message-State: AFuF++lxxEnvGXnqKbMI6JbAqQb6pfCi1rhzvYF/oUDjkV6EXgnMZh+G
	29xfVAKiozegYeS+/Sp2QytMXd1hWYgJaEGPeYHCfQMcp3bw00uKfsLcC6b7aET/oBVPY7ryhsJ
	XjeKgxtSfHENeNTTDHtraLsCP+PeH/5LEwsZSN+tobe472wg84rkrpjOgFGSYUecM
X-Gm-Gg: AYBFou3y3n2ymk0PfHn/DeQ76v59jUfFBAwznXEv9iIa6/LjR7OId+eYUJgBhxiQUiW
	J0yXinBIvPuKhbvgqzrHAbAr7l/vnLHpVMZ+l9Ha2QZr7SHxNgncD29KquU2H0mWr0GgI/nD4Oy
	qhiocTaTzUDgL06iYuGpdJrTeKaVtd7wCqG45ccUf2gFYUYc2UVIifzb6a9tUynyAjFiLvtam5b
	w8oA3kRCMKunsxWolc5ZxcbcAHDCQjHxSWm9CN9dAmu+C/NjCZA4XA1MVe0rdGQSDsR0/xZqlff
	mF/mpZGuSh4kgoci8exhL6xZAMiWjYnujUGt7NoAzFNbuGk23Jq2ST9b5zXsWvVhpjqwyRIyKbP
	JXYUXYo9svZwdsg==
X-Received: by 2002:a05:620a:4106:b0:939:72cb:baf1 with SMTP id af79cd13be357-93972cbbcfbmr1935131585a.40.1788770309946;
        Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:939:72cb:baf1 with SMTP id af79cd13be357-93972cbbcfbmr1935129685a.40.1788770309534;
        Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Mon,  7 Sep 2026 09:37:16 +0100
Message-ID: <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e7806 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: m3foAM8u88CYfEogSfoea4RQHnkw6VlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX7NbKCxGSYU69
 I/0lCx3Y1VCl2c8LYgUhESp8R0CUfcLA5BQERsaPEk0NVcHwpjsuwdU/tSl8EYnQQvOgPNJnWWL
 i7QdQHTJ02M8HF57EhWIhIsul9Hz53DlMbd14/CdaAxYH1CdHgnpcJB7UXBisZdmPgdD/QKOMIR
 hj0uxhI2LiOFV2hP6z2ylw6kPJJzMaj2Zjbi2p3mRwWLO/W4vTfWXpqcT55KNcefyb1aqCa7IhY
 qUUfn/mH+GwZ/QjlPSVJhw3lbYBHTFpsKNhL9bLeW68JQac8+mSVxJsbxfI5u3/Ej62OW9nm+Xl
 QoN/3WSvjnSv+pnLWodwwRkGZewMilwOE+mi0oFepE4VAJlPZodJYRQt/Mw9isvRSYZrDY+FlBR
 IHvQdKxK8DiVn7QuamfAXHfC6YAWod3q2agXw6xGMKoRpXo+v5Wh3eeJATIgUf0Hmn+8/IoTztm
 TihD5ltRy2tE6hlzm5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXwDJDCo/eMOsv
 Ac5r4r4eJgY1fNfyOqiCFfVlTPfvmXsYDjWoUHv0Ta3TcCWL0fib0kYNiRBzDcZl59KsE0KROb2
 NzLbsq+0EyiEW+DeuGMrk2RGvvangmE=
X-Proofpoint-GUID: m3foAM8u88CYfEogSfoea4RQHnkw6VlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot.  That works for the
generic case but blocks codec drivers that want to embed
sdca_class_drv in their own private struct -- they need drvdata for
their codec priv.

Split the four callbacks into exported helpers that take a
struct sdca_class_drv * directly:

  sdca_class_system_suspend()
  sdca_class_system_resume()
  sdca_class_runtime_suspend()
  sdca_class_runtime_resume()

Codec drivers can now compose these into their own dev_pm_ops without
going through drvdata.

For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
the ops so any generic SDCA slave can pick them up as-is.

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 19 +++++
 sound/soc/sdca/sdca_class.c                   | 82 +++++++++++++++----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 84 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (50%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 50%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..15a180385202 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -15,6 +15,7 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
@@ -32,4 +33,22 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/*
+ * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
+ * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
+ *
+ *	static int wcd_runtime_suspend(struct device *dev) {
+ *		struct wcd_priv *priv = dev_get_drvdata(dev);
+ *		return sdca_class_runtime_suspend(&priv->class);
+ *	}
+ *
+ * The built-in class_sdw_driver in sdca_class.c uses sdca_class_pm_ops
+ * directly because it stashes the sdca_class_drv in drvdata itself.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
+int sdca_class_runtime_resume(struct sdca_class_drv *drv);
+int sdca_class_system_suspend(struct sdca_class_drv *drv);
+int sdca_class_system_resume(struct sdca_class_drv *drv);
+extern const struct dev_pm_ops sdca_class_pm_ops;
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index d7444f442c71..88a29116a334 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -20,7 +20,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_regmap.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 
 #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
 
@@ -194,30 +194,41 @@ static void class_sdw_remove(struct sdw_slave *sdw)
 	cancel_work_sync(&drv->boot_work);
 }
 
-static int class_suspend(struct device *dev)
+/**
+ * sdca_class_system_suspend - SDCA class system suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ *
+ * Codec drivers compose this into their own dev_pm_ops.  Disables the
+ * SoundWire interrupt and forces runtime suspend of the underlying
+ * class regmap.
+ */
+int sdca_class_system_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	disable_irq(drv->sdw->irq);
 
-	ret = pm_runtime_force_suspend(dev);
+	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force suspend: %d\n", ret);
+		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_resume(struct device *dev)
+/**
+ * sdca_class_system_resume - SDCA class system resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_system_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_force_resume(dev);
+	ret = pm_runtime_force_resume(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force resume: %d\n", ret);
+		dev_err(drv->dev, "failed to force resume: %d\n", ret);
 		return ret;
 	}
 
@@ -225,11 +236,14 @@ static int class_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_resume, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_suspend(struct device *dev)
+/**
+ * sdca_class_runtime_suspend - SDCA class runtime suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
-
 	/*
 	 * Whilst the driver doesn't power the chip down here, going into runtime
 	 * suspend lets the SoundWire bus power down, which means the driver
@@ -239,10 +253,14 @@ static int class_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_resume(struct device *dev)
+/**
+ * sdca_class_runtime_resume - SDCA class runtime resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
@@ -265,11 +283,39 @@ static int class_runtime_resume(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_resume, "SND_SOC_SDCA_CLASS");
+
+/*
+ * Convenience dev_pm_ops used by the built-in class_sdw_driver, which
+ * stashes its sdca_class_drv in drvdata directly.  Codec drivers that
+ * embed sdca_class_drv in their own priv compose their own dev_pm_ops
+ * using the sdca_class_*_suspend/resume helpers above.
+ */
+static int class_pm_system_suspend(struct device *dev)
+{
+	return sdca_class_system_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_system_resume(struct device *dev)
+{
+	return sdca_class_system_resume(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_suspend(struct device *dev)
+{
+	return sdca_class_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_resume(struct device *dev)
+{
+	return sdca_class_runtime_resume(dev_get_drvdata(dev));
+}
 
-static const struct dev_pm_ops class_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
-	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
+const struct dev_pm_ops sdca_class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
+	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
 };
+EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");
 
 static const struct sdw_device_id class_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
@@ -282,7 +328,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index cc7045dc26e6..10a2b031b572 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -26,7 +26,7 @@
 #include <sound/soc-component.h>
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 #include "sdca_function_device.h"
 
 struct class_function_drv {
-- 
2.53.0

