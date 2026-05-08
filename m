Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3B3CA490
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233879; cv=none; b=n9DPvQ2mY68rJM5SdFDUnKem5cMPx9rc0x/lcIFanL03lXTNpgTxWq9IZl///77JQxkqQklmmZITklYpVSTzNo80Q3LYwZOSv/r8w3sZIp21Yf4ZWo2v+DlJZOCVtkkY2wBbkbVP7kVAVXk9fWnUxh3yCDU1PwvoSDm+XGUc3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233879; c=relaxed/simple;
	bh=qKzjMJqkdl0UrZ1tsHcMhHcQFeJyK74aki59dbalElM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k75zVlCYGR7LQLaoDueQFXtvx7FT2z79gXY6NZ831/gf11s68foy3hYW8Ior33fg9Z+C2NMb6Z22/aE3EQdMjFAdtV+I8T4VaF1W0i39Sc1E7QdEm8Yvcx7bnTiiSShsaQO15mjJ2S5lKtNUSFvfOzFL94ffWpSdgJYJW6j67K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLnsCxw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbBYMCh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLnsCxw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbBYMCh3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484wrWu2182882
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=; b=PLnsCxw7cHHt3ftJ
	MTV54WNdyXsOtn+Nkrm6g5WslUjJYrdb1FbSZ8Ccd81ZDHmDH8mml3OyW0C/jK6k
	FFj4KJTMv6BebHRG7vWY3M0nGvAxixGjrbX/PdT6qLtZtNjuSuIKc7cKYK0PiLsk
	2fbpIKge0lbRser9jaw8fripEJjbSckzsh9I9Sgb8QmBCaXfZJj46ERoQ2k/rgUc
	UG2YBE1083KbdufYPFB8q86VJv4Txd2Vgo23hN75iumvsEGUqCMaI4oZQVFrJyVA
	aDuy7E7x/QmpNQ9jdqG5dnGKctjx3u0zGGRqzrsKp5kek9jpvBFjsodnLjs/vAGg
	XdRtmA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyasqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:51:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2eebb099efbso5993543eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233874; x=1778838674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=;
        b=NbBYMCh3gmcB1oJRpk0zmE7iRj+d57u6z+lIyb7iXRz64L212CftIEVDm5OFrdOm9e
         P6RqVHyQ3NFppF84/XV5tB/MkoFS1k6Dc1zQUcB8s5dwNBXbR2He8wsJc19Z6OFguIdO
         WaPPjXJ4mk+5IUE323wIUNx3hYwuKQQcii4CUJYAU34OeBCr1U74EdejcVd/L8D+EqLG
         moy89nvhmr+pfZApsO63L+BrkooFp0jKYmnNXcmpxqI/1tkzvjDni1wRFGFxiyBPgJFw
         gWynkolPIjY1pgQ5YIwpCB0bgvRqWbyXY/B3FqqD84r2crU2J9cjvOxWZH39VD7+qY1P
         vg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233874; x=1778838674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2oupfZMutQOqFk2sEilpEuCB8it3QEHPnT9FmkvAO0=;
        b=nxjqrbwWxRQprCmID5AsydRvCIirad3a4dyXQT1OY76QPkUjaYj+U0xKO0/W4iLTFj
         E97M4HDdeXDa7UA5R4/MNk4hjREgcrHHFZD34RcrqqMJMS3AwnLxFxbpKs4FadCs5unQ
         f0CyzVGeFt8RLcjBErLdbdsg/7+D/k9Kx5SZX8UUsbEL8q3pdaRJRQFCF/e79VoIa1cL
         Tceo9qAGohuaVQDATDtAMaE028acPlZsJEqdXjL44nVCMfukHMJxuysUtCEGV5bvDnrO
         zm7nl2Anf2WSMEW1Wb0/hPHF5Z3hoGVJBQvnKwjVVrRaZ41GMFgBgtocSmnoF08xh59K
         A0vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eT6cNDW3o2kRL5FMaje5NK9q4Xe2dPgFWbQeD0ALs8aFziB3sHuifU0VoOGoD60EXF1wtcF4wYhuK@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1Cek+EUPmRU4F/nSmumrrxQ6R0mstNNAl9GEE81zYoECNHn6
	OKppS6Ct5OiIq8/ZqZOd5epLSBT/VzQD1yjbzpqyKyqu+i5iU5CeIyLTAgt9EbJNJv74o+RQOSm
	4JVJE+KRKFnMovvStHTPKQYt8ZauhINv1tAkqvr7g2n7wR4QD1MWbFBh4QBRuakCv
X-Gm-Gg: Acq92OF1s99A3THphZXDdaLGPsEqoNTOznCdxbOOuTLxKE7nyhh0EZ1qtIkA0+Sriku
	QOGLan3p7yGqX5wBlZgLoVP50C7mWGwJCWW7aQ8d1fgBgFI9qB4kRUxvZX9HFJmqOEfcRJPoAas
	/vJOd6Oy3H59K8OsRVgswz1iust/WHebtz702Q30R/dbSWeYZMGXsqXVVVMXmLPsKgZDQBMJo6P
	G7+YJcBPPzALnnX9JLCgr0YlX1QHsJ4QA9v2Nfb9kFOfsvwfM6tj5oLfXy7rH7L+iFrCFUPkN6/
	te0tWw4iU+hK0du+Df2rS9fXfVj35SUqw8h89GymXeRgIpNBy6lgkHNbMSbLVqiDrGQENWn87He
	q/CtE1/EBF9g1VfdJT1KHLlWov38rNk2W2P0kkIoLCoDEyaf20cyt3gVWSJ957cMyrYcjrJobDh
	+d
X-Received: by 2002:a05:7300:a987:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2f54b360d4emr5595925eec.11.1778233874255;
        Fri, 08 May 2026 02:51:14 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-2f54b360d4emr5595907eec.11.1778233873698;
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:13 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:05 -0700
Subject: [PATCH v3 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdb213 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 3Af23nvAbOTGJuYcLgR1vSovk46SS-5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX4L4Ntmocch+7
 4YYb/zPy7u09rZ2IETaFhRbvt6/CwF1u7yi1lV9sLLywqrw+sjM4424DsCDUa3zYEp17qguelvg
 zqIf6NcQ+wnc9nUHUVki+BeioM3pUeM73zxM/RisDMFuHLT+40l0bVJiuz/kL/OYeHzAbhvc34N
 Ifs02aKYY1ODBwe8DEnp9ODxAyLqMvMBfO6e8leTjwjyYtt+DjpRKZUWNnJ0Oah9QS3X8cLrsLI
 F/ZnxtOMmD/bTy6qO6Fj4IvALwrzqlzkGEjpfAEAMEFjMtr0hhxICYdfWVIvaFjYX4paX87iFFx
 zFl9D5zfQQFNBWNzyeJdYGl8n1Vamu6yoIQrBm+KZloxamMNoqxEHiAri3JwkXknTA2tClkJW2T
 IGrrBGGAjF7D0i/fHIV9kNMVYWMyB1WrkQqwNGG1pbW87+DINdjRdn8dUEVXXDaNzd8VO6hyvCO
 7lH6CMSa+ZtpHASUU2A==
X-Proofpoint-ORIG-GUID: 3Af23nvAbOTGJuYcLgR1vSovk46SS-5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index c51ffcd93ce1..5b633786314a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -684,7 +684,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1135,6 +1135,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1252,7 +1253,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
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
index 3cebce812c58..6b7c3160e285 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4238,6 +4238,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -5677,7 +5800,9 @@ static const struct camss_resources sm8650_resources = {
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

