Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91433AC0C5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156715; cv=none; b=X1N2BQ2azB9R7u1fJDACeDJBovnxWwc5t2I30tYQPOShBLVERnMpRk35Ij3+gUF/CRcklWxocxZZxaVu4jwcBjSxUmZZtucBJQMH/uv7fvS6gDRZsYriUt1XSWolSnq3DfsyEo0okgLkG4uEibCzZI+DPht2+UMcAR0Peng58yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156715; c=relaxed/simple;
	bh=dG/a/BwdZwkbkd2vL/6Wg2laNbUlCPITfKohdBrGKT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNwPaFr5AvhAqBDGO/zTjMkwP63YBrC7lrn8J6Q89hr8Myo61DzQAwjb//B9d8WLuoWwpVqgNw6I9KiQJtuqlZlZBQrP8uWA0JHjzW5V8zzcGMPTjbTZpIIzk/TI6hYI44HMr5cYqDXBJAUQidelarhrKoFCee53B57cxR1yqfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h59I5Cpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqB4C5kg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h59I5Cpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqB4C5kg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM0Fi3758448
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=; b=h59I5CpmJL017Vwg
	M2Vga0LL2nRF8jUT+JAamVjhTfTG3+eXMOg3CjTd1imlvZ2h7UJdQCvoJ/bvM4os
	6zQxtTL1a5pxDKw9dIZBaUFxNddCQ4XtNoKTOC629ibf80eL5YarXcNTgiBQtRc5
	8D6zV8nJ/J3BzuRZC7VWM//WyDLQgBuHU2ESdTVaVI8tPnJVQI/PBYhgmZv9ORHz
	ojwLrvEyqQ21sDmI8EtwN5d8IFYP45QptlddS2pZvAMHjctV66V5GdtXlOUkDTcl
	SfJK4hprH/prHeNeHwVWAzbqALD/uak+M87O0lPcliQ7EE6HDOg7Ll/EE+/Y+SZF
	lhv7ew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c60u36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2776157a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156712; x=1785761512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=;
        b=EqB4C5kgzBZeWg5Z9u8wYu6QbrMer5kZvGfNZzMEYoODMn0rFsL5i/Hx8aNQ2m9iqv
         XoNRbn05WeyqW6MkkOCVl0PsFYMvmayrFq+oXKocYwEVxOGVj5lOmd/3EzU07GTPTFJr
         083w3xgKTRTr5nPz2iHJrh+Og7AYkn5e7z7qnrAHo+OHN2d6iH5SkA20ITQbvwNf+PL4
         7nwiJKSafzLhIOodHTRH1yAFySnVYeMh450Qt8XTBWdqK1PqifGsZW6uiyTTrtaKoWD/
         rlQUwYD7Ih1iucNPPTnxvP8KarYJiVRDeMbBilE0r7Qqz7xALzNQY1zbJXWETabqqk6L
         glsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156712; x=1785761512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjZVkuPN5H6fCLEBjqzkisi4OmE/1OReXZHs3D1K0kU=;
        b=Gbr1O4yoOQpR0+5bFsabiOgX0sFvenV84ENa0Oh1e2H6gR4UptxwjRSbZfaAaKW+p8
         v26IYEX+bvbsxm/WKbOTZ3ENiJQXx3gCtXckc5zhjfDbWUfTpWLkcWVWxWVG/PANvRlV
         BysXVJOmlVOrMtHIqzvdTVCTcKYEOur3cT71mecIZfToqq+LnpCH8nYp/VOTeKWqQ4LC
         JDWMtRy3EPzdEG5f6eZa4t8sVwCgDSo4Hpyrdc2ttPelypzqODS2b/iLsKdiEFxrakcW
         WWPfxasEYl91e0uyi7ReNcSzEwMwlt9heVAs39+7v7i+TXI0O3EP11nqFMk66Qq91iFI
         47Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoyUtwzPXlDMY6FFxact71W8tKXFhQhtBAMriOg6+VJuU7cpeR+k3PhLheakAZ7ETfEVuzS4qBicLDq@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXbgCIwalwoGeAhPcLWzR3NYmwWrbIUHOqHBjzttrkNMAHAxG
	risRlZ7IBwUfb3zUplbIjB/adFdMvuoEJLL4stweXk4kAu2CQ9thrQsMXYCf2ZnRtf7yAHjZL7K
	XRIlGV2VCgYIp4ymo+2cgci7iFJGCszkpXI9ldQt6Y/n/5AzvK5Wp+7CZtTZ5a+Ma
X-Gm-Gg: AR+sD11lJ2dzZT4pxg0TGzwtl1F5MGB622FHsQ8tdB2we0XSP4XRHM4UzQ80NzyjqDg
	jfTgGjR2e5A0kcqLsCDkcrNKNTpitGGK3fAwfGpcRs3xAH8yveharY4aAUDbnlZ2JrwAgmma+0T
	FEz5mOZIMq2V58W8+9WRekxWgJQ3HXAoHcTsJp56nzeq+CqU+m6qOBtgVTlywwbIzQaBoqhWiQ0
	JXBtf8L+SOkAnawbp8gMFoTS2QfxIZZ4Iwmsy4ioFZRRMZ+FDY18Lws+KoYmhA2cLLfamU4HzWq
	gQRzPe6zTyKk4g3Fm4I18wibsf9FvrVuhm06OU+XtMcYyPZ7OI89YjDHoW10z4Rs7fSVTcPaynA
	0z+ZjnvsLXnSGehHFzBR5Wnx1ccDJ85Tw6uwpA9zM1EQfpw2BeJJ4jYUv7cbLCjgb
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c67dfb6aacmr7807554637.56.1785156712262;
        Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c67dfb6aacmr7807528637.56.1785156711830;
        Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:40 -0700
Subject: [PATCH v3 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=1974;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=dG/a/BwdZwkbkd2vL/6Wg2laNbUlCPITfKohdBrGKT0=;
 b=tBft5ZPmTqbDm7tnvSA89kcxpkI45PdPTuDSArnGyIZANG3OKXMZYZipIqHii6rWdmGIMmSv0
 Ae8TKY9Ls0ZCHX1GyRwhBHccd1Rm0QF5efFJRBnqhjYW1qDmwxLd+oK
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a675468 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GrrsNloRtQgQSSuI728A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX1FLc1thiMqf4
 U4jLFvsXfrpK9l5/gtmAQ59olmHXoaPmfToFaHYwl/6LxBjxrHpfRrAsBvotu9DLsrf41yRbHSd
 iWUB7qYH5KzMjOKaD3SnPHO17aDqEEQ=
X-Proofpoint-ORIG-GUID: RjyNJSIvgGzP17rUuTtz3M2YMoWIhaly
X-Proofpoint-GUID: RjyNJSIvgGzP17rUuTtz3M2YMoWIhaly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfXxbE+y5NexL4u
 9a5xsVo/9C0DlxZXIYakmI8TY2NjD1kRyQrKEvlG8LqnIQLQzAbdDyFdRaYuvoeBaQqLURwXnlH
 M4rZYTZTOC1QnYB12TPeKa7QoiO9VLoIcjZJbOnPI7TGP+p1wlKfzzGc3VLOaZ30DuGAx4eoWwR
 fXKP4EbMHxQCNBHsyNZ7/hrRFagSjhMBq9iaN39ScQGdq6CttxOSMcklLrlpjW74fwxOd7NsY/S
 32HJ+e15G+D6Hp7kqPPVbJenJ5oLmvD6g2IjR2IG1PeyW9VH6LJ/57rrFPvGx3J8RWohaI4ZO1r
 HQ0sqQKv6bWJpDNisiNJgY9il3Tt0TgtXPyrLGtSyj99aSkdou69KRI0cEo1vPbPBlZiGJpZJkj
 z16IMpLTkZyx51pJl6lI7AvwHnYixHnBobZLkOL9E9aqvhqTCWczolgfg+mxOSarQkqcIUFkoAA
 TRmcbUiUIB3KBSZP+cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

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

