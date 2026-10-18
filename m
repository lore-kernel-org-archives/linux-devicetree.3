Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1C4C10EC
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334275; cv=none; b=kDICHW/sanW4aMuUb+ZjPZvrh+jKnIA82rqknKHwohguewxAfgNqxP4oSEbxpkf9tOuejxeH8g2hxRNo0wxKhtXDaS3QlA+0btFW08uXmIYFp2wPO2u7wF8XjPPAbJVj+OIZymiVIZQzCYRP+LB6L8cG/R1qvm34Lvo4Os5+N4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334275; c=relaxed/simple;
	bh=5k7F0mIR20ZConUuzbdU6QkCxs915s50rLRdWwa5YMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APVWMX+10C5ZMaPoJ5dZQB4EbIx5hiDObSgnH7CAVth2i/Dt++CTA9/LZ/sy/V9gufJ1dPFe6DTAsqqakpbZyDEVBoIo+CxRRFzaPPotxP1hP4Cx5wz+H9iLocTPFI7XO4XJ8WupGx/RqzCIZLy5YNrVvxd9FI/a6VoscU57vM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQDdmrU4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQDdmrU4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c45111bebso746273f8f.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334272; x=1792939072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFcZmTOFsZoMO9gy8wdBwLf5bhkHxxJ9J7LR6D0FEOU=;
        b=jQDdmrU47J61SJEZkgKAEWOfeIpYYGfSuydkSsxbGUfAiWklV5nK0lcNHa2H7bVU6K
         Rf9QWcAYvcTBsFKDTyQ6zTzlFw5bkjcImc8QG0ENibtxrDyn+XpXEUzh/CuHC5vfXQeR
         D0IGSWd3jx0Ypuc0+h/YcN39/sEHAmsI1T3iYfjG4xZ/IbYgd+vwe2UjOgyqQY5SVGJp
         +i2OPKHzU8Q2lhejW673wt3bqK+0w6eT2aFVyWz0AhQw1IKW+o+ha+XzUNfAh5TUnp4A
         Ff9l7NAF2S8Y8AO+dDL8uQhBTq3mzCXwDFglM3xXH9G8WpwxQOGLIOw2acGqY2ifjV3K
         xw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334272; x=1792939072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFcZmTOFsZoMO9gy8wdBwLf5bhkHxxJ9J7LR6D0FEOU=;
        b=n3CJzSELXDuYwWijRnlL8aRUd1bdF0BSELLvXtqE3GZLNAXf9kqU8g2z1BipXfh/iU
         tE29sHDEN6/Q7cx95SWPqtRPCWaN2OiTdd1Jxepu3V157DawvWAQh9ke0TcUIGzouDVQ
         6aQ7kgOA1DUjrrWO6XAU8/JZ1iK3atCrolOuZRFw3QqOn8kwbH1s9/IadikoktalF2WI
         /nRV0SUgURo2znfWnKQvmmewSfSL7PkVu+dX0cR1wiRnS0E5e7yu3OnNdvTbEX+uG9fA
         Ssc0tnYi8KKonI0u7j5UXaVXmhbIGIfB1wXM6A3wCo2EeTcun2/cmGs9uRQpZGVX+94b
         jA3w==
X-Forwarded-Encrypted: i=1; AKwUvBz0dgF3ftS1R8ifPAned4dAR96R7Mr8ra2tYslEcrNFo8QP+AP+b8m6H7HVDkWEnEk4u2OR0S/eumSt@vger.kernel.org
X-Gm-Message-State: AFq9FYIWwFjinhVOiqE7rNcS5CJRxC/3Wb/7hQ0AdZ0GrE5mx/sqh1CF
	u1BcXbl4axmjUGC8yyw+E+MuXa43xmvHIRb2HDd8LyrpdiAn5YnNnK3Y
X-Gm-Gg: AYBFou1dO1ti7SUhMekdk/8kce6HT4QMi7eqTfaOurKCekrurJSOQrnsnkOTnLvSzy1
	iUhsMtYSxObYdTsMxuvMoUEWOwiNO2uudTU4Fregqdsy+u6jPjVysCRj2MeJN9k74Yk9e6U3qbv
	ofEdhiFCbsMMZNeomkI5rV6ULLLutvtpB7/02a4kZBW4+KD/w2ukXk9GLs1AYEsW8ydb4PRCttn
	EpPjJE/Rp1gm8+g5raAJt+G9jXuXCIUG64MjwQhqWi/mRMYIxQVJKbUFWehDcbE9j2WZjejESvP
	VapxGg0x1I41PtP193smFFfX2TlyLPMszS6YcA4QmgeYe91ZWbb9lM6628AlYWjXpUSJZ5uGUpA
	Gl8CHoj6K4jQ3M9sOTdl09QFvS1ulFRJnT/dgyzN3wU9L5oFcxf1YOVNdP6QKduJBr7vZ1fVHss
	9VaT3IWp5ecS/eEyy6XRWNrqugCqe3WeHBv4aD0zwV3OIkgn03R3jedzFQ+6oTdEletPqZ/oZio
	YMKZjZQtgYv/2ldc1YF0DQM24YeFqEt9emQqccuxjpYXw==
X-Received: by 2002:a05:6000:3c9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e08017195mr8926508f8f.13.1792334271780;
        Sun, 18 Oct 2026 07:37:51 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:51 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 16:37:10 +0200
Message-ID: <20261018143712.1040152-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018143712.1040152-1-sander.speetjens@gmail.com>
References: <20261018143712.1040152-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V11 -> V12: No changes

V11: https://lore.kernel.org/linux-rtc/20261014083016.332338-1-sander.speetjens@gmail.com

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0

