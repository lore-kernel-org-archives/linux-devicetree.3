Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD240EB80
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765910; cv=none; b=Of2hsB0Fyk8yPwWpC3tfcxsI1+t/cgyLlI8PzoJiLZ9Vk3RzdWSzxONy01T2aTNOnyWi0zlPZci/wEq7w5qMmB/olOX2MIkZqWRbp8cIaxS6R+FJIFl+QkuUrxHTgwhrKh5pCAl9UCNETuNxu2ZM+2A2khPelt2WeRjJ+WByv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765910; c=relaxed/simple;
	bh=qGm9/k2YvMVOKJOPynAryr6jVpNXSjaNDfIYGW/N2hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDZa1BfpJimxcidPFvrb10mAMuIt+t7nGyDDo5msp261HiJLGOrHfNPtGIhLZMqtnlAwdQw0vTFOGamTp/aPMiblyF2aKNrVRfzNd3uBBF+27EK15QCnYsyharaOsozQYR43SSGEwudqbG9gANSTM82yIUmVt5NK5Oh7PHCaeK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqOJOpRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftNuUqwH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqOJOpRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftNuUqwH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777uvn3686803
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 07:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=; b=jqOJOpRffab901ZX
	ceeEm2NN3IALe1CqZCKbI6W3UWar3JqcN4KZKV9OZNE3lqxOODnLFg0wpeR1gRjd
	dbsXcDeMvnxQ0+FOphIOKhl+mcQ6U9dncLhQ6aaFPL9m81/A8d9QCjTNWjNhfzo/
	40ZbilE5HanXaL8QLcRr9azzkQ1h189huu1sWsf7zsdu+TQ2W3P7R7aQVyVHaBXU
	Xq18dwTmmU7enxDyX1i04RA0yKTJL1NbBvalmHwXvieRIn3vceMdK3XKIo8g1caR
	0CKjAU6gu9vwQxXtRyeJh/Rq0pVMTnfiFsHorX73MZ1vxMQM7vQdBTPPfqoYo9oJ
	k69+nQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga375sxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 07:25:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso2937124a12.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765902; x=1789370702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=;
        b=ftNuUqwHQ6AzzcJ0U4ZWx1dR8nDFh8vPjQY4iObRqWl55hxrouSTx/nj1t7H5NTamJ
         npoGNsKEqyNTVhN5B1qjGfN4AlJSH+Eu9jJwpIu9ni8VI+0DjavhiBsKdWgB8dOEQv2D
         u3qbKoWIReaJHgbrbYF1mjNwOo7cxLPO88nq2WCw2eU7yP+Vbe8orsz6VXuGMiIJYDea
         vKJKB11xLWVrtp7bAzBIX/2VTGq85GRwF0RLZr1zZv0UidmMJwpQLRJ/9oACL6pGeBhY
         bMLY2zkKOAH7okf79MJQFZuxk321HoIO0togwJqxPDVIz0UCK69bS/XNW4Q2JgOTaaES
         lBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765902; x=1789370702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfd5nezvGf9mauGvIJpUuO5lH9veKf85XIhzfR3VGn4=;
        b=Tuce6kymIoKbjOLVlQUlGOA0oy9SK3OSnZI9KqZ+VaEaxT5G67bzNYQKtS33IExDZL
         t5s9WuvUZG33BNRavixdrIBgmn7qdXa182dA8fZV+/Dd7DuXI7vRR8L32pkqa96V5r6M
         lm6TuxLmi5yRBxcwHg0YbPzZ2lAT1XGJeDaxC1fZBnMcNlJWrPdGpKYmJHDrShGe3fH6
         xya+Lv9K1Dp0oKvZbHX4iaF6V170GRB07deURWRRjj6GWbkAGECDaixHdlS99VrjQM0f
         kf/3+WTsstvsEgXRoIMZyMid9hRgQoPkqpEgqYePHOV7S9uy3rjRx9AA0WM+9Fjk10+F
         bcfA==
X-Forwarded-Encrypted: i=1; AKwUvBxnweJxm0Ito2xLcuY1f8dIMJASiS8PK8iQIfZrL0J3qxMQ2iZh17NnwzzNybLw0s28XCkcOaJKwRG9@vger.kernel.org
X-Gm-Message-State: AFuF++nbuMheLu2zec23AbfoIgDsc1EXRuvXQrm+XqRgAeuwClcibx5H
	hYzudDZ/HOeJQQEyrNyeLjawM3W096N13M1VT1WtS0vxbh2xYwuY94O7ZBPz0P1QBwNd17RdY4A
	zDs5zv1UDn0tIuYfrNnsc/ExYtmJHvL+6GCFn2CsF6bcQZqleeIbJxbzOUpQja524
X-Gm-Gg: AYBFou0Tj2BlUJ+BoHYuGCHlJzaILh1b7RJcEEPB+owaeEtq89JzRF7OhdoA2vxI0gZ
	kJRZGE94YsUAWdBW42iV4YrRLLsZTpOaXeOgafE/jELmkqDBl8Nz1WucKcY2bee6KE9Dx5HM6p2
	83y324auYPhdVzEjtNc11Un1XxXX2W67bJ8ylmVkdA45Yc8+fkHbgUIeWXXWdEOcIH4ECr53LHF
	w6cwO1qJ69qrVWoPOf0cWv+eYAKwBoFzRdo4T9uY1aMVNHctPJorOatrFvL+pm0z0TDrblw/zoI
	UNNcRmKElTMnt4sL0DNoNjhQET250b+Bqjk6bFzaLSvvQTuKiGl2oBG7D2sucSniMm9CpeUuKyq
	cmwL1dBMkXk4Alqg7+wHuQGUwkq5lYcUjMrfNhiDujWkzqkkQL/t/v6EwFEhjKNFysdTseSFn+a
	efEhGqifbooCHEBgmlqWGMOfPVcDs2hg==
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr32129864637.3.1788765902511;
        Mon, 07 Sep 2026 00:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr32129802637.3.1788765902101;
        Mon, 07 Sep 2026 00:25:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm26161861eec.27.2026.09.07.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:25:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:54:39 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-08-dts-v5-3-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
In-Reply-To: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4lKFmjgmHKb_VA9ify5MbUL191ngX3vO
X-Proofpoint-ORIG-GUID: 4lKFmjgmHKb_VA9ify5MbUL191ngX3vO
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e66d3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=r5J3puGfL9QIZnCGJ14A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX70WJmJShlhpu
 7blO73hHYCijq8Fv7+viHz40HiAPdqaOuDgYRcxYqa9GQMU51iYtQLLWF96AiWLon0wNtF2JMDw
 vs4On0UXIrYWrxIxbgLb5b1S84dJ3Sw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXwCR02y56XLin
 ee+qgKbxRdGZfm7iLW5nKf+AWWoart57F0hi7ULqKhSA/DBPKF8FaI4ukXLlaSjiXhnoYqnWCfz
 hgQL4OEzYsXsxzCYpj14VwcsJIZfpqYER43QCahzqctzoh3acl3f4KgLlau+xrwlQJn1Q1/GNc9
 XvTJLZENSjErQjNxYpFXNP8ZYNOkNzh1PfoFh0VGCD5Sgp2DdGJmsM4kGc3njPRR6z1zaMqgk86
 a1fJj9qmGvSuY7VlbxffS6SbmnbWi2hXd1z/VyWkKYVz09CmqnGm5aKAX7cKpXZXHZaKv2WcluW
 dOM7IdDBtyPggBsMECA6x9kWPg7EFpW1AQOIHymA9gf8EiSGt+pQuLkU8YcIxJJuPkMVs5zn4Xs
 I/HnyloGWTWyTXL/NCH03EVYGFU3lINtIlBrdBzgHNC4FKegPPLPIjKanwJgAUaPieW8+mcOlE8
 mWKy8ncLZ02G0bjcleQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078

Add DT file for the NAND variant and include it in the Makefile.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c2ac11133ca..89c1d41ba4a6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,7 +27,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

