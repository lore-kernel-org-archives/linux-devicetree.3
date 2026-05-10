Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2F233704
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442617; cv=none; b=iK8p6v6eO09gzsPdY6R0Ld8XZO/8GAYcoPRlDLqbYHmX6i2+4v3K/s1G7V9NffVER4ZFgBSW+CfVwG65liD7tJXIIxeufDeYJ4jzq9fQG+TWfN5JPU8wg/7sA3BE9EgT4pJdu/pExU9Q88EmZXLGtm81wnoNEQERRfjeiN7lOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442617; c=relaxed/simple;
	bh=9STMCiEcQygyJc7CSDMCOsAD6GSfrDVZtYpT9m5OWMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUtOCKdWWRAD3ZhgSVyJYb/iI972kVB4fCEUONGn5Gwz6bx/aHW/R+BtFLBL7By5nJsBKSVNd9y5vMEDzc+YutmYez/EyaHwT3ZaNGoquBxZNy5SyV0sPDKHozWJSKenxT6LsOxEVtAEKI/6FTbKH704dARTPoxn4ECj/x3HT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwgMelQY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwgMelQY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b4583f0a1aso22297705ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442616; x=1779047416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOolxxVKA/S7akHh6l/gIw1iUq8tQWrXL9QU7Cp8/+I=;
        b=gwgMelQYOvQ0IKjZqOeDVvswaayFkfPeOi0MqT5F/Y94l9MxyrsWS1gV8dclc50djk
         qmku3o1onthNujTSF1KLu8ZHGj8wnvwEh4aVos27rpG4wZCDXrA86K+L3E4HhLU1C9kp
         BmD7216UCTW1IbrpMcO94YFqE/uiYvGklWXUoZmnjKNGM0MNTR41G94aehMgSbz0CIeE
         vlj/RY5oHb763PmNSauBhgE8aL+LgMuiGbXHVyy/7SRFCjME5Mvh8heLJQcnngidZUlU
         Ag0Mgg02BcrATUikEGhxmXNKOi+xRdv19u253G12NniD4Ho9ABb0bKfUku8JlAMr87ko
         RaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442616; x=1779047416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOolxxVKA/S7akHh6l/gIw1iUq8tQWrXL9QU7Cp8/+I=;
        b=QjXFNRV091UvGDSSi9ZmaJ0lIPDewRZB9XTrH/rD2eg3wQWb4jYERahvuQZlEWUBC0
         t6RhMm83dboEuNDqjLj3gcTVb1ScsIkcgfCii4PS2Hf0rrvyOgCl52Xx/hELKlEseBbJ
         kxxeXvOh52fw8l81Geipneoui+jrYkw5hKJuWQqIbUXWtQeJApW6aYJpS9DljKnSvKon
         RjtQ98arTwCZV5PtBFB+NmPRUEvyJHe7MSxba0yB5ajKHD4gi1aChVwp7RwVqRjE7+VS
         JUiUBkqhkRT3bSNC+7gO/ivUIbsi7v8ecw/dDpmzWU/WMG7zi4h9n/0dqp/0E8/WWvqz
         y1TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Gl0XWfG2LtRIsQT6DCMoDkwbVxLfWGmmI24EzI8yAf6/n3LY9WKY7ytZ+Xp5AZRSx2SNebKATW5cz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HgGUK+G91Tz16yhnOspTNL3yMQmrCjHM69yJvIwUQ2GihZF8
	A9JDEcGZCJv8QrgnborrYikemTfJoKLNFErTi2GjStXOW20CWP986D9D
X-Gm-Gg: Acq92OEaSZCySAorG2MrXZ9ywWuZ68Sv8nNOqPWV5efQH5BH4nlQ3thtEbSi6BtfBqY
	v/hUKSTzu/1payFSAFMIDJBHGdvv3KO2I3yjnZS9jGfYrh1Xy+1l3IfPqn69zB67RLGaYQ7hJ8X
	xHgLwH5rO8+CcJWRlTU+6JX6TjExXtT86UiP6NZYW9AdSspZrbEciDu8LO3gvzQIcDxeKO5CuuD
	I96ec9DLaOaLY7oSGvBfvkcVRJQEU+3Cj53KNA1SxGF9IZ5DwutgrJNn0cS1gzZDEd9g4duKSZ5
	Nm06+RUAHvnnl1zGp0nNpRNaSz2niilufha6TSlSkxtFm7xaguD5lGVnXrCOZ5DU0BN7pScj+Uv
	DLfdLMWgMHBd9FcsOQNfbmO6Fh4EqH+wjv3dSpay+oXThftq0gjyywXl8cY6dK44QUtlg4s+ma9
	o7XfGlg4xGWva9xVoEE5EI7vu+pGCgx+chZIQ+hE6N6ISWOdxR8f6X1tggcO3krjrChx6yzCx/o
	tL+phAgciK9wY5pNfr4wVwd4qU8tvYUxWmM3pHNZmF/NDkkDEuzBj08FJgBhAvTZrq6FvU=
X-Received: by 2002:a17:902:e747:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2bc7aa20488mr72912765ad.21.1778442615602;
        Sun, 10 May 2026 12:50:15 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:50:15 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Mon, 11 May 2026 01:19:24 +0530
Message-ID: <20260510194947.31997-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional VSUP supply used by the HX711 on-chip regulator.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 1ea60dff98d5..a8eaa1f18de5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -33,6 +33,10 @@ properties:
     description:
       Analog supply voltage (AVDD).
 
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
-- 
2.43.0

