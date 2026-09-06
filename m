Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6177C3E3DA7
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704468; cv=none; b=AnkLpxVQFhgY2C3VaNI7rCk5ZzIG72z0YbK5kv4kSYc3LlE957TZwgagn+8TXC19/qjcbNyfq8HS47wAMf7XkFj0A4xmy9XRj9hl33xSPhkffEt3dZF299kIoF+7qnqRt1BRwB0+dU7rxgXx1w0d2rWMjD4tPorVE+2fqfB1tRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704468; c=relaxed/simple;
	bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRbpQtb+eHrOp0HmlNlfoue6XZyEH0Unw2H/XRQ1MmazRuAxaA046KKTkqyJCmmmiRMla7t8KO8P78y/qgVRys1AoiFTcVSFrxhA9VSxfyCMJHuTQmM8jpB8sfFjhJE+A8odcYHGO+wEDIabFA744YNihXQY9YN/bzCfn/pefaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MjQnovmr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MjQnovmr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so19457045e9.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704456; x=1789309256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=MjQnovmrp0G75fBW51H6iZwOZdXdTC3VA2bvbNY9OsjYH5uvYzb3ABE4P1oAhfpEAX
         hMvcnuhrHfD08bvkg3+Jm1xeQ9vjo+MWrBcxGrYXBzGUcsN8pSof7dQv9/yjpamkZ00M
         RVe511hIwV+eiTsLTjURwQomyrBULxMSEjrguM867HRJp4frO0QCSpatKeohrFqanWq3
         ejpL8AE9Fx95r7tJwQ/w0C8VtBhrnqBza3ULYaGmrCjGJ5SJNcawuY5k4iiRGv6CSBI+
         PMW2BXHZ0R7ldoDesIJm33H00IhWW1MmqNT9dweIfzvdPaZtLCVUCa22UycNjYN11F7E
         4UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704456; x=1789309256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=VRqJ2u0jmZ6YkEGXSD43KU57fy26wG+vn6DqWURSiCri5NPN5/gqsB8zuN8pYp8aZA
         +vntBJHGsCTisaTG5UDAO8rIBvJSuloVLxDXlqXCoonNGv7H73i4FBVQc3wzz29u8CG0
         1qMbksUQgn9Pn+Rx4ed517UoIkt4fOD8AV1P53Sh03CrJeaN0r6BMwvWMcMgRdQ/p5Qx
         1c7lfdMbR+/ISzWC9AhKvm61o++VLUa/Nm1Gh3FfdodjJKbUd/77KeGYfdWBlnCa1I0w
         GZrDcYLv5QkCMzivyDw6zjbFEYvu16BFtV/oCZDMqTZ1ABRfLnhmY2BsBv9GvVq3qK6C
         cWkA==
X-Forwarded-Encrypted: i=1; AKwUvBzOkpGZ7jb4836ReIhnK3JGo6Ecy1Byl+AG8YGDCwet3WNealYmrjNv0VZZrzl6uiJ2Xk0gvJegoDJm@vger.kernel.org
X-Gm-Message-State: AFuF++nGWKmDPTlsp8AqnwvY/YBRd3aRONF+4a2A6xUir9Lb92EfoLw8
	1FtzazImwPlETHhHm17O4jcTr2dsxhofBOXXcJnWi/Dj10TiRvYP7lwh5HGtt74Pv/o=
X-Gm-Gg: AYBFou27VN857qjJcHxdAwKoHxlYX5PmX+0CqkI+cxPzmhQDDrJhu1Awyof4upwYVUY
	QHt7zJHERZzfzDLmkqZH8YTo9FN4ZrGSh6RU9K3NTTKgNmVxilVaeqBBXDh5Srk+gVOjf6D6qTK
	jPFZegXn/1wOH5jtVFNB5kaGh54z6vvRq+tZLPt+SuvdMUjRp430ROvd6uSomzreATua7p8mXaj
	ZV+RSdrZ/VxpzAALHplsvY9WlPBXaQcjKCE9mJAggrBNq2JUkx/ycrFk8FwvsJdJ7y/u++oMMzZ
	SLdbMXmk6nuqzt902uyVXJXB6OLtywb44Ve5XfKUgXKy8L8yDJs1ySeaukB8JIfMG2Ny5gjZDoj
	bf1j/pbMsQ50YPY8DUc1FB5s0ungH+xx1kEBIiNj2PxPolk0GQwWpClrLSlQyQ/iv31hOQkIpgR
	yAz6ZJ7uzZks/vlvIcu2rTiOd7uDA3KxLcs/uFgQi8L1DBK8F/qDg0Bc7F3/yuFGQSAX1wLwhg
X-Received: by 2002:a05:6000:608:b0:485:8e4b:3d34 with SMTP id ffacd0b85a97d-4858e4b3ed7mr13628030f8f.5.1788704456216;
        Sun, 06 Sep 2026 07:20:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:46 +0100
Subject: [PATCH v6 01/13] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-1-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXa/wamZ1Jfho1H3YdsWqD5TFhQwQOgNph7Nj
 ikoZt5V0C+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12vwAKCRAicTuzoY3I
 OlFYEACSsDSUl1fw7qhTLdddK4F2CfiwPiXfk10TY/oAR67bJ3HZHkoZWG4QQagnAkm8bilXU/n
 Bnj9OskDS/Em0dzcpLhfUq1J2GxyafTPJ5dnGlcCWtzOCO6ho8xrCMYrZe23XhA4ZIUju58jZLE
 +2Vnw/7MNzxCeoQlWbPUsIVmgVPx0210ABwQ94+6sr7RG0TCFYOeHEjnQb3r8e6JXNwUO/67yGu
 RJzKn2jgCirNh5oEYYjV9D2YV3g08N8xVk7gsHfaHdTISG3TXryokokwIRoVZ1dMprziYQ2K+xL
 +NL0W22TwpxkMC5XeaOzL+TPDYvOx6B2s0j9MXKTmmThVgd6j4eFjcF9NfgfmVoAG8GYl4MGz5o
 /LF2yhG0zs5bZCfLU4w8Ste3HQrWWnmMrczqQQ5J+8ZZY3iP/Oz2gETRKUgV0e0dt/5O40+SGlE
 2a0bwzZzKDRIxlT4ny8+RjeJ0gX3HADgjS4auY676O1vJzzT+I0HlctABFY+48Jh80S+xgk8itX
 6j31FpfMevJcRohQ2YTZPenUILhcAC0kmzpbpHXk/+YwWa23cL4T8vHkgMZ9o/6E9WXCzTCtroo
 ZBCcVRGDkN0t47DBpwy2WBekjT8h5wXLZA0D8HodzUReEIq2qQWqXP/r7OSUTTe29UwE+fafgyX
 K+Ej1ZsjkhR7Xyg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.55.0

