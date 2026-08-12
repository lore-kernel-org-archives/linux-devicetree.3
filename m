Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FE48035B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555383; cv=none; b=fj/HJ7DELrMXtaIXiB2mwO+F1Zd77lNJSMHVh6NB+ElZ3MhdacE5qBoX4LW6bQ5XiodSuU40PTCF36TEw1rQimJXBLt6j7ZgeI/0djab3/1rOrI8HlqMQ0Ygpj4NJeMZs20yVgWlBN1sOZNR1RHJ8u9U7o5ayrp5aUDjKQVRIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555383; c=relaxed/simple;
	bh=3Jdw+CyC9X0d79MV1LbaD6UPSSq5mFOk7p6L7fDLBfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh7VsWKQ9rSOFFIXXL/vYOoDDJNOGoNfKKkHvPOAwi4zMsvgmCtwOGO4v5h/nSlYOBvkrGvOb38IgtLysJSEuf1RYyn1Krvb4PItY10pq5yRKs0P/T0bncJVR22+bOUQYwBoDp+6V+K1ialUbG+4+ni7VnQxmM2IgWwR1+wv85U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Gs6WmnPA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Gs6WmnPA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed19f4d60so8452685a.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786555377; x=1787160177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BzvpIUyox01epeMSGpQoUeAfJbQUXyU3IcN4aSet1k=;
        b=Gs6WmnPALN7O69rQrj0ZkftYOVY8vOQmEcV25FZR093yfrEg1KG32bj7rymy8YLKuT
         sTDRYfYyeSl/uqR96hZd68CK9mW/WUbejQTNxx07u4pt63glszid/2wmg4mk64IVYKhm
         4H4JAkO4HnkL3sgf+8UD+HtAALhxbTmrZ8SEq6CfKl3NdAkosywdu2QrvysG6+A5Rniu
         CTNe0yTkBrzHqbk1b5ZZtsmHNGJiV3duchmEXSXLBdI/2AadP7/zPiXGkP1xZ+FKN9tG
         ND8d32IyJQoJFQvLV2E4uZvep7bz7dW7Yv/SgmhPkBJEQbFSozoLZjrKmSgweFOajlUA
         qNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555377; x=1787160177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9BzvpIUyox01epeMSGpQoUeAfJbQUXyU3IcN4aSet1k=;
        b=rmL5lGMEA43Sp7wq05Y4PU5QzfcJmGRgAWJp7Pv+xCnSrN5+bjB62FS75TaIkEZRUf
         Z+f+kETRVkyfgUZW3TJYbzWtFzJ3bF8NPIqqoPfbxP+4a+v1TTUukTI1AYU1sVvywdnK
         +JdjMiI9f0KzGFoW3YdXGOSgG+pI0ThJey10nS+z5U8nu/+bpdPURAlA1+tYFyfqWuGI
         YiN1aNRtL9Ea4/f7fSv6hlmhdM/nyVw+L+6JtSatc0yAPE78a5vWKJnIT0FAcBGAtY2x
         qbPwCaA1QWTyMeGULsaTz4qMOxvY9ZOkaU7UO7LEcHwwNjeMyOUlREHqwIS6KaD4oGaO
         FwWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoS5RXdTxLeUS9kUW7PEUcP2uM8XIRMbXzorkFoIWDOQtxivVlukCoJWfGOg+85fHlgLghCMiiO8SMd@vger.kernel.org
X-Gm-Message-State: AOJu0YyTDOI111dbFoWu8AcwDBJXgLL0AUxT5dV7H4yHYvuyPdeIBDfx
	p5A01lfaoSDnHM5UzqceBoOTphcNlvR/1MI2bhlNUY86eFY+8kU90qMPMBZpwm1QQ+w=
X-Gm-Gg: AR+sD12QK30Ycp2hwj4xoYuFMmcq9rvGubv55lRwAhuymXmlKW7XDzNXP4O98S5iJeh
	jLpWO8lFDKtauENW+edEVQE2puSeXVfZUlzGLAFavFFz3BBqAtgNAr7xxWbVR+KxZMhy7qOnYgU
	40o++p6J1Ua8znZ4YhCGk6zD1Mlz5USJutFc4Lqr9gsOMM8ye/ocll9obCHKIAQ21BGsSc48fJ5
	KHH+wZnhiCv/nAi2PbuCnUy/lAlOzX8HZeTnCYLxkrq1hQy3r/Gegn9Mcu+IQHKkiYUl5JNgxwL
	lTsFmvN8V1X+9CwBb/PWvrPBRM/ap5tDrMXAblZNhUf6VRj14uxtx/HVtP+LgYhy7jTCCq5UyJP
	t00LqU6dAER8iM9MxnUhHCc7uovvNHgB6zbcrZd0MAK40Cqh7YMBkZ+NUUWX2KkEbjoAt9kp1q/
	Ie4u7CKW/OoL5FtOyPCxOuBto42hjn9Ma6UjMcyKRelvmfwKlp7Mk7kRUwoIfBQNWP
X-Received: by 2002:a05:620a:3acc:b0:915:29cd:306c with SMTP id af79cd13be357-936bd96e80emr60472985a.9.1786555377390;
        Wed, 12 Aug 2026 10:22:57 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f720eesm173587685a.47.2026.08.12.10.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] PCI: of: make a flags argument optional
Date: Wed, 12 Aug 2026 12:22:46 -0500
Message-ID: <20260812172247.276554-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812172247.276554-1-elder@riscstar.com>
References: <20260812172247.276554-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address of a u32 object is passed to of_pci_get_addr_flags() so
it can be filled with the computed flags value.

Allow a null pointer to be passed, so that the validity of the
resource's flags can be checked without filling in the flags value.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 22fea1905a080..5e1820b8bb79b 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,9 +82,11 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-	if (res->flags & IORESOURCE_PREFETCH)
-		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	if (flags) {
+		*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
+		if (res->flags & IORESOURCE_PREFETCH)
+			*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	}
 
 	return 0;
 }
-- 
2.53.0

