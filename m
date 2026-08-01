Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4964334AD
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578428; cv=none; b=GG7nwGoUCygX2XDfix30owy3S9AOUaB18MRxjStvDa7RKRWr0RY0GwNg/wP8BbS3mezWo+XYaqlZU4L6Hk7VahY5Oj6gCO8WP+r7G5NOIZL5yNebr883KvOMyyAYzKf59RqbUQC5UWQcZaoWkHZLtRjdzn1eiMWAO09QoPl1iVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578428; c=relaxed/simple;
	bh=9Olf1uz4AYcEikbkwsvzP+2rF+vetsNaAn7FsiCzHVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBhvqIkgQWfwPyNpgmOxynjJrcO3JI2HQMXQT3FnoBpkK7UB+RQyzVAMO3yYMlyTTygawceKU5DjGtg/MRqQ3y7SWAyiK0xpB+wmMJX5UpwQW3+OO66ZhSd3DVpPu571sv1Sr8oH7T37pgYtwtYzpFZX3pBERrL5PX5hdHiDlj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAbie59Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2Rmyqu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAbie59Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2Rmyqu+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714dZmi1417005
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bO8bAQfTtoLl26BkKalzfzUzSHvhF1rze2Z0pSpvGoA=; b=ZAbie59Zd28oRUoz
	3VjyRaMYrRW2iRqrH+lDyo1Cw4mSktyo+E/izkTmMl4uHAThcXhAJn0QmgFf+7z8
	0TuydAq0jJYHoRJ/sdR4utYs4r7Y/GqusYbUTubqeQbgRs3JMQVdoKHyn9EXs7VE
	WwQ6GD9H0+aRf0XVKKeYEhZGhTtTeXpyBnGtbuSHzMwXPeFEvubUrmxVqQP0C4FE
	kqF+CRgPVHjKcIHw5A1olAJqfnLi1WITJpgVsfFTXe6ZNqLjtpGW8TGXCGR2tMew
	+sx69P1Lco9+3S6cIwjdeDwYdbv1VrzJvfqWHA2G6Fo3qPD9Z59d5Hz9lu9wmy8B
	aExIyw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggg52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2171954a12.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578424; x=1786183224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO8bAQfTtoLl26BkKalzfzUzSHvhF1rze2Z0pSpvGoA=;
        b=K2Rmyqu+jraH3XPSc79BYRjrag4MTU9HeIkaCF1XI1HnHBMTHdcze6RDZ0y85I1HlA
         e/mzWYyNzaN6AjMKepko6KU5k6SkIKiem8FTDIjZP2WGL0Fd6Er9mUIjgmTQ71oIvKkp
         iSypMqJ9Iv77eFjghsZS+hgdV0OyPgUnDwIkcfO0M09PKgm9tZvREVd3CkKaTn46lhdA
         eX2c/SxIS104nPr5xZOHkbKuCkJDRkA2SadIXoJamNu4Sz/+Kwdxf7+HUWT3p7TVT12z
         2ZtGShbkRoey5+jb0H1jeh979iG92zjPcuK10FdaUrFAxGgeC50DXL3SJNXj++bGgyeA
         XI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578424; x=1786183224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bO8bAQfTtoLl26BkKalzfzUzSHvhF1rze2Z0pSpvGoA=;
        b=qvIG62uBv2tEUJYUR3hFLoLRk+vKMCP6Mn3pvQpyCNpiwucsaLU829W1UPrCu6sIov
         sZDulPDG7kJmiObsHdqbMwUwFl6WW/R2qL+NDuprRgk9eXsZmhEmlyy/VNMkB3q4BFDU
         UgaIAwirnmvGE8OIbgqphfwCFHmNfpAR3KTz1iwJ+XAsCEBsOGnYofmr/9IKlWOuBzK/
         jSibU93rhzTEKjmNTZT/jkt1SXk1RN8iq8jEh8/NozuphniLN7fn4Tawfa3FEcLjTrWt
         aDTTSENGUsM7zZCzeiI1b4IhU9V/uasrlcWPwEYts/0AZu3Tfrv8d9GSvhZSN+Tmekat
         a9ow==
X-Forwarded-Encrypted: i=1; AHgh+RokbGnU3NdvudVV2otQinvvtrSwn8hxFQiTjtNtxUHy49CbYdY7+Pf2sbMhCi9id1yP4U5g1EQXWfKj@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/fB3p4GPxxjgV8Omh4PMzH7Eln18UZn1vZxLds4yMWHERs1l
	kID6jWYM6196PRiZV8Tj1xshvsXTVxFOR+xxHvpnjs7GJg90vLi0ZnjjRljvOYveci/ropaDsmt
	2Cr/IZYqPoRgyFC7FIikap+tzKqHSCgVm4mnl+tEyWyPMbLnFiYNevCQbroVF8+3g
X-Gm-Gg: AR+sD139LPyyKCSFNxrJYgGnF6sgnvlykGIqhd1tY5Ggwvhllmtnu0VbrhlHY/15GA3
	l78ieOSBQim7kbGjWV0O1ZP5MSwLnebhUeQWmDUMOFg80aykaotFVn/jm84HwhQeQKQApteP+oY
	XEQod96VOQ6J0+Zk1X4ABKcL/8uN/y8qCp4itl4eW6VcwE62Ot7mrepeB4LGUuB8v6nz+37UHW9
	mgbahdz3KM+QLtnJS32Nh4m0uktevCNWWnNpCwo3QsMRpNThr8/Aq0VLgLpKJ4bis54Lg7Fi8G5
	4oNZBVd+bixtWJm8ZLz+NX7ewYFnaXkPpUJQoyW3681QPDAGGmRtzF9rl4SWJo/QNHV/3U5iazj
	yje0JqoArulaYBefAPyDQj1Qox5BHrklH4xOf235pSZXasiRlmdN3QSz/p4ewjeyG
X-Received: by 2002:a05:6a21:1f87:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3c92a4d7467mr2752363637.8.1785578422596;
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3c92a4d7467mr2752338637.8.1785578422084;
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:21 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:17 -0700
Subject: [PATCH v5 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-2-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=4546;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=9Olf1uz4AYcEikbkwsvzP+2rF+vetsNaAn7FsiCzHVE=;
 b=VbFTkDKxJ00DypdhgP5BB/ZCneCyo2NGb/5P/LEQM/SlgnsPB8asIoZ1RzL9v2/fYKM36xHko
 TqnxFRpkRqpD0AKWCnGIvjde1Y8xYZSUo10I78llc48y9P5dxIyJy8m
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX9GuGoG+mGijb
 hwY+p2n02H9JifZx4/FzsUpYwejC4lBSzXuuuWltmDJNjAPBH9v7DqEPMU2N3MRPCGhUr0D1i2u
 coeTgnYz6Jb8ygarLPpSQQNivA4CkYc=
X-Proofpoint-GUID: e_wm5gntSRQK5kYJXFm-uN6Pu-a9IUB0
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6dc3b8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uk4ur7h3pE5DHNqPdj0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: e_wm5gntSRQK5kYJXFm-uN6Pu-a9IUB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX9E4J07cg3uEL
 rQIlwHm+eBrtAI/UrYI8qqUGRNaKYPvnPKNtLKJIliLFOzV5i4cpJgIRQ0LRXSQ7pB2zm2V/V7F
 UQSL3AbvYnSTT3CrQwkiXiycNtJByupY5NVAJpPxrvzdeIrYbAwMo1fAxCUkAtzNGXcYxC3/jr7
 uJlglWdfy24hWpwOWtUlZMz/WBUyuH7ZYTMy5gpaxfp1zj2B72NR7qLi9tFMzuggASGNhhyY6+p
 edNDBfJTkDjf0idWpiDogKlapIqVb4Oad0vBISszGRCtK3uumeXL91MpLOAWFNPfTlPja+3pPPh
 KCJRQwNT5aVzISuRSbOM9gP11nzJH8Ylfu/jiknlMQDQx+UfP0EpSA9Zn13wQ863Oy5zKCEDrV2
 TkF9Xg16pX6hJlIdYzNd2ES/1ud6Ih+Vp3Qx8F7eEAatOsd5xxEb69EPxWDgEdj5k5TgFlFcsRO
 qvZQ81eE5afn+rzHmew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1
(cpu6-cpu11). The surviving cluster is re-added in the cpu-map as
cluster0, since the kernel stops scanning at the first missing clusterN
index. cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain
1 is no longer present.

Kalambo uses PDP1 for SCMI transport. The tx shmem (lpri1) sits at
offset 0x200 within imem, pushing the tx region end to 0x380, so the
imem size is overridden accordingly. The rx shmem (lpri0) remains at
offset 0x0. The PDP mailbox registers are overridden to match the
Kalambo SCP firmware.

Kalambo's PDC input mux differs from Glymur. Pins 109 and 110 carry
tsens6 and tsens7 alarms, which are absent on Kalambo, and pins 134,
138, 156, 158, 172, 181 and 202 carry gp_irq_hvm inputs with nothing
wired to them instead of wakeup GPIOs. Override the PDC ranges to
leave those pins unmapped.

Add labels to the cpus and cpu-map nodes in glymur.dtsi to allow derived
SoCs to delete and redefine the cpu-map entirely.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 119 ++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4be7edf894b5..3f1fd0973717 100644
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
index 000000000000..8e2077d9d0a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,119 @@
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
+&pdc {
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <57 533 10>,
+			  <70 546 4>,
+			  <75 551 18>,
+			  <108 619 1>,
+			  <111 622 19>,
+			  <130 717 4>,
+			  <135 722 3>,
+			  <139 726 3>,
+			  <142 251 5>,
+			  <147 796 9>,
+			  <157 806 1>,
+			  <159 808 4>,
+			  <171 4104 1>,
+			  <173 4106 8>,
+			  <182 4115 20>,
+			  <203 4136 4>;
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

