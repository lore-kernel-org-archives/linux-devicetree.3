Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073093DCD8D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367978; cv=none; b=FEL6aRCPqiQ6XLDS+1Lsv4YxosRLJDi1uIpi/FiztACHebhLVPT3SMgFgm3GQkq/sSQCGBvXzfrigQKb7euWKrvTGCjR2QdPFmGYzZU1x0vIgPQQY922teEbwDYOVepv+Fea5LCppy5+gnS8Jd1JAvz55OJf3rGM5HqmjhOAYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367978; c=relaxed/simple;
	bh=0lYRvkZXuSchRHY00awUjYx5PGi5688DqkEBenX/jOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y84E5+oEAqgJP8RFsq7vEvYuNq9K+ZOExfTIxEB41taTnUhBOiwm3ZSXPYuTgEd/HofatlHrn5jcbnqDNwzTLdWKFgoy940+s2qiPcm4tDnuLtSMQKs4Xg1korACrYJliv9tAC+RrJvmrZJPCrJY9r8AHyCeb15zbZulTfI4Xu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bdX/8yZ4; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bdX/8yZ4"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb64085c45so2144733a34.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367970; x=1783972770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G6pGuOuOyYcWebHVgbsnO4yO7+jMa9pCvWAaZf6rmM=;
        b=bdX/8yZ4k7aUNHw9yIWVEZ3En+Sbno+64PmLSmC++7kGtvTlUwWYFyGpF4Y+rOA/YD
         Bb8UYmUAwErnUSlBokky5N5M64WXHo40U+m5w+rZNT2W/zY/pbMVZGwVsq+gi04yLTlY
         5ZHIju2FAhJjKeyAYGFpT2ZioevBXZXiEb4Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367970; x=1783972770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8G6pGuOuOyYcWebHVgbsnO4yO7+jMa9pCvWAaZf6rmM=;
        b=noiyInNFM4koodknMgOdsSwiTkqSclgF5l4P88lNBjtLibeyPUPrrEJm/C+uQEAn65
         BG/YL4UDTJIrP9ULxSSw7CTOlhlo/dLjfyQgxOfJ78JCVZddk+V/lg87uwSeRqUA3TPM
         wkgBYK3Qh7CjgaOGo9rP4lJqj1j3pJ9UMhRDJioZ/OD0lGwnGKQDain/5O75Fn8NYZLK
         ePGnPuI6JNNl0P7Qz+JQFvkpECpAohbqFe+P7lPJ4huLgsahY6nr0p9/14i9qpPVEZrZ
         OMTwyyj5eNbwQ53GUUl+gI/VB64sciFZ3I7qdG8ogThDXg/ZjUjvawUZQmcL1dQd8HlP
         mKtg==
X-Forwarded-Encrypted: i=1; AFNElJ+YIVJ6l4f6okBmVhOi4+RWwBYB7BpaFkAK0fZoM2rC0Phq/zHGzFSSp/x+RtR2GwJi4+itYRT5TpH+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/JUklQCbpyXIqRcBpDTiRaFD8kl6uzF/QAHhbDGswr73plxX
	i7SvWHQVQJue1ZiWxtLJHoZJsA6d4e1kBX/VzLld852UvxLW9VU2lBfx5ctW5Y0eMA==
X-Gm-Gg: AfdE7cn5yCGIxYbPDhxPhq3s7g5I0A+EfBd0cawQTAlaQIpnVJZyTgRR7cmJACVv+VD
	VgzpNHmUmN47ArpwU3Mnnvvo4mYgdsm4w95+NkZWJYK6HZ0BEnkankGiDkU4injJPG3gJjQIeFM
	Rah9OEjQUq5XermFi6vsJ1ORQ3RxGfNm3IW+82bv+zEofTkiV6MrRYXftmV8z0er1DRzwJSxZ3z
	WwnM2Zu2TuyLiu4Xmhtk4C/beIVW+amkElh1Uah4Q1U7zCL2DXhZFW+nq4mJ5/MmnFWIjsR/m0Y
	Vrw9XNQLd1h2qwR87uzilb+mCSoH4hCjbFtjrtH7U0YVujzSYfKJpmnIdXI/6oYSl/Dl0R96rsr
	CAba0gnd0ys72Or23Z7hE9XPw3en3i6xE2pr5imUHHKui+9jWalFTteticfyUmAvt2NB0Ulo2Jl
	GfIwFkgvo=
X-Received: by 2002:a05:6830:82fc:b0:7e9:dbbe:5af4 with SMTP id 46e09a7af769-7ebb23b0a45mr1303771a34.32.1783367970287;
        Mon, 06 Jul 2026 12:59:30 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:29 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jamie Iles <jamie@jamieiles.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 08/12] dt-bindings: watchdog: snps,dw-wdt: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:04 -0600
Message-ID: <20260706195818.3906949-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the watchdog of the Rockchip RV1106, which is
compatible with the Synopsys DesignWare watchdog.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 9d25f5e497e2..2b16b7c2787b 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -35,6 +35,7 @@ properties:
               - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
               - rockchip,rv1103b-wdt
+              - rockchip,rv1106-wdt
               - rockchip,rv1108-wdt
               - rockchip,rv1126-wdt
           - const: snps,dw-wdt
-- 
2.43.0

