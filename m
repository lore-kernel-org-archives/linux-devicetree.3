Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0303B9D9E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466300; cv=none; b=jpW/b2JXv+TlHnmeLSZph65j+LDn7OSUn09L3EuS9MWeT0AjSRcZ+X6XSltIq7J55N//dUZQEnqWMolu6i8yNsn8bb+HvPyRgo1FMhhcpX6A/bFwDIrhez3Xa7bFOPd/AWsc2VdYIngEACf/cW0j7M6jEx+Yon46Xxp5MH5Cp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466300; c=relaxed/simple;
	bh=Pn1CRRczXoaCNuEg3/gTPS8bvh9jftQiMH9lZRLES8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zhwz9N9zmeI/wPdHPCVCnan5srxwsHHZ/5UFvQ095+AzjXA81R34U3+efZdihC/tjYNYF6tN/OF8cUdmksVbX59LGbqQSzQZ2roeGYKNv3MKTwUnqWw4qm+9DdNUOlMxi5E/k/lU9ZJ98hapqxVN7qDowbqPNrDvotxdtXug2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fMWN3bac; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fMWN3bac"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so1753719e0c.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466297; x=1787071097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSmcaixicWN0/teuSYgIhYRtdBpb1IrPNrZX6fZUyRA=;
        b=rF2qUedJpAd4lYjdAGMkR44T139UsznXy+26gUv9pNemfaOJsdsZB/i42R2oHILed8
         RgXRfKF4u2AH82/4FgU6sNyG83eWfCs1TpJb8PDek2/WFfannleeHfs5snQ+wwUkv2Vf
         7RGhEvoNuUgC4IamsGV1nEYQeiXJC3cohpoURwUY2VmPwxVpmNTvbJ7rYyTtuVDKHZ/C
         DIgmO+E9E+9O/hoGZ9sL8jB/sdJMkZ5fd4QoQ67P2+01HlCl9ui2z7OPVUaHO5ZibQCb
         i8ifwDa2d7uhflYFAtm4PXph/x4HPDdsuIR46nPsBtqDilxE5X9l1lgnwAbhHm45x8VZ
         desA==
X-Forwarded-Encrypted: i=1; AHgh+RqQoKR93VMGKSRVtTAeCBTEbqmeO2BHYglB2EUghI/Dz/plxDlstg26uzlMJ7JcmbiHT32hKH6E55Zo@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfrLfQFF0T1YwRiUToJZUfFDP2WF3sj0d+thaTJ8/i0OPN3Br
	yXXhTrmxRAwpUKrIDHU0IN+95E3RDJ0BeSuC8LqtT8sW1ctLrAlEP84lIfFEEyf5E1txoGQs/3/
	vl4ohQ2jWPVawEKFwVD8dzQJFxoYoC2KeEM7hobNAnAk1+nzNhgpbPfhqKsriGl2P5O1rB/xt+h
	yxfpYo5294fgS0pigOkq20hSyWdyIjogw+AgtpTNLMe5371cjHsZx9A3bjdqMlS9b2LmnFf2d4a
	9IS1u+7pgUbhg==
X-Gm-Gg: AR+sD10gW+7jwXHju8EB0CjMO2z2F3TK20ivhVtDPwLu83oRU1q7yKREr9q9sdWeGsI
	6ef+AVOv1dKEJtIGTn+Y2EOvnZLDmiOT2oMTHb7joyth3czgGi1K3h7JO2X/iivOYK7wyUFjh6L
	HQltajL3fe4SaVN1IeZxO5pNjlN4lSTRusDqtNQWV4/HhgqoIdLN0bi5g1N893HiQW45hVbZsDa
	BWbQHpvLHz41CgDP8bWsdaX7M/u06eysWgV4XUPpju4nAPQfKdCAgL9st0etsmhpdDmtlrkMN59
	RMjj2KPxmdSzeK+ceEMtuu/zfpQMfMSyTdwP17U53JShAVDsRQOK2wJ13a9x/ljA7FookYlnyYO
	WyjC8OQK8IONOAzzhNsyN73cIv0qo+4JafL0rLwbDxFAUsP3hqzu8RFFd13I/0p/6OCVIPOFGPq
	7IE1VA5zdkHn0bf/C+k8C/AjtngVriFk+l
X-Received: by 2002:a05:6122:f92:b0:5bd:fb8c:5db1 with SMTP id 71dfb90a1353d-5c4504ba22bmr692920e0c.10.1786466297263;
        Tue, 11 Aug 2026 09:38:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c45b6088cdsm49380e0c.4.2026.08.11.09.38.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:38:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso2197591cf.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786466296; x=1787071096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSmcaixicWN0/teuSYgIhYRtdBpb1IrPNrZX6fZUyRA=;
        b=fMWN3backj+66pLPUqSWLZG8Z4xnDqJqzOZpRy8TMD+r4OluV7CvZmFQ88jPXwAjQr
         3frRF4Nga9B5gCB4sc40i5WbU2WjTXaboccqZkltjPvfhUrTGrM/H2vmUtrLtXa4wEFO
         D2AIn8vWT4MaHT+2eis0Dsjcv/kIXv9QsQAxc=
X-Forwarded-Encrypted: i=1; AHgh+RrKGZqR0ygMcaACxHE6AjV5PxazVne2a3pkzTgCQGf0oaR9tjLnB4NCk9atyNO2wJCVyTB5nurZTmck@vger.kernel.org
X-Received: by 2002:a05:622a:c3:b0:519:f884:b587 with SMTP id d75a77b69052e-52d585e7f3bmr41298931cf.27.1786466296494;
        Tue, 11 Aug 2026 09:38:16 -0700 (PDT)
X-Received: by 2002:a05:622a:c3:b0:519:f884:b587 with SMTP id d75a77b69052e-52d585e7f3bmr41298471cf.27.1786466295898;
        Tue, 11 Aug 2026 09:38:15 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d57c3c09bsm14427981cf.25.2026.08.11.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:38:15 -0700 (PDT)
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
Subject: [PATCH v9 1/3] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Tue, 11 Aug 2026 12:38:08 -0400
Message-Id: <20260811163810.1599747-2-kamal.dasu@broadcom.com>
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

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v9:
  - No change.

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

