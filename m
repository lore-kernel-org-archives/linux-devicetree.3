Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70047DD4E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521241; cv=none; b=DVaKgP5QhIIHj/2SuwyOZC0mH2Rj9TYgco8X2JOiZAhrMcxon4PqQtpvC49ufN1w7DhOo4VSgIAUyUtlmDvjfDsUC/IQUFfKuEnCEaF9LZbl3x5nKrkMBQ0PF5t4nmfiVO8N4/fzmSdhy+U+jVoaFD0nyZle3ZLt+ECI320FIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521241; c=relaxed/simple;
	bh=4YvFGN3SB3ooLIUSjf4zeCOtPJcp2wgF5ncmWtsGBNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Prh2taUb6T8anlWqUtufb25OTH0YDWjI5YdeD/KFezaQHV85uw1pjC8ANhKLjCC45xWChb+a1JFouFpK5BE2XPfG5H2HELhqh+/hxp/cq/cp5OvhGKaAlTk1eu6TY7JzTeCmAtmIaLNFh4KOj4TEadb+QQDzty7ECMr326KaYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqOIXT6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiBikUST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqOIXT6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiBikUST"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Qfs2617297
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oN05iLfqKGylZjmRf2XR7jqA+bXxWQrlP5kkTglvjK0=; b=AqOIXT6KSBJQqYP4
	TC0qtQ7vcNQrraLEl0HeA64T9AORuOmKjCjXnQDiDsxGeu87NmfATOlz4DdpWYGV
	74WKFU9EBziDqLSKTNiSQzmKGapKuBIyV+9jn/GB4lBGrwYiuT0qUImpFD9Ds/c+
	FCCcWoiD4zZEbaQzZBl0NHT059PnZWkrFZ39hl7SCjaz6FnANa1bHNu+ATKckkz1
	qjDnLWzJGnSTNi+A9aDEej1l8qiw8reyr5eR1Qi79zvpZAu0REUp3xw9znxJO+H6
	ZH2QoJRJTJLNbd3kBQlXdpblngzLv0/su+T9bEx6CQKpskP+ICu21P3S8iyJ0fY5
	LtRTcg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwa17v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:33:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f000e221d7so11654886d6.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521237; x=1784126037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN05iLfqKGylZjmRf2XR7jqA+bXxWQrlP5kkTglvjK0=;
        b=OiBikUST+mZC7YV5MTMernrCkM+wYK1gWCeDzwNRO4G9C3R9r+T6vecgPQsTr8NIhr
         oSlYa0Js5/IXT9eToM6vbkvIngZEd2/pkWvS2VPL42cTIqWZbPaB3bnlZWnyz9YbLCkC
         AHOxjMXwZdoXw8X0vrFjAkzQmuqx3PsmmHttOK/raLIxi0ey2LiitNauqWv5lWhafI4Y
         DMYY2LN9TaF1JS7d/fCpDw3Blp9YvuXDN1BHUUKFYoSQnxz37iaXJETIptNEd3R5pZIA
         mB1FWJCUaPlFhF80y/DcW+FKSrInLix7hs70JpY4ILmaY9rgcZuqbFuYOIoR3sNs/0j2
         ZsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521237; x=1784126037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oN05iLfqKGylZjmRf2XR7jqA+bXxWQrlP5kkTglvjK0=;
        b=bAdZL4Cj1lrAg0lpEMwQTykfiROlWEzGsN2aiNow4rRITukq6QW+edh0mnZ2Lmn/0N
         zHBuXBNQ0wVD2zl2InudsuOkJGTAeY784Y0Yy8AN1e07kzsuLFnNGYAIlgIvWYApszgO
         Q5So/H6R7qVErRF8jRw/HQEVl36+BFsHlHo6PSiIedL3+EmHlOaqfIiVU7c5Sbq3ma+z
         fG+zpoEVb8JUh8ZdBtq5983k4SJIO2deDfgFhmLmO6q2PZWbrLWy03iuoStCBRxyc6I/
         6p7MdqWZ6zH2YL5vLtvqrAd+OWS930tChGebQHlS85KA3Yzp7q9a0mAgsU5cjgF7sEnn
         e+aw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2o53jkPNraaK6KTr12MKv06u16PsDWH31EB5IfpGRVxGupqRozWFc5LoX2vnwyd9Gc/ZTc61+ve4R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6saf24baKQdUIB0YPWR6xeytoQEluWr2NEKHfiuz88GQjtIP5
	SiWpfX3ZG+Ef43BzmvRthfV8iKbzzGpCbsoxdp0VE5XZHCP59zOL0PLZbm7Y6i+vDgjMBTwZ54O
	dC1l3Iilwl8kTh2LTQg/WhPE6Omc5SivAj88fan1rTgFZvXlCgZhIcSJ5Mwtd5F5A
X-Gm-Gg: AfdE7ck7cQE1YFsCSjOST/Zeqty6qmnO4UG3e6kdUt5CP6sLwCZAhpZfdtWtpx13xGO
	AIqT+feoqYfj3WL6VmNGJ3v5mQaCgRNNPgoP3SvGS8albuJZSlNP4DQ/BDCUyYUXJVOQbUPps99
	5WMJJixbVpXRzW56mRjmaSdyr61Kweb4F1hI9tywnXd6F/aK2mfWMxYpStdcXV2/YXnbp6j5WID
	ADaTnBylBqnn+HfQAME9RcJlNvfj+VIOVw7txLCQsp3U4X+yYaSctZjUzD9LRJY46j0oBXn6Mpe
	djPyxxiXefQbY7Mo31gP4/BNcSfJbn+BoQgxQbFOvs1oJDn9bqLmlzH6oQ0RTKWFwlTg24YIE4x
	1iJJ1JsF/YPFdgVmCF32oEdTMwdJ2oljDjfXTV/2tjSlbfVlKEyDu8GetTIlW8NZZkm3Ippt3xw
	pfNYE=
X-Received: by 2002:a05:622a:c05:b0:517:7b6c:4465 with SMTP id d75a77b69052e-51c8b2edaffmr30012541cf.22.1783521237335;
        Wed, 08 Jul 2026 07:33:57 -0700 (PDT)
X-Received: by 2002:a05:622a:c05:b0:517:7b6c:4465 with SMTP id d75a77b69052e-51c8b2edaffmr30012141cf.22.1783521236809;
        Wed, 08 Jul 2026 07:33:56 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm8960807a12.17.2026.07.08.07.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:55 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 22:33:32 +0800
Subject: [PATCH v3 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-og0va1b-v3-2-de8e44455a42@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783521218; l=9938;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4YvFGN3SB3ooLIUSjf4zeCOtPJcp2wgF5ncmWtsGBNk=;
 b=nUvcyFYygks/g91/7dvMDewbLGWZuhZ8Anm+S2aKFyfRVyiCcMfDqVOvHlRJ7ZBssy4B7r56M
 9mfKq6QzlbGClUgZ4MqSjJE/xZUDascw0Sqwiq4PunJu9HvGYhTAB9o
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfXxK80w7RFSlMf
 Qw2PMfb7j3SdNxfcWlBkbZQVHgZVgecQvyJX4ltN+4kfHRf9zI82E8A5VaDuajmhB8/9x7oexoj
 l7Srpcd8QoZ5YcZFedahDYFjq4ypa+p+ANzjTgBRN6bWafWMed+0spdJ5+nUc7EEdZHJHWuIBFG
 p4Ieatbs9dzkmC0VlsDJ7SS5/pQMK+oGMVzAlGKZIry5oUN4yo9kXrK8ou4nuMH3/h8NaQ5sJyS
 go2y3+g+IrTcQ9v/oghZxNc2iOdr5DCZqbMTWTx9ISEFVydD3KifbTPxwkbE/h52LBqYAYZ7PBL
 U+Y62WImpeytHedLGFBrcNSYz1qKLXQcwdMFpBEgbe+MElo4Bjs/cA8CAeSWbF024Lt9Xygay7k
 kgeWcgoPYrl1Mf554xCXPIqSGzwlFXzq60YUmXuXV4Uu9QxfSuBwHgDvTUA3ULirz9yqOK3g8m8
 1u8UdueZF/E7o4fsfLA==
X-Proofpoint-GUID: uNri7U6eW3Kgxb9mgIW6JGcAxm03VBTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX+wAGl9ILextq
 RT8rmnshKiZ/d2J7q92TiBsuINJFPfnYLqL3fFbIusWT7KFEbyOH8q5N3UBV46vH4Jx50JsUJt5
 jRxoFdm3OX9OXfv8FziRIXsbY3A+Cbg=
X-Proofpoint-ORIG-GUID: uNri7U6eW3Kgxb9mgIW6JGcAxm03VBTW
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e5fd6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VAKwkO4vsx98L2EZLfkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080143

Refactor the driver to separate sensor-specific data from the common
driver code. Introduce a sensor_data structure, populated through
i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
frequencies and supported modes.

Test pattern programming is described by a per-sensor callback, and each
mode stores its media bus format code (rather than a bits-per-pixel
value) so that sensors with a different output format can be supported.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 99 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..041342fbe3c822400388f58a03e6057e186f060f 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -65,11 +65,23 @@ struct og0ve1b_mode {
 	u32 height;	/* Frame height in pixels */
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
-	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b;
+
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const s64 *link_freq_menu;
+	int num_link_freqs;
+	const struct og0ve1b_mode *modes;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -99,6 +111,8 @@ struct og0ve1b {
 
 	/* Saved register value */
 	u64 pre_isp;
+
+	const struct og0ve1b_sensor_data *data;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -247,13 +261,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x3f47), 0x35 },
 };
 
-static const struct og0ve1b_mode supported_modes[] = {
+static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
 		.hts = 792,
 		.vts = 568,
-		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -273,11 +287,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id = OG0VE1B_CHIP_ID,
+	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
+	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.link_freq_menu = og0ve1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes = og0ve1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
+};
+
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -314,7 +338,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 				ctrl->val + mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
+		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -330,10 +354,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 	.s_ctrl = og0ve1b_set_ctrl,
 };
 
+static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
+{
+	const struct og0ve1b_mode *mode = &data->modes[0];
+	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
+
+	return data->link_freq_menu[0] / bpp;
+}
+
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +376,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      data->num_link_freqs - 1,
+				      0, data->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = og0ve1b_pixel_rate(data);
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +440,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +454,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +517,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
+				      og0ve1b->data->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +539,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->data->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +553,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
+
+	if (fse->index >= data->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != data->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = data->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = data->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +573,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = mode->code,
+			.width = mode->width,
+			.height = mode->height,
 		},
 	};
 
@@ -586,9 +626,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->data->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->data->chip_id, val);
 		return -ENODEV;
 	}
 
@@ -624,8 +664,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->data->link_freq_menu,
+				       og0ve1b->data->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +726,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->data = i2c_get_match_data(client);
+	if (!og0ve1b->data)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +743,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->data->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +862,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1

