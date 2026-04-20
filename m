Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDFC21CC5C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665962; cv=none; b=llSMZm22HZZ6gsx3deOcXuR3DKmZRILs6V59HbtNqubB8atLusWwqWCzY9MFhluZ186Wl/FvNBcNp4177EPcCXB5JxylwZG5vvqUNPpxjBwlUTQRsFVKhXZKPR/EWFVBwRsSKjVk7hUAOChZbohFL6gVotutNuLgNONbIb1WIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665962; c=relaxed/simple;
	bh=NK/KEremqEsg/y4Th6xBx2VTX3iGRFmO8oWMqWtIQTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OqNI4uzCflv/qQmAyxiWM5uGNeAkjZzbVldCBxLuzPFsUky4ZtENI1rPqm35SjvJqOLQJU7fLYBnM7h5OAC89o5TinLiimEkKD7lNZR7D62ZC+zuHS9BEtWiFUGyBt5Derc0iyT9/qNYpheiIGo4+2DQQEqV4LtnDuHOfLFVbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fU/nRDeJ; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fU/nRDeJ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1279eced0b9so3544096c88.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1776665959; x=1777270759; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=diJI/psFLqVLbcfwBRYzBEf9frlX+rsEVwW6L4ZaGBo=;
        b=fU/nRDeJkUWey9zZPekp+0GJU3WCANtCPn6VzXSW2PS6utQAXOFZTWTqSwti9gD4Yw
         3+cj4pqCblHw+yLdlZA1gV4M0dlobQS4f+aNpd4Kq7pGeG4WLoZL2Dj8b25wCRCzZgmT
         IA9sZtTcGHf5YeKC2OKXX/P1jdrMrQIOjvfmIDg1RqlAw2FKPqiZJoDcCTUwdst3Fwz9
         XgRQRt67EmolyXEYgeF+PVtRDHACnH+R8idxAyj2ZKiibKE15vU4loV+eF4BCrNX9L/z
         sUBheLvt8ytuuTfcwWkISN/IIpaRRoAx/fNBfzUB1M0o6rmbD2xufOmxEGtKa6X+a8xn
         6EmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665959; x=1777270759;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diJI/psFLqVLbcfwBRYzBEf9frlX+rsEVwW6L4ZaGBo=;
        b=jcRI1xyAL/QfWF1B00xnYp+wtrQJtXNjepAeNd9LFAqIPV5m+ugBOh+xX847VMOAjp
         lVY65IEKYqN+2WqZAzanU9nIc6QDH5M7e5yCjt3NZfy+GhJLsS01OC4HPX/U8rxWSRUX
         JOTf2kFSmCUAhmOZDIE2CZcZ7oyiCRy55AP8qI5oEwv/pH+8LN+vgUXRMRKbNaNxQIoB
         jLAEW1Fo7Uv0mRUMZR4uGZ5zATwUyKyBPyYNQAKAZIXLQpSLcDQtm+ZhIB890o3m9x6B
         mJ+elUsP+o364BO5RFFKgKZMz65pt/f9/1KBJNATxxlhdWzKrdJP6v7yvR4fytgMrYmg
         oA3g==
X-Forwarded-Encrypted: i=1; AFNElJ958Nu2NTh8Q3Gl4nSSRsKwyV1oHUU+/3Y47CF3TncdeHh2s1o1TpzQjvC8/9RIX50LHF0n09e48boO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8dafoblBgyvlMk23RNy4n4LAWPxh3HxYd3a5sHoQ2cFeCM7l
	CZYr6MZUQ4RsFhMcoamnPrJg2reCftsnxZLNKSp179rqiwtf4Lq9t6vyiqe09ibpwnM=
X-Gm-Gg: AeBDieu6ildcEZek0V05HDBGKUsUBDRt/moYo8ojsY9sbDYKEnqFeyAxgTkD3m3nsnB
	9wKmV54EmTNAwkPcz1gK1F5yguoaFfHtTZcnREGsLfbYnNxWjXWTiLLIAhC07mduTDiUxHEu1k9
	XS9sitFlR+AATuwXqmlRb+bKT5wk9rKxamghyKB6AHwhiliMYH6xFngSEiWEJwI9FtlMSVsdTIq
	HaNbaQxXJ6WtycPUEoi69G3lXaiW6/qXsFqwzQCGVY6ZSJaDdmO4owSG4W9YHPx00ymVUDz0yt4
	f3wS0bnM2S33yCqYW9gswWRpzScvCwviXwSZ+d6loIQX2csUKlrIk4XrUoajkJdqggKgwh9i4y+
	clXMbIRN/m5EqvmdYFehR2ONyABj5PNpAhm4YplV8ZcZR44e7NTv1jcry75LicBVjtAcIOMOElH
	y78Ni1QXOVg3zhe5RwqOMzgWOj2QD3uSdABmSlhlQtwlXJiA==
X-Received: by 2002:a05:7022:628c:b0:12a:8ea4:252 with SMTP id a92af1059eb24-12c73f6d5ffmr6084142c88.4.1776665959137;
        Sun, 19 Apr 2026 23:19:19 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19541880c88.10.2026.04.19.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:19:18 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Sun, 19 Apr 2026 23:18:55 -0700
Subject: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
X-B4-Tracking: v=1; b=H4sIAE7F5WkC/x3MQQqDMBBG4avIrDsQo7Xaq4iLkPzagTbKRIIg3
 t3Q5bd476QEFSR6VycpsiRZY0H9qMh/XFzAEorJGtuZ1gzsvxL3bFnxWzN4lgj2u3J4eofg7Kv
 vGir1ppjl+J/H6bpu8Eli1mkAAAA=
X-Change-ID: 20260409-clintv2-remove-fine-ctr-d5caeda27863
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.3

The counter width can be inferred from the compatible string, making the
explicit "sifive,fine-ctr-bits" property redundant. Remove the property
to simplify the bindings.

Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
Suggested-by: Conor Dooley <conor+dt@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce35fe1ef57@spud/
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 .../devicetree/bindings/timer/sifive,clint.yaml          | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3c16b260db04..051edb1da0d7 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -72,22 +72,6 @@ properties:
     minItems: 1
     maxItems: 4095
 
-  sifive,fine-ctr-bits:
-    maximum: 15
-    description: The width in bits of the fine counter.
-
-if:
-  properties:
-    compatible:
-      contains:
-        const: sifive,clint2
-then:
-  required:
-    - sifive,fine-ctr-bits
-else:
-  properties:
-    sifive,fine-ctr-bits: false
-
 additionalProperties: false
 
 required:

---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260409-clintv2-remove-fine-ctr-d5caeda27863

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>

