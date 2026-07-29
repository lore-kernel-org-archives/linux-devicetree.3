Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411D3D5645
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356073; cv=none; b=CHgrzeDvKEPOYg9PayItxASGGOAwvHEL2QFuaMaWGswxTpXoNqCtyvTopGc1PgYV5PobGnpJbuVwVaJRkQSu5htAqgp9x9QMf/nEwbfWvsnvyw8BWrZuvz0XNUeo3wWggtNSdr8tMfuPdM4W6qBBRqhXtjLvET+gpGRjsByEgyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356073; c=relaxed/simple;
	bh=uD4u9KTgNvJKJ5gV6MxgBAGV39N6ROb42LaNKTZXIdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xvl9LIRgQ3Rq66jLT0WRT3rkCeEAbtoUqG57X+X80bom7tUJGFEF8orGfNmksvWvJMZbQaDzqnJqZasneRhOY5q5od6UF99xIB2MketWfpnscDpx80y0L/rLBBDSloftmhqqgvYftDYnqmS1P7pcIgKyIx61hGyW3pbpw0KJEQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=azdSlEtO; arc=none smtp.client-ip=209.85.160.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="azdSlEtO"
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-4472500e25fso600551fac.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356070; x=1785960870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbWrGnIrUUsth3Yia1cqmAkJSDCXp1RV0SQ0sLkznek=;
        b=q5F6RQMyStLi3HX3btI9coI8UobKU1SW3scMoynHLYQ4G50LUKleLC5JnBYI2N/HW0
         PVfBIlpolFsPLQDdJ7zFrL6wUiiD7shUEYuWy3d9lvb1ky1uKkqWlTUp2+BZYTaACyUi
         Sveqv1r+Eyj/Rrzty4cvnoIKhYR2sZDpSyYkLVE5aY0J4J6/AtWdK/ZN1DS8672TsYhp
         1SsL+1RvwYQ1d3R9Tg2GKB6Gzj/ucnm32B2ZPI6O89onC5Kzxdb0A2QTCHYx28ddzJHq
         9G5kGbd2GuvKhLyqdN8ZKaiLz06AWCxrEXKqEhvxXm+UuaBtVB9zs8vG25/f8dFWQ6nt
         bsDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1dUELC/T98/dPSryJYg3KKtzDh3GaAq24hrU87+nmssHDVLFrLKlgMDKTQ+2NFBo52Mk3oBsd7GQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3gXkL/hLoeRYo9vPI7me5GWOegnI1AilyCBk0bCUW6taSU+T
	2WUyfz110I274n2ER0ajkFZspVRH6eK5i+d+MxKVEszGewsMoZ6HIZDgUbDCvi9QPlvbHr515fL
	ZYkGE60qEC6mjFnsTvIdihyx5heouFaUu0DZ28OTnuU8bRd+f2S+QV2c88t9mvFv4jTjZggo4Ir
	lVDxbC8/r1nMDjJUHMWBF/DTFAKCffl2lwuG91VfqYNSKX1/vXmUJYcQQ6ex+uWY31y58Sb57aQ
	zqIL58IJDbHsg==
X-Gm-Gg: AR+sD11lvV1hlkn/FLfKkgKOzZMoFyC1Sulvu/HZ3rexdh8XQeR9ra2dPA9jbec+5r9
	o71bPooSpnfnenz+nTUTEw0MbcZSqbyYJcZQzAPtJ+j8U55sKn05plWJb56BnxG7GnOEW9FOWbY
	5Fx7fGfS6hLrzYZyePbDaNEUCo+yv4Uxl8pN8lYNB7XLyLnosZB8pCVBjA9WZq+Rko6OxLlDtrL
	og2K9R3pshyyTJzZMnUwOL6Pw0lVX9NJppJZAZ+S+S0GmVGHGJq3SWGrt4ZssufYcAXfIPXHazB
	s+RkvrGDsIke2WRhrXdxENtHPWfd7Gf0oc5srjtseIn/4lkmHC8/x1SwCJrzRz9+DUPVQ3HytbC
	vhu2y2XKWPjh3bq9qsdedprum+sg4Yw80c7z/pb1+IAvUyfLBDrFszzwqzokuzOFaQTfdHr+Qy4
	/CfO8jB0T50Q+4QogXuunwWce8+lhEcfOw
X-Received: by 2002:a05:6870:174c:b0:44c:e350:a0b7 with SMTP id 586e51a60fabf-458bc4b43b4mr128801fac.27.1785356069934;
        Wed, 29 Jul 2026 13:14:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-45886b50e15sm279859fac.16.2026.07.29.13.14.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:14:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9077b4c35c5so25725056d6.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785356069; x=1785960869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbWrGnIrUUsth3Yia1cqmAkJSDCXp1RV0SQ0sLkznek=;
        b=azdSlEtOm4Oomid4DKfQG6xJo4A2mpn1Zik0jFUcWlCbSNZ0DIXYUeAFzJNihy5LMe
         C2pv8fHqPf9Ag1hxNK/e/i6MaBdObnsQUXIZpOgPtaPyKB0mLAL2K4DVmvU/EEdmcSJ6
         pHY/2Cidi0TIXNX6Kmqdh52BXbCQeQRfpRYxM=
X-Forwarded-Encrypted: i=1; AHgh+RqNw7p0Vw8/ouQ/Ax/wHApD5Zws7Er7k9TNcG6o0EDYoqmLJs7kxz+biGQHSG+cnEagdB7Of04bNmZt@vger.kernel.org
X-Received: by 2002:a05:6214:3217:b0:8f0:9d9c:52c1 with SMTP id 6a1803df08f44-908302a7f25mr4192666d6.38.1785356069119;
        Wed, 29 Jul 2026 13:14:29 -0700 (PDT)
X-Received: by 2002:a05:6214:3217:b0:8f0:9d9c:52c1 with SMTP id 6a1803df08f44-908302a7f25mr4192236d6.38.1785356068701;
        Wed, 29 Jul 2026 13:14:28 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8cb0dsm32033066d6.48.2026.07.29.13.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:14:27 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Wed, 29 Jul 2026 16:14:19 -0400
Message-Id: <20260729201420.4047677-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
References: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

keep-power-in-suspend already documents exactly the requirement
needed on (e)MMC platforms where firmware accesses the card directly
during resume. Rather than add a separate property describing the
same contract, drop its "SDIO only" restriction and document the
(e)MMC use case alongside the existing SDIO one.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
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

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e9461c..f4663b318435 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -291,7 +291,12 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle. For SDIO,
+      this is a request an individual function driver can make at
+      runtime via sdio_set_host_pm_flags(). For (e)MMC, it is instead
+      a fixed platform characteristic, needed on boards where firmware
+      accesses the card directly during system resume, before the
+      kernel's own resume path runs.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.34.1

