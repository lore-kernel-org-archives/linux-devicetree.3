Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440CA332ED0
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699946; cv=none; b=shWf91mfPCkfQ9Y5CIAT8Qzk33cvhYxvFiHpDddFY7pFu+j0g6HrSfeEeDHCuIPVKYVaxXjRaXxnyAT7tfjWXVRNXmmFHaY/+xVPX3bTAFEx8i8QPpJPvu1b5NVuOKIO6e6+t/fRcqN4zDDUH957LukPeKJuPIyhnV+BkpQZM3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699946; c=relaxed/simple;
	bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6NCSIXZ67ZCjQF3TNN4iw4vU4ar1M96eWPrZvltrgtOyl6aCxsVSzYS3u3lXfI46uslmwd+RrGkUt8UjdxZTrULKBxPnYjdsKFYoLfrNtlsG/sY55vOhwApz0B9doqaTF8FpzMkdm9cu3w8vZBLsFxC6BNRPl4I4t8N1ESjjDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwvCShcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3iFH6PJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwvCShcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3iFH6PJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53lXq3662837
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=; b=ZwvCShcHSC5Aq9aK
	faPklVALiY8rUwZMNaDPaHF7b09Sl7SDJOTCOJdZx4LNSdQGzIQ9De7Rn+A1b74+
	I6/En+fdku7Z/GbjyIuDaqZJN/pK0KgE3W9SQJugTWbpnIu1QqrR3DVVtnvu37vO
	SkdtzCBSrAE05RdOCR/nxdhozA74KqyuMOAWM+c4t1fhMQgunxb+0h65RDVx2yFj
	AMsXXaY/iB2L17+uOokBrcSIw9EPhgk3Hn4FZw9Me+fit0HLcxxidjTa5gftEY3y
	T7fevUpwvJfd0G1nY4uzlF/Usl7bAkBM3TfqHh6naIvTQuCkEbiXyHcS/Fh7bsi8
	UiMtYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e2drf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:59:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485d853b08so15895783b3a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699943; x=1785304743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=j3iFH6PJr5Zrl0cObbWN1INbEj5p9/FOd9MC3N3dSJPl1OIaaR9Wo8HSPQvZlGNSdH
         DhC6GmidoJy1DCLgwGNhywQWq8OVfNjc3OZiYUO+PaJXwJDsGRWXOsUsO/Ra0P5U4HuF
         f/ZOfxWG1mUCwMtwKXkdQGt/ysKDUXSBwYGMJdzKHvPLQGXzpxLFb9dpMqCKLbkz/i/f
         nIOnR4XSFYSqDscnwgvoarlsrhyIhSB+CAU8h2G2wTWbCuT1Jt3BZgaP8MolWjUz927A
         KdrSdsOVM2WbcT4rk541h7h6AvMdF3jERTL8vP8A4pe23p4MRq2lQefVgk7+JKHRxcw4
         anHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699943; x=1785304743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=bktixAogesOrGUb1tw7rjLm2dLQLcim+319gaxiDHBDVTJwrQdph/iaXcIrFAlqNH7
         KxjRKZHUHiuiz6uJ0a04TF1E+P7GBtUWUu199pFiS+Nvr9WKAvD1lwXW5ADDpzo+5zLK
         pZkWBIYE3PcantWduHPX3BfZp8C+clTvPKtvjyf5LaKfLSQat/DCPSnQKdlVkNZCxmxG
         mmqNax/vSABd6L8RAky20s2wjiRWAKWCZQUbBAQL2TQpxcKf1dLHIYaWNRqjFv0z4SIh
         eqoUwJq5Q0P3penUpNiHbVi4RN7mOBxx/1KdYhMb6mzgyL8Ghp2NJW2B2kA1i4KIINn8
         83yA==
X-Forwarded-Encrypted: i=1; AHgh+RobMgzUGWz/2d2E2csesRMcOmnTNHzX8QWLfxcNB6MP+Fn1rxBvKtZ7IhdK1YJgeFG9bXiHEYRtkC0J@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IWIlXt4IX7h8D92B6IY0kJg19uDYAPeZEP43prdmJTiG4f/n
	pnsep/B0nXUdKsjFgdR4FhBcNrlJjzWvp2KzazdY2kOiYYSTh3alZuPJ+Ub7CZLpgvGyhYaCS0t
	8LdzkATpayQ8JC/FO7qr3rtJ6G6jZeI12ISCujRJe1xZFndShsNfnDRMbJx5fXeck
X-Gm-Gg: AR+sD13KzP4MWy6sO0CjhifNKpyqcjmm7w1PSVNy3/ZvheK4rS88lnt51xQivArGoK0
	8QUyc2/KPu7coM/hwJX5tfdyiPvEWtYNDqSQN/jm1P1cgkT0EnGIrx+M3ru5m3DvhZ0DQt8Qej/
	gEQiSoZNw7JTSEarmZCbG3YVjpi7O96r2rYsLzrMmXCwHuJY9rB/Idls5f0gNcg8b7mxRRRSuE/
	zEV5WF6sGeV9MQMaaTzoEuUiF+QKOfEW6e8kbUZA6r6d9cSFaiimAGQQfuU4fmlL0QGDW63xV9L
	7o8jhfQ3n7iWLtahPuklFO1g8BxPhPPfMtUl/iRA+A3Y7aigO8Hpo7P1JPSZhNQzNHD/EFt50d0
	x9MUUMw1SL8GDQDhpL3A2r4R4iKY5Oae7wcAaTrOboGYg3ME=
X-Received: by 2002:a05:6a00:228d:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84c2948a367mr22080878b3a.35.1784699942772;
        Tue, 21 Jul 2026 22:59:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:228d:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84c2948a367mr22080844b3a.35.1784699942362;
        Tue, 21 Jul 2026 22:59:02 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm554013a12.12.2026.07.21.22.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:59:02 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:58:57 -0700
Subject: [PATCH v10 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-tcsr_qre_0721-v10-2-d2fa68c63b78@oss.qualcomm.com>
References: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
In-Reply-To: <20260721-tcsr_qre_0721-v10-0-d2fa68c63b78@oss.qualcomm.com>
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
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699937; l=1880;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
 b=fHB78UmzUM7vr7beJw5MaWS1jyRYLYkJ0KXYoG6XSzfCQWGmrswWgi1F4TiJEGbb9VAqW2kdF
 QcV5ZiG6KfvBgXFkf31yv3yQBpmhJ24e3Ht1tZhac0EyZelZkf8QMOa
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: RNU71mxXKjHhzxMBPXAQTJq5jyJlop2Y
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a605c27 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RNU71mxXKjHhzxMBPXAQTJq5jyJlop2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfXxRK9Qxdk1Hay
 CaheBD9JNEb08BqXYyT28/ijtWa7vs4LCnDZdMFbqHT+oxUA5WUUYb7bYF00llTAfyPqQxrrDVl
 9SkrrozOW8LlVBWM4OcheCziKArbAhymPJ6+ss4bw62x4TOG69zDL6Tser1c4X0Sw1p64Er0I0E
 fbTufN6IhV5K5hXL+Mxe8YI3t5CQnMgCRc95ovrU+fyAo+kAYujjOYpHMLkbYxJCRXw/45fYHOj
 aNWhbJPLSMKb2jS6AOxXGWoSzzgOIRtmvSJAJuWGzy3RgQB7do7mGBO/PrsiYlVlg/WLQiNQcMZ
 /uAlYe1kkYtkeA59vekhl9np927JhhMFOzc25qiFD35tHV6CW2ausrv3AaBePSkqLg+noRWA0ox
 tYRFtZ19WqAB2jJmpcVdYZvgtdgBtYAW/IqoK+W5Nek7ZmcatV+H7kGsqcEP3aqeCNjb55BGmCc
 CmbljmmqSdhgAbO24rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MyBTYWx0ZWRfX3KGEtEgZxsot
 nXymScQOVDVh+Y5o/0HK50K96Lf1SifrbZCEITz92/x8jg7mnGwRyopHwLAxWd0b9HAxm17Ll/O
 A/fH5TyFrFtsv44r9lwCpM1+/6I7r2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220053

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

