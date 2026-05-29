Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F83B9D84;
	Fri, 29 May 2026 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044455; cv=none; b=LZY2gWOQaqZ1bRfCCZj9n6pz4EQRILO5+Y+BsYZ1tNc5DklbsZT7gGmG5CEiY1b/FE42ga4MpZt7lYyW24nIp7bsjDGLYxb9qxcEkVFPGWySrVIMnY7S5b+1cnKr2TrYbEbZJQVkHNCTPKtK94EgncGj6Mt9IcQt7nm9vEm+Ngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044455; c=relaxed/simple;
	bh=5YxUz6t3BXJWUpNuKRYQwWhOjTfHf/XO0P/Y8t9xq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7A8WpjIAuUXv/bedxddNHkN79rLmPrpKR+LrcAzivO8VKauifrsQ2Gths3vvQpBvcv53nHVtHE0g1tmMtVuZVKtfo0XNMa+G6PUFw7z1lSPOo/TK6N11HtO+jJPefrN642mVer3hT0vJkXghFFqVYdsEj0byQGziBjD6riWdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CRAxuqhC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CRAxuqhC"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C7861337;
	Fri, 29 May 2026 10:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044418;
	bh=5YxUz6t3BXJWUpNuKRYQwWhOjTfHf/XO0P/Y8t9xq0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CRAxuqhCyy0hKdFEdWOhxWyGdseJ+JNIy4pFSr6DytelAKX+/x99moTNG+I6yh621
	 DpsQzUoLF77lIvrh5zBpbAvEDi1ITqEkNT+GnmeDX/Qm1LEPxVW8HG5Y56bDW45YJz
	 6CZvoKa92kIC3mPOGROmW1sSafazk5+w9cEwB9kI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:33 +0300
Subject: [PATCH v3 03/15] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-3-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5YxUz6t3BXJWUpNuKRYQwWhOjTfHf/XO0P/Y8t9xq0U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKMTj/FUyRipkwsdk72Ss6R7PRhPUsMoVJZ8
 LCgzs65T1uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjAAKCRD6PaqMvJYe
 9U+RD/4m6jAQuBSloXMV8SWmCRgUkW3VaAIDeBY4Q/enD7xkwLyiXj/Liiz/uzwa/QXXj+cV0w+
 gqefzcfjvSplemjRn4r7t0Rh+u9FbT1IpskWQDfBy99PSxY8jdw2CDjozXfTQ7Oc6QQg8Du9Nqt
 KKNYRO/oOPg3fqucOFml++5/Ktyc0Pj/em41KQnM+jUp3f7VeKkYskfJa3X2Eu0pZgm40VSAej/
 hZlS+yn91hIibSCNkoS/nisZd7/rg+vYUByDeuTW/NaSwCFqkzEVEqKODt89PxAdhtlPuXsxp9D
 FW64dCvzjMppmcItyB7lozMU8exWu3HCxecHWfB2m5jzjb4BGUPawS4wPGzKu778OLP1lj4F/zI
 T8agNerWcBugPMvZSEgwAavcCuGaX3a7XbAj53H7nCtnRz4Leo6jLuoONZgyDoCjrOA4tvrQiZm
 95xl9kWaSLMgih+UDR2XZmdydxUkTgxDdtYbuHGxCw93VE4wNc4YyCnFeG1qbk8Ll4cIEb2/mkL
 XSrEB1FWwvzUidpM0YFIF2qHgobPb0jzO+KOwhSwJmgy3hUggC7RxdFvruVpYcQoE1WTb5hzi8/
 2NOYB6glu1ZJDdIVcpUycL2PSltIcIVYEh9hvKpmsnVc7fLyIWCx+G7pKZOy6uUfwq15x+t2fwb
 S1xuCzkCae9AGIA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On some SoCs the OLDI blocks belong to the same power-domain as the main
DSS block, but on some more recent SoCs the OLDI blocks have a
controllable power-domain.

Add the power-domain to the DT binding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
index 8203ec5e5bb3..5dbf1f76dd3f 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
@@ -29,6 +29,9 @@ properties:
   clock-names:
     const: serial
 
+  power-domains:
+    maxItems: 1
+
   ti,companion-oldi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.43.0

