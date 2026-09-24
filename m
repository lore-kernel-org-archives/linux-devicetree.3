Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE33F4822
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268603; cv=none; b=GfBw6SXO4TXHHy+2zseILsB/lzbaG9Fcc/ul1KzUB/P9Y/G5wbEreQKm2FeijBPlSIgSwzZ8co5m8h0A30LsqWmp3YYs9gtnIfqOlVvsHzU0zhCkawV/zjPzUvj2j8LERJgH6smUM4KXr2NOYJVsprxtbMXbAfUdi9k0ApXZ8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268603; c=relaxed/simple;
	bh=UhuqCk57WeKXY+hI7wFJKWOE0Yfd6k1xI6Ll5+toYy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBd08qQF2wxNJN4ksgMzsHsWokHFur8DBmOwON/NHqqnHce02RX3Wi3Tcn1hBdblYJ3uoksxGlXkBiko8lO6aEEvIsDuz+sCX/qDtcroLj6kg3njulZaWzizCjLsS1VI8u/eQ+BkGNoLGxj0Q3aCjGBLXMbKNzrHbvmRi0LnzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=sCAM8dcZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="sCAM8dcZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso22999f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268600; x=1790873400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=sCAM8dcZA7tl/QculUbG5vve70k3etahvt7FlK+4HsqtNKE8LzgEOyzu9YIxZfyPEV
         pHpROx5yQubMHXex5Wmlp9scSqwj2juldbh7Y3h/x4KH7eSfc0tBij67VWGOtxVoDUlj
         s20mNV/zDIHLByw8b//68HNybfUtOQq2C4JjFtjfmBzFdluVsIzButN7MPCBAS7Fdg+a
         +P5Jvm2KcWpvKFtU6Vaj/58zcEronTyaWYUZZP8934MxdYJ5yw9pi94P+VwM78Y1JI+m
         QCIvvPMsIlfgDcnRKpIOnYWQ7bn+bRELG2bDIoVB4ahqtEODaKIJu42WGGr6x2SsvdwI
         cX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268600; x=1790873400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=sfhTtMQ2o333jfD7kzda167k4XKhWD+FcqxdllYiIyQcK/ixMtMRZrICyvlr1VU7p3
         cIndxu/sw31HQp0mMA9eoGT9/kJz9mB6//od0xkCYj3IC0q/ohqe7WpcfNo6XPBnA6Ju
         Zq6FjP7E7UYP5MBS9SAc+IMgUxjN2dAWf6mw7WxqPzHZhAXRVO2Y8AHjjAOzLzSZpSmA
         qKqFGbO05sTwYeufg+w7KLW8JmN4aSCk34bdS2Oifs6MDS5XmTf/xMk3GARWMxTuDdtJ
         K/cu7fLeFibwRm63Ikc8J/8XwtrUws9m/2uT8e0ET5c/PXr8hRuGpRec9+iCLLWigk7Q
         0tZw==
X-Gm-Message-State: AFuF++mvkbhGhYc6EfqT5dIfuEq6Or4+i9Snz5HXalMJVPIGTQpX9zwj
	HJAzwZ+J3yv3QGvfc8T1hsf4kKvYKTNTszR5cm6BdESqVtJaiwNkQEt9nkh10qnGjbqqUyhvoE8
	/LhpJQ5k=
X-Gm-Gg: AYBFou1a6ghnKwpWhd4F1dHhZspg/hwBIYnob0iMtn1JGQrLkZ26D4bg6ke/MXj2/sd
	ciK3kCxOSWcxrBDc7GTHZbE0cK0dlQLyZCHAOp2q2uSd0RF6yI3HFjnWgkzVEmwcIFs4mhYzzZq
	JmPxE+ynVd/kQDt09CXCA5oNCJ6kNGEn0M73R1vBaVTXQavGBCaBcUq14KT6mSpfEmYeO+N4zwW
	Pws0y+9b5QdCjFYL1iLpnRxqdNXMdAWZ5DuQU8fDMrSGPd+7qNRRCoh8HW7f1mg1vcA4DBykO42
	3aOSQJvVy2qjEQ5Ao/I+b3lo9xOJJ69rMYmsjkJaoiDdevcq40M85FXslmDPN03371KE+VnkE5f
	WhtSctOuhDIGnXFZ6QCdO9yopKs2oBS/Z7NjbaxuLSNu4zFAQM8KtRF7yny4OHVcObNeb3tgFtV
	phLjn425SVrjVSvxs394ek5NzJxv9OrSc5RexoiZhJbjv5xmaWvych4u+GfcIFiRBKzE+OlpL4u
	QNxIJ2u3YoE/mb4/xlp3cnnAT4uOw8DIqmP
X-Received: by 2002:a5d:5f03:0:b0:487:d7e:52c7 with SMTP id ffacd0b85a97d-48872a717b0mr5399359f8f.19.1790268599850;
        Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:58 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 24 Sep 2026 18:49:17 +0200
Message-ID: <20260924164922.117236-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
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

