Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344645C6FB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865885; cv=none; b=m1jPBeLc+T1Vu1t2fF8bVGdumeq8zoUEwW3MNhDoZ9hgurxO7z1d3YVrpIekkdv6s694qDKWr56n4bH41AyPPFnqkqJGMDU/1AZq16C5Ip1t0d4OpsAlYjlEYw59BktwOZVqSqs6Eimk+Po2wVBGPi6xJgt9n4pD6EolFRmjKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865885; c=relaxed/simple;
	bh=WTzVZvF2VTUSIyIuaIfG6ujpudE6cFyhCc6bbT1M0k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qh2W3ldajoWDbt/qnz1uqlCrdajgoPQ65sZ30zO/ZWXuMdfUsf0jzbwoSdGcM1j9jPkDZh1TYyN1kzjdz/ZzN3xEoJ4pcKTkU0WTlLTyZchBNi23aPCFiWXVOi+juDJIgBwixeeQBYr0YJ6Dbd7ke5JGhqXVPlmxd+ab3n1gmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OY9RRojO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhFYRbzL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OY9RRojO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhFYRbzL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H3Rl1063143
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JTDrqZjzfrFKVUfTeuPPPP52PqZjIXpkAZYVmNO6cw=; b=OY9RRojOpjVsDwsn
	RSbk+ZFQNVl5UJMq4m6WE2xLzdzjVRV9Vb8atInpB59HfwkobE+sQSHHn3rSwt04
	RKArdSPbls6231dYTsH4oPLfxYtXGmGqzNrraPoAXG4zeukHbOgC/oyVsxqVqIu2
	yhNXjfh9Lu6jVCzPMm87hq5ALEzVTTFIwmAA411wTTyrfXtp8CI6zG6bKIgH7x7Q
	wBSDHkKIuWqK9zc7F+NrxI6esBG3uQaa2+MJZmlBnWWbuRtMU58ANj+na3jTt6vS
	N7u/wJ1mcKVC4oFbNfxn/Tovsg0oYKiVx3TAD7jR6DdrN7pQbvlk/ndfx2YCkYQX
	3nm9bg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum5689h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:51:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso2574515ad.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865875; x=1786470675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JTDrqZjzfrFKVUfTeuPPPP52PqZjIXpkAZYVmNO6cw=;
        b=IhFYRbzL63jzj2ljmH1rc+yJ22ro+1Ga5+bwKixXwVw0XMadBjIcyrMX3AgxxrqKGG
         vP54hSQG3Ukk9iN2D/G4KBy/QYeV84vbWsEam8ioHF6o3soGQ004AgnUpYV+drhX3E6c
         l8c/CJQT7UuzS2K4f7D7D/VaBr4E1Ak1PTdvMADkJoGnfnKtwHf2M8jhX6xYEul0cTBm
         8bFSWv3Vc4/zjPpHE+bxxpPP5MqzE5DO7wVP7ehJUU46fcpvajt3SE22xuxP0+iJOuy1
         3aIsYb+k5hk27q5/GW9iWTH9kJX8Vm3U0lhBnQiqMCqkcXPP5iHSISlB8AmJ6pBGIJdD
         lYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865875; x=1786470675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JTDrqZjzfrFKVUfTeuPPPP52PqZjIXpkAZYVmNO6cw=;
        b=TL0jId5XDOpyADOWGb7Ki8iE6HKvh+k+albYNYtqoZ8q8QGr9IwwJ7TuZ1k1FlVTFC
         rhScyexdwnLKoEcVRg41+3re2gDVE1Q6GQbaSWtLBO0nT4suZ0A1wruJFbaXXmHX9Dij
         IolzWxo3vk6cU3xGgVhswWkqVxvquNV4fTG3g8XSJZVGR+SHHCXF/nd49k9xyvav53LY
         /OSkdp+ojh2LXW2ZJA9xhuUJxO9N2d+ieOzL+0L+i1gKlQ6DLKgYI+67UzBuqnYk1Q4g
         iADqMFG7TdbfTFqeNxmnVZE5dsr+I6E+9cYrVn5SQzUrExHgzK/CKsBnXE9hdd4SIzqO
         qRrA==
X-Forwarded-Encrypted: i=1; AHgh+RqCaTLAlSlEax+9wJSI7ZfkaoN5nAvwEJ0BO/F/MfjpedpdaHKqydnPMzG/tr7SYENcDnuMc0sFJ56X@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGlNijzpP3OtxZilMtF7EP0KcQgq8S5SAsy3F+lZ9hGwDIXUk
	lYtEt1gaYZPXl2CrSHvBDXEXuRgLAfczV0T3InpxagA92KbzYEgGHeaXivQI4/SB+uY00AGW1Uy
	W9or+Z1T1HOUSbqOUKxyOhuK2GBYjyXNhnBly3jiKQ16CDtjPJWf9U9ETk8UL0mpC
X-Gm-Gg: AR+sD13PJJrOzpOiQHwRRRPMTGTRbezivxtWJHKH/UOxGgocznKHw9/Wr36GhqCLShD
	DV4nQCCWKAGrrcLjGH6QqySuwkaphGASO1Yw2nJKujW3Fk78npd4Om/VzPHmxniHXS9vAQxRHyr
	c+lnhtQ0dY3I5fzV9wXk5H8ttN+NXjhrhvtP994jgypJ1Pu82pU3WnilfOOEK7vKQBn/SfUQ3Db
	9FIhETK3ficKtETI1vN8CdAGEzNfE3fgfm881FCcxt4rB6cEF8UE75oCfGOuibvCfxOB7IBn2hc
	biZ4ytGOL5Nlnad/ST8VnuiOIe7imtr24cY9ObIASWSosvmyZzYbFx/TPy8tMIoVSL21hdz3hga
	sjNiRYnVVViNjIPh3IurletU+
X-Received: by 2002:a17:903:19e6:b0:2cf:b23d:77f with SMTP id d9443c01a7336-2d0ca984ba6mr5977945ad.20.1785865875192;
        Tue, 04 Aug 2026 10:51:15 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2cf:b23d:77f with SMTP id d9443c01a7336-2d0ca984ba6mr5977105ad.20.1785865874600;
        Tue, 04 Aug 2026 10:51:14 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:19 +0530
Subject: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX5S6q/TH7/4VI
 EjEA1y0igtv9uHilXSG1cZo4dNlQKMo8+ZzxQvpR/UY0kjnDg6x938FqXZJfM0yslxzee4Bzqqz
 voZcyz3peJZnDgwwxIv3Z1OEZH6r2YXiX0FtCX7s5WGnPw7VZkx5375A6tApuAy3vCXKRO6zNTr
 L2t9ho/7xTW0/aJFZbLzUlMt+NEW97Z4SRQEtc6hthlu8lXLW4SOb2wrKUwKzzfjvTmGF7DezTE
 USUK5OoATMVzavujb+h+VsQoYn4BQWBPD/4ZbjQTrGlQanhUSCGTICVJlUd59y+qU8FdBFkOUSj
 ii8va0XRavUUMTjXd4J9sDjN5yIKcxgMrDFJrU2iItzyL9ip1qTqhkYTRKoJ51kzzUnsZPhw5Uh
 Gj4DuDBGwYyyP+KAV70s3mrh8Ue9QzcJyv0jggDam3Ry8MSl8S3JiNMWBczXhD87aZVp2IFchGX
 koNGw0hF06TNg/b3L4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX3aVQs5ORDmaV
 6N95ldiwSb6D9JdZDaqfvpHwTHsjgrB8W8h/vi6PGuTVqW/UfOvsG26gLt19faHEUPKjhMKqvPr
 a9XY1zsumCjBmdeLPWhgHHZnRh2SAXg=
X-Proofpoint-GUID: F2HV4GjNBDSPvgRzINykZDOYllr-Q5af
X-Proofpoint-ORIG-GUID: F2HV4GjNBDSPvgRzINykZDOYllr-Q5af
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a722694 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=E4wYszUKohIvJGSh0HwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040144

Eliza camera clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza camera and camera BIST clock
controller to the existing Milos camcc binding and add the
dt-bindings header for Eliza.

The camera clock controller provides power domains, so 'power-domain-cells'
must be present in the device tree node. Add this to required properties
to enforce it in the binding schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-camcc.yaml           |  12 +-
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |  32 +++++
 include/dt-bindings/clock/qcom,eliza-camcc.h       | 151 +++++++++++++++++++++
 3 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index c4aba40e316ca746c7ecc6955823c7d1292d5547..cf7df47acbe7fa773b79078ec2122fd5c20f5a33 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -8,16 +8,23 @@ title: Qualcomm Camera Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-camcc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,eliza-camcc.h
+    include/dt-bindings/clock/qcom,milos-camcc.h
 
 properties:
   compatible:
-    const: qcom,milos-camcc
+    enum:
+      - qcom,eliza-cambistmclkcc
+      - qcom,eliza-camcc
+      - qcom,milos-camcc
 
   clocks:
     items:
@@ -44,6 +51,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..7b8b285f18d2714393885149fc97c715b3fbb042
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_ELIZA_H
+
+/* CAM_BIST_MCLK_CC clocks */
+#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
+#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
+#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
+#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
+#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
+#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
+#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
+#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
+#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
+#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
+#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
+#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
+#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
+#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
+#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
+#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
+#define CAM_BIST_MCLK_CC_PLL0					16
+#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				17
+#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			18
+#define CAM_BIST_MCLK_CC_SLEEP_CLK				19
+#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				20
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,eliza-camcc.h b/include/dt-bindings/clock/qcom,eliza-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..d85ef9777d08d12ec349d57f6da5e76a305404f8
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-camcc.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_ELIZA_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
+#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
+#define CAM_CC_CAMNOC_XO_CLK					18
+#define CAM_CC_CCI_0_CLK					19
+#define CAM_CC_CCI_0_CLK_SRC					20
+#define CAM_CC_CCI_1_CLK					21
+#define CAM_CC_CCI_1_CLK_SRC					22
+#define CAM_CC_CCI_2_CLK					23
+#define CAM_CC_CCI_2_CLK_SRC					24
+#define CAM_CC_CORE_AHB_CLK					25
+#define CAM_CC_CPHY_RX_CLK_SRC					26
+#define CAM_CC_CRE_AHB_CLK					27
+#define CAM_CC_CRE_CLK						28
+#define CAM_CC_CRE_CLK_SRC					29
+#define CAM_CC_CSI0PHYTIMER_CLK					30
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI1PHYTIMER_CLK					32
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI2PHYTIMER_CLK					34
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI3PHYTIMER_CLK					36
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSI4PHYTIMER_CLK					38
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
+#define CAM_CC_CSI5PHYTIMER_CLK					40
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
+#define CAM_CC_CSID_CLK						42
+#define CAM_CC_CSID_CLK_SRC					43
+#define CAM_CC_CSID_CSIPHY_RX_CLK				44
+#define CAM_CC_CSIPHY0_CLK					45
+#define CAM_CC_CSIPHY1_CLK					46
+#define CAM_CC_CSIPHY2_CLK					47
+#define CAM_CC_CSIPHY3_CLK					48
+#define CAM_CC_CSIPHY4_CLK					49
+#define CAM_CC_CSIPHY5_CLK					50
+#define CAM_CC_DRV_AHB_CLK					51
+#define CAM_CC_DRV_XO_CLK					52
+#define CAM_CC_FAST_AHB_CLK_SRC					53
+#define CAM_CC_GDSC_CLK						54
+#define CAM_CC_ICP_0_AHB_CLK					55
+#define CAM_CC_ICP_0_CLK					56
+#define CAM_CC_ICP_0_CLK_SRC					57
+#define CAM_CC_ICP_1_AHB_CLK					58
+#define CAM_CC_ICP_1_CLK					59
+#define CAM_CC_ICP_1_CLK_SRC					60
+#define CAM_CC_IFE_LITE_AHB_CLK					61
+#define CAM_CC_IFE_LITE_CLK					62
+#define CAM_CC_IFE_LITE_CLK_SRC					63
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
+#define CAM_CC_IFE_LITE_CSID_CLK				65
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
+#define CAM_CC_IPE_NPS_AHB_CLK					67
+#define CAM_CC_IPE_NPS_CLK					68
+#define CAM_CC_IPE_NPS_CLK_SRC					69
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
+#define CAM_CC_IPE_PPS_CLK					71
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
+#define CAM_CC_JPEG_0_CLK					73
+#define CAM_CC_JPEG_1_CLK					74
+#define CAM_CC_JPEG_CLK_SRC					75
+#define CAM_CC_OFE_AHB_CLK					76
+#define CAM_CC_OFE_ANCHOR_CLK					77
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
+#define CAM_CC_OFE_CLK_SRC					79
+#define CAM_CC_OFE_HDR_CLK					80
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
+#define CAM_CC_OFE_MAIN_CLK					82
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
+#define CAM_CC_PLL0						84
+#define CAM_CC_PLL0_OUT_EVEN					85
+#define CAM_CC_PLL0_OUT_ODD					86
+#define CAM_CC_PLL1						87
+#define CAM_CC_PLL1_OUT_EVEN					88
+#define CAM_CC_PLL2						89
+#define CAM_CC_PLL2_OUT_EVEN					90
+#define CAM_CC_PLL3						91
+#define CAM_CC_PLL3_OUT_EVEN					92
+#define CAM_CC_PLL4						93
+#define CAM_CC_PLL4_OUT_EVEN					94
+#define CAM_CC_PLL5						95
+#define CAM_CC_PLL5_OUT_EVEN					96
+#define CAM_CC_PLL6						97
+#define CAM_CC_PLL6_OUT_EVEN					98
+#define CAM_CC_PLL6_OUT_ODD					99
+#define CAM_CC_QDSS_DEBUG_CLK					100
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
+#define CAM_CC_QDSS_DEBUG_XO_CLK				102
+#define CAM_CC_SLEEP_CLK					103
+#define CAM_CC_SLEEP_CLK_SRC					104
+#define CAM_CC_SLOW_AHB_CLK_SRC					105
+#define CAM_CC_TFE_0_BAYER_CLK					106
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
+#define CAM_CC_TFE_0_CLK_SRC					108
+#define CAM_CC_TFE_0_MAIN_CLK					109
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
+#define CAM_CC_TFE_1_BAYER_CLK					111
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
+#define CAM_CC_TFE_1_CLK_SRC					113
+#define CAM_CC_TFE_1_MAIN_CLK					114
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
+#define CAM_CC_TFE_2_BAYER_CLK					116
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
+#define CAM_CC_TFE_2_CLK_SRC					118
+#define CAM_CC_TFE_2_MAIN_CLK					119
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
+#define CAM_CC_XO_CLK_SRC					121
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_TFE_0_GDSC					2
+#define CAM_CC_TFE_1_GDSC					3
+#define CAM_CC_TFE_2_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_TFE_0_BCR					5
+#define CAM_CC_TFE_1_BCR					6
+#define CAM_CC_TFE_2_BCR					7
+
+#endif

-- 
2.34.1

