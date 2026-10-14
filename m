Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64244A409
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962580; cv=none; b=oORddpXnxs6tJnJQN9NRj1SI6V1wP/AqGSqjfpjfkPMD2cqZ26vcWLBW73LUexGqcSejdhH1XYy+jf0lQ4zkqJJhO5onx8UGtHKsV0GuqPgQxxRj6u3eZQVamukTBOQKHhmWs07UDJstp6XKGcG9BxZCqHCW++yR1QmE42qUoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962580; c=relaxed/simple;
	bh=ZlhCbGROAC+/y7ldfDGTyZwTBEszhshydS2EHj9w/4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9+Qyf1vP3sxLlTHtH/cNwCd4RbpjutiNLgYKwmXql3+R/+f9ec/l35heQ7za8Cc/oD0iazBWtWoHit5OTQecpNAUJ8kHmOdNTode0y7D0LfwN+cisktpfrVKw2QzC6YrX5nK/vRU1zBG5d5yylQj14bEkysnVxOIxUMCSrY+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffp71oOV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffp71oOV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3663903f8f.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962575; x=1792567375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=ffp71oOVYogA2Ncgv2KHCnYPIY+WLTjpq97pyq3XjVqWaEi1kRwjW8yBVl1vYmVgKC
         jWjLlH05vMPaBA/lZooB3iPJnfonxZDzY1RLYWLh3X1FLWIMhXTnqi6cyZO15tClO9DG
         FLrnAr7V4+SI+El219/5RWo5RLQ1mSI4PNmUHl50ctDSbyDDr6l+QBiUO/7Br9RBsNfh
         yeMwptNGmU4+VsQAuavj03EFJ8542p+MEOaaZA4Xlmg6S9eJ7bMOErsmPL5lACysVSNy
         fcXosIuWOyLhyjipYdrBzy3R8WyKmppvnI4cC6ukwA+644mHokY/rHLIqWUJ5bBM3Yhm
         peaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962575; x=1792567375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQKZaUmW/157OYpiPu8J9Ezy+PJ6t5W87ff0e+oVUDw=;
        b=Cle4E/qiO7Tyz0Y5249CbJrv+an94lbFSuGTULJ1QwS0Oug4pgUWyKGG8kMFZ1mmRr
         u75THxbhUEQDPFnuy3Lm0r4k0OMdUEZwgfPpiulADkZtV7JzG5pdYL2v3fBpwrZxS7hC
         mClLUziT1JWFAP+c6mrDwW3/7eeDOHQx/wwa8M4OAdFrAoSG6CXv9CkgOAGvmuU8U+3q
         thjCF91NolECv7S7IvdeD3vep4mjDnUs5IpEYrDiEBh5Dj//aKmQknXJoDSR0lCljlFz
         bCAPYqp05LXbhf+2S6BR4z3La//rtLHbm8HxqnC0x8FNuxn0iE/Hm4FBsGFtMk3WWJsX
         j9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBw0QPvwd/AFvpp57qNzu6gYCz0mIQPy6SAcmLmuzCmwLqu9q4Iib2WSdlVZAmsZEyngdAeHEDlg60Vj@vger.kernel.org
X-Gm-Message-State: AFq9FYJv2fUDjIiUQ7eBm8C98o7vi2pW2DEn3abU9jHIvoqvVjwXYnNE
	OOS5bp5TWXnLg1olrO/U225ssyc9ObQwJbz1hYBQkI4KLp8p7ZwDscUr
X-Gm-Gg: AYBFou3y5EtUuYw2iEYyReNJ3YjYAZafAX20jypqOo29PpiIf3EhMDIdBXb2gb+5u8B
	HbDP5zzOrSrhCYdYI8lE2D1WMRGqj8v9pHWdHsGXzl69Ht2pg3ujwNO4EbCAcVoFFVjItlw/euF
	fZGvTo5MbK5gNRIo3Zyzkkn71Qenwv36lQFaiEKqkc6Cro8BgDjZ1oOR+scpKeqxnD2x8K9LMks
	8u8yFMFH9fxWVLVCNtCJMZWmCY2uitYkZ8dnFFC/2pKle7ZKb+QEKLvbs5iJp/AyM8gzl45NNtg
	zEYp+2KfF+ay2uxpOG+P7OoHdAQ5o3gbIEmLAdsQe9sEFmXcmQVl0OOFd91HcP10ugSCon1cAG+
	H4D/2+mSTNabiamHtjp9FGFOuPWQMnqUs9GMgjV+TAhvzEBk1AQP3+3s9XVxoMOwuo27ndh6rjo
	sxb1sboexYs2myzuTSMe0pn/T3UGJeACphhwP7jPdwzgXLf4LvxC8OMTxnGiSAwD+CnGhHnjefF
	KHASwMKxkpiHkWp5jCq4VoCsDoQwD74FVuPV1/+nuJkIJMLK7iPPbHwFXmUtrBJ/SuRVtNik5Bv
	ntfaYApr9C+X7rocIb3JnflTAlnzMtckMR6j8P4s4Q9ww9rS7HvM6+IW2hDERA==
X-Received: by 2002:a05:6000:200f:b0:48c:5669:747b with SMTP id ffacd0b85a97d-48db9465ffdmr33882716f8f.8.1791962574656;
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:54 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Wed, 14 Oct 2026 08:20:45 +0100
Message-ID: <20261014072109.1759502-6-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define logical reset indices (0, 1, 2...) for the topcrm and crm2
reset controllers on ZTE ZX279128S SoCs.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../dt-bindings/reset/zte,zx279128s-reset.h   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h

diff --git a/include/dt-bindings/reset/zte,zx279128s-reset.h b/include/dt-bindings/reset/zte,zx279128s-reset.h
new file mode 100644
index 0000000000..5b580bcda8
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx279128s-reset.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+#define _DT_BINDINGS_RESET_ZTE_ZX279128S_RESET_H
+
+/*
+ * Top CRM logical reset lines. Mapped by drivers/clk/zte/clk-zx279128s.c
+ * to hardware register offsets and bit shifts.
+ */
+#define ZX279128S_RESET_USB_B9		0
+#define ZX279128S_RESET_USB_B10		1
+#define ZX279128S_RESET_USB_B11		2
+#define ZX279128S_RESET_USB_B14		3
+#define ZX279128S_RESET_COUNT		4
+
+/*
+ * Top CRM 2 logical reset lines.
+ */
+#define ZX279128S_CRM2_RESET_PCIE0	0
+#define ZX279128S_CRM2_RESET_PCIE1	1
+#define ZX279128S_CRM2_RESET_COUNT	2
+
+#endif
-- 
2.55.0

