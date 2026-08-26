Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD23F4DD0
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742992; cv=none; b=Y6yDKhAXOgI4fHv4l5uCRS2JmIutdHP1qB/TgzWXkO/xM2CQinY8AUqfv85U96h3CUqCw8aGU3Oy/ydwLAf8emRSVSfj6OZBARPdwwTbBZ15JTfInBJwlhmawDfgJbCR4zMkB6Gc16dKJp9nFIJTgq+IqHZevJqz9aJ6th0MAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742992; c=relaxed/simple;
	bh=sLtLbF7S86pE8AXPx2k+gSnDPess+J9HKtzyUzkbn28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skai/kEBqmbtE4uuOT/SQXtCVJLZLN57K7NTupSSQwc0WC7uBMvCR4iiPbimWBJApPX+0EluTdoWUYBoc2NieHaRaF3ymbnk+RmWK7UR0voLXOZGGYXoODCIPX1PcuoKthaHRyUkeBkURtzVP8dIUuiDP4g4FvuMZzmwcFC5/R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWItPXKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuIg0e2l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWItPXKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuIg0e2l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH4vS972524
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=; b=YWItPXKdadioFdlr
	WGq+qPuCV3712T7z5QerIQBxnG+0tB6evoNXbNnXEz/Y8mCLJ0O2RcA0sPQxYCqV
	Y05yS6laqDP5t1TmHkhWOpUcRxLwh/vwVx/rzW97JybT24LwHgfvFAFePVRNxEHe
	Jliz3RtO0Tg7iYz3IA3cruEXzfJ6wrdaZ+8ogZVm2uo/GfBsRj95Am9kgHx/LJoI
	JLR9tQgt/vEaQ7ojmGovW71bSvOym/N0Xf6hpE8TUhGrxFXDNXP/4xNGwfWZAgJF
	tmW9/BYV+qDGfC9Sq7lHlVpqZBBsliaUpxc//THWgYDjHGi3/FDcjbRfLWotK3V8
	HXut1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghrrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ef04756caso1903901cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742980; x=1788347780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=;
        b=XuIg0e2lvY6uP3wYqMHXfC8eVNIVKwZIYaCmjnmGemRI+AZDQ/5yjbpKYD417tBYja
         vsqyXwKdz4a/ID/+0DgQ9/uWAnDsvmxssJfUIujst1FXC9r9QTG58RVi6S7THd08tyge
         FDrgFO8fU6BcEnUw7ASDSdFX3POwJ3zLv1YLO/1fO7w/kCCaezHPZitRtPFylbDYrAZI
         BfG7V+oCjcNyGB9qn0f6skm9UJDKzwzvs7T2qgYV5eIPNgW9jQYujEJUWWWhxYZE6Vb5
         7kR8dX4tdh1bUABTGlR2H6pt5435NPjhUcRglGwkbFiW59YMChrPiEI87Urnmtyx5K9u
         yGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742980; x=1788347780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1WIJvKAd2XOfDndIJ3ooRHt9ByqbXSTIWd0+xfU8KI=;
        b=rG3yHnh86JBGE/E3JopXULvdybZM1FBV/45+d6ceKaQwQKbUWGXamioBsVcVv/lhIs
         xssSUWSjh2zhhRFwGPOItZ/ZCEZ7q2BYR5Jhjwbyd1gvw28ha8Gdxj5cd1qOnfSW7Q9K
         Sc1IKPJ/87BiFsw2eA9+he7VIsgGmOORrfdO/kuKiyPa4/ZeSGyG3GQiDRXdxRaGMyqn
         FGMrQsf6yY1H8pURsm7KF077RvL5oEJkgfHkyN9k0AEYmP5y7jKVWIxHmci+BHqdb2WH
         e6semOkfNw3gjwH9XRBsIj1re4GOD/3RFE3+s9nrFmrWHHejl4PvgxuEVKTM6OAiRB99
         wHmw==
X-Gm-Message-State: AFuF++nsMmYS7vPy+B8fkWGay/AnuPrxU4j4xb6euvNH/jc9KAmnQZyd
	sJjVSKHiXcceYl9lB7AqGIRNzLAcVZ6uITJmoYwCSTHajJZQHVMfKMJvB630TFPYTK7R0oJaLGV
	Yw1XgzP6JUqSOtYzCf0ilrD2c63ELxSP9VmrtFAVWiZehBl2gtbeMyz+cjZPxFPaA
X-Gm-Gg: AR+sD10w+qyAnaT/rmpDs7ajhDWrJzeUL44FS4dm8d28f7x4PaKg5tczuAbwR2+9lBd
	26ty9hY0CoKcyChhGH1fDouV04NDfth9UeVvl9X4VSWojO0znswSKjKYHEpC7liip7NoR//gRRS
	eUYto5PIc7CaL79iYcIPKDtu49Rj525maywGLVJBXlgQnx1z0QpzRjXMDDJb83jWM+4uuIDDXlo
	54PydbSHOv3VyfI+nv8GlQucQxU6VOV/E6Arjg3Td4R2z1vLnjKWDqHpXHb4+tYA919oa7tusPg
	AIK9mSc3XDEixWo7OnSaZkhjit7Z84/yU+0LngNKvYPugwBqLjK7BWJH9JfQ5bnv2WNDo6Xzyn3
	VbY0M+SnR1DcwIsB1WTAb6uU=
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr46292681cf.25.1787742979111;
        Wed, 26 Aug 2026 04:16:19 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr46291581cf.25.1787742978261;
        Wed, 26 Aug 2026 04:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:58 +0200
Subject: [PATCH v6 06/10] dtc: dt-check-style: Replace Test User email with
 Rob Herring
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-6-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sLtLbF7S86pE8AXPx2k+gSnDPess+J9HKtzyUzkbn28=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrxPcoNDLPAdfqOALdqFrWAw1ZkAJl08SXG0
 tsGr6G0z6+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K8QAKCRDBN2bmhouD
 11UWD/9P9qmiVrocNVeiKP3VfN5a3qha4F3ftzVbrEXnPsYncEYFPDffSGbw4APBxPAoz1usrvI
 8Po4l41x1G65Emaiy9QQeeiwpxchJIZwlXs2VuVz1vRKipgey6orOi/GvGxx6IPVXb9Ap8+VdBK
 lS1MS7PWnifQQE+014V9ZkufH56gzwZbcqzF25yXoCvzZPry/bwkd32Q/eC4bF6/a6cR+vsnrpk
 KGHWje35VvYml3kMLUX92Kqipfw/+X9yNDSXAPq7y5PM3Adtz2dltVYRKio1Dbr1+0Cyl3W73/c
 WPjFz71ALXEuNUvjK5WNkUbaeVSBQledGMc49lMd/z8gBBzzL0Tl7RiQKSHkxhfz2RuCK5BYIt4
 EmO8J7NQIb8DlnuhmJYY0Z1CROboaTsow/KeeWcEk9ev7oqXCs6wbA9BYKSKAQW2yAgmRS1x1TL
 yaOhhS+tLyNAsbEUIKYS8vM7LcjmvrVDxInJsPTUhNOrdWUtD8O2SD6C78/vj1JNFp78+6Ogmb7
 o8slA3rNqS+GIwZ+MN+OafeIYqWQLKR/JgEP5WE7phMVwm8nhPqiIHs7BCsD7ZQSpVe8guD3xAN
 0FUu6Cg4ek9Kk0DA6q5xRIJErWZ67PKd3F+q18vhpcznMXtsECDUlNJgcwtaCyp7WWUJkWh6Wls
 wuiBQEm6QSCFKKQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: JnjW9GyLbeIiIymXgvrWmA0owRrdh-dw
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ecb04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=A1X0JdhQAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Lkbq6ki4aylNsx_sLmcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX2gBAUwJU/efi
 pH8y4PsShr2e3phXSdfYmxhvq02t44ort6bMXdOexeo1WvgNfDpbyUNondc5DfGT/bWbV4mPoN+
 85U70ZbeAQVKf3WNw3f8/4iwnxJYCzw=
X-Proofpoint-ORIG-GUID: JnjW9GyLbeIiIymXgvrWmA0owRrdh-dw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX27VmwNVEmAJU
 /LYhTdTzhVOBBkT8DG8p7dBGSNjjYaahe2eqBQFzaxLaDX6YgqQbFOT0idt3MZuvGxe5Hcugt9a
 w6we8XJVLd9aA8Zhqm16Zux8ZZv3+VtqoDBKjoIzcqbkGDgmWM3//QfCXWmAJcVXI68Q0LhYSvm
 zIHgdhC8HAK0YnEzzqbmq0nIsZ3ZSmHcPljS69+vqLnu2XW5lqIlqH+lE50BFM67yxXSbTpThS3
 1R1Z6CvaLqZQ+6BNZ+41SKZ8M77/WOVK7NfdUgAWYZMuD1diDizaee020qYHadUisGiawN8PdjT
 HRvBPJSO1eUC093f7lSecQedYRJ+xkB+tUdLlcje8MGd7O+Tc3R03Oj08eetZdeanTvLeAJ/JuC
 Uk9M2ntrkSb98puuu3CAiM9uNxyfcsI2rOzdRgV4ECzmxeoB+ehEX41X+Ory50hokIYa3KqQyet
 ZoFGi33cpu9MxQXgTcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

scripts/get_maintainer.pl reports email from the example binding
fixtures, so let's spare someone at @example.com from receiving bunch
of odd emails.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml          | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml        | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml         | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml                    | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml              | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml     | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml                | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml        | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
index 3df56e69a1ff..7c3b731e059a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with addressed children out of order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
index 35d85e5573c2..f3483033859a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with unaddressed children out of name order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index ccf443173dca..a5a9eb17fc17 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with mis-aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
index 44a9d25e5ba0..068542a98576 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with digit-leading nodes out of address order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index b26d1bf58de9..c55359a4ca68 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with uppercase hex literals
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
index bee4cf118d73..155060a79887 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture using 2-space indent (rejected by strict mode)
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
index ba512869b702..4a69b503af4b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture where a label is only "referenced" inside a string
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 64427bf1c385..6e4140e500b5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exceeding 80 columns
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
index 5401d1a423a1..c25a0d1a999e 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture mixing tabs and spaces in indent
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
index 4d9fa27b50a2..afc202a698eb 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with two closing braces on one line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
index e107659fd9e8..9e714f7e7d47 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with closing brace not on its own line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
index e2c69e9ff452..c71fb2c0a3e5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with device_type
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
index 75582a3d2f6e..bf1480e97209 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with reg before compatible
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
index 767ab21c39f3..51abc540af11 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exercising <x>-names and pinctrl-names pairing
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
index 8bb53240cffa..0036d5e0c4ea 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture missing required blank lines
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
index 487d07ff8cb6..937ecdd923b0 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with a tab in a DTS line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
index 2368ada8106f..695d046e8454 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with properties out of order behind trailing comments
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
index 5c4b4bd833c5..f338c14174e6 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with trailing whitespace
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
index 63c1c08712a5..191ed775384b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unclosed /* block comment
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
index 9b3fe508c5fd..62590948d2de 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with 0x-prefixed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
index 93705cd45410..5bb19fba5c19 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with malformed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
index 28d7176cbf08..7f862ae5a175 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unused label
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
index 504bf0931c27..1d7bc8142fd7 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace in a multi-line cell array
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
index 342ab9f399f1..a5082a158155 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace inside <...>
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
index 1502f803c24c..b91b8a8a9512 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture for dt-check-style
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
index 2e7b8582bb7c..8463075f9f4c 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
index a836d5f36b93..a95d07f883ef 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
@@ -17,7 +17,7 @@ description: |
       not leave the parser in block-comment state.
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:

-- 
2.53.0

