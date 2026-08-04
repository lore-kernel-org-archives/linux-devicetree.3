Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA7478E52
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875911; cv=none; b=uKtg60P+eBNWCy7KGxS+8mR3t7gV8nxqFBH9zHWiJlGyg/RjN/BchWYuCOliixGFOHyIG9o4mfFcaLRKD6p4p1TRsJvvj9NLAkRZDmp7duDIWR7GsO/qCsNlpAQviU1wJsCLR2CiOYh4NnKFQYn2/SiCG/YmBiMK/BGMfGPtqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875911; c=relaxed/simple;
	bh=1oYwQGmu7egbaYzszdd95TYNSc2CcNOc/t4HVfErcC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPpgMOeCqiUzgojZqG+XS5AI1rsLhZSz3LEamR+bKZ6k2Rfs+uUnaA/j70jNOLsON1E0loTki4SfzEii/RzP4brE6jkDC7mrOCDx0v+WzGOYmdEFL0ZWEr5VbpJR6ggPQykZl5yJKJ1LGVNqrYenoUMD5Ak8Q7XflzVlMaIYTxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Dxf+ReDH; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Dxf+ReDH"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5bf94664327so107678e0c.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875909; x=1786480709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b6+tGrp8ymCoXe9JGu+0YvTkdgKzEYKK8fFBsOhsEE=;
        b=M2KqkMb90wPgJFbJNTAp4yV1tb/cRuvp4lyRr/mCG9c9mW2MYSYdGKQ+EhvX9MJhoe
         fxUIty/wQJzAjOTrUhIAi7FC+36tSCaTcJyvoyZ2l42bTA5qTSjWxe9GFFA38EMcQUNf
         u5yhLEHSuCaqn35in5fb/yshv+BQJZRst/mL3gP+P95L5/TiLPUDO9WPypslwRgBimFq
         AIBUYTdS1CdihKKZFNYPWeycyiNQ1mvXaIoHX5fl2hzW8ZVQ0fJei/dzvEL/NvktDX+X
         py9ZcoL7AlLkg15s70LDMimHuFITP/CQ6OExk6Kr49KwJvsanVE6mt2llJYZBg5FlvXo
         8WIg==
X-Forwarded-Encrypted: i=1; AHgh+RqzZ1AR/D3CSSczw/14bzsgobt0eE4TGXDdHltWpvh2INbKFhfH0/+hHpFvunaNZ38tQJgJkeXxnirk@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkgTsmlpvrXTC+DwkRH6IRs0f9BZgU0gu9r0lwZ8PCAj0RLtn
	v0qZLvSs+lr4CczIxzcchBU5FE6qgiB4eHHHtM8det5gXsZJm/K4V6CCXxkAnaT+5eAP7MoTcG/
	D7dfwsAEJyEuzryQnTo8C84MoItEEvF0VSv0ii0fap0oMRgy/GLKiwiSxacv4LChMzpwHRKzymU
	AZLlD7xhGAUuwtSHR9LtXzHo88VWU0Sa+4n5aLUH/hRk4hIvN0nyHqhwr2NzOQ6npt+RobJmiVl
	YnuocFE9AWF4w==
X-Gm-Gg: AR+sD11/kplDmiSrOZGixCpkUjX9UN/At66Hd1dD/QI0Pj4Ln7DVwLv3yJETXiK5OQM
	LMHS3tEKRXh6A978/wpkzDhYTjQreI0gb3C7aeEwLGrJ+51MlqoW056mdJsrhXWwXw1vKUtllWO
	/6hmQk8RTcipcLvUKQuzlzE2Wo5Z9IVP6il3sANg6G4eFNjA2Jm0Sz432Kdj8rM2r/0HIj66naW
	JcYWZ3gBYm1LVrKe0Rjkb6DLpa82OTQ3KU22rG35amguJi6f3JaCUG77H4dJabQuIDXGuAlMVn7
	P6L1GaN4BLYYvTS+Q1Ghy/P+ZGUM+o+u2EYFEtxlSGZpVMEfSFIYRm6IilYgRaw8UFT3RHs3Pau
	podAaJ3CdJFxmK1egK5dre7f4aQWqedoU3QESQ78jTp8PAjce/4al/xKMO5OlHr+fhX4DfPGLsr
	qu8kFEdQjvqIkpWP670P9sYOKneTBEfu/O
X-Received: by 2002:a05:6122:e248:b0:5bf:9bd1:791 with SMTP id 71dfb90a1353d-5c3d912095cmr195956e0c.1.1785875909114;
        Tue, 04 Aug 2026 13:38:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c3d0720641sm216627e0c.6.2026.08.04.13.38.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:38:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907a1e04111so2716716d6.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785875908; x=1786480708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b6+tGrp8ymCoXe9JGu+0YvTkdgKzEYKK8fFBsOhsEE=;
        b=Dxf+ReDHAzckB/QE7hwm2XpDeZEvioDuAMbcY23E5NcgUSzsfogvuROwPhuaUEyXqZ
         RmTaAocN1UKFIZefMMrodPgdk3LDeXdzz5kDirBd2M7vVdnVTDNh9ItQsWO7bxZkFgrr
         w9NwY8dpJJwO0XdBsrtydBPfWz2lF+MVJnVCc=
X-Forwarded-Encrypted: i=1; AHgh+RpI7DL9LDNFO/FKAVQuOmvfGd8hoUHIPhW19ZpIhkn9l+kRsQdHjXAYIk0DBN0EcNQXmMc4G2uBkrb9@vger.kernel.org
X-Received: by 2002:a05:620a:a493:b0:934:afce:cb36 with SMTP id af79cd13be357-9364906e044mr115287585a.13.1785875907872;
        Tue, 04 Aug 2026 13:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a493:b0:934:afce:cb36 with SMTP id af79cd13be357-9364906e044mr115283485a.13.1785875907302;
        Tue, 04 Aug 2026 13:38:27 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a52dbeesm11089085a.30.2026.08.04.13.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:38:25 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Tue,  4 Aug 2026 16:38:16 -0400
Message-Id: <20260804203818.881765-2-kamal.dasu@broadcom.com>
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

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
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

