Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08B384CC6
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424265; cv=none; b=CWeR8rDF9Cmj1WZbBSF2WSBosjAjxdyXGxnOpqjCimNFVA721/nbOBejPr063s0E4mXWe0kyjc5zrlwu415iyfVS+x57q0pxg0adH8nJc2kvtU1nbCTyqbx6ZBVrRsMV16r6pZeJfXM1YIsKlYTLjcMPA7y8ycCuL/X/b2yFuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424265; c=relaxed/simple;
	bh=4xcxFzPvIMc62FhXBW3ZbIQJAwOORkRwLRbjLw+7oJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9ARS2LAKLLNA1HT42SN6Gaav9kno9gpyJmNmP+YHKeKtGO1rDFHxqg2Z2nV2F0bqtOISwag/4+YRXl8YLXSxG2gbnUEcK5EVycXtZ9WIFtYLrmF0PNVgQ6YTJQWvPvR5XxZGpb0exhoNQ9O+VdOIUyZR6UZq9E9xxNNETE6vZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/adctdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsYTVPZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/adctdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsYTVPZS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hXXl1950203
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LV2BIYsUVUL
	vybE9644thYeT30NIhyAOdd6md90QgEY=; b=i/adctdT60q9QRC/Lt75j45F6HZ
	UayrqAk10lf/8UzhpDFPX5+6esYW+AufyrN1/Tm8gDAns9tH12ALykTBcOWGyuig
	ldbSgb07gMxG6X6Im6lup9IAiVBirU97AdG7srg+5clq5zxZxBZnkqH9xOBIdJt1
	JM8P/ckKeM9xyi1C8OfpYCsiIzSk1OuvCcE4AxnbE3nvok0bIygec3B+KYwwThi+
	309Weolv4xosgO/m7Iz62N/O+tTIGq6ITlHpAX1GOZf4R1X66NGLZ2B10OXZfGH4
	BEbqrfZsTRNAdbtepTF5YYGolHma0WtdWue6oOi1uGPB9P4jI1T0maycpVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe40n9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so9104487eec.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424263; x=1792029063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=UsYTVPZS0iu3IWGQCXf5fjwuhfTaS3MmsNcBky6x9M1Yzo2jgtIywYbGsOLSKoXpJg
         NzNi/kwhMtBor1m0uel0Wm6LK1hhmo6eC6C0ahiu577lDC/5wFImZaevN5wE+RoznIVA
         qIhbuVPwnewd8oeYMExzktxJTzuZO08l7T4n7p/jpV/Vl/w6qP/qZyAazPJ4DVBCtUae
         FO+yj/GUpaFef568DYjZPmEuqC51rZkz7/3jgyEyEKBk9/ecqvqeZUEWIlS1lHy/xX4e
         xmBB+cH8a3eZO8fe4X8C+iHJxAl0kDoeF6WJ5JjSnt2QJAXgm4wLYu9xrusu3hYU87Zh
         unig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424263; x=1792029063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=Ukmejs4W9KNH2l0pgpqTbLjdscYUQOVq2VWNVCm29lb0MlYs55xm/so40lKLWKm7Mg
         7X1Owg2fqm+dMi4YLsxp7IRgJH6BoHwU5zXbLgJT2OFofK38GSPYYI8ViNow4h7ENb7d
         otMCb9acgeaESUW1SAUuX/CXOAppRjOSbq8t1LAxBjwUsBt8lYjDl6z4x8LKAY0XmrDi
         ircGe2npBojXYAaYnICzx2tUw7ikBDkE40cC21H3o4TbiJ8I4BBnzap3YcD3GaX88nbv
         XyzlteB2K4PE1pIt1iC/V2KgCfP3Ouo4gybaC45cADRzh8WuBF08yEukftucQw5x1FAy
         q4Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzKF976YBmnJ8OEVPxY7Hs78yxwbEkOD22qfOOMEclfvXe+4p8iByrlamKNOLveJWM64nTpeH6xhps4@vger.kernel.org
X-Gm-Message-State: AFuF++kiY9vKbjzWfrnEa4uKkfry0T3cFPcNH7dRJ7/5Tj42+LSVHO5M
	fZ/ZwbzMAEzaPlABE/HxPOY73wcqy3GbT6qs8rc624H4ryxGeAc4BqVT8Je3/PaSTi2CvpRaMgn
	afiamGwTFKvEs7Rs6QeHD3C1T9uwkaCiOEEoEYu7L129dAnauZqfebB7evbkD0noPQVu39TZubY
	4=
X-Gm-Gg: AYBFou1xknHO5FDywrbBEra/pRq+ny31SNOQiyAZLXqwv/vOx1loB38UoYuenzjWdE8
	U4ZOXLeaHbv8G9MkltWIAdEH7bz6u/yJ9ducMRZr4EG6EY+ZBrd89gk79L5Aygf3I2vTIjemZOv
	GRNAW5qxcXSg8suJPsUMy9/g2NhuPUa53dWV6YPtC/Z13CMFV0WtRqZaeejbLvpkR29KT5n5jzr
	ltPN77H26R99Cg1O9O5yEd2eav2Cxt2SLc0P8q/e5ohZX8TUA52K7fDaRvJPf9ng0UAKuotgqqg
	iwYfgxdGOvZA1cf7sFD5D2lxL4fkAowgG/oEUfY0dzl5wU1ca7xB6LTuAv6DtQmrvCcfVBF354C
	uYw6/XkXdyKOi7HCE3Aaq5tZXMKgQvxA/xg4I1HX/tWIL2bvjoosg3hogQAo=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118614eec.11.1791424262196;
        Wed, 07 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118573eec.11.1791424261528;
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
Date: Thu,  8 Oct 2026 09:50:16 +0800
Message-ID: <20261008015017.3359804-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RsYlwrsenvP1olimVf9hJJf-oT_1AURv
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac6f707 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-2z6ypdNruSm38GMId0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX1exWznauEF4e
 bBCf2w2ekWSeeOnzxo2Eg+0hQqRVMJeNOqofVQdz0ZACZwJGrlgxcUt/fu3iVOXda6PQt446YwX
 +hafVop27RG1pJ+UL0J/EqnNpzEpu/M=
X-Proofpoint-ORIG-GUID: RsYlwrsenvP1olimVf9hJJf-oT_1AURv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX5qe7ySP5rv08
 ws2IazRzcYbpbCQKTH98zJWZX7xXke4ogWfxhHaBgDs/jP7N0oilC/NYDBQ8CNiU9Xl7/8EBTm+
 51xvDEiVZcKPguVRAmr873zBBOaW+WJGyRFYN1sr06ODnMWYmxzS/bw0WronEuWwWSL92+8WHBv
 lr5GIdrO97RvnGv0PxVYA6YrvoX3jafARZW1Gs59ucJsvSjmWYxb8PkU2wLcuuiO1Yt0BvyLbIO
 kLa9QPS/sUkB8Yw8CupU2KHTlqWwXQ7H0GHsSNwLRomNugqXNYzaNhJ8ZJGMEE6txueQQ3KJRRN
 ECmwi90D/y5ytvxByAwlmm2hK6sKXW8lXJI1ATm4nvNuZFwDb1EVuid6r+iHMSUewv4CFFU278w
 JuYf89r80xck+zi5SIbXYFCqsHx5nlMEYgu2jKHH2980ckDoB4ADfxDy/8h2L0u0arOEYr6P1w5
 5nn+yyB439FpmDvK0jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297..67f2a587e65c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

