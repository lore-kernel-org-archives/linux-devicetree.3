Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F83FADFA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968714; cv=none; b=bhxEyKrpwAGbuaKadcUMW4+UCAOZuJ7oKMdURp6m9/MDeDdAqzsHNWa4zY2yQTTbws0IAUStJH1S8WfAUu1ZOcef2CYP7/INL3R37qUq0SXg/Q8wnKMavYgR9X5nheg90UWhlsaj9PBZoop5GE8JWLaHxWSX6vghIIgD+Z9QBJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968714; c=relaxed/simple;
	bh=Qlzp5E9i+GZFM+UIin+Fmma2xkNpBqV2cfN3Yxh2qbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4GgE3N7qaEsdqHwLBHfurfPn/tfwMgv+aKzWW1LhCicext/Bf2HRAcIh8YqWi9s8yAl6mOXxv6I0Ux4kX8QTieOHX4T9cuCb8ymLEB3LJkL2u1PLgVZu9o8UXTZCQ8G+qkqXbqr9P6s+/kw1vHUEZWzNWDCj6uS55V4CgUG5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wo+hJTKi; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wo+hJTKi"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-84847482584so268123b3a.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785968713; x=1786573513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9n0fizxp33zjg5nu+cX3jmQFUDtRl3HBk7n7rSIUnuM=;
        b=eowA+d82j0gc2hvp1Owd5V7nhdWoXDbM9yUb0c5p+02ABbbfZTClRGHMomaxfkj5Bj
         cPF0ZJEPBhPDukPylB++wBbDRfefcd5/NBLnGt3o0lrCOoInS4IFDa9THOcRJZakPwjh
         x4eyA8VAOCNv/esisMgkoaVtteqEzmdELSi8nzTLAZi4BPrkG/d1sbrd8zqe/W4ujiHX
         3PAcs/irdMff4PCvW5IUM9kCikxfI5vaVXHLTJSxxErmt3u77oYt45xrpJpa+4mTRZQG
         JITMylNRiBYk1napwJREL9jAJnO9OfaBEuqzqqc6ir3ULXk7+VZOlOdYa3xqdX0Dj4Df
         F1Dw==
X-Forwarded-Encrypted: i=1; AHgh+Roe3BjJFgG8tG+3OM442u7mDgo6f/65/fQnpioCtE51Xb7xl0yqhZNP/OWu+rLqbYSiduqx0MGe3d+A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+HroGfWDHXleIUyejczXyQ564KF4fUrYubW5WAQ4NkI7dDyj
	5ymx3QDwXjlM8/KbWUVY6iwDIcqahX2kQd8lYtMzq9Qfht8lH9sRRe6cU6HAoh5zTAhAhlCekEW
	jMLSuQ6aj/54oB+gM0ooJe9W5g3bSryW4nu7SS3ACZfHHxETVaPfRBgK8qcSh7Ti9LbmbzCw79A
	hkdfQOui2YfAlEGi4zi/0lCWLGQreCEgrsp4zx4UHTDN2V3BkwzD98939hwnEpxBYnNLNCmvAy4
	EWfJSvz57aaRA==
X-Gm-Gg: AR+sD1325lRrqJzjIIOc7Ui2qdaZ3LhjCAV6dgsyie7w6hLSd/1E5E+rU7+vA6RHcG9
	8llcOpG8+OUIVdM0Uv/vMZhXDjZu9YOInekqQSu+YG3cmD9+RpbznG2Ijd24J3k1V8fh02rQQXU
	TakqvHSLiUQGmm6/wim/tOQ7s2bWAXSnAiXDuJm1qknv0pbJpflVcO3dGAhWW2V2Sy9w1c6SEjo
	OGFYa8DWmX0cU5Dvx/LOpC+AAOSdIlyjmQEpG4ORWDrjTmtfX3KDzuNFcbh9nkbvB+VlAvX1Rio
	xKP8OSX/0zbxxhjXaE3AR33fh/+YboW242AyUJ2Lwa+MLQrpym7AXltlOvQHjQ+X9PrllAW/PTe
	EqoevinGwmXcCkeIKBcDWnWCIB36pFQPzjz6Ck+D8gsGMf6+zZU/XgUVzABoAux7ezwC+vbtgmn
	3Tu3cO/zW6lt2+Z5XcelqIWNcDS8i6sTEc
X-Received: by 2002:a05:6a00:180f:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-84f41cff3eemr2439486b3a.11.1785968712762;
        Wed, 05 Aug 2026 15:25:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-84f4568b67esm74322b3a.4.2026.08.05.15.25.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2026 15:25:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so295596a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785968711; x=1786573511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9n0fizxp33zjg5nu+cX3jmQFUDtRl3HBk7n7rSIUnuM=;
        b=Wo+hJTKi5S/OEp8+1JSqQdkV4pBH6kEhUFNEreC/KacQXVPfMcJysi9RxX9VDG8PKy
         gz0sNDXPWNp91Uu3Yc4MvhPeBh6fQVrl9EIiZnomAVZr1IvGsXQYGcVeeS/6VWrmafL+
         Z7rkdW7QUqIAyNF2O+oaUI7teLY4F/sHFpIgE=
X-Forwarded-Encrypted: i=1; AHgh+RqChOtLqjaKgFVb7fNzpnoughDiL6cToS6LqpO9oMOKIQAa/MzouMNCl8BPquPVyLhfvCsuey16jddt@vger.kernel.org
X-Received: by 2002:a17:90b:2ec4:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39083aba06emr1307738a91.10.1785968710828;
        Wed, 05 Aug 2026 15:25:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39083aba06emr1307710a91.10.1785968710335;
        Wed, 05 Aug 2026 15:25:10 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm18526160eec.20.2026.08.05.15.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:25:09 -0700 (PDT)
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
Subject: [PATCH v7 1/3] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed,  5 Aug 2026 18:24:58 -0400
Message-Id: <20260805222500.2567801-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805222500.2567801-1-kamal.dasu@broadcom.com>
References: <y>
 <20260805222500.2567801-1-kamal.dasu@broadcom.com>
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

