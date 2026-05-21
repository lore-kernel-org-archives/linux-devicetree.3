Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC319348C6B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375672; cv=none; b=ca3gLDXwr7MJvxsBXtCrfHE+SlPEcB0Vp97BdbxkAYiBsBxZDK4NFu+rt2ugRskvQe2iL+Btlb2AsSJ9eQvBd+Gbn2ELA9hbJ41c1kDOs10diS1COvo+b0lw0wcZrHVnuX1PL9d+YJGrMU01aLrcJXJJIcRxa0IM3t7okBbDrmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375672; c=relaxed/simple;
	bh=Ba7wjjBLHj/OQtGs3p5+xGVWqv0E7v7papxVstbCYKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4JrcRiSBMCFLh5aEkotpoPI3dbOp+3m/q9Sdc+Lc1eXKiqWkHS8fruFL32s6xZrBzDwZs5l6804eoR53aJdsLSO3kHjNKMAeopy9PmYiyCipO3AuTvId3cbEhZKR+PHAM5TkMw7jQb4RQEfAedkxjGulAGqaWgHpY5lApIVYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoyN+/Xm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoyN+/Xm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b0786beso43512785e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375669; x=1779980469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx4NrXh6e0d7nDyJTPlJmHDbVsDuIXTB3GMJlYOnaS8=;
        b=FoyN+/XmL5yLlMnplk7ZRf+7INIk/j1LnCPG5EIorXxvpVI5UKVJwN9xEYnNAl8TOE
         0JaPZ6L+3M4lGxrnPxLqJaeZK5BPhOWoyT85XfHJWYp/aUk91Lhe6CMvuI85irUyejdp
         7iUo4Wq0BINXOST12vhAeCXp7X/9SHQHWBmE3vhaLv/ucIQ+69xB9Bc0QWwN0G4QM8iP
         HTx7wtvggPPUdxfrIOOjjfc/56tgvtoy7MOmiyEt0xSoF/3nKIUKB0JIb2E1G9j88pCq
         M9S+OEFHcsoesRxGwnL0mNhSzh9n6bh8reWj5NQXYRqO/UrXWjKoxU7WKsYW3ZIsbnIj
         ga9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375669; x=1779980469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kx4NrXh6e0d7nDyJTPlJmHDbVsDuIXTB3GMJlYOnaS8=;
        b=RheZC9yaje5iDj8xxKQ9I5rosNLwTwhBce/0NgEipC+XuU6C+bowbwDiswKS7P+D/Q
         Az3Z8K0tqI1AoQZs5UPWc1jx5ej/fuGcRtJpngGVkN9JtlLwuNyjsrPd5H4xNT3Twpu4
         +7nNEee646bL7Yt/tDIHJPjOmc07Yhi3bIVjDUy/lMSbDdi+wpDTEV9Oo3W6xtawlI6l
         SbvHM37DArsSS0jW5CfZiF/U6TLloff58oo+T3PZ/LoOsoCSaWdba3DOsY8MnBQ7pwQv
         oeuGhHz2qyCFW3bCxTontLD7kN6txwYD3z+Ka3Yh2V2pcLmdqxETSebJ+05IL+pbxXlK
         ZNGw==
X-Forwarded-Encrypted: i=1; AFNElJ/oitot+XzwdQiwinL9zfTBaMg/Agg2EJgHahZowjHRR0MGupAanoqYriwhW+23L5pEfRe7Fvil3hC6@vger.kernel.org
X-Gm-Message-State: AOJu0YwjwNYL0JNLNfCuN8Uk86pEF9sVIgH4wyQA+Rvv9uIXIsPnE/k2
	eyvCnsZVetXu4SlK3+9WTjZyQkbBz4I43ldkQPP1MwNnel7C9FNLN+mm
X-Gm-Gg: Acq92OHdy8wBinc/A902qshOPlWsRM8enT+IiZRUNXZoPhPMqRuN6Mw7mjkGX6yeB+3
	13rF8MAyjsOxCxG2V/inx/lACuUWZYtz5u1jRhgkI/IzKg+yiAWCMNVbKXiLtz0LzAu+ixInv9f
	IM8/J+tk5vzommK7aHB9qzYGXmrJySj9qy53PuVzMHciuMnro+XIDLtHOVG/KlYtKNxd4orQFst
	WkVhAVhUm+XsEizNgBhcusDnLpB28BusjzYQtCdUBiWDazmWMpcOTWfnuhsV08OZTDzf9Jyr+FC
	tFKOJB8GypuyNjevr94GV9hJ8b/UJ4DxSd56l8LXEXTD7UOsDI0LzXxdv6Mqhrk/iZEG0D/4jnQ
	PT1yh46OCoV4fhB3G25Pod6LanDmk1DD/ZHgsmhV8hAL8h+HYaoT3w3WrfgKXnI0V2dxx8sxk7K
	qYKj9sbce/0d0qOEL5L+UEYZphdmM97t3MyQ/32eFphg==
X-Received: by 2002:a05:600c:4e8e:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-4903602cb4cmr54844565e9.3.1779375667684;
        Thu, 21 May 2026 08:01:07 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:06 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 04/15] dt-bindings: vendor-prefixes: Add Riverdi
Date: Thu, 21 May 2026 16:00:40 +0100
Message-ID: <20260521150038.103538-21-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0

