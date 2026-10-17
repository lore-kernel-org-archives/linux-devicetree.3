Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDD3D811C
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210672; cv=none; b=kgR3w1yoLaQ90haVG03vVLTbXrncnbSQFkbT1ikXRnclPmgwrSMJs/1W7GwpHn/31VeDvSBDwXRAKJ3YwKQsUk1FFJBnXwCIBgtxJHdXFQjxOCtiIhdUu5XhhMrhxthvBUOOECFUxrMuPpAFBxNfe7kqRcajSbH1hDQLTj10uSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210672; c=relaxed/simple;
	bh=ruE5tx1HkuW+fOzQ6tZ9eszUs2dG5Y7xPl/O9+fbxXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9cgMxn10uq4sZGDwyjTgugeRffOhIpK9bBGIT0tspeWaPPtNBvv6WNvo3zogjNrgu+TJbgcx2dd1KajExK0MOM0fo9SfKanh42RzrXEGeAoON+c8PeIVVMpksksvfedo+mjBDzyu3Z2xQGrJFZG+AuZlLBj/+aojFINl34tIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTaDpyC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHHPtlXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTaDpyC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHHPtlXU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30wCl2625434
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8vaJk7pZN0E
	kiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=; b=fTaDpyC0+DVNUcByVNZNwDaZMHM
	n60Iu6gzXawN2L4tmd9KQ6SLblaNZOCPrUHOsVW7gbCupgZmzvCfcAHwBB0tX3dC
	89daQ4ECOJhAfjevDZ1ZCDKKdiJHCaJS8lJizflFWlgBIYa0JQbtDISm7HyVz088
	U41khwJ03wdjwwrDbqOSTbRspKipaITmaNFPAtynjrycoyUUn1qv8LAC3NbkJlMT
	G6W9SLCOnrl68n1+qFTRTcfd8ijMs6E4AW5kuzU+e+JHj5zGIpNInwpNYcZr8E6N
	WxsTAIWhPuvS/HlfDMNS9LTXhkc0/1Wve5zSvoVdYknE175f+jALo1sd8zA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtcnxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:17:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1369504eec.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210662; x=1792815462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=bHHPtlXUer0VRVsv3WOKRCMIC/tWTIRA9LPQHe+e8dQ+UJxWViDJJDanly7gN+6ufr
         4s6ZU2QT/vgyBLk72pyfaJh3dhHU90UyafFonx9WsHpEtSEyi6MQ7gdE9eVotRAIZIC3
         YJolq5u1NtP1/TE1tDCtUKTvWXFlIJwo4rzBdhgZzdXkKV0lj7F2sE0roM1yf6y96b0o
         yM0LyyRltBGeXItOcK+avx34b4BNw9HoDFdVl1y6oIeJS8GJXgN1S7S/szmUtqwyIyBe
         j8nm7gFlinrJRYabOv5Kc3uRUjPrJcr3q63DL5ot89iTa82JGqWFQbws5pROTJo7o/w3
         HLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210662; x=1792815462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vaJk7pZN0EkiRbaTALnGYFx7tPa0ceYy+TT8IeScvI=;
        b=phr/EHHAiuc3cHxLL/34mJmd+EFJc26Rlc2o2WszcMZJp4zj5sqMM4B3r8V8xa+pSx
         OSjblg1bpmD2qzzu7cpGBcWD2EzNpdD4Immpzp7GV2dG8UdMZkgploHenX+xWeY4CRes
         UT6/x27bxQmRClrtxOyL/RpUxrShXggdQd0dFFHExvkb6TQ8PUHNtrDy7C7SQxQvmPS+
         Z0gxRqlDN6huIMWyUvxuwFwaFcibfeMBwwrgK9MoTtn5r5N6lfw2eG8S0364VQ65JKbn
         CoRbK1wnflwWe8ymp/V6FjXRXdwr0hm99THZ8P+BMCYqMMeOvKmvoOyDAXZCYMbxYRiF
         cvAA==
X-Forwarded-Encrypted: i=1; AKwUvBxFpVJHGJY6Sr6oY89uEcHhlanUPbAMu4rPushPQ6EihuShdct5iMbQnwaIXy1DX3INU9qOXNlZI5m7@vger.kernel.org
X-Gm-Message-State: AFq9FYKZS/N3eHLntkD4LOc+dWgcbbzv4zX4tr/Bs27ZBO5esn9yd6L9
	871gcrcmSCZdHdq+OD7QOR/1uYctxMBfBmH7hsFCPShpNtprVeyHErFehs8ims25MK/eikfJTXi
	rMZQ8t6DolmGQHrwN8/EqYcHt6UyKkYEjUUngnzs0I+aDY/htVzynY4cMtnZPCtEm
X-Gm-Gg: AYBFou2KQwj1IipCCMf0DRfxR3qtu6gDIasuK4UwFic2StEL5WdXpeI0G74H//taPXf
	6ZsMmkMSP1dCN9sFqNXaM8ylo++f7GcHi5P46gDO73sc1qi3lWaLvU9TPw92zGtL84LUttDV7Ir
	ogM8Nrfb4cDmVjq5LuKYxBUChhpKoMvV0DSDnLru+EEhZHtni4Z2N+XAMysA8YHb0dm1W2/AIHb
	vJcdDV2pi7RBgnWSNyzu3meN0HKvUmoFNK5S9K1C2fdwgbu/zzc5kZ55Y8lBbPWsVQbrAsgdBAD
	Xebjq3qYBI6cfdFSYursG9FiVhkCdJCMKyU6X+ZPNnUF0ATwXUPSbOJjztpkpVXlpZoVgyLuw4N
	UFvIYF1Yq3VQFnUA1Ic/A3kM7k/pi8r1VII6L9LB6Cgfj1SUd5CYsqg==
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360167eec.31.1792210662094;
        Fri, 16 Oct 2026 21:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:41d4:20b0:359:818a:df2d with SMTP id 5a478bee46e88-361a2843cd5mr2360129eec.31.1792210661476;
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:41 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 3/3] phy: qcom-mipi-csi2: Add sc7280 C-PHY support
Date: Fri, 16 Oct 2026 21:17:33 -0700
Message-Id: <20261017041733.3946816-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX8zD11Beh4LYE
 KPBtkJjTrY8OjMkUHn8EwdIq4uojr4mjE73zZAAWamw0eXQ2BXJsGkzFnUHnfZ/94xkPOUNegx/
 1ztHcaZDB51Ghb3gra82xsExN21JxbkQsOI6tEhcRkFKPKmkjSnATpBWFIZv51A9dX5QeEBQffH
 gY4ITJNdPBU3Q0RaPW2IuH5X055WkXjMJZNpl30N+INL0/aaP1+opMQn+/ogDxK8ccJ3tOnOsiO
 I9bWV31JX7/8w0nTNUIoChMvy9UDAVi4kWEj/CYHsDWZCngy8dqYH0tZvK3hATQUAZ7RFx1B598
 BZoNykk/yDt/EVFgJgLtr3uszHU4c510Pd9lfj6CXoawOfDs9Ap+L+LPfUK4nFiqZPsqiYP3O5P
 ebTay59YyMZLf2tPN6E+IvAhucUsm6g8OXxGKAjEBOQsH51QxnonjBX/NWSSGRbR7p7s7PWpVdn
 jPiojSBn786PqZ1TiOA==
X-Proofpoint-ORIG-GUID: 2-ihjGz5uBiJGOhkqBrsBjipglt-su_O
X-Proofpoint-GUID: 2-ihjGz5uBiJGOhkqBrsBjipglt-su_O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX8E8MwufDrheF
 aQlMc4cH9QzKN0e5nk/eZLGeahaY/etbyhMHad6Uk5Mfq3I4sazkqwqql18DR5IRyiwyhyyIQbV
 KkvkGlF2FgYs0RAN9bUeGyCStTLC4Co=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad2f6e7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MGGm1cd-6uVm1nftqCMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

Extend the SC7280 CSIPHY provider with C-PHY mode, so the
same qcom,sc7280-csi2-phy provider can drive a sensor in either D-PHY
or C-PHY mode, selected by the devicetree bus-type property in the
same way SA8775P/QCS8300 already do. No dt-bindings change is needed.
The existing qcom,sc7280-csi2-phy schema's bus-type enum already 
documents both MEDIA_BUS_TYPE_CSI2_DPHY and MEDIA_BUS_TYPE_CSI2_CPHY.

The legacy in-tree CAMSS driver (camss-csiphy-3ph-1-0.c) has a
dedicated lane_regs_sm8250_3ph[] C-PHY init sequence for its
CAMSS_7280/CAMSS_8250 case.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 114 ++++++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   2 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 117 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
index f388997390b1..9b921bec4696 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
@@ -5,6 +5,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/time64.h>
@@ -445,3 +446,116 @@ const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p = {
 	.datarate_regs = datarate_regs_sa8775p_cphy,
 	.num_datarate_regs = ARRAY_SIZE(datarate_regs_sa8775p_cphy),
 };
+
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280_cphy[] = {
+	{.reg_addr = 0x0990, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0990, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0994, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0998, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x098c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0168, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0104, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x010c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0108, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0114, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0150, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0188, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x018c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0190, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0118, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x011c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0120, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0124, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0128, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x012c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0160, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x01dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0984, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0980, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09ac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x09b0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0a90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0368, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0304, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x030c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0308, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0314, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0350, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0388, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x038c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0390, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0318, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x031c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0320, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0324, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0328, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x032c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0360, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x03dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0a80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0aac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0ab0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+
+	{.reg_addr = 0x0b90, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b90, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b94, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b98, .reg_data = 0x1a, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b8c, .reg_data = 0xaf, .delay_us = 0x01,
+	 .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0568, .reg_data = 0xa0, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0504, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x050c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0508, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{.reg_addr = 0x0514, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0550, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0588, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x058c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0590, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0518, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x051c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0520, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0524, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0528, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x052c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0560, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x05dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0b80, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bac, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0bb0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x0e, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280 = {
+	.init_seq = lane_regs_sc7280_cphy,
+	.lane_array_size = ARRAY_SIZE(lane_regs_sc7280_cphy),
+	.common_regs_offset = 0x800,
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 41664a593f91..ebddddb14efc 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -627,6 +627,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
 		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
 		.common_regs_offset = 0x800,
 	},
+	.ops_cphy = &phy_qcom_mipi_csi2_ops_3ph_cphy,
+	.reg_info_cphy = &mipi_csi2_3ph_cphy_regs_sc7280,
 	.supply_names = (const char **)sc7280_supplies,
 	.num_supplies = ARRAY_SIZE(sc7280_supplies),
 	.clk_names = (const char **)sc7280_clks,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index af8426af2ae3..2d33e7267e1c 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -125,6 +125,7 @@ extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 extern const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy;
 extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p;
+extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sc7280;
 
 void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy);
 void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy);
-- 
2.34.1

