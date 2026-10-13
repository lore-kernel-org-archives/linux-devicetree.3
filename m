Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9ED4EC66A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890513; cv=none; b=DSdj+IEPzc231clCEINcWLTVAB1nkYapyS1bxKzu5csMSHXIht9E2Ne1PWb++EENDwFdqRKRFGMcJODQUUUpL7ZCHrRCLpBNqGVhY6Tn5JjdB+F/M3oeBk9c7AEvNNqOQJLdm4gW5NX8C5yfripTR5GPnYs5LLCVoNuv+AlWscE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890513; c=relaxed/simple;
	bh=nEBAEcr1DpggMNA7XbubOTPWUzXKTrOJxdCh4sDtEpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzWUkWEBqtNrbeHErGWBFNpKe/0pSHIKLy9ZJ+RZHJbECzSEMq67XXUEcZmSF5HKNfWrgw/7d4xYZeCkPOg7Jl8DP7+O3Lfh1z3DYJx+6MF2J7qB8rWQRD/7dnAk86AA+APpGwqOmuiyVy3sorEox9HRw1yLL3tNpW7nFwJimN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0PTmbVM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0PTmbVM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcf18ddc95so1894133e87.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890507; x=1792495307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=a0PTmbVMGoF1ttebwqEUGwsMbUMyHnvOVd37Mk29nq81yyuD5kIs/7Ws4JRW/BUZBS
         i7eHo4eKJLa8vVtaCXxbW00t2VxyZF3ENwAJ2yJpxQae2BT4DWujaznK1aryC8WH1l1U
         IQeGfVaDixBVNSycTw5g+rvbb6fXPUJwNqVaA3A6LkVqp19twMxLhPlrPAa0sK+qW8lk
         o/DbczBRekpaTv5N4IXDfNRZtShs0zcZd5rmfigUVIlATirH+lM1E3W77QbGbOGu+niL
         4Cwea3vF8AzGKKeFijSER7tIYw8m+SPvalevfFkYQVM+QE+aJsIQbjTJxsLCMR2XKc6b
         PeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890507; x=1792495307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/Zy7Y5eanQKJCoQxPls43jtvnUNLhviTL0wISl0Q1Y=;
        b=Rf6YvUs6IVrSSkIuj9n6+oe+c5PKeAdshySAbasAzd8hhFVbS3Ne03jk0JHwk7qyNF
         ep6/fE6UinI18jB6aN7DLBB7EF7MlUxMKrP17EoC7nhIPdxyGYV/41Kp8Uwj56ctUopc
         JBziPmLJIO3ky+L1r+hrSC9Ekfa0wCca8sC4/bGrsotBPnQfTJH3UyB6Qop4FXAwcjLE
         iIeEyjpViD0cMr1lNP4RTsKM4Ze3ATOKY+jGvs9NglsYcnUgx5y2Ht1lmVCRv0JfiPdX
         4CEZMLpXnvHyBFmN4za2IiHOpCz1MwL9Kq4YqTfTVuu5gntQrECV4UKs56CS+KnlHBGG
         c/9g==
X-Forwarded-Encrypted: i=1; AKwUvBwLlbqMgjaXzN/37WoppUX1qS3D6NQ2BMgVKDTnqk7bZGa8S0eZZ43f4fBzfSm5LYOintuJNaUqyH5Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLuMaKxSLyQH0gP2ImXcMBi5PFxv6I0R1fKUkgwqPUOD58/1YCE
	gRPkM3vO2kODF4Ey1/ANhnjr9wpxGh86PPqLOLqJD6liCWmWN+jSR4iH
X-Gm-Gg: AYBFou0Q4ptxUWmqOXZxFbNtAMgwXyHPdH1Pck2FVyIgnLt2im8iiKAOF7TXsihy24b
	Tg4UtwBvTX4z0Q1yQm8f4KsOjXNptVIrD8WBodLIZBYDz54BxPiyl7aiEqp93NKFLPE6whv9A2x
	V6zpeeRnpGm0TKE5U3bx7HsagYO1H6zTG6/x6CvqPRB827Zp0iy9jDRYIya8votCRaqSHMIYVqm
	x0jCEWN5X9Cb+F8aFgfZ3nVbQdPjzZpWfEjYcJKvhssKhlhfD/phNLSUyU6JmOoou6a8oAUKjXj
	+XV+HEIio+rOOUmaG5+hQ6zClmhTDXCGpTbW8GgFXUJ5AQsBCtBYnbTKLlX/rTu32NMNKxX14E9
	PbRIFoFrGTITMbKN+s7Hst1NpEfF6GECALtDF2Bz9qs2/zj83s/wwlHg8Gw/jByWaqx3yCN/pxG
	8cxjsL+Xe6eY0M/1WxGTco+d/Gl3c7D2DL5kprwK/xqcM4iKftoZ01qAwCimLSy8lrjaip0MN2Z
	o9x8wVtCxk/h9lE1OXBgxl1JtKMeE/RkRROCvJJB4fj576H0STut+KKhwSslTZcFDNwUjWOUmIk
	5tt8Pw/bKvZOpm2uhoUf53hvoO9VcCxFpYKmTQ==
X-Received: by 2002:a05:6512:692:b0:5b8:f960:1bd8 with SMTP id 2adb3069b0e04-5bcde8d91d8mr3905853e87.61.1791890506767;
        Tue, 13 Oct 2026 04:21:46 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:46 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/6] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Tue, 13 Oct 2026 14:21:20 +0300
Message-ID: <20261013112124.1878296-3-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

