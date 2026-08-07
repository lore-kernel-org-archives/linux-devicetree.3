Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EF3E3C49
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132902; cv=none; b=pz5ubzoDwqn0NNUzsHiZj+ORogE7t2PtbqDjoD1HLFJgJAx57bIUG0XkGA+kbcLdh0ZgthQZ66CphEXbcbGtNVBHfGsU59P6fdTqS8ynAO8GUU9e8fXMTEeY9uMmPnw4zW38DHrnAajSJIhCZnP59vLWveqvUN9JBqfYv42idvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132902; c=relaxed/simple;
	bh=vr/9876nQ9Yqa2p62Al3XaX5d9J+sOFIuHlt/3IXgHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dTF6jA1aJJpUWz7o8l2pRWamAGGTRNYqlOxQzkzMQCFNGvCOGcQ+2OjwZga8uhJZsVCUkdHeBKCZjd/P7FfQcFyj2zjSDzcoKmfqrCMyxG4/9Qh0wHhkeixV3rRbfmUzQvee3TdlfqhxEZadUyr7AG60wnPb0kNyNTzRFl1SP7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aARHbHSP; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aARHbHSP"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8487214ad2bso5727359b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132900; x=1786737700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUobKnTJDW6OHCpTnuG5AIhSRJPdO7KkwqnQ+2e+QDs=;
        b=BiHZLqw2Igjgz+Nf7K5m4LiZRfAnuB/yZSt2qpTXn4x+Z3TbdaMZYiVBB/QXt+NgMC
         9lQY/i1VEiPzuneqkxLXeFqB85SKUEDu621Ny9rb04UCBmE+aZ+LRDwlG+s3BHhXyiqi
         cl9egOHJPle0y3lPt2eXcnXQZ0hbKTIGtrSQLeGCp6cVp7rp1ZbAoIQE3+Vs2u9DvoUC
         g3MK/akmchE4WemKhMxtPNyuEbkxTi5QnvohNSNVYcgLQlJU7HaDJuKza6CzWujF0Vpd
         hOGdsvfB31eMeLQ3739H0OkKv+LWKRisB6PjoD3KfO4LZoPRsPGBQLwLrhU9FvpB8/Ol
         vMHg==
X-Forwarded-Encrypted: i=1; AHgh+RoZadsesANgn+9gNB7nlQXnzil6vBlgIeJLeGi4Ynxi7/i1e7fcZhd+BzF5J2TBtAC+EtVASHotI4QS@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIo9ImPLappp6/akeB1WB/TrQwAa7mMjC+GpqZGkWUHkpGb1f
	BHUisSSxc7o3o9korvIvAIYsoDqxueDRRf7uBkj/sW5ezKDXY9Vpd/hmxM7H7WgX4TIOE227Mnq
	yoWK0S9hKNivEtlndNdlHy3RHeh/hgzbHOt21u6N83p3iY64u4FkfZGS0NjBEf8QaC6fUM4zDjF
	vh31yVf3HE9cY/rMoMG5J66JVGsWRUcxrGh+7k2uHqNGj7Fdj+4RIUAhoVcH9BfjqgaqlE12sUC
	XBE6s8BS2N1mg==
X-Gm-Gg: AR+sD12ZdAW8F0muGt4j4uT6KsKUNbr4J+0mlO5w1X4ERagUYgDNu3ISP+dyRu1Hm4s
	D5QEwN9juG6DScQCtD/wl6V4OsbKr8K+cnZypEAEBDpY+eIV4ppTSEaAFMlW6P1SnKGZyrNMv81
	jRAYKmGamCga1ThhoQrpmFgA58GP7U4Occ8jNFyoCGcEYNnFD3NvjZQHtEgVCXaZeIoOEjQNvKC
	atGLeLhfVEZprH2wJ8fmLX1tJ6XK21NC5Ad5lzKow+QecpX8dDh+EgRc8O6ri7tRmbpLscfHJMH
	CmYQmCrpI3nEm8hCjr2K0tB2ihMXz9Aji5kB1dGli2ax70ykGgkXZM/hZ5vAUhjH9tsbjVC46Ul
	KGwVzJlc7Y27VZNY8cQP0iBXITHPPS2STUmYkWnEVamgl5pnQuRw+NLVXMdSLBZPRMUt0Wg30FX
	rzZ2O2yAbN71wkFUn8M5sB8/vG8kPC8sFW
X-Received: by 2002:a05:6a00:420f:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84f5e0c56admr7938532b3a.31.1786132900034;
        Fri, 07 Aug 2026 13:01:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-84f5a42a533sm707838b3a.5.2026.08.07.13.01.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:01:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a098ea19so423406485a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786132898; x=1786737698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUobKnTJDW6OHCpTnuG5AIhSRJPdO7KkwqnQ+2e+QDs=;
        b=aARHbHSP9Nln5FSWL23V1aPIp7cgZpK55smAoujqOSMoOVK0eYbhBkFVRMrbwVXnuA
         NCDhknxV5/WgsgDRhU6X5qnowMEM9/MXqR7DAOWjdx+QIilP9zWJQzFgdhvBPVJvsptq
         jXNTlF8Y4nv4sWUGw/jeK0HMIGb4mNrHIqi3I=
X-Forwarded-Encrypted: i=1; AHgh+RrFeDNhxuuDAaMBWbDndH+VRfCa7hu1aNQvJGGwlGsCNkgMy9+TmXNJPpaWI3v8JT6us9K9tcoCIhsv@vger.kernel.org
X-Received: by 2002:a05:620a:440b:b0:930:b19a:9d5e with SMTP id af79cd13be357-93671b4bd40mr603677385a.1.1786132898173;
        Fri, 07 Aug 2026 13:01:38 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:930:b19a:9d5e with SMTP id af79cd13be357-93671b4bd40mr603663485a.1.1786132897374;
        Fri, 07 Aug 2026 13:01:37 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366dc51b43sm225839185a.0.2026.08.07.13.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:01:36 -0700 (PDT)
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
Subject: [PATCH v8 2/3] dt-bindings: mmc: Add reset-card-at-resume property
Date: Fri,  7 Aug 2026 16:01:20 -0400
Message-Id: <20260807200121.2590202-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807200121.2590202-1-kamal.dasu@broadcom.com>
References: <20260807200121.2590202-1-kamal.dasu@broadcom.com>
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

