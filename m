Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38D442392
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568537; cv=none; b=FWL9VRNdOgLkd9IhKHGV/0XqHgaGfrzQUo5gynfXsLLm4UuWochXd0OvxuURJhlibcbVL3R1M8iKk2wDSP3ggwIq7PqybrDN0FiMuUzIpgiFJZIDpiQWxB6OeS09hq/HulcfiqQCUsTa6vGEF6LT5lIlq8XgJkWM5bzb2/EDmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568537; c=relaxed/simple;
	bh=0CBhCBU2Ye60x8lfkWT28rE3Pec6oVMCAnjppoXmg0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mTC7QwyXOQ98ZrSXzPQzR8lACgrf9yBFs8SxqWEBzygyg6a/xYLLV5M3j57bAtszGD7x/RWj8CTVXvQnxKcbgOHP82/QlGNIczr0j3CQVkqt5Jmo+H0NJofwODy4TkGRCnPdhFSFNRkU0F6T9PiMlcGbGtZR5C4XXeLwaiiBRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kk/gQIzU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kk/gQIzU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-481412f1828so2284f8f.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786568533; x=1787173333; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=kk/gQIzUHUpRuwetnUkg2zd8+218xzQZ0cWpq0Z/kYjdKBOv/vGMeqIYJbSfFoIe8W
         xpsbN063ic6uZs9l+buUsF9eNNLBsh5RCmVe8/nz9v0qgzpxL6Gp8TvdUbfX/Yn0myI1
         JpToS66CIkXPh32zWxh2NBL4FBhFbMqKb3sZSCEzja6O4lLJuQwAQqWlDOKHM1gAm1Zr
         m8X0lNZcWQ0r0ydC9Od6rU6XPNZ3uTL2QjKQGjQPHj7h9Y0IDa0PbJmqYT3jof1mWu+i
         XlKeWZNfKdl3nZfh16RdynpyAIAsglEEwPsoTT6hOcLs2VphyJIE5nVPUaxyJUO/wQ7c
         r8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568533; x=1787173333;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eS0igH6p3phd0yMFsnOQZ+4mmHdJrMcSmVlciJfLpEE=;
        b=SuOMUrmxvQP22IzbSkOzIuc2mPfEyFVVzKA5eW+gbPynd6aAr6vBWvvUFIx+6nf0Qb
         IkICZmq0hsNdNjGXx6y3ofkAhK5NkUCF03J49KwciQ9mhFFdgfEpVZPkIwa/ya6VxMtZ
         lLaIOIszsV4Fo8aeCQMwY4YAZmmmffsBWli/4zDqrz+whsn1jTtVbhqe+mFRPlMniBis
         h6okqIXd5gzEMPTi3dGx4d81CezwaOHY4JKtICTV2jScRHFY88uy7H9CWULQHZYWSwfT
         uR4zdMQZk8hi+foG6r5Nlb+4qbO8Owo60MbwBlJ8GCKHkGw0KvsV9qtVYLX7Cvyi+Jfs
         ixJw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Yr9v4U7H/peCiVF21sND//a5q3iFh52VkxtCneaP7M6PmvtPXNLkjnbGieiHJDQ7ho6CeQJzMpL3@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnKUR/nOD+KFrB9QiEBZ3zlRJTbfRpWDcxFkGtcV6Xoi+6ZII
	BIm47I7XIiEV2seB+NfsbdcxgFNpQZI8roU2yOzH0RbVf16o51vqgZq9Bg2G0JoaUIo=
X-Gm-Gg: AR+sD13h+lGTJphPh7SkvpiQ4XCUluTxhlpKVbfiJdvmnc5tn3XeDZUEzpMe5xXCrxR
	iwWnR8DRR8EPfByPc+Q49NhRUZaTy0XVeOAQRlBPt5Dm1C11Z/gWuuRfnQO8SuirCrjKVaWpgvi
	Hr8yRUuUaurpVL5YMqQ+6sNFi71+WfM/syoX8SozJ6t5xs8ZdAkIIWIa3W1sSigv+nImfDiir95
	M6qAz/QJyXuNV2ZXLnypAD7TeUAhCGBWJX1AZLEOoAP5txxw2Q0IG0AzAZ/sPqpd3CiTCvfN99i
	oIkZQ/ADaHawX5fvEigwRAqDbF96HnDqqqCqXAIxqN9p2lxQVuRKzc9NxJO0IDXyP1zonhxLPR2
	vbbR468CDxWqwqYgosHf30ztkAJCJ+jANuQrA7gKvGhsC2nrtgEa6UZygHOqMMbenMTgx72YWvV
	sJJ5enkEtBYiLHgCgWx/5TMW1bsaKv7qaKDNOqR9rUhAEZZRADux0k48g33sc=
X-Received: by 2002:a05:6000:2a89:b0:47f:776f:3838 with SMTP id ffacd0b85a97d-48159ca6049mr1024076f8f.6.1786568532369;
        Wed, 12 Aug 2026 14:02:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5c2769sm426055f8f.36.2026.08.12.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:02:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 23:02:02 +0200
Subject: [PATCH v2] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-allwinner-a733-spi-support-v2-1-937bff0fa78e@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEnffGoC/42NSw6CMBQAr0K69pl+RMSV9zAs2vKQZ7BtWkAJ4
 e4CXsDlJJOZmSWMhIlds5lFHCmRdyvIQ8Zsq90DgeqVmeTyzC88B911b3IOI+hCKUiBIA0h+Ng
 DKq5LbXleaMXWQIjY0GeP36sfp8E80fZbcTNaSr2P034fxeb9NRoFCChMUwtxEmhseTN66shEP
 Fr/YtWyLF+qmJyj2QAAAA==
X-Change-ID: 20260805-allwinner-a733-spi-support-e30a9ac057a3
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0CBhCBU2Ye60x8lfkWT28rE3Pec6oVMCAnjppoXmg0A=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfN9Q+u0hwY5bmCREf8SoJGx0s9FOJ2i+Jt28L
 XwaflMwzwuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzfUAAKCRDm/A8cN/La
 hadkEACsSQx6tBKrNKoNPl56rW05ntzcDV4ES4lN835wpmXCzKW5YfclSB1Hw3//6dDLcCm+Wzs
 SMFe4WKJsIrxRA4wEPiP4qPgbmG4Didsxhp2jc/A2i0Z0LeIDz++zLcvBNiqqYHDE53HyhqDANn
 QGkAootOt0gQXUrp6jB2BkVoNQFjjN6vGJd/5ciuZUmzFZ+YiK4KtBcCXQOB1ylzuI+/LzewAae
 xNpfs5uJ5OOLVeHDcpVRfVoN6t/uFLg15IKlRlCb4pqjl6X39UZXdpYhAyTRl59bdIzNcrI+3Ln
 sX2xVa69TcxRFX9PWs36m1XaWeVPT39/1gvadDYPop0UT4NBAC9hQ+gYFKx2Os5dCbNjofo0UXI
 ZuXD28tFriBHAtukty38MySAlJ/nYz23qImyc0obgyHDnzGBfH99+cZGX7LiD4ACLbHZ29OladY
 NfSavowucJuOI44ngpXIMBgtXq7TbBDoi3gXFz2ulpM4F4yNbESQfP31e2p7goeR1Szq07jr6jw
 LKk7CF/sTnqzJfJj5qYPpekMDgJoXlC+Ol+Ht4O0wvQ7CsrwXRAsUAjOoGJ5arFpaBVEvpt1saR
 fef9Tvm7vJDQVtnc3zVTtzN8QVYFtx21ZncuvU7vXTzQVI78dM1/2v5i5HPdz2bjtaLhy+2JRaA
 l9uFYaAreYhPgQw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 has six SPI controllers with the same IP as the A523.
Like the A523, one of them (spi1) also supports DBI mode.

Add SoC specific compatible strings, falling back to the A523 ones.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Changes in v2:
- Combined allwinner,sun60i-a733-spi with allwinner,sun55i-a523-spi-dbi
- Link to v1: https://patch.msgid.link/20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com
---
 Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 6af4ff233158..14c2f318dd04 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -34,6 +34,12 @@ properties:
           - const: allwinner,sun50i-r329-spi-dbi
           - const: allwinner,sun50i-r329-spi
       - items:
+          - enum:
+              - allwinner,sun55i-a523-spi-dbi
+              - allwinner,sun60i-a733-spi
+          - const: allwinner,sun55i-a523-spi
+      - items:
+          - const: allwinner,sun60i-a733-spi-dbi
           - const: allwinner,sun55i-a523-spi-dbi
           - const: allwinner,sun55i-a523-spi
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3

Best regards,
--  
Jerome

