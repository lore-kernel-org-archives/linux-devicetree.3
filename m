Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498953FD122
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472599; cv=none; b=jpiqV/6z13Ok/5uEuz21eFc3tCdNtP5EUudhNq6XapZXKEXcTHU+9UqE1OmeR9YyIf/64zOTjqBIUqFk0B7InSt994sacfrtS8fitACunGUDgYlF1XbplQ9+qiWUQRbmPAy11HhWyc6LviwEwCYI3vCTJjLvytnVu0lonPqr4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472599; c=relaxed/simple;
	bh=6AV0nIhgZ8zQkjouvyZf3fqFVoDFcv/rGTOI4S00IJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXu8FFbql1oY8EP0oZvxtq5iINCA9u/ApPmwV8+e4qmV7P8HQf7zhjWMzV757fO40MiBvGZxeds4jfyX2Y6bUCcxWUB8vUBjTfiXTRHjM44kkziGRusO6qYjTnwUIvIcLNpIjZEpVE/XLCB7DM9usQZYcOIBHfIYODCUgIqjlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMssYIAu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMssYIAu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8424b00710aso1997069b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472597; x=1781077397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjWZny3fo/wBnNwX/9+lDVbtn9cYqFM4uHEPeKu4K6A=;
        b=WMssYIAugVVbSitRDEAwKKnpPjHIdWpYqQ5yuyD95WM0jgAhZCr1IXQey8m7XZ75RA
         RGH8Tq0DYRZJpJqVSMno5uP/MW72HnI3KoNMW3mUXE3/UO33I6itOAoMHhVI2m+yERtc
         2Po6/VwFyp9D0z6CiIFcCPvx8xK5BTAlNyljrBXm6iDHSj1KRPpHTCFppoxys7M2zUwR
         Imta7ovwKPw9wbn0VyXs2gaUKUDWHCjgkiEA+Cm1rFOdR2B29mubKVbBq3/LjJN6B/d4
         wJJ7B/t+1e+p1tbrcEqRnDTjP6KYEu0FWbKZNjanZ8lf8mB0GFoVPoSByG23CvVLXObj
         gzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472597; x=1781077397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JjWZny3fo/wBnNwX/9+lDVbtn9cYqFM4uHEPeKu4K6A=;
        b=cGB92qo6jso+qv76iAV9Z1HkaORvkJ70oLLt7V5t6XR8Q+rPWcTb1RAPyCglFvVT2O
         ynp28lNZenCB8A08khd95eio2eONZ003OreW72XQWXiejHvOGCFNsOHHvZlxCYkOkLD+
         0tu9jIPV8vflNtnozXf0bs7AdBWt1IHspAP8wN+1OyKjsfNHrAiMMGuQmMwyxAG4TPVV
         fiFvlh5YR4QS0/Qn2Evg9lkg6+7/wJKQ86CNHel7+Ar2PKUup3pkzGv5Nhl4dT1U/Teo
         kUOerlp+6Y2O0eO+gLMQlKhG5BBVbpHrVMiyQeZOvCWKnwfKPm+pTyXKQRazM4D2JHJo
         6+IA==
X-Forwarded-Encrypted: i=1; AFNElJ8z4ql9Q8ejlWk+e2gXyqOJKJNscjWctQXJIxh+/rRKLdQi93a+etgbAJwiy0K/l2z20Vl9RLqO1zUv@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPCD4fleWlAO7jBF8CJR96LZ2CGUR21IMhL8b7w4Chi8hXMMm
	QIzIt/UfeP9W/XWAqALE8Q9bf6bly45ryRI2bqGDU+UDmlDdFMsFsuz9
X-Gm-Gg: Acq92OETBrfhMTBJJEiWZwIfzLECeEzk8uFsd6q1viV/toDLQErgExRHHbJu99zaAhT
	AA6xDDXsEv/zWisbLN1J6fcf02kJdw7BGPy8L6oGbu4eeM0BTK30dEpvTWnStUKC2NGMWwEUtcm
	jhhBKbTXFkdq39OFHtdfOQrF89VKoFcnxlPfcfZFZXlQetDU2bWAygyK03PeGwKTRQbHs70a3IA
	/t0SrcAsseiQoQcp4DYiOk0oYDZdOovmK6kaWlaeNFHRf4iK7fKDlWSuktPFy1OgcMncVtJrram
	uwz3NCH+n6WiXMDFq5qtxCJrwkhgbRllCPlUjE8pTaSY2XyWJAa5iTKIwhNHpIVSChf3OYFr/Ch
	s1b0TVFZezh6Slho5M0iLjWFPRNMyYaUMmSW0bXnuNmwa2tIvApA6MyhJPX1ZStAlBz54I7KWve
	PZtLoyFikROckCiZ7KuwbiyfptDsOQc55KAHq65gvjJSUbmWivwtCWqdcLfKO0mWMPn/j2Thwiw
	Gu3BqVNezR7i8lumr1LXVxjsbpGeggFCd8yVIxTIhILc5ho8ZBRa0YmHxoIfBMR
X-Received: by 2002:a05:6a00:288c:b0:842:6e9f:9cd with SMTP id d2e1a72fcca58-84284fafa22mr2316123b3a.49.1780472597647;
        Wed, 03 Jun 2026 00:43:17 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:17 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Wed,  3 Jun 2026 17:12:17 +0930
Message-ID: <20260603074222.593243-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..3e3b4481724f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -193,6 +193,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3

