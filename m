Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1133EE1CB
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086298; cv=none; b=oscQCxbScfitI5XKkAvQdVGqPzEkYUnJ34T+iB4L8l8BMeu3RbVOa3C12Jhn8sfEN7QUvMFk4k60At+w67Qem7/IqoZS/wCZb56PfRz6OOkFtUqN/bMyoxRhyWdG4Lx1+61oF5qaMLdEyPzyK9tlALkzap0vXQg+JJPw1wF62n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086298; c=relaxed/simple;
	bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMpEgHvD4o/IzyA17P0G47inTmpJgi/7Qmudo4F1YH0Gc4Hzm7/9IypeIRo+cney47ng56ZLdMjJP5N/8yPy+LzoSgaMB8WWom4UnJ7uZTklYPIXzDyGtVwYv+eh6Aq0lMCNUWhLsQ5RWs2Ua9IpQtbXkPlZDSRDW68wmcmmxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ES7Schf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7+SJ/Sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ES7Schf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7+SJ/Sm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FI30q443151
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=; b=ES7Schf5x33FgGYs
	ABkZIZRMtyaA+UrZEF8eJJKTFigwQaJQWU8hNz4Xi0GjTjtZcnr6mYLLwFLbAEdx
	Us3V+nxAJbYR8g7Jvyid8pKoDo2avG8S/Da8Y6z2GRiVt8UMQD5zMnQc5KGWy94n
	d/J7ikRjEHHQpsUbf2OWGNL+2Dkfw6A6scGH5jm/YtmJpqSDA20uEmQHkz2D6f1q
	0iWV2dJ54AH6oX86ygP7QiRfK3ODUY17nT7lFA93y8pnMxd4/30KPC82BhpTPKtf
	2JgEkX8fMtSu6hLGFbqNjkEDIxuG7IxhMsh4EROYf13ArQLM0TfPMOVkVGX7zNx/
	CT6ZSg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299husq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:51:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso1080746c88.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086292; x=1778691092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=j7+SJ/SmaCNaOYtO/o/CiJ5cFOK5nKdbTSANopgANT5XZqm57Kqtfq6e90JIq/Pr6n
         POoye8+Lh3E6ZQMvaTVw0QTj1YtyOvS+qtczjYJ56kcW9h2ooX2JODpHMvfuXGvTbOt1
         8S4t7LE1xROoxMiZ+Xl4ZkcgQClgXHVKcgxpWcg1jIF7aF+N6cY0eacGJ2HZCXDhBd/7
         Vtz/KZ+VCXFFTVHE2dips/QWzJ7pw1EtX8zaDwDfDoWlegipZQufbAWYzycnIYFx1SAC
         YcLpsiDsjl0mYRFAh2N6z8dRHI40iltWfYpdNHKgLnaANCk66g8jhgblnoBvUwQxyw/W
         qd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086292; x=1778691092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auMvDAA4EUUiV2LAoqwSKoZ+PHY3ZmUuTegy7+23Vsg=;
        b=lTA9VNvmI3kCUFQu2LufMXdj4FsxSwAnZN51mo2bfgt2m8Qxuy93L5m6RDti99ehSZ
         /GmkTNviSyzY+ZVz40pYocTA2CkMKiI3WK8fAKEfe5OlkQG/JJdLzM8SFdPEHr/I36RD
         3ZCQLJsAkdQoR3OR9lejSwg2GikjzS12hjLcFGR0cN7jX91pOJZAoGtXZoulZTO91w6e
         yevRvKD92xVeDxcFzGiGwn4FIRgplYv307T/SRPA4ZAhfy5qiqGKmGW+3XupJSj9/oLP
         3K1zQo63jFQ0wCuvD42fZPRaL0i0guiT/YQSANs44XVN3w8Cisjoov9pI9T7sCIgqUYM
         oDmg==
X-Forwarded-Encrypted: i=1; AFNElJ9bi0MGtJvMtbfYUgb23hsHA9Dk17i+mJqdZW9rwEc9GoI5QXINy9cak7CpIzsh2Et1V09MdYqxvD0r@vger.kernel.org
X-Gm-Message-State: AOJu0YwESwssUdwujrOitpAAI5k4KRWXLUGsxvFHSnvFJnVzoKroP5Oq
	fl85dYwJeGZYuLFDMax85YwZyBXUM6aVBCjJPJEBcSzbw8wIviPgSCZ/YFk35h+Rd03mzCwz6TC
	HARQUKI27d6UoZEoBqXWs4hs05QrFnArt4gaCSMC6Usk+o+YzpE7w78GkgcK+N2/A
X-Gm-Gg: AeBDieuvfwuOesZn79jwHwzjsOx7g77+Tx5FCM2cibf5oo3E3Ai8BcJpiwYNnuewseA
	PPwcdB+SkHBXjbC7f+VEqsi8RNggq8sx63+KN/4JdfMCP4mYUkwiVHf/nssvBtctSrdWlxqCneY
	gvVMtUAwDc9T4uObN++jzlW8rNxbjsvuk/FYLazNQRqnqtsQxZrEgvIfUJF358yUm7vZy8yIw8e
	Gni6m0yq4TUorEzAaIlEWWYfuxG5NKiVMvywsDEgS3pJlGZD+6NM3NWltTiZ5Kc40nDKg8/a7NC
	yUbcDnDB77RvV4SQZ3U+va/Rwdpr/Zbfz5DRmGZudAmPFjjPuLXo/+aPvep6H0X79+5XVcD8vnT
	T3VIUK7A/aE2RJsc8U0QHJPiea8tqrpPnG0iXBEnlk4Lji/EsGnQ1i6pFZqiBrRowKLJ7y+VwsP
	0Ks/1GhZOjZwc=
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923315c88.4.1778086292168;
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:128:d5bd:3557 with SMTP id a92af1059eb24-131a771cbb6mr1923287c88.4.1778086291405;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:41 -0700
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-2-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=2076;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=Rc3wR1W/Ih5kAVC28sMokOrsrDcS78MI6o7/S/3cgks=;
 b=iOLr6NoF49SnI5ljBUWuP2OuF/tC/zaRawHEDrvrQlooGQgCiw9DmfI655ex73Px9oiTvcEbp
 pZ7MGAgRmAGAG8fao+x39DKcEESOCVNcJwYqu6JQ5qfhH2DP9LyqFKy
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb7195 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N79QfILmdNi3kVuE8ocA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: -5EP80mqCOG9nyhCjkiYY44Y1p1wkJO3
X-Proofpoint-GUID: -5EP80mqCOG9nyhCjkiYY44Y1p1wkJO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX4Syc8Qk+MTSc
 7Rm86N7KHiNjqzEsKTVjFsIIGzMj7LCqsrHLS1kBDERu5dLRGSdk8CGS7U2T2W11GArX7PPUlAN
 NDMqeLyt1N+0/6txKhlcGLMNBtVitrR1E2tyBGmiE5QIuD+MtOnxPO38rpCax7FToEjfhb2V9y/
 UsjufM4fHD2pytghz2BIzDzBl0haZvXU3U39pHr/IyN2lKC1vFC27EE3Qw2/QTGc4qedJRKn8lZ
 QRJmYirQn+hq1GDSy4Rv2anpnk07xVCop8M1qInZUBpBOUhgZHizppOYg3HMPsaxnBQ324L3fW6
 q/FKSXhWsWBAkK/MAsGkOMj9q30lSbHSlQb6DUYHWkgJDgB7E+SA0m1ya7CWI8KXMNlpkyjgP9m
 zVfghNlscpPhRMz1ExDVyCVXhR8WyCUJuwjfseb2gzkUPDwI3GugN7x9m1f8GUCdhRxpnrLBz9B
 i47waIpGZSAvzJGnuLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add bindings documentation for TCSR clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..08824f848973 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,nord-tcsrcc
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1

