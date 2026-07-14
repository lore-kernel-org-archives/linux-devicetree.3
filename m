Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A441F356
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057840; cv=none; b=lb1ynDk2QAbi/rDVinMBSf5ufXlQaYRXTtclel/jlqMz7uZCKMr46PSNmcWOEpSRP61s8Fu7j0umln/RKhE5zo4QaroGMRuxCDQnIqFFoJ1r0UDji1QdsLHwr+ywAzsnhoSjbrFAwCYeNnSMpb+CQMcQYyXtMBqxUpY1XxayKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057840; c=relaxed/simple;
	bh=H7OlT0bft/5HFAZfRGkDB9cB41sIti5GzgcKzhdN/2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0hGynmEe0Idm+/Qfwo2fhlwWXdjO0Fr3AVStK5QHEAJG95Y6/Qt+JRDO/XtrWf54ccpKnn7AGfEJaFLE7523kA7KqiNclaFQgY3asddzT1fPFOeYZ0RikBI7yGx3JNjZq+dnvIDcXtG62O51AMSr+0ItMpF+Xo1iUPz89sjgy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aEARuYor; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aEARuYor"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9f5637634so823560a34.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057837; x=1784662637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBu5PO50COeanzLU9hRHdGtnyMlkKFNMWpi+El+MyHI=;
        b=aEARuYor1TU0POr8GzkcXnUIDnbgGwxRB5R5yV9qa35Wu1vZyupkqQRK2C/appzs9i
         5QOIglJX1inVbl83vG43l1G4YnZEWhL5Ag7g1Uq1k1n0QUJwlcRAXw5ksZ3eBkfhBISu
         sSXRgL5ur3Mu5Y4/NDNG6z4J8gLAWlGBqg00Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057837; x=1784662637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBu5PO50COeanzLU9hRHdGtnyMlkKFNMWpi+El+MyHI=;
        b=R8VED9etwU/mcd2vWtD3mc0uumIXUcKevGxDpt/Pdef8ji8WAAqTHk4vU96efwCAKk
         B85t+2qzwJR8UueDkWMWBeN0Mj+apnJhzLcHwkq3KeeyuFmARq4nevOPIAkYp9h9dhSh
         5PKpWfxhGyEatI+sm0UUaT4z2zdpIrRo/AiFbyuCAbKyQZIxKPkoNaq/Yx3B4xFqdbPe
         VwFORRl7UEFSseYDe6PfjsSdUgMAOUeiMAMQvhNXm1VPD5kjYFsrrapdspphqzD44ScA
         2zK1r9xEy6EavEBMIfbvInV5UiLz2YPhLzUIo61tCQyOuP6e3w/5Y1Id/XGATosCLT8p
         0W0A==
X-Forwarded-Encrypted: i=1; AFNElJ9AEwr6CcMxVoIpAV60k/uuuMFDISNT9EmxeWyrPpXIyR9rHAQtHMYw8tjgTUb8pFRt6YW9C7xLWOrp@vger.kernel.org
X-Gm-Message-State: AOJu0YynunnlRyC/g0AWGY4dgEAkegiifM+e2G11oK2FMdr5secKmDpn
	H9XI6/5+TTQBq6rsA2V5shFioZ2jDHFvbssboYBaTF2JvWaeW0InoDz0AD7AqvXQhA==
X-Gm-Gg: AfdE7cmoBfVkMw7vFg7T4UmD0FW7xPRGFwGi0pUfBXjAf0d4DmCkG98d0RK6jRjcjMZ
	pXWemq0l1nGrk5Svraak/Dd3Kv5fek8SnVckwXMgofzYE87bP+zskEiqdn1wn0Rg/YyXQIDP4Pl
	uv7kEdcN3jqzRf7wZ+uc2+0xsFGJubKqAkyQ4AvHx770g8yNS/cq3XHRdjnsMvcD9ms1y8U0pR/
	dB2XryhLLEEkmwpQ0i6yIhp9PgoS9Hl6wz5QtYvc2BQ88Muce1BXvHcmovWzfNE62GwBIG1cwUW
	dsbTDg3vSg6xIJNfUKiznmuR5pk1gDUyrA/mY7t0fEPplMSmp5E486wqLgPB9pgg5JYbmo9QBUV
	rOg9FdJXUECp12hNAbzne/50KwHaza3RaLrnBWhMxSaShXGTQoeJs8D5v92OBx9nh1J1utVcj2A
	W6oqUUvNMhYZi5DoVH/g==
X-Received: by 2002:a05:6830:2b25:b0:7dc:db3c:1d82 with SMTP id 46e09a7af769-7ec0963a968mr8895929a34.10.1784057837546;
        Tue, 14 Jul 2026 12:37:17 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Tue, 14 Jul 2026 13:36:42 -0600
Message-ID: <20260714193656.2196447-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..711029ee78af 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Onion Omega4 Evaluation board
         items:
           - const: onion,omega4-evb
-- 
2.43.0

