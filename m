Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EF33F5BA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295738; cv=none; b=ZtKK7cTFFxjNdTzF6HZneaiPgodWbRFtd4OWlRCEDk+ru+2Y1fol0d5oeoAbur1aEwt65SfFJOfIvoOe94x06h8tnxuK3HRx8AS3DZ+q23Ep2MfOsSybOnHZSkGUGs0trN0Ypq88qGmPc7BqoKNWMwofq5mQMqgcF+892a9R+kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295738; c=relaxed/simple;
	bh=aazUhzosps74bp+FHeyGkaRs4w6WOb6kN+Z/GPgrhrw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jM9cXfKkfYhAkvay2CqUE5lOL8jPkf6pNHqrsIPZ3jZj5FxibDJf4quUYaAluU7EHbhEUuhkaDp/OqhxS0rO51NnykOoKlzalxuk7EdZ06Y4s5PP1D11ZhcOCVs0UxvQ2qzy+5MDxhBpHo2or6gdrnLhHr3lPV+/Denomf1lfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv1fSwL6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv1fSwL6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bd266f6fc0so25638005ad.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295737; x=1779900537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJjLkaN040gJM743wyOUNlXR9jXpKNIpBwwyE5wEZQs=;
        b=Rv1fSwL6CLk8kJaAhYcqmoUAn1uvkGNz88ghv9ku8ew3Pd9/EMlFBm6xumLv2ldvUx
         CT9UL2qBJExujaAJhBciTHJerKOim6b7ghj0OxBSnI6/Iy8pfskXVXDtxU8YrsQheHad
         v1JVQm38vQ10MqpAP/wdL0WJcI/PJsU2ve8xFJ8BVlI1o+5qJEd9gkrT9Gv37sg4gRMg
         IVP8Rr7ocUDVZsE90OUpVIVP1WI1HtHR3cy6cfvnxX1PDvUZ12dt1j4cKRU2QZyL8Jqb
         aBnAmuSOzFlamHw6UJn48tQgOo+BafXu9kHOqfnSEAifoyYRIoF871X5w1Jlyxzgb7sy
         MMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295737; x=1779900537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJjLkaN040gJM743wyOUNlXR9jXpKNIpBwwyE5wEZQs=;
        b=IrSEXdYV7DoCABs0Xstv5CjLfxXNiN8AxY9ahbDPdLVi2pkjKepqrEfCKkGdIP0aRq
         4XMeWXkQgpPd1bm3IERQn641jsBJmBrSa9cqxw5bGo6BR/18CDNhhFGfBpsKvN76EtMr
         56ZuLxq9ngfIpasYfdq1lHwrSSJwKgN6OiMk/gc5ssTFT+3Ws9bw9KzBP1OeFuljVrn1
         uEEsyobHDOzt9Z3dqlNT7lwP3F+BY+rMhCJfaSyE9JYDhgK/apJKG3Dt7LLJOUH9aKv5
         /ZCxVzsYIIHOlmao4JT2timRDckij2Cvn2eC9y7Ymfl+AIpTT5QAZ5BUqXqDy954xSjV
         xi7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/s9fVM5DNojLSX9bRvtIO72n0vpIygoZgU/VueI85xxf3fX2YuFiGPCJ9V4zN5r09Hwe0+hcrtH1tT@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLD1hFn/8NKCz0KXHV4PsoiJn+seJBqCbGjGs95YGp6hfs0az
	Yl+3V8jktDQuscwlc9p8qWs7iVN8mlnMBKwxxodRILlgGFIB2zU+Lzd2
X-Gm-Gg: Acq92OEgp54+hv7zJoY9Bgzp0Rxe3dZEe4+KdbQUac4W3N6WaHLvSAel5sgahgPjCou
	Ucp4NGpMp22vodzjKXPGYof10nB6nVLjeww9Bxp6xFDCGqffh30+VckhzHAERusNlcMCJD/f3rB
	p1PsiAuHrs6Ia9aosPPJQA1zLlmSMMgfs40v0Jv8KDgtBHBI10gElDp9AljMLmCNrAWjmLC9KOk
	qyQMrDfds2DPTTRz7spdxKYslhQ7GqHN+WJXyEUb3g8yRqwy49GA2Myeufy6FZ56JZf0yDDnS5q
	x5QjBZCLxPCwdvx78DfOqPcQXiTuUD00Tn9RiERpOFn643T5yuY8VguvgVlP/N23sO+TfnMbyVE
	ktzN7jXuppFSWfQL4JR+X+i3x/GDujEJ9Ak878yZFGuN4AcLGe9T7aKdfoRPvCEiGz2ihvOyph8
	G7YTR242u2JtUAJ1rgEt1e8RsaKn94Ksdifr5govZQ8GE5NpKU+OV1iLyju9P5V9YUAwX/a+8G6
	NfkjCazQPe8j9fTuDu5ZaBSMREivoUi/MkviA==
X-Received: by 2002:a17:902:7892:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bd7e86c6b1mr195605555ad.2.1779295736657;
        Wed, 20 May 2026 09:48:56 -0700 (PDT)
Received: from rohaniyaa-Vivobook-ASUSLaptop.. ([2409:40c2:103b:4191:71f1:6e4:a162:9164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2be2f604fdfsm87342575ad.18.2026.05.20.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:48:56 -0700 (PDT)
From: Rohan Mithari <rohanmithari09@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peng.hao2@zte.com.cn,
	Rohan Mithari <rohanmithari09@gmail.com>
Subject: [PATCH] dt-bindings: misc: add YAML binding for qemu,pvpanic-mmio
Date: Wed, 20 May 2026 22:18:45 +0530
Message-Id: <20260520164846.637522-1-rohanmithari09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
---
 .../bindings/misc/qemu,pvpanic-mmio.yaml      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml

diff --git a/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml b/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml
new file mode 100644
index 000000000000..22d1333f9c2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/qemu,pvpanic-mmio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QEMU PVPANIC MMIO device
+
+description:
+  QEMU provides a pvpanic MMIO interface for guest panic notification.
+
+maintainers:
+  - Peng Hao <peng.hao2@zte.com.cn>
+
+properties:
+  compatible:
+    const: qemu,pvpanic-mmio
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pvpanic@9060000 {
+      compatible = "qemu,pvpanic-mmio";
+      reg = <0x0 0x9060000 0x0 0x2>;
+    };
\ No newline at end of file
-- 
2.34.1

