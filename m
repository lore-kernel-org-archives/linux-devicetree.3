Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47064119ED
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572510; cv=none; b=I7rx4q5wP0qyZUFYBECKzs94JHej0ihNyBiT8e458viveLCfZlQluFXgr5s26BTrAE0GMwXBUpvYQawPG8IakzUNc39KNgqtEAFASY0GxMZB/izbjZTvyH2751aUb+xNvVfvrmASt+5snDnLJ7sXNrUQFPV+/bvbXptJpIgk5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572510; c=relaxed/simple;
	bh=1G7ulVQky/ointLS6R+9kp+1rcIWPRl/0UWlihoY1tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ii3zQs0lW03sZ8n3byMs0n898Ca30v7lg3nZlY4CG3+V2ZZTIGNJsOTC6APl6b2iNFj+Yy0NZGhCVZsWKImHg2fNQuODHUqhjRnC8HQ0fBdHcjIDDJeDXsvEjzGiKYPnd7ftX4rB47QFsR8Oa+JnzfYukWdBophwsTHVn9QpVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEQykwr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kkmsfxbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEQykwr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kkmsfxbu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMe4V3195012
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=; b=OEQykwr2CGsk0tPJ
	Kq7qT24u6pWpAuolZtiroPGdscZWPsUOFj5cOfbnOWO0sn9BaieUDOk9UUpo107h
	w03TtoeeO9mD/djvLcKcfquSfzQxICg5RqintxonTj3/hAuIdvGamT4qKhmmHeU8
	OzhJOKvnlYb+Bf1CwJDJwZ/vW5zIGB9ES1cMSGpukMI7r4zIWQ87r70iSDf8rxS7
	Xv21zp2G8tS3YNmbtCZUmegOaaAGZxHMmIA+QOT4psoshpEd6gcToqN4ZIyBrFAd
	4ybXw5z9Czk+EUDxjhb3ePChne3F9f9AuKEFP9an3WDAraTZWOAEQ608rXxaARTQ
	N0EW5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f45dde7595so26509646d6.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572506; x=1788177306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=;
        b=KkmsfxbuoU/lIv1aPhJretfZnQiqEjKLkaEhswhZQn4CIC1OvByxUiF++duQn1+ihn
         4/GDcZKmiNJWuWO67YJ3Was2tyEuSo4WvCsMLI4+PRFFXGlwKJjdJJ/vbamKhtFCv0cr
         6TRAuHdrRmMq+vdM9yrhHbXIbAHlTpbsi8U3iQIkVowa6JV0UGcgu99ZvDFISNaYm82b
         MzMh6xl7riABDb8YKREOnZTZv10FwEJwYT5jm+HXz4J/lqDbOiF6ASbpY+gL9oc3+aB7
         h7mQguxOXFuu5Dgt6bMsAuljypNfF0haFE2reTAlU1NvIUYBW1oPkbIyoM9XQ797bX9A
         e1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572506; x=1788177306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txJ+hSeexQtxSY48PknJL/i+7XIW+liJ921ytGQIGhI=;
        b=ABmsjVbRjd9BkAbtOwi5DWPd5nPgyDAAMybSxxKMkiWsBMlIT+BkiZMAoZBDm19wUa
         J6E7WEyBJFLVETRb7tuV/zCL8yQfwPMYV/AIPmYdve4uZOuS3Ru6DVh9nVniCpdX7nOi
         DpTiV98+SNu0FYmuHDYzJaSGVLq85/KrSW75/Iwivd9K+RGJNW/LUfyixJFKAR000vdE
         pCJPux+iWhfrl4bCa/VHp77PfmJai+gl0V8ewJPkFTVCtOH0vhNrTwfxHRIuC1n/AQJE
         s6i2wGlv69nVG1fteeeUbJ0SXKYbF5Al18eE77jvJYK/7pqLi5q19BPYzItYhPgRUkFb
         7exQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLHqt9XiLrEY2Ijf4aJN3TuxBXJV8Rp387jKOc/nfeUrBUgS/9liwAxjnIxI18vOvgT+ELGSvWWsJP@vger.kernel.org
X-Gm-Message-State: AFuF++lIXCHsF0f5rCFeiJ2TJjAU62W2jag8Q8OfOpxhDS3+egGAWPpf
	YaSIuYu8cZHGuMR3oUBwliOLL/8WMuKCD9MWceN7TecgPa3mkUdUYUfCHQBpBqFo/sKbSuiQcEA
	b1V3lUi/Pk2oR1lwUiUSeyu5CStvQNO2CKwnEBxmphrtdLjoseUmwoOigxa7OWg9E
X-Gm-Gg: AR+sD11DzFR7sczO++rZguT6/BOkXGgyofGS7wgCVi/gTd13BytMQVZXijTu6eFi+gx
	RMUeBbohfaiEB555zGgmDkmriBEOfRzpaL3vtnypPOf0I9ZMPop6RGCpo4lMLZ5xYDF9GCeFRFG
	1j7UPEuhvyFxmNpd7hnxt2mOj43l+O98Fi93ujqcUc7bAhJiSkaEM20RGUntqbf8nkYFOhp3mAi
	8XaOYJA1IpMeQHMtOVU0sMbd5mKlwp6O/tHjvzbxJarspq34LaDajC6ZUZ/NwcJ745YcTnOIW1e
	2S1RhKuJlZFw6Z41quF/wlMxbc5gLoQ5+Q53PygIVXOmsB7zB3yPgndQervnA27Je4qNHBNaPER
	lZHUc6gQN
X-Received: by 2002:a05:6214:3293:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c81010fd3mr238752006d6.23.1787572505983;
        Mon, 24 Aug 2026 04:55:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3293:b0:8f2:3472:5b33 with SMTP id 6a1803df08f44-90c81010fd3mr238750846d6.23.1787572505266;
        Mon, 24 Aug 2026 04:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:54 +0300
Subject: [PATCH v3 07/47] dt-bindings: clock: qcom: sm8550-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-7-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1G7ulVQky/ointLS6R+9kp+1rcIWPRl/0UWlihoY1tk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDc/cJqBp4Z07otOHOpvaGcAPBqvb2UE0bLZ
 W04PZ2BFU+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3AAKCRAbX0TJAJUV
 VggpD/9Sb34tM6MyR9EIv+aFToL2QjKmSCIu+dH1/GvFudL7nhTmLPpmSdHkzHMQAeDu2hYg7P4
 i3IpeTKTH/UrDF3yq7J9khk9XblQnjVhupHCr/2uL6h0grcr4I2IxJjlv8zVsUk31C89M64ITmD
 rOBq+W3sCfQ5zrd4KRVQdbpS/T+xAKo6LeelKH/dt1o0ite+ECpLOY9vNUm02+ZcCD3xxbMWjP9
 gRfEfMP5gNo/Ag9xHz8GhOWYY4G6Uui65Roy1P8LCsEeo17yNJeY65/L9TyrMxoPJFQsM8d6X4a
 xasM6/J4+VBbSgSU69JM+i/V8r0xm6nZ+rj9iscOuxCGZaWE60rsPDxjqRXgZczs0sJIiWRt9qd
 JBi9dwHPJVZKtSjvTNVbqZNXukhA75wD4rTxkOiHIDsqBUbyQQz5jBmTb8ae0z+bq74xXjo4nud
 3d9s++2vd5th4KyZfPKLkmP7a4OxEAWyEOEFMKrFOAPasGMOLYn7kjqu3S/6txeKnwWeAhr3yeo
 DBw5iT9QyKvgQp8eD1d2keriDr/tJM1Q8tCYdtPNjVkICTmwyP92yhxJQejem80H2XaByjDhkja
 AFBLYLAO/1PcFjaFjxCoi4OE+KboeEtIssv/H4fhxtOA3IJe5xDeMr88MA7GzmGM1JmdKy6Rnb2
 ant550+vMUDKTYQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1uVGxIMaLY6x
 9//xpN0gXPMEls55t6wBG+f0PuEPGekInDzat/OzeI8HQt6cMxT84ML1aYbT6oufB9Xu32+oWZu
 Z32ejXphuKU16GGlLsUZWspAY4e84iA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/11oiaV4Hpz7
 4QxNeKt1aYU6zRtDzTWB4vhZv+VYbi3/wfMCYXyaC/64dpLr7HH7OyypAaPuadZtozhaz9nqqPv
 izIOm4sm2jFDkNxCarFY7iD/XRsHaQHrAr0FFDiIqmCiP99aHZbt6KrETlh2fRHtJIu30XIgRhg
 FlTStTcpiEQZ7BbBUUHPos0KAE4cB9lmH2FG8oHk4Bfml0YQnLrvcbyH8b//DCkPcfLm4/SqJ3Q
 iWRcpWJwDLsgDH1+4J4DAD+9hVAzi+SNg3g4XAHdOxnjebs1YLZH/9hQDxcr81KoowPAsxqVyfE
 nSqLW0DIZCh9hTK6YS6UNOUgNRyMeAGNzNJyxBD7MSmCq0qWqHWVcQTwMaM8cqVIZKqQSQ1MA9i
 ELfRw5FfglLe8OUFRETar1fxg2vocLHyvNdtMBHHYsLJbhECpkSCcX1pCDeCiemYcw1bxLX74dk
 LCOGNOsI2s9yD4NPlZg==
X-Proofpoint-ORIG-GUID: iSEchfV4vIhptE7IXl-hVpKG9pX0wHca
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c311a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: iSEchfV4vIhptE7IXl-hVpKG9pX0wHca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8550 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..26b78bd0afe6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -44,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8550-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -55,6 +62,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

