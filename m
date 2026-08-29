Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE536606A
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032454; cv=none; b=cpvybSpBsr17JH1Ghkp8iYzqw393rJAtUFqqSmjmSoo3JNTO4Bde5AoATqrqbo7AOLI7K++wivWmzcwLk4eiU45vydBDI2oeBIf3794L0a2IXBVNx8/05JBtfKJN2RHZ35YyHjrwBpDpYtpJmNfeJc1grlEVUHlHYbtvJqOxMGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032454; c=relaxed/simple;
	bh=fy8LKWasxNVrGnihVPdVJryHw+RHQ5CvkTummbKZNSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aS39jThmYL5iDWfynfXcy174sYzZuJMcdmuAsR1lD5ow5+IZKtOC8oZTTfNU0rRZ6QV3X7guCTK2xoDH1Xe+D6beLTsIbcGXxMriTG2pRXJOQGGb5eekzJcw78rNfoPWezyEXsKnaaAxVFAl/f/l6/OT/mTGcUIGcTBIw1HUxuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqPI5UCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GymV3iOy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqPI5UCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GymV3iOy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx0Am3454745
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97
	Kuf8Cs+c=; b=RqPI5UCXhFjdssavjYnF771wLEgNVwFfE1Y7nU26xEzDhIxuxZ5
	MlcTT1jHK+ahtRsKKIMCj1K/QYvZ8UYt2WIWFzYTSq8GsQOIueEZ4sGZcFzmvrqq
	j0d0YGtMWDzORcZQJQrCICFJ23MpGXgSn173KwznBPlFktjhihATnYNw5ssJaEbP
	U/qWe+5Lf8eR7y/yBNj60kWlxht9kyAiJ2BnDoToa9ZTZkdxoVi4J8nSGw41X+cd
	IJ5Dnfsk3acHyo9OOT/Z5GCNDrutgPY+v1k5PoMQIIriUW2xpF0Ro0/AjNO4Nj7e
	dFbeziD/cyIPVjwfk30gOXMKGECWbQEi0XQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsn9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ef04756caso29773051cf.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032451; x=1788637251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97Kuf8Cs+c=;
        b=GymV3iOyEDkXofgWJSyX+1fPrga354Qpeq9epDTwFqVxpw73YRArqVSyc90AHj3v9w
         cWDpieBhm2ItVuwh7CxxHEsXsuruZ0UgO3KHMsVJ5Fp3oZsIgtIwnnGk/AyWdg6vxIp+
         U2w7zX97+Xdixn8QW8wNQkLc08DQo+ZoKZXrW/Dwbm0gMRgH0B4JfixdEeJ3XIrQcOzW
         JDSGg/TnEEZuaCKi1CsQVU1qisqH+cb7BnGdDTDj+TuQZF47U0nloGDrREsIMgHAXMbg
         hGN4W5U735NbtSifo7ccHcSK0QfQEyr1VdN8cb8jI2bDg34Tm1DtA6sVeaMDFdXXZhvl
         Dm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032451; x=1788637251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjOTe6JuNXYN/ri0/mPFUtDvq6uSSkk7P97Kuf8Cs+c=;
        b=qa/ygEWfAGZJBYrdv/QIgoqb6ta9D1d8HgXHwg2FuD+5P51IPecsGNNoxAbyqBHljB
         1FFJu/V9NGRFKfTNBSS2QW2jVrbXYeZXarT4Bdh50fdQBicp9lhUW0rY2LnqxwKDXr6q
         6Yzd/T0Ugz8/PQlV+5XtuzPZAXy03+Frn0KYWX1jQQiXPXX6Y3FRaB7hzL4kvtmk0B/E
         T7dougopWlrSbhLyrXt8qaExDDPsbd4LniSAlm9ouyLDZGtwLfwFomn/WbyLxf3qo389
         JhbtrEJu3TZvg7zC5sDxlIJhe3y11/ryFeX5CfBs9LTW79HNgjqO8zlpPIWrmM4fAYyf
         hYyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr67AmWZeaKVUl2yjAQpADrYb9nuMMMQY9kL8FT795J7fqSWFUNyMabrXjiOvlkIJlcNJxEULd88z+p@vger.kernel.org
X-Gm-Message-State: AFuF++lIyw5KeXKLyXdBgbkn0B0OvARePYiLakQWjfip5vKgA4DxNP49
	C5GUYyxajJjA+TBdMbx3yRG2U4pMdobab+Ypi6GIFnABR/9nHbHXCEmlUO+uxGhrcK6pLgik9nT
	9wer0TM0QJqY+yz0R0mquWC3irMDQnJglIwCyPMPWseOTiOZo98cRvzUI1RebADsE
X-Gm-Gg: AR+sD11SHnNjKGabE6h65qav5DOoukulheeq9AhBE1YDpHNuuGW55WdN1AHVVBz/ExY
	XjqI6TnYFHoCHsSPHCkIcXdCeJ1Qv0UTsgOzlQE51KeUN/cJWEx5VVb2rvN9oX9WDAu9R/Zq7Cv
	5wtHbmtMGH/pOTvPHnMCEUgLY7UynBahOLJHggUYIYmAg8IzZF/OoDRFi1Ob9eg+KP2OTVV9zJe
	ZEhxGVhCHmtgdOeAQ+AgNl075ylc+Z8q7P51OGZssgHVOlVNLp4jZkUdxxEHAVE7EVglmei/aJp
	wCwtiqNt8OG1dVe0vopxwanZVu9PfAd61x+z8WGeGeUhte2xU6RH3oCfdoHxtRjGaSfrQIsEUGh
	6/a/NOHvE338WSFs=
X-Received: by 2002:ac8:5e0b:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52fb9419bd8mr185946691cf.18.1788032450918;
        Sat, 29 Aug 2026 12:40:50 -0700 (PDT)
X-Received: by 2002:ac8:5e0b:0:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52fb9419bd8mr185946301cf.18.1788032450439;
        Sat, 29 Aug 2026 12:40:50 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2e9d9fcsm5882095e9.1.2026.08.29.12.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: marvell: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:44 +0200
Message-ID: <20260829194043.107875-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8684; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fy8LKWasxNVrGnihVPdVJryHw+RHQ5CvkTummbKZNSg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzW74p5DobpZjFQF2z/egxVys5hC+VtxjRaBc
 wNRZDVxt4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1uwAKCRDBN2bmhouD
 17EmD/49fBVFyYf4yVHgQd79IJsFoFHaxlAvoOMgn+TZ3z6GDGia0TAbyBsqzx4a9lFk+W25iFi
 nugLx4UjiBiJM89lEoHMSghpGVM6ohJ9Z4zoHmVqtmeaqW+XtTYbYODKE1gyvFNQTePDjThfBQK
 UNvmUB5rX6Z70VueHdoGYPzf0q9ja0SpXrVr35cqfOiKlJRrPI/k7bDaxRcxuCfnHiUyqN4vraq
 ob+hK6SLXTbY4ItjiqP2lXsNdo8wmZ27b0YD4wRupaqeoZt/xhownoAfTMSQN0drToLPGxxnda7
 SuqAmaBowmQC37e+oIQymhDMk2QqDqBLMehTYmL4AmSSeI7VQtYRhzGcmhHBD2YTn+osQPeWp/i
 TaSGA7YrNjjoeLcq3nwhUqkdYv1L3m+A0SPasHms/KjTd7OUR1sIWHe2pJwaQn6Ro586Ym4/R/+
 spW8wD6/TnAr5vxDLELIC04pjy5Ba8MdloVC3SuKsbWqi3Dlikc0icQFcTvPRw8TOswEjMK+Pmh
 wwyKxJBF2KTQmuAAuLVMqH7AX1gTUYnuvzVxToknzVOv5uXOkvCbD5mskCsqGjlfMxTVpCxEfk/
 SqzvqO34c5r+ZBlHQ/eyhE5rKBYzXWmFu5wU3sNuD4fvbPqgheXcQN397gTanEw/r0fIRIA+bxP itgquDoC3qs+X9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX4ZDFUm3D8Ryg
 0kk72s2k4abCuGoRTc16fygbmBKXQ1P19YGcD0u3wX6NpwGl/9nZs990Aj/H5FLJ2SfYtkfmmag
 9OEdEBG2UbJWGJQW6dYEuG79uDKblm+sH0GIvyOtDTGl6v2Yr/Sv+lPNj+uGBrSRLP0BZeBbob1
 KbsPdNCe3cQRbADtKvAo9msUhGxuLKq6JQ9q95M0F3hi78t0JBMucAJClH5fEw4ZQbL6//4Tpye
 X7CdnenRv+q+rWIr5OgeeOk2GYkxZ+hl3BSw7qMA9WLr2GijyY7n4x7Jo1nI+9r63G/p0pC6m1J
 JFtR91AmL1vCABfd/I7zx4rkr7fzADmB4kXUEasaovM7SQcgWEK0F68mZKyyIT046HD99JAyvR3
 2OZT+A8V55CKkMZVE6O8TdXnN41mBmrQ1ev5uxSVM0pMpvv7gvARDMvlsmn72+TQcP66yg+hHae
 lUjx5pDUzE8HRf5ZTBw==
X-Proofpoint-ORIG-GUID: c-aGvkggIG9C_4qDUCZ7xRhbKaNv9fIr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX73jV7ZbehXqd
 dRMazbUeOYLes/lloNjqMTY8QHFHvcwHtDm80AYKyHLLiq7zPm6JtsXeCtXOj2+rIZ2aqUaVzj5
 NqH66SiCTcUld4QVo3l6eFBSw1TaKok=
X-Proofpoint-GUID: c-aGvkggIG9C_4qDUCZ7xRhbKaNv9fIr
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9335c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-NLHY6uWZgi1nc0qGTcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/marvell/dove.dtsi           | 22 +++++++++----------
 arch/arm/boot/dts/marvell/kirkwood-6282.dtsi  | 15 ++++++-------
 .../marvell/kirkwood-guruplug-server-plus.dts |  4 ++--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi  |  4 ++--
 .../boot/dts/marvell/kirkwood-synology.dtsi   | 12 +++++-----
 .../dts/marvell/orion5x-rd88f5182-nas.dts     |  2 +-
 6 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/dove.dtsi b/arch/arm/boot/dts/marvell/dove.dtsi
index 062c86361640..75e2f9baf661 100644
--- a/arch/arm/boot/dts/marvell/dove.dtsi
+++ b/arch/arm/boot/dts/marvell/dove.dtsi
@@ -100,12 +100,12 @@ pcie: pcie {
 			msi-parent = <&intc>;
 			bus-range = <0x00 0xff>;
 
-			ranges = <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x2000
-			          0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000
-				  0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0   /* Port 0.0 Mem */
-				  0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0   /* Port 0.0 I/O */
-				  0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0   /* Port 1.0 Mem */
-				  0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
+			ranges = <0x82000000 0x0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x2000>,
+				 <0x82000000 0x0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x2000>,
+				 <0x82000000 0x1 0x0 MBUS_ID(0x04, 0xe8) 0 1 0>,   /* Port 0.0 Mem */
+				 <0x81000000 0x1 0x0 MBUS_ID(0x04, 0xe0) 0 1 0>,   /* Port 0.0 I/O */
+				 <0x82000000 0x2 0x0 MBUS_ID(0x08, 0xe8) 0 1 0>,   /* Port 1.0 Mem */
+				 <0x81000000 0x2 0x0 MBUS_ID(0x08, 0xe0) 0 1 0>; /* Port 1.0 I/O */
 
 			pcie0: pcie@1 {
 				device_type = "pci";
@@ -117,8 +117,8 @@ pcie0: pcie@1 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-				          0x81000000 0 0 0x81000000 0x1 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0>,
+					 <0x81000000 0 0 0x81000000 0x1 0 1 0>;
 				bus-range = <0x00 0xff>;
 
 				#interrupt-cells = <1>;
@@ -146,8 +146,8 @@ pcie1: pcie@2 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-				          0x81000000 0 0 0x81000000 0x2 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0>,
+					 <0x81000000 0 0 0x81000000 0x2 0 1 0>;
 				bus-range = <0x00 0xff>;
 
 				#interrupt-cells = <1>;
@@ -772,7 +772,7 @@ rtc: real-time-clock@8500 {
 
 			gconf: global-config@e802c {
 				compatible = "marvell,dove-global-config",
-				             "syscon";
+					     "syscon";
 				reg = <0xe802c 0x14>;
 			};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi b/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
index e33723160ce7..9f63e3f9eb1c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-6282.dtsi
@@ -11,14 +11,13 @@ pciec: pcie@82000000 {
 
 			bus-range = <0x00 0xff>;
 
-			ranges =
-			       <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
-			        0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
-				0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
-				0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 MEM */
-				0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO  */
-				0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 MEM */
-				0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 IO  */>;
+			ranges = <0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000>,
+				 <0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000>,
+				 <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000>,
+				 <0x82000000 0x1 0     MBUS_ID(0x04, 0xe8) 0       1 0 /* Port 0.0 MEM */>,
+				 <0x81000000 0x1 0     MBUS_ID(0x04, 0xe0) 0       1 0 /* Port 0.0 IO  */>,
+				 <0x82000000 0x2 0     MBUS_ID(0x04, 0xd8) 0       1 0 /* Port 1.0 MEM */>,
+				 <0x81000000 0x2 0     MBUS_ID(0x04, 0xd0) 0       1 0 /* Port 1.0 IO  */>;
 
 			pcie0: pcie@1,0 {
 				device_type = "pci";
diff --git a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
index d5aa8b505cc0..cc88d5324983 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
@@ -104,14 +104,14 @@ &mdio {
 	ethphy0: ethernet-phy@0 {
 		/* Marvell 88E1121R */
 		compatible = "ethernet-phy-id0141.0cb0",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 	};
 
 	ethphy1: ethernet-phy@1 {
 		/* Marvell 88E1121R */
 		compatible = "ethernet-phy-id0141.0cb0",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
index 5e0b139dd4fb..4206529b4a52 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
@@ -168,8 +168,8 @@ gpio_fan {
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fan_low &pmx_fan_high &pmx_fan_lock>;
 		pinctrl-names = "default";
-		gpios = <&gpio0 19 GPIO_ACTIVE_LOW
-		         &gpio0 18 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 19 GPIO_ACTIVE_LOW>,
+			<&gpio0 18 GPIO_ACTIVE_LOW>;
 		gpio-fan,speed-map =
 				<0    3>,
 				<1500 2>,
diff --git a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
index 6b7c5218b1fb..de34bc2446ed 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
@@ -281,7 +281,7 @@ gpio-fan-150-32-35 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH
 			 &gpio1 1 GPIO_ACTIVE_HIGH
@@ -301,7 +301,7 @@ gpio-fan-150-15-18 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_18>;
+			     &pmx_fanalarm_18>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -322,7 +322,7 @@ gpio-fan-100-32-35 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_32 &pmx_fanctrl_33 &pmx_fanctrl_34
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH
 			 &gpio1 1 GPIO_ACTIVE_HIGH
@@ -343,7 +343,7 @@ gpio-fan-100-15-18 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_18>;
+			     &pmx_fanalarm_18>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -364,7 +364,7 @@ gpio-fan-100-15-35-1 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_35>;
+			     &pmx_fanalarm_35>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
@@ -385,7 +385,7 @@ gpio-fan-100-15-35-3 {
 		status = "disabled";
 		compatible = "gpio-fan";
 		pinctrl-0 = <&pmx_fanctrl_15 &pmx_fanctrl_16 &pmx_fanctrl_17
-		             &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
+			     &pmx_fanalarm_35 &pmx_fanalarm_44 &pmx_fanalarm_45>;
 		pinctrl-names = "default";
 		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH
 			 &gpio0 16 GPIO_ACTIVE_HIGH
diff --git a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
index 75ab913b21e5..1d803d1d1112 100644
--- a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
@@ -22,7 +22,7 @@ chosen {
 
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000>,
-		         <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
+			 <MBUS_ID(0x09, 0x00) 0 0xf2200000 0x800>,
 			 <MBUS_ID(0x01, 0x0f) 0 0xf4000000 0x80000>,
 			 <MBUS_ID(0x01, 0x1d) 0 0xfc000000 0x1000000>;
 	};
-- 
2.53.0

