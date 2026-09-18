Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E814F4D10
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737575; cv=none; b=TuC6GSdHDecS+nt7W8Dz2/yKIcNP8832db4ckrIUnsOM6DG+AGF2da9Ri2fWelJ/JBGMlZ80yDWbfc59TAjoDbiPIlALeuwWyu3DToiwehNqLhkBZI8tY/SIwT2FDVkhW1U+QlaXuq1E4pGDwWq3FK6wpWelR+S5lRXJEGC+R98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737575; c=relaxed/simple;
	bh=xEA5Mk7c5Lfp+mhJS1CZAxH/COdBNxDQFdboHwJ6tfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=im3dyUD2LhgO8s/QH0v1qlN5GwmPkD4pi7ya9e8A5H1xKb+jzpiOBYgMyZ9KMXohkPt8Gu9qWonF2KwRRICXkyFBYDw1qLucXbknNFJAZs30ivvFmx1G8OZoGQKqVi7mk61f5bzUnXKaYJ9PnMl9TATbdVbpBhRLNwp+PNpd/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrwdJnBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNEZCDTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrwdJnBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNEZCDTt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu1HY819752
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gHRWnsaqzVv
	rj/VfSil1Z7BTKXXu2Ot1oVvsS3nZvA4=; b=GrwdJnByo5ysRxPAlqZXP+nPedX
	xnEKf2eBVbEXQgS615HEA7AbTYIfpKUuxv+ii/z3vipgmPXpmdOrpxbUEHOKtMOb
	cHmluvI5sIGVif9AzIpTGUMsBY+T4YJMo0Aonqf+g9vmxfU+0zCjDt/rIzwhl30x
	jqezEN86tZGD1hKyRr29nPUMyj3sMa7ltf0ZBl0a+WIp7y33mLqjGycYonWUhqir
	b/+6+M/idopoDpPZneIo9ERCrReJK26EK413b5ChvL0O3H+X5rylUVJKdWSGboQU
	jhV1hIkfPSd/fkoH2MYMDPg+LD1cr+xM5rIXuK97Ex1NRbqfna4MkzfGlZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt2vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:19:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so181977585a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737570; x=1790342370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHRWnsaqzVvrj/VfSil1Z7BTKXXu2Ot1oVvsS3nZvA4=;
        b=VNEZCDTtEGQ63k9XtN8vZvl+bkC6aTjE9kwU0H46PmJw41MPlr/nQdp01EeCdFSUjZ
         bkBiKeEZYczDUSiuFEJiRKgy7ow/AShVz/T0lM2wXdZqejMnqLzf/93ukXOjtq/wpp4h
         DyE9Q3swk2rfmZ/KZZbjkDgNSB9wXkNo6+i1i8mi6nlNBtDxIr2aPHPvQgjhVtLw2y1S
         /nIsUB+BVGlFs+v6hAboDa+CEL/GJvXU008J344DaSBSUNRacyd6hMufhwEeT6vvNLNP
         DEjT8c4gUNNEuPV5wPMG3ExBSdgmxVwa6tgwSqcD7YBEVTDXVPwt2S8tF3f0OXCz+n5f
         wQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737570; x=1790342370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHRWnsaqzVvrj/VfSil1Z7BTKXXu2Ot1oVvsS3nZvA4=;
        b=wucKyrU9GCTsKc0tp4heYmub/FyJSH9YAMWS9fGrJ6SGSSoA47cyEZDcP0qjKt7qhs
         dBhbzaGK0CPG+PhzCk1qLr5j7Hj3Vcvd8edFp/vH7MNDlLEj77CfYgp2aLLSH0GDkMo2
         VxQV58JmqUx7fhMHpiIov/3VbLLiSF4mfR+CsPgzAqOM+f4UaNYICAj2VaLzeuJeI2jp
         qSZSaYyKxCyMm8OCt5pDs61nbSIOIU6ihFncZgOP9o/sET9mZCejHbNnVbM8+IdADL+s
         j2ooomt/n88xfJIwi6WwI+KpY5uk1OnNYdfPsOF7HgKjS/hqTa/7yghS9Ywt6LY7CUyf
         XkIg==
X-Forwarded-Encrypted: i=1; AKwUvBybOkVl7t2VOihl4XXr68oVD5gl4iNADemIF2PUK/GJhvVIF/KCmn+TMxTS486Ug08toZRSSJo3L50o@vger.kernel.org
X-Gm-Message-State: AFuF++nZ3DTjkp51+p5icI5WDeE9WfXoyssHbdKF6WRFgNdJuVmqJbZO
	2lg2yd26XlXl8WnsaFmNAP/YxVC4CfbY03XN7VZEAHJj6/4b+VE0izx4txRe61JAWc1dIQMwXOx
	Tfq5oAZ7a7VixbfqX/kVsj5oQzJR0kNgMPqzYrp4Z/Dp1hFGHG2uTwsIlcKEKjthk
X-Gm-Gg: AYBFou1ZnVWKXlmI73Ja+tuFvaIJHeWhDDJAwFMMsJi4drRrpc5IlNxmJTD1yJkITjl
	CTHvAr4tNa/WJ2fC4GkGHxuTjIsmAzeAM0+iXx3VkEQHmG9GFc37EQJY6iXS3WEe179OOtctDr9
	+EzCVBl+Vf/YOmLvmJpUWC8/RFoX5clgO1r6eWRkcvVbkahplddPMFeZXnWubYTRmW2L1a/KkYM
	DV/0qaL8NZ2mDM10A3zGtTJKnMllGlgQSzLCY9LuFAd4xFTe/1BjOSJrsr/k5hOafTfEL+Yr2SD
	S+1RSOkQie2XD8HSS+Rk2mRmo5YDwm3j6XjR9pbMtYOxeg5dwC5jnjrAuc+ta2ZmBsoNT4K+wDA
	BcT68mMGA+UwDMQ==
X-Received: by 2002:a05:620a:4512:b0:93b:d7b0:c96b with SMTP id af79cd13be357-93bdca329e2mr323688285a.76.1789737570165;
        Fri, 18 Sep 2026 06:19:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:93b:d7b0:c96b with SMTP id af79cd13be357-93bdca329e2mr323682085a.76.1789737569601;
        Fri, 18 Sep 2026 06:19:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:28 -0700 (PDT)
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
Subject: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
Date: Fri, 18 Sep 2026 14:19:06 +0100
Message-ID: <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad3a63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RY6toyVs4qztpF5PSasA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfXxSsJ0sj9XMck
 VTGPHkv/nPH22fddCSfE/lSgT9ctJQxgq/pYR1QfD8rLWumTE2TIbJZDdZhY+sju+L46gtWSbPS
 WJGGrdkI3GaW/Ar6L0CUMisinVqWe9Hg3qz8s9xkri3RCB7OAXynYdvMEZJBG4hvG8Cqf96E1Ei
 FWzxY7YbFfzQRmmKR5/PKXDpXXCV20pxPozjpGYXiP+3hMk0j6y29HUbj3sA6jwCqZ/FNRnDDrz
 k52CTZB5xLfg8RyHpe5CTA1U0YSkZSlPS3LZxdS41hfpU84ithlmWW1puN+Tvb6ePlT5HrIjo0w
 mhq1EygE6avHFXk8ZpXF2nHjV9aM/VQ4jO+EVg/LaxQRQ/718D+PCz4/Nskjf9pWjBZrCm/n+uG
 xOUyujw4Gx253m1TiSAXG6KDpEuOgENYUPrC39n7O6SSOWo6/cFwi88BZa941T/+2B8TzBrAWjZ
 d6R8O1Bm2DffXGVTf1w==
X-Proofpoint-GUID: lxo6pfGCJCJ3DVlp17K85abG3-1gitl2
X-Proofpoint-ORIG-GUID: lxo6pfGCJCJ3DVlp17K85abG3-1gitl2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NyBTYWx0ZWRfXyhmZ1G47HKS8
 BAnJ1daweZQZNIx7JsorOI23b2zBIF44aQsnR74AMYt6gWBWEgDD9gWCFPLmZrpy+kkcKRcCOi6
 fRLDayTdj3hTk0//yAsQWlo9+A9T2D4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180187

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_hw_ops.get_function_data.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
ACPI-parsing implementations in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca.h            | 23 ++++++++++++++++++-----
 sound/soc/sdca/Kconfig          |  6 ++++--
 sound/soc/sdca/sdca_device.c    |  4 ++++
 sound/soc/sdca/sdca_functions.c |  2 ++
 4 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 2bdf4e333e04..db2672b3aae2 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -60,20 +60,16 @@ enum sdca_quirk {
 	SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING,
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
-void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
-void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 int sdca_dev_register_functions(struct sdw_slave *slave);
 void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
-static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
 static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
-static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
 	return false;
@@ -88,4 +84,21 @@ static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
 
 #endif
 
+/*
+ * Called from the SoundWire bus during peripheral enumeration; gated on
+ * ACPI to avoid a soundwire_bus <-> snd_soc_sdca module cycle on DT builds
+ * (where the bodies are stubs anyway).
+ */
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+
+void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_interface_revision(struct sdw_slave *slave);
+
+#else
+
+static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
+
+#endif
+
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 4c0dcb9ff3b9..72c02943c49e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
 	tristate "SDCA core support"
-	depends on ACPI
 	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
-	  Class for Audio (SDCA).
+	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
+	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
+	  (e.g. ARM/DT) codec drivers supply the SDCA function data
+	  via sdca_class_hw_ops.populate_function.
 
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4bcd8d1fdff8..3f302bfa5457 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -15,6 +15,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
+#if IS_ENABLED(CONFIG_ACPI)
 void sdca_lookup_interface_revision(struct sdw_slave *slave)
 {
 	struct fwnode_handle *fwnode = slave->dev.fwnode;
@@ -45,6 +46,9 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
 					 slave->sdca_data.swft);
 }
+#else
+void sdca_lookup_swft(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index f39008ac0e7d..1eb6418e132d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
+#endif
 
 struct raw_init_write {
 	__le32 addr;
-- 
2.53.0

