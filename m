Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B611343F08D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537320; cv=none; b=Ct87Smm/ezjLFR4Le4g7aGu5hdF9cPpzN9F29f3b/no1GvnqsEKRVcVJ60f57ybxgwH41KDF3TfWdI3ATcmpZQfjEOBxyUE33qaP98Iwp0evR1Cyy0u+BM3kx+MYtmSNHD5zytnKAWM+mqObZn2BBKK/NaCfHHcKnRJeSbe1Pn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537320; c=relaxed/simple;
	bh=c1YB0KNeTCJNGX5C2Fy97yLMaIYSSlF08a0kpFKvFTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clfj0lX4+dVreamVQT+l70J9AnIAoaoIQdqZvHffB+OQRXGQX5VErbwvDwIOayihzLbPZATOu1i4fSi2hTeLlF+95qOvJu6/JxOc1lH72KOue2PNAKJEYw8CCdZL2N+eTBLGKNggqF+OzvP8E78QEMdX0XdF5eK2e/rlMReb6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=i/mNyQyI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="i/mNyQyI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495590dde14so10926275e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537317; x=1787142117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCdL4VbOsSqHHyMYXFoVto3PKZeUgpsQP3ESoT9xVbU=;
        b=i/mNyQyIznwo+gVMUVz4aGvNco4H6baVSbZmgrj/T5yhkLBfkUrCZChRY3/KbmHxsR
         IuKb3d4DPwSAbIqmaL1iB4qRmNd5zagsYddKX6730zNdH+uNDWIWhSJspJKTaQCbEw8U
         BKzi5QOIexE1aeMTIyT+WhFKP+Z3FNojDyLjsSR9YhQ7ZayHhVXaorueGvOeXJNREHVH
         Js4ea8Vub3lqgN5jL54z7hPHrzeN/LZ55UKeH3qBboIxm34TFhEOu4uYOEJzj99C3jCK
         l9OO1yq1dFk6eGX4xYXuqLJF88entJBSv5HeoW7Y0Hc7OuIIl+KxTKOig32f+rcISEl5
         ySdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537317; x=1787142117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCdL4VbOsSqHHyMYXFoVto3PKZeUgpsQP3ESoT9xVbU=;
        b=etAaNLgsVHBYbqaqiQVwdKALf/2IdB+DqPPj6nXY1Kql4BBtRfOOZU7mhTTN8G3egC
         5duKmODzrP5jgTVachqdI4muiGVa1kZcooph16ETMRNIUQmbarkQirp+KySeKHfQ6kEI
         hUwCUZlCc/X12k7H+XnJWfjvPPYZYIj446yllsTVYzVlIGKZZf6wPoXdT2K+DTtBk4nr
         f8vNTzqR7zFcGMC6ddKKfWlFljSyY2uqIUTsbCyMREVj5KUUmk82o+lcSPxYikQKIc3/
         3JeYOFAaPD79IS30vScR8txVAVte0ORCpEGO/IFs4zdgKGrkfq3NgzoPiuQBs8B9K7wW
         hL9Q==
X-Gm-Message-State: AOJu0YwftKhFnt+5mKX15Kgvd53Lk2lYPcCcq01I3X7AZCFGEKMm82dG
	iK8ENLS3LZ3SkOnXFHmMyumd5c/QuhVGyF+c589o70xyPK1oG5G6yBYomj9OcPb9pbesCZAJKFT
	gPbBEZdjHnpNDUmCzv5SY6rjF7QyovG5JfKKnjgYixK2XZBRxldhXoSZH5JlApihcGtvI/jm26V
	dh6Y497QF2gdl3Y8BEbYWwFPE6AAE0Q2iv+krmL+ge/LePs2bTEnM8N8M=
X-Gm-Gg: AR+sD13uHEmP0ZIJXyrW5fH+PHfppwHUrOVepHGjxSGu/t0ZPRfYuNUb4c3Y4wvfBbN
	7N/7t3g3t9A+Gme5B71xvgBIniv28yF0mTb+2siqx/SOrGtHJ3j5yFRVO5jkofwZpLPIX+tFeWs
	pBsMQT84zGLEzrWCQD1oomamU8euKND7ugRoCxWl0ndXgdxtXJW7zTvdWovH1kcl56qIZ5JOC/+
	SrV06D5mMpdQSs/yVfF8erYiSY3Hgb4bfY66iuPRCWPa4ibY4s8gPc81+CpJvif1r1upb4zwfdU
	I1qCQIHK49NQhJ6KQDXAPSIHIp9V3LxfP65Zy4jVcFvJrj3M8JvHhKekGN7/Zmhr7AE6nR15lAv
	XUHT8wFtb3HiWJWWgT2IGOJObqhdI51hqGvD2lZESpM1MieuEfWHiIc7k6lyP5eFBIMAZWYj8kA
	kFrDgFn8BbqqOg39gx0WkdCsKM9ubujHoYPMCEfCl/WWv6ePqW/q34SqjXgXb8htfSTb6qLVire
	nMP8R9EnJyB
X-Received: by 2002:a05:600c:8b52:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4997c147d7emr72358545e9.14.1786537316768;
        Wed, 12 Aug 2026 05:21:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:21:56 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Date: Wed, 12 Aug 2026 20:21:29 +0800
Message-ID: <20260812122131.1534906-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for RISC-V Worlds ISA extensions
(Smwid, Smlwidlist, Smlwid, Smwiddeleg, Sswid) and
enforce their architectural dependency rules in the
schema.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Add extension dependency rules
- Fix alphabetical order
---
 .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..0408d1116527 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smlwid
+          description: |
+            The standard Smlwid extension for M-mode control of lower
+            privilege World ID via the mlwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
+        - const: smlwidlist
+          description: |
+            The standard Smlwidlist extension for M-mode control of lower
+            privilege World IDs via the mlwidlist CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -199,6 +211,17 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: smwid
+          description: |
+            The standard Smwid extension for M-mode World ID control via the
+            mwid CSR as ratified at commit TBD ("TBD") of riscv-worlds.
+
+        - const: smwiddeleg
+          description: |
+            The standard Smwiddeleg extension for M-mode delegation of lower
+            privilege World ID control to S-mode via the mwiddeleg CSR, as
+            ratified at commit TBD ("TBD") of riscv-worlds.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
@@ -262,6 +285,12 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: sswid
+          description: |
+            The standard Sswid extension for S-mode control of lower
+            privilege World IDs via the slwid CSR as ratified at commit
+            TBD ("TBD") of riscv-worlds.
+
         - const: supm
           description: |
             The standard Supm extension for pointer masking support in user
@@ -924,6 +953,30 @@ properties:
         then:
           contains:
             const: b
+      # Smlwidlist depends on Smwid and Smlwid
+      - if:
+          contains:
+            const: smlwidlist
+        then:
+          allOf:
+            - contains:
+                const: smwid
+            - contains:
+                const: smlwid
+      # Smwiddeleg depends on Smlwid
+      - if:
+          contains:
+            const: smwiddeleg
+        then:
+          contains:
+            const: smlwid
+      # Sswid depends on Smwiddeleg
+      - if:
+          contains:
+            const: sswid
+        then:
+          contains:
+            const: smwiddeleg
       # Supm depends on Smnpm or Ssnpm
       - if:
           contains:
-- 
2.43.7

