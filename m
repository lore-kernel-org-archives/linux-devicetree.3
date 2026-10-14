Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3BF4F0528
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982670; cv=none; b=dWzjvhK54XyczLA8w/AztHhi722i3jQ2l7m4vmrlRT5kxfB+3es6nLyxzOoy+OzAECY/hdmJsVSBw+GTv4s4lhJ3zvqCbjxcUnzgHPO/Gk2ChopsAmw/6ximT3XytZB9CkGfYECdjV0Wc3GQ/mJer5zffCb8Ci91W8x5//XZq6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982670; c=relaxed/simple;
	bh=kQ5NpRgxUXz3czHqaB5ibmOJ8HMRVwKCIPTvTXPa9cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mcb4YuKis4BREXfMWPyRSOMifc2tKVR07gc23oo7suRih6nXbh6/+7kqBGU49mSDkCyATfuqjBGJLRPIrkvtSQaqavVQvO5DNQAHXEeyNllwZu1MnwPm37dxzEVrPJhxV9QNboFWdBMAu7L8r7eB/6OIBptnyT5p6/VB2NdUCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbrHHMod; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbrHHMod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEE11F000FF;
	Wed, 14 Oct 2026 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791982651;
	bh=G6pG/TL2S/24LN+vb6/9HQmPLkDOws0zY6rNCJymDZg=;
	h=From:To:Cc:Subject:Date;
	b=QbrHHModflI1KnYnIHMHYl/On9JtfU1H1MB0QYQrXyQublCCOt5gs1zjza2I1A70p
	 gNGl49Q58tIYtq0O/v/vkV/gl/hZ61rGBwsWPsXRdUoDpU+aLpzeiR5laUxoBSQ+Km
	 dcLQNo4vVaDcrY7BD8WF/AhESQAjPXf3fNZcWenHcwDGvMV5bfYsOIKMXo2dFDQc9F
	 EWQjahT8c4EzsLH5JBiZ1JJiQq9UXTNZ2vPjhGNVt+slKYbaIdDe8BmuMTtDcnYP5c
	 cAM35rk+jXpaJ9QKO1u44LN+XRvVjQH2dGxyiFrnQFVE+4R7bUJCUfaYcdR6y5Ftw6
	 rB5o6YEawGc2w==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: altera: deprecate intel,socfpga-agilex72
Date: Wed, 14 Oct 2026 07:57:08 -0500
Message-ID: <20261014125709.2106261-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27. Thus
the following bindings "intel,socfpga-agilex72" and "intel,socfpga-agilex72-socdk"
should no longer be used going forward, so we will deprecate them.

Replace those deprecated bindings with "altr,socfpga-agilex27" and
"altr,socfpga-agilex27-socdk" bindings for the SoCFPGA Agilex27 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e7..c87d7725f920e 100644
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
@@ -123,6 +129,7 @@ properties:
           - enum:
               - intel,socfpga-agilex72-socdk
           - const: intel,socfpga-agilex72
+        deprecated: true
 
       - description: Agilex7m boards
         items:
-- 
2.42.0.411.g813d9a9188

