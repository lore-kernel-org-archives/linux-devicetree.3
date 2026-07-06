Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6C3BB66C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328391; cv=none; b=qokdtGOnDGd8q5lODVpR0BR2vhuLSNF4+pdLoxKe5bha43JKGfnXVvDs6qDtfTuO0SYOIe/adkl0ZDFNkP1Df5YpZTuSuzFq16WWMM4lKdWmttbU5Wv2IH4RKj7cp5gAcXCa2qZ0FadAsfv8YXtYQznmyxx4t5oGRBaTi0/Nqbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328391; c=relaxed/simple;
	bh=oGRIGZFPt9oa1ooXvjGRLIlrHTPHd8OZnJZAYil/EvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCyobHdPsiOBxLs1uyZMwzaRF4eYHqhWaoW5tshLA2s+d7mJ9nqST1dm9ZQeO9I0uFqmn4ySmwHnpHMoDf9K8GLAkGjZDy5uoIBYIV1Gn07gensrWPFooJJbIe7JMO+q6g3XShBDU2ZmrsVtkjy/2eaoxTmhRYeJksGoLw22Sbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBMgyw5i; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBMgyw5i"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-474303f3c72so1592858f8f.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328378; x=1783933178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4o0vMyMTghgzXqIzEekqpdjiKzmBMwkS6JVXHiiNM=;
        b=dBMgyw5iRGElTpzeS01QygOMxsODy3f3rOLTHWWQqHNHrXFMB37COxhnxf2rzQ1vPi
         cDFr0f3kJhxq5eOmZ347Utkc4n9jsko/CNI2GOB6BJaMozJmwHYtGYfW0eDLGpyJkrSz
         hj7pGwStL0d7klvcqN4dBTKm1IPONKxGQ44woe7l0AX171ZeMka7g4zeM1Mktp0TER5d
         NNZlmaqbhNR47ZaxomdP5P6kTyeext9bMtGdHh4GHnLBVDUW/Ix4dcN20g/46G5s+0xQ
         EvX263gnnu01On7cPHYhN6HB2McPMuzaBSp8TBRNOyr/rjeOFBOtODi7A52WbmnLfqZZ
         lpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328378; x=1783933178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4o0vMyMTghgzXqIzEekqpdjiKzmBMwkS6JVXHiiNM=;
        b=nk2FTCmjCs5t9Slebr5S7OhLc5JqlYReV+HctKLABzr1g5xKWeyHlyU8nxKgmDrKoC
         GIxfRB4Av7kGL3LkoRCi9kuvoGJonylgxQkiWMGsZUr+ErdIg7a7ms7nxYyxFQ947s/J
         k7kc9O9R3w+0Y1OsG38kXYGLPGY7Ca9KFqnFVmFOVMyeuxLa9t7McTDG5KfDLdeDC5Kh
         fEBNT1R2TBETkZLKS8OSJ7jJb3Ul9BP2xYim9W7/vB2K+Zmbq13/QWcuTn2xb1k5AbIH
         1gPVVDRvxpaHaRZzsRwhZVpvW2K8czMbH8+zdsOuLixgcRtc+OILqZsy3orX+qmZJg92
         +pcg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1cjprPgMNl/7Ig0PrZn3fnLk249lNE0nqYQIp+471R1RsAZ//QoohddQLwpTX8SlLcYeXwKQAe4lp@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+xwHkEeEYOW87TZWsu9N1+RH7tQTVpYQlPFAdFQvisO+xKOB
	g943wt5WThwQAuRG+qP1R6SYUxl3r/l8zWWBGsM/7I+4SaDoXXCC+lRT
X-Gm-Gg: AfdE7cnNeULfcJLb3fGYgdOk6vHd8wYZMehBjvd384ifJkIS35SUZJdRtCXMTzZ66gP
	lSW9ITMPGEPWPDY+m5pBwvkVVDaTTIVZOgd5FDCeUyqXHr8t4rMa6o9cpRBA/ky7VXghf7aI1TT
	xaWVPouTYilllvRXJSHMUDFpLTUeQyIYRsvTvyms+4MpnFQwg2EpB/KZl3jSN3XKB3mFDO+lggs
	Id9myuW9GrWjV4KhLppiw+GYpPmhJPXPqOgGylQjmTshXY/LClimPMSlrYiGuO/+X7aG8OPa3lR
	5AnWm3wuTUXFy7xhgDddPZiKjGUUPNvQuSLOBf970NqLLgr/9LxW7FjqcIf60OXKjZMxK5eXcYi
	G3qzvPvd4U5lnKS1smu5VCMu1Pq/pMzOakpBM+vmk5mKC87tKrR8jH1cSA7rBjXJFG1xa12/tIT
	/bp6+J9WB2R4KIICpDdhveNvUGtPN1lyXXg8e+IlAUb/YfHltriXsKlRk=
X-Received: by 2002:a05:6000:4698:b0:475:36a:8c97 with SMTP id ffacd0b85a97d-47aab76f017mr7729353f8f.45.1783328377651;
        Mon, 06 Jul 2026 01:59:37 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm22314373f8f.23.2026.07.06.01.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:59:37 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 2/5] dt-bindings: soc: ti: omap-dsp: Make ti,hwmods optional
Date: Mon,  6 Jul 2026 08:59:14 +0000
Message-ID: <20260706085917.835875-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706085917.835875-1-egbostina@gmail.com>
References: <20260706085917.835875-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the 'ti,hwmods' property optional to resolve dtbs_check warnings,
as several in-tree device trees currently omit it.

A review of the ti-sysc driver (drivers/bus/ti-sysc.c)
shows that the property is not strictly required for probing. The driver
only reads it to populate the 'ddata->legacy_mode' flag. If the property
is absent, the probe sequence continues normally without error.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml b/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml
index a97e163c890a..09d0ebf2cb13 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml
@@ -20,7 +20,6 @@ properties:
 
 required:
   - compatible
-  - ti,hwmods
 
 additionalProperties: false
 
-- 
2.43.0

