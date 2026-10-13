Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7045328A8
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915275; cv=none; b=tJG7i+h6IoKaqU/VsqLYbi16h8aZ3jTq2xThspQGcFRhGlnzVyLv7dmPTeX6KQt2gPR8ddDiQGv1pliv078BYkP+n++cWJPCCKoklE71MuN2Ivlmvzi4ZPsn1+bPsvGPYFImbvwNm/BIgUj4Cap/gB3y1+rLMMldpdxRfJH2svk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915275; c=relaxed/simple;
	bh=iQbTrHj22Gs7DwNMUW7+LUfgxBD7Zh7/ETF2zy91H8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/ruRGWMEBH/vJr+Fb0as8y94HXBEsyvP54xXMWTo2tdZQeRgWUpqtzliedmkxHwn88+NQL7pRuAr6AYdJjtytbgBYOOMPkG7SKgdih9AAJN0+L40ZZ3DwL1s+8hJxLJbh+y7KeEN6UNCGdnlm3MOaa63PrkWuoOG74Ew/0vrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EthIRYK5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EthIRYK5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so26337355e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915271; x=1792520071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8YGoPUfH95cqoGLdZv8aHj8D7QroznBE0m7OHEnLQ4=;
        b=EthIRYK5qxoae9HLEpnbyHI1e8ZztZcJO3q7IPqvfiqmLgqseko3/RIGXTJWOIaWwf
         Ltav02bTnfMR19RR8ArynTWyFLFX68lT+wfuR1tdSUTQZRHMvSqC1suF2yC+iL76RDsM
         OZf8vOTrc6A9C4VFL3wPHQc1jyudoQbLl5OlVrn3/yAD8igJ7FcqWrZPeDUODieKgFPs
         VmoagMsXl6UmWvr1ZGTC1nWcz8PGBwOM1h7F2w0+Pq614W2+xj0SC0RG1LQ+AcZbHcgy
         Vv86aduBg9ovnF893na8lBdZhfcdDspRQC9EWudFN0VS5IPA7SjgJLeSoZ7MXYHemkPh
         kMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915271; x=1792520071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8YGoPUfH95cqoGLdZv8aHj8D7QroznBE0m7OHEnLQ4=;
        b=FrtwWGDLCjwa5KoDFqe4LArUPJAGEItt4L/xsi7zEQEVmHEvgEVABhDw5EzlfYV7MD
         eMJfeshei7GgxyeRZ/7BfSUR8hd2NlGPEZ8OpjRpHINzofIvQ4chGJ4344clxOCbYukA
         ek8kRUPc2yB7WnhLkLFpt9mXGojQ2wLvHHqLOx6SxP47j80j/YhtSnI5yoBt394XKSrz
         GonF0bHIjvdaxAnReadxwq8tws6e1fFOEOm6up2q9LPKVide7SMrZzJVUIDES1xaIf5k
         z7/ok5rmolaDAR+P8tMviLyW/5SvW2QlToog1ktCgXEKPBBE6sqQ76iECOILQ7mbb/Xm
         J+HA==
X-Forwarded-Encrypted: i=1; AKwUvBz8r4h30i2pIu70XUSHMZV+I4Oxg7pWvCGDXRnpbygDbSFeeYiz8j/lgfDUM0rUO+5tJsKgG28ZJML0@vger.kernel.org
X-Gm-Message-State: AFq9FYIakyINqgv0bgD5IQq0ikCTa+QynE2aY3g9aHGSXoAzfjuoFOfQ
	N2Af7PNxTu9C4Kp/bw3Bwqg8eHI4d7tq1UfUZgdW6EXtzoagVK7IqXhH
X-Gm-Gg: AYBFou2wVtHnDofiFnwxCZ2eQiScja6YfoN6uJM1rYUwbq9bs0Ufmh4xF1t8rLwkLfP
	Zy5+AisMLlzBruWLYVcEg++cVEAdOmAXMRH/977vFpzfXNftXloEPgeWmq+gEqDeIF7HoWlc3oz
	ZDHGUcfieJeAx/7WQORkQOsnGMF0KP48Py5tAGGtvZvUnzpiAgnaV9ZYbdE0lAuhZn6BNHoPinH
	q5E8tEBmSDlhzaEm0YiGdxJFvHY+E40Kw+PKqFMpc/h4nYzfexvBqPjEV/Spxu3v4SoEDjUzzeE
	fhks/j70m1zEPHbXmQJlG0ZOwo7zruxeYhmnBx4EmueLVslrKv5irfFvQbJfNl+CG1CZMlsxg53
	VEPjPWhfotM5ktlKLiQAt9THI4CwC+uKvv8yjfq176l5O2885a8LWSFApaqXvX5CAR+kYUAWjg2
	YgIaxfzYuACKDECbzWm/PG1bPV9cmxOH+fEUHSTaO/31N/0dRGrInXn2w148tPDMIV98J1aMTdE
	TZgTrqbowC91F8zlrLWFGs62Rk5fQ==
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr241869535e9.23.1791915271444;
        Tue, 13 Oct 2026 11:14:31 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and ti,update-config
Date: Tue, 13 Oct 2026 21:14:11 +0300
Message-ID: <20261013181417.492252-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark ti,dvs-gpio as deprecated in favor of using dvs-gpio property. The
ti,dvs-gpio is not used in any of existing in kernel device trees anyway,
so this should not break any tree. Mark ti,update-config deprecated in
favor of using the presence of the ti,general-config property as a trigger
to update.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/ti,lp872x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
index 8e74dbb3ae303..8216f1e3125d4 100644
--- a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
@@ -47,10 +47,12 @@ properties:
 
   ti,update-config:
     type: boolean
+    deprecated: true
     description: define it when LP872X_GENERAL_CFG register should be set
 
   ti,dvs-gpio:
     maxItems: 1
+    deprecated: true
     description: GPIO specifier for external DVS pin control of LP872x devices.
 
   ti,dvs-vsel:
@@ -67,6 +69,10 @@ properties:
     maxItems: 1
     description: GPIO specifier for EN pin control of LP872x devices.
 
+  dvs-gpios:
+    description: GPIO specifier for external DVS pin control.
+    maxItems: 1
+
   buck:
     type: object
     $ref: regulator.yaml#
-- 
2.53.0

