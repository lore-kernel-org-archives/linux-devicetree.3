Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334740A95E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353246; cv=none; b=KMrzBz8LXDpQT1mekxrollyioXHYpILTXBb6993QNrSpBxsS/q+vWZ4/I82nXY7ZtHiQmSPl9MCmxg/FqwRet+uNdVfhTjXogkOADuwIrYaTqvNz7m+kPVS6t/VR12QAO1LIAVURrKnDc3kNZYCeEzps+FuXFjlkNxHtfDPjD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353246; c=relaxed/simple;
	bh=fix5bEUn2gOa0l0hW0CyrjI7eEnu/9Wod8d1NeTfXcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ym296raYfPExL6EBDo5AZHuL/yA0hbsiVncCNZt94V1J3MseOm23R4m97L4HxlwxXhJUpjcXezUWWfegp7XEmxFUa3pfB6WMeZDGdXHQgACD67DtvQEaK/01G2s3jtkgZfW6My3yE2VPNZdrSwEgnjp7l6DxaRXWZS2fffXXq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsEv9znD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i95n2Xtg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsEv9znD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i95n2Xtg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9Qc900738
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJ+rmcTbSomUntFXkP9Fjx3wU1i6GYjm0apGDuTwi6s=; b=VsEv9znD5i6cBVgP
	tqwL7l83zmtByu/tlmr0e+G6jmtpODbaRdiOqVj6w9m6HZaUr5UrfP4c9E5bQmuk
	pN8oJX8JQABqSaLyAX++UbUmgNOgYHK1p/LRTQzx3HSoCu5LVeYdU2pjOpybfEcU
	2OaHyN8wE8yB7zF6AzYg/dLSCOrYHqtRH5HlbrSIlkgMUSsmLS6Owy1qhZtDlpQ2
	lZUMn2LIc/0/K6vJyZdxASxTuA/h+pEJbH25t0lcutDD4uVsbojBLbA47xJj5KFc
	2Lgzt+gkS2vSI3Vo/vfPRpdCQkevc8xZCtR7aMd+TXPvfsoIZobER6dJ1fkEYhIo
	v2XfaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j8cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:54:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so333738485a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353243; x=1783958043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ+rmcTbSomUntFXkP9Fjx3wU1i6GYjm0apGDuTwi6s=;
        b=i95n2XtgqN0wrARAAxRwdGknqdaSXzT9FZ9YJpLCvnHhx1hY2pVlpersV9pDkAOhoL
         +oywuHuFj7dTsJnj8UQKR5neFqCAptRt7rRtm0Av9Y9KI75xwcyMk3L/SEc+LMw/Qu4E
         jrPL/sF/ufvybaQFF3paH68mJ5umPMBIKtwx8CPhIMnS2pcuMx3vOpjnODQBeFSXaOMX
         EwKoRdttai7xUwZennCV/ULHzWWu/Cp0Z0dMnzFqymrTo7O70ZUwQFoFTKNepPSSJOp+
         XTZ6RH/MR1I/cqzuel18bkCoQmvjiYatVF2rK/otPjuu7HxF+JUNBYtyGlVVEksS2+xH
         3jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353243; x=1783958043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJ+rmcTbSomUntFXkP9Fjx3wU1i6GYjm0apGDuTwi6s=;
        b=dusmfv9tQpf0RfgcOO6YH0Yhjd3HJXWx8fiLWYxrHRyF9eubFalzDiwSaBZFKMVmLb
         /XuT3NCai7MZpoye76F2gZy8T1nGu1aqqNup+i6IiA+q4tIq0LSYYzVg60zoKUI2iWgG
         SI6bDO7MdHbii7QuYNOFyHFTGiZ5L7YVJF0EKPwwsv7QhTbgcY9ldBDtbGe1qVXTGmqB
         ty1DNWkR9fc3mxNQBi8OM+y6zEImqQBfTq9vYiHM2Ct43t37tpCj41HT9h8c5zDUO+EQ
         hoawDKgs6xaSDJ+GNRX0wO3l63idnIqkLwWDty5XrU5xX4LPZ6TPJROC6nKyfT5r9/Vg
         ivPg==
X-Gm-Message-State: AOJu0YwmSk10IWHZDX6qIte278rHIGgQTJHM5tWpqT7PuSK15Rg4sxQD
	9nqXZNa6F2ZgCm2lx1G3bYxyMta5bCYzTw47wzFhEsLflglHPRYwWQwY4SaV6aXsYp7e0iiURZ2
	5u/YDKiCWDGopy2berVJf01QVDLBbcb53WQb6v99LnjTil0E9H+x8NPBNSyjja2ja
X-Gm-Gg: AfdE7ckaQHf566hRuTLLnSTcdhi5x/5Qcm3lKar16+6vJznRg/QU5I0Pa0PBM3GAmTg
	oDuAP9k5cmRev4yiU/2vCrEau5ax02Z88dODgxX7QxJDeo4s8BNxziYLMMcIM/5PVW+nsgkSfZP
	p4sSJwxH/K8fUUWTYTgTpoKZ937mloEkaYRk4OhzHlKlAwhlUQcjcJf2lEHYD5ZRkf8ZTOLE4jI
	3YYZYo+R9rBpIcmb+8GdeHrJxbjinPHAVXXHHZpLe2fHp0mtihEf2G4G3PDdrAAB9WHjGF2IvaL
	3Zmwzm/geFiDbk3SN7r2g55w2ti1gwOKikrNAlD61Chdqb5q0WwjtoOZzpDAIaNS6wY9jN/UfJg
	z/N86FWIMsWufBDpuIc8gj1Dl0hfE103vXpE=
X-Received: by 2002:a05:620a:3711:b0:92e:81b7:72df with SMTP id af79cd13be357-92ebb5d6714mr146500685a.70.1783353242568;
        Mon, 06 Jul 2026 08:54:02 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:92e:81b7:72df with SMTP id af79cd13be357-92ebb5d6714mr146495985a.70.1783353241990;
        Mon, 06 Jul 2026 08:54:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:54:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:44 +0200
Subject: [PATCH v3 5/6] dtc: dt-check-style: Do not sort top-level nodes in
 DTS by unit address
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-5-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fix5bEUn2gOa0l0hW0CyrjI7eEnu/9Wod8d1NeTfXcA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+KblSQ9buAGzSpP/sTP7WGTQ/Iu+O9l5bVx
 gXJI3YFTwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPigAKCRDBN2bmhouD
 13LAEACTCYHosO+3Mv9rPMxPlmoAujT+k4XVBAyrn5NAiGueh81kXgK8jBER9XPoNggtVqU9dZn
 /NJkKcLt94n/CdyGWQ1bFYzG9oK3DH5QHA3qRvH8fXlXjsk8XODm3pULRUkSj868UQyb4LttdBf
 03x12iu5IHCpMmt+YfZB00SJ1iT4XH3mcAfkfyBZ0+b3lGrXd8jYNnogD7irelMUIsLHPdFIRMx
 223QZHt0exSngaqS3nc9a8V0bcgvpo/bQ3DyVzeVT7zfi6GkLTQGlWvqKRhO83YtXupuOiUblAn
 kRX8i9WVvtZ3QPTWCn944N3vedcMzrzTUlm+XjthiLANEgX5jPkp4xBUR/OybzTJGifhhGTGolD
 Y332BP8suMPVOzAXac7sF+aMc+qyG9UAWXvp+xC7qp35AoJWGaqgxUevfTgRJhzLhckBuhUMsr/
 ANUDHJ+SVGgBKIxdBDIOvnsZlRo/yK8BUDiv2ZtrEnnpIZYj2hP1tdFgl0/cv2eE7V4doZTCdLy
 1AAJXBlH9F3QTmnMANHtmRPIDN7OwLuHtqNkeph6i/42p1fbxjBnmzU72P0vNVkY7zfJq98X2+P
 olcUOU0TuXfCdFuU2o2+hSUSd+jElnX7Z0hjm+5FHQO117lRGB+jAN8/i+AXWYPqL8JkzG2jYnF
 FXoAU5i843DaJUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXy7R8goky78XM
 7PYVq4PViTXmFDJCfiNW3qBYHULG8F2e/YJjb9/2cyCarrnMJWbABRPSmwf5qoToQrF8j65iiPy
 hO9hCBRLpRhz3iJEhCZhF8mT/hM2sxQgiLOGQbeHbl6WCG0zEsyXNiizeX1UTwMp7Cp/XfiFXh3
 cHUV2ZVZVtGffeG93sPkPJeIDu+DmREmNlYQoyqxjzGUo396kpO/pE1wa38pKwigNvHXTM29NUB
 k0ImChLKek5fKj8Vfcs5BUC1XEVQlMv9bUVgo3NLkiZwjyoXt0sC1qD7NF2Dp9a7MONfy54Otvu
 7x+3503RhIyd/FqzM1wCBj6HwlUZjZCU4eYUxAFmETVYZXz9MO0+cNqw1woM7byNPlp77yaMmoK
 Ik+VsHHK1S4zcGq7W8APFJlvLpV1tgX1IVbEJ0Axi9pF9POZR8fXbYjqCkqX6n+ZZtScANibrKz
 XYnsW0A4aqlDBklYfCA==
X-Proofpoint-ORIG-GUID: hdXDX4uoMdjgJFqWKDpoi3vfbPCynloh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX1769D++dNSXi
 aNLhYtZ9x/KW5LyDfW6aH+ZxZym9FnxGgOmV4uSTeDMr4Ayoq2CRZxG9ovd2a1Dxh/s+Mpw7L77
 uYn27MTd4R8ORSk5LfIIEKEgiJFwrrY=
X-Proofpoint-GUID: hdXDX4uoMdjgJFqWKDpoi3vfbPCynloh
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bcf9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fh04QB9RiMqW_0KUfh4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

Top-level DTS (but not example in the bindings) has only two nodes with
unit-addresses: memory@ and soc@.  There are two special cases here, in
terms of coding style:

1. The unit-address of memory is often not known thus set to @0, because
   it is filled up by bootloader.

2. There is mixture of non-unit-address and unit-address nodes.

Therefore usually the DTS chooses sorting by the node name, not the unit
address, for the top-level part.  Disable sorting by the unit address if
depth of node is less than '2'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 scripts/dtc/dt-check-style                         |  8 ++++-
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 ++++++++++++++++++++++
 .../expected/dts-digit-node-order.dts.txt          |  2 ++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index d9080297bd4d..3c1aa9e28347 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -515,12 +515,18 @@ def _natural_sort_key(s):
 
 def check_child_address_order(ctx):
     """Addressed siblings (foo@N) must appear in ascending address
-    order within their parent node body."""
+    order within their parent node body.
+    Exception: Top-level in DTS follows name order, regardless of unit address
+    in memory@N and soc@N nodes
+    """
     for children in _walk_bodies(ctx.lines):
         addressed = []
         for c in children:
             if c.node_addr is None:
                 continue
+            if (ctx.file_type == 'dts') and (c.depth < 2):
+                # Top-level does not use unit address sorting usually
+                continue
             try:
                 parts = tuple(int(p, 16) for p in c.node_addr.split(','))
             except ValueError:
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
new file mode 100644
index 000000000000..29b931ccfdbd
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>,
+				     <4 5 6>,
+				     <7 8 9>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
new file mode 100644
index 000000000000..4d681ea4f639
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dts:27: [child-address-order] child node @10000 out of address order

-- 
2.53.0

