Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956883;
	b=ZWdYAWYClagOuDvvtXzMic1/zzV1GzlKYsdm8BAGoPKwSx8dwXSrPMrOWcN6RbnjrZAB
	 VVy0YqUzOniFP7Lhy4Ig56yllttwn6xkzmXLAbuwk/QgaWC0tuskDT3vOTIVKt+wNq3IH
	 GiwHSIKorlGC0kZeCLVJBy3ZKuCqBrg05SJv1cQNi+xUauS2zMlZeTrq57PJlVn+n9nWi
	 gt6qgGxsMg20UnWKrXXps5ygfo1xANJ793gExNBTjInlZSFhXANbcHkQLt4eCSyfP7qyS
	 EJ3txMRGT7z1EPrjmFEZvldhVvzhmkOJpo4R7RjOsSVh/pcx947NTebIQ0exU8eZobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
	b=aMi4cAXUtCf3mtlYIy+IUsHljXpyXssNG33YVqJ8LpD/yG34WINgHkA5sQ+wgXWPiRTR
	 jL0lmCFJWlFfqjRTeJ3gOmREVmrgLH85fqTi0LRtuWkMeW/Tq0KPO39yLNTbzjWtqfEQj
	 MmHTmAXIMFmUtXTZHS2RAy8MTrwus5ch4sGXD8puvZ992viGUKGMjklVQgUyITmIFsPjk
	 pC4vaXE8EPrPRz7jG4nVjl21TeEhy9A6GV76eR0nChuTtAPt3HtbimvonIumOrflUpvfT
	 87P1STUid/KMzg4cbq5UoBRvscWvStj8hdIPDnIWf/AS2GUPz481E3i5OeIVLCP0jUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FTui1p/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E9606D803
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85E9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIDxxuy1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTui1p/1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7qf3243883
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=; b=SIDxxuy13FZYbzji
	+YxenOAaOCb7YN6xsnaHpvksuhiEYlbP88QmtmfLZ3a9vqHWSL8NOXclYyMHIOb4
	ozd+t+qOLiF1eRS1sja9jrX8tDxYF3CV6KhoMUzE4wju2L9uLQ8uR2H6flvBGLme
	pkvAm4Gb9Q71lPbp6GeQz7CtA+kiGfOa5AkzfAKuZOsc0HVAiSMMv0SAu5AYcwfe
	qsowclgi0yUGAR0SYmGmvx/wZ91pA/kcMduthRqzYkbzHKb271wN6hgIjASFJkkk
	Ouuezl8g+VbVNWTE1VxXrYOlHLzjaRZx8CSpN0wwCYb6QXIbdng6U+gaGooi52lb
	7fWvoA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso857964eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956882; x=1794561682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=FTui1p/1ii+lPFo/xxC6Uvg3T87+ci6XXZ+bCDjBCkPdPxW2pCEVuUNky9fYNRAK35
         gT71zFHRKEp6SzHBmGsPqOCzQiTpg8hneaG9vxNZh6b4cd9io9N+W4ozJw4j4dexyE04
         mczKLcMgLOdR4pY/Ve1gujYA10HNs5Z6/hZxgonjYFbY5z0VNxcvjAcsD9avEu8ePUAx
         SLijbg/wLpUf+zLKZBDIq4+i2e5XVFFWiIsrpq9IAZS/AvgenFNdH61mrloh67ozlhhk
         iJydBKRnQ61F3cxWcw1R2qM3Z/QJiV8OmHwtxTw5Ah09uUICnAo7tQi2mmzzgQm90wTC
         Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956882; x=1794561682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0neYuYn6liO33W8kTLukzzDPvYtIX3nBweNL+dyUNRY=;
        b=0FYsEskSidwtGVJ2zAKFwEa6ASsexSBPRoC1mFDGh1fiE0whhVoJK4cRh2NiVzwi6O
         d2g9kBYjle0Lho80BocuNwt3UyDWKF7yCmXNeqqGASndJegJyG4V5Ie47Wu3Fg4rlkQ2
         4FvwnZqSBNETI6+SQEzc+vzp9tC5SRViP81uPkc7kfEYKFnsisgOS3ee4C1165pZKm0r
         rBevfyksVXZE4HD1wdkQsvMsj4pjAaXrDM7bFBnROcTXkrnAvxEuEgi7sLhIHYK94Gu8
         z5Vy9xH935UhbRuDEGewJ5oRtuXpdaBGqiV7U+G4tnsnV/0RsZNdZDfYnfVQ63ch3+EN
         sjOw==
X-Forwarded-Encrypted: i=1; AL+hErHa4dWqz8jBuYpU6orDzjRuqypb346//1YcofaymPfz4bFzKIcpeoTdlf2rOCrXdIaFxz68fO4OGdif@vger.kernel.org
X-Gm-Message-State: APuU4Z9kWQ5eOhDgDAZ0d6y/rmkC8lkYSMybVWxSkYJ/UrpEAEhtscsh
	l+RVHG3SH3y3o9nzPZijFiin1U0TG5ek0vGnIVftUwqJYQ2HNWl+0vlofQr0xlGUVTR2GyQulDc
	GL/FpYB/fYq8ZlNtEXmvZ2nIKist8SsFh0P7kugTWOAdAeoxuxS6KBLZNcOSOcOPY
X-Gm-Gg: AYBFou0/CJi6ckGZFBeatBHkiQEsBn60BLyrmD+Ee32bdUmiijxyU5PgptpkvZumW0N
	+UgyBJn58bJdHv/FR7JKSABUSHzgE2eSHGP4BdUuDn4KfS+F0374U/YDfEd15VVHhdRR5wp44n4
	oG5AYXCc2QGRd4YWwg7R5YGMwSLblnC03Hzc9JQhSK6s+mgah6b2pU2x15iKO/lMID8DzgukwDA
	DzIF5kH+Kd4OCAoTrOiX4Wa1nhOCGNDZibakSMASs5hGIwI5pT89h+yFowdi+qjCJ2CpBachu1j
	ZpkBgcDzb8jwI7msje94PEYpIDFGAtGq7TiSdS2Xh94bmREWdnShCjcqGjVU32+US+z+DGdqnOB
	NP7J44f4e8xQxAdivFXch5i81K/1UZJKiiBW778Pbg+53gv/SPIqkbY4QHBbnvg/1rDeQcb02u5
	nOTL1R+mMovF7RxEiTyrsBcdMg0wD3bkogIZqDug0DmMzBCyBjV6GYrCGrOke9RSVIwABrwGbKG
	EKL8A==
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477553eec.27.1793956881560;
        Fri, 06 Nov 2026 01:21:21 -0800 (PST)
X-Received: by 2002:a05:7301:182b:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-36f7641e9aemr2477518eec.27.1793956880987;
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:20 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:52 +0530
Subject: [PATCH v8 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-3-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c12 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX91TDk9ml0sBu
 okGegBla8JJhp32Vmz7eoEVx1k6pbCsrykkKm3UEDtTZfCSuVFrawF4RFGl6QMvfQyj3JB8k0fm
 3NphDtCHmOrGnIp7ak1GSBkO3w0Br3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX80+DE0/4YqL3
 PkisBdHDKF0Ur1tSuY+wa3uFWpFPeilvCXxaKAPf+MYUvx8H68zwvnsgkA4GR+GYhXnyRQ6q9fi
 Nx2tftSZzbC/bzjPDeLMJPSzDrmPSVHBQSsBrL7Dwuu7PJeH3LowY1D9gOAEb5x/Z9VoSSzX2om
 SIb2VEeHdw/pYuJYmcPlm8k2PAwvYsU3Ze0Hk2dEwDDcOwywp6Rs+evApzYFCN0IhKRYHB8Z6yn
 pbMNqtoVMRvckFtZp4jsonZ+iQ/HeFGHTPBqiPNEbLU4fe2UpBHO01o0UYZ4UgTcHhO9pjtJujE
 zn/VWZcjUIeEAWuAMbhD7VvkMEV6snP2QkVOsemxxIgx3fAOj/aySjjvcSRZPFBi2V8eptvBVX/
 G778xRYv9dResI1rZ3URDl+bUoCwQ3ZXWOKx+d6v62l5le+AHyDNDIZy3enYqdoK/P/n7ogiM4z
 Tpz5HmN7bt43giQQirg==
X-Proofpoint-GUID: PGrKGIL_NwoddtGB7SliTJwVqh8wPYCA
X-Proofpoint-ORIG-GUID: PGrKGIL_NwoddtGB7SliTJwVqh8wPYCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 36702bac331c..cb0adca9a151 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -87,6 +87,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
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

