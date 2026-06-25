Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE61037D11C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375514; cv=none; b=FOEXKcPcmgjtgNZc5CQlG/mY7tm2pqoabZxjF6h4WMqe4HJrJKxn8/O0/O+BawGRcJ1q7jG0sH357x9TsPeV/1oc4f7b5kl59Wbd5LSapTd6Ap1YQjoeNu8RzpyZR8HJ5KSlk9b9zz5mqfCIOF+kU8DDT95dFTY+cNIgIXD0/lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375514; c=relaxed/simple;
	bh=J4ST441g4GcL9Qf2m4E79qGEfDOnvVL9JwIy2R9JJ48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDIIU5E6DNiV32V5EobmGaVc4uOCWOiPomSSeCY6Lcz49eSCRGVy55VgLoD43L1p1biDAFk+gPrY7+mvjGIeAotct7uGgThP5QJw7LoyGkXd4vgfAeSEwWWIYOEUIDrgyZkqUSKu261W82XyQxDi/XI7yB4LiKzm+vLhs+cJVv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne0Bzf2P; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne0Bzf2P"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so1927022e87.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375507; x=1782980307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=ne0Bzf2PUc0naVwlW+xiieoMeD/JbIvMJbegoMJOB55Awv2EaqRXnsGYY6EbYe66EH
         KDJps+6Y3Vl/bhIx00XXmKFmsi64+WvGt6Xc/ngWVKKH/uGNa5lxvJr4GUHSynroEbh+
         L/FYFKN+Yyj2lxRPkMLUf9PFaeTbWKh/VrniOCy5dRfmTMKChSyCOJM1K7pf2XJ1dmhD
         igiTinOOF8lHrNbQCCZu1RxfZH7uzQVxhRLYgfakKV6BlhtBN33/kJvm06i1x2rGo6W5
         nZ07FALbbX5Br9F+fzHUK5uK3ms/U2ehyBp/3ETbQAodBw0BO9PRGT5AbMpBGNOhfcbN
         yYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375507; x=1782980307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=WScUDGH1dmXfNEumfOJjSuo8jj3dvo2heZb4pevL2tKXp4ouCB7LBXRC+YsIcJmJP3
         QfzMeAv+pFc8wS49HnIGcL0GOg4fhiPAkowxZOxs9XrLjF9E9KOTTE8N8Nr8KQOOHhRh
         pPGx/txr2+AyaWKatLwxgQBZ5tjICFqUsjU2pk9ZQWYXtaBd9nLJzvBs5hsvALXMjGrN
         SCJp9t92lakDw2B7P0MhlOUXx489YZOLhqkFpSAeDmE5UKH3ie4omeLxJRQyNaMFOS87
         I47eFcNGITc8v9H1ulA4+oG2xCSDuqwk31ICMIcdlaSKx4W2ONZRQcadYYarHsZhEE9e
         tFAA==
X-Forwarded-Encrypted: i=1; AHgh+RojJgTWWU9JkL2Bi275csLzj094udHGrABIBFT2892LEyaY9CudWDgQzMAeOawkQ+5Ig4H+9Ac6eGYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDtrwSUws7Lil1CfLwPoMpVWh6SBB41hnFa8SY+ZrP4dYN3tu
	W3Lage84EuvzKT70crdGi7BkNBHgPwTwmXy3/EfnGZoHtHB5/tvZc2cBejW+GZXr
X-Gm-Gg: AfdE7cmtDkPx4XgozV5OUFYL+4s04lfamFKwIuy830fNoAVjHfSBSh0MQ4IQ6mcuoGo
	VIwDpHCTkL53CI6mGVqlFkyDN3kXuaG9VlLDvyhpSBxtuC2iU5RhzOpwaF3y12sHp55MHv+Ykby
	ae4/375zTnbLwJ2DGOzdByfZTvzpLXBC6Qt5eH5g8CzYbPN9wh5XDtCFs7OG7gUHvcRwZn2jlif
	JekvtGrGepmDtCXhu5RHKBEWTABeeKz7fO7U/PZG3RLfimy5HlpnkZT7dHFwAk09IF8eDub+U6P
	XHudgeb2NjDLdjyulXAyTUEyZeLZZpIAciy1rf0gvq8JVEnjX6BKAviYK+mzL/yWgj+VWjNYjj1
	Ax2g4TCc+9doWJBZyh/q4rkcunjEG0sxb8BkAnnb6iiP+cgCMt9dM3/6B08fNPM+7gAznTBXk7u
	Rbb3D750sN/IlU+3DobM7jeObpMz74ac+5quRgZX6RfMVx
X-Received: by 2002:a05:6512:6cd:b0:5aa:b6b:93c3 with SMTP id 2adb3069b0e04-5aea1f695abmr512925e87.45.1782375506860;
        Thu, 25 Jun 2026 01:18:26 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 4/6 RESEND] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Thu, 25 Jun 2026 11:18:10 +0300
Message-ID: <20260625081812.33474-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081812.33474-1-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 76705ea56805..da7abe2ec912 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.51.0

