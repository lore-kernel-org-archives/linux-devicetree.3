Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805050;
	b=SLJ/DlP7tu0+2gWMCbmO+z7o2VU/5ngIIFzALLA4ixmAe/y4o1pEEiIaV+ThQgbkYUaO
	 D25U7CVlTpsG5szxrZrUfifSoYNLGakEbt/8F3ZcivxL/mdhEVocwkZCTMuXS7ocvqh4p
	 TTWR7VnRC84BqDhVdini7h9D5ZDNXn7yUBAvPzEtpXfwmqB4lsG5H2cm1rSkGHJfdyH2O
	 7JODcRhwfjVJa+iHE3QqS6y7QCy8pJ7YpCcyF9FCdKQMlcokDMVlHZdqkIPvzxakTNzpG
	 Bb/M2AbSHAYD8huZ29YDGQ1wNvKnAevOPQbo70vAsP4timCixVWgDLjhyt/+PUq1dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805050;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dBybakSwm/RtPPQ+xqzsTnu8jWe0Jo3xuf/k3blyQq0=;
	b=S4VRR7PH4jKbQhCTbjRThCESTT4oQFJtBUIGJ9QAKu6GpXBwCQEV6eECtAU/Pr38mVQf
	 s212qSZN0bx5e2OywxsYANEu+t3zFiJWuP5zlH5iH7cG5tXRsGpOa21IyVtJe2o43v0np
	 oydV3lp65O2AQIFvCDixEA6YDQTwULIttpY3IaNZB/EvDUu0vw+PVerCLld+W93KKGr6z
	 0FiX6Ki6wiqwHm5Oiz4hl8IMIg5D/pkDYw5iJ2dUFepQ4tI540k8jQqI56ruVitEXBDxa
	 a8E5vPPKnkYrcNJSj54P+rUKooAsMJax2DoRJ3cvkedWSWctgiQqgYX7w9Bt9eDiW+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwojh4Ro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3A606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwojh4Ro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8081F00919;
	Wed,  4 Nov 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793805050;
	bh=dBybakSwm/RtPPQ+xqzsTnu8jWe0Jo3xuf/k3blyQq0=;
	h=From:To:Cc:Subject:Date;
	b=hwojh4Ro4xQV/kUVijxZ3qWF7+6N6Edn6BGAJJuPIZQ4krxRzmy5qiA7oX3v2zcpe
	 oXdcPiUINhh+YjMG6j7j/VOkQgE4xNu8r6AZPWsHBvwZFAXWPouSfqKgRUxhSpnZFU
	 fONQDwLHNzbTiw0X1K+GOo/FZHDBOg4Ba6r5kx07gZpz6RWOq7BtUtGeJJzNR7O2Vi
	 nMof3pexU3sfZSdOJNLy6uHLdQdsUqGwQrdwwjtwJqHRS/k+QFflWiU+Xo1d35s6xO
	 sZoqkZZ88lECdP/efXR6/j2zNNwGp0S/FgU/eHu6F7gmvUfu3PZBbs2o8kcFU2ddD1
	 yFpsnmXO7cG+A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] dt-bindings: arm: vexpress-config: Drop ineffective label limits
Date: Wed,  4 Nov 2026 15:10:42 +0000
Message-ID: <20261104151042.2776368-1-sudeep.holla@kernel.org>
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

v1->v2:
	- Mark label as available with maxItems constraint removed.
	- Link to v1: https://lore.kernel.org/all/20261104144456.2763775-1-sudeep.holla@kernel.org

 .../devicetree/bindings/arm/vexpress-config.yaml  | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
index b04e8e052181..70b13df12a4b 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
@@ -154,8 +154,7 @@ additionalProperties: false
           - const: 2
           - description: device number
 
-      label:
-        maxItems: 1
+      label: true
 
     unevaluatedProperties: false
     required:
@@ -175,8 +174,7 @@ additionalProperties: false
           - const: 3
           - description: device number
 
-      label:
-        maxItems: 1
+      label: true
 
     additionalProperties: false
     required:
@@ -196,8 +194,7 @@ additionalProperties: false
           - const: 4
           - description: device number
 
-      label:
-        maxItems: 1
+      label: true
 
     additionalProperties: false
     required:
@@ -235,8 +232,7 @@ additionalProperties: false
           - const: 12
           - description: device number
 
-      label:
-        maxItems: 1
+      label: true
 
     additionalProperties: false
     required:
@@ -262,8 +258,7 @@ additionalProperties: false
               - const: 13
               - description: second device number
 
-      label:
-        maxItems: 1
+      label: true
 
     additionalProperties: false
     required:
-- 
2.43.0

