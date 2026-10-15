Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65DB25B0B6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067931; cv=none; b=SziIdY3Hjbj+bBRlqe2EdAKigCWMWShAc472vXgsoAZy/BhSH2UeMbJgqyIzBjR5iuVkHoOwjxls1wciD8nAXyz488YVWIaZUiiAOdON/YNEaA/w16AsfP85HvMKYT1Wdn//O3FvlyvJG3SNO7y/Do+q9J0MOkFWV0+Mn6eGoso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067931; c=relaxed/simple;
	bh=7HeHsHWjArWy6VGUGKBnNF9OJosZqemLXl1lJIXVyiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5k6BGb/yggQoBDD/BaA98JhhzdCoQXxonYxPBpQlszqKdfIxQe/wqZ/oQ05UvNhIZOiFFtlv1RRTioedhJkEm4OulHS3ast56cePhjDc8xbTT/ruc4nUr6MMoxba25NooiT+gQZ4DT4ev1L6uyrBkJljkBNhF+rpy9BTyJn1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF6x2iUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF6x2iUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54F71F000C4;
	Thu, 15 Oct 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067930;
	bh=TCHCHz8WpC+lEPyVcB8rziQv+HQY2JiGtJ++Ref4Bd0=;
	h=From:To:Cc:Subject:Date;
	b=bF6x2iULR5Ko8Z7qaYtB2V51+qOT8kVVzPfxIzvNRerjqfkMYT5X6qQ86/CcFbYPg
	 HK+zCqxFoMOfoWBaKw/vMoa2mZPPe8M2oL9sUIXkhLSh+On1WoYNWEyW00qxdJY1AV
	 UgzfzBeZz+gUmUFQz7C8y61IieUgstKoLwFvtM6ZpGxWEAM3FyGl6OcoD6KuaGkkJ2
	 kAZhxJ9mwj5jXhjuLovH97hXo2AqZ0trREMVW/jJO2RpahB9nl1GAP1J7U9ES41mKg
	 2AbsfBeSYV6ua9pF7KRiTaiNaxT7ycxB/2Honc4UMWrna6wmHFVQc4Uh0kgdDAfJ+X
	 fC1K3aJjnlsJA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCHv2 1/2] dt-bindings: arm: altera: document the Agilex27 platform
Date: Thu, 15 Oct 2026 07:36:59 -0500
Message-ID: <20261015123700.2137706-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27.

Add the "altr,socfpga-agilex27" and "altr,socfpga-agilex27-socdk" bindings
for the SoCFPGA Agilex27 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: do not deprecate the agilex72 platform
---
 Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e7..f7058f00975c6 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -99,6 +99,12 @@ properties:
               - intel,socfpga-agilex-socdk-emmc
           - const: intel,socfpga-agilex
 
+      - description: Agilex27 boards
+        items:
+          - enum:
+              - altr,socfpga-agilex27-socdk
+          - const: altr,socfpga-agilex27
+
       - description: Agilex3 boards
         items:
           - enum:
-- 
2.42.0.411.g813d9a9188

