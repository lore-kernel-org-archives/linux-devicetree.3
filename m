Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E94A8A1B
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637234; cv=none; b=o9VWGBx6vRzdBidCfRFkmo5ZRi7iA+jZNzuDqfpIc7HM8+FErVXho79jwpk8eSyzd/yMnmYpV84ckNmTSCBaANxKOu5zC5YZv4Cph/PFCzawwEQydzPNpyGLnQWflwHXP+Hbzx9muvAtMDpuGMdtdzponh90s594OHfXrn2UAkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637234; c=relaxed/simple;
	bh=YI6mYQGirVreALgiPkUH+iKfGlVPpC8XhF4hx81/+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wq7zz/7mfgaIol/7wJ5FQ7eBAgXyb4EuDjk8drc/W/CV+rAXmMuXUkVkY3NqbPLuzt+0gZB9FzS+6/0pbntmn++vnHHTxCZjM+wuoEZLmcbcbZ9aVlN6fOSWAiOQBiy42E0laq1hhRjagjw+TtdCl7IOQWOGzvvQBfihcJWE3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL7KjO34; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL7KjO34"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so7618085e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637231; x=1792242031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=aL7KjO34npcImH910kGHcjIje8NNee8QhxOy5DJ2FK6MawYm0c9ufkGfir8RD2l5QH
         Q7T6AxQHcsFZ7dA0kN7Z3xjuNI3F0k9nAKCa4pczInTac/Tazo+rLGK2UhP0K21akVUo
         9jN7TYCX5gbAPOhE7PIwS2VFlbVLgiQpkgROvOoW8crWKTTF2fcbsI2uyPNMlvw2Add8
         GFx013b+KMRTk9s2MXC4Fyn5ZZcvTZI0ReIesPJldrDfIyTgPqTsDsdh5ohXdmGq6mcc
         sCjnDbSBSgJuyyEo0bfFopdmSC5azrSAmh4mI1K9yd3W4KNxeneBuMkYgLQyhBCev1+u
         gTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637231; x=1792242031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8I8FDQ3AAKgDRdCnVtdodqX3Hu1DpXHDVZdy8LmKcE=;
        b=YU29LGRnUujSp2dhIFkftSVDMblqxWuGafN7Ll4Anlt5pySwlpaatPEsSkEg5FDlV5
         TVZTyBU0ZryC/83/gX7b/XyY1IAgCX1QwnMyT3sYrV2uRFaO+9ANnp5+fTdN40lKkVUB
         E9DyKJeagagnup9vmXAtbtFirQktAtiI2xSK5b2BwzdHcy1u2DMXYIKiy6ZRrHeBDunV
         XLRYehENdCHUdjKVWOTryQoXTTNs93ABVmq5xEuaCiT5yi+Ig4FGeqyE9I8eSh8r4cO7
         KhcHBBgis2PY1vxLfayEvnp6ARvJaEiW/4z9xpaePpRA4qTdTWCAxC4S7TRXomUnuE2Y
         i3cw==
X-Gm-Message-State: AFq9FYK/8lrWCF55lEumBnuvK93aiwe5GluelzobMwrN0NLwE6ekFY8s
	PRZ1dFBuoCgJ+nZJVpg8BdIbrizcQNv0xMVZ6yO8xOurK/Od+vdtP2E6
X-Gm-Gg: AYBFou3osoIKT8HQDZtxiCmlmj7WJ3W3SoM9+Exk0Niky+s71LH9V9wIxCdX3Ahbs16
	DLwfJqId5a/CEPqdGvuDNyB0ZyUUG9LkcgYaHrWg7lj42V/M2QBAzBU2AxqAPL+CZH1EeVwA2g8
	BUF2M15ldS5P69gRNYNP21Oe41BB1nZJCfGidy0/puCMaBSRJgkUiL8PzwNnVFURAVRQRyp2/7m
	BXYEwkir7UpsSNjVY3fjz8eCwFZOFtF+2zzBtbkcEWdbBUONLWU+ShLxdgKrGfXWecUoFciWfiW
	namST1ni5myI+cxrsTmaR+gofNuh4RH3QbmWbF71a3mkmfqUmnQeue3eKdtKUQmlurA42RBhzZ1
	YGnhSK1VUNYApZIxjjbhu5LkqfgydQ1NlrA/ZKPgEzzroXvhAYx19Xg6SDf+bzCLjYIsw22C7ZN
	TeywraPwXc1elxE0GKSQE0zQcv3lhfetsZBbe9T9Inq5DFE3HoM5EXcR4ttHiDlsznolJPJsc/H
	Qb4ad0BfJ3IJBw0iUGI4QqFUH+EYWkKObVJyw5vQJ4gaPHxKMLd/zDdWK4GfsEjm8TSm6oE7qkJ
	939GVF14citsq4Pz486BhBpagl91usYy1NsMu6kpBOEODcs/A+tq7fyDEZ3xfA==
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr86641875e9.14.1791637230750;
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:30 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
Date: Sat, 10 Oct 2026 13:59:39 +0100
Message-ID: <20261010130024.177503-2-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the observed interconnect deadlock workaround separately from
the ARM implementation. This property and API remain an RFC requiring
ARM and DT review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ff..0295846cde 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -176,6 +176,15 @@ properties:
     description: enable ECC protection on the L2 cache
     type: boolean
 
+  zte,l2c-io-read-lock:
+    description: On the ZTE zx279128s, a CPU read from a PCIe device that is
+      still outstanding when an L2C-310 range or sync operation starts hangs
+      the interconnect. This property makes the L2C-310 maintenance operations
+      take a lock that the drivers of such devices also take around their
+      register reads. Valid only when the arm,pl310-cache compatible string
+      is used.
+    type: boolean
+
   arm,outer-sync-disable:
     description: disable the outer sync operation on the L2 cache.
       Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
-- 
2.55.0

