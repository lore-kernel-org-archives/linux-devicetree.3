Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BD3B19D8
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584079; cv=none; b=d9aba0/fQkRI0lcYuLtBIlmw/tmuUCKWFgifkaIhBMROhZQFeagLPRH20z97vRurhJaL5xl0vHbVhP1VuxBiFOV3JdRwIPskUiEmyAU8OKuCoiaJ05Q6b3z17DS2DfMwpRRm2hKUXeetOmBUqfWJ5TPytBW54DQk8mifFCFQwYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584079; c=relaxed/simple;
	bh=9BjL07tywgebpCTghSzy5YaRuD5Di6e+HAYIHTs1WTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhAO/kP4+GhySHj2mDRZM0/aXHZP7Y2LUe1LVSnpc600CpeGvyWR6bnl/tNfw3eUaj90TtytfrFF6CUlQnuoW+dcqYG+ySROjwGdAx4qf8bWSMJBkoq8PdREoT1UllDBty4J478alZZOUdAxe0WrLhOIt2AdBf5iqwKZkfr9Mdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpxWp6/G; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpxWp6/G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f52af13so566755b3a.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584077; x=1781188877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY+FwvOmIKq0AqGLFd+uu0Ju7LhFArzDov2I7oKwjys=;
        b=hpxWp6/GA1xqsVbVgppg4T8sJqrz+GH1JBT4dPdl1PspQfFwZV6zEUMyM8SV/HeRBY
         BJFp1iC3ySKUgOaWzp+c1vr3YPNcBeU4bBhlPUN/fCb46gVe98TEKyEfvFxaOFd81EFf
         6w/TuK/O/jqxgyai8QcizGKrh1tJDWncOHQyH8QaqDmyz1ZA+pnaFfaSD08BEkDUODsP
         Rq67po8dn51/r4xaJFR21KWa71T6enhvKb2QJcbJsmhno9q3K0M7KZ5+tUxJRA4dUyHh
         98qtas07tjx2hWY58RdMqJ1Xmy/7OZMnUGwtd/pB6b0XRYC+BRLhT6hb6O7wVY6a0tfY
         dUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584077; x=1781188877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LY+FwvOmIKq0AqGLFd+uu0Ju7LhFArzDov2I7oKwjys=;
        b=g/dLUvy797A7LIvBcN2K52UXBwkR2UwD6XRYuxaAtaridG9h8wTizXbv6CoH4TMH2Z
         Y7o9a1B1qvi3YgJofFlP9/qMdyGE++uxIiAOc3oeNhgjsCMDxxCUZy8HnwByZ8iXWJVy
         ndWawBI6vA9b3W75Gvax8irmOooRsrpJvTfiMOTcsiN54VOnTjN7MrLqBmdOkFzBDVol
         JJ7gMDjPI1n/julHr2Qqru0YQS6eBuqrfjOlG5k+ndnUVPxz7XiX0KbTTUa5M7K26/su
         H//RNyHwXM2rRbr+OVPfqZXLuU8O731iCDw4ufESCQse+Cw6Fn6aPCSk1ZeJPs8AR3xj
         1nLA==
X-Forwarded-Encrypted: i=1; AFNElJ+vMEPl+80VyrkoH0KGJvY3xs9oRS3hPyXvyY5VnuX13izj6Iq+MUt3ZQneY1i3aM/0WqaqYg395H11@vger.kernel.org
X-Gm-Message-State: AOJu0Yymhm+Kf8Fq0n2KYI0rTQAhoUXvYUErXGkMbh6Qk4g7AkbbkFZD
	uQDR3CgVjYF74S0r0W262Qf4o0EeGtzDOPBVKRM1sqk6Y6hILx8mUac9
X-Gm-Gg: Acq92OHv+v9cp5SPYL4z5IXT30Tqkp03t4+iU1OQmkreXsO5oqdFXO7ECc5O7MfD8E9
	ri4oS3wCyw4eQVyQOJHfxsmNx/hLjo/myj243DZDEjP9ZKZA7wT86U0u5VzJuaf9Dbnxu92fQgT
	3c8JwGyjHXOsx0/4ClEgkwFmCNmv+CnbIRbPEvaG5I3ZP6o3YkwxRcYxRfRCzjqR5uCTrKPVEGW
	/qHBloe7LGBk0hfzB0OStVdpMCrJL3Lxa5rYGcb2iOddbRRJ2r3jVQp8++NW/8Tq1Jm0s7e0+xP
	hI6WQQXHwXURqorKZ83CHkk1RsNaRisozSk9/Ed7PA5X+TiG8UgVZMBlC64tJDuCQgDgRSKiRTq
	AMc8wsQudo/X0/kRoWMW0M4T0tQHgQC1GLPWHETfMWVs6k3917kscKhZ/jkmwTvEapRGpGpMSVN
	cWbxYp+pRrhdhpA9QuUEkfvsdnEZCiJeVqDFcPWBUV4thCetQdhY976s45ShZv1D7MGOBZR9TKE
	/y02DROQjr/8SpAKphvkgaPGEFPe2bfazMzdvWcdeutGCK3COxFV7S4/YEbTYOA
X-Received: by 2002:a05:6a00:439b:b0:835:cc47:6ff7 with SMTP id d2e1a72fcca58-84284f34484mr8149841b3a.50.1780584077224;
        Thu, 04 Jun 2026 07:41:17 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:16 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Fri,  5 Jun 2026 00:09:51 +0930
Message-ID: <20260604143957.668047-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

