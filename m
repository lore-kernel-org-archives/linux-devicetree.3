Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C536F8F7
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132897; cv=none; b=fMiBq5BVRxVn6Ks1x2QAuIHYPKh5XgqfTPZgZjgjzIccck37Lw4RdriFwGcSAjL9kzp7EYUlhJR4/eMGedYrQoGF7lL3zhbUuLCdkRtd51wrvrJ6VL4a2Cqy/AVyvVYurMIeXl3CpMOlG4Q8d637AXZLAz8up6rXLPZORmfYAMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132897; c=relaxed/simple;
	bh=fi9UglUsWL14hbGRB6OZdcqhciF+dibx2nkLntu+QWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xu+QJpEECDHUV5gaSsM5qF0SCRlP5/jvae6CU2fXzlpSqsGnZlLda72EGUwVOmb0T8Z8HeDp7wbY3rcTskbfW5lNV/2afAd6r/mLbs0czTuhTQOYgDrC0qWmzs5bObiBYZNtvDpahHItjIVpk75oaoDCYvqlDpmrFdOfmRMmGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LNHPIPki; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LNHPIPki"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1561846e0c.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132892; x=1786737692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frEqhqTY4YyOiZv5F5GY+l0M2IOOmrFEYWVkjKDi394=;
        b=PSwFHDNKmLJ/mGv2Zyjeg7NRM/dpaGNLoJqoXw3H2NhlMOS/d3suGmSEsDIHQUS869
         Tz/pfU4IIY5ZNOqR864eq8S+J6Yg9RbgrJ6S95ZGe8ilqLzVJdxqjvPI6Q15vGzvqT4t
         dpinIT4cfSdZ29JEchdNP9mGuOWTT7oKba1FQDTrjWuseXrk7p/UShVumTXhz62/SQUy
         sZ7AFd/vh5JfU4WlsGBwNcz3rNmz/J/JgOkXcxbIna0XA6L/VojQIwWUC9mdOgF9KZIL
         UIfG06mpx4sks8zrHGBJE151hKI41rUB9mUwrq0ZZQa02/5SkctVM6dFvmlbnaYkGK6H
         SrBQ==
X-Forwarded-Encrypted: i=1; AHgh+RruvT6G6kcTUdU3k+uOxjh2RgeWFEa5SZ626pexuYFlXc9pKhA1eWkTRbF37QZJtcRStq9tCVlpyGTU@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyU3fWz4YFvOdgz9tOuDfEwKLBKlI8KPcMv+s65DZfg/YrzWB
	pqeo5t15TpVDJ/rNgblwvGS2Wf2bTGqRSBafMv+IKz0yR38u6PlYf+Ju7L8h0Ihc7FTUOiGcWpO
	CyoyBxRiFkCCmArzODBLGnydTyJOLRVp2p08kvkqjqPXkX3fWm8Fq3vVVBY/S8AjtXut6fBJ1SN
	BI3H4tnrkYVw+6eba1lV1hHOnPfSMBUctrHTZ5DpqSYTJY60EBc0UcoCthAkzFvLPkYZoDtS/cr
	SLBoPsTqRPkag==
X-Gm-Gg: AR+sD10n9Qi+fFwui0VhsWKdpwz+ZRauLMLT1S8t/LRW5zoAyw+Y80YBDz0YAjHpFPw
	Ha3IXpXbywPciZ7Xtykwx2la2+SPd1EHSSGpnIfoX+fkhFgET8EC5z8X9PU2aP2EGYtjCJ2SmkD
	kGtpGSifGhx0z7Ba8GFkDFZJvXkosh+fIL8HweVfQsBPeF5tLU65WVhrTbQK7k5AnnGQgOLNAxA
	bipK1xrzKllYLzeGUqECR7ChQbtWHKAAjAAevxMKxq+sNm0k77vX7JBROLmCTsCHIta2+cOFygZ
	jF/Eo+sUlVB8TatquEpong/e7Rh9t/5cYFQKfE5EvVHQWUrXVsb8AjMv74JYzj2yCy2zJ3AuTjj
	DV3FNip+ndTP98jQbZgIPy0POmEJfP+h0MY/DCW44ZjrQhOuMM46F8U6DMoPoedZKqEgXZk/8AK
	sGosW+AYrU6QS7JplAx6ONw1zthVCni4n4
X-Received: by 2002:a05:6122:2191:b0:5c1:2b9a:7cae with SMTP id 71dfb90a1353d-5c3d90fad18mr3344459e0c.6.1786132892261;
        Fri, 07 Aug 2026 13:01:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c40ac74efesm510773e0c.0.2026.08.07.13.01.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:01:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso76742085a.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786132891; x=1786737691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frEqhqTY4YyOiZv5F5GY+l0M2IOOmrFEYWVkjKDi394=;
        b=LNHPIPkilSl4iP7DqzuRNuo+gZF4Vc92FPDtO482YdzYoBpLikIzkvUvdJ79trfwOk
         /UFrliTBPp+kTXCRKNBt+y37uBss3i5nwa5fZAMZy/wzVxHJh8s1v6eb2Op40xTXCIMC
         KMrF3flVsciTLfLmxzojkUy98BvRD0hO1Lo2c=
X-Forwarded-Encrypted: i=1; AHgh+RpAjGYWwJZNoYCRl2gQPVGBBiXTz9TejZVG/ufyH5JzkKcnTwitBVLu5Lojp+pnNzxjrWvIzm+Gn6Ft@vger.kernel.org
X-Received: by 2002:a05:620a:8010:b0:92e:7a3c:add7 with SMTP id af79cd13be357-9364921c0ddmr2287894785a.27.1786132891309;
        Fri, 07 Aug 2026 13:01:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8010:b0:92e:7a3c:add7 with SMTP id af79cd13be357-9364921c0ddmr2287880185a.27.1786132890663;
        Fri, 07 Aug 2026 13:01:30 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366dc51b43sm225839185a.0.2026.08.07.13.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:01:28 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Fri,  7 Aug 2026 16:01:19 -0400
Message-Id: <20260807200121.2590202-2-kamal.dasu@broadcom.com>
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

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v8:
  - No change.

Changes in v7:
  - Added Krzysztof's Reviewed-by.

Changes in v6:
  - Split into a separate, minimal patch per Ulf: just extend
    keep-power-in-suspend's scope, with no brcmstb/firmware-specific
    rationale in its description. That rationale now lives in the new
    reset-card-at-resume property instead (patch 2/3), and the two
    are set together on brcmstb rather than folded into one property.
  - Also per Ulf (applies to v4 and v5 alike): dropped the mention of
    sdio_set_host_pm_flags() and how Linux's SDIO stack happens to
    expose this at runtime -- that's a software implementation
    detail, not a hardware/platform description.

Changes in v5:
  - Added Krzysztof's Reviewed-by.

Changes in v4:
  - Dropped no-mmc-poweroff-suspend entirely and extended
    keep-power-in-suspend instead, per Krzysztof: the two properties
    described the same "don't power off across suspend/resume"
    contract.

Changes in v3:
  - Renamed from no-mmc-sleep; dropped S_A_TIMEOUT framing per Ulf.

Changes in v2:
  - New patch, replacing v1's card-level quirk, per Ulf.

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e9461c..c18bf0d6a56e 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -291,7 +291,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1

