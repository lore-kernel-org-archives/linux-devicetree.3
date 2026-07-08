Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0C3890E4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504970; cv=none; b=kZ+YFv0Ur7sW0A5egMooHf5Au7xWs+Xwb7hNcX5JZANon2pLz4xWB06VBVSw0+uWS/fD3d/Aull1z28r3Fff78dZCdim54K4f2QqlwflDd69oKvbDjplKZn2FzpubYZok7NL28rsZzUeGVkBKjh3SstNU9ET7ZIOAfqZSrjGLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504970; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+WKjVCUhXVwasRm8JIEoH2C9T5MfbOMvo9DUtGKuVAwnSHM69QGehIwFc992haFJxPNL062lU1pMlKgfDMcPBtjOfo2chznKRo7ZkMczyWO09UyW6tgcIQ4922Z0jPPdxyBZNUWdSCZMIRH1zYe2EGBR8+DLvg0VCClClb6akM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRT0oC1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blG6exLr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRT0oC1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blG6exLr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889uJN2053038
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=fRT0oC1tXrkVMZHq
	oXrrDEkA1bhNmvv6m+dXEXApXfP6yiZtbqagNeDjn/j2lO1rNlnsA3L7Sy92ze0p
	mGLRGVuwbbXzqCLUk9NvYuDa5AQX4ba1PGZ9huHKdF7kq3i2J5cSw+3EoBshTchf
	P8Mgw12R8k05oskiGPelnwxkZE8M9ioPcpzVp3vbnyw+Ltyr2ggl7VllTVK01sKR
	/43EKYfGiK0pCFam3nhNYFmChqisJ2yQ3H9BpTGbDwX3uET88LdDDsbQ3MP0Y3qZ
	ato9/IsNi2yZ78V0kWHKV4zQbc7wQUb2PehYEZkSUXUjbajtCpwrBJgwhG8E/3An
	PvH8/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5ga6gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:02:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso732805a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504967; x=1784109767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=blG6exLrHzf0NM1u4Ob9t2amREtRm+MKpMWzoyKSrI7hTZgxjBK61REqfze+EZV4XN
         zy/TCcuRhOkaoOG8+MfHf9ZjUblLgshzjrcuUpP8HG+3m99jAfftkn6L7pTp/hCtxUrH
         3KL0sSrGi+z48cPUjFLuesKQk3WfU5tThtJ61ZVFK+P+xkXtuYAJJc5SNnCPoBm303qD
         g8lILImJqVqCfkz6RKTgD7XykIDxTrYfTtQGIF0Pp4XSzpA8I0GWZPJ1EPh/vvAQ+x4t
         uzyd81KAlaj+7/VeOCg0Sq3NRknayM5iZWwCFfTv2XJpE/S20MKmQpiZfCWyROpjLlUf
         k4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504967; x=1784109767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=g4Qgj7Cf4FUDwTtMieKLS4o9eUM2FC98U4rI6ejWhnWf686FAC4H4iVcq/sSO0AWc5
         kjslJCIu/CXYVkSehMpMJ4+yra94Mkp1EJtcUZl/kwXTvVhL/jtNBWnmSt3aPmBzbhVZ
         HH1xI4fEK37flDDagCvO8iWGLKZSRA3OELDrCWGATaQJI6xm8GAUQJTQl9xjqFYqNrPO
         jZnTYqYsxodlVuRXTTxR6oH25CKpWqXgU1WVL+vHTmKeYy1KNC2EZtBtUw2MIQYnyQcz
         sKpksW9ghMiudJgAQG2CqHsVsH9XOLTyo7hj46J1mUiZhbY1xPAc06g32VnUk7GH0qeY
         Y+rA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdr6iB5jhnxSLFFm4Z97Hvapf7ixO++glLXWJ6zmtDS1sKg+l/areMnzG3nZsKOzE/+I4NoELj899g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8o2sU7BlufP3AWZMWhezZLgrxs4LL2JPnrOdEauGdzhfmkLzY
	Vpo1M7Zl3mqVlnHX0cpup2MHtti4TAwi/JiwornOiqwuhtbUHkGVspbwq8nUd2PD4XaPMMmkxvI
	tXVh68C0xZmFzuoHHaOldAE1wTpwkJ+VotVTSociPMTeHWc1aFPhVdBbqxR/5UU41
X-Gm-Gg: AfdE7cln9f4ib5A3yv6329IOLMd6W9s6Tvk4mDhF6DI+Y/BKup6Q/+2Vq5kQQickKPa
	M0Ad7o8zFkgqQIs+suV5RHmKnlwhWtXBYgr74roF2REHNeu5e0z6UxaIQqLj1UkEHoSn1AqIz55
	u5awGnuLxFs+HOglU48tMdHnJdS4+V3H5vtmPsBnJS2C8VbfAzJDHT9378lCoYx9ZN6M/iOqRSs
	z/IjfvZFd5MNqodh9GFrO94aGMsOjJ5dj3PccVCdElq5IROGzEAygwSlmoUYJvGcKIlp21CiLxY
	YSRcKKDfc8i9YBFUjd0Yo29YKMm8dutTG5MDnOGUUt+qoPEteGUFaAtAzYYg8XkeSKU7CS/rCAq
	30Y/57HudmZu3cZ+21NL0qyOGv3I5wBQd7zdweVeIQ1ob13Dv9bzukwy4pA==
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256845a91.23.1783504966678;
        Wed, 08 Jul 2026 03:02:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256746a91.23.1783504965910;
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:39 -0700
Subject: [PATCH v8 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-2-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=WSWMoqULrv+aluXBvb4fFgmGX+08bQ2NOO1ViXMaUsrjkktC4OQ4mOzBm7S+1SVwHX1O67qP4
 uf0S25sdXKUA77oO3+B8wPGC5FIDGSBPlC+flJ4YRqGofgKug2b6FJu
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX9vLOXltFYU08
 C5JPemS/R/K1hnuIsalxOk7X95ApUDjaNtY6lDZeet+VM+Aw6a+Fmv2ZgGmgBBfZtpWs7zgqYFo
 ln4KeCjTbDNXX44Wxxer2a5GxHFfKZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX7rh34bk9I5eN
 NWFVNzq2JJjozKq2eKtxupENsO3wqUJCBfuF0dAv2ERpeHE2uP+cfm1wkIxoC5BOykNYQNKzYpf
 GIiDpSeWYa5dns72gWqPYXJJkOlP5gZfT3+D8nLIvu4LTphMuPf8YuvQ2dCKrTwh5NESzOpEgDX
 OeyBXaFhOKa4+Xf22sZwPUpgXoNph4dgKzXxkPoeEADOt48BJb0Y9dE8cFNa/ruA01aR92+Sv5b
 MoYqTkXWhoD+h5Hmwqjt+lMzXBDBrdskM+AMF3VoQS9tpt8lPak7uNeoc/166PhbVmvwRYdqjWP
 BGZBgdkflluVCwFBcHXnWmnYcfL3QCpxKCaJd/bZl3rufFoauIOAO5PEvK2SwSjfCC0L3hywYcR
 zFiqWQde8prt8YoEKbteSZUvv1c7Gg/66ZUf0w3wtAfTMa5gg0m3CZeb3yVVUD+LuRb3Abzom5u
 xvTiWNpCZ4iF7AGGvJA==
X-Proofpoint-ORIG-GUID: xGe4tOh4Q4oIBTey32jtWXLyEjLI49pS
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e2047 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xGe4tOh4Q4oIBTey32jtWXLyEjLI49pS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1

