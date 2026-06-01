Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196CE3D967A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328544; cv=none; b=fL3yUznMFKbzrvIvOw8/1cyaeVIiFMepbYDV7O9dfc2VGdtGFL7EvNqeG3cH7yrEMc8s9Lk4zn1NGfBhxWJ/TE0QRjz1ai+mLcJ0hrl05H1GdKHTrsgc6p3emTJbqdM5S4CiTgYuMlTFUAWJ7TGpQQoGVzgtG7SiFugsUOHBPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328544; c=relaxed/simple;
	bh=WMJmbvG3UPc1IPdNbAwP4ZE5xHmhpJuEECJsEbdDars=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gj6RQKzLdIG6zhdjDxo6MNNUt6vxeyhEOhLMkdu+7STUs6Fni3JPy2IT7PPtC83AHiRMEPs/ESYUjAk7lLav55eXasTGWG6OZshTtrxzXcuQWBNX5dBJxWjUOuINIHZIn44+GYzCqtEPq0MpNJn3ooJyYKrJTZUqLZOxHcDZsM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4voZ2CN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYUhBx+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4voZ2CN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYUhBx+j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FGKPQ4110823
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 15:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=; b=h4voZ2CN8t0XKxfi
	faArD9GiIdHdIJ4Gvu0bRaC2H3Tt1V1j7XBHYc82k9/4K5aed6gXAAbAKSquSM7K
	GgdmyKj69LpWq6JUm/Ycuyoa+S5WSrrzg3hkLiGREhDmr44v2M60LJyox93QZHhQ
	Ovh0tS/AOZRkpkOkHkuJ6apQ/5REogTq5F+n+P822X1F0FFgnaG40aeW/6rkWJFi
	wuL+qcHX7/rgpAg3ohBlgCnaKzTdXZ6JhxcAWhCsMH7Ha/ocu2miR0FwtEXslCWk
	xFghtv25m6wMHdXVOgi2EvCCMyl+iLdNanle+CypsSKcsy86xGUZCTmYMxHBxPXb
	sNKmfQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3sqn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 15:42:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so7883941eec.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328542; x=1780933342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=OYUhBx+jb0n7LC7sAsxZ084HX1yesPr3kNZShRVCLAOUMz2/JuP71HoibXSLOQxO5U
         Y3ZfmwrP7v4pqehKTjUS6p87vJkMQ70x9EM5uyQZ0MwJyqdGggBRaXEJmWFlwXkKFera
         LbJPFskkVy8S103hatGSrYa2twVTz+q7SQT8gpLPA2nX95BMAlrrt0SQGi/NNlw9Qz2l
         fdJgbPGXiwBjTfUWoTBbbQDbdPq8vK/B/jZ17tqGK3jZNV6MGbd7oCoBx+gJgflbp6/w
         hNbVF3YQxGvist6oJ1rYZJg+Ea0SODQyfDDJMF8jC5fQqec+maKTtqK491/rr3RCARxu
         ymzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328542; x=1780933342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=BC5uTNHuFW+ZsG94HtF5x+pMU1sf8goSUXt/NVCDh7/KVWyRdspoYmnespv0CQR0SN
         cBGgbEnc6SdYAzQX93cWDBjWAY2nMDMoMHD+YhvCaOweBWeN48eDbdZhszApo3UIvoUE
         7y4vrtwN71yxYbf9DXqAJrNYC7VsxwNkMbnnxJtEHq4sK+tk6rLgHqVwRM0vAiR2YUSP
         y40CuEqS36b4f0t8C1LqwNIAQFHvLKneie+KVyTUs1FLmjXA95BIFFc8AK1cGWAYg4/V
         rbYxZEKVJWx8bTbs5+9jhB0MJhoRXMFfzaSqyeAEh+VEkIVEtb7BRNsrqa5+L9GfI+om
         wIzw==
X-Forwarded-Encrypted: i=1; AFNElJ9u+TxPJ4FxtPfw51mhtZ8d6hNjJf2W7MKYYjlZCPOA6MaQoGptWhNerxHkAQ6+eQBQlhJEkOottbLj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iTxT+snx+ADqqTQ5lt3ow4KJQRg8RZ4roKuSF/Qo1IxxQVBC
	t2+jaIR2boQVd7igG+jNtG0EbYXstGiSkZzK9dTVwropG7Nm6pKAwsSz/WmxTqb6bSTblLdd9o6
	Ut4vOnFs+Oovw7YIJmCGnE/oZx7hi2lKB3IyVBkhgKMadis7D/O1lMGlZEBT8Ed9z
X-Gm-Gg: Acq92OEmHxKUvYdlee9kbnnAhuBIWVnpdicp0lSGhoedN7L2u7SWIxIoLbkkRMHAYZK
	eRdyvY9kNWAETLwBmMjDbMGOFYbqRuvbAIe5rsZN5eEg8/hk+c4pOs3Z4xS8JALBTYiWT5uO2a1
	kuKMOOlje1nVwRCB+7mRqnafBUqlzShLtaUNacf8zQE6pSXjwNpVvGz9GauOdwA8EwXX0kjd5KF
	M+DXPc682/+Nuzpp5naFs3JhCTsnJHoMKHUK+oPck6DcIgl/96HAE7SEWCBH60ZYtXnaiIc7dr7
	1BrfS61qfg0RXHdhpPw5oagliiqgGLaEygjl1dYBUvZh0JdM3+8pkg2tez4Y6rBb+hnI/Omli50
	SEFLfxVpL4htIAYOhvJcGtJ5cdHbk26pFIw1aGPZ5K7XZK/bl3jaaIaXhQqprVdTXXrVyA/HIPo
	vZKQY0ddVrdi4=
X-Received: by 2002:a05:693c:2c86:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-304fa49cf07mr5189493eec.5.1780328541703;
        Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
X-Received: by 2002:a05:693c:2c86:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-304fa49cf07mr5189443eec.5.1780328540860;
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:42:16 -0700
Subject: [PATCH v4 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-3-1eb6f432cfd1@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1da85e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfX1riaQWSDCI2g
 n8R/tvQa1p5pdCxNTzCLHLXrYiGNZsGuLOsoTTKIiGtRKmK11HkwBG5VMf0dIKWRczbz9jLPTPs
 ZgGlvVXhwca0DekRfCvX31JMmv3W9TjrCsYXHTnuhiic+L1qD8Zt4OK0PKL5iv4WfQf/PTc6lM+
 X5WiomBuqoGsaaf7R61JVZxS89MbaatxwXK9PSZNX0hQ0NCrgtm5Tdlv9uvnjdNggHTY2DkTTO9
 3GR4f/kJM/5fRo8THsVc9HV3Mmy+b2cXxrtpvyjWpd97+zFQTvULR+u6DA2eiwSqSMXVwVaRWd/
 wkKs/G/X+Hsp6oWwKWDrXJtFFx7qyvGSDm9WFUZajsaQbTg2JJolWcoySFzX6ebkHpo92KW0Lss
 Ya2IiJjgAtCvJZaT2h9AfXFQheeV5XUfLvKacTT7rVCqceBfJoZWDulLn7xvQ+CHU/XzYMhaVfp
 JlyB86SYkWRdwCuQpIA==
X-Proofpoint-GUID: dBL_4xcVGneg90r394_wsccdjDv3eX-2
X-Proofpoint-ORIG-GUID: dBL_4xcVGneg90r394_wsccdjDv3eX-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a219fbf0ce3d..bb0290a4bb2d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -804,7 +804,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1256,6 +1256,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1377,7 +1378,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 834f6c1a2519..d68d5debe6d6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -6099,7 +6222,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

