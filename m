Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C632BE026
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782494276; cv=none; b=VOutjeQGGPt2+k90OcXt/+jG6upLWSc6NnNdFV1c4MPjhpsOT8Mh5uMy8ZA74R7gJP4OAGIM9ZwKfEaaDEZ2XerzPVNoX1Fx8Cg38Z8Ky5hUL2Q20ITBX+dv5xE7EFtolK5lcG3K6Ez/SrbI6orWqXaxes1G2FuV5ERAVCo9JC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782494276; c=relaxed/simple;
	bh=pnvg2XUVnZoT1ix1EXzp0evT9QUATT3YLRvgI+8ii3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKJeLn05Qj7IlSs7lW0nowvT0IYBZXaIHiXBpZi3d/4DIXFRC+R0DoYg0qN4x+RRPgbBDDLq2Rijz7KQ+QF1cfHhU+VTR9PGlsl1pXd3TySEL2Cm23YKQvR7vwvyxH6EaTUFZBntvTOj32HTNQtyMRKh8hxNmXgkP9dA1jkr6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=RMwkg8eh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="RMwkg8eh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7ee3952ebso14554275ad.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1782494274; x=1783099074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXXXwprYa5oxVM32rQs1jSVn2JdxPWLiLPKrdxYdiuM=;
        b=RMwkg8ehJp1eRuXPIQJNyGY5arTA+v9BsKdqay/MLv+3EsCPNy7c5QgY9NtJphP1Rg
         I0W8CQmEVCBv5S1Z2/BeikxMIzHUQYJeRyLdd7vWmgr0iLi+PKJXINzKwomYUimVOTkc
         gCX1UJTy9c/+oXY93KF+sfgOuhocRcvk5789A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782494274; x=1783099074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXXXwprYa5oxVM32rQs1jSVn2JdxPWLiLPKrdxYdiuM=;
        b=h0tJeHrB9nzU4bdnf2bV/QSDzw6FOl2mR5j08w/W1T0VlpudJP7W0Xzx9CK7BMIq5O
         mMLXAjm4hSzZ/aN5oZPfC6C2GEtxCy0QjQrEcrLEWhjgC9Dkiba+Xa/qrqmBzAaWYznm
         pmeBKwCW+RjV1Aqx9UjuLHhjhXlmN79jQE2PdwEjMj3rJTta7286/6OjoDqDwkEPc55P
         nqdW2PA11EwCT6dhCQv2ldxIKs6JccprLWfcLARyiqSKDmG/pSbzfAcaxgUJZYdS/4ms
         TjJikmxFz6Hs1QH0tnoWA45pRd2uHFK1il3ygbMIXEVMIKFpbbfF7M0BNgIF8J2TQGB+
         VkCg==
X-Gm-Message-State: AOJu0YxW7rIKebU9C0mWoONqKfTQL2YmBCb1w2dEGEdtchyFlsGu2ESh
	xlc3R1jsfKaIrH/bYI/rYEA/G4rebOihOjna8ABZSwMm4IH//ISwwjMrIoZi0vjqLAg=
X-Gm-Gg: AfdE7cl7trsMaGyv/dJ13V5jdY1dmIkcOe9plwp9m8MpPGB64wOuWWUg1mEmXsyRzRe
	int5qQaou52gqDWDDMT78Gk5lXcEQLqlkEMLiARbaL/H4TAGRfr+QpCw3v2A6cmMc1oFPKE3nLg
	SyxMPRtCjUA+mCAZ2RcsiGQKm7yWax++LQ04yhfohllCw1AzToZiNixLOVYhAzocAnSFlTyMftf
	Ayrj/fhuzjWw+juUEU1kvYaiWC4Ue8cC8iZOnjU++dsKTSiBHLmj9A2bvEnXqwPRUtw7wCq11s/
	kMT/nCucFhNUtHWxnN39th8GENILjI8gI4imFHsoEEr0gFr2pZfONg6IVIgr95R5qzu2YvO6HPU
	OUN/DXypCJ+6BROi02cUghh6wIlaBSz7wAmIaaN+UzTLIJGGTZE0hwwuzsL6HokZVFEM8twREt9
	AqxpeN+kwappFAvvrNVtqR3/L74RtoynTFZocN3QoZUPQK2SdQC5dvSGDV8ZWzq+YynLAc9dNLy
	LY=
X-Received: by 2002:a17:902:d503:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c7fc75b645mr74135395ad.21.1782494272462;
        Fri, 26 Jun 2026 10:17:52 -0700 (PDT)
Received: from kinako.work.home.arpa (p1641013-ipxg00d01sizuokaden.shizuoka.ocn.ne.jp. [122.29.157.13])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm44559425ad.56.2026.06.26.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:17:51 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: 
Date: Sat, 27 Jun 2026 02:17:47 +0900
Message-ID: <20260626171747.202269-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


From 1a75d7c1077cf785b479cb975e42e09fff2839cd Mon Sep 17 00:00:00 2001
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 18 Apr 2025 18:28:26 +0900
Subject: [PATCH] of/address: Drop ISA parts when !CONFIG_ISA

The PCI parts are already wrapped in #ifdef CONFIG_PCI
so it seems sensible to add #ifdef CONFIG_ISA around the ISA
parts.

This reduces the code/data size a bit on configs with !CONFIG_ISA.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---

I thought about making this RFC as I'm a bit unsure if machines
that need this ISA stuff actually select CONFIG_ISA or not.

The only in-kernel devicetrees that seem to use this are 4 old powerpc
ones and I couldn't work out if those boards do end up with CONFIG_ISA.

But then again it seems odd for everyone to get this code for 4 old
boards.

 drivers/of/address.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index cf4aab11e9b1..9b2f0d462fb5 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -277,6 +277,7 @@ int of_range_to_resource(struct device_node *np, int index, struct resource *res
 }
 EXPORT_SYMBOL(of_range_to_resource);
 
+#ifdef CONFIG_ISA
 /*
  * ISA bus specific translator
  */
@@ -316,6 +317,7 @@ static unsigned int of_bus_isa_get_flags(const __be32 *addr)
 		flags |= IORESOURCE_MEM;
 	return flags;
 }
+#endif
 
 static int of_bus_default_flags_match(struct device_node *np)
 {
@@ -349,6 +351,7 @@ static const struct of_bus of_busses[] = {
 		.get_flags = of_bus_pci_get_flags,
 	},
 #endif /* CONFIG_PCI */
+#ifdef CONFIG_ISA
 	/* ISA */
 	{
 		.name = "isa",
@@ -360,6 +363,7 @@ static const struct of_bus of_busses[] = {
 		.flag_cells = 1,
 		.get_flags = of_bus_isa_get_flags,
 	},
+#endif /* CONFIG_ISA */
 	/* Default with flags cell */
 	{
 		.name = "default-flags",
-- 
2.53.0

