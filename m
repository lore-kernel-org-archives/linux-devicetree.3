Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F354A1E02
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263753; cv=none; b=dKD2mVcPEglIuZZ0lOgyBl0TkoR9cv5aHjjE1tX3cGybDeHy5W9gerJLfxpAvqDOr2Chvp175C+JBYSY+NzL8zP7tBXd98OFCcNUc98fPWPaWLW1BiUiS6unftXWBwFjDkYHgRanBh88nXJLux3U+EQrGI2Yy2uUFXy5Vdk2Res=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263753; c=relaxed/simple;
	bh=UhuqCk57WeKXY+hI7wFJKWOE0Yfd6k1xI6Ll5+toYy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vz4SmEmmoK339UiY0yjq4YWD/po4H0ZyvTEMvaRvVRIDweWpdmHbNSnKI8aB9HmlyifG5VV7NQPuT1xljcv0MhIEG/4uwG1FvLRyYFtDOJroWBY/2QVw4yUSpPzkSvXpMirEDGGiQkaMsf3dDsi6B802B/Od72L+naU0xybZcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=J0eOWtrL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="J0eOWtrL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48870973bddso435400f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263748; x=1790868548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=J0eOWtrL5qJ/HCPPYmNA6axSeAqwyddCceOGhQlFft02wG1s8VYKl9gnhEV2d4+imz
         fHnB+s08OdJDBIwrUe7gDzwSw/h8bvC0gGgAdHrZuFQzjIU52e64GBHVwNOMbQmXfKRb
         Yhl5dGoDFmXqCVY7LBTlx2UpuTGbNELZQOSESy2lvukmm+uTLyMRDjVyIgyWxI/Kv0e7
         21pf7+9wkpwhI1/bgT+jcxqUGpWqU8oK1lBAqKrcX6qU6KTxamBHCZwRcuTz5lNEMiyc
         F3MESuVG3UOOK536UUwISnA7mB0G8TV8l67dVBtqnqx0v8lUxIThLviLwkBQrmRUR1bp
         sJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263748; x=1790868548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=OPbQcHyfmCyBfctjLwZp8TawhKY7LH4JVgAQGqJlLvMGGoY6udzlSMFEjxUsd2Wy23
         c8b1oe5HyzOWZ4gOS6pwM4AIeLMtX3HQvE+X1uTCHakFnF/1RUCxKzQFh71Ehw7FLXik
         mstSquJ6NHGliC5fC1cb5jz9FAR1pNJSVzfVuBi3FELH/kb5O/Fwad+xppNoOGgRxz6n
         R7RxNM0FUkMfuPrN8wavMP593FpsJ0qW/fVrDhDuYDdvCjf3QPHxA2Qz8QjNsAh8T9ks
         ftkEpZ4lyxqXUDpbgdciBNTfleMAwIBcmz642T8jQ546KuJlQgvEes1SOO4z+omEwzuP
         UHmA==
X-Gm-Message-State: AFuF++mkXxNC3srMhrMNDtEq83CwhRIKcHIo8+6sUw6cRJE24RfYeQEt
	cWK7zry2sgyZiatgnqa2IyD0128yzk+qCxDmVc6MKMNZ4wkar6hQHWuv29CAUxxeDfU=
X-Gm-Gg: AYBFou31juzhUIOQtxtrVonNwmcyFMfcfJ+COU7B0bXwGSt943saCh4xUg1LWuTNJg1
	V0M/08c4ClP81P+dNs+wkaMc23kIdT6NXzpVIAINZLar+VEOReLGQ+I7sgxmXQ9Uc6I4UUD//xz
	GDx91l95Pp4AQHPhM87iTBbl1D78Du2QKJPvN+RhU+1BT2vqHTiZEsaL07k/W0Zh4ciUkjNPsX8
	PwotckzRSmrRdNMtymcuCr1eagGXrW0FeWtI1dlvuFVBC2J0HrJBOFAu3fG2mHblAw9sj5XRRFk
	tRTRbVtno4QGp51iQtzDnPrCV5eCwjd3plWddm2T8wrKVOTPWw20kT1/rBxa5OW/Fro05eHeycW
	gAQD4cb6VlrNJ0uV3+qG28ZE6ryj1MKLdroKzAl//4iCmfl8fMMag7248feniveSnAmkER5ck5R
	X1eOXP5uNTjRRcqQkktI0JSHc/mtWgLT2McOrEka6FaT22XPRr2it+g7uzvCjhzqjURRRLN8YNq
	nek+YZTkredUQ1Ygrj/YlZTRGuIG8DHRKNA
X-Received: by 2002:a05:6000:650:b0:487:152:e57c with SMTP id ffacd0b85a97d-488716a4f90mr5500385f8f.1.1790263748191;
        Thu, 24 Sep 2026 08:29:08 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:07 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 24 Sep 2026 17:28:39 +0200
Message-ID: <20260924152844.81705-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacturer.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..8a984fea11c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1728,6 +1728,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.53.0

