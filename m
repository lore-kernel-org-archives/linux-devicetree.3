Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACEC39A045;
	Mon,  3 Aug 2026 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762178; cv=none; b=s8/fL21fRAOC3H6nzOXWHLmMTCqegkfZ/sjlgUmsREKa5CUQrZDTQU1Dg5Y4ScHAO8TUOWvRsT4Q41mIFasuoOhPnWKKHzyGGIGx+lfwZNt4UR5EJKhXj9WLorFmPz47dUFZJ7a7U03LV8aCRWIV4NXa5pQCeI/GibfBcRBbcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762178; c=relaxed/simple;
	bh=aEu4DhLKCZR+9M5iOh+LW5VoY6WvL4eLkjfDVZ+NFaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7xupT540u6DKFn58RTHwu2J/hA2d45bv8vnGMD0fL2F34hMzHiytit/1rzZ1S1I9M+PpYv5ZMKGQv3+/tS4PTFUqZRYyvnFj5yY1cRd1TGyup/Fr8tUB12sWIXfMocIGvo6HfjOSCExMx2PDb8Qf4nYbuUTeZP4NOpcxAwaikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=xxHa9NpQ; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="xxHa9NpQ"
Received: by chaosmail.tech (Postfix) id 062761C867A;
	Mon, 03 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlXyLAprOBxybUF+7IFtOCRxZM/TnVWUvC6NWyiKbnU=;
	b=xxHa9NpQkLulh6OioIeyiZBRqlTOXOsu+fh10rudCOwmQA5yV1FSj0JS4MVQT1ZbmQHC7e
	Ypygbq02jWt/eCf5bJWt1/Fbrbb+hXFgAbLWmeifxBwf+Ji8Z/sypEEuunqDXpa3yAP6Gg
	iYFwpKH9CbcVaddYDzeQSLTmzjX8aRw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 03 Aug 2026 15:02:43 +0200
Subject: [PATCH v3 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-t603x-spmi-v3-1-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
In-Reply-To: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1440;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=aEu4DhLKCZR+9M5iOh+LW5VoY6WvL4eLkjfDVZ+NFaY=;
 b=5jIoiT1dCduBwhsIm2iJYJXDqRxV74AB1x+UwHp+YF49QIfpXGbyfJpSL8ZNtydUrRSfxBAt+
 ZaRYPApDrjzC5XAnLsOiXbjVzej64r625sXa96M7QmeHFYlUjEisSNa
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..fceed47b2cd1 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,6 +37,18 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0

