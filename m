Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7404307AE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171048; cv=none; b=hm2ZVxPwB0Q8anGkWQTZ0Itglkob0IgRQyHkjPRSYWrjiwKzvv3MaMcOFctQgNKTc/G4DcbuvoboM8vp0UaXAovbQrgZalBgzhHnrqyga0n3Ko5Xqof0kbsyyRI6BFhxF3TASHvXI1ucuW8NVNyKKzxtakx2S8vTF1jBctMoV3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171048; c=relaxed/simple;
	bh=0k6bV3LH2ghjcSL5r5b8oHagkbu8nFD06A6dOv4SBPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR0ixOatHXaanV2oZ1vQBgMDCazIgtQcIOpMFGmnGZaiz2ey702Lb18aMoMRSH5bpJNsaHQIW+1weKtQxBnzEniznRgh77KVmWbNJzXpkjUjoVmDBG40E1C7Y7Y0b1XxFvHqlMeGUMlb2AVO1cmw8Qqwkz06Uir5NyFQngLZ4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1vhJhjB; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1vhJhjB"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb6573bd52so1853756a34.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785171044; x=1785775844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=E1vhJhjBZHwkumULjQaDnhA5etSTPQJjGEbSH5H98GET3IMbY6w1GCNAnTVGOkr3y5
         65wVpw//PLxFddWs2i9WqXa/+yFvhe2AxfaqPqYuRPYUpCv60AWtx42ZF7Y8wiY6DFMu
         nW58egRJFlvV42KVUZ7cfNhmzsVcXcpdRKvi6BStMs4CA7ovhshgc1OW4oFR5infDIrC
         IG3kQ9u1Bv9B6NaP1wBUacJINK9MsBH3l/TYMAsZuYUyY1WhPUDu+g4jz0V06TnLmQV4
         6ZfNnEvJiXzgyGiw20SjTSkxsMo17j7zzLD5jZ9hR4OHUhdBzN5HKoJCFr8FYUcchXyu
         oiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785171044; x=1785775844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=mxDTT5klMHpswv5DVMWSIgpcEYoKA4/XDaoBkiyePy3ah44okWua8Mc4i+cf0AKXXc
         8+z7pXOUwkmoLk9ktBetqUc8TXXxLjCSy36qND8ylqB9N5aDKLpJFh9hxbyv5y1xM3nC
         TNEUFNpRgkHSXlzhkrHFf1wIAum1W8soFXwLDyCbW6IS0tETj1H633u1gCtD1VdA3Rty
         49Mbkpz7yCNaJ/YGgfueqgEWnj2a5WCVj//ohiAaVZFhl5yGLysujtzgJ7K+MBG8tUrb
         sAPF25OSYxDz7RgMF9ZXnaaGm2/CGotpsNNQDTQDJSmTs2Pzw7tn4LFQLX8sG5don7eE
         MQsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe08DqI/whEuQeopjG74hfnooIuNooi03pPMhVyC0jbrVvO/9BtkXSSXdseO8OLeNO2vv7kw00sVss@vger.kernel.org
X-Gm-Message-State: AOJu0YwWo1/CJd7sLw5VQMrbHKYukbNitGoZVjJj8t8KRtz+LMzobpNs
	mamH5xbuNDJ5aT9SRHiM0jw5HmIEKAYO+jYr7cJH1yUMjeShE8C35f6q
X-Gm-Gg: AR+sD10w9qWTSFkrgbszY++JYJp1mOJ831bBfdpAftonWgPQG4K4z5kzqH1riCMUhsl
	pO58GGAAz6b7UfesGVANMmdkR2AkK4JcsICtpHRW84/duacT+4C4KQABhjxJrKCDcIQhsdy23EX
	2cLGmAuZH1vMu5dnGxonD+if47pARkpHetNht8d51001M1rfXcNxJMVm/yobO2hjlYxYUMf6X0Y
	gYLvDSnqEgeftoisQPUec5CdTm5XVWLTd8JQlmDjuKyKUog5oSFCzLUvqhj8Xt3G/6xeLYGs1gC
	FapvJ7pIDXG/4ZYwDyC6lBXXm+Dr8xZjfcecH6F/N+T+ve3jCxtaeS9b+0AENDYAChr7wbpEDRn
	6wCJXjKxahX6G+xNMIoBrfMyjwXzBdty8/2XrAbRrDjQM20RIRhrafATs8SszaJD2mFv5KdeXYI
	rrrxO3bwgRhr1l0OvJYJYU
X-Received: by 2002:a05:6808:144a:b0:4a3:58a6:8a2f with SMTP id 5614622812f47-4ad5606006dmr28744b6e.33.1785171044009;
        Mon, 27 Jul 2026 09:50:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:30e7:7cd7:b59:5863])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0c7a1912sm11395050b6e.2.2026.07.27.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:50:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V20 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Mon, 27 Jul 2026 11:48:06 -0500
Message-ID: <20260727164815.65190-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727164815.65190-1-macroalpha82@gmail.com>
References: <20260727164815.65190-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The icm42607 currently does not use an
interrupt because wake on movement and buffers are not supported, and
cannot be implemented on my test device which lacks an interrupt line.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

