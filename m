Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB213815D1
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260071; cv=none; b=HlXoTylvDWPjaL0X3XnBnatOQ8uYqhxxQWzo6aw4+OQmcfJzic7SlnJQyWirWDMFnw+WjmXmNW8CuHNkb80pSD7FdWw6cKdeRiUHC9qQKMOCiyOIadyOWa3z77JmHkmyOv3co33NTGbOREHB17aaYfw8SJZREj+sH37FlzJHn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260071; c=relaxed/simple;
	bh=wtktcBb0elwPMxNsNeyK28wVa40Q4Q8PglfLTyE8noM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S38JpAPK+gqPRc+R3s0hOoBhA7E5BDenM4BfmncQMoIa309UwYbUCN3FWXjaX5SuNwimW3l7d8dJAyDjy/hU9EKo/kJmsBI/GBVsgXQmDKwWpVas12Tkhyw+/zquGD2e3d5bWD0fOaoq7YK9T7P4yX7lJZlVXDyWJqTGyqGA57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS3dlMNg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS3dlMNg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso20208965e9.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260068; x=1783864868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=eS3dlMNg05RZEX+CzcpLOWHGw9AZ8538yUoRs5s7+owYCs3xLJP5CWySRZ2w9AYrlK
         gnZHN3UvTxdVPU8yTpfJYIEz8Lx1ug+nMXXoDrb3JrxB914PF4J06wPV1vmBeToBZIhc
         w7p3gS6ZsQzbFS3MzAED65pTx+5fANmnNKJzbL5NUrINlgpRZrpPAz48IrAmB6ZCMqmE
         yckGvYt/NfRXp0TkaFaqGIoyUky9qj3PlyuwEoIMeMWeNeLA+m9zq0HGTzpcCTjpz+GZ
         3Z34hD7lr/esmSwXPbkyRqKH1qjq2m1LXhc6ZwF+IO9Ecqu/OGJITXizSnvAjD6Ai1xm
         +RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260068; x=1783864868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=E0VFfutOnl3/JHBYVLzTYwZj4hqE5nA+FVcqlWW9WUPnkAwv8b8k8EQGrpMlF2hkXg
         3rzGhZEeTghok5Wrsee0OugadWsj3aYD14kLnBCa4h2zJc3ZBde6sUnhkueBq/qQQy2q
         h4akqF+UQLCuCTn+B1sWnYEa107j8PKcqk2fxD2xdO18CVdKr1+3M+xHIxkl6VG+ukjP
         XFaB4IZjSBLw4Ryh3dQZnvFKVYC2ygHqcZgDsyv5w6PEvMmIKjglgChxkptN4XV3hHAH
         lDMdUYZE10TxCXAyU0fkFLWJBnKGQFytu/GmhqGoTxB3ThygrwGUA3oQiEJC+1IxjQp4
         o0wg==
X-Forwarded-Encrypted: i=1; AFNElJ8hqjuEmee2htm2JdC3mI051PV2hliLJOwB2XFVtqctZ+1OYJA5gvvZqdE0nKJjpC17m6nLFMPtmmd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzaN/07ljqztf+8fNa1VyUaXBajtVBtwcG+/MiajJ6+FMo6jfma
	JZqc7oqVk5CoABJVlXoUG3b6ijvIpwsnzuscwQCYleZZcrmdRd9uksGj
X-Gm-Gg: AfdE7cmlVi4Hrv/SiY7va7IAbTn98A7KoztaXd6fU8DG9kyoTkloqrlnwmTSaAUpjyC
	LJ9ihqND1lOtPXWHSMuynnDyHslTSUIBzX2OyFkwMaom1vDQyB8gR8qWO2h5xpHdrWNXTvHA3vF
	6TM9j1sXU+CE8uUjxIcLIiqvgaMHBjZOgctfbaAp6PsmDF3E819ooc173WMOMDFQF9GAMHpQZ5x
	nOLdI93/ufUgkhk4zl9lGUSDGWiauUEuvte8YhsUvbqoVo5n5f5P9GoMI7iHsKQyXY9wW+cibV5
	O4vDd0ayX8mIed8O4lqA000ZdyHT7EQxlH1sGgyQMeYKQ1wQQ/j6JEeNdW6tgY8LhLHccIyHoY0
	weLbo4KxUVBAgZIJtFeuL/kK/6fw6HxI4ygU3NjkVUg2reJ1D3sutEwjFt2nzDuvnleR4Ra74eW
	8VuzKoiAcjMeNhIlkidV6DpfY=
X-Received: by 2002:a05:600c:6792:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493d11d7dd2mr74212545e9.16.1783260068120;
        Sun, 05 Jul 2026 07:01:08 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:07 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v3 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Sun,  5 Jul 2026 17:00:58 +0300
Message-Id: <20260705140100.1543486-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260705140100.1543486-1-tmaimon77@gmail.com>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NPCM750 and NPCM845 latch watchdog reset indications in the SoC
GCR block rather than in the watchdog block itself.

Add the optional nuvoton,sysgcr phandle so watchdog nodes can
reference the shared GCR reset-status registers that hold those
latched watchdog reset indications.

This is needed by the following reset-status support, which reads
those latches and reports watchdog-caused resets through bootstatus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..99c225f166db 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access the GCR reset-status registers that latch
+      watchdog reset indications on NPCM750 and NPCM845.
+
 required:
   - compatible
   - reg
-- 
2.34.1

