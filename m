Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803509;
	b=D4AlDl+SNyvX6IouI1Dfm0nVZTAV4r5UYCduIHlQrx8eHnZBD3WZe4l148oJFeB707RU
	 JKgQh9fCrjomYKyjSCIcv3qIaPNfuTJWRiA2uKyH0WIhN8LJXsa5VETCo0XkMCDsV/9GJ
	 +dqeRHZkhX8mXe/CrU90aM2U39bXDCeMPO0X5dYYsLV2JLib/RuBnP0HqgdTx6QSk7+2V
	 rfORmkp71mlXyg4M0vp99o6k+x3LNqkEtK8y8QbWpeP+jUuyR5Fi3rd61O3Ob4ij1mft2
	 wyOeSBv75fa1X8MyaKl3rNyR3BT44grXHIo0ighKKEttXKtNMuxsEA+uYI65mFZ4/vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803509;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V8tl/C1xvp73xz2PPMZ+4jNrAhtNhN4yZsTcaMqc7sE=;
	b=OMkOGz6oK9Xp1sLLwEgfFkVQwVAI799FtGjRlb7+sueKXgft8HRkPx1kurhiVBAnLWRe
	 IU4N0Pc0ox3Zigq3MqJtuOgZvmbZqjDMJkpIPXg2niQFqNgKnzjCKE/EQ1y+wYPnx0RHE
	 vjwQ/YtJFtbam7EMs5HhqO9bl/Yo033DUGfMLvkio0McNO8r+jRCWtrRSGsGYLMHO35wH
	 My9y7J2pWpsGd5R+obn5KCJmdCtCPJuovo+1eVferF7KTAON+ft6/8d2oML35jEUyvrTo
	 wtjloeE9JpouClX5Y2Ar9P+FE0IZBiAR322e/WN9hMYRR0iFwMTjT+4IAIvCQgrxIxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzVQBnJ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1450D606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YzVQBnJ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A540E1F00919;
	Wed,  4 Nov 2026 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803508;
	bh=V8tl/C1xvp73xz2PPMZ+4jNrAhtNhN4yZsTcaMqc7sE=;
	h=From:To:Cc:Subject:Date;
	b=YzVQBnJ7bm4CIQrS0DiMBmPlN+jRk9CO3Kfq8XINfIlJ5XY4LTfYRebJeIwVPCl8c
	 9x5/P95GCXl1QWlqgJS/YKl2BzvfgQmdRyR4hSE56pi/rWw1J/MCSGTaTvbjccn3+6
	 4ieQ5//YIfIpSSd0jzVyXWnE8NCzYRRHAr586J1ZTRdlQ7fREnHmpWwzEF6jxzkX6I
	 y4sTvaeIFoJ81j1hjH07dIke9tteyhzFeVHnlxrJYch1zqqfr0wQeAQ0Oh+WfKCjvO
	 NvMSDCjA/3Oa3C0Qf4hIP0qHk/0cJofniZmt0MgaD10iUtxcd8OVI/vBzetCf04aj4
	 aaurmBdYRo19Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] dt-bindings: arm: vexpress-config: Drop ineffective label limits
Date: Wed,  4 Nov 2026 14:44:56 +0000
Message-ID: <20261104144456.2763775-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core Devicetree schema defines label as a scalar string. The
vexpress-config regulator, amp, temp, power and energy child schemas
apply maxItems: 1 to label. This keyword constrains arrays and has no
effect on a string value.

Remove these ineffective constraints from the child schemas.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3b655691-26dd-4398-a647-eb878395b929
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .../devicetree/bindings/arm/vexpress-config.yaml  | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index b04e8e052181..2d4eff19292b 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -154,9 +154,6 @@ additionalProperties: false
           - const: 2
           - description: device number
 
-      label:
-        maxItems: 1
-
     unevaluatedProperties: false
     required:
       - compatible
@@ -175,9 +172,6 @@ additionalProperties: false
           - const: 3
           - description: device number
 
-      label:
-        maxItems: 1
-
     additionalProperties: false
     required:
       - compatible
@@ -196,9 +190,6 @@ additionalProperties: false
           - const: 4
           - description: device number
 
-      label:
-        maxItems: 1
-
     additionalProperties: false
     required:
       - compatible
@@ -235,9 +226,6 @@ additionalProperties: false
           - const: 12
           - description: device number
 
-      label:
-        maxItems: 1
-
     additionalProperties: false
     required:
       - compatible
@@ -262,9 +250,6 @@ additionalProperties: false
               - const: 13
               - description: second device number
 
-      label:
-        maxItems: 1
-
     additionalProperties: false
     required:
       - compatible
-- 
2.43.0

