Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DBF3E6DCF
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302743; cv=none; b=clWcfFY2m4/RQnYUzZvNnDVJpQ+VgupgeMbSBVmDFoxd5vvkoyQZVcGpKHAOH5RF3HXtskC+GTBW6ycZQhkboTOQZuWij1uDdb59tVmIst6V8BYOJOTkj0P2HADM+hU8fhN8pXfHpugtNxFycaT/Ix7TC6lh5SPBGVO+dMl2F7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302743; c=relaxed/simple;
	bh=UXwLkW8e38Z+Chv4l/vZ5di96wXoEC3wESQhDm8+TCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9F9TSLo3tAAXaUyejEqLzm7OgD3zEIYBVZOSO477ZP5bgGwdTGAmzKnpzR5cjKuAQzTpaeBsd0lIxcS4bwY97SvjkpIsWKUVCZL9gkNJB9SBXFYN1JWRqZ6+0PMz+iROYDAU5yur3gXsL555lqJWnuXq/ybvkUXHZ6CYfv13WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYVPTm3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWfn9q7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYVPTm3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWfn9q7J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU8Kx2610473
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg4
	07QfH54Y=; b=HYVPTm3yC0dwTwy4+A6MYIzQnVEHH8ARfWxqjIpQD/oqdXo/d2w
	mjZR6uVqptgC1oGVs8h8qciqmREaNTysqcbgCM1e6xLLUosiiKmyALXVDYAzS4Kg
	Z/sPOoTdIiswV15nUZFdmaEldRrJpmBDE5ja4980xxjDw//xo2mgsC+ZBR0axcrs
	Ne5siolWOmXFe9ZYLzu/oGNaDEfEBbIs2R72hHOo43fcIfCrXgei6yd/lXDK6gFm
	l5suKfSaAANkb9oVQycBIA0isjqNDvN4VXR+D0lZuLYrLPFxrqyEQvZKtNmThX5R
	T7mGf2Cek6IPqIjcNMvl3MeQMam74MRZJnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ck70n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so488317785a.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302740; x=1789907540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg407QfH54Y=;
        b=BWfn9q7J1VW6rx9VLBh0R00sMkU2AuifAE+lc4p3xkuM8QLyhfjfXUyX5Jsh66ygqS
         YZIkpDAa6BM1FfxLwgV2mHg9flSA9zMMC9O1k8M0d3tiRpNfwHPZE0aNR9L+VWH3WIGe
         hxM48Ss18Ea/+tNfrezzh4d3Bp9cgokAvioT8GEiZST6pRtX1GooMW4qewgZRltXFodz
         HZkG2XDDu+dZPbXr+0X+RApKykfN5yWybKD6e5g0a89bPaTfwX72PLUvXMWRFiiMsHb9
         fguLZJZROYAbDTEIsb9D0smkScBY9SS0OxJLcd/L87zKGZpGne0zZNTFSEpn4mvxuUbf
         9YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302740; x=1789907540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD46mbjj03Qxo3Sd/C9sKCXQfPVG5HQJSg407QfH54Y=;
        b=SYcEVSOO9jWaaWr/zPhg+dcculSXMckMs2xHJU57vf2hpwFT9RGDaEfA2cspoUBrhR
         9e2lX0H5M6WEM0px1KKLRf0+bNZ4T8Y1DZIJKo/nTgB7uIKbjy8HWGVa56iHjU0Nssgr
         K0HtZ4xQR/9gbP8ugJC4MiadOKi6ZEAAIUYji47eNnktvMTE+s50IkMCL4unV/gGLJiw
         jGKQtWHpDTa2kAMAq9t3QBsZSzIeR8gevi6zLEvd1V/aflZmbVjl+SSvGFCEQItqU2ih
         IhxBf/biHXiCe9/Fg9/bkVX7bSTUW7VLZPya5/P3hEjkgsZSy3ABO8u001uQMOZfqWCL
         KXZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAg6BqKWtCAkowmGg80wz8XnB2S8B46H0Ky7w8q+NZcK78LiL8xOYxC3rmwos+KnEmM/LpdSrtaXXQ@vger.kernel.org
X-Gm-Message-State: AFuF++keucox/2CzRlKtqLcO2vx/NlZI6iOuIpUbYfjPTEZ/pDdDrtYj
	hTK21OYkKsy55lJ5CKMszJxIUYy/wlVH32IusGCeAmPb06HeO9CCATRdoJqx4ZVJRgfF0UXAcK1
	UVvHzhcsq2ugdr5xHdaLRxR3lzvBQq5FJ4tRmnb2uf3YRN/fjp1xgGG/PZaGsuBcv
X-Gm-Gg: AYBFou2hm99Sic2qfVm4GrKMBMrzUMrWHW98CasOYp+/QXfzHCj3Rq0mpyCsTUJb03r
	BsN3xLOKSNIhzPS7Ev+sOSgWl8OOp//nhFevx+VmhJEKX3gp3CMFfrOVTiQHmHq0BpD1tIqsi40
	asAL2Fj65SAjZXjTRdWZZktJGcKntgE5r88TCJYhkfx8BOo5KLxRMVms+m+gVS1VCfrTZHXiZTP
	XV55WXkPk9zhTzcmxtldXVCOMrLRRGCo8dJRMIWQUc6Zk67puYnCKGe++CI2MSZkFJ/QUTHr84d
	VM5QyUTAPo7K5kdeawrjLeZG84j/QCR/d8l5z2SZwKPLAe8GJOTpxheIXl5vM9CEzJfzAUm71G8
	siNTmpNlmBsoDLLM=
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr201776485a.10.1789302739674;
        Sun, 13 Sep 2026 05:32:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr201773485a.10.1789302739186;
        Sun, 13 Sep 2026 05:32:19 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm14345092f8f.0.2026.09.13.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Iskren Chernev <me@iskren.info>, Jisheng Zhang <jszhang@kernel.org>,
        Joy Zou <joy.zou@nxp.com>, Christoph Fritz <chf.fritz@googlemail.com>,
        Brian Norris <briannorris@chromium.org>, Lee Jones <lee@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        ChiYuan Huang <cy_huang@richtek.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] regulator: dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:13 +0200
Message-ID: <20260913123212.99817-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10735; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UXwLkW8e38Z+Chv4l/vZ5di96wXoEC3wESQhDm8+TCY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfMgW8CVFgfTDKvWnMCCi9vdnPATpVEb37JQ
 /545925IJ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaXzAAKCRDBN2bmhouD
 13SwD/4+3EQudJq4eptqIZvVno8xNcy+dkry55DBLr6ceqVgQBbpK4Amg6HFY3Mw95tNXDjxGr1
 i8pDflWQngkdM4pij7lnEfvVRjlhmkMBXSKt43l1zYL9S6ImkYsQ+2imxsNky7Ln0PnXPScZwgw
 pHKYklrPKkWxrohn06iHw5cCS1efXmBN0H8Bxbv77m2+EitrACGsctSR6ONgLna0CVCHwMvrJBA
 7w3bbSjAKlchOEdvC+7nuvF5nbWwCuTd3LCcoU9GUKES2OS1V7tSVxXac6LttOG5yHN4uHlf52u
 b8IeNKF255037lWGCibuMizyk7Cc1J4UiTlq6mw3i+7dtHownkWHXF8c8iaWhdjt1Kj23abtb83
 rctp1FGMKbOUIE0DtRqi5yH01H9Cpnyb8LkGQjtw0RHQM0dw88iA8WshzEPZCFg+t2YUtSECsnA
 i9rxsWg3iD13vhiC0cTEJDuFf5C9PDNW3X0nHaMUlvYyvC/uuFVMv0SdZxBetMFwkoG0w/CGpCa
 AeGsaqclYZem3ZktYQ9hPOACryzmt4pOCd79HR4eo6Sf9rIFrW3DH330mhasezNMeFxaxzC2QBH
 1vGzhLK/jVv3NdqOkj3rmATnopwdpZ09ZJM00WguIgGNf07X8s3SZfISsl1y7jeBfCve4L8Xh6I 3c3gcfr+1AxIDUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX5Ir2OSs3TDXI
 l2FD8AijyELHdYau8pwoMfJ8JPoKOevR9M6DlKob7FAMoBu6Tp4hPjGQ2dj95enSeDrO7vMo7RA
 pj3nOPzBThAmp4gNo1tVAeUoIE4t+z24T//Nre4Bj1bmGpsOo+KIHrUSJLNFJOj/9TyCcop4cwY
 Hz/rd3iYpKmHpuEn/eE1hc25Pdkb0SfX64kmvZN7/3YwkvHHvwjPAVVVv1LJctIu41xcxA55mKz
 bY6mzsImwIKOXKuO/+TB9LO3ULz/L6dC60ms2nxWSuKD0Xu7vstNkkTj0nqq3dFFlSfzKu4UKhj
 SXOr86Z4ykr7zi3EZ169pIS99/JYGraCcHjtFUIYv0IcW2jTzBXiYXeGC2HND8VDFTCtd3F9hTl
 MRiDv3CbUCv5pgzgFG/PCQk/L9r6SCIVmeDCSVypsYOKzhIvCEaqnw6c0DAeR+YB21VJ3wcJcQk
 doJNQskTGdJE6z98gQw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa697d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jun6ngf7UhJfMSKaYbMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX+G8M2zRPgsxr
 VmRxzQw0CsAICp3BlcUgN3H6Gg+ZHpSiDk+VKK3R0JkVcFQwmKps305hVcDy22DnrNGJZd7QgQE
 as1qcaqQ0R9/wl3gJ1De2/LHYZMgvTg=
X-Proofpoint-GUID: ihX8SPFbfON1ZZ9iIERHNG8EibrDT3-O
X-Proofpoint-ORIG-GUID: ihX8SPFbfON1ZZ9iIERHNG8EibrDT3-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/maxim,max77826.yaml    |  4 +-
 .../bindings/regulator/maxim,max77838.yaml    |  4 +-
 .../bindings/regulator/mps,mp5416.yaml        | 38 +++++++--------
 .../bindings/regulator/mps,mp886x.yaml        | 14 +++---
 .../bindings/regulator/mps,mpq7920.yaml       | 46 +++++++++----------
 .../bindings/regulator/nxp,pf0900.yaml        |  2 +-
 .../bindings/regulator/onnn,fan53880.yaml     |  4 +-
 .../bindings/regulator/pwm-regulator.yaml     |  2 +-
 .../regulator/richtek,rtmv20-regulator.yaml   |  6 +--
 .../bindings/regulator/silergy,sy8824x.yaml   |  8 ++--
 .../bindings/regulator/silergy,sy8827n.yaml   |  4 +-
 11 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
index 6d6bbfbd26d4..3c02f98a38e9 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -62,6 +62,6 @@ examples:
                     regulator-max-microvolt = <3587500>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
index bed36af5493d..bbfc06fbf547 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77838.yaml
@@ -63,6 +63,6 @@ examples:
                     regulator-max-microvolt = <1800000>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
index f825ee9efd81..4b05e07f5537 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp5416.yaml
@@ -53,26 +53,26 @@ examples:
         #size-cells = <0>;
 
         pmic@69 {
-          compatible = "mps,mp5416";
-          reg = <0x69>;
+            compatible = "mps,mp5416";
+            reg = <0x69>;
 
-          regulators {
+            regulators {
 
-            buck1 {
-             regulator-name = "buck1";
-             regulator-min-microvolt = <600000>;
-             regulator-max-microvolt = <2187500>;
-             regulator-min-microamp = <3800000>;
-             regulator-max-microamp = <6800000>;
-             regulator-boot-on;
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <600000>;
+                    regulator-max-microvolt = <2187500>;
+                    regulator-min-microamp = <3800000>;
+                    regulator-max-microamp = <6800000>;
+                    regulator-boot-on;
+                };
+
+                ldo2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3975000>;
+                };
             };
-
-            ldo2 {
-             regulator-name = "ldo2";
-             regulator-min-microvolt = <800000>;
-             regulator-max-microvolt = <3975000>;
-            };
-         };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
index 374a4f6b1e23..a7a26c4d75b4 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mp886x.yaml
@@ -50,13 +50,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@62 {
-          compatible = "mps,mp8869";
-          regulator-name = "vcpu";
-          regulator-min-microvolt = <800000>;
-          regulator-max-microvolt = <1150000>;
-          enable-gpios = <&porta 1 GPIO_ACTIVE_LOW>;
-          mps,fb-voltage-divider = <80 240>;
-          reg = <0x62>;
+            compatible = "mps,mp8869";
+            regulator-name = "vcpu";
+            regulator-min-microvolt = <800000>;
+            regulator-max-microvolt = <1150000>;
+            enable-gpios = <&porta 1 GPIO_ACTIVE_LOW>;
+            mps,fb-voltage-divider = <80 240>;
+            reg = <0x62>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
index 0d34af98403f..726aaeac054e 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
@@ -88,30 +88,30 @@ examples:
         #size-cells = <0>;
 
         pmic@69 {
-          compatible = "mps,mpq7920";
-          reg = <0x69>;
+            compatible = "mps,mpq7920";
+            reg = <0x69>;
 
-          regulators {
-            mps,switch-freq = /bits/ 8 <1>;
+            regulators {
+                mps,switch-freq = /bits/ 8 <1>;
 
-            buck1 {
-             regulator-name = "buck1";
-             regulator-min-microvolt = <400000>;
-             regulator-max-microvolt = <3587500>;
-             regulator-min-microamp = <460000>;
-             regulator-max-microamp = <7600000>;
-             regulator-boot-on;
-             mps,buck-ovp-disable;
-             mps,buck-phase-delay = /bits/ 8 <2>;
-             mps,buck-softstart = /bits/ 8 <1>;
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <400000>;
+                    regulator-max-microvolt = <3587500>;
+                    regulator-min-microamp = <460000>;
+                    regulator-max-microamp = <7600000>;
+                    regulator-boot-on;
+                    mps,buck-ovp-disable;
+                    mps,buck-phase-delay = /bits/ 8 <2>;
+                    mps,buck-softstart = /bits/ 8 <1>;
+                };
+
+                ldo2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3587500>;
+                };
             };
-
-            ldo2 {
-             regulator-name = "ldo2";
-             regulator-min-microvolt = <650000>;
-             regulator-max-microvolt = <3587500>;
-            };
-         };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml b/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
index 8c8fc2cd4ced..38fe80749c3c 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pf0900.yaml
@@ -160,4 +160,4 @@ examples:
                 };
             };
         };
-     };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml b/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
index b5181719daa1..1618e8f1c4c4 100644
--- a/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
+++ b/Documentation/devicetree/bindings/regulator/onnn,fan53880.yaml
@@ -82,6 +82,6 @@ examples:
                     regulator-max-microvolt = <1200000>;
                 };
             };
-       };
-     };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml b/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
index 80ecf938b749..a7f48d33bad5 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.yaml
@@ -116,7 +116,7 @@ examples:
         regulator-max-microvolt = <1114000>;
         regulator-name = "vdd_logic";
 
-                /* Voltage Duty-Cycle */
+        /* Voltage Duty-Cycle */
         voltage-table = <1114000 0>,
             <1095000 10>,
             <1076000 20>,
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
index fec3d396ca50..1526cd071b61 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtmv20-regulator.yaml
@@ -151,9 +151,9 @@ examples:
         richtek,vsync-polarity-high;
 
         lsw {
-                regulator-name = "rtmv20,lsw";
-                regulator-min-microamp = <0>;
-                regulator-max-microamp = <6000000>;
+          regulator-name = "rtmv20,lsw";
+          regulator-min-microamp = <0>;
+          regulator-max-microamp = <6000000>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
index 82af4d656177..0da920f84f89 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8824x.yaml
@@ -35,10 +35,10 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@60 {
-          compatible = "silergy,sy8824c";
-          regulator-min-microvolt = <800000>;
-          regulator-max-microvolt = <1150000>;
-          reg = <0x60>;
+            compatible = "silergy,sy8824c";
+            regulator-min-microvolt = <800000>;
+            regulator-max-microvolt = <1150000>;
+            reg = <0x60>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
index b222adabc7b4..77da91c28c19 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
@@ -39,8 +39,8 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         regulator@60 {
-          compatible = "silergy,sy8827n";
-          reg = <0x60>;
+            compatible = "silergy,sy8827n";
+            reg = <0x60>;
         };
     };
 
-- 
2.53.0

