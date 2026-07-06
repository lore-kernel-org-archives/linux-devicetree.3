Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926B430307
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330521; cv=none; b=G0Hgc4m/4daGyMwJ7FBiqmrp1JciHm6xo/tf7YD2sqEDQQROLBFQNpaEjQefjSVFqDTt6suj0pz5OBtFoMjTPwtZHyAR7f2ABwOPPgEAYlVgF0+l7PljpzqkJiQ7GOrLhAjHzzjmnZ5y4+E9mmy31KofwsmWRwtMAfdtwf4HgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330521; c=relaxed/simple;
	bh=68yixvkGqxm+DcPwltEo2KU4Gf2PeCpLBOvJ/E4rAKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/kXWOFCsybcBKzY8Z+Uyc61B+z2LvPfLB3V7is+W3Gwbv4hh+ScNk3SyQYFsoFL7H2doJ+cPxE8EResAyU6Cwsq+gCMphVTdwEdS5crEcLbJYLg2edQuIxZryTMDOx4TOnBN4LBNnR43aFdW7J2ojUYPN61Jm45dqU579swAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3zin6vj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1WribY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3zin6vj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1WribY0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xIp4151646
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1
	R4x7Glus=; b=E3zin6vjI/qF1wrEgjKYtk5Xcpdl9QR3qkGdXi/m75QgOHaK8WL
	uyRytPtZM8tW3ee/GRXbFFgEsliFNODctKVxWaYIrOKOMjYKo1Vc/c7LRSJ33y3C
	+RcsplFJluO4DQWeVtJEDCmwUWJo+nZlDrvTGGO/zbqeDuEZNkvzlVVIFWmSueoN
	VBLfnnQyvesTmronBkFm39yBrmzRWVB5Dgt1m0D9vrb2Qa8gOcWEmexD8YDGFPIZ
	HTVf/aCzechXGOTlixQ8KwFT552d4E8UxUcjstBTtiDheKBC425EUhRhekBFSzaa
	ewpquNfpHR4PT75T2o2a5OGUUoOUkKzoIkA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8cd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:35:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso35269766d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330513; x=1783935313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=E1WribY0z/NO5GN2A8yknpMRUxFabPGNqXRJfTI3kLrmsQ7yvirFvCNtKHH/3N1kjf
         2BtjBpfvNjQSPRP0lRUgT7ZtBIfKCwKgBky1eBnncxufpD3IkcXwU9wMqqo7Iqff5VWD
         toZHuQTlAdExg2bfG+7GCM1Lh/PnLtrgh1vIG2dkk+lg91w3V4W1paRd0A6+XzFdKLat
         Cb6UIxo706voKCj0O9/Mfjco+YFWyI81C2oX8p07z7TRJ6rOtw3TDdiK5Bg0rGlkfarD
         pDGt4w2/VD09T7Kak4QvZg/pMcTor1kEOm+MTpLlUQ9bXnMl4SxI2ZXdcpbRJWH3+e+9
         +bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330513; x=1783935313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+K/vFavTTgVURrz24yh3mhOKcc5piZfDi1R4x7Glus=;
        b=hlUsJXUO8tvce7nuGSHBAdRAR9uq1iCNnTM/g579BWMTaDwtL+FPZkdO7jxu833E51
         hxPOZLNHuH+ZnSNjM+IWi1xduVBLLfir5bS+q1v7v3nqgkM+/8jjEJKrcJrbAmZgxK+i
         pguN0Lo615haILfXykagPBJdB1a7kQqDk4VH2pZfDmN0dbAqGmPARWvTh+VDN27wLHOG
         J1YYAz7e3bk27UyEKs4MVccc0exjyHVUS/yMeLMdMFLdlE8uYQSx5TqXQND2UpsfDtvD
         5QqbhSInWbvbJh5VjMabe45O6qm8WuyUnRTOF56T8lpbaFHg9IZZElIyOM9qPC7yAyNm
         BHxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzoa+OW8M0mGcONxmaDbCnvu+5WaPUc4zBRFPTjjXY1RUhVLdx83pLfcTQVS3Po52BDTU/tVuuMTkW@vger.kernel.org
X-Gm-Message-State: AOJu0YwOsFi/u72RTL7IRSaAa9g5WLAMjeeS0fuPjmnx5iMSqYgBBDlZ
	3IbRb1Q43hnL9fSxybauCT//N+xs3q62M9ygmx/IgId3oCItQRgaPyZ+OxfTV0IykFzIwItDqA7
	vJaZZnKToXXt8iv3T6PfOnJUJBZzbIvjZNinqJvmGF/uO+FCak/52rhXXycfowqe2
X-Gm-Gg: AfdE7cmsaV+JJepzZ6BNf5gbwQ68KeTqAQdbumDavFVIuv/kDST5rXI+BQ/TndwFFHh
	El/vhYRqZC4N7lbz87oO6cy2/QZLFQ4fqQQVpREmL1+O197YY4KW9Wk8UePU2NrigbdciolLAOw
	X0/T/mfllVaN/OpIMEFSFCPG94EW5+rN1emRR7neRchJ/gVtBidwJ3KT7YMrXWzMzYt7gO++aDs
	u00E88YKxk5Q3xeh10Lnnd92dxF2QBvNsyfb0Tp0n1EWTwbWoSm/LGPFYTcyeRogZ7CEXWKILlh
	QTJ7fNdSbpYZMNGTK+TKTV9J0Okkyhfr6CbA+/4TcYWWDEYQ06GxfBBuAN53UyEj7Bc4gptuHvZ
	wzYBNF8brKIJHMRzQNiJteC5vr7k=
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416533785a.38.1783330513416;
        Mon, 06 Jul 2026 02:35:13 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:914:7e9a:2716 with SMTP id af79cd13be357-92e9a4a39damr1416529785a.38.1783330512961;
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm643831465e9.7.2026.07.06.02.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
Date: Mon,  6 Jul 2026 11:35:09 +0200
Message-ID: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=68yixvkGqxm+DcPwltEo2KU4Gf2PeCpLBOvJ/E4rAKc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bMNz+1+uTeX1yXmY4k6X6lVztcBi4LMoWE9
 W+lhtRViBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2zAAKCRDBN2bmhouD
 14WnD/0bf8oMP6p237PTTdeoToQZaShE30T9JA47Q+inYKAop4cuLzZjG+hHf4YzX8ChmgFrTzt
 g55iuaDFA1s+FeOZyjDJsHol8bjBUek+Myxdn+bWHlmLszr+0JksGN0Bg1EXgrR0qhNQq2kejBP
 jHiKvDF62sUDrfHDrpBHPqWzutswYzIgOK0OngJWZFvegW2B/SuF3z4l22GBYLC/bkxC9jiDwII
 D8M6pbLzBiwB9Uh2AF0b7Qg1o/bJtyUMgOTgaE6FoxFnQcyDg5hX5PvJsb6yZ0OCr1S69ei1qYx
 bDeTAc9tuo/bavKbIXf+3XRiPIxGOy0LH3oBVmd0IWPbACb78ldVwykmwnbPyoqd1q9ieSbB27v
 wKGPOfJ6En0C1h9D8z/dXow6iywPUFr3+DheCAgMnzgo6a/V0tlTxm/nGto0tRXdvcGNtPoD7Ts
 YWGcql1wGMJWOT/HHV/ZyAZ7TqDiQoGyCK5dJvFdL965QvMyfhQAB+UrK+oMexTLvioECNW2Xd1
 DBfm+8lKGJA9Fh3sYik9J3PjWNDK26zTkLgK0Kbit00xyaoncoizTuuf7N0+bvy96Kl4BP9NWtM
 ToX1h+s7os++R+LdeCO0TtXVECEbMrjjdK5JXtncSnq0K/rrzrzJ7DVeDZxj3Z2mPRwsAR9l7Kj 5cIh31U+QdaEOiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oK2BRcAqc2Q_XWtdwpVx25EtWh36rIbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX7SmYTwkF70dJ
 JKtwBpxU7bpCxRxwSvvRJHn/+wUwF2TpPcg1R7QpEDBkJXPT3YkRjR1AN6Zot4Y+iRI/lH7TCY4
 Ba3NQNYZcLYSq9p6oTs4JGOwTOrpLR/PxhZu0TSf6CulS1micYG6/ekm75inkhdzpo7PeK8IF0B
 78rRB2qEumReW4mKV4nESrJP/3G1FCNuEH5+AOg/QI49J2khC7M9NsrS3G2Hfghx/PqoX/EBtBQ
 VFPh3NdpM4CR5/lPg1j+VD2xI4uTLx6rqdLM1nY9T2o5LxPLpiX/xVXem6FaD/EjaQ5efOUzL8P
 s3t43mb5+kRcXnjj2lyfQgAJcG6VuHvHxAx/HeLS4fnbjvYRo3ce48JXCwpTrFKbbBynZZXt3hV
 0jJN0s4Rl0CDA6lxqLsTfeLEEAb3YdjWsgmhCS4FELl+Lw/acSehIenuVuoaAlw57M92bAN5JYs
 V4NsVj7BxR4rS+NNK6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXzfomSeDCFdlz
 w2QVjIwALxjdumRnXxA7sGLK6qj8XvjOXRCYlEwbvQurvJKQ/xjsdvbTOteeOQGY2F8fptJdE8y
 4xfoy6zIGhLZLONg293EMWeroYbF7ZQ=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b76d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VfHiFvvmM37wtYbmGesA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: oK2BRcAqc2Q_XWtdwpVx25EtWh36rIbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines and
remove other whitespace violations.  No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 32 +++++++++----------
 .../dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
index f15baa708b36..8254e51d5e27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
@@ -88,25 +88,25 @@ opp-1800000000 {
 			opp-microvolt = <831000>;
 		};
 
-                opp-1908000000 {
-                        opp-hz = /bits/ 64 <1908000000>;
-                        opp-microvolt = <861000>;
-                };
+		opp-1908000000 {
+			opp-hz = /bits/ 64 <1908000000>;
+			opp-microvolt = <861000>;
+		};
 
-                opp-2016000000 {
-                        opp-hz = /bits/ 64 <2016000000>;
-                        opp-microvolt = <911000>;
-                };
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <911000>;
+		};
 
-                opp-2108000000 {
-                        opp-hz = /bits/ 64 <2108000000>;
-                        opp-microvolt = <951000>;
-                };
+		opp-2108000000 {
+			opp-hz = /bits/ 64 <2108000000>;
+			opp-microvolt = <951000>;
+		};
 
-                opp-2208000000 {
-                        opp-hz = /bits/ 64 <2208000000>;
-                        opp-microvolt = <1011000>;
-                };
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-microvolt = <1011000>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index c490dbbf063b..5913e59ff294 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -64,7 +64,7 @@ &internal_phy {
 };
 
 &ir {
-        linux,rc-map-name = "rc-khamsin";
+	linux,rc-map-name = "rc-khamsin";
 };
 
 /* This is connected to the Bluetooth module: */
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index e202d84f0672..d5e0f72892f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -642,7 +642,7 @@ mux {
 				function = "eth_led";
 			};
 		};
-		
+
 		pwm_a_pins: pwm_a {
 			mux {
 				groups = "pwm_a";
-- 
2.53.0

