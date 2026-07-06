Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145CC2BFC7B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333096; cv=none; b=FYizENgHVfSpEgz6D4xYqhE20IpKDuBpAv4Xzt/uf5j0SuVpRC7xlJ0ar/F2IK99gEvKqvrJDT/Kod2gAefRZaImPg9IxHQTUVu9QSHhnt5o6f+3ICx9Mtterd1DxK5yfcmJunBuD8JyTro/MdRvQbKPESTU87OM0jt5r4IOoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333096; c=relaxed/simple;
	bh=H6KNydM5/kYWRRkSb9JhYDs9KRF2JwdOUGo8ZBhBSdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yoqqb3DFdTLKyudebYhHpnHbduWQTLBXneHQw0dR+HHYDN/2/35C86QubFd6nP6hnnaY36bNZC6g6Mpscx/ivqP1/KInH5NwxPoAMzBr++gZPHVPG7IR8x6MJeNkka9UkKg39yKCzdosVmuzfRdQ7kbnLpis39+VgmDiZulJyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KofZJpnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GP/hv3YM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KofZJpnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GP/hv3YM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693uc04151598
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJ
	T/ahx32w=; b=KofZJpnuoLzgMQt1azBgIa8LhaR473v4IzQcssOr1ykYPurgVfO
	IfypWmSjp5QZHM45xSp1ahWdkyb5Kx/SfhnH3AbJLIKxJJo8OQfkoXXXOWXJfLjf
	MW2kFE3+swoDIU7E0w9p+yjjrue2UjOn2LH3SSaZ2sIcYe2vSLDMV3cZz7uCmuO0
	dNus+pAIhbGu/Jpitlr+bXAQ2+gmHrWgrHGsRwZeFDnTOp8zj6uM4dVbTJ7uz+62
	+PnPft3M93YFfO6406SpmBisitSsO15UsyCKYFBCccekyGqNQ0cRN+sEWA6ggyGI
	2Hj9GBe3mq2sd0adXdLECw//i68Oum0H32g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8jds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so439474785a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333092; x=1783937892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJT/ahx32w=;
        b=GP/hv3YMtn6eDemK62b0Fq8bNHNVQwpAuE4rGf0SNu1UJY4EzrgB7h+6lK48qFPVaN
         BomB6c17uO7pn0dhVY5bqpz0whmbK7pPZhAngG4VlMpKvEYfCoyfnVEFhF2AGC2Ezm8w
         VViy8NcpOCdxpJk0a2d0Pgqo+OqkGeEqjT8QMwSJRJkaT5T+L5UFhuz8rKGzbfHxqWoy
         wfC2Pchiw5nWqJBrJ6v1D9U074bE6cXhXfDdkKEj8IQqoZmWzbk9YW0145PQrmDZf8uu
         mDapfcwEICgWfr7x4VUwh/hnzes1lPAwoefej6X5TDzDT1jaDDf//XfoKpOrQhgDAJgG
         DzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333092; x=1783937892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOxRusCSvDS7I6PNHmslnpo+9Tmz+Dk0zTJT/ahx32w=;
        b=KzqXYbQlDzdnDmK2+X/r86d84cFfhOd6EPKXuJiatdzkBIfoOkJlUoSI/UQFeblCkH
         JKMEXLIWDU2eAVACQWWYZ3oIVYb2TGDyaWW4Hbm3xWlkf8J/W/RyNGZhTcROyzk4lI/+
         xiEZ1okXCB7YF6qDmPVC5sD4PwpbAY0NyHEPzFo2qKYhI1BYBk74oPyiCbjWlJj+U+H2
         MBBDCtsN2F6TthDrSurLLRjle/g3NuaHKhUpO3bKI9ScISV5R+hVl6mF+o5OtS/hjXy4
         fdiEc8UVqr/tIlTewvgciHw0bXG4hx37OWRsNiDHZ6WUok2D/t7b2Zd7hoHTTU9vuf/z
         lomg==
X-Forwarded-Encrypted: i=1; AHgh+RreeIHTRHnoBvwLfJVQzyL/Istz0eldOTPa1bz6ADkkul7F6rx2bewgkbBUcdyHnPA2vR9Z53JriSir@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPlMRxA1MijMfPCGOJnmOf06aW99z1n27pValvyuZ6l1jGMFf
	MvQQvhntcGNcu2ocnYB0KeVnnDbO2LZTPpJIRK4lQWuw4X+/9HXBlLL3ryN6j4k4NwGv0WCnxSQ
	IZLkTFeylk7UczqUfrahp+RwBP6K6evlBmb0H/HXdaT0BYqH9VAv07IlCbHcCJHCZ
X-Gm-Gg: AfdE7cn8+8XCSFrBM2nkS73xCqyhQCNYV56OCkjrRsPiLbk8xL5eLue/g86vHmRR9Qa
	RUB151yu7l0QKS6Ke8tqumKdhkHmueqGviDopUKqaRZjk+apUrbSoNDmKpHtQQCGvQ8W0Diz+EF
	9gkC8sD0/p8JsdO5G2qirGV2il+m/mF4BS6AS4TdsclmaKyKIpC2nAtFg7HeVJAK1JwbnAZK3I4
	thHEd8DhHmoQikNMHNno4LOsTDaKBOOJye8o3kP2LpMCpBcq8CqmcFMCwaVfqBjSShqdfDJPodD
	6QrUoLfYWszzkTyZHi4bkUN/HaeEFmXFTzFztvc+YdJyI9tfX9Y8b/GjMkt8COl2jdz2IOoMynq
	HLbO5BpWjWGmJ5AVoeRYaLziRtv8=
X-Received: by 2002:a05:620a:28c6:b0:915:cda5:27ff with SMTP id af79cd13be357-92e9a419d02mr1433501485a.45.1783333091620;
        Mon, 06 Jul 2026 03:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:915:cda5:27ff with SMTP id af79cd13be357-92e9a419d02mr1433498685a.45.1783333091198;
        Mon, 06 Jul 2026 03:18:11 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm22908219f8f.6.2026.07.06.03.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: vt8500: Correct indentation
Date: Mon,  6 Jul 2026 12:18:06 +0200
Message-ID: <20260706101805.341103-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9358; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=H6KNydM5/kYWRRkSb9JhYDs9KRF2JwdOUGo8ZBhBSdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DdWRr618BD6n+v72aPfU7piRnjbUGZ3ff19
 7shAwUCRM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA3QAKCRDBN2bmhouD
 1ymbD/44EELK7GM4tuQyf4OS7D/GuIBBPCiMScUvUvyWeVoouoJ7WcFakJcz7E2ccrezGBwPNp0
 EQePwIl9nYrGdZRn89OUSXWXVR6cuos1Keha1zi9pViwB3H3Sw+fXoDCrQp2LlFWbtuzIZfc1D6
 oReVAlhiZFdwejsOCfhCkmeiyZzfVbJH9eY9/we4QqAFJ8UO/LyOidZpHRidmml2SZv29f2usmp
 MJ6LUSsX7UHbCezS8Ff6MBSuQZmyoHyCEoiqWJoVY0J8RbDIXi1nbCK189Y9uMqrLh4aXTpKKtI
 XwkJt8jG6StWZNYBtTRRAH69vXgYxjPIPcRybqF1CWLpEb4RfqAsFaX63B8lKMgaaoAKlRczJZm
 MAdB2Y5qEKZ6AYSdQZdOPWlWQbMTyANOe6tqC+EGhSRzE5whydQRpusC766lfPClj6PLCeHVhsX
 +bXTN9VbEaUkB0mnkYrQs3dhD46NVJMKZxGLHp3hRgU5MILWHttXdgHQ/Gpr0/ovsKojWANpll+
 yqwpq8vmmpIMFlE7pRx5L9ozTacpva3Vd11HthGXpks0TaNYIT6J80sQc+o7tqESRYqW1PTW8VN
 6xoejiorr12JvFS3PB9qiLaqfh9YkfYym3Rsg2f7Viu9HBy3q/wdrStiye4RLQSaoDjqLARCsR1 zx8C8uwbH07CBlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sX1-Du9UMWljL6Aci5tmUcISV4WYi6TZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+ypFkRoGOZol
 ONAowgU/nu4UxSJn12ZYmvCoL0FmDHKttdg33hoYnMgwcxeVw4GtWbutvDIxwPxiTc6rnADHC/V
 MWrVi0H0g3kzvsABqB9SbOy/zElxyVYxRJ1jifuA7za9gj4frowPChmhCiSK12WdjF4t1lXVvgI
 3ImmxVcC4ygUrHcTciwqUqVrItQsq2tH23wDe3p5brCdlL0sjymHFXsCeoQfEudajX7W8/zYXP4
 TJlgRij3jDjvPvjlBw1Y59ebRJypr4CRJxnCNt8PKBengu3p00KW5PPZL+T+SambV0XNX+fwJ4Q
 lcLOtuttzzg0MIcymkMaCvkz4E7dtqQ7q4pxXZCFcSDdj0X5GnV41huaNgtBpG0gBG/diUWNeNH
 /ke4AH7WhSd3zDgWk6O6YrYu4lW18RCkbP75moaFcNgPwx3+voi9J6Ig8hacyAk8XqFZNYo5Vap
 Aai/+GXYTBg3fIcXtsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXy16cH/QBhoJ6
 0j22dcu0YihdLCNi2OTgRqzJZ6rn5cCxxIrX6i4UI6bUlZIgL2fThGheDoanyYohPxiHD6hj9jh
 NEugpsds0wDgyjIy4bscbP0O+QKuMso=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b80e4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YIy-g2JZa4JrWsc84VAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sX1-Du9UMWljL6Aci5tmUcISV4WYi6TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/vt8500/wm8505.dtsi |   4 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi |   8 +--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 104 +++++++++++++--------------
 arch/arm/boot/dts/vt8500/wm8850.dtsi |  54 +++++++-------
 4 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 915adbf6e1e0..40fa00f82fad 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -21,14 +21,14 @@ cpu@0 {
 		};
 	};
 
- 	aliases {
+	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
 		serial3 = &uart3;
 		serial4 = &uart4;
 		serial5 = &uart5;
- 	};
+	};
 
 	soc {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 82eef7504364..d27a6aac8aa4 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -21,7 +21,7 @@ cpu@0 {
 		};
 	};
 
- 	aliases {
+	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 	};
@@ -147,12 +147,12 @@ clkddr: ddr {
 				};
 
 				clkuart0: uart0 {
- 					#clock-cells = <0>;
- 					compatible = "via,vt8500-device-clock";
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
 					clocks = <&ref24>;
 					enable-reg = <0x250>;
 					enable-bit = <1>;
- 				};
+				};
 
 				clkuart1: uart1 {
 					#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 5342b7fe4ef8..d8c21097784d 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -168,37 +168,37 @@ clkuart1: uart1 {
 					enable-bit = <25>;
 				};
 
-                                clkuart2: uart2 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <26>;
-                                };
+				clkuart2: uart2 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <26>;
+				};
 
-                                clkuart3: uart3 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <27>;
-                                };
+				clkuart3: uart3 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <27>;
+				};
 
-                                clkuart4: uart4 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <28>;
-                                };
+				clkuart4: uart4 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <28>;
+				};
 
-                                clkuart5: uart5 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <29>;
-                                };
+				clkuart5: uart5 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <29>;
+				};
 
 				clkpwm: pwm {
 					#clock-cells = <0>;
@@ -286,37 +286,37 @@ uart1: serial@d82b0000 {
 			status = "disabled";
 		};
 
-                uart2: serial@d8210000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8210000 0x1040>;
-                        interrupts = <47>;
-                        clocks = <&clkuart2>;
+		uart2: serial@d8210000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8210000 0x1040>;
+			interrupts = <47>;
+			clocks = <&clkuart2>;
 			status = "disabled";
-                };
+		};
 
-                uart3: serial@d82c0000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd82c0000 0x1040>;
-                        interrupts = <50>;
-                        clocks = <&clkuart3>;
+		uart3: serial@d82c0000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd82c0000 0x1040>;
+			interrupts = <50>;
+			clocks = <&clkuart3>;
 			status = "disabled";
-                };
+		};
 
-                uart4: serial@d8370000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8370000 0x1040>;
-                        interrupts = <30>;
-                        clocks = <&clkuart4>;
+		uart4: serial@d8370000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8370000 0x1040>;
+			interrupts = <30>;
+			clocks = <&clkuart4>;
 			status = "disabled";
-                };
+		};
 
-                uart5: serial@d8380000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8380000 0x1040>;
-                        interrupts = <43>;
-                        clocks = <&clkuart5>;
+		uart5: serial@d8380000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8380000 0x1040>;
+			interrupts = <43>;
+			clocks = <&clkuart5>;
 			status = "disabled";
-                };
+		};
 
 		rtc@d8100000 {
 			compatible = "via,vt8500-rtc";
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 58109aa05f74..a17ac3515985 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -179,21 +179,21 @@ clkuart1: uart1 {
 					enable-bit = <25>;
 				};
 
-                                clkuart2: uart2 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <26>;
-                                };
+				clkuart2: uart2 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <26>;
+				};
 
-                                clkuart3: uart3 {
-                                        #clock-cells = <0>;
-                                        compatible = "via,vt8500-device-clock";
-                                        clocks = <&ref24>;
-                                        enable-reg = <0x254>;
-                                        enable-bit = <27>;
-                                };
+				clkuart3: uart3 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&ref24>;
+					enable-reg = <0x254>;
+					enable-bit = <27>;
+				};
 
 				clkpwm: pwm {
 					#clock-cells = <0>;
@@ -273,21 +273,21 @@ uart1: serial@d82b0000 {
 			status = "disabled";
 		};
 
-                uart2: serial@d8210000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd8210000 0x1040>;
-                        interrupts = <47>;
-                        clocks = <&clkuart2>;
+		uart2: serial@d8210000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd8210000 0x1040>;
+			interrupts = <47>;
+			clocks = <&clkuart2>;
 			status = "disabled";
-                };
+		};
 
-                uart3: serial@d82c0000 {
-                        compatible = "via,vt8500-uart";
-                        reg = <0xd82c0000 0x1040>;
-                        interrupts = <50>;
-                        clocks = <&clkuart3>;
+		uart3: serial@d82c0000 {
+			compatible = "via,vt8500-uart";
+			reg = <0xd82c0000 0x1040>;
+			interrupts = <50>;
+			clocks = <&clkuart3>;
 			status = "disabled";
-                };
+		};
 
 		rtc@d8100000 {
 			compatible = "via,vt8500-rtc";
@@ -308,7 +308,7 @@ ethernet@d8004000 {
 			compatible = "via,vt8500-rhine";
 			reg = <0xd8004000 0x100>;
 			interrupts = <10>;
-                };
+		};
 
 		l2_cache: cache-controller@d9000000 {
 			compatible = "arm,pl310-cache";
-- 
2.53.0

