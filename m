Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E533EC2E3
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989555; cv=none; b=aMB0wA89YSkkC5pS3vEgZvxdEtu95L+HWeu4RoPDJ4OoJLpF/JNt9LwgkhJMSYw7TVcQGsDwnfrdrJz5hpdQx+rhK9WLpvrplAqyCgI1tKJmLhCBijksgilgX1HDAGvHjnCu6/A//+7E2mouXTP4XpmKNGlMO9wyJM7Qs3cVrCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989555; c=relaxed/simple;
	bh=1ElxFLNDdcm7tT0G2r0483Te8LeJh+5WxdZjxDn7frY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DozbJMCKFcubhgWazus5nyqj1sZ/QW9611T/o0uKZ8luItWt7anEZMvvDCs8B7Lav8Y2E/ViBOHkfovwIAIkM+HejvXhJnye8bsIRMXyIzya7pWmn8V8zjTcvLfUFC/Xd19AfQ8nB0p+5NYzKRfuNfLcFTFsBySZj4aehVrfVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8lYFLYe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uuu2D4Ml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8lYFLYe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uuu2D4Ml"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628R7x53009603
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=; b=S8lYFLYeWGog6qSi
	BGGiiMNfwDpONqVvBrUpkhOTnkc2OpaDpoGZUTHcKS2kGQy3Y/16RYl4aP5D5Gww
	EnOA2B2qkYtdsbnXCeWYQlse1jJpeML2nr4DnGL3MZ9Rsk3JMhT+zuQ0lbf7ZKvO
	bVsWxKS4ro9NEXnAd+/YpIbXz4Ij3mmCj7BJOHY4OQgoxuUPwXvHJ5LT2n8CLf2C
	74ZsyFRKu+tgJw2u58SLco1MiuRuUTXMUF7NEkF8lXMCAhqyMXjPh8cHbW2IE1I5
	kEW0eEa6Now3v/wVBzpV+8iVwFBLdYHB2kF6wfOibRd5jVJdDG2B/4qPL4pRlLUx
	LSfllw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruku0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:52:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso40138185a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989552; x=1783594352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=;
        b=Uuu2D4MlwwvalOTFrUcczbgp4NaUAVCAH/nzbLd4Kmj8SWkbeaQ9OWiIQJ4tYFDmX4
         IppPDMZV/vUBj3Wfigapr/fPftleVR4HPrpdD9K33J0n0K6wU3qFiQC0Y3tPmQX1vwCd
         pwrgu13tOF4xEGcbAPVuNlgI2AUCxb2EZpoBjYLCcHCyFUpwE645epmIUBAreJUvVQbt
         5C+PcVrXCB9FvGnY6tQ9sfIqz/aVC8T2G+XkYCvy/hI00k5LiLaEqQhFKeizO+kH2PZ9
         E2nT8Ig8l7not04nHBfoVITMrYm7I/kvttXId9Cd3U26290lPRM/rprEMchYpR7azlE5
         pyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989552; x=1783594352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQ8k0Hy6I4Il15nmvaRyog5wQzrR4WfLYo49ICWlyxk=;
        b=ORgalp5e/xQkF9ViqIP7OUPdv6RbLDiU0ZphtN1yK4L+p5BPYSMxpcB+R4YcSInGUQ
         knXtt8DG+qPOnoML3Y9PG0NMAuc0IZQn0CYwGBTAnxhzbkHKS8vRIU6hfaFpyLJ/fpxg
         wZ9ooVJaSAR/i09DQvIcA9F94Wc2CICnJ3SL6KlM3EdZWhPfE40JyxEkS9k42OsHfg9W
         MuTpm7eO8EokFLCxGtTuCkpMeYt6TzF14ZttHlErkGGYtSD1d4uvWcWDC3TSwQE867nS
         qPWSvjXmItAKQ9UG3XbQ+FmeN54AGq37gjkVAS/0+8rJ+oXoFUiBmhNDrxGHoNFG5q99
         qrpA==
X-Forwarded-Encrypted: i=1; AFNElJ9UiOi61ZUyS2+nxgE6u+XLotNVbRbAG6Ow6ZQyQggZJ1VhSWLYbrUdSBwavAYC6CX4GF2Hl2ql+H19@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBOcjasG0qzfUQBNFnoj2dVBYGz9wGAyV3PtcNdFe9czAZpNy
	cYCvQj3JzzADj7BC2q4F8U5LEgWAm3nqQyCIBBX+XiYQbVvUQ+V6mH4iIzL/dSYMM1WOYt7luw2
	mBXhFGdQ1/cDw/d5I9PZ8p5+f/knsXiFFdnAU+8tfMOug0t2SJdd/Ug5nfQiQwhIfMbAxC3zdIc
	Y=
X-Gm-Gg: AfdE7cmHPYBcdRFr6sNFrRNsfLP/a6HoWN8wBNofi71fxo11qi4tIAEqlvrZjxHpqt2
	PHQb6OCrv15d5ESgucNiSfRM6BiPvL9Z6yAUaPpo1B3ZbhmLpO8qD+TIYgOMnlzkevwaGxPHSgr
	C7y0B57VqpFgiew8dB9vqzAC6/dPs2UprgjxiBO8QLqqH4ufVkFb988PSVhac8VNBJeLSPrgZ8+
	h/qF3Ll5fSqOeP+dCa7gc3aZ9Ydec0MMVnYcJyytihz0tBJiIei4AFKJ57692nwAqdBLsrG1PeN
	XrEhx0fRo+/Ix6Kfv4uimIgd/9qJjvRysgwDPQCo55LOzZNJm8YyTxvyMACT4F0RZw9dgK2CqwV
	/m6X+N5KvlkLaXk2Cag0rvDdaQ5F4XduKgsH+3K1XRrFL+eZNgNSj8mHDnjpaBhQ0pB8J2bLH1n
	Av/8E=
X-Received: by 2002:a05:620a:4008:b0:92e:5232:91f8 with SMTP id af79cd13be357-92e698667f9mr1332330485a.43.1782989551581;
        Thu, 02 Jul 2026 03:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:92e:5232:91f8 with SMTP id af79cd13be357-92e698667f9mr1332326885a.43.1782989551040;
        Thu, 02 Jul 2026 03:52:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80025696sm193565185a.19.2026.07.02.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:52:30 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 18:52:07 +0800
Subject: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
In-Reply-To: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782989539; l=9702;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=1ElxFLNDdcm7tT0G2r0483Te8LeJh+5WxdZjxDn7frY=;
 b=277ZisM3LZzlVQQCNv4tmkxYOtxGcbf4ReBhT2IpIAU51mHAzBJVEQwy7L2ffAFyE7SDwawmS
 4AB/ZFm6dRxC+Q3ezPE7xjLF0mjXRjQDVJ2r4XxAEFwX4K2JZO9ajtJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX+0mkUYTNA+GP
 7zvtQuqDSNM4CigI5FZfjpdwMgLpVUkjCrkIvlWd8dsLCDUBWjCRVqASogznig7SbbRlhsTftyC
 jULGPVL4n0FVk0nnODiaIzNOMsM1SYM7CMUMhoO4bL9NX3hxKCZSGNkjmnFnIUNxOgDCV6Jy04N
 gQ8MrnjaRxYJW5MBKzlfaQOH2mJuZax8ZoK12qR1PTM2H9sbnhSe6rB3g0/Dd4eAmBRPin800Bp
 vzk4EWHSEKvFZLU4WB5snJI61JYaiZ6KRFSHeB6l8akGJkGLD2ZQTu+g2B8VBq+11sH4FdVrQhg
 d5hYo5zxjWdTSNmsCZvbuFMj902P0h5hf6os+FtZ7TxzjgzlRBwQtvRQIcib6xds9iLZDCUeehV
 V61ZernIXWSeNrBZiVIvDmayUk/Nc3eUbPH5pcWyDh1s2j7XCu3hCbV3QnrWsQPeFWZsNzlf5H+
 xR00z7NXbdnscUv2rPA==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4642f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HEqEudTBrfRQd72pXM8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sB4I9XylcorMAN1dU1cvZW1QbIY3G1ZE
X-Proofpoint-ORIG-GUID: sB4I9XylcorMAN1dU1cvZW1QbIY3G1ZE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMiBTYWx0ZWRfX8at8Gz+3GJv9
 3FH0jkm01mzNdAP9Gg3Bb+cEIreAIgycJ9HYvMqADxSZhYCB28xzPi4XANMdFNF03a1YqXR/r07
 trijuCLRDnhgyc3GuoieqxvPO6U0rBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020112

In preparation for supporting further OmniVision sensors that share most
of this driver, move the sensor-specific parameters (chip id, MCLK
frequency, test pattern register, link frequency menu and the list of
supported modes) into a new struct og0ve1b_sensor_data, selected through
i2c_get_match_data() at probe time.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 101 +++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -66,10 +66,21 @@ struct og0ve1b_mode {
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
 	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	u32 test_pattern_reg;
+	const s64 *link_freq_menu;
+	int num_link_freqs;
+	const struct og0ve1b_mode *modes;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -97,8 +108,7 @@ struct og0ve1b {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl_handler ctrl_handler;
 
-	/* Saved register value */
-	u64 pre_isp;
+	const struct og0ve1b_sensor_data *sensor;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] = {
 		.hts = 792,
 		.vts = 568,
 		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -261,23 +272,39 @@ static const struct og0ve1b_mode supported_modes[] = {
 	},
 };
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id	= OG0VE1B_CHIP_ID,
+	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
+	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
+	.link_freq_menu	= og0ve1b_link_freq_menu,
+	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes		= supported_modes,
+	.num_modes	= ARRAY_SIZE(supported_modes),
+};
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
-	u64 val = og0ve1b->pre_isp;
+	u32 reg = og0ve1b->sensor->test_pattern_reg;
+	u64 val;
+	int ret;
+
+	ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
+	if (ret)
+		return ret;
 
 	if (pattern)
 		val |= OG0VE1B_TEST_PATTERN_ENABLE;
 	else
 		val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
 
-	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
+	return cci_write(og0ve1b->regmap, reg, val, NULL);
 }
 
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
+	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      sensor->num_link_freqs - 1,
+				      0, sensor->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
+				      og0ve1b->sensor->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->sensor->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
+
+	if (fse->index >= sensor->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != sensor->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = sensor->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = sensor->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = og0ve1b->sensor->modes[0].code,
+			.width = og0ve1b->sensor->modes[0].width,
+			.height = og0ve1b->sensor->modes[0].height,
 		},
 	};
 
@@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->sensor->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->sensor->chip_id, val);
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
@@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->sensor->link_freq_menu,
+				       og0ve1b->sensor->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->sensor = i2c_get_match_data(client);
+	if (!og0ve1b->sensor)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->sensor->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1

