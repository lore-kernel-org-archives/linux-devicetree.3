Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8A394794
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521956; cv=none; b=JgXxwn7c+wBTiyn6QGKlXjJ09S8nW4WPLPNInbLU+aEYmAIr9F0XRTbF8BxozSm/Q21nJ+Q1Wlr3RqlTYgMF+hZZhspmEMwxheT2IucBHyYc6hGESrIdkVWfnASf5mYk3Z5+hBtSmVyuXUShbBP7z6Rcy2lJN4TpZbDSR0bJl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521956; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdXvemRYTXRKIz/llbGM+kpLU7M1RGiVO32b9Fe02bvAUc+J+GUE2w1KBSDSXEOcHoFtP2EMzKE/wZo7rWkyB0aAiUa6CNe8FJhvUG88kdI/vq4MUEazh6Ose6b0TzSom2pcr0xHamRNu25mTYKgQdmSojiRpv12eU6O1+AHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq2LIlwO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq2LIlwO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so962605e9.0
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521953; x=1791126753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=fq2LIlwOjgj++P1mVuzsLl/m+qWW6vOoShRUgRxdUoJafrJUkmUkKqpIKU7YRi0JJ3
         Bc+Po1+cypX6jFZ21GL+eo0rHC3t7SXQcbPgEzyKWPtpOO7e7rFZBvbVxFW2cA8FWDuf
         Sp8u+3/2DWCNvjjsC2M6CsYx9mbC1qwmAIx5KHDgV1qXXREEnPbc4gjhLwNh9Bs5vwrn
         lTgtsxlCgGrq8z9Al+j30r2fJDbdfx1zkzOb4+PwADuJfzvoOVwpzgati/dsBwbAiF/n
         6/aiVSXo5J1exqbnwy6my8lqb5VSuagOza9AODD8E4T58bMy7GCs/J5J+w+lZRk016iy
         578A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521953; x=1791126753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=PtLn3U2WTKZeTdnoIegcMSUJF+frZpMZgDjgcQAh/JTWQHrXhK0a0EcjjFXaZci9gB
         U/wvBVO0Yr9CWnY4ADL3rEP8fQga/TDcWZUhT7G11WMpUAQOzXc78nHIgX/fYPHSlZLv
         C7rB7Hq5d4+sxI9qkeE/Clmzu+bOgdySQFHFeezU0/8skP4/ORLGggX7v12lSmrBmsRU
         ZRkdMiKSwCkmbgGbxaxlc05vtT2+0UkRpKPJe0kxfSbDYMwpgljn8oGrug1iqdCMJALp
         udt4YrVjC4jFWo0oXa6H6C1GbB1PB665+6+/l42k2W+FwHWuqcOAXrfBpYVU9p+QG3TF
         KE1g==
X-Forwarded-Encrypted: i=1; AKwUvBzlaJNtsyvsIm56CjLfWYuYYdjxOZbKzm0Ym6h0TS0YwidFEF8EkKquzLE9Bt+oYUswBQOBxsCfiAQD@vger.kernel.org
X-Gm-Message-State: AFuF++kjRXSwKIA4ebEqcg1q5R98yXmsOW2DUHFOCweQe42EcO5jOM5F
	2r6fGuofjlwfjOtHDRVB6o8oyBfVjjjEBS6mN556IJehyCGwG8UyH+Cg
X-Gm-Gg: AYBFou1TCLDPGhSTu+LFVBdaYvO3HI9aOBh9kF/z8Qrt638nyyEPfJrqNWI9wzcOhzl
	WwRav9Es/qwSpLfosR1xXFBzOUY5RbUErwYx3Xd/oHcPVn6sPi3vXW2q+YwK+T+J7zRe/NjAs9i
	7jWXwaongPx4sGP+FVW4KYY15UAr+N4mcCjcrb/gjZzx9jIZH20H8sBHSg+I1BcBJ9+FYNyAJX6
	QOnuKRCZ/Ss/Q1k4UE5Nd6FtbiCp7YhJU76wnSkF/9f0VTJYfDLEu9Fd9pBY+6V+3Khbk/8RF8W
	v/J/N4jMqZZbtqimnNBluFbcZ/9kQ2CKw0/s7pV2KS/l0mvcmdK4MUB6m6tEnp6kIMA9A4kuOKM
	5VJb6IONHVSFj+Erp7z+7DX/ob0pycLAiRF+JNv5f7lZocDqxusKXKWXC35ORCqfLXjeXjpMf8+
	MZnvI2+Vkg52o5wvSsuIHZrqZZCrtSITaJzotwOBPUjbGjNe5ZHqsEuBPotqE8Zn01biQ1eReEp
	dyrzMpH7id58nfDuDPU0bdWRw+XbZ+z
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr139499825e9.2.1790521952673;
        Sun, 27 Sep 2026 08:12:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:13 +0100
Message-ID: <20260927151016.186493-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

