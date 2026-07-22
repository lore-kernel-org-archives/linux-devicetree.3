Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE0459ACD
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763756; cv=none; b=TH6IDzatPPAwfxyWjslg3vwaXK6R/EGBO83zTng+0glzpfXs3h5XbwTaabjkmFxc7Y/ofvZUYpMbSFCqM/gGZpv1lIq3ze52E69dU5zaghNOLSnHPjlyCaR6mVud5ZYlwU0uni24HeO7sJ8QsNmYR/7fCGqztupT4VVqF5xuqZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763756; c=relaxed/simple;
	bh=Y8OrT1b9+P25wm+nsipK+cGCcuo3jbfSsyp5e8veefA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWPH68Aht+23KewTHALT5NXPJDx2hlKdAnse7zM4NF6N+GrrZ7707w/MSmx3VSfJpJKiDSbMFSJBPoToUsjVCe6fJB8ZMkK0wl5zwKu4g2o/yjt+/b5yQFuqyO28J5gX7gAxapCk37n5UtonWR23EJjXom9rKLtcR1peNc+ksmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ay6c1PIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKQqw1PO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ay6c1PIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKQqw1PO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMo0in2255004
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6twen9BOQ6k
	ut18DPLsELurHQAzGfflSUGzYdphjhes=; b=ay6c1PISlnGyne/qPpS05V6Y6hY
	Fx3UPU9o+5fRbTYwTX9P0w+z8ME4g6RpjqxreaN+7uwG6Gi185g9mUp06ckx49x7
	D8ZDZ1lChAjfIiVVnz/8QN7MKLBAy4zoGaZzQ/vKDxWM0YzcKqPwbMN3wu52Y8Co
	ZBs0OSgcJeJsYRUF8MLjAnU8eUEai15odpZbDOD3VvHpuGw5JdEifOhd8jIfEaLn
	KlhBYFRePGxZbJyGtTQRW2pq5jdsclewAo6wdbFkwOKPLwLKdOBQsipAFmuwa6UC
	+mCVmVPSklKi5ZkFjsA1+pa/Rh0LDPx9rArl6bNlqVU4lLnvAIWehMMRG0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7b65u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:42:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso256421cf.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763752; x=1785368552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6twen9BOQ6kut18DPLsELurHQAzGfflSUGzYdphjhes=;
        b=EKQqw1POuO6qxztlT83qeZsl51bOlUfQd5asUneDP2Rz7sTB4NsipEzsOQxpUTYA2K
         7Hv7GAKo4M4MluHDIVVJGbW18IwCIrr7lQR8iruJAN6La7SOo7QY/YVNzC8vu/zxgEc0
         egStAKsWafSAGGv/ElhSzwAuDeNgMBf7+a+xGOZUSBFpXCCX3tWvvcZvByVPPiQ4qHWO
         FNAsTyleVEhAELHjkymq5bOuIH+GcfomavBYfX1fmIe0NVZHre40B4LjOv35WafxSpjL
         eKzWTB555V9jYJzRf6nSKOj43GPDaSZlEuYYY3cmRhtkiknhZZj/BH092mkxgq6RUtct
         9gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763752; x=1785368552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6twen9BOQ6kut18DPLsELurHQAzGfflSUGzYdphjhes=;
        b=pjAF3TGEf79vaB7CsZzegHI7tUS3TGtnD63JNET4AMz84XfSKfKRfHwwZLSL7bFV+t
         vth+Odxb+VVllpFHiov7prifla5oS1NrmUsaN55cLJRTRxOAyMS1HgympxK1n/w8xHFb
         1feyj/GO0kYGscgm9hXUJvSccIICccZ0UevphajVPO8SV4oArnvsynbU45DNWcysZfbM
         TV0IfgakySd1HknoE54CgnUektdoMmSKzqZ9wpnloy6pZdS+hKkg+1MA2DUGqP4C1xrD
         ncYHLvsA/oNkCd6OvAS/9io3X/2HvOYExlyRPvQdDcpUfIJDgrbktdYBwDpcC1Tgmcnp
         Rezg==
X-Forwarded-Encrypted: i=1; AHgh+RoR4ENVTXozSESKQGkMIduY7LH5WT6DtVxsOeKZhES9Xghcpp5q/QFiss+7RpEGyVjHX0XQTU9O5Jtd@vger.kernel.org
X-Gm-Message-State: AOJu0YykzeEuL1jpePdvsDgSWQCB932v/dKAALRrWsEcqHMyT+EI5Qe/
	t9w33fSWNrmfoD7JzfO7oONSeeu7mtcJc3uwNM7IN277WLfyFlINMXtQKZIu9CDfIxTn1yp2hib
	w74TAVkjaLkuGp07Z3UvC0SN5JeUDpu308TEaRliX73nF9+tKtzN9fpuCacYw4xlK
X-Gm-Gg: AR+sD13GQ5yzoFTJJ8+Byh0+J9kSJdWaFpVQJJYj6FiIv4aJtGNpVHYPZCMflIEwFKf
	4xc0ZtwF97lhXYV/tE/qVLZXzvSvK14WUBg1bAPDsY7432LqwzTRyHUVarmK0Un5QmCR/b5yn3g
	Kyt8v5AHKYzGFvydTZy+5qQkknR8CxJsqqk8Q+lBgAHvX8qg20eiko/169rvRuMMYEuHEKjaXM4
	7VIyH3pl0E+nj5Mij9gQQ0JRWvL94r8Cwi1axkE51X2veT4MbmH+2aDFxwkEBXpDwcTtSohsFw2
	PHKRuITtAD+MWczP1mQq9ctB5BssDgd0boRFCYxWspwddkNY7mZYxg6saTIKlUkgP3tqthVwjPv
	zsrcFDSl/D5B5/w==
X-Received: by 2002:ac8:598a:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-5283de0e53cmr6820021cf.25.1784763752007;
        Wed, 22 Jul 2026 16:42:32 -0700 (PDT)
X-Received: by 2002:ac8:598a:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-5283de0e53cmr6819781cf.25.1784763751566;
        Wed, 22 Jul 2026 16:42:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 2/8] ASoC: SDCA: allow building without ACPI
Date: Thu, 23 Jul 2026 00:42:12 +0100
Message-ID: <20260722234221.884765-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AxjApYQGhdO23LC4BJJlPgRq-2IHl9P1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX7Qje/Ha2wQ6l
 u8/WbqDxoKaSGk8qIiDvfXpqYf23of9+/sCEbjau/zkJzcHSNHe8uiQNzMm5nO3G7SSKKZXQ2yj
 Gw/fhAwDZn8iynm8vtYusOrByKS2Auw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX1TV06DMozeER
 OhD6I6HrhGakO/advH/VSVVooLFs5BkpX6SNeg5l3g4VfG3R2hqBla7pmRS02c5vMabwzY6wSKk
 xswvzSHDYeE8K6sNUMhFOyhpq15aMAAFVFOObTd6qsYZnBKjzXrNcN2kweIaS/Gcw3twcEHojED
 ZL7WPhGeilA8FL+EQ/esExv6INTHt5sLJStyUnrlHjh7qzREml2wxkXKx9/gLsIyB4WzCjzkGov
 uRQ5LG0xoLyH6XtbYWWA79D4MmgE1XjwV8W85hK4vp6gFnBgx0VfKVNtjZefZWVPF12xhGbRUEo
 UQo2WDLyntZfE4zJ47EpBWrnU5Zs808QsShLMMX8aYMOo8z3shpgmmnpVeFReTSw0DvMr8GqRfc
 Qff4h3VEcC4G/L+zPcVYUpClH0p4eEjd0iywj3bmL8UNy1YIxBjY63RQE0SeYerQBEyLbAF0opV
 suhXfG9gzwN9+aiGNvw==
X-Proofpoint-GUID: AxjApYQGhdO23LC4BJJlPgRq-2IHl9P1
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a615568 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=w-sIlrOF0iEp6es9nnkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

The SDCA class driver is useful on non-ACPI platforms where the
topology is supplied statically via sdca_class_hw_ops.get_function_data.

Drop 'depends on ACPI' from SND_SOC_SDCA and guard the
ACPI-parsing implementations in sdca_device.c and sdca_functions.c
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is off.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca.h            | 2 +-
 sound/soc/sdca/Kconfig          | 6 ++++--
 sound/soc/sdca/sdca_device.c    | 4 ++++
 sound/soc/sdca/sdca_functions.c | 4 ++++
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 2bdf4e333e04..c449b10ef893 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -60,7 +60,7 @@ enum sdca_quirk {
 	SDCA_QUIRKS_SKIP_FUNC_TYPE_PATCHING,
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
 void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 4c0dcb9ff3b9..dc4cba1e3e0e 100644
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
+	  via sdca_class_hw_ops.get_function_data.
 
 config SND_SOC_SDCA_HID
 	bool "SDCA HID support"
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 405e80b979de..59d6c7466d91 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -28,6 +28,7 @@ void sdca_lookup_interface_revision(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_interface_revision, "SND_SOC_SDCA");
 
+#if IS_ENABLED(CONFIG_ACPI)
 static void devm_acpi_table_put(void *ptr)
 {
 	acpi_put_table((struct acpi_table_header *)ptr);
@@ -45,6 +46,9 @@ void sdca_lookup_swft(struct sdw_slave *slave)
 		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
 					 &slave->sdca_data.swft);
 }
+#else
+void sdca_lookup_swft(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
 
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 77940bd6b33c..8814adc05f04 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -25,6 +25,7 @@
  */
 #define SDCA_PROPERTY_LENGTH 64
 
+#if IS_ENABLED(CONFIG_ACPI)
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -198,6 +199,9 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
+#else
+void sdca_lookup_functions(struct sdw_slave *slave) { }
+#endif
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
 
 struct raw_init_write {
-- 
2.53.0

