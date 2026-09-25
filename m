Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684949F106
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352687; cv=none; b=nFJGVEANOgxcw5nfcV048PrsPoko0nufM+0h0XV15c64Mjg0YFkjWwxXroZXXW6OXQ722c8cMdCQlfudPiiGQ/z5MiRTGHsec7GQl/IoS2rFSlQ9wyv58nz5AoilgPd2qSdRFO0l/zkTL37Ste7AlREKi3u/XjvLFVx/isdVG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352687; c=relaxed/simple;
	bh=G9H0l/9GcdmR/zboqsNljlRUO6vzAGldsUNCNab+DQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvEwxOMhqSm++XPiEwR/wPtdbHpRmhssdY2BF5OiXNNFaOeRGAG/Aw0yM+//yPmy87VKU4CyLdIbvapJaveaRzTTHrsw8uLGL0P2irudq5SvtzNB6Ov2U9ArvhwzTeHpsQcrvK2HKZynYlysTX+ppAKWpWM0Ql61+nzHzY53vak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjgQyWJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCzpYQ9X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjgQyWJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCzpYQ9X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG3l2w801351
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m2Yt9sBEoz
	4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=; b=CjgQyWJZcbUwqx0FcvF8wv5P4GF
	DWtCsJeipuqGfPa/ZO1tz2QhCU1YX/IiSGbue/6dOe8slbju/1JUIT0fH5zSl6TD
	Ky8KH/eA4o9/bg6splWkRJ9RGmkR/VoEp9h/pPNqa9cjOcUgkZApIlhZsS0srofI
	Egxl+s277InZB0ensIe23y53nvdGDRf7YPJX9VmCXO3PanwNlgPaw9jySwHoo+9P
	PSowz3R3EtEeQIaMbhm/N9xRcBAyY/U67W5cOnSovn1Dca+TDr3vYdy2oZOp/tJU
	2pYZ745MzXzHSspESLval4NKfmSJaydwHTutxR6f4rqNyfDgiNBa/Wmo47A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57g1bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:11:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso282486137.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352683; x=1790957483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m2Yt9sBEoz4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=;
        b=OCzpYQ9X+UPhWrq9Weyp3B5e/TKbLCmbHj1F3cJzAv4y3/JzWYS/IYHKRJW5DO/QGa
         CXFJWRmU7fPkzB0B/q5t4m5ixED9BlpkfZ19TyXHftcH796j8Hc7qt9lfYWKDnotQxuz
         MdnAiHl13kD3mEnVsUDpVE9T7gqzi0Gyvzw4sSrUnfSmGhZp+fM7IRwWYrNql1LvWQu4
         fqTwdcEw+2HxvFEt42OfXGJ8UP7oQvARPXv1RC0fm66nqMKO/8cmdpaGqdBpQGoZohAZ
         GWjskzmoS66EL4TEoiiD/I8zukZB4Yd6f7i2iX14ylpHV3iSt7wW020a4tNXlzPmHo3W
         R/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352683; x=1790957483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m2Yt9sBEoz4flbIPWiHWkI5fD50vxuGXy+TfwNl4nQ=;
        b=rkRMgVNNBdU9/7LrijfcxGMLSZGGK/G5qL1BxNVQfqgy2Fy/x+yco7uX9JRGkCv0ef
         xpWwiEhofLaPSQMN1yfH9SpyaD5fl9tkczKBpcutgbSOqXScd0VwPC+jHQ1jMEct3TWY
         XhoBvQGmb47rDpT5ZqASqMznk9TgtkXcxUq0I3aqkRMz+6u2Awvg4XInGI3MQsjoLmcf
         bGPKmVKKRrYm3ZLT3MVsrq/cmgxtF1BRaE4+4wtTO2pBhFfF0aPssq9OCki53ZkbAdOz
         VJhnNtUSFuO7pAMFYXhYMFepuA5+0zfi7h6HACpeUt8QtWc2uqIyqm4726b74YTDZVSe
         U6PA==
X-Forwarded-Encrypted: i=1; AKwUvBzz29PG1npNQs26/zJlaqU/i3ukDM3KEtNJ9yxmG+EUBskAsOzayn8F+WiPv5a0pp00tUmzZQtxUJhJ@vger.kernel.org
X-Gm-Message-State: AFuF++mOl1EjTVba/07X8B19PuEjKZcvd8mykS1CUSuMo+b2qtLLXuv4
	25K24CA7nMfjiJo/bTb+xDhybl+sEqBrNJSjUi9LjhbDv5Rf+ycuDxcQb48IV52LKKtwYmepqws
	6c0xdrxUwt4tgEl/8AeFdi+gSd1lWPcOKzrU4PSPSENGpp169oc1phxETIxhhOc3Y
X-Gm-Gg: AYBFou3U9OSjaNBArsU6Is6Vdui23c0tEfOzw/Qna9YbN6Y+WiDosg+PGliPlAwGlCj
	LevGPP1gLkfO8mN5rEk9zJDd0H8eESIQCa3lqI86iTyMxWV7P9WoDu1HsxGsvpCcDBd0lYhUA3D
	hgHoErkVM8PM2opaIVHDAnIg41Hpp9IqemmN9xsYp304GCth650qsen0gXuLYBmUdQLxCpSB1eX
	Ylatmlhi6WUwEDyssBxKNQ7UAvqEn0L5xTXgddW7grbaP31oA9y6z7hwgepOfM8xq8DE+qHyo1o
	wMkfBJiX6Q34jPkPkJI3ZudZWlFsqV4ByqC1iLbgPXNMPujwFj4dhePPBa3PgrJXJ6hDcONlmEw
	BThaB/wD45uhz
X-Received: by 2002:a67:f0d5:0:b0:7b3:32ff:78b5 with SMTP id ada2fe7eead31-7b3330ed9c1mr243309137.1.1790352682681;
        Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
X-Received: by 2002:a67:f0d5:0:b0:7b3:32ff:78b5 with SMTP id ada2fe7eead31-7b3330ed9c1mr243298137.1.1790352682100;
        Fri, 25 Sep 2026 09:11:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:21 -0700 (PDT)
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
Subject: [PATCH v5 1/7] ASoC: SDCA: allow building without ACPI
Date: Fri, 25 Sep 2026 17:10:42 +0100
Message-ID: <20260925161049.758913-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9LFUZ6fdHDmj
 YgDIfSC4A7tzhVFg9UfWjT0oPIBMVWHtkGl8UfKwosXvrj0oaEjgNaR8N04tUOwzqopOxoHb8gD
 MlZZeYFXetLNapnBB06MOos2WLbKuaxZhDKGq8hIk2hcYNAVnY7phXS15QHM1hpAxl4hAh5U0ft
 IMZUpcuGrOLFp+OcyksjCOgyBZfZBOtDu4RA2P0TQXDT1s+Nz1IY82c23hgjBIlYQDXtC/qicIF
 INWlY6fa3FeSkja+V7CGUPYo/PPrKBxe83o7n7ou3II+WwenbRqgh5+JE175Phr8Oqg+8WvpLl3
 SEGOVSye70Y2fYvVyPlz9u7fAszxJu4WOYXAYDWXq8wscWj5/wGU0+fr89FtyUAcGCYRVw58BrY
 /xCW5KSQaQtL7rPlZsA1Pmf8c7Vv0gQm71hHPgpd7A5NcL8CFCvKqbSvhMcN7oNwv94xRi0jv5A
 p5fE2KPDNBjem/MyYNA==
X-Proofpoint-GUID: tAoYzlhBoihuZt7I7U69JwqDrfLkF69G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2Gd801tkPS1/
 dyrYnMZfWZanBX+kP1Ve0zPK/QZp0/58/82HJab5yfHGLph+AsOgf6gbjuqvQ8NDo44iYs0u+uh
 DC7NawBHIgHHGJfei0sT4piucbIh/fQ=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab69d2b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QBLm4htSTobWmsIIepQA:9 a=O8hF6Hzn-FEA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: tAoYzlhBoihuZt7I7U69JwqDrfLkF69G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_ops.populate_function.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the ACPI-specific
enumeration helpers (sdca_lookup_functions, sdca_lookup_swft,
sdca_lookup_interface_revision) in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

The fwnode-based DisCo parser (sdca_parse_function() and its helpers
in sdca_functions.c) stays compiled unconditionally: it uses only
fwnode_* APIs and can in principle be reached from any firmware
backend that supplies a matching device tree.

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
index 4c0dcb9ff3b9..c371323cc36e 100644
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
+	  Class for Audio (SDCA).  The ACPI-specific enumeration
+	  helpers are only built when CONFIG_ACPI is enabled; on
+	  non-ACPI platforms the SDCA function data is supplied
+	  statically by the codec driver.
 
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

