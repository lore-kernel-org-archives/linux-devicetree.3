Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D93DC4C2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031890; cv=none; b=OD1DKpXj3zY+TTwT6L1YVGlbo62SKgOy3fbcrgfVNjK48LM06YeL+aFE7g9djq48REzeL7+/iktarfHgBqozlnh5uqAQPICy3N92mgSnxT2V/uLVaAGX3ULgxgdeU+JVxzbJ83TuZ+tGOFRY8H6JW25u7SoQ8Jh9Laf7R6AICrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031890; c=relaxed/simple;
	bh=oi9/on91d449GBYTbEf2yNhdCy70ROE/FhkTuGYATnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohZD0FG1Saza2cAbAFVhkfosyPkIk0SyV1YCyWpu5UOMBhqW1KvPfRVBe73H5JkQsE4UgbMyS7zL7/VkX1OdOSmRKLv//sIRECQvPc/s+jhvuDSAiliBX79m6jL267LbFi53cbtiEnUJc30WYT2qwb6+4bP0K0v7InfO1Y4Zvn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey/EWuNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafZEPYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey/EWuNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafZEPYr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1OgIc1707295
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nuw13GmJWWJ
	/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=; b=ey/EWuNHd+L6SyedsOI0NPbBap6
	+KqKJP2UGJhuvf4ZTpqEd1w+GDoHzgb33Et5JNN6KdhjJKm8J8aOS5ZjFzKXvGs1
	4e+qMfjkhAUL1qnhEBUQgPHPGy+kSLHrqARAPKDzOpS8l/twN2Uk4NQ96T5/Cj9o
	geYfz3TIyTMBQilh4rNcPJQooyz5M2p+nFZEh3lQ2rr6o4aQbHLT/irnmd9fuYO5
	qGvgjFKWYf4uPjmQPxBBsL3xXTxwklzOFnpN4LzdUePQNgQ1kJ9iQBgHFzCd62sH
	M2v1dF62m62Ezd/M9hxepRNdNgn4fNNxyYTJQcB/B0XesH445o6tZ3Up/uQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54r7tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso10063833eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031880; x=1792636680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=iafZEPYrk4eLtxuKu8oBQ7n8j96JDqqXmc4t/GqksXfD2HWcrO2vAdIyEndB57jiKG
         MbIq7GU8gPaElzO2f/zgJuZzCc1dfvkL/Hi1rjVfiE9vBKyBIqvTvo3lxorVhimlYtVg
         VG7Akmj3lJYHe4Yxp0T+FQ4wO7ZlS+Y2vGVqf136CsupvrVg1WA8zPVek458d8dXldgc
         BKNQ/x/h6WGG5PzsWdixkFRDFXu4DFc6FQh22lWiFHCs431MW4D4it8T+v6PY+If/Klc
         HZ6gQanIVavidBlgI+m/0Nt2CavFccm7REID3tWHHTH2ATHLEVxQfC8c9dfdMHXN6N3z
         ZqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031880; x=1792636680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuw13GmJWWJ/fBXgiSVGJlvBByWQxl2GyouAKaNRy1E=;
        b=c50Z4jtOFedGVkIl68mksDbkV3LrMGoaqBkq1Q8lAUqYcDpW5WvJMLqs7g+M52e0xj
         evgVNCSnXOjsMq0TCOHl7/m/yLyffKk8+erE5CBfX9hZlpCfqG1JviOGOeAaxu7rSh0Z
         iUShSg78Q+2SBGzSCVYiUpqGA8iy6zWeJU3CUDNyUsPJ48qQH2oxnJMgARSTAbbMYhVA
         EXQxH+tGkPdLqgsIOdWXA2BWJLBTQTQ+QY7GbjZCkFG3ZwkvrYkjA66njvLS8Vu+zzju
         n4Oz2/0RenVHCmRGV2mg7gPvrnD9RemMBwKxDcqpvipwMw6mR8sIb+APzG1Qch2oIXfe
         g2ew==
X-Forwarded-Encrypted: i=1; AKwUvByFEq/zabAuP83tQckbdCiFqBc7AyChGyZhdCUA34VbTzCFftLNbAtR6bY0+o+PGF9/z38zK5t8Umip@vger.kernel.org
X-Gm-Message-State: AFq9FYLiadzLqnhMiKd6F3+bXw+ArGggQnmqXrEJmSNX6W5TE8pR+7q9
	nDQqfLpXjmIvHzJDEqOtBez+kbG+MppXsbBGjOPCDLOzcH4Lpk0Fp3saSZYS5NCTiCbXBSiuyXn
	DHTsgllf1/86ltH2aXswcPC5aIaVKT46WB2eGh60p+42imPLUh+QSIzPuhALBT6qX
X-Gm-Gg: AYBFou0xGLk3vcOeKyUiyif6zypOcyaTiFdBnxxGleENH2c5TdYDs20HH9rvTSrvrV+
	VHGcpxUUBEjkGvuFxJ1kzsxa5Eabmmhg+gtp+GX+Q5RafoNFZ+OQkzakWNckkNZqRcFo2/rObaP
	lFvmAJCgluB6lyYEaqoRp+iB9mmc5QNnj4nzDETuzfXQQBQTihmhXPRyiYDeoXc19YBmqgDseDU
	oGIsZTnhl+XtFx+GLbvSIKjpnEyZo5p2srf7ocUTq29tOrTMJZBGw0r9B+yUm3j6ivTmjzEd9og
	SZmrKpTLQodGYeFSj0ZmbYcoHF9qxV9ovXfAgQtbyZu3GNw9/RuBYIzQ0uNh/6V2vTX0b3RrwA9
	Cw91MXG83RYW1BsTgeXlR+LiZrN2d0XJqGEw727HRBRTtFaRzCYrZ7kRv4TQ=
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356353c88.40.1792031879469;
        Wed, 14 Oct 2026 19:37:59 -0700 (PDT)
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr24356325c88.40.1792031878876;
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:37:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Thu, 15 Oct 2026 10:37:05 +0800
Message-ID: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad03c88 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX6H9TjJgvksOf
 0F1UEFknu8Clb0F3Wb7sd7xBZ+2rJoOACyrmxk8LsIuHERsHYfD18sj1AQY09Dvq+HYbYbkVn0i
 WnuhaIJJHv9k8wYsKi5OrbrqgwwR3/Tr2KPpFh4lKtedXQt35A0jiyECr+VxAdNgepO3WJzbm0e
 Kg/bKqM8/LpSrZVXp9HjNwRe5DMdo7I3dJAFxRQ1GPtZyK4fwWr6tr7di5vK/ROEv9Ar46fEWKw
 iEg60PJbVdSLjF3lfoTAsDdvTODMDudQilFkFg9s/Pk1dQR9CtMKx1aQkir3RBxVQbc7PaWw+2w
 u9uUvHCr2ufW26LNW7q3Mvaf7R9QCzmtwJdP1UHHB1TQNCo5AqOhAjT1IlAEpzYuTR4rhMAJXpl
 bj4AYwyB3ZN8gaKtKQFgn6KDscQ48oEmEfsTyaiJgR7wnZf4Jcgd0C9f9YAyfX+2pDrRfjt40yl
 bc2Y7b3oUAu/lXJBRCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX8CCmsDFFavlR
 Q0tcGv0yuQXsyZaL2szR5AYXEO+AhEO2t6ykwDJFMOOeS3/bSTxWLymJPkmmwGXwQi/lPErLJhz
 +2jLuWZNrE0g6XDwrDwfDRO/gn1Awps=
X-Proofpoint-GUID: gbebmzwRkEEsBCrkJboKJPCFZoDFHOzi
X-Proofpoint-ORIG-GUID: gbebmzwRkEEsBCrkJboKJPCFZoDFHOzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..603a3fa18994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..a2c70018e571 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..7597b4f27e78 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

