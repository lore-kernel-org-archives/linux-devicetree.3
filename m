Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D5379C5D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333149; cv=none; b=ggebfFePn90/sPoglxd0oL/CW1XduoUrpMlQkvBjHJ2yMTbiPTgT1836kmsCmmXEndJbT3oSs1SmwMLLp5dniUcKapbbXvUaXdtEVk09LsmqodRewkYhSmct5c3mp6Al/JfT55NQ8bqzrw3MXpVXtng0pODI6TyR4qEX58iWWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333149; c=relaxed/simple;
	bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4+R8YFEOdBM6D8bU9SSm+OR3oaeqiuog16O/t4oNSrOM6BvmoyTo0syElb3NMxScM5USKUVWXIYDaPAx6mSkB4UfIW6L0BXu//uOdBMsLvkJn01HGELsbSY+IHJRx8wv3HIWyG/emFKdYo38KZVDLuAbMhY3Jad5yuUpNcTuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpHgYMMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEl1orun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpHgYMMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEl1orun"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693vfv4172364
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktR
	YliMwimA=; b=SpHgYMMaKwqxKEa9F6nu86/EEqJqpWcY4p+1YGFaTjhqZmFVU5a
	cOBjmzHqvyJI/Ae/gyDqbAgvTJuv8qjVsiGUYkW/50Kq+AkiClPlYLog6rINIzna
	024JDp62yZEmxgMoFKUA5c/V03eqMTr4zPzpLXq8Tue6h/rqMYgbmOF3Ah0LK5cE
	OeaSxXMtBX1op8UGkeCI7m3SbPFBYpKTZk+1yP1JaaoFy5qYCABQSjEvlegINhP3
	5bKw4I9gBSb0hI4/6IoTzM7zgJRrA3GxwzCOpf5qELdtbHL38kEZp9J+E49ftH/O
	dTdr3HRJY1nF2eSQp/D1wZ2/uAvoI5ccOng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88f83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso531237585a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333146; x=1783937946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=UEl1orunhm7/DpJb1vrJW+wwPPFKPVxGDfb2f+4Zdv7Hl7G5MsnZyPMONrtt3n5Fta
         R0/sqdXUPhRy7E9ZDWdk0ZkmrIKXg9Y7HlFK6wxz5EuOHomLOxGkp3PI+/MXEq+U6o6M
         oLT0Mg4+phq1stePC8tjbIkSMKAsy2ACGMCjrWi7n3GTXkG57nD+s//2PezzelndSeKs
         zXfGXxtw+POiZLwIet6mUYs3rVj5uKJtz1SaB0bIT0ICSMtOSV8MTwuJcy+/zQmYvhU/
         YQopzO5LuIerCClyK9I1WQLQOiUo6sTOFOJQPsdrpoKFDRquRz/K0z1atU3gIExT6sFf
         hI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333146; x=1783937946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=i5nQVgdzLo2+NgnTw8y+6hDe7Payh4Sx0mWetqkMzMJLokpx6DqFwcB+Wp/Kzh4ctg
         VKZEAEWCwI/tfBk/mWj276qknmRpzssEowTx22vqC6pTZ4TzCnpJ8jFN8nyOOsPbQvpq
         NYCaSPlYKjOH3gBC4T732f9KfxMc7eOfL1BvlMcbObx0yJvEFjxkOZIcK7+GfpiC4NYP
         4iT0ZhE9VMz4NJ+mco5ePegGhECq9Al/i5A299JLPB2HqTNggXklnDcvPFLhb9m+GFad
         bu8b/qHAX2YzarCLIk64x6tLDXQT6Oc789fIJxNmi0Llo0RXbK8csq5BaddfjuTj60rM
         G1Kw==
X-Forwarded-Encrypted: i=1; AHgh+RoU6uEI29T8xIF9/dpivgKtnTWOmYRABTo9/e2786XY+MFeYBV0Kpe4qBvYuz8+VJyh+Vn3/pHo99XF@vger.kernel.org
X-Gm-Message-State: AOJu0YxemzHxcfpoK1NajYc9BqTR1cHi1egaN2fv2yuQNJDFJAsHKGvk
	sEX3LmEzbSrWqtCjq1Hh0ro2SkrOB039wpbqv/1Oly58PHStfmtIimJxnR22ByguJn26IAeFCuh
	j4ftgIzQcN40lzyOCh4iL0xkvseteAZ9CdcXB4CUIYUKYQLkFSlBNq4Dl+Akvg/pe
X-Gm-Gg: AfdE7cnRwrozttmmIs9/xmfwKtgdK/3f+djfznSR7sG+F8eF6//7SroJKnaPMr7DbOu
	hH0unzn5i28iGsGU4LARBCoEshduz2ZyjuRfadmravwcJsYgn20ThKEhpNn+A16phFR4fU+ihsb
	7LwUwPTMyDHA+6gVg4ER+ix+OS5Tw3Y4UeKWHnEyrWrFcunO/9R0tpQ6fqlsvNMm4SqtJkzoR1l
	5lgF36s1M1Ah2cNoJKtlLPZPPIWO/4nNMySp38b3H+DXS1qcSgcwT+P7bBlVYN8C/bCLemCkbi8
	mArCaAXLpkRxgwRghf19bxehi7Y2An22jkEFVtxFuZGBxufgPqpWPMu/CLq5/YAymS9+Gb0vn3G
	lFKtYIbFTC6js5C7cBxdhUHSnDvg=
X-Received: by 2002:a05:620a:2987:b0:923:5e7:1664 with SMTP id af79cd13be357-92e9a422eefmr1265729385a.45.1783333146152;
        Mon, 06 Jul 2026 03:19:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:923:5e7:1664 with SMTP id af79cd13be357-92e9a422eefmr1265726285a.45.1783333145754;
        Mon, 06 Jul 2026 03:19:05 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24506340f8f.37.2026.07.06.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] ARM: dts: marvell: armada: Correct indentation
Date: Mon,  6 Jul 2026 12:19:00 +0200
Message-ID: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4ET7/9xR+re4ch/w/EUA21oeJ2J8KO0WF/GC
 1JgRkgO492JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBEwAKCRDBN2bmhouD
 1wnJD/0YJUwkHrb/pForF3bknos/A7hVNR0sFQOvWqWJKB4Fk8IJHyn3C9b2+XdMyNeHTaSwiIx
 dPDEoDP6YOPmvqS17obIK9OJjU7e4zgBBLo7o/nbNc18FzD5GKwi7J/YduzsRwE9nWpFMba6Itl
 16ra3Gp2XU6FN7EouKYFwSh9mWCfZ+MyNGO619Ilc4qb1HoJ7kzOwIuR1Z/iw70+keMAXmeMBCi
 /zwEBcplh60H8okS72wQWnLiRlZNPvDtVXaeaapz1Fe3q2nsJgE57u8GGZZZf9kU2QnULOVeRHe
 zqAPvLzUZzl65Z0zJgfZXFtxbtdXm3NxCePRfXD/vrDJR+CPdBCPgvo3br2PzbXaHk3YR/PiX6o
 P7DL1/+4B2RtSmkkC087e6Tdp2mUco2ZMDbKCYOy5cXKZdGKdVp9STqWCEvoLMil4PmrBCG3/4/
 ZW+xcUClbtlNI40sEQj5XYNiIqOtQxUbf8XjBLJDssm1Svo74+G7xX0gnbGSUM0wjVMtcnY83wE
 4Mwx73jkfJ1h3a2oD61hQVXdsMJeIjhBHT8TN5pFTc2yO+srw7BPDwXsQzoch8Ow1zqiDsIDGfB
 sq/hbw5Xfr/1b18hVxP8mD4f3OGYmLoaCFA/mzXueLnpBoChiiO7c0CScGbONBX2+grH/am5Ok7 nvTAa/HJbNycXqw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX3F7jpPbCJIwU
 AGxroeKijyt2PjOM+UBcMI/sj5yGl+LFgpdEnYpRDCkw5YZT+6z9Id9RmsIdQlNBPxRCvvTWiv4
 NhhRCuQ3JBgaJ2hkdNNCoqzVHo9UZYc=
X-Proofpoint-GUID: UPUhGbKbuZnkxxwQCgFePOPAzC36Jgrk
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b811b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YZ7BP_YtM1ypoUlq3ucA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UPUhGbKbuZnkxxwQCgFePOPAzC36Jgrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+O3Q1K4LuBxU
 bj2eSRo8XTTtIdgqbd4emgZo5iw3URFDhgshqH/lY+tbVzk5FzyskP6/sk6ZR56ET8w2/+O2faz
 ktVQ+wnspHB0NVeCFzebwTA62OoTtYOqnABQdgSkdC04l1wF6TZPxsTV1dV74jktfZDXnwfyqTU
 OyYZpLaU8Hmx73Lv5lg94t7JnFom3f1QuVVrr/Rs67JN63oE3MRNdXd+AXrhy064X+pLIQuali0
 Ti6GhidHtSoqxT0tc9H3nsHjB69m0MaZ8yOTaVeV8BFrc6JjWqPxjd3g4q/fFaSmSOXh4FpxTqT
 vJcYkrSpG/xMVAmWbV3vZJssANaRoTAFGF/nqdrRQ61/cM4XoKjqg74ZSZJwcoQosAZZNWdm7ck
 r7zXXEt/WJuqnxcSt8T0+vsGPojabI2xVnFxdusQAQy3PVKotkGCu+cbz4x3SS8racmxFwIvtYR
 25tVqbJs/U2OHbhIaUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/armada-370.dtsi  |  8 ++++----
 arch/arm/boot/dts/marvell/armada-xp-gp.dts | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-370.dtsi b/arch/arm/boot/dts/marvell/armada-370.dtsi
index 2013a5ccecd3..cf73287501da 100644
--- a/arch/arm/boot/dts/marvell/armada-370.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-370.dtsi
@@ -63,8 +63,8 @@ pcie0: pcie@1,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 58>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-                                          0x81000000 0 0 0x81000000 0x1 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
+					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie0_intc 0>,
@@ -91,8 +91,8 @@ pcie2: pcie@2,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 62>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-                                          0x81000000 0 0 0x81000000 0x2 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
+					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie2_intc 0>,
diff --git a/arch/arm/boot/dts/marvell/armada-xp-gp.dts b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
index d1d348b91c0a..65cc0373fe04 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
@@ -34,13 +34,13 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		/*
-                 * 8 GB of plug-in RAM modules by default.The amount
-                 * of memory available can be changed by the
-                 * bootloader according the size of the module
-                 * actually plugged. However, memory between
-                 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
-                 * the address range used for I/O (internal registers,
-                 * MBus windows).
+		 * 8 GB of plug-in RAM modules by default.The amount
+		 * of memory available can be changed by the
+		 * bootloader according the size of the module
+		 * actually plugged. However, memory between
+		 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
+		 * the address range used for I/O (internal registers,
+		 * MBus windows).
 		 */
 		reg = <0x00000000 0x00000000 0x00000000 0xf0000000>,
 		      <0x00000001 0x00000000 0x00000001 0x00000000>;
-- 
2.53.0

