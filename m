Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400863ACEE3
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247721; cv=none; b=MAvaUlnadOLR0CNyP8SaCEYbERxn3jn4nsyTqzbBFO82yLOxL2cqgaL5d3L0Ce/2XvaeG9enPxyNuIkQGYzZS2s9frd8GKjSwQ8VYUPi34MaKes4pHJDjLKO1L/NAfWzcGPPo2eWyR/MGOEgF813tPtW9y9a0RaZ/6X8lgylPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247721; c=relaxed/simple;
	bh=keipto/oGSm9DO6JiPL+egMCOZdUpk6kCgz+ngJcUX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORhKam+Joi1ngSRR0H/9bPLN8vLaLCrR3sDEM4dzh7n2fsfmMx19Hl19K1E7hmj5XQKhTgEx3GjwpPYbGg+MY6jnCh3OoBLL8t5xRfsFOZIwaqNzQqzMNxo97+NZugfuiqFe6keiKcYbNQ72bs3a8LZh0g4T8iIkvjMroimV3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BygdOmBX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BygdOmBX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49222b6e871so1918685e9.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247719; x=1782852519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=BygdOmBXz2S0reV8gMiyS4LImdvwKPfm/91Df1UiAjAxXzqOJgWOn2h+OUGIpHel5c
         HfVLW8vmlIM/lomsLyZK/5NX9njryR5gUJOpMitClK+LUNH4bn3c0lRDA8P3pYI9mHGn
         G66Sf9RivUOBaAaP/BLAAPAYIkUCrP+bQB816rq3Q7Lr4UCKFCyxNH4FVQTPAuBFc1Nd
         NpViBqLLD9gxdzviCTuMBPVLpFs/XlQvJTS3t+Jo84srS9bH1Sez3Oy+cgOsKLkT59xI
         SR+9dy86hrrLdmnVTEctFlX66L0qheHmvsaYRQt2oBBoJHLx6W/Tq55gGH+4TYpIr7+4
         lIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247719; x=1782852519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=CDNBBDIxLPAL7aeCwvEX8mD9dxCtgerfPJ2dENYNO+aSxKZwXKEHFaFa0+ohcXoL1b
         IfW0qgaYPbcq3jEhHMamHr9wS8rPtheq9Ez10mcC/gSn6b6tZFrTcxyjWR48pu+s1EDK
         HpWy1Ms7zQDumMHhO2aWDx1xoDULAdE1pG811/unf9VpT47LNV72JU5/Ouu2Fq0ZtMAO
         wXR9Z5djh+Jp7PtCutj6dLHdvT9XL3KHGlFYEp5jg3/bVqh96GoRN9TuIEwwwzJCvJB7
         hDmZcAqEB/0rSWVU8+IFr0I4vXHbQo1XMl164btK4Yb79ZK2Pr8Gl5AVGm3ZZdsIAx3h
         ezTg==
X-Forwarded-Encrypted: i=1; AFNElJ/+M1re6bUth+nwtGLYOtc0TqO4VYLSy8ZzaWervVfcVaWcGokZKYLBREL8fANWOJ6P0pSmb1hWO2nB@vger.kernel.org
X-Gm-Message-State: AOJu0YwqoRdu9FFnGOiVU3HfsMS2+2WY8L2RLYOZ0wcIcQjmiTrrFfGc
	/qROHiBK5hLFebsYI2a8aKEPb1+JcqlA0BFMIa1MwHGfMZ4GE9OTnB57
X-Gm-Gg: AfdE7clqDRpI71ix4eVLXtLuyvha/wtHVSsBiikNk0MhNWaBGCapfZep/6sYxL1vRvB
	fAs0hH+1SMl9XpHWWgzFnLFjpSY1zHmQWqngqk+9VHI1VCuAVOIMNqdvLFlDU7cgjIh6sp3hGnS
	IXjATZwxdY5xQsw+QeyN06N4sc41cWsT5s8Khqb8tduCYRIHiGh1IyMFqIfChTjcZARW6Vhkjbp
	+S90gJWlvJqlW7sZoL4VrhqhWpm/Z32wRgrDeizJDlqHwmyyLmaXzIGBIr3R9L4AZqeTzxX3Md+
	wl1VTta/+nCPYf7jWHo+OozOaP4ng6xg1aBWDKSc1CI/136bqrLN0S8c95JdNGZZR1MrdC6fbTO
	8qfiBSeAwU+UirgnR2HLleKZ88V5ZWR29iPx5TLqNjUy5XIJx/BzWVL9c2FWqj9nVnSjM+v86tp
	kSpH1SHotpGFRgTMOBryUxB9MkF53sBIuZnp39qTnkOA==
X-Received: by 2002:a05:600c:4453:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4925b37973bmr71981035e9.19.1782247718492;
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v5 2/6] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Tue, 23 Jun 2026 22:48:14 +0200
Message-ID: <20260623204824.691832-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2-v5:
- no changes

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6b9fb6a6bf0b..88225786e216 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

