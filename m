Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC837C0EC
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311598; cv=none; b=n/2O6jbWMkuDMKvzEVUvfttcYT32e2NyHSnqngp8fI2gMyLRDDJdJ8HJyQigJpQue4fOid3HB8kCySoCBj5VwFQ8Os8Rmaea0MDLdZxcRnLiqFeckHtZvxXoYun9yxYJSZswF8KyEMn9czq4r7te228OS9w15dCaFZDeXTIdqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311598; c=relaxed/simple;
	bh=+GOgfNtPrmMuyHFx75brM9BcQ2B58WHv8lKKR9nhUkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iCRQJ9Z0kzJQ/4C33szsDQEKWzdhVSZYDRagSvZ0GW+JLurxL/nr9lCZJBqtJEyr+OYfstVDA5WGq8YL3YEIMWubdISuJhI+eyw3tdORpx1OvZMiFm31ijpcIZSywrkZsmI8gSXmmw+nsZ9M1GqhZq5yPHptaNF/BgmbhFzJcLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MyPOkRkF; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MyPOkRkF"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-84867f07d63so9342549b3a.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311596; x=1784916396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93QkjjRqo0Te9/7g0wIib649nSDyvtIkr1k+4IQmqiM=;
        b=sITR+C8E8gXDaCKLEe2bc6G7R+VZnj+Bmujg6YK6X/+yj9kdK6Lbd9gjGrEYHTbW7K
         66YcwP8DzxkyTazL8YlFa8u+a8/LGf5o5mFlqxmN17vZUneTmaaYEet5yCyT2Y8HjHwP
         DmUuZV78kuONY6ethnRokonVWp0ublxBjYuvHOR/c9ytLsThyiWvf9WNZiudravJYytD
         EwFaMgEXk+1YgtHKHYdU0frq1AS1IC2LQHu0hE/n7c1rRPm8srXb1KP1FiVnF5scVEOJ
         QRZy8BZWl9mZ6BY1OiSDcZVCGR2NaaZge+aP4wB7di2Ucv81fJSoU38Zm5OgzljgCB9d
         ID5Q==
X-Forwarded-Encrypted: i=1; AHgh+RouojGQbX75Frmhr26JtvNefE1tjzvG4jtFvFv0is0Iyg22fw+SmdSpWa8CS1Nb9E1BhDuJmw7Ym6rC@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBopFzmVKcJOVpV0ubYmfGGuJdjU/IbPlT3rBXJ7IdKbv/f4V
	GpQnxyIdhKt/2wE9limojdOFXK6GswrFHKKoOHLWwTUKusUyWexZ7K5rafFB+DCb4gz/kYt9rN6
	vQoaiK0dXrUq7xnSDkFwlkgjmdW3chcVBIHBCAzxo6qiy/mWPWbts1KOIAL4Mn47MGFPZATjbH0
	3zmF2eKcefsrIBHHn38uscqEW1vEKGy/yve/adrF+O6YBzoU+m8QV3/+ZDrsL2LAWHNLlVAiO+J
	DjSrRO13KRJHA==
X-Gm-Gg: AfdE7ckceDBHGvuRSfNxFJn6dzSJUlku2hOP2vRMzAbxOhvyzvEv4RV+q90UolGdqVc
	Qp2YNqSRbokrl+Tu+SSGSkS/eh1dLrs1ZY+CZQBUoQO8icO8LbePWqbw0DsLuv36Qo/cJdb+Vok
	ZskKu+gWYP83sjHsErM/u5RvUhd+ggwC97lFnlNgj78MpVo2NieIh5+QUGx02FICLnYvn1jvY0p
	LMe1Q/WYjdcGtfdyBexVZPGt0X6Sji2cl0MdiKWBZrLoqtCCSVjR2Gs4xyn3NfHeRfwC0rabTzH
	BUeyS3xpYz0ti+GMJZY+IsfVvKpzdomYXJ/FIKR6p3Ti65Gv1ZG90iM1saF/3C7Ivi96X5wSGaM
	9ljyU/9zGC/Tu6e0Q0DYIJbcbHgBJA3pdPlYKSxX3aT6erzAZxQWsqsefXMIldb/bcIe9xAvjdb
	BpVpd5R7FYHmwvhkiO5I9NLK/tID71NgLU
X-Received: by 2002:a05:6a00:451a:b0:847:8842:8c63 with SMTP id d2e1a72fcca58-84c294c4e23mr3783898b3a.56.1784311596114;
        Fri, 17 Jul 2026 11:06:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-84c2afca5a8sm133578b3a.7.2026.07.17.11.06.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2026 11:06:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f871so145065376d6.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784311595; x=1784916395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93QkjjRqo0Te9/7g0wIib649nSDyvtIkr1k+4IQmqiM=;
        b=MyPOkRkFVJ1cehCqTJcpIDUTEhC7LpJyzyN8IpO8l97h1xrOnO2XkfuLlt/wa32Qzs
         mA36FYvAxUK3aRgVShGVtTuhQ4pRn1qk617xeu9G8DFU51zpsqE9/9itV/FQbEmqLYwV
         KhTQ+1zhsumYrjV4wdBirxXtwhM4EyGdiMGBo=
X-Forwarded-Encrypted: i=1; AHgh+RrqSy6xw+1qasbyr5d6JifHzUZ33GqOrMXKvzDCQ/WhQnRZPwZ/9mNuynGTCZGpkJPlWzLnvUGDehJN@vger.kernel.org
X-Received: by 2002:ad4:5f06:0:b0:8ea:658b:aff9 with SMTP id 6a1803df08f44-9077852a123mr40715516d6.50.1784311594758;
        Fri, 17 Jul 2026 11:06:34 -0700 (PDT)
X-Received: by 2002:ad4:5f06:0:b0:8ea:658b:aff9 with SMTP id 6a1803df08f44-9077852a123mr40714966d6.50.1784311594095;
        Fri, 17 Jul 2026 11:06:34 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077856002esm23175896d6.11.2026.07.17.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:06:33 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: mmc: Document no-mmc-sleep property
Date: Fri, 17 Jul 2026 14:05:35 -0400
Message-Id: <20260717180536.1757204-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
References: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Some (e)MMC devices cannot reliably resume from the SLEEP (CMD5)
state within their advertised S_A_TIMEOUT, which can be problematic
on systems that resume from Suspend-to-DRAM by first pulling boot
code from eMMC using hard wired logic that is not field updatable.
Add a no-mmc-sleep flag property so affected boards can tell the
mmc core to never put the card to sleep.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v2:
  - New patch. v1 used a card-level MMC_QUIRK_BROKEN_SLEEP quirk
    instead of a DT property; this documents the DT property backing
    the host capability added in patch 2, per Ulf's suggestion.
  - Reworded the rationale in the commit message and the binding
    description per Florian's review.

 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e9461c..11df0524530c 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -232,6 +232,14 @@ properties:
     description:
       All eMMC HS400 modes are not supported.
 
+  no-mmc-sleep:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The attached (e)MMC card cannot reliably resume from the SLEEP
+      (CMD5) state within its advertised S_A_TIMEOUT, so the
+      controller must not put it to sleep during suspend or power
+      off.
+
   dsr:
     description:
       Value the card Driver Stage Register (DSR) should be programmed
-- 
2.34.1

