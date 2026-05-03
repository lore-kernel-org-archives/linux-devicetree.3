Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C63A6B82
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835935; cv=none; b=C65VcSpuFVC5OX/MlCX4Tn5lbn4b8RTa0JZh/oneQxqCgJwbRKz3+6nNg+0WZjGiEdrBWa86FYl4BTtKdcoy6VEwpcItqDLUhhDaYsPcVGOXrcgv8U5u8TJW2CEY4y6OYuYSf9VhW2kijq3Y5PBkxln6wWgmJ7KECdxFXsaa+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835935; c=relaxed/simple;
	bh=QNTuy3sYtbPemCcedO2bHA/3aLKb/1xENJq0GVttcwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poq4RDw4QS+B8nNcLbDcDrZblIW5fYfK55f00BDQp6CMwsIlYZmZegwIyoTnjUpF2bnkojDYCyK07FBT5Pwc+ZmV6g3nQ5wCVOGI/EaZRHLwURxOrrQXpWdhT62WRlDbV3tX+WNNLUIMOVI9kcKF0blImFLwxN/RC9dQyG4WCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=macZzTeZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="macZzTeZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so37948285e9.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835931; x=1778440731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=macZzTeZAUZ2yk8+70+txG42SjhGPr+ehjo7PUflP+WJot8YjNpFyEUV4jkmOSLGHi
         Y3EnqT1t5nDmWEDiMlKtPSuy3nnoH8Dn0B8DKCVp1TUm9wS/d7noUmBTnP43R3H7AVEV
         OL+TZW/xeLMOIcNEH1PEr+nnIzdvQCFtHuuWBAvsAVjG8FrsfmxaORIpWwXVCNtYtoKF
         gmjVbMNaoPgU/UAaI8aoZp0eXpsux+14M4pTBRpjPII3xo2iD9z0EjpeNH71pdMOT4kZ
         rx3ABr9vN4D+yGteqtMFCc2cqDI3fFP0KpA1FBJDILF1RSOvlhLdN5tRHjCJMYwfZZOP
         qhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835931; x=1778440731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=mJ/S9z8z3JQwkclxUqlQhVKjka0tn0rdN49G756LPzLkbSW5hszRr+kQr+cjLLBUBH
         PaJcn9yJtOfQ9ZA5KWwJDZRg5WP0dpNyXxbN0o0On7WqERYcDHmQifwbiDtGA/sEgOE+
         W1n+dRtRqUIcZ+O+jZa5dXZDSLol/c/+qTd2f9YEz4msRdeGPGpzER207Y2kkDMaSOyl
         FSPGS2PCyABy3f4sSAG5RW7gmP1HdueCjrhAzTn4qfLw/09C5ZcQImGxrRxYz54Uvihi
         fhidFQY4K0EXvM7mUt6lb4MZ5hA5h11luSsxNXjHqZ6ZlszaPPtAeIZKoW9/ikm3gXnM
         JfcA==
X-Forwarded-Encrypted: i=1; AFNElJ92Mb7bhCu5I29XIJ61psorCNLcAw0EUabzFh37yQF0K8sNl6VKwMMYzBNNkQr/Z1bueKMCdeJhXHrk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+a37cwOMQORHpfAxb2NX6PE/QcJsQBbJ4jNUc5rEbE/sG8my
	4vEgxm1YbX0sGRRRx6irWxFs5paqpbvSFwsddtLLCTMedXsygjedCC09
X-Gm-Gg: AeBDievfAXD5S34/bI5X600R+U+qdnOCR/meVbIrUtYch5f2lnZI7c8/W4JjCRAK3Gs
	FhIwKlfwDO3qpjQ3lCMLEW3Uv4TplexQJoOmz3iKR/d2BJhT9xNUVRb4lxrRjpAwx/qx7C6+rYe
	F1RcGUOhtufY78ETPLxfvP61TfhW8VOpWM8zU1YsF3P9PSf1A11JCxjTzXZkyevb6VlVk6FoaSK
	6FN10FnNYIpEXANgG3GlFUSxcFoCRn382z5EkhApI/kFjltWL0ikdZ+b2E4itibmyChCnd/U3DT
	0y64F8DDaeKd7hauxHHH3IXRDrsnv6qSzmAWqX/AXQs9TMzX6/AJciZvYFgU0/pTXBYuo2D4WnG
	iaG94Gv5iSOz05HEUOIiLvBlItzqUZWUHV08pwILbPqbVTTmgME4+EgWR02bWRFBQy2z8FWz7PD
	FNxJXsUV4C3sjfcc27goA4Y/QzQgMhWBxPCIRP56H2Sh5yussUck4jjs3VetOAuxj3D24zwAwcu
	w==
X-Received: by 2002:a05:600c:620d:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48a9852f254mr124948825e9.5.1777835931600;
        Sun, 03 May 2026 12:18:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun,  3 May 2026 21:18:36 +0200
Message-ID: <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
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
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
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
2.53.0

