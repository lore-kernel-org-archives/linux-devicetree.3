Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76C47DD69
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464902; cv=none; b=XrKeqHt+LTBEvnx+HDdwoy4ft6R19QiBQ1NtjDAfx6eGEYlxjXpfEVtFAOUnKJ9amyAApO0traOY2JAaTqbGUMQcEMRpVDYeUQ2pQQq9p1punRvouMvnkp/4auA8PfnDRabXoCbPL3hjkCbSQe4k++8k1W+idP1bTHH5eC1Izw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464902; c=relaxed/simple;
	bh=AR2zDYhZBFJCTw9zvintYW/SIghRloUce6Ih8oifBQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSDDNtsMGQg8HfU/DmhhTHNHs46mQWsSGLtvys+sioTuOAGBpIH1VpKW/qyQQ0HH6gZAWOwC748a9B4vvoLnMmj9GLFZ5l5vhpzpVhx0zmbe0L/AVtI9oq/LOZphXyZjfrfbkpEOQkd0Co1ErVTjf2QePaif1FJ5AWBFxUia4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDs1fAFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSEPbTeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDs1fAFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSEPbTeA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z5tq3486835
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKOUUcuuJiL9Kgn4OtfXkhvO9bjbbqY+yybfhbYekDo=; b=hDs1fAFwNeWn5ynw
	uJbkhVwKI2iq2/01NJe+oNp88uVIfYerVOEdUYG/6MkDb937dqDm63Et6LU+jgZU
	N49nTQmlfGpvNVjr0QL6OniVZEyrDlz9TJP7tw7nUe4yjMMLLtAwMCFhxCDovwQx
	FC4IHYRyRK5/e8cokShHMa6CgMebfqZAuXW8bbTR0fiQznI5c6xBoUpD4nIhw8QA
	IjEk9TpNltg/go3ByKZ2CVEyQU6kcxmWzUppuTnJpqlTODvZXYMvP7lD9/puSQyT
	18DBDWd4EEijw9r9FQYNoRczHvq8d1mUXHsKsHStITeoGJnEJkmC71pVpb/iPk4k
	rYVPYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jertx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:34:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so347849985a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464896; x=1790069696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKOUUcuuJiL9Kgn4OtfXkhvO9bjbbqY+yybfhbYekDo=;
        b=KSEPbTeAbT6jxI5KUOaVaoc/XW/fwqTz694E9Oorg+hK0pyD2ZzhbPia5mbcfJME7U
         9PSjHR2/DBXV3BIrDAmNnDK5ehDoIFRks+qQdOShYJaRnwjZbLsiRgTNG/WHDlaOQfUx
         t+V75FFW9qwZCodS8NYs16zezIOmD0mgUDUCsQ0OUsCoY6zKxNIgglVnPgQY9A4P5lIC
         zjFiq7z/D//5PY/hA5hXAfeBA7h0eVM5pOSwg3mg3EhA44q/YI9ajrFLG6pa2URU+/sW
         E354l6GceVjP0KX9iCCgBqbQdgHzt1EyV7lYteRD82lGAQP2/HwF02FA9S9WlBoH1KiE
         t9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464896; x=1790069696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKOUUcuuJiL9Kgn4OtfXkhvO9bjbbqY+yybfhbYekDo=;
        b=if32xVg2tcWeNFQ8G8sFwWeO9/h7DY6fxA/totYq6EWbeushH08viGMYWV9ZuUcjyF
         HiGKIAZ4IlZBXfLTfV5ygfk/owb2V8vBeBIyy4jwNHQ1SIMzJ89RxlAfLtZO+iPcVCgA
         qRjumbLa5j4mdTQeiFPULvglpiO7yZ6gBjfyrZ/oQYRdUu1g+oP8qg0uFq222a+4zd8y
         dKNP4IQ1yrb3GrwM80x6tQJ7h3h6775Lo8zw/0E2AgOxaZBfJ8GoP6e8j9hClPxzwN0r
         90/mEDy44kXfGPynYdMYLylLnKg1UpAM5kqMYJ+oMbUpDv5/TEmGq+p74Bswjrndq7qH
         npGw==
X-Forwarded-Encrypted: i=1; AKwUvBzFQL3lTbc3JJ5rKYoYJ0j+4f3u1XmmgSdIX2fh0kHHDcS+rM+XOoTnrnPd5b2NEtE9zKvO1/DwbQ8l@vger.kernel.org
X-Gm-Message-State: AFuF++n8eZa3A4gnW9D4r54FNeMtbAt+cNWt3n29oSqieWUajbsKJ64j
	ehTwmLVs7jNzmBbAEmKeT6CyJMF84pbTZkkVvvyKf8iiA22RbILgj+DUX0Un9qZMkD3hiQviyd0
	GYHu5e1a6GqhOH3cvAHQxv51std35Ki52svug2w9XNlwAFq2XNytHfT+bUVhoESk0
X-Gm-Gg: AYBFou3ug0eqGoqbJuKFNhYKzx+KRC2NQio9Hy/ZOwiTfhMpswkMEOZFvsBxcwLA04u
	hCFo07EUqM/POhz2v4vKxQRprgcxsam74N/xI7b/8CTv2Kfwwyw0EgoLmw5tS2SyewMkJEIAtod
	wRHe5fbr2br8M3N6JzkowwliHWpwXJuzhYdNE3e9dnhMFk95I4HCiyBPpqlPOP9FM7hMdFt8XRd
	aIyAEpwBnW5U7fiFhg7iu+AiNEAMPqgFcrJhj1PyVSbLspH5ppAdVScDr4Q13m4Fvb+5kaM+Dz9
	V+9HHeA9oJiIAntDPH6m2Vtas9hEhwAiP9Sam8Mr7PMOms/LTnV8x5/O6hEVoFjyra/oEgbObAG
	lkHgfBDJuLOEzROh7SpJA5/yR4/VFV5vFx21rX3AbBn+bqmt5BmsTCT9emOUZ+7V6VQds
X-Received: by 2002:a05:620a:2619:b0:939:1ad2:ce7c with SMTP id af79cd13be357-93a29996a7amr1050052785a.29.1789464895918;
        Tue, 15 Sep 2026 02:34:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2619:b0:939:1ad2:ce7c with SMTP id af79cd13be357-93a29996a7amr1050048385a.29.1789464895318;
        Tue, 15 Sep 2026 02:34:55 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:54 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:16 +0800
Subject: [PATCH 6/6] media: qcom: camss: Add support for nord camss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-6-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=18477;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=AR2zDYhZBFJCTw9zvintYW/SIghRloUce6Ih8oifBQc=;
 b=rChTLv8uiQhaXVbJ85TZoe5YvjvGt4U8o86LLJ/gFOZJfPyvCS1rV/64b+fnj/nGdTb3bkd3C
 JJJk3JpI/yFBEZFqqXBp4pfi/orgh591JeegvAAD8KcXUPlDVs0frU1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX1YuS15pvOJGg
 /L7v5uQXoAt/Q8gbu3Tvg1uhk2aSB8J/ZZU+AqXjCykkgZrbl7x9x3QV4FiP8mrdVBi86cItzZD
 KX0hY6Ms9jWqdaWzjnz0szD0OKSx38U=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa91140 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=njAzbGqBalRLmMDEVAUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: c26QbaYOY-ro6oKtnTKCE25meDziZpZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX5OQXrfh2PqsR
 twz7k6irfqnQJWxHeFBs5qSccFbeqqN0UKqsDY+shvpqRsMqV7A8hP6elkAim4dkbzHxGj3D2XX
 tVyYTYG3joR4z7LVHXxyYbFkF8FnFhHaIoLNcy2hBKC5BCBBw+lLrgxmGsFmltUbvdSFaRItFJN
 aOcl3iMuXAFrbdpNUij2EipMdnLdit7ZaBDYVYPvncd1hDvlmZUAdtMG5YCV6gJ/D5bxhw2VbRZ
 xglD1VVmBldCvtYaWR5iEzXb0Z0T6XZTatKNiVr4dT1K2Cjfv9L6VFevHJlnY/oltDAlLF7aCi9
 kLs9W7/S3eA7LcIik0WuVi4IP/BIK687jJXjAsLOkDCjd3/mV2n6iPVkdImNCNXCs0H/px3mJ30
 o8D/DAPlw1Prhp+MQ+FLBpWXkMJdC0PlUvYAf4uZ9IdZt7V2we3S2dsqL7yaf6mSMoTVxGD3QJz
 hhyW66FGl3q49TLLsuw==
X-Proofpoint-ORIG-GUID: c26QbaYOY-ro6oKtnTKCE25meDziZpZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150137

Add support for the camera subsystem on the Qualcomm Nord platform.
Enumerate the module-level resources (clocks, register regions,
interrupts) and the bus bandwidth votes, and wire up the compatible.

Nord exposes 3 TPG, 3 CSID plus 10 CSID Lite (driven by csid_ops_900)
and 3 VFE plus 10 VFE Lite (driven by vfe_ops_gen4 with the VFE 900
variant).

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 602 ++++++++++++++++++++++++++
 2 files changed, 604 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 11f616ae035c1814e21ae2a01c5e1131022da236..d5077c502f04cf4e7677e86da1befeca0033e339 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_NORD:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -2016,6 +2017,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_NORD:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..5899f64a3c0a2f7f6829d73636aae4deda42aaea 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4536,6 +4536,594 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources tpg_res_nord[] = {
+	/* TPG0 */
+	{
+		.clock = { "top_ahb", "tpg_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.clock = { "top_ahb", "tpg_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.clock = { "top_ahb", "tpg_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 400000000, 480000000 } },
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_nord[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csid_csiphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csid_csiphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csid_csiphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE2 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid_lite2" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE3 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid_lite3" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE4 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid_lite4" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE5 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite5" },
+		.interrupt = { "csid_lite5" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE6 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite6" },
+		.interrupt = { "csid_lite6" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE7 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite7" },
+		.interrupt = { "csid_lite7" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE8 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite8" },
+		.interrupt = { "csid_lite8" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE9 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "top_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "csid_lite9" },
+		.interrupt = { "csid_lite9" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_900,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_nord[] = {
+	/* VFE0 - IFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe0_fast_ahb", "vfe0",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife0", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - IFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe1_fast_ahb", "vfe1",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife1", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - IFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe2_fast_ahb", "vfe2",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife2", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE2 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE3 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE4 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE5 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite5" },
+		.interrupt = { "vfe_lite5" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE6 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite6" },
+		.interrupt = { "vfe_lite6" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE7 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite7" },
+		.interrupt = { "vfe_lite7" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE8 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite8" },
+		.interrupt = { "vfe_lite8" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE9 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "top_ahb", "top_fast_ahb",
+			   "top_ife_lite", "camnoc_rt_axi",
+			   "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 } },
+		.reg = { "vfe_lite9" },
+		.interrupt = { "vfe_lite9" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
+static const struct resources_icc icc_res_nord[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -5553,6 +6141,19 @@ static const struct camss_resources msm8996_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
 };
 
+static const struct camss_resources nord_resources = {
+	.version = CAMSS_NORD,
+	.pd_name = "top",
+	.tpg_res = tpg_res_nord,
+	.csid_res = csid_res_nord,
+	.vfe_res = vfe_res_nord,
+	.icc_res = icc_res_nord,
+	.icc_path_num = ARRAY_SIZE(icc_res_nord),
+	.tpg_num = ARRAY_SIZE(tpg_res_nord),
+	.csid_num = ARRAY_SIZE(csid_res_nord),
+	.vfe_num = ARRAY_SIZE(vfe_res_nord),
+};
+
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
 	.csiphy_res = csiphy_res_2290,
@@ -5744,6 +6345,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,nord-camss", .data = &nord_resources },
 	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
 	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },

-- 
2.34.1

