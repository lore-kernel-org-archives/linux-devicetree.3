Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAF3976A9
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521959; cv=none; b=dC8mpWA1H07wYU30zpqbLUj+EOL4JTSE6ZXsHauYwgisIcmVk3htykNm9r7FAEQdTVSCCJ4Fo6tly5fWiAkXIQaRd4Z4WOLYogGVKj74fg9n9uQP5rhWySN8ltVBk2QJcyapspFh2EvPekCtHuKwvFUJgPShv3Qk6opDGffON0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521959; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eextYwTQSWA7Md30ib3MEuNvpJb3MBfNebQ5eiiwSYI3fAlvARLPNlFFlr4+Jxf5IWodPbKnfFbneXdJ2bQsptjXc/WSjiKHofSqCE1YE6FOidVPHDcpTRGINhvNOX6J99X81BXJaIP+W4S9qazQ4quvvvFaMkAhQaxAwAiT1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY1fthwo; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY1fthwo"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1023906f8f.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521956; x=1791126756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=MY1fthwokASau9xDvRMAK+bGptM3O0akRvHwq1EVlnvAl5ymgXTVLkx15odWYHaEJb
         gaMTg3EaNZPUJZum/u32pFE4v+KXQO6WnwhwmlUpetR8uAB1bk6Uw/N6fWEJTUgp6q8X
         wsZ8Yne1aRLGVjTpABWwwIiKISWMRLcJapAFw6aEw1/JozhC8DjtIw+fyjcf86n3cQDH
         4v7GrVLhac1wCpD+NWevcq7vPHIe6bONIYylr+nEkNZKGZ5N0Vi0hT/TyOuWzGnhmccq
         iqmOfc4xm+ljh/+lVK5x2mjw9ZoTDZDXQXImM1UoETLimnAw3Sva4RJtRrFyIXQIG9kf
         B6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521956; x=1791126756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=y4x3P51GOqNq0vv8DeCxErJVJ8XRc907rzkRIQ5gYGRwaP/rBmSE0vekYSoan0Ugob
         pwD1MPNcWzpnfrNyXMFzC5/oXLcHG9c6wdH3XqiJ4YeDnRzZKrBpno4sCzsMDIsrJIO+
         PCXoqB5QTCGWkySe8uk2mEueBiaFkjiE52XhkJqcRsyMb9uKwF+y43qKLlpWFA32wbIW
         gS1LWpZlfjKMYW1h4HyLbBkFWYydn3M/pQGu2r/mjOVz3afQ1iByraN3aIKW06mO11P5
         gGchqwAA3PAoc+nncIgIVfG28EwDF+Fu5WcK/LVZ/c3JWtGLNvKtEwmionvCXNTUDEVv
         b8gA==
X-Forwarded-Encrypted: i=1; AKwUvBwxA0dt6BNY6ilRGiALDQlHH38XwZQjD2SmTLmHtZLyAxnalRi+v/Jj8epFFNf/WA4m3GVmja8OvlQq@vger.kernel.org
X-Gm-Message-State: AFq9FYIAoM8SO7toqKSKJ8MfWPtyyd88a1xzZQzPozaeuzGciFfODjre
	Fi5J7gsShBbb14XRIxFyyvZ+ibglBbamSRKoonPdOzH29+G1eeOvouZatMoVMCKl2ng=
X-Gm-Gg: AYBFou0RTmupIIH3s6HOebWm54A5rKS0ClohVNJHVd2L1owkdig/HFaTU7mkWwF4VZM
	CTkR6S4FeoM96ByDE6UgRWwv6UrM1EM6JXvMK4rwX/tBUHoqTrrMFeZcoQYztTW0MZM7BSddVpU
	yVLJmjSMyl41Sf4MvPtK0ScQN8UgiOCHGB3kQaQBT4P9qzz+KvqELIBDjTnfh1WLvB4P765C9e/
	C9jq7Hf1ro10LCfP0OK+R6XDXBpTRbZHo4gH5T1GhqT5NkBeVZzpJgHF9tduG3V7oaDdmvslVmu
	04VUP4EZwoO+3qvmdLAuGxf7Osz3zmFPqaMHVyRpc2yL5rkt0/Y4CW5pB124ePHZOBpLRYgRlJK
	Axd/3gk5hOwppilW1pGC8OszjB6o3cKgfYtVqKFYWri1VUJduEMltFL4zdAED/WMfuOpydPXWqA
	qxPtM698duIz8lt96rM8Z8NFKy6HNlQRGrUzL96muxInMAJIrzejnuGqHRvHpRAL3P8ftcAA6Bs
	ke1FHs5ahMbHeJHKzveXe0J4xbt5QP0
X-Received: by 2002:a05:6000:4b09:b0:487:767:b301 with SMTP id ffacd0b85a97d-48879df7009mr13521375f8f.57.1790521956427;
        Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:35 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:15 +0100
Message-ID: <20260927151016.186493-11-pmazzini@gmail.com>
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

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0

