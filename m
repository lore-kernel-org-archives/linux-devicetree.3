Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDC48EC69
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988470; cv=none; b=h+DFmFJMp7uXvfPV3In5oyhi+Jk8GBwWQdu3fOMxH5482Z3mzusnj1xhIFyJGORuGQZD/ACEdGb9/CkNDeO5Pc/fDJWdeSfFMBCxX7S015mh4GVDt2rk6kHyoA2ERPNKaDtf6MfoPwY6PxPa5Birzo/BJ/ImbyYf/MHrHTf630g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988470; c=relaxed/simple;
	bh=zFiwAFdoDDqcAb3ymJ/xbfdcP3hdNR8xkvVRX0o4gLc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gac2r9qKz6yAF55Y+UxoZD6zKdXu6qe5G6sfGS3CkXoSo0Ccdo/CCJ2s/daXiAdMYks+dWekzfcejWV2pRI3O0Loa48Ge3aE1YHzn5eh0uPbnn+3t0cHppILhbrB6aqT6sW1zYUGvd6BZyUieImBF6GMQtMNcqjsNxWpDKvleg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXnxIwLC; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kXnxIwLC"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e635a6002so33149365e9.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988465; x=1790593265; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=;
        b=kXnxIwLCzgVYSPCKNPxUtFri+8ceAdodtZJmbMbw5QcKXtyMXWXJ9C8/Zei2vb06/A
         ETKnZfpRcAFCP+QceuepxPo/vH5louv0Ourw1c0izcBF2KnOBkATKRMb/SG3psP4ELk2
         5lj2awl6BebJ+48l4du4FiJoe7VOj/ssTmaC0PL249DFWx4s1lOPdVy1EUlTZNJMjWS8
         xQDNAQcyDkteudUKN3MvAI7G0lC/1o7Onj+XAwVxEfDDY5DTsbboEapipmafazVGEITD
         L6RN4TGRHmnzj5ilgaCajgwxqjCXcpI7YmZDUyXo9onS/6c3wC9IzIILciYK7zxZ/jFo
         +iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988465; x=1790593265;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcGk9G8S000WArAMLwdOiTGHKXUA8vP6GMN4jNzx1Ic=;
        b=XFLym9LwvGDq9X0UZJTja8+ckjpVwFhv5htipK/t7HKi6EzmRQBF2vVC83R5+bqdFG
         bAxvIn40f+vAy3qwKsj/ka7QPrXsTageBmr5hmF0SfkIwgzVUD+GLwcKKuApe+at5anG
         IqeduF+jQHzzhE5rYD/8dDZDQ+SmYA/RlzeApJSxbeQpTr4GFHDHPJ5iAqH29WFk+6vU
         GLevDvE3A0agb8NeevPKqybx9PBSX/LnZfBA4mcbTI0HqYAC2ttAgH+6ZKGgdPc028Bg
         belfPKw2p9sWo83c7oY72wr9/sP9E+rEP2smU52Ig2l6HldIr9F38LZeFdb66iqabZQB
         W5RA==
X-Forwarded-Encrypted: i=1; AKwUvBzsPAqiUT2n6LYZyZ7s7xBheI6tqojIfWQW5v3zFcwubBq3fdFlLKR7a+3uC38oNRpEcrZTMciiuVJm@vger.kernel.org
X-Gm-Message-State: AFuF++lX7QHLGFpq1LBLjxwVm5gKv/JapqcTAF4B7hE1G7IW6+7xsZ+w
	+pVfKGUkDqV9oaVm27U1DE+c4WIo1sqXHYRv0zXPY5CZjPO5P3JjHU1gSGOFoK5WcY64V+61IZv
	sAgRpbhA7SD9HaCXP+N6Kxg==
X-Received: from wmph41.prod.google.com ([2002:a05:600c:49a9:b0:49e:78cc:d29])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b82:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fce72e040mr109082755e9.35.1789988464458;
 Mon, 21 Sep 2026 04:01:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:49 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-8-vdonnefort@google.com>
Subject: [PATCH v2 7/8] dt-bindings: reserved-memory: Add Arm FF-A lend pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add bindings for the "arm,ffa-lend-pool" reserved-memory CMA pool.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../reserved-memory/arm,ffa-lend-pool.yaml    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
new file mode 100644
index 000000000000..c02d36e1e418
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/arm,ffa-lend-pool.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm FF-A Memory Lend Pool
+
+maintainers:
+  - Vincent Donnefort <vdonnefort@google.com>
+
+description: |
+  When memory is lent to the Secure world via FF-A, CPU speculative accesses
+  from Non-Secure to the lent pages can still occur as long as it retains a
+  cacheable mapping to it.
+
+  Ideally, lent memory would be "no-map", but that would mean giving up MiBs of
+  useful memory. Instead, "arm,ffa-lend-pool" defines a reserved-memory CMA pool
+  to manage unmapping pages prior to lending and restoring them when reclaimed.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: arm,ffa-lend-pool
+
+  no-map: false
+
+required:
+  - compatible
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            ffa_lend: ffa-lend-pool {
+                compatible = "arm,ffa-lend-pool";
+                reusable;
+                size = <0x0 0x4000000>;
+            };
+        };
+    };
-- 
2.55.0.1082.g2b9226bbc0-goog

