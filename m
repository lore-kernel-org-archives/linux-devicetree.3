Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714648BD41
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521247; cv=none; b=uMNlb5BNpaWc3u5MUQV67+W1kamRN3UBPNCrpJF24zRWGAme5DJoZ7lzQWq3h7NKKXobsfx9iTfQDL+/WsTLMMsjZd78oLwd6bpJqpFOrl3abwGI0KMel301/Nu9gR0oX4fI9btJRRDTQeW4yoaiXj0rSHgijb401upI1P4pdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521247; c=relaxed/simple;
	bh=W9GQ6QR1JtY+YQtEccM46qsoY4lGhyLNE1fe8YxR7W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BwBLPiKqatsMOBqhHvIlx3DUxTJU48jitnAO3EzVt5uy7qbMVkWpUa4XvUJzmf9nDX09ns2UnDOTcppJDf5l5npTQg9n+ES+X596YoQ3Z6Nb8fzxVsjXV6fwtsvAGU/EsOI4BrbhMCtYumZS9mB7oFUURfJpGQerTrDevHnuMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHW6wmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifBLpRvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHW6wmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifBLpRvW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3HCc2752124
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=; b=inHW6wmLy9wnj9NO
	rw0K7/sElJWgPGN5ADayehLMYph8/1SETAwlYmL3kwt7sFRnU+tW84GMVFERRi7i
	D8Q1E5KMmi7zyIWe9zGsPXkYo9dd/A9+aK3X5W5IgbzbdWssTMfRF+NkAXylg58q
	FH8bmI6P1Lu9K1/k677m3gsDJYMjSWe9uc7KonmxC7GMKLYHc75nvA1dhACXwy2T
	WBRgbpKqMxrvkmVdFYTFBg/iKyES2QbQmsIBTnVGeMMJvjH14buPpZiTWe3YE9MG
	tmjSTbICTcRP0Pd0IUFvTdKIEC5lZcDo+lcH0VqdR4ebUlbsl5EHC5sizFlGkZAK
	cGWkpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj655-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:34:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so8631931cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521244; x=1784126044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=;
        b=ifBLpRvWmFoQZsxZRWf7m6PhGi0HkswtiE9zeKPGOPUgEBFNU3BiBZbKld/vtkfHDj
         4Siagd9dvwX99dwQCxmq3hRpvluiDz1MG9vdTyP0Q0vhDPOtSyrhx6nO8uv6m65MJRC6
         iykk67CHQ3EbCqbtPXfQ3qRZxmoDz62bhtTu5nIEeEI+wYx9+IfhJQzNRZs4WvYQR1L5
         w1lojHJGxtnC/HsDJkz16DZ2d/ze8qVzddIrX9eGkOfKUpY5WQeqDhGzzOww1QzDYWC4
         HNaoMoQOvn5jHOrczVdUluHg1hu8RA41Hxz9YDonz9fwk/B3E4AHGjYtEGfedWcqrGwC
         HEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521244; x=1784126044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuuPcTdtSUx4ktmCfxB7qi9HDDnUWY78a+UtvuR/mKQ=;
        b=hA5WdUTUkLq3eq7Gdvy3At/1PdtAJSgspPZL8lPKT/krlG8Ipwy78feRUnGrsPqIfv
         bTubrP7b2U2WvLVsMv8Vtv0oeeVor8U3xLgn0GkPFmHPrlegXYEznSGIGuiyTicQlKyM
         yEqebyzGpgGINxwU0faKr5tB/ImvC7qG2F8CvXMLE5FlK6AKH3GFy08KewrmgNwi0SVn
         +sQBjwKLJOM+2Vm+S2fUvbQGG+SZWvHXfqlwkPPnhFnwsTjWrOBSvTaqiHnSYGxvjPBf
         qGJD8nWvC0QDLKotNSgWgDpsksHpuLgQlbD8CLklI8zBRQKHtSfzEM4q2nX6GGT5Dcn1
         cLOA==
X-Forwarded-Encrypted: i=1; AHgh+RpgE6rYuJa9DC9WIP6YChpb7/Avupc1CyuJg7Qi1abGrde2Tcci5dc7QRPJ1ZMlevzH9CX7nAICC625@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GJDwSEXtgb1yrMMSnxQ8tPbFYkoQI9uQS4gwYidyKFPM8KzF
	mqKuSqvmV+Wj2ktACjC9cnwVd8R+tYDYQfGuqhBn5uBkfBLk5gKpr+IlBpKrWr9EsXAdgS/M86F
	jDf4Jp/amPUVNRCEp7bZ2irV7DpIYEiruzCo5HhXcS8rLrRvUbKqjqgW1j/tCVmQh
X-Gm-Gg: AfdE7ckZmqR+pLS6rQMGUfQEsPgsXfLQW81RViBymMRTTb/Pl9C9b2/h5qzM9GWYwXN
	QrjIGF/QQun0vvA7P/y2Tp4vIhW+sRP35b2DiubRKzJPiuuaqd+2IN5SODRIJQb+YccB+DWiP0b
	T/RS4FvYRZycGebpNzkvonH76udoyjqHIJ+mFjwAx7sCZnvwys5/PBWOtDWBL/sM5jmOI470095
	q6+dZ8lIsgopvrk9zKnPsZ3AI9JeLAQRflah9yeVP4hW7LGbVP3NV1bQ1GSdmrqgy/jjL/kIoZv
	fTbLoB7piojAzEQXR2tMk/pOx06FUEBBm6rEsUqbbxv6mMYx4REKv9dr5gTggrVzC4wDYOocXU3
	gwtKSE2KJJ0wevVSG1WjsbzDKiL5CKxp6uWm5WdV3BqyOIt6jN1jRgBZxUKK+NnnroJQby0V5ov
	R3VL8=
X-Received: by 2002:a05:622a:102:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51c8b41e37cmr31614041cf.61.1783521243521;
        Wed, 08 Jul 2026 07:34:03 -0700 (PDT)
X-Received: by 2002:a05:622a:102:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51c8b41e37cmr31613531cf.61.1783521242894;
        Wed, 08 Jul 2026 07:34:02 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm8960807a12.17.2026.07.08.07.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:34:01 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 22:33:33 +0800
Subject: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
In-Reply-To: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783521218; l=13795;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=W9GQ6QR1JtY+YQtEccM46qsoY4lGhyLNE1fe8YxR7W4=;
 b=OJxBEqmDNnE+mpvn4QgrWkjbdOM+4xIYymQ2xYAUZUt9rDFlGZ+vTSfZalCs8Bq77atAjlP1A
 NNS62HjbnMDAI9EvKSbIlcwBSxsjyIwhohtOBPeOA8OsFgPHQLpAwKF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX8VDO1byY1Q6X
 KPtC/ZKBr6x0WJNlilT7160ceCEOPUBWTkW/OcwUxg7yx/gw1j8sxxBw63V2HSPKMQGcAl+2ruZ
 SPEeCv9TE9hHsDF1sdyAggRRmK2zEModaFT0bunGhTaN0YODBzCq32VHXgYPKySrx4gMPLqy7me
 OkaIQZh296pWkbGO+1tKMQW/1BgIKynKZQG1ero2N3AYaTsU3pfgips5sPTPoKvulC8uF2yq1ld
 QHqUvbg0qVHTa61z0Pbq1pPpbFkjkHDHrPRTogREeIdBshYcea+R9zqZOF8w/Wc/oMr5nL+4/UB
 0f38aTYK3Yg15IPFk/bu4TM4BI+GqbdAxe+Cd8xiSoXZVs+GgqjhOudjpCx9Uaj9OrvV88sXpUu
 +wkIjvT+IpodTZES2gVBhQWzkSQGWSwXswr5NRtWNSk6fa5rpy1ncioHqzJlgfvIADdiswmuL9b
 +ihUgwaKupaCPjf6thg==
X-Proofpoint-GUID: x1dtZr6aHiRczP8QtbH2W-c5xU0bMddh
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e5fdd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tvl-DPrvojhGWlv_sV8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfXyu7Fiurvujbs
 iOulPjvP3CgW7cDSqULd11yGNBsxNuANDw8KIFpkszZIjwqD0/BVkH7mPql2hvKBTsNQs5f7EYu
 PMlvnSQk9N3WN7Zu/dX1XTBuLKG8BM4=
X-Proofpoint-ORIG-GUID: x1dtZr6aHiRczP8QtbH2W-c5xU0bMddh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080143

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 041342fbe3c822400388f58a03e6057e186f060f..c558cdd43314931db35e463641dd28e10b94ec8a 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -14,10 +14,14 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
+#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
+#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
+
 #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
 #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
-#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0VA1B_CHIP_ID			0xc75641
 #define OG0VE1B_CHIP_ID			0xc75645
 
 #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
@@ -45,12 +49,18 @@
 #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
 #define OG0VE1B_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
@@ -73,15 +83,31 @@ struct og0ve1b_mode {
 struct og0ve1b;
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const char * const *test_pattern_menu;
+	int num_test_patterns;
+	bool cache_test_pattern_reg;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
 	const s64 *link_freq_menu;
 	int num_link_freqs;
 	const struct og0ve1b_mode *modes;
 	int num_modes;
 };
 
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Standard Color Bar",
+	"Top-Bottom Darker Color Bar",
+	"Right-Left Darker Color Bar",
+	"Bottom-Top Darker Color Bar",
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -115,6 +141,196 @@ struct og0ve1b {
 	const struct og0ve1b_sensor_data *data;
 };
 
+static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+};
+
+static const struct og0ve1b_mode og0va1b_supported_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 752,
+		.vts = 2096,
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.reg_list = {
+			.regs = og0va1b_640x480_60fps_mode,
+			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
+		},
+	},
+};
+
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x30a0), 0x02 },
 	{ CCI_REG8(0x30a1), 0x00 },
@@ -275,6 +491,17 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	},
 };
 
+static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
+{
+	u64 val = 0;
+
+	if (pattern)
+		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
+		      OG0VE1B_TEST_PATTERN_ENABLE;
+
+	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
+}
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u64 val = og0ve1b->pre_isp;
@@ -287,10 +514,31 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0va1b_data = {
+	.name = "og0va1b",
+	.chip_id = OG0VA1B_CHIP_ID,
+	.mclk_freq = OG0VA1B_MCLK_FREQ_19_2MHZ,
+	.enable_test_pattern = og0va1b_enable_test_pattern,
+	.test_pattern_menu = og0va1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0va1b_test_pattern_menu),
+	.exposure_shift = 0,
+	.pixel_rate_mul = 2,
+	.link_freq_menu = og0va1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0va1b_link_freq_menu),
+	.modes = og0va1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0va1b_supported_modes),
+};
+
 static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.name = "og0ve1b",
 	.chip_id = OG0VE1B_CHIP_ID,
 	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
 	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.test_pattern_menu = og0ve1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0ve1b_test_pattern_menu),
+	.cache_test_pattern_reg = true,
+	.exposure_shift = 4,
+	.pixel_rate_mul = 1,
 	.link_freq_menu = og0ve1b_link_freq_menu,
 	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
 	.modes = og0ve1b_supported_modes,
@@ -331,7 +579,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+				ctrl->val << og0ve1b->data->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
@@ -359,7 +608,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
 	const struct og0ve1b_mode *mode = &data->modes[0];
 	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
 
-	return data->link_freq_menu[0] / bpp;
+	return data->link_freq_menu[0] * data->pixel_rate_mul / bpp;
 }
 
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
@@ -412,8 +661,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
-				     0, 0, og0ve1b_test_pattern_menu);
+				     data->num_test_patterns - 1,
+				     0, 0, data->test_pattern_menu);
 
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
@@ -620,7 +869,7 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 	u64 val;
 	int ret;
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_CHIP_ID, &val, NULL);
+	ret = cci_read(og0ve1b->regmap, OG0V_REG_CHIP_ID, &val, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to read chip id: %d\n", ret);
 		return ret;
@@ -632,10 +881,12 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	if (og0ve1b->data->cache_test_pattern_reg) {
+		ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
+			       &og0ve1b->pre_isp, NULL);
+		if (ret)
+			dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -731,6 +982,8 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
+	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
+				 og0ve1b->data->name, NULL);
 
 	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(og0ve1b->regmap))
@@ -862,6 +1115,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
+	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
 	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
@@ -880,5 +1134,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
 module_i2c_driver(og0ve1b_i2c_driver);
 
 MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
-MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
+MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1

