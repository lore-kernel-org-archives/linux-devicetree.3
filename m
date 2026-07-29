Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956354D2ED5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343188; cv=none; b=hyG2gbzG3BTcbTTqcbKsljgl33Kg5RTTgJiD5VaCIT3rVUb7eQPaqCpUdWVRzJIpS7xWkHK8HUYvCWtQ2Z5mvqfYPqlirbj0JBrYZ2mPrY5l051gN6pWSRHo7ng7AemAw7pEca29x+3tLaDESsAqlIXceHNC0JyQuuY/TTfGJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343188; c=relaxed/simple;
	bh=P9K5XfBaIRh3PRPhPATQN9LhXlUlQ1vWfNXGvrqOGlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szxMEtq+KgELRlmLuBgm7DxZy7FZ5Z6NBwEW8WWd7R5Q3elEUCqTq//d46EEK/w/zq7Hl3x8T9wEGfUUCjSVWbKgZiJ/WVSWkCMRtqgQTLCqAPNDLkJOJ9A4utfyiI9fgA9s6kCUnv9CtpO4VpxNFHpylLryFyZKtgV+t/DN1Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mvNKPEaG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mvNKPEaG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so341625e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343174; x=1785947974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y44tW4s5PjOJOmSGtdgX1zAMpKkbDdnk9Dva/9jZSYs=;
        b=mvNKPEaG2KG/sO0GiZjqqRCPYI2KmoR9z7zhceWxghxxn6EVQYvw9EyfFU4utHoi/Q
         d/VMzP3gYU0rVCH9KjHyUh/jhr7VMezDX/eo7B4i99EL6RS9FuEaM73o447OhAwy1m+c
         2n9HnlDciieMyvypk08pXMAZ7uVuVaGhqC2G+7oXr0t1kecsesS10pU0lgCW9ceYiEs0
         guhdA1bqMOelz+ZD6tVRnSPqFi5Jba21XVPw/CdHd6/ibwZLzDnxxULB5JMXKMUzquIc
         eB1CehRvKXtbNivE1NgrN2F7ZhRv3qDddLMuPnW9i4VbPJ6e80Kdj/kIvYu+KQSedylM
         EMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343174; x=1785947974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y44tW4s5PjOJOmSGtdgX1zAMpKkbDdnk9Dva/9jZSYs=;
        b=CkcWcFb2nC+QJcGPOD/oRCl99GkQytxG01+h+2xRl6OO/5v6+3CDxgWBZR7hvNaeiC
         IbmRgMn2LHrmdilP+emt/fCdABEwFXeHcYiWb35Al0a/VEjA2ZhJgc0TNmuxF3/UyO5d
         c43RdC52XMY+jZtgHnf5n3U01LssbpJL9yt06YLRaxFp5CtO0LH+2rdkQuvbM78UYYs1
         FMJzPi+ca5uoGpJQUge3dRbz+pu9imbkr/xE8mmzTtJ0NjpHp/AT4K70x2ihLKb6A05r
         jy6FrPj07dYLfSnbJSZ5VIWu/CzluKWz/Vl5M0QOpevU5lPLhUnY/vWG/An6j7ueoY3O
         jfSw==
X-Gm-Message-State: AOJu0YwnAPm8rSCqs9ky8XJ5KPLemi4mH8j3wLLWjq6H/czjXmvDeRxo
	pxX75Rx/1Mv2i9vOh1CIR9xrQYp0oNjHHBxL/7zGF/mDEk89iK+CIT+RYtmZo7NViJ1HoW8Z2S0
	iT+54uPtZdD4PxMQakCgIUiwt3+bIs6wpqSCtY3f/OATfrPMjAtmz9YVWjRnv+D1SX+aTpq9sh1
	cxvs1+8b1co/8120pRb641xcBWNLUch6dpqJ/mag5bJ2jJRoIjGEw0
X-Gm-Gg: AR+sD10u4LQEn8J7DzU5WxczNXw6VEBIDe3TDZfEY4mgEFk0lkWIKi+v93iQxu5o2fX
	Qkl8YJdDLraGiChk9JlWR+XUk5lv1Tmw0eanIhrDP2q9wN+EAO5r8E59VAagzNl6GPQD4TYHx4j
	mQACMHw9F0odM5NnSEJ/2j1lJBq+djReQ/mp/Zn6+ZjZDmaWCoumf35PsKsfvWYAx9ij0lhoA6C
	QVbRqOO2wX2W/E/SozLawVeyM93+ZGznBGA8gPsZ7wdbe5f0a8oCAwH0nkFApMsLypoCRoZdAJ2
	e5SzqxJncmrSeT8Z6doKhO3bXUW10bOGA4CZvMY80dTCfKHS7LXH9SjYwnHzG1q9IGO6vGCFq8f
	eXXWgw8t1PgCY3B4DWedgblrdau/FcrU1GSPYSquYySbtmJxGaSuja2RV1Z3qFxKeHd52mPoBZK
	rvkkXCTGH4ZphVfO+aSZ0l5ffP+0Aq7i0g9xav2PlbJlEvyebhVgLQoONiBRMGWdwlj1iEdAWWQ
	jlkMVhVDFMjO6xtSR+v6fw=
X-Received: by 2002:a05:600c:5492:b0:496:ca95:42bf with SMTP id 5b1f17b1804b1-497fd303166mr39094775e9.10.1785343174406;
        Wed, 29 Jul 2026 09:39:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:34 -0700 (PDT)
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
	guodong@riscstar.com,
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
Subject: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Date: Thu, 30 Jul 2026 00:39:06 +0800
Message-ID: <20260729163908.249838-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for five RISC-V Worlds ISA extensions
that implement World ID tagging for hardware-enforced
context isolation. Also, add checks for extension
dependency requirements.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..7a57191a0293 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -193,12 +193,35 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
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
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: smwiddeleg
+          description: |
+            The standard Smwiddeleg extension for M-mode delegation of lower
+            privilege World ID control to S-mode via the mwiddeleg CSR, as
+            ratified at commit TBD ("TBD") of riscv-worlds.
+
+        - const: smwid
+          description: |
+            The standard Smwid extension for M-mode World ID control via the
+            mwid CSR as ratified at commit TBD ("TBD") of riscv-worlds.
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

