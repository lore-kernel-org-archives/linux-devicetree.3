Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57B37E5DA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156714; cv=none; b=Up7Sghu9VdqssaCh4ZWr/MD3dT8IvjhVtpvidu6x7ctK/Gz1ZZj9W1wrfFN/zUGdlwJQvZtkOyOE4RWKHDHB28NaGfk9qOU477y59+nIqrWYBwDfUVCfEaDizVsdj1LNKcUhVOeUThatYXW1rvhKTivngy9LuQtFSyh6AkGcDvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156714; c=relaxed/simple;
	bh=Zigf5R7b2I5cUKEjbnROS3f+gam6GdHTVSDXmFq9vqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8tgMLGg4psrA/UUPyISbTiqwdv+1vgBMJ63hXOi13F3GDD5U0NjjzLmvGqC9I7TK+fku3eu7VdXt8o2cvai9Hyi8Qtkfde0C+lwSBDKgNiZ1HhMnmwkKB2yRUhwLKUQtGv1pISFrqBGpb7/O1hl91ZtRyH81ZjHw9ypb5irAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQk6EGUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnJFcMfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQk6EGUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnJFcMfi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALwNf3355512
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=; b=CQk6EGUYi+fjVe9N
	uKqEb8C0IfFTsd1DU4PN9n9omhhKHndoNkhho8yEv716PuJAtddDtBd7ZLVmhAmM
	/ar+eKLo8edn0LdGNF4aN700iZ8aLbQ+rYd6+/jUaOxM5tjVoN+UbWNjTl5TYeuh
	gMlbGNoQq9MJRhC+sFGcOb1yVhnu/5e+h+ViZDyZGVA2ai2uYFSc3ev4pQ6kV5aN
	Vk5EAwmxUdIkmgeQ5SCUQwD9zQNXcSr22C6rZ9vj7MKj+rwSdzaqkaUVLtuD+/CJ
	lMYfdDdA8jqJKNqRdZB6voWJtdWADHd2skPFBbg1J0GFUXpowaBRNYjIC6XE2NKU
	uHUaig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbrrej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so3687328a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156711; x=1785761511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=;
        b=fnJFcMfi2mcDYwLDUazOHpWkl4KjZkUfIaSD0Q0NH35hpZcssEr3LpIXv/oq75GDio
         pLzApZIvSFjNWfWI+u3vZgmYrYrWw6Jv1jApJfeVfsVYG0supXAiZDjRJ81M6ig3FUjc
         r9ZIDzue3QkhIb4SX1qG2Zl7LSPzMO8g64xJXqQs8hOxn1eDjPQFDVY0a8DXPSvssFog
         cW4vJwg9gej5Wi1Zq4NGcvBULbd4mZNAg9nV0s2wFztyU/E8iXiDQMjhP38x8C1jvbCA
         Dr3CzBVQPJDuuts1bx/0VYvPThL6PnSQEXKsqHKAzlFiVpdVPRVtZ1xBzap2R6OO2e23
         wU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156711; x=1785761511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=;
        b=EQK45A6LtvyfRUKT+mp2DX7EyhiBweUqwhGnxw1Atq6PFuzFyPuHTN6OeUfB1U+ZO9
         1UKVF4y2jCPonSQJ5PApv9pW8sul0UomX/xYHRfO6q8kwr96vdAvJrCqrN7mUrPC3iHS
         Y3fJiNSo0HvEdUEiYzjaB7jZa/J33s3yMHfip8i7GBzUc/58+7PX7PsoAQCkM/mNkr0V
         Wgy6sghSHhsUAifWmmiE9juoD8R9y6HYTuYtr3iprgqoqcg7RrMKGpXM84dgOW2UO/Gu
         3U26LKWpnDl4pNwIJKWcJUeIw5IAXyp/JfN0PRGo53awKyC/WkQJjGCVpRDKBW37zpZi
         i8QA==
X-Forwarded-Encrypted: i=1; AHgh+RqOO1RcnBSs+yK6jPq3oimITnSxiVVL+CNR6WcyHKcAtTULwnj7yYxbNziz5Eu0sEK6Chbwki4xTq/X@vger.kernel.org
X-Gm-Message-State: AOJu0YweQ8MEJNp4S9KVHDgTQbniF2wwYBcez7l2Z3fio18TrDBiKOp+
	QBs1W/09mLdPusR1jcmal56MG89dFEQ3HaZDu3LhwxS3Lk+ROaxnT1utM+ICafrp6GGMFUAIATP
	G+S0ddO/TndtEf53aD2FpXzb+vuZkpOSlUSkpxFvcD5dpBEUlpBcyMEqSdI4thK9C
X-Gm-Gg: AR+sD12xOOvqHZ/Nx1R9oAGBqTxu2J1JgkCK2iLuhfs0ehjPysXdrlbrWITG19wADaQ
	kfBNfYNqqTnNIfHf5U6hBzMb7fIKpQf2WXF24N1M6EcGNGEFalBdGE7M0lAIdGi8W9AqyokKMtT
	nmglDa9bWynGYNQDCsNZcmdrgvOw93S/jOFJ1/sTOGIBgIt4FX7ru97X/6EBLXKCQ6RgozIbvg/
	+d28yt+ZoiDJN6Up/3AVoJOIJW/87RDZrdgUrbCJTnK+28kYnw/hPlRkLuwVC74L1nbWRGAvrWQ
	LlG9lrPy49uvDJGeYjoZVnmFOHHUirleDFg5+4wO6ToCuGjJ5JwSml6CtmeG783fbZiDPFnD6I1
	Fa5GYkoq53Tg78x/CV25lPwCNcoPZhwYTyvirOD3bno1J3F3Itq1zHJprYTaT4sOS
X-Received: by 2002:a05:6a20:a10d:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c6c26d1db7mr522063637.54.1785156711346;
        Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10d:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c6c26d1db7mr522034637.54.1785156710905;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:39 -0700
Subject: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
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
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=3763;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Zigf5R7b2I5cUKEjbnROS3f+gam6GdHTVSDXmFq9vqQ=;
 b=fNPXw/xmSh4ExOLLgPQtn7kP3w1ueZajVeAcxssU8AXY2kbseJUKT8b202eFVdEb8Q5mQBp1m
 2ZWjzd4q9SrDKcevk7ski9weS+juEHBNzXCV2M6twO25anKyhlXATMF
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: laceWBCrX4pBbE8rh4ZPeYVFdKdkjFMh
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a675468 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DvfzKPj9uRxjIkiPLEYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX9EVv1pP6nPjU
 6x1NUWhJpNzywAwk+M0fmrIkA40hP7/CUhx5rKUcgMmSQuHXnoSzKwrXV8OadM1YsS21TeATdsz
 her4bh7PbxftdQ1FLAZucpd2+iv9x24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX33wvx2Asnhbf
 N3Ya8umsvCSSjYGlDyzWM7OjgeT6Ub802Q7MTCohLU/y7ptdthFrxdJIt0HNq7ETP7tzn8g3qu1
 Ssf7OUG4mPWm3Fw28oSJJDkPpiwHyi8DOoQ/MUhUDRdhsVQoIVJ4P6ma2SjAvEyckoIL1pn+KXK
 8gfZbfTPS/DnIgabiOkyEiyC/4gT773pv44h10H11OILIu6RSCjUSOJkDPKWYrinm8lZ9XeEYnX
 ul6MXk8LSbsDmKTwADP1eAmYbZxfu6KXBybkquZHqRq/CncFrOnNmMLXeMx0fD2+PBHKHbq5MOP
 DYOnfEAGXKhAj42ZDGvsvSr0Ipa0MmTTU4IP28Cgwj27nxgg5fEYGEll48n3t5xxb26SAt6NSiO
 oNPj9dKVlu9jy0709qG5/+vPVRFVNfqlqeroCN/d6Vf9crRVT47OiWllEUWdgWStS/tk5ZJ1a3w
 ph6FXUa8X2fmxFecJNQ==
X-Proofpoint-GUID: laceWBCrX4pBbE8rh4ZPeYVFdKdkjFMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270125

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

The surviving cluster is re-added to the cpu-map as cluster0, since the
kernel stops scanning at the first missing clusterN index. cpu6-cpu11
are reassigned to SCMI performance domain 0, as domain 1 is no longer
present.

Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
0x380, requiring an imem size override. The rx shmem (lpri0) stays at
offset 0x0. The PDP mailbox addresses are overridden to match the
Kalambo SCP firmware.

Add labels to the cpus and cpu-map nodes in Glymur to allow derived
SoCs to delete and redefine the cpu-map entirely.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |  4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 97 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..6094e741ff34 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -36,7 +36,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
@@ -274,7 +274,7 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
+		cpu_map: cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&cpu0>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..4a68115a4286
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+/delete-node/ &cpu_scp_lpri1;
+
+&cpu6 {
+	power-domains = <&cpu_pd6>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu7 {
+	power-domains = <&cpu_pd7>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu8 {
+	power-domains = <&cpu_pd8>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu9 {
+	power-domains = <&cpu_pd9>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu10 {
+	power-domains = <&cpu_pd10>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu11 {
+	power-domains = <&cpu_pd11>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpus {
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu6>;
+			};
+
+			core1 {
+				cpu = <&cpu7>;
+			};
+
+			core2 {
+				cpu = <&cpu8>;
+			};
+
+			core3 {
+				cpu = <&cpu9>;
+			};
+
+			core4 {
+				cpu = <&cpu10>;
+			};
+
+			core5 {
+				cpu = <&cpu11>;
+			};
+		};
+	};
+};
+
+&imem {
+	reg = <0x0 0x81e08600 0x0 0x380>;
+	ranges = <0x0 0x0 0x81e08600 0x380>;
+
+	cpu_scp_lpri1: scp-sram-section@200 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x200 0x180>;
+	};
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

