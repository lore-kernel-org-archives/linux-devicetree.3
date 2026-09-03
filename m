Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6C3B47F4
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461669; cv=none; b=qmJFokpSxsjxphqU8tAKNWgaa1KjVugRu6YZSEcdg5Yy6BuE3XPHjIyxeKz12ZN+xuf2i8M/htTNCiQY/YeVoqqqnME2E7V/tfqiL0sJIHbUOufn2FL3EcGs+RfBQlZAvhU7Q6GaLjQCGIO/z3+sifrmb1+HvLbyBGMq9EjXm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461669; c=relaxed/simple;
	bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGjeeJYRNySxgLbOwwrFxckWyt6V6kkbD6sW6s1JO32piWDAIv/HSMyqKKsGGyz6aVmYLQpyQxukLJA4pt2hiXQUHxdNTKb1j9q/rTggXgHZwZOn0Pi5aaREVWKOHe9FHFRwU64oX43NelGGhV/88tdQBUR1sAHV5VN8vet2p6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E313RZY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGkADowe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E313RZY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGkADowe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Uje1091135
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 18:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=E313RZY4M8xF9E10
	U6BrPtcvoIRnxtIOC+OX7G777UqJ1Y7bC/ZxTmQppLcTY0htJDiXZXhOyT8x+j5e
	/QE8/msIOVGDOq61VQ53RbZCzg6QaUFkwyGYwh9Q+5k6SP78UtbSxQU2FJj1bDMN
	SDM7OXjcrqyaxs2xFICbreLzaoFg0Qlwb4B4AJDkr4FXSKx02vMUqwIBXHmu1bcy
	wcSvnNHLvmavQn6VtFFthmarBQktRaygiQDW2BDhlfBXmOlj5NyfR8FUFQ0MY5hF
	LEP25+e1gbz/aCygEgEF/Wa/93yZsFvHX8Yj6nPYBhCX1DYhV3laHEVN+Y1UkxR3
	BSICgA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk24e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 18:54:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso146461a91.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461660; x=1789066460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=JGkADowejH6NCJxS1cjTbE2TZj7Mjyu4iyDrEJ7KcDfGx7X26dMp3T3eDmHRyo03q2
         5mNV8bn3gpTWtlziFReoMTXolkPwHKcH6nWRCzqQM3g9Jn645Y5lacZFoCR3TgDgKi9R
         XhGC36kNKrM+mtzZLvpfwI+NO3RAcsVp+3OhJQLwt/7NPhNmshUGtSRjRusQjBIFbjfQ
         xq9PpMfcIhB0KQvNmrKZODetCZl9QzvaSDiHsE/f7fkyfxYEenN3J2PdaHybWO9clgfA
         eQ5Gn3EjQQYfIEBad3rCRB25y+is+jVt2rx71N7t7vSy4bNVbyHDAZ+ZTg163o9NEz5P
         NcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461660; x=1789066460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=BkypUpc4ZpqxXz9KlbtSek0Jm1vLgtXt2QNmSwSSj5YeaD+lnCc+G8Mu98oS3QY7GW
         7A1KOmYihESo73hkzH87KYdcfFAEjYp3LCI+z+octoza7V2bapnsrGRrWlSzzDMfioRt
         lTXm390PuCdj07KSKxV3x4My+7c9lSe0bg0PvFTMOga8qeu3hV4gMFIXKuLoVpB9dqWv
         s3DgcCgiTtdHSSxOQFmgR2KC73s3wdMvZCNz6XoR09rzVpZPbUsgOX/mMzItSgfJgcfX
         /CaoVaZtZpQEMTw6xJQhwR3Zno97ZGmiW8ggRjbGJvkJavmM6A/q4JS+97HPazHZA7ES
         AnMw==
X-Forwarded-Encrypted: i=1; AKwUvByc8o77I0khptr45ZiHg/ev4F/Rg23rE1NRgcKfEDRxlsyP7bzZom1yFdPHLBK7ywQgLXwxc0+oyYfj@vger.kernel.org
X-Gm-Message-State: AFuF++nwVeULMafoWsisG539/GGSO9VvyP8PtRC+SnDvXbHPBKDJIPi5
	jMKUF8MVo+iCPTlCd27n5KGmIyxiY/igYt0rswdarcyz6P2yvUg/oYR+pagJczYBLYZoSrCulMq
	URE8YAlh+srvZliOnwNEFJseZBtf1gJj9Fpvbdga9BZDiSi8gVB4re6q0z3fq32Ue
X-Gm-Gg: AYBFou08ZK9upWklAKi4K13eMsb5Tfwml0bmZ7VtuAnaSEMEYbjosn4EoQ8sRZkiV4e
	oUU3Ra+On92GBnC6mEFxyz2SAECEOet1u8Axvlx3phJfZq4Qjlbn/ugzu7PEfb+l0HQTr3RscAr
	hkywpBCblguE7c4GqdyVDnbeuutt2bLBW6kyuZuu5QG096IVqb4Tocwk3KU4O1dNcUFxyjKCv3I
	eqU1TH66KkMCpUeyjlhHWr0ReVDGHAMfw4AMx5gJy9+Kj9eCHHDlrRqU9OYojK6HYIEGWjl2Aib
	jeUYTTrFclvjmaH8vs1YJq27YWVDoAuWhW1LX2CjTjSU0WEV3MEo706Ocoe9VcMSBFUtBdV42GN
	1+EecCFX2o7P8YO7rXJ4Lafroz7+kXQ==
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821293a91.4.1788461659984;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821208a91.4.1788461659491;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:45 +0530
Subject: [PATCH net-next 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-3-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=3972;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
 b=uzzl30Innk14VtQSk9wQipDRrLbmYFSpW0vMYpn4cBqiZtNV4lHQqwUJ3zYEt9gFMIbtiq2Xc
 WtYNlxhoAu3Dui4ZaxT1Cs/tTxLtdD+4EBW3mDPTd6R8AqCrTDYCtsG
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: cJ3Cixri2RKAX1y-5Non_ru5OA0gvrjq
X-Proofpoint-GUID: cJ3Cixri2RKAX1y-5Non_ru5OA0gvrjq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXx9qypDicgeWY
 09pKLB5W8tYueXBYJVZDIsAF9e67DzHPqVo/ui9/JGZJSY0OM+GPEPizTM1M6VDlY+IudSh0Xe1
 U8YhB5qq3RcbpMyzLX+m5BhA1oe5PI87E5wfffthBlCjkIdMzFgVtFAkpp1CaON1nr/Vn5PnKmW
 0AHPft3ieXqIoUmRVb2ZRNSeboC+XDAWDEstnbsonFa9JQ0Z1EeCAlXHhiDgyIbphKWJOS97jNT
 5u5YbqPDdWlx6fQPIEyNffUUrwiMy45il7Ru9NoYC5YUCXFebuJIc4sqK+m6it9asMcZ4hHvbJT
 UoG1zOf7/zWxoebvT5ehSKRpYiwey82vNvidPHmSY9CsE0gGfNG4LCiSp7Wu5sfwLcEDWJuyli2
 nb/XXWaCslVmdEYcfD3/y/N9t/phTFf3JlAB0DufLuHzH23IfDOQQlj2cpjKtCU5gKoffkZDvl8
 qwxMRZYLpWSq5bHlGbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX6bjWrFovyUEb
 xNh/rknEk2EpS22SL78TpK1/qcksyj5fQmmK0bdHsyms815sDwd6Lxt5VsQT5B6fANCMVejavcP
 tH++PQdxOrO9Yd86UjCE1Vx3skP4a7M=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c25d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DJPLBmofjJW9p3Fp6mMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2, while leaving existing compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 50 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ad2cc706fa74041486cd90c3d0eb1dde0acaa27c 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,11 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -92,6 +99,41 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+      required:
+        - operating-points-v2
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28ed3fbf8c92526ce8b872900653f4..6a1aea371c0b42ef71f90d89276e15159c3b3277 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -74,6 +74,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -632,6 +633,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1

