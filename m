Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743253C583A
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080862; cv=none; b=IIu7h+LuYoyv0hu+5AtPQoA+W5uVd2kQJxPDplse0b7jJV3tMh9vtKw0muUT6HNPqC21JFv/gPXW6x97eB7QXAmelvMHV3pMTuNohXgfA8Ye2RbheOVAEPxMAbYmQA/jOBegZwXKMy14E+X32FOZR3tOhcLy2MjpXgFQ9psOPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080862; c=relaxed/simple;
	bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDExlJW+qkR2vLmaJr5nf9rJ3HPdooJqfXbT0tkRfXPYzyMCzEfrXIiDxy3tunjHdP539CtkwQZudTj/G9mksb6fuqDe8DSPIccZVKvUentYEfNoLlx0pvhpH2hpGR+mlAygOBXWAvnmHRsdmuQxlDyA6m6XkDW2Ig8ZqMlZomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjAIbbaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4sYtNqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjAIbbaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4sYtNqz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2sQZ1145875
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=; b=gjAIbbaTEWvPHBh5
	VntJDw2LmSSJA+gsvhOUzTzeFn0g1XTCQk4fie/gZxDbftV/92x8yxMZ4ld4nivJ
	orsfeEUAPV9jWwAalcgefZmROzukyKUEVX6wRnjqZhnMW5V2ugrGtDVSCqhddf03
	vgZarqeeKBprOPJLtm++rYEwag4yunf4yL4EOggAb0D/7jsWYp07Rz84l//Y8wSY
	FiknjqQcCV2XTneB1yNFbeVsBFRSnIzVKXqA+PrvPSy8j6Xp3kYTj4fN2bNaxqwy
	F3DYKvgmHOVk35bdvL3HnWHosZ+nlaqhOLGSPIkw9XJIg69LANYWkdZ1ADrd/ec1
	9siepw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbb91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so25218271cf.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080860; x=1785685660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=W4sYtNqzbsz5SpFZZn4mdkhzOhLiRUWDflnSMn9gcGlTOprrIFQqRb7rad7/ijwOOd
         GsjTq4gTUr+eI5N6vkJ+ZoESKAXhBB7/OCrUJqC7s1gLidyHxAuV47LXIxWywlpgclRF
         dZz+b/yejE3qkocFtnpcNcwNy5AWJPZIOjAZBx4dTXt2aayTPmtdNFsiKleApLLYzA6N
         d61sk0Z1s7W9nMWDJN88dgTc7kQHtWTkH1hY053hZLoFz30Wa0AAK4P3vy2IAtmdSt/Y
         6KwDq9KOeunCuPPmQWeIwd4DWHuG+QyjWmYmgrz6RlGLaPhWmIjk93Y+p/e4y+q205p0
         uAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080860; x=1785685660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=hliYxPrAIFc7SSAG5tWW5mWrzehqDZ5AkhJf8TflYirm+SNVxxTlaXbhwOWkepNX5B
         wjsTSHOrSGSAnmJmFeEwmB0xBd4Hw0U183ks4h0deIO3UPvUdsGzg8ukyZsDCAymABT/
         ybPzpBnW3KtyfyyDxov9Z0iGMy9xBTrLKlmKLaVMjCp9HgZI94HyazY2kdbb5DW5QLrw
         NBjzuq0Cb6+bbFIxnqQQ0LK1EmYAcsbWwIIffS5NJaVBZc1iw1q7xdgVuji7ocHkr7jt
         S8emp+qvo0tlfqbPnbEYqQnfW80NGsWgKkgodfzK+OQRczI0MMv/39jBxcRE5joA5L4w
         E+kg==
X-Gm-Message-State: AOJu0Yw7tMrE5qiRzq7FXZpPzPWWXZJOofu4qIPTxiFcDO2Friam/WnA
	fk1ZAAkZ6Hd7NIHO9+Ujw1+LFsLY5FJUTY6+FSkQJIbWQSUhiaiMjT3CzsPSkHwIbQKipmsUe/S
	/jq9ffJrp5KahatXwfSv77A4TCHujPwJHaNBm3T8x8Eg/O3mDpPVHM1jRe7xz/qxa
X-Gm-Gg: AR+sD11Elrpw7hsRa9x1pLyAuhXY4AfkRt104S4LK/MuLJbBgjDt3dhbHbRy+pfoI9H
	/13SNjqo76sRt7enxcsoAnbVHPl6jDI41iIGQNax0S3nbF133gKzuceL3szU0M4kGClyvKSVyO3
	iOVeL1n5eFiy6P9Rz7yYRNkRbeCIoJlZmhpcpMRzdtzKBSX760dzGyEudQylZXk8i4stXQZrsY9
	MY/vkiuhf3PQYC3Gz0O19Thpo5b/8xfM2lpC9Of9J9Nqi2gZnlWZvost68zwPmo6aeAUBqHEkMX
	IEC+/KHxhARzckc6xAutTF2b8wMDTPprdF1ith7wO+QwiNbZB7YsbBGvn4SClv4iF7dX40yJBxk
	iluB4IzUXKIGHiYR9j7DNRVOv
X-Received: by 2002:ac8:7c55:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-529a8376033mr60147601cf.31.1785080859572;
        Sun, 26 Jul 2026 08:47:39 -0700 (PDT)
X-Received: by 2002:ac8:7c55:0:b0:51c:805:1be3 with SMTP id d75a77b69052e-529a8376033mr60147431cf.31.1785080859014;
        Sun, 26 Jul 2026 08:47:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:20 +0200
Subject: [PATCH 1/9] dtc: dt-check-style: Add missing /dts-v1/ to few test
 cases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-1-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6705;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwP/STtiUUSu8vH47SShY/SGXuWVbBwlvriY
 gwJyg9SqdGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsDwAKCRDBN2bmhouD
 10XoD/9uu025k9Xy50m+IwVc02M1EkJTwfkjLYA81pLz3a+MQgpAbSRCVvy8GCxwvfsbLSmFKji
 QkRcBXdzMfpqdiGFIa/+U0Cpow6j2kz4sSGviSDAmWSMho/Uj7Q2rav+N0EJClLM/GpR/Eg3yoS
 jqp/HsvAaGAp9h+SJlPYHavJtQ4ljINHnerJ9ms4ccCrCK10Lb08V9HY2Vl3s1b8ZLOaGP5MmPo
 zG/62kK5/UuegPdUUiPLM85cd986AaOjWoQaAIncs4QGfZFdyjhyxvszSyRKrHYfmMqSTEQM5R8
 vzKQW003so2FsB08xacvP90k5VqRornjDcB/2rgZeBXbTZxS/vTMZkdzzX6hckiWaR3qHyoMh2Q
 TfcEYiQrbRKl2TD5TZwu/8yJmHLoFByIAmcTOHTIGOd8ps4mEeFT1Il0h055MDxizLM84Iuvrxg
 PSmebUvNyuq9xFAfVCfgs0LRLtO9qQgto8nWM+IObTJUEieJxQnehxLbdCwBvGIYtSapoLHN0To
 TL7Hz8sD6JWJ2YpfBqNYhAsYDOD2c3Z2IBv6eVkJ0yvQSGyMyYjSvYdnU4aCo/E0P9KTCMNxRQX
 ifuWdXqYCpxLS6Op99/hBzGRSd7YJoyfsxljEjKcX3O3c9PyYMVjtE1/wa+X0L0Mz+2fdA9yYHo
 Z+6JX6J8p6sqhSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX32czIDf9tzk6
 jGnJxucsu2cDprXb4WFHmaTalapp5a01DaVqt5f3RYeMxbRaO3bzoedDj+Y++VnApWLacFnBbUG
 iVXo3QiKYhU00Kl/HatZ7gGFZYmu4AwqtlqhZPA//ixOsoH4M2mj2sFymj/7saQtU6gqcyrx5DF
 YWyqqZtcdkSskn2jljlu4hnMsUMYsXWDJ57vh8awfC/8aM9A6c7NdmeOth9PBBg1aq1AUjyB5TW
 cvqesNEkDxj1E2tNRewRWlXhdAm1hXXchKzEfGuJGcHe0KH4vgV0HSUCaesv+CClLdbZ+mmpO0E
 Ip3LCq3koHgQf56OMVbwFUxNSHSIZYpqarpIEwJicMg9GaGbdL88JmfYZqFsMqPNAXa16DnGtAx
 NClM55ohziZ8bON7Si3azDoD/glmUpRFxP+Ya2LuCwoSQL/Fjw9QKsBHJO+J20TP032aEzNG6sv
 sT7XkYx2PupfvYQ7PBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX2XJz9BdetDVK
 ANaXo1WkJSuTdPiIGCl7D6e1U2BNoEUxG7XNTsfHpcF7o6GsEdocc2M/1Q1S1LwITWmaC9aUPnf
 wRJBHOeWa+ElE7JEIwasX+ZzOl/RoS8=
X-Proofpoint-ORIG-GUID: Lvybd1r_5F7iHTfvUBWUVYemAowCHdEi
X-Proofpoint-GUID: Lvybd1r_5F7iHTfvUBWUVYemAowCHdEi
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a662c1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bazDI84LfyIabikLn_YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

The selftest DTS should still look like a real DTS, so it needs
'/dts-v1/' marking.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts              | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt     | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt | 2 +-
 scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/soc.dtsi                             | 2 ++
 11 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
index 49c5c10c92d7..54be9f07b680 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
index 575dadd03c38..296c58a545d5 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
index f3ffc47365a3..813900e3393c 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index 86b1de9bd654..e2eea0862102 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-child-name-order.dts:14: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
index e3d8fd367e09..b6e74e6f923e 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-child-name-order.dts:20: [child-name-order] child node 'bar' out of name order
+bad/dts-extend-node-child-name-order.dts:22: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
index 525081867bf7..bf252e4d9815 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-digit-node-order.dts:21: [child-address-order] child node @10000 out of address order
+bad/dts-extend-node-digit-node-order.dts:23: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
index d2a278763c3c..af0adf5abf70 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
index d2bf5861c3ee..cdf3f91ebe01 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
index 47fe5455edfa..97d468051f25 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
index 0c292fefa52a..faf49962faf2 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/soc.dtsi b/scripts/dtc/dt-style-selftest/good/soc.dtsi
index c60274469555..deec1a973c92 100644
--- a/scripts/dtc/dt-style-selftest/good/soc.dtsi
+++ b/scripts/dtc/dt-style-selftest/good/soc.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;

-- 
2.53.0

