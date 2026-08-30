Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF57333E36A
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788092808; cv=none; b=RPIdTo+eiP+yD+wbHVJ7+PD7h6UYUxDUDipdBfqP7+7Bu63z96EsNGW+JMXAl7e93gx8xVVLPwAUOPWmB/sXyp5uysGizrAlhEqaWoSNh46IN+ANW7k17I+q9kQky1u6vrXVgmdoQ29nR0fMPeVdWtmTeuu9sxNQ2zas+/FuG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788092808; c=relaxed/simple;
	bh=FDD28pgo2JR4sT9/+8byaMMdSzuMbW3Opug55Aujvms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZTRU9zD2v7xhPZ0NJCOMyChjVKM+h2/UcD31IiXBq9tCyqp12JQiTOxoGpAofzQss0ipW8zB2y69s+NASzjWDldB8eNo/w/+LW9JqA1U0mRjQE/KBv74JTgNeMcXyW+beCz0MuFD9CDNVG/+uDM2QXj7xXfgOAsQ84PGBf034k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJGH2/ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fx8OqTxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJGH2/ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fx8OqTxH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7Upu188237
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQ
	wEQEQs/A=; b=NJGH2/ZVFSboq/hK1aP8CGOC487HK85Lb0Hs+x8eR1FZiWKxL2A
	PMd2ZUoI3OnxmsYnvRgQii//xLC3z6VGr2liGTpvCJKypbDkRNinFt7zx8FOwM7Z
	ZPDh0E6XtKHhSK5lLYAyozt8/JNA57WaKj7n12Q62D1HePLLpenpJtAaWxfraN2D
	kAMCSGq9+No81KcwZzflo2x9x7G0b4X2wbUxrNabvQ86onMrmeRBCFLctJpx+o+J
	ZVDZ6mzPUs2TyNg1afPlxNmCEIJNSYDERiZe6VyXvbQCAdsPQgXTBzKcg5mP5KQJ
	81BOg69fKFcHrpncHYc8ffUFdqtsile8hyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb2y9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 12:26:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6513956a91.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788092804; x=1788697604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQwEQEQs/A=;
        b=Fx8OqTxHWMyCwQkKns/Ec2Yv/H2Q9pBZRvKhEiCvVF3kvf7PfR79TSwBnqGi/6TJi4
         KrFnwkhGTqj1mvcQXT6vmKCt8oEUDQ23beyhy+MdxHZWLxpkp3ORvVojwaeu+zqhTa99
         2gyZkF8l29VCh5qKwid4jO9ScuOh1EFtQJwES/goyjiwmbeRvulo5bofMZ/6hFa+LzE5
         Vut+Dz+84lZNQnF/q3IypJTLe+LfHaBAo0/Q+FbJJ9FGi6i1OF/7f92FBqCwmJJBax07
         8lNoDOdy2bibXjoBpBLpaIB9YsqeFDLNHqCTS8jmxZleu8bjaPMO11qyckLYXIo4iZnd
         TLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788092804; x=1788697604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DliY8gQHUFIBwhqS/ZScFsxNq5PlVgKAaQwEQEQs/A=;
        b=Ta55WLYe9qMX2RvheIqO0fahGsMd6MfAovm0HJDjlvW+aIIkpi/NWd/je5wf+ECFhc
         05djcVfxYjYCzBZQucusemh9p6ZDt4k4pf4Y/GFJsdIKhEINhQQLikp0/EmG8EUHM26i
         RuL9xgFzreBL1f78MhcG8s2JORTEx81zp6tnjXyuk3s8xFArxKL233H+3DPUe5WQlAft
         FEA99vE7aiFOwkU2YDxmT8kJWRA1bu7hfxg+FSUQlomnyOf83hDEeYDdY5waorUOPC8P
         doiaYhbJCp/u3cAAbZ6CFYbXXzuPU+8hUHA2AIebgCfjgukk5owIThbBMWn/1/6Lhd0W
         PLAg==
X-Forwarded-Encrypted: i=1; AKwUvBzaNG3cfMHYOxvxer8yqWGVpt/cFbA5mXHGgSbanjIY+SSXEkDq4oIY1FKzDl2ihb70RFbyyVjpVG/b@vger.kernel.org
X-Gm-Message-State: AFuF++mJeUpSNsR686qOGDHulPWQlCTvl0XwU3HEFAhoFDu5XD3h9Vpg
	iGiIlC8UkUOnjezBv8+/CoWfxAJsHmsSJySFkubpdqZDmU82cDLtwV7n4YsNRKUkls4m1mEQuCd
	9YkgjKOqMri2tQfsxLgJi0ERsMnqzpD4rbUDBU4kGnKbBA3ra0aYCvV8pTYt04exB
X-Gm-Gg: AYBFou3QJtT3XdENUpuzdd/tety0BbTXqncSHecbhpC8OlNq12jzHD5a8bDN47+X5b9
	4/hi9X2OujlisT1ZMnUn8RU7kR9R68nUXv5jDiIY0ASl1SSqpiRp4XACQ5tKEIdJs3IlOwCzKNJ
	qBcO73WzE8g1g9GC2wIzvbWjKtUfgDxLgXs2w8jyu5zsgVSm/0lZyKdeKO/q54O/5qPtls2Ka/O
	5gzqso/CrBJ0LCa8yc9r0uJZwHNAqdLkjmy/XKkLYN96cSoR0c+F9Hp+2MPm9AxJD0T/Iw3i7u9
	R77Wl74pi/B6i7EqipAaPF2reEERdhjW3pagfO9zrtBNeYc1hAMHZBj8MVtG0J7c/ILc7ikvAlG
	jBelVevLQ5O52T2ed4Z3EoXXe/qvKaq6E3BBb9CbiQj7Iu/BQjjaFn3B8WEiw
X-Received: by 2002:a17:90b:2ec7:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-396d0c0af4bmr34255038a91.0.1788092804576;
        Sun, 30 Aug 2026 05:26:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec7:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-396d0c0af4bmr34254990a91.0.1788092804156;
        Sun, 30 Aug 2026 05:26:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b58c057bbsm7982339eec.19.2026.08.30.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:26:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI nodes
Date: Sun, 30 Aug 2026 20:26:33 +0800
Message-ID: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfXypTFV/rGzfUh
 U+DG/081begzoxbTh8gy/Jkk1jnYC3/1pYfakZRFyMtg0lCIiTAEkLUDLQqz0b/r8C6x2+UQKqs
 ux9jLWG4GRM5Z8jceT9fLWL+QQXBw3cTfAF40oQtuX6FvAXHeOTxaCmk8E+GNUSscaStWlk+dQt
 3+ZVUMa0twq2TheXYo8B1baUmi0kmHsxgxtmUURZsJ6RU5J17TatJmuQrL7Plo5ZE1ZQ26TW3Yr
 D09Vv4vcHwY53PFtajitvFJ1gAul3vOxL1mHay1/WuJl2vp/E1EFXTh4S9siDduRxxOMo5Q+cZx
 sf4ls8yw15NKwzV/gHetfip+VNdePvnqfdo0W3wAHy/lx/5juiDjoMJlHGGbZF7dZE1r1zHJCcx
 nzkZarqxTbZPIRiEClsCxMKS/5dRAYA+IPRNVJ5WPlZH43HnWJxo24v3Q3o7v/+lLsJGkSKj5GN
 DHcMZOyRztF7GV4DIsg==
X-Proofpoint-ORIG-GUID: rqwPoHQbTTLSjlqxN1za2jg3DUYCaFM0
X-Proofpoint-GUID: rqwPoHQbTTLSjlqxN1za2jg3DUYCaFM0
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a942185 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ChgJcJ5zdyUGKRC5B0oA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX8PDriC9QPAAh
 EgKPaSeUfbL1/djA3PLG1AvZnweFboV8OJ4+SyRfJamvrPuW2CKV4ShL9Cx84gDOieBjbnrG7zX
 XtEx7jorBPJUK0xKAn64WBcenx7RIz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300106

The qcom,bus-id property was deprecated by commit 345fbbca3f76
("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
referenced anywhere in the spmi-pmic-arb driver, so the value has
no effect at all.

Drop it from the remaining users to avoid spreading.  No functional
change intended.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi  | 1 -
 arch/arm64/boot/dts/qcom/sdx75.dtsi  | 1 -
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 -
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf678916..3773c3413305 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2340,7 +2340,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..2762529611ab 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1137,7 +1137,6 @@ spmi_bus: spmi@c400000 {
 			interrupt-names = "periph_irq";
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 			#address-cells = <2>;
 			#size-cells = <0>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..9eea5198f1cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4692,7 +4692,6 @@ spmi_bus: spmi@c400000 {
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 			#address-cells = <2>;
 			#size-cells = <0>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..15ba8c0567f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6154,7 +6154,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..70555a426307 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3609,7 +3609,6 @@ spmi_bus: spmi@c400000 {
 
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			qcom,bus-id = <0>;
 
 			interrupt-controller;
 			#interrupt-cells = <4>;
-- 
2.43.0

