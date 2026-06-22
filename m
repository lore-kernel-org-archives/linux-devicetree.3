Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F349392C42
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117076; cv=none; b=ehHjZW4mwRYbt6ee4rtcbjVOpaMJnbCVtzu1QQwNKXoUqbQ+NDm3dZjsjvwRBQF1+ydngGxB8lILgQG4b0nIMT6+EInAJ6T3PtCpScKDFTPHbrXREUPvnfPSuzNtwck8cPibO5FFQVPyXRLU13AIXNIqO+5b6lrnUybSNm8WRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117076; c=relaxed/simple;
	bh=dp5DXrFD/VR2Pf30vi6TU4vpA2bUKis58HF5l5/23sU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=adBRU4N4Ru7P36j6jfQWz1dX1BNVbaJ52CEW48hihjT69qcX31rD0rGiAtt4feR+FyEs3CW4BgV9P4MFPyvxp27HLeFFTgvqI6RCyPZHFqUulJT1h1fe9zIDxd1YPpGiJlexwWoeRM9T+9kzih+/IDiarZOnajkVIn/+h/UdcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtsOO3la; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtsOO3la"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso4380418f8f.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117070; x=1782721870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=gtsOO3laBFWa7hQTUMYkOvrzhkoYZXn+VmP2rBo/+4Uh/aXkGXkU8tucRzrLcpiWvx
         E0isk6POZnFrNML12z8RURsSJlmKSAplQTQYTadOv+0ySbk2vwk9pbjE51IuvsWwGJcA
         bMrQo2RzeMqv7WDInMuJ63DvHsGasvs+y8kNHQP7pIOaVEhGDTNlUTVhyFGNtB9oSuht
         ++xO1efYEFtF0tUIaHDs3+pxBlvYe0HkttKEADIBryT0F27x6hv53PHTSAxnLItMiZ//
         3i4eufpySJ3HEob0Oi7balf9BHVLwgkfBEI/pXpsHyvIBetJ+ja+ugMfmuESV2idE3jr
         Rxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117070; x=1782721870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=XD7SlJZeLbEFIImU4qMCv31lOUXVpaPQi2nliny6rhClMdfmLlNy7528Bq0bTDpohR
         on/WXH1+kiBYI3uNVjaWeL1fVaBXLAWuWpUXkYUzeofShHSqh/2ARkr8CVCU9qC3EE5h
         AekLOTOC0H+ZGusUC22E+M5Z+017DlWo48cZu1UW2sKk+M/Tkhstc3BDuVk591C/ihEG
         ru73a6OMROA9dAL8on/MhX8MmdXtlk3zprPsCNex9mwfRnqlUO8bftil5dDRI4fzIkmZ
         5Ihgh3zsb9+eY9LEki324YSJDAeJBxtLQgscIhARL2XdOXn8/vELWUj3gnoyBxdK0xgR
         gQWg==
X-Forwarded-Encrypted: i=1; AFNElJ+PP8/99DCdnA5m/YYRGcwxVbGRIvQN+7bCQXljEU11OU1zUr+j/lGWz7uoxxLm1Ur460IwkModEjl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxM3tJryYwZ4E3oEf/bn8OYUVJVUkui/lEkNs+pXIkE0zLwNkBm
	CkfGpK4gQfeP0dgQFedRjpdPQXWj1fCNHMTruCYfp0t1zJKUmprgVj7+
X-Gm-Gg: AfdE7ckvACdCm8d9ypV9lf7JMozK316sTJOoS2Ryn8babtpJc6xlDmoVoZ/yz6Nqlol
	1ZAc3rqz2vj3tSFe4l82OY3To1y1Z063bKJbohIyuWMQGC6P/XRIkf+0xrrkxoT5WLbqfAdBCRW
	pa+jcMJVjjBVfl5pUiqfYXOSy2VR9C/OVvXNaBmeNQeGTMS7nf1EXlYgARpVuIyMJVzJ7lbPOyE
	dOzJC19+yrs4Yx8lPJ2e9F4znaavdrfDBWmNRrxDZxa2ycFSi2Ta9Ddy1zFU4mvo6VUQYvxURM4
	z5khooBa395WEPtRUSCHhY4K3Y44Le8qyBHcyPmUh0GmluXq1Rn/pg6Xwlgw0rRKmzm1mGpamzW
	eQMfg5qJb2/BXgETRwWagYHD+0tUkRNzTjigWHVKMUgK/40fF2NNQUq3DOkUeBpOFyKXcsmndJN
	+8Rm12aUzaXDhIILh+3SV7SOs=
X-Received: by 2002:a05:600c:5285:b0:492:4640:cf59 with SMTP id 5b1f17b1804b1-4924640cf67mr192104875e9.36.1782117069622;
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Mon, 22 Jun 2026 11:30:44 +0300
Message-Id: <20260622083046.3189603-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe syscon property that handles general control registers (GCR) in
Nuvoton BMC NPCM watchdog driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..4f00f099b2d2 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
+      instances.
+
 required:
   - compatible
   - reg
-- 
2.34.1

