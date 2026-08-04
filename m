Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B5480DE9
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875915; cv=none; b=f0+OeBf0QEWgZlidH2MQq5xO+Spn7o1YJKHSc2gTkrIi/7Mqh2REKC4Mx3FsPsvkQYJQbg8SueuHuuZjbuTGfvy0+qnLLUbaWieGX1Es2vIjp+6IluYeM+nUJB/uGHnlm+/cFYfW5Ideq4YQJUBsM8HuloJzluXtZ00YAsBjzv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875915; c=relaxed/simple;
	bh=PZ//jzzE5h8FHzOfZGXqgUp+ZOZar8706pfw/P/zTb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qxW5B8f2fawuJepWAnNhGw0h1LG50uRyvmSTiKMwKkn8bbkfUoWXFK529cb9SEsReKF3XcloLG3X4JczisrgWilPBulYckZByyLeQHlTo2g3EMBikGnbO1ZMch0myafFYI8anOsGt3uL9yrU8eyVqnkErQFxsFHSk3vHxT3DOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cNQzxJlo; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cNQzxJlo"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38f620399a0so205902a91.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875912; x=1786480712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIZk2NKICUFTz+VkVHlow8aYGCzUye8f08tzlW4UKMM=;
        b=TO+65sXRj1FmPhxKo8uvNVhLjY0qnbX2NHngmI/KKWxhdRAzQy14F7sB1skmMZlGe0
         uzPRceeaLrsIWUdWKbWzcpZqPQz2q//EPpWW1pCmJT1dUM8mctkXnpvimW16YqCdt9ca
         +nPVySCxftIta9HmzzLtvs/zjdvJa9r9yOp2RluepYqFMzF5Y3Szd43DEqKE/rUG5/at
         D8vnZzkOeqxw8aEccFhGXQ2FPAoIzHol4gXkfw2eLtM6NDdyf0CTt7Qc1EepYVfrVjvj
         ap2pKCwdRn0eVl+bwSIOh2bDBBunocwvOZwGW8hWvYP4vUwzWZLmYYGV+lPY5nMXM9HM
         nDVw==
X-Forwarded-Encrypted: i=1; AHgh+RqhdEUyZCBthmB2Z6krJaSMO8dMos7BEEjX6TkF2W7e6MIJTCIpYFYrbxSwRU4JjcYOVe8f9CLODaWx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+vtQhrFRW0A+1dr/TWY5kEJViWpNijgfrOOe1wGrN1TbK9B3a
	L5+ogQK/+AAAddCXoIE0ic8nX8hjpufZSqryg/nv1ZUrQhgv53T6lWpoRjzpM4Io8MtnVS10sff
	vIR/0eUVeD9nkAejkRF12PtsAKAwPlgAMh0Bnpdi8p8a5wL4tKA5v285QLTa9t8JvuQs2SB6Md4
	IRK3KBsUn7qPdlw81Ob/KMG1rT+qn7aHY00BnS7gVsIXajViE5CUc0ifS7bK9ay5lmShLd+RuGg
	5959n7B70g3xQ==
X-Gm-Gg: AR+sD11vtqdfSvTjtW5EfnRjNlGEiY7ULleBGOqT/yy83Ef38+Ud5LDpg79WJdqXgIm
	9Gx7uh4v/n2WFYoIL0UeOsiNcC/FbPNfsA980weIsKggcIxtBBFmSTzZ7IqmILYd+k10p1VQiik
	RMbjVqEb3iufLFqtHUC6CVcJB4tzzpt80spzlYoqmQ0gg7kL+jFeNlpXXNy8vfOtnnp7pUWB4rJ
	ndNbLKSf4N+m04m3mpPID+2B3d4+lfwMv2hOupY7GvZt1kye+K3Ofk+3Y0RWIkOq1wp+HLhHc7t
	OGg/u1zlDuK5FpiawUg5exgHIvoV83BIw88YxhaOtZQRCzGwV0BMDceW0v/75Bu7lMOgwz5VY2h
	IVwOC5eQPII0DzcHfcaU/gv4EX54EBdryZq35XcgGRedtBb9kG3P+nTqxhR1Xe4Z6NaSVAzzTa3
	V81XjwntwLnuorPZaCQx0SKQ2uzGTDQBIv
X-Received: by 2002:a17:90b:5683:b0:381:96a2:14d7 with SMTP id 98e67ed59e1d1-3903c66ba26mr1342023a91.22.1785875911694;
        Tue, 04 Aug 2026 13:38:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39039289855sm78877a91.5.2026.08.04.13.38.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:38:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so31629185a.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785875910; x=1786480710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIZk2NKICUFTz+VkVHlow8aYGCzUye8f08tzlW4UKMM=;
        b=cNQzxJlotuAk+Z92InR4LniLUgBS4qsc5B/UymFSdWuSl7PHyQ8OhjxjMz9KIBKmcQ
         KQdLrnue8FQTyjFhIeOajvBo0KXa9ygFdw5kRUpa7FfzdBtMoMTgF7WOi+wL5qI1qssE
         B+fNhhLvMvRZz6HGQHGNT9Buu2H8zDDAlJJLw=
X-Forwarded-Encrypted: i=1; AHgh+RoKIjLL2c3VHyGqNvc6fH2HGYoHa+uST+qtGDELzTNRuFG3WFQR58DuFRJz7Y/k+1e1HvekiPM+JXBv@vger.kernel.org
X-Received: by 2002:a05:620a:a415:10b0:932:da46:6279 with SMTP id af79cd13be357-9364921af86mr105778485a.23.1785875910297;
        Tue, 04 Aug 2026 13:38:30 -0700 (PDT)
X-Received: by 2002:a05:620a:a415:10b0:932:da46:6279 with SMTP id af79cd13be357-9364921af86mr105774385a.23.1785875909755;
        Tue, 04 Aug 2026 13:38:29 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a52dbeesm11089085a.30.2026.08.04.13.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:38:29 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] dt-bindings: mmc: Add reset-card-at-resume property
Date: Tue,  4 Aug 2026 16:38:17 -0400
Message-Id: <20260804203818.881765-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804203818.881765-1-kamal.dasu@broadcom.com>
References: <20260804203818.881765-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware or other hardware accesses the card
during suspend/resume, before the kernel's own resume path has run,
leaving the card in a state the kernel can no longer assume it knows.
Add a flag property so such boards can tell the mmc core the card
needs to be reset before it can be used again.

This is expected to be paired with keep-power-in-suspend on boards
whose firmware needs the card to stay powered and live throughout
suspend: since the card is never power-cycled, nothing else would
force it back to a known state on resume.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v6:
  - New patch, per Ulf's suggestion: rather than fold "needs a reset
    at resume" into keep-power-in-suspend's own meaning, describe it
    as its own independent property, so the two can be combined only
    where actually needed (brcmstb sets both; SDIO's existing
    keep-power-in-suspend users are unaffected and set neither this
    nor a reset).

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index c18bf0d6a56e..6929969ed5a2 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -293,6 +293,13 @@ properties:
     description:
       Preserves card power during a suspend/resume cycle.
 
+  reset-card-at-resume:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The HW/FW may have accessed the card during suspend/resume,
+      leaving it in an unknown state. Hence, before the card can be
+      used, it must be reset.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1

