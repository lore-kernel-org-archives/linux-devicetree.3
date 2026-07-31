Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E2369972
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478499; cv=none; b=ppUlBGY6/35SwuPsQVh/azHbQd0+6ZJWX5ovAePuIi8pf6GjOobn7LUhimZgdqpOvQ2gparg4beVPWDuefq6wPj//heD/GP74+T4dN/yQjRylYQr11wjjpQKjocc3fz7WgOqlETI7FGYrrfV6IgTrWPUZJKmL5nANlB4IANH32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478499; c=relaxed/simple;
	bh=dG/a/BwdZwkbkd2vL/6Wg2laNbUlCPITfKohdBrGKT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPBxzysFLCSAcYwLa+dgMiIr0xvDpzXlObb+u3tr6szVy0mFo5622ht3dvx/gQ8ZGlzcUn6mVa95ReCG1thmEKgW4iopRHSnwC2nYNlxuXlZyXrH83NFVT7jiY0whwNoKDWA3l1usSfw3CpSWosuFOxaMm9jzjJOTYtzBIlxMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJa3sZk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzjckKaZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJa3sZk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzjckKaZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4urHo3277913
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=; b=MJa3sZk2R+ygPXHt
	0DJ0FsSrrRpkSFgJESSEQej3/y1Q/ob7wgVo1osIeTTv5Nys0IFRR8cWCGgBikqi
	9HOKpddsT4w8wa6j9wzAosTbBz1ncKjWHQBLgwsRKJNKDwaC71zMVGpSeSYIKY1J
	ncL0VI+/JoJwDdl/UNMpITsHMCjbizFBBynAKaFh2zCtJX0uFVKKZPToQHBiSLGZ
	/ytL0YOoUkDy7KmLfsG+FuTAPlsGldrzZHRN0JqiwE9552pdK3XHB47CgxuWKjWN
	jtzDUZnouyXQojWpkB1jEgj0JIpeRrWUnmFjCouMUrcTyVcvRWQ7J2EfqlzNOFcR
	3RW2NQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f88sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso7176955ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478494; x=1786083294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=;
        b=bzjckKaZPk7lt2ejGlx95FC5a3ykaIxqMqEgPDS7fGj1d2k6X+hSh6HuX0eQifEJHc
         gm8FL2Y4NfTycwZBdLF8VhfNvrWTonODmCO1/SiKWJMlKtZr/HrimaWsZrgvxNxzfnmG
         gkHE953VdEalKJ/mPWxSBBmmqpVJ6LfnVeS5KXVFrgh4dopkJfU64uhvMEz/7IRqtd5j
         T45RTmvP73IjlfZiN7DjBOh69RFmmAR8eh9AQOVJN2zAdP4CdlyrwEhr7T0FJTyy1Plv
         lVFJ60EI6Hwn+LsFsj9OInjNGFOeNNhdQ2sf+w0AJCzpNeRNkjm8sD00RyzPudiqSAZd
         mb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478494; x=1786083294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=;
        b=YzW+0nqCv0HlSZIq3t6C+/qonEpf9mtzfaEtSBTyHXYSYe7YhfwYH/mkHAxb1BpmVZ
         LinGiz73rXWedSVSQ/dJkfCDxioUZAOPY3D7W0IQdKPQaASuaZzJjECx0YQ5+0EDPwQG
         bFqfyB2CV/9OzYsNN4nCgts4tvHii0ZWmmQTND8UmFJMGTcnZpFZI/xuSDggbC0akZ4o
         R/PfhnLAA1ldLAVxBm1QKVvCImqG8EaokqzdPR+MIdAgcrWA3cUYwtCUJysipwmgrcSq
         2V8e08P2XqTV6Mq3QuhJSEb0mEQU71v7wNBP5R2MYGoiHiSTgiMKfrQQio5h/YPMDLQd
         oRYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2wzxlVXDd0MlQo83KWqhoqgblIgQZJ7q7So/f0qoHEdlSJIJxmve2SzxjsgvhzWdb9b6nAPbAElx9@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWV+bOrKEz6yN1S6fXmzsv2+Gg2cA7j6kZl9RF1VFf+hGdao8
	vZk22SRvKoH+z6TfSoOyUYrHFCujaT7WxLExAgEyf9IHieSHMK/hmjoBJg4YTu49uo3DOjPSSrQ
	mrnCFMHVJ8WF5Tod8XQGv1LzAYU7uMRita9woJRoLt3gi6DMa8Z0CveYm3Uw57VMZ
X-Gm-Gg: AR+sD12edWoUg6yiR+jI9uZVFAVbCRzWnwqjLQXgnhZt1Im3pSgfT/MdlWr4Fhf1n83
	olvrorD7USiE8rltSuGolhrS0P8FX03MRFvz9qw3dDBxCg57RrkpxACOVzZNwyYmtgQDg1cFkFM
	zIn522bqReZ1wqeqfmX3mw9kdML6TC/EaL/m5etnw3ztCw3Ct8+5aAH/M5+LCniUDtg4HXtZbGM
	flqeWaVnrXWVViV1tPlNQbwcWYQzXfIDBm+mwgmZ0x2sTBuuc+WrlVSoKpvMgDLyltiAsFXtl68
	Rk2jWvZuT2OW+mUejdunaPGaAmKDlhNZb9bu8mUASwLkkTaGA7vE16Kq05STgqctr2wGkaAruSp
	VRkH2FWlJZIos91ckL64vqQNenzbBmJ/wyjYVCUHSqFCvtvU7Vpfkt+b5pr4ehzSz
X-Received: by 2002:a17:903:38c4:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2d046d812ebmr9152715ad.9.1785478494323;
        Thu, 30 Jul 2026 23:14:54 -0700 (PDT)
X-Received: by 2002:a17:903:38c4:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2d046d812ebmr9152535ad.9.1785478493903;
        Thu, 30 Jul 2026 23:14:53 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:53 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:39 -0700
Subject: [PATCH v4 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-3-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=1974;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=dG/a/BwdZwkbkd2vL/6Wg2laNbUlCPITfKohdBrGKT0=;
 b=9BBHUplJ7+ZTO3gYPtctMtSIaTYYWBp2Y/CmhIKFtsjl4Qia9KEoTHi94gKvPNjAFFXkarCpC
 x2cLpC8oawvAvTYBiBxOp3uZm7cwD9NEc/bqRRCycO5dxoDB38Zpzrr
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX+jzw3lnArCx+
 rsJxU2zJPNQO0LDKx4q7vObjQZN4/rybS/F9qBWg/FC7RjDKPILaTrQ+qfrLebZeqoofsnbhEW6
 bMmVuuEJf+S844tiPmIALtP2vu1+OqU=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c3d5f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GrrsNloRtQgQSSuI728A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 23pMaiHqtN8jX1jyATamBWczooBFPC15
X-Proofpoint-GUID: 23pMaiHqtN8jX1jyATamBWczooBFPC15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX0JWeob6tp1qq
 wit4LpBot/D0FBeQcq0ZdIaVCIzGW941W4aZF0kAHSFT6T4nBJ25ebeEeVhVepCkYQ5GEW9zwS+
 77mTmZlZlB4hJZ9OUrz42KRW6hk7HO2S5TeoKlT0Zr7NU2266uZkyKPGSUBapX4uEe5NQMEZ3kl
 IIAS989nPnfWEOmXSUD/QcRWZDY6iB1YhMcsTPZYG3Xc0S45SgoVe8eCMucNfBqGZCTcTs31hML
 WMJFjhVy3f0TzLYDCTJIEhSGClLoh1eV79fzZKaqPRRgpt0+/TRJqUYORGDE8+QSxEkw6ZcEscA
 wdERS7OCgLPGdpUzmmm7L/fwaFl9/Tyv/IsYlAMH50HnbqCe2XlLB5MkR/4HbUCnveVZ65TzzVc
 4EoP0p2yN1m4BMBKx6Rt6H/Djp2nvzqfX8qx6TuYYb5ri5KrRBDU2wxn5SoIKky24zzNupUChT9
 LodW+aUkvSIfGZqrWNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310041

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..0ea4d6696aee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..b4441807f460
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};

-- 
2.34.1

