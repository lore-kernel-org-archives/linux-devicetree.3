Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28ADDF6C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469232; cv=none; b=d2M2O0+OCyotm2pfDArUcnzz2YyfYQ7c3kYcKhs71oqYTMMReI16hCKNrohJdxVq3jRIprY493tsYU4jUE/B+W0T089xcn6wcf4ezMiwOOexGYew+hs2ycV5mBHSXX23WOjJ873ueVKwYIu5js3GmJ4vjDWL0LAkCIj9RXl7/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469232; c=relaxed/simple;
	bh=vawJBwoRRSQ7Z+CYpJw8nQJq3wDymyLcuoAY2mdir6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUlGmSh+vaHLx0LrrBOom0NwsP/JXUWZf+ggX0HrGH/hApm1YjbyO528+F0m115YNNMt0lRwtl20JSijJh49qv47B0I2t9Nhs4XtdzUbcu4N7hqzCwX+o1Do9EO9HL1fVEGlinayoozvfAL+utJophVZV7ZcMMHmg3xTRcwTeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJTWhG+8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJTWhG+8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47d6c634f45so48815f8f.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469228; x=1784074028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qElOScGvIRJiFGpwifE05EQl/M8pjbubEmFymuyuFiM=;
        b=CJTWhG+8WzLoVapJGspU42nrJbF7FFKzEsxkt4kaVE/7nCwpizLwtujZJkw19rlN6T
         pw1+6/tS9meKu+0zk2hM1ly0UTYVe+d4J9b1YlyGLbQSXYFBlhUJxuZjAiGhNAvV4ZA0
         Mbc09i8o/n6FpDVmX8FcDBKNjK2W0CE8NxzXmg5bq3FEQDqbVFVCfuI4Vixh7lk/q388
         Uq+9Bntrjz109tA1odflZWXNRNV5dTSTUwMJP55nP/sjO4Phn5h8S0TkF/bICUs4hwyQ
         PEHOCwpXTNyB4tRMp2qJvlfS2axUHht1/7Qbtu2Qqu0CsP2zhexybgMnGVGgptNWTpzg
         2OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469228; x=1784074028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qElOScGvIRJiFGpwifE05EQl/M8pjbubEmFymuyuFiM=;
        b=Nl7HEELqHAX6NSX/WKpsZM1JqEODcaUzV+lsHDLnB9MCooyQHYdgS+m41QImVXXvXL
         1T6kfoX2kleFa9XRtaOEADK5wefk5x9js/d5Y6XncwDIOH12d6gk24cSEhPc95nDv//7
         apkZoT7qMvNhVm5ujqPenp8KmjEOEGeUTyq4jJ/vqdnGSKnGaiVUw5TGquw8Jr0015KR
         dhkNqztzhMB/fMnXA//Usret6fJ/qgi4Dwp3LTv6BrucUTsnrck19cgbwTjdHbdjZ/kB
         72n2d8Kh9f73WdFFdWpzjJ7sADvW9Uq/jLD3Dzifk7lpNVWin1fKLdlsO3JanRWUAT0G
         CnmA==
X-Forwarded-Encrypted: i=1; AHgh+RrL8pfeo0jUqxwEtUg8Ot7In6xRN9mk2UyzY9bUndwywn9GrnMaOu6dWw6+tBC5GVSgl4q27V3kNpV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqi1UgrQUs9fVhfw5DXatPPk2b4nmixpwscltdHcoE+ebIJ8v
	5Gl5AALzWMXDS9O6TCK2h8C2Fzrgtevj3Y06upQhcQbkiiICPCvMJbaA04rlPfw0RKI=
X-Gm-Gg: AfdE7cknMGpIkadhfGDEHn3Nrsv0SNSmVp9dF+tC0qbCm+IS8pEjnoUUfocQwp5fCJX
	fzOvoorpYMdP1GUVFc5NkwwDwC9on1FutwQrxMvupLXsMysW14y9zw6iSC48h9//Qkk9ZoI9C2H
	XVPI7H6aDQbWGpJ0KGnTYJA/e1oknzoZUagRGLwv/U8IVSrDCUumukJDD1Xd45cyVs7qXbtxhig
	1bPyCOCAV3FWLrVG2meMuEMSQSSTk8Azradir8VKvfYkVWtwb5wLEMkxzv31um6uihkhk5jt7hd
	ZO5nRIYCp5G413t/CSaIdg2KFRhXZUV7Ea00WSrW6T0ukE/tGb+FM3b58+9Ndp6M3zP+57UR+70
	ys3v0YVKqhfRf/JJGL9J7WpZkYCtBVcKXpxXS0BsWi+t+FyQOwEKY2FrHkmGK/KkEbYaY17KIJW
	sB08GurFc7q5sAbLa/XW4JPD4=
X-Received: by 2002:adf:f0cd:0:b0:475:f0c2:5b04 with SMTP id ffacd0b85a97d-47de66eaee6mr6441632f8f.58.1783469228245;
        Tue, 07 Jul 2026 17:07:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:55 +0100
Subject: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vawJBwoRRSQ7Z+CYpJw8nQJq3wDymyLcuoAY2mdir6I=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSmptQLankPUIlvPjCHt99mAOCF8KVRiCBlS
 xs6B+fFehmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpgAKCRAicTuzoY3I
 OvhBEACYOZVhGP98Ru8tDiE1XvIWlJyQeiKOZfYf0usCjdIUzQ15/Onf0jAR/pHojJMVmrsD69c
 nu77Q+VCOgjdUisRqZnaP3XM+r1/Hr7WDdWq3hTgZDB5T491H0FBGRvjPYQUyjLy/ljhJFW7dfR
 8Tj7t9lZcuWMKuRJqPur94zecwtdCrk8Zq36DI+P0JToW/Zss7IjNRmoT3KJuOLnkd2KDKE7Dbe
 ZD0snVA127QDKNNEeO5iC3IyJr3wkNrZuXyDtXQa7lduW5UpGyyN9TgeT/wJFn/VTpGKhhPT6Ln
 qgwEf5M5ed3fn4broAMmyxdmN7z98dOjPVieNB32CkKCGt1eVJAWvXXVMzXBwvIyRoBpd5XX4zR
 J8n7q096g6YwPnBftiYkgbiizbYrK04juBZf1Dp7AbffIu7E8w5pP96RcfZq8LWj7R9PMLWyLBV
 gcQe5sLdrZUVbO4jm7Uj7znq5HLjzxwb4hJiMgpYH3ObO0azUufrhnvDOJaliK7XVUPZ7ytmzKX
 Gelu2GtY+hjf+s+833DNp8VPr9YLQqjxbaPRcO4ZDpMNcxWszzq+ZbCdcvz1hABBDhPT2v6EhUM
 VZfYr7e1mM44GC0oYT7kAS46Y11qUY6XJ4+Z0CKPyYRVNapcDUbW+/UkT+szQRHfndEvQ1aYxwS
 msygCRdzGrnJtjg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
its own individual rails. The old binding is still valid but with
individual nodes we define the rails in the CSIPHY sub-nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..c17b9757b2c86 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -39,6 +39,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   clocks:
     maxItems: 29
 
@@ -126,6 +134,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -158,6 +176,14 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
+    unevaluatedProperties: false
+
+  "^opp-table(-.*)?$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -171,8 +197,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -184,6 +208,7 @@ examples:
     #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     soc {
@@ -229,6 +254,10 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
             clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
                      <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CORE_AHB_CLK>,

-- 
2.54.0

