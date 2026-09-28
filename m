Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D794EF140
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613448; cv=none; b=cNHpEykPo91TfqStE7OEqaUjxnpPxAMDsr+GSg2oxhMj1nfvNjziOFQ3kMv0nn9kyf+u0wmA06AjNpIV50y7GsfsSrRgbO93BOofY9qKz4nschvp/piyA67l3VvOZ3W2aE27AsHGCXpoEPKzMHim7xFLVGBGpf71Dg+HuzY4Pic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613448; c=relaxed/simple;
	bh=ICkB0tUxyC7QHH+mx1K29PTQkIADmeOJ+fgJsBxjMIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF/Ijgq6Q7VVPiC7uKCGSAPv2FUDRjnEgOe3VN3aaWIkXp7z0Orr7wwKdoWVJAhsH8RLOD0S1lJQ+gmvKK8YjYyyhS23YCk2WuwjLoiHmrrs6rqLPqRTFsZNRwdtKo6qZD9ega6LYuZAA02bg0MTZeto/JO22siMvkNSIPBrD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpzRk57A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkEKCQ62; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpzRk57A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkEKCQ62"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdrlm1908468
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOJkYp57sU8V+ibcrWXddyRwpX1RKnf9XEFh+0cWqpQ=; b=LpzRk57AgHR00l46
	eehK6b+Q9OEdaDUxaA/61DR6KryqDVbK2Jg5C02tEkjyYYB9Y7c1+aJ9RLq+x/yo
	Grw+B1KviEKDp1yKJx3M0ooDw4Z9WDqzb9Ji3kKxEqGz6LNPe8qmmTJRnGGlrU9m
	Hcoro+gL/wvrRBmrkF7EvcGciwh+Frk4zxfW5t9GZ6/cPoX2e5+yo0hgu5mmev3Q
	HPuAVDRuqAjt07HAid0UdzdIScpV+ykXfLW7326Kk+W+w3dHON80KV4Ugdds9l5X
	242rfiHbq+rWqha34c2PoqyzAj/0ALJlfvhwnqCQ54anGGoav5oxgfq27dZWDreY
	7xV6kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxjfvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:37:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532c6028621so39139241cf.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613445; x=1791218245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOJkYp57sU8V+ibcrWXddyRwpX1RKnf9XEFh+0cWqpQ=;
        b=BkEKCQ62AD3C3wLOykFFobZXD4n4RKhrbwzZwZUYNIPYfeDnfIoH2ztjD+mUF0Y5Zu
         I25dxOYUKSw++a6z0dM6Y6mzrfNtRoJZI3wkQlnNpqoObPQD5c1l4wIckEMZzanYd+01
         hkwlKm1G4PPYmwc83Az2FMoTX7yf6KQtLo2peXS4Zy/7A1c8X1oJkcpULpVIrzD03NU+
         WnQHXNSCP2P0TQG4tqj22vKyxcoU0f7d8DdiaSa2qC3ehq3Sij3wzCL6cLpTwTHU9Aux
         u4jM4OfWDXf9uMpiehfMuHK+kUBI+2zgpaXcJIsDanyp7mUKUhwKpx6eoUoLwVOnSPyX
         JlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613445; x=1791218245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOJkYp57sU8V+ibcrWXddyRwpX1RKnf9XEFh+0cWqpQ=;
        b=yJFBNWgeRx8++7KqRCSCNBa3iIPXd2Xqn968Y2cP0jdKy17/qseOPa0AItJeoEhd1c
         bO6E8AUZSQzFf/Fp9bZ6Q+5Z5+7bhRiydzTLOm8spSCpU3FXVbB5ttsVd7G9ZQTcK5W/
         eLghwlEOUrkI8nOUHMp1uJ0FEk9irlS+aK7FbpDd3TM16ehBA9FZz6Yn1aRDxKN4YMoI
         lMtX5OeDJmpQldhKA/fH/oOFaMhsnp8zOWfQZQ4a6w9Rl8lSiS7H0zt6yzGS+uM1Ulmo
         ZOahKtkwUpJWP9EkjvXtSuNYN9OOmqd1igKTlZftkNPSBjYWmz4HhJ09c7cVqt3zblwc
         uoJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1SYfSCtuiCByNhNQSU6dwQfKqMh63QXNSJN9+HCctuq5lDCBlEz3z+/7l7P0/6EFI2PrcydJ0JudE@vger.kernel.org
X-Gm-Message-State: AFuF++mwVXUWV5n60cidNPexQJud4dRi06UT2vjdFf2NGQ6+V32diHn3
	9Sla/lxElWWnoDUuqfjK8UaxvasNK8NOAC0VNqotPkFZp7DCc/7na0IzVFh57sGFmJfmc8wVbEC
	zozdlRR3zHbDfPQ2ni4qSHN9wmiMCPqEQ2w+6KiKIGc8hjO17UhtwDTrg+Rl7OK7E
X-Gm-Gg: AYBFou2u2WIUoKboymVhjT6tp2/M871xElOFbJbg0ysAz10KMvA7RYbe17aWeyb119f
	GLDXxT8ZSomm1CgDggNospn+tKCtQ8vg1oS5sSGap1Ivgxp1dCzmXSfbHq/gNF6TsuxvZPsO7cQ
	URVysC/cRAmZaQ86na9vYJko5LWDGSMXGh1ukXQY361zVkjGLEBZccdeFSMoOdT9fZfedhs6ixi
	wRdh84pt2ojzhPTrZM4dzz5IMit89FJVy2MkxP/A7SPwPR0Vl/RCJHIXHyX1DCb5mWNisltBtjl
	dV2QMcQbb+gVMIqVeBOxCeS2ZiZ3BCCKerH7x7mRNKSlOa71R9gzm09jj6OTBnJqR4Xuz/N+TNh
	N/66R4XDm
X-Received: by 2002:a05:620a:40d5:b0:93c:68f0:f09b with SMTP id af79cd13be357-93c68f113a0mr1193767685a.5.1790613445309;
        Mon, 28 Sep 2026 09:37:25 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93c:68f0:f09b with SMTP id af79cd13be357-93c68f113a0mr1193761285a.5.1790613444532;
        Mon, 28 Sep 2026 09:37:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:53 +0300
Subject: [PATCH v3 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ICkB0tUxyC7QHH+mx1K29PTQkIADmeOJ+fgJsBxjMIM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupeoQMzarpIrre0ey+u63m7ei5x90C6WDr2/v
 vYqRfaysEqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXqAAKCRAbX0TJAJUV
 Vi82D/4qWgEXXV68rvaURcRHg3wGHYx7URxTbxEb80Wu0vUQKvpLVWBamtVqeKQw2BUaWvkkOjZ
 C2TNhEVlgCxsfb91sX1AyRUGYk7tF9Sp5XAM+1Nv8ME+OpGiR8kkzr7wq9nbUDXF0j1trhFPsVG
 Oqzeaaaoo/MM0r5bLO3v+hJ6jvOsNPSdIAFMUfCC5aI3KTslTnFjRmINoyYcoi18T3g5r9ipi0J
 kmz7OWTR4TDeXxE2vlG7rsDbBXRsR1X8NMHcFwoGHCZJsnBH+pobxq7yPEyo3fxsoUP9rXaHlJQ
 4+ViDZLseFpbYNl+zr+oZRASs7wTs4th8MtTyLLhDRubgonijehWwLNtFFthEIoyew64m/xfqfM
 3ZKT0dRPsIQ+7UEmVeQ1jGv+FeKra0Y9yYTSuiqxRQVmPf6TiqozMdKl7BHCKK/XX8cW7mwjFii
 gXmD+SnY3c+mBUEahZIJrfzawth6236BvrXiYz5k33G+tyhRn9H2UWj9xnzSZuvoh08BEgVswLc
 pDcNs1cPs4JUtQnKkwISQy+1pJCn077yTFbOsxbu+c5oSdrY1bjSnZhJcEMtR/MiTwSn96VrIWv
 cwZJ+xa4Ow0r86FlwYEZp+qfpxgatuvnHOWQizcaEgYVTwse8uOVPgCIE0wJPlLFvrx1toRHBtJ
 NUTZm/Xqlo1ZZUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Mg24OLK1hqEARbfMvpdaQKEABP5recwZ
X-Proofpoint-ORIG-GUID: Mg24OLK1hqEARbfMvpdaQKEABP5recwZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX5delOg+5hIA3
 HROZDnFRHvrpGpWQzlyJ9dG5A8lGuSt6zGMEhiX/WWe7q7KqtTb99fqNSCrcsorxLiWRag6bsak
 YQCgIT8Naa/RNVnRQmsfSxZHNZOPvks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX3Ql/w+qhcY1V
 ZjINf3W1nhbmhcWkkxxexpT5ak4TD/OzlFOxwQcXjpOIOfHEU9k3pK4fIifCWyJ/syxBiFKYJJX
 LHU2UeVQ7XoKDZZkS8BUAuCYbN9RNpTuzjKzJ2n24zdZ3jFZzBPA9qKU7Bys46fygAJ/jDAdARs
 g4CJTnSeNek4axCUNEpHynt92xbK7P2Dw7hUcvFYbAffaZOtBBjctQeHCSGEoKmmAlbYoyAIutF
 H+6hdAXVZ4PmGPBmHwNFYpifskSs/YijBOed9cv8H4W2bYtNAeoRtLLInBwnfl2LViSYa8dJ+lI
 Q8D1H6LoNDFoqtLKy7BeGUcPtPdX6ZoOHziDGlObgjn0mgpZk/m0Al8FeahQzFjQH8Hh6Fon99n
 ODzGhx52WwB93ClxwmEaXh9Cc3keYrp6FOI3qInbtGvJRjfkXr9Wa561UvG3eigPacgCUNpVkBQ
 59kpKMzQ39/yvMkbZ/w==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba97c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4gs0dM1aBwQ-lPDr4YQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066

The UFS-equipped Eliza CQS SoM is not described by the existing eMMC
variant. Its storage uses the UFS controller and PHY instead of SDHCI,
and the vreg_l1d supply needs a 1.14-1.26 V constraint instead of 1.8 V.
These differences are on the SoM; both variants use the same EVK carrier.

Describe the UFS controller, PHY supplies and reset GPIO in a dedicated
SoM include, along with the variant-specific vreg_l1d voltage constraint.
Include eliza-cqs-som.dtsi for the shared hardware so neither storage
variant duplicates it or inherits the other's storage configuration.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
new file mode 100644
index 000000000000..7e99d273fd81
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1140000>;
+	regulator-max-microvolt = <1260000>;
+};

-- 
2.54.0

