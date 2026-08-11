Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D73BED5C
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466302; cv=none; b=TJ9V6Irr5ln2XmKPOSsXW9m35/YEoARFdLbZQnYlDMXO1s12JIuY5274yRRlmk/EjEOvc6PJ3kD/Gf9n4qem3BWQqDIYyoBgMv0tz6DhZ+LnL66/IWUHx/FF3U2kP3UV3edwPcPIF4CyViOVvWYdfICQspfgnvYngDxtEvjFcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466302; c=relaxed/simple;
	bh=VjAm/G+XBV3wqAMJf/jE90KbOirqngl4/9uUrm3AKo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ku6ZRZQBmJoS1pUfOZwx5uFBhYzsRnlNUqMF7db9cX9CDwDg997iM1UaoUWK3wXHPnvL2YnNIP1LxpdMIu/fSNKqd/WCBRJn+6VaVGtxjclffPWCPHhPlNtDJJyxnWOJdQzPnal//Hq+r52x63z9qPBeWRCk7GvJpmB9EUBDQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BRAkb/dQ; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BRAkb/dQ"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso81048a91.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466301; x=1787071101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP0oJG7AWLjJjpPY4ZmVTg/sHwIBv1HYr/k2mhlodnU=;
        b=jaSKHXcBB/yvULD7jFoUllKhfCkSc4zdqgQ83jHOZt0qShLpNZ4ig4Ao0rnpRggRbN
         YIHvW7PFnvt9gZSZo014oNpQw/LjJZ8qa2v2luBvgWf/k5r+wPG3eHhylh+pdUG6pAlO
         ljXg935H0FfCK4wjXBKWg2Km0HjzHoQ4e4muHjVfTP4VWI4LLgxjlxDREUBA5hA2a+mM
         v9cJC9GHGrkFM7/fRo0GdgiTf59Xov2lXViPYvF0KiXORVPJTOInjMdIWiBr3XKrZeyS
         KP54BA6Fejc2QI/i5AswcLtGs8fO7XopS32zg5kawGbcrxjZYkUDlcP7w4+lLTg7tYZb
         aL0A==
X-Forwarded-Encrypted: i=1; AHgh+RqcO6RZ1Vp8CZdDB+g2V56ysddq2JJXAjNl862xPlt7S2YfuiUj1xT80e7shJCdiNtw/OMuuiigyB0p@vger.kernel.org
X-Gm-Message-State: AOJu0YzEFETJVZmYJv+416wHFc/VW/ib7zOL1SN5/mPAEUvZTNe32p2d
	IrXGISvPAxuvkHzZh5+EBhdHfiRM34Z8uDTYJglMrTjD7xmUH/kaFgd5D7zm9RgI3cXibht4FJb
	YF2OjEKFCMtUDUGLSXWsnc/741mWahAwbAzyCe8uQuFa4bI1SsLsz00eqsd98d0rw5fDy6X42SJ
	yozmz3t9WLjxxM3ky34M1a+vizr5HcWsb0DrWowEDz7vipoNgh61/7U6BJqOad6UI4voljr7IiM
	r499OF5b7NSOw==
X-Gm-Gg: AR+sD10pWP4oN+ssttB575+v9KFiSFBDX+loeDF/BJ4YV1naC23fqIFWs/q3/pziFBZ
	WDmro/pAv6AvTeZ8xQ6Zs+vXQf/c4byirWvMpFzLwTl07A1mMyHjUBjeC9B1sVxRe1t/K4+raPq
	5Me+oHnJtPWd9Pu4NNYHy9IiEEFY0TsMPYsap5585zaqJKsJLFZxAaazpDp2utmSrIzOnr/6+h1
	jxhRxWUHVxIx3sp0R+9IuzjewTJsMyJaG0aaAT1cWoOOgiYfgC5GZIEwOdh+ccs3k4Xz1ArqTLn
	B24kg8RFicDMS8oEtlXscqr/oSGjfFuV9WJverQ6q51g2NeFlk7JES2NzxpfrAPN41F2Am2Zr4d
	hRlIG3w9l7RAocPMDqxKwKLCu2lmTLWsHIKO5r31uTPxoRiwl20YN7f0AW6iG0l1Nj6Qn+PHVG4
	bmEMdQbHnSfZWHcKdRh+n6eZBfS+Zgm3fINq8=
X-Received: by 2002:a17:90b:3d87:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-392f47b5526mr1343054a91.10.1786466300178;
        Tue, 11 Aug 2026 09:38:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-392f88c00a0sm78121a91.2.2026.08.11.09.38.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:38:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso964401cf.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786466298; x=1787071098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IP0oJG7AWLjJjpPY4ZmVTg/sHwIBv1HYr/k2mhlodnU=;
        b=BRAkb/dQhOBssXaWTntCJIG7KtHtikt2iq1aXuUsa7YYoOywPlrxiAn8luv3YrSBO4
         lIk0mU0HZkZ2V/vRy795+3kAQjRRcrDtBAUSrFL2up7204weT+pEZORRi7NH966lc/6h
         S0b3VtvUxHgOHhO6XpGMWTRa8T5aacjokMglE=
X-Forwarded-Encrypted: i=1; AHgh+RrO7rBfL+tU4PRrdKRRFVIahEwSLahfEKSuP6AI3s/Rr73nkLHBL4vEwGA36IptsOE6WhjiIKNvmgaU@vger.kernel.org
X-Received: by 2002:a05:622a:4185:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d60284dabmr16892351cf.43.1786466298512;
        Tue, 11 Aug 2026 09:38:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4185:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d60284dabmr16891771cf.43.1786466297946;
        Tue, 11 Aug 2026 09:38:17 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d57c3c09bsm14427981cf.25.2026.08.11.09.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:38:17 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 2/3] dt-bindings: mmc: Add reset-card-at-resume property
Date: Tue, 11 Aug 2026 12:38:09 -0400
Message-Id: <20260811163810.1599747-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811163810.1599747-1-kamal.dasu@broadcom.com>
References: <20260811163810.1599747-1-kamal.dasu@broadcom.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v9:
  - No change.

Changes in v8:
  - Sashiko's AI review of v7 pointed out this property's own
    description says it's "expected to be paired with
    keep-power-in-suspend", and patch 3/3 now enforces exactly that
    pairing in the driver, but nothing enforced it in the schema --
    a DT could set reset-card-at-resume alone and still pass
    dt_binding_check. Rob Herring asked for this to be addressed on
    the list. Added a dependencies entry requiring
    keep-power-in-suspend whenever reset-card-at-resume is present.

Changes in v7:
  - No other change here; patch 3/3 now requires this property
    alongside keep-power-in-suspend for (e)MMC rather than treating
    them as fully independent in the driver -- see that patch's
    changelog.

Changes in v6:
  - New patch, per Ulf's suggestion: rather than fold "needs a reset
    at resume" into keep-power-in-suspend's own meaning, describe it
    as its own independent property, so the two can be combined only
    where actually needed (brcmstb sets both; SDIO's existing
    keep-power-in-suspend users are unaffected and set neither this
    nor a reset).

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index c18bf0d6a56e..c51e9184384d 100644
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
@@ -361,5 +368,6 @@ patternProperties:
 dependencies:
   cd-debounce-delay-ms: [ cd-gpios ]
   fixed-emmc-driver-type: [ non-removable ]
+  reset-card-at-resume: [ keep-power-in-suspend ]
 
 additionalProperties: true
-- 
2.34.1

