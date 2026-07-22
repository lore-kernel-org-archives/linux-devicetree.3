Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518E4028FA;
	Wed, 22 Jul 2026 09:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712204; cv=none; b=Mh9P5YVZq9DUp7PrTd1K1J9ojaOOKgQGLprzeav8j2zsWfApr249lXjHG7vxrhL/L9B4MMjOIuYdipKGutTsFg5a9JZlE6XUwSJAItlQ4+zQ/bcMD9eX/5rvjwfdxe/mTyNrEocHJy/zqQWblt13hnza7QtbMa1e9ItcKK9sY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712204; c=relaxed/simple;
	bh=5XWm0CYXpmO4KIt62r5OvlwOr5GLzpGa2LTrVyhC370=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQdF6IxDaGwd4sIxoixcz8HDE6pg6Z6RTNNXZmOAUM181gx0FFyrAafWwfFYcB04s710wFqswkg9dxUnTeiaQnvWK8tsCjr/u2RIv2pP9Mn8i3VUtbM+wLizJa3J4oOPmXTQHNc5YfXVpcW75P0WbfBCgh5q01lzNISAAjdm7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1oMk8mB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1oMk8mB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AD93C2BCFB;
	Wed, 22 Jul 2026 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784712204;
	bh=5XWm0CYXpmO4KIt62r5OvlwOr5GLzpGa2LTrVyhC370=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a1oMk8mBV1pe8CO+cbg1KeNfES+9R3ABYkG7aeStkIx1WNCJHq/pnJeq7wAs3OVOv
	 5pzTYKaIddy5aQWnWWVtOBPJferqLAh+gcN/GgzF47NCYCwSkGdm7m7wY0jiiGaZNK
	 votXyRUdfEhlxmq9plyn41wV6kJdYaxGeeAYMY/bV00nyVtf/ASqrinYKnOfFe0Xq6
	 KCDo/mWzj/Y1Nw7aLcBRXjN1FOAa+7rQmkxnMuMDzblxtdrDZLfMlgtAWkS1eMAy//
	 O8PtjcWMc81EgR+QRrOsUh+I7K958A0iR7NrDLnAe7mcAad9uq6us2IsyayVumoKtG
	 L0N4DPon03/YQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE58C4453D;
	Wed, 22 Jul 2026 09:23:24 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Wed, 22 Jul 2026 17:21:58 +0800
Subject: [PATCH RESEND 2/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-8189-smi-support-v1-2-b528a4fd878c@mediatek.com>
References: <20260722-8189-smi-support-v1-0-b528a4fd878c@mediatek.com>
In-Reply-To: <20260722-8189-smi-support-v1-0-b528a4fd878c@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784712202; l=3542;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=RfjGr9dS2BPv3kvuxEnkhOj9VPQPmNK7ihihb5BjbNg=;
 b=QoC+KkVN5+iRz4rt2bxJ1m7Pl3A3tv/2W5yWv/URnqQVugSSJtwLKVq8sawCC2pKt8h96YxWx
 33XTHSbhj27CBA2PODFg9psJenWw91IxALzWlHRFKuAv1RoyfM+GyDV
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


