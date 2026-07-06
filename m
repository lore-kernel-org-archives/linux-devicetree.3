Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A72E7361
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333131; cv=none; b=TU9XKaTlYv1tZS42eV+uWd2NZI26hwVe0hSB8FWiGV+keMEt8uXLazF9Gvhp+ZNd8XtGlrBdRr9/FSs6y+tULSBsWKItcC5DcT9no9tHH2XBwrSyntAgqT5cE96vlttAJW4CUSIoOq53B0fGE/4kap+aQuvlWz6kpDRpp0cqr/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333131; c=relaxed/simple;
	bh=zuAK/xOUfkdtwmrr2SODXpPYm7bcGSHDFYs+7j7CtFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0nKzlz849H4RlZkhfdz+v1H2C9TOGdjwf7aVgbOVTzyeOjPmhZIgWWo+UF3H7jI2/oXtsjuMas4FFkHYxlBtZ8F6kKzcIObGDVpUoawPEjg6tSpNU/PhugYUbzSoxIqZVZIwZ5RwEYR7UwKJodwydux+WwI+2qUyq5F5x60nQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1HIVtM2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOBANNMj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1HIVtM2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOBANNMj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666A3JtS121232
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2
	uOsjtBXo=; b=f1HIVtM244Pr6HM7TfEqk24DmmYcryykdJc4wXFn+LmVf+3O86V
	IC36YzS1AS4b6I/MQ2rS6xElR4HrMFzp7IJgwgjdQbohIg3Hp4qmRv36xMB7m/wa
	ESi979mEWjFh7dMeJwLhps9Ry71BFA5vHJhAyrvfU6FqnvpUG23wpEs9QfRA3m8B
	qc3KaP4ivIwJgv5NA41w5DxyjIqkUADSe7kOwUIHIA6BkaCEfd5MP8Zk0XRjUbw9
	z+TxVaEOZFSHY78elccBPHICeYVwEjKBJK7dYCEdwzQwVWBaq63wkhGHlv/hVU3d
	KCtFc3QxMY3OtttT7QAYFQCs45nViVTC8JQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g20r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:18:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so36793031cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333128; x=1783937928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2uOsjtBXo=;
        b=TOBANNMjt1ujUh/f4pusnvVj8NNakZTrJSjwBigetEgkZcOAFdyFVll8J2tIKgzC5R
         JhT/Bn9nCoPMYddE9kLo6tSQJAgeHFiwnkS4dUB0PHV2rM6rxbcYcNjKlAvAR7bX5x2e
         /yW6Tl03p/S6SIGr885LKUFkChf9G6STZ2gnofkJOxg0SofSdlb+QmTM4ghXAA5aFZt4
         cyEjNNMkvkZdRt0iZz+gJHHChskDDK5aRfxegVc/m1jGp2N+ZkpiLVxUmuPfePKND720
         2iub3Pc0MVahW0sUfJGaLL32Kufhqq7I1CwlOJMfeYG6T8V5Te5qBRCCOIIQIGDadgw2
         +eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333128; x=1783937928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2uOsjtBXo=;
        b=WCG7N/M2dkB+QZeZ9ZzIF0zr1oMnDFRIDme8CmMcmX5sGmfZjS/p0QHK+oyJn8ngwE
         8VQMy72l6MSeBeeFttgHqc0HcPcOdnkv/y+idhrDBVgNay8LkA/RUQ6seDHf0ieGwo4+
         jUQVEGf0KQWjQI9FSBWCNTJ+5tuFzMUxMN6xtO+b6ygEwmDkPPPz6jyQym7r+MgOYgDX
         jQNdRgh96H8ZxmhU+DS5WQMTeQyrS54Jk+bMf4Zy6OLvxCXT8bKwg3agbWohMCsU9c1o
         AMxXBIojWN+3a/7PMDBy8e8NHanf+bHr2gj03Xm5rhjC7PcavxXnDhbrRx3rdz5LGD8Z
         KhTw==
X-Forwarded-Encrypted: i=1; AHgh+RoD7cf7QYhy8/Juliv5Dk7mTjqgdNH3Lc1PAjSSaNsfYLYzBhPB3NFGRu9wM85jW0+jcbAsCkitpcum@vger.kernel.org
X-Gm-Message-State: AOJu0Yxne0Our5EaUUdhi6y9n0chOzEAA967xnIgz1eYkOX8Qw9LiN9n
	x1EjD0kaPddlpoa72/a32xKHnfhPUbx1Ff5ZfvMxWNuzA/rSIbMZ0p+taygMVcsz9QcFEmDVStX
	JX+ACI6ocSKw0Dw+255FktVzj7ykVJhrEalTvhe1r7nq4CxzcZl8UA72N8zruWW+s
X-Gm-Gg: AfdE7ck0twFOXi7YRnyRN03i3ReYk8OVmEe8OmBWo8YPXBHPnxPfuTDKTEE2oKWWEaG
	hFIfoJ/2qzBgK9h+JqEVV34SvXcJWv0S5VEmZY3Q9N9ci1YwbF1+1gsLtcqkzYP0PPNejHfO6Do
	Iv8rrAkODqChAizZI846wGKu6msPWPqHdGVo1SyMWIjLeES8EAQsERNfet8nGefVotgIWgoHrp0
	ymKLnCp+9hsOxyOTOWC6qjD/ep5F6eMbp/bKLIm44rg+8WCxZpbSPoR6cmE0l0vfp05BncDPPXJ
	q1iwBn7Qs0iLp6jd8AUHt5h3DcQJy4lwow1Cxqt/8HyHSdNp0w6uuV7plaPoR+r7lhvqeiJk08w
	ZPPzqgYD6bFmYyxTRH1US86DEkVA=
X-Received: by 2002:a05:620a:4112:b0:92e:8c50:24dd with SMTP id af79cd13be357-92e9a4d35cfmr1252305685a.55.1783333128408;
        Mon, 06 Jul 2026 03:18:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4112:b0:92e:8c50:24dd with SMTP id af79cd13be357-92e9a4d35cfmr1252302385a.55.1783333127960;
        Mon, 06 Jul 2026 03:18:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm23318427f8f.8.2026.07.06.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: microchip: at91: Correct indentation
Date: Mon,  6 Jul 2026 12:18:44 +0200
Message-ID: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zuAK/xOUfkdtwmrr2SODXpPYm7bcGSHDFYs+7j7CtFw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EDSW22jduMDRp+zKzvnjf1SF/x4mOlnl5ho
 ZZNtBU2sYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBAwAKCRDBN2bmhouD
 14/0D/9a7P8v9h8m5CNjU6pHjUOvyFkjAJkkrlFFyxsa/Dg/Mm2PGjItaYNCmCZ8X1i1By1g/PD
 chXz5zsHlWxjO6oFUlstuwnGqTUlPEqOPUHEQiSxeAgK8n5V+/Tl/63xAsKr08Mpct7/hw7/uZn
 /fOS9ndMD1KWu+ep3IYFcKByfKQYaDRDu2I4P8y8GhaoH3Kh5pupKUqsRNqfL3UdOJ+zaHF9FVV
 bQmlh3TxaPR4FAWUkffSPWayvLQE7C3nOaY3kwIy19Jib7JRegjXd0gGmx8RTKhv6JkWTASQI0u
 U3qQGe5uNIJSBneH6l4OmJ5MnfKLOGHVvpcTVyZ4l4s6mCx3xc72zndj4nOnfMiGuttG1e8Qh20
 +EXH7jI9fvGDz/rhHfBIepiKX/KFbdLSJNnKlMTMbgI8Qb5BoVWQ3nyl21nIS7bD2NjER80Zca1
 ThGgB9UkAAsBhBF70MK0mByl/COV5FCfrHndvu68GZ2ICbbkSDiXeOQUAZIu/ibLV1HePUjnCDI
 hUlPGHbZWL367S4mHHJ6UIyAsLpqGgju21fcnQZCnx1K1eFZ6jYuJGlrhQZBHgmRvYGoxRLimPu
 ZHJyzbvlzqlj3o1SOaNLfuXcRpxK+YmGMVKTPh3fmJeoSX9V8w2nDs1mSLXPF/qsetbSOjzmzs0 SER9mN43Chr9kbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b8109 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX688mj//qMZAy
 ku9onIixwAQRi9BTI56xr5RhhgF1xDIaBhaLB54CSiIUA7dyawLDmI7IjG0OEFMlZDlnFtvR68F
 SzPbTXgb455cqXuIloPqDXj/xGe2RS+HG7EFPEqtjoTvhvlVlKQt+j0w0YJL5WTD69PM2IO25J0
 O4RUOjMXFOrIr93gB6OdlU8aeL1vJ/Ehs+X+N84mExwQwdRZ+n3xVULfEBPKLEFKRsIyelQ7D1L
 jvCoTtUUy3EJKyy6eOfb+PGHxhqhqzsPZsj0hPZZf36GKV69+PElr5fh8nkZKGZUK6rW2KeNQI4
 8XEkQsPxUCZA6FJatErL51DZOLVsuwDqya4IEpZXX2qN7Ff40MVDqldmJYJQFr2RapnpcOn0vsD
 8snxDLQWkj2+Ch0+i7VkZzKEJkax+3p5fuVgSyaVztj8eTuNTAarSeFfQsjqFzw8auMiTSZpmK1
 SDvxJs2ZUN0XGKfZL1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyyQDvWFaxFwp
 F1Fn2aDMmx7d9xa20AZlsOuRraSE0je/E7R2lOk3Jsb7Sz6k9tT/kBp1w4aZiQjxyReOlDHA+Wy
 ET3WnbUJKgOplvI2oLUaZ3EgTEF+ea4=
X-Proofpoint-GUID: e3eI96FQuoFFGeu0VmEORJVhvtWHZlJo
X-Proofpoint-ORIG-GUID: e3eI96FQuoFFGeu0VmEORJVhvtWHZlJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts | 8 ++++----
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
index 45edf6214cf7..25af4ceb67b4 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
@@ -258,10 +258,10 @@ pinctrl_i2c1_default: i2c1_default {
 				};
 
 				pinctrl_i2c1_gpio: i2c1_gpio {
-                                        pinmux = <PIN_PD4__GPIO>,
-                                                 <PIN_PD5__GPIO>;
-                                        bias-disable;
-                                };
+					pinmux = <PIN_PD4__GPIO>,
+						 <PIN_PD5__GPIO>;
+					bias-disable;
+				};
 
 
 				pinctrl_isc_base: isc_base {
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index fbae6a9af6c3..b7ebd8e5f0bb 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -451,10 +451,10 @@ pinctrl_i2c1_default: i2c1_default {
 	};
 
 	pinctrl_i2c1_gpio: i2c1_gpio {
-                pinmux = <PIN_PD19__GPIO>,
-                         <PIN_PD20__GPIO>;
-                bias-disable;
-        };
+		pinmux = <PIN_PD19__GPIO>,
+			 <PIN_PD20__GPIO>;
+		bias-disable;
+	};
 
 	pinctrl_key_gpio_default: key_gpio_default {
 		pinmux = <PIN_PD0__GPIO>;
-- 
2.53.0

