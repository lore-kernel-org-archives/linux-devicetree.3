Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A336C0D3;
	Tue,  7 Apr 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575826; cv=none; b=NoPz7pC7kDZi4LjPe/HBsZku5RNY0OLFPZIyPLQ+KWpIP/FskUrnYMcAFL6OBJ7WsJoQ+IdDoFmXiBUQEi8i+O1wSo/IqIXD4KDAePKdTjyhN58gEykAGslmv472nylwJ4kpswGep4S757lKu8khI2vrT2I78knTyphr4foMCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575826; c=relaxed/simple;
	bh=TbudX6aGyCNPsFVssjZ3W5xAnai05Ks8V4pY3NZT0WA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtZkZwaHxElX3rUEu5zxgI4RGzVw1IZnBugdqyrEsst9gy+r8QvCZU3hR5k8oMIBRs01F2yi2uq2r0Gg04Q1oJ64U0jt3NApADpmqmteOt0mRErW4ggv1/KQcM6VRdrdAXQnDKhB6UrjewuuoIKkgZs/xklmMAMMdH2JYL37c2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjSgZ7Ar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjSgZ7Ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9FDC116C6;
	Tue,  7 Apr 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775575825;
	bh=TbudX6aGyCNPsFVssjZ3W5xAnai05Ks8V4pY3NZT0WA=;
	h=From:To:Cc:Subject:Date:From;
	b=LjSgZ7ArsiIgSXuvC4Wa7OwmiSV5natfgZll6bAz11p/VX5bFsojq9j0wkeB+RDSa
	 bLwORRzjSMbAe0hR0CytgHpMri9eL9TmVMraAzQgyh8JspoY3/RkIRcZBaCUkyd681
	 AYpd6W1Gh4i1DhUgl1yz/9cxCdUhfYNP+7GJlH3JgZX4AzNMqrnOmf6s8e+GhPZzBq
	 7Ujf8xYxSYwCui72pT9lACnRTZqGPJOtv7W+N3LA2nN5FKPVDkWlSgUTbZXC5F+/TE
	 H021AByuPtzTtoOIaynxgWpFOmDtozYctzdZLJjnBxWQ+qtBss35vSJxaPz5hG7dWd
	 /E1zBo2/YA1Mw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: soc: microchip: document irqmux on pic64gx
Date: Tue,  7 Apr 2026 16:29:31 +0100
Message-ID: <20260407-headache-reward-ae93bacdba0e@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nvr39C1LZXppwb7vRRHE2hQ7HrUmAZPXSdwtVK9tNMI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXlW5zFeyzO6d+/PqyFGP5zdczxbb7BaabvVWTFKp6N zV3WVtlRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZS8Z/hF3NDUvOsC+ufBFk4 y3hEe8RcVb579p4M/6+eEyfd/nYcjGH4HzD/hb2qVq/AwzJxrbro4AdJQWGzAvKKLeweaR27tbe fBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Being practically identical to PolarFire SoC, pic64gx has a irqmux
that's entirely compatible with that on mpfs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../bindings/soc/microchip/microchip,mpfs-irqmux.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
index 51164772724f5..419b32e2df936 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
@@ -26,7 +26,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-irqmux
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-irqmux
+          - const: microchip,mpfs-irqmux
+      - const: microchip,mpfs-irqmux
 
   reg:
     maxItems: 1
-- 
2.53.0

