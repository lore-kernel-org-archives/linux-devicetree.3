Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F193DD516;
	Wed, 22 Jul 2026 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722000; cv=none; b=LlzELEI0OFE60fJbXaLYcQUavbp7L3scU/+/aO8me2n9RaG4PNob0gMbJ4xj1+lU8XWO1Lf+erJ59G2ImIV3jCXpgnnCDW+dP5vIByzYPoQij8f+0OnYclXBUmXUgTtYGL2pJ+loz0fIRPnwRcXke59nPdnXZnUvbBDJwtaVbFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722000; c=relaxed/simple;
	bh=5XWm0CYXpmO4KIt62r5OvlwOr5GLzpGa2LTrVyhC370=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1dreXn/sh+MxiSQhCxf3tdL0mGoJLOfjo1zM5eR1ZhoKn56J0CHJm6iO/uBgGHENUPsm+d6k5vPrdiqmtVUy7gvDvvnWaUYp/QHBQIatAOzlCPIMvhLAb1mVkgVXaKetJn0gu0YEuLuacvdkjWUYLuP2kcxYwznyNp79mjXyVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvV6ofSK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvV6ofSK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4530C2BCFF;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784721999;
	bh=5XWm0CYXpmO4KIt62r5OvlwOr5GLzpGa2LTrVyhC370=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qvV6ofSKtWl703T+AaW1S3rWzM3XhgIj06glZ4hmXhRxVvO9bOvJ3TO+3x6/qMjtL
	 hwkHnkTZOSXqHzsfsFmTS6akqc28JG+1H98Bp91txCU5ELrxenR9iexPqUgbE+FZST
	 AHYsp/E8yQbfLc+2oSzlhlQQz0zAgB7fjWoI66SSMmh53XcGVymn5X9OiisQYe31g/
	 y7tgPxO95Q8HBJLdCuowQXGsx5TVOy7oaWgM2ZtZwvBotLTLzMvpVmJhBW8ZdhHuLo
	 ToafZTjqWRkseKHRcAJDB6A4Zrxs03uQiKGs+CeNymQmgJEXKpBr8Gzwp/1RsJokEC
	 jegSylDdAPIOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAA2C4453C;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Wed, 22 Jul 2026 20:02:44 +0800
Subject: [PATCH RESEND v3 2/2] dt-bindings: memory-controllers: mtk-smi:
 Add support for mt8189
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-8189-smi-support-v3-2-ae00e13deeac@mediatek.com>
References: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
In-Reply-To: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784721998; l=3542;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=RfjGr9dS2BPv3kvuxEnkhOj9VPQPmNK7ihihb5BjbNg=;
 b=x7NGCgN8LrMDzFJIcNKrh88tbvs0GYx28y6/vxkixXR05ogRN+A7oci4VPiC3GFlg+a+seXF8
 +y+oAy+j07eDHhwUFa1zRyv66ykiEJeHKFwqja9ZJW0aVZnINSni1+s
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
Reply-To: congcong.yao@mediatek.com

From: Congcong Yao <congcong.yao@mediatek.com>

Add smi larb, common and sub-commom binding description for mt8189.

About what smi-sub-common is, please check the below diagram,
we add it in mediatek,smi-common.yaml file.

Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../memory-controllers/mediatek,smi-common.yaml        | 18 ++++++++++++++++++
 .../bindings/memory-controllers/mediatek,smi-larb.yaml |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..4e1deeff92b1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -25,6 +25,21 @@ description: |
   SMI generation 1 to transform the smi clock into emi clock domain, but that is
   not needed for SMI generation 2.
 
+  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
+  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
+  In this case, we use a smi-sub-common to merge some larbs.
+  The block diagram something is like:
+
+                          IOMMU
+                           | |
+                       smi-common
+              ---------------------------
+               |          |           ...
+              larb0   sub-common      ...  <-max number is 8
+                   ----------------
+                    |     |    ...
+                  larb1 larbX  ...  <-max number is 8
+
 properties:
   compatible:
     oneOf:
@@ -40,6 +55,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..9a5dafd7c07e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
           - mediatek,mt8188-smi-larb
+          - mediatek,mt8189-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -85,6 +86,7 @@ allOf:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
             - mediatek,mt8188-smi-larb
+            - mediatek,mt8189-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -119,6 +121,7 @@ allOf:
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
               - mediatek,mt8188-smi-larb
+              - mediatek,mt8189-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 

-- 
2.43.0


