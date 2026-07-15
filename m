Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014EE423EA7
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113287; cv=none; b=I6NOGrzYUIzqb7K8MtQudn830L4yADjjZBd4f2017mJdj/DIbaZdGDvTg71zibzTarvOtPIpA41WMnPactHPXiBfqRmTobPYvgmcpyfAKtQKg8Zfz/NkC21vmgf1RVn3cjo9jbhmrttinIaqZKrPiFy74jBwzktA5ndepqPVlPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113287; c=relaxed/simple;
	bh=lWmvuvqP89CKIBJoYCxIlK1DBL93/+5QnYPFTFl5S3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwIs1rWFjZCCZSAs8yg9MsrUmNM/Z17Q8a7Scb3zZQzXy7Ogevzlfi+m0EgmL9xocasAtO4R5SPHdQHjoojL9pReCVNZMZIwptsZIhnZryuaH9miWZ7rt69dLloGxh8vUn4AZc35IYI6s3w7y9nfG5vSTfCEbRtNFK5FQEa5RtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TarZ+PsU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TarZ+PsU"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8111c0c7561so72658187b3.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113285; x=1784718085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hROTv1MESU0wRbBCVmMCNh5kpYIBCNcs0XYVMcDeAfs=;
        b=TarZ+PsUcDMZBCLZLsmIfwh+D+ffwJj0/j3ErepF37iJgNrt9LD5vJOXTK61Q5GP+4
         raekGbd7J+pkyuNH/VsI+KLblZLXWySep0IYKKSkOWOen8OmGxWpFAGJ/+WRjBhjB4lO
         hZfE3FJ5sjZgBg5gM9d3v043y45b9ToObJaytC/rNdlW7bHknRboQWD4Pl4QCkST6IA1
         S917L89p399uRGeSa56qHPX5nZQZdgkbYYRNr37jmaj9JS6dSvACp52uK0bi0Nm8cQZr
         QUv8VTrKfhn/HtuheZ0byd9ya6BoNy3mMLtXdtQdFQz67/PCAJ0zJIwPTcyRKrGa22Jb
         t+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113285; x=1784718085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hROTv1MESU0wRbBCVmMCNh5kpYIBCNcs0XYVMcDeAfs=;
        b=NqCOdT0g6fU9siclkzSiJkTe3J8XnT13PYMnc170mhvFZ0Mf0zUjyU6ULK/5W8C1QT
         F6Tdedxu3xBCcKMff8HjlB0PWIVA2XsZeuSZWYXmhtEHRNZ9zgIKupFEOh88naHEIE+q
         gB/RvQofDPrnARhbyneepPRRiPGODuWYRQbOqCNWGgwhjCsheUXGrx6sNBSwmWnlkYH0
         lOGTaM18XO7RhGSET6rxlIS1m+3B+ccNHlNkpRk2jmgwxkOvekaSGkUixXsvk6ZZtaUs
         is7jc67atPcGvh8q9R2l5M6xifhuk4BD9UE2xyGpnAWGKukqT/vSbhydlDcp8o3OSLy+
         4Oow==
X-Forwarded-Encrypted: i=1; AHgh+RpQc/vSHIylCTRy3nhzkCeuoQne8DMsQMZBTkv8HVbpiJHTcjZFPNd7W+Jd+RoodwHAoSu7bb0NlHlY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JX2orcx1QXZ94KAi30sfxoN5OTrPb80Wxn5AexsY9mlCDIQ7
	qqfQ7GXl7tnyz+t0HGlERo6wFByQnZGx8W8udAd78pwr0dBlrAcVcZmK
X-Gm-Gg: AfdE7cmnWaPg6ouOsNG3MhUm4QYfpV9hOw0q0R6cIDJNWxpUyswNbVD8oNcIAfTwebS
	gWT+U3d+hR5kfvST1jtwhjgqDcjwlf1Uo2VdcSKgCqYFysY3SeSmfjtdQCbYPwQqBGgzspCU1VK
	ANkKSopLXD6xXnlmmJW52GWT4r3TJQ2jFS4+wlFu/Fksr1rPZozGvAMWy2ZdF0S9/Wd6eoCb5tH
	xnJKDJ5G7p4kjiTC2+v3AyxlQIt8WT+SSh94WMqArv0q+7MwirUq4yQ3VhBJ+hGeogrBnwbZdXp
	cwvCtElrIsTo+U0ZbK3mq0PtkTRgZmsmPb3nIS8v1+oXjBfHZnxntmzV1MbQ4E6yltD9ly4APOT
	uSTO0Ke7SHSE5eyj124pqTWtXrsqs0uueFJKSK5J8C20PRk7Qsp0GFewh7prNzwsYeHB16k9k9t
	ULBIsdulJAyGavdnP4NQh4
X-Received: by 2002:a05:690e:1c07:b0:664:ebb9:60bb with SMTP id 956f58d0204a3-6680774b5ffmr3712168d50.40.1784113284751;
        Wed, 15 Jul 2026 04:01:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fbd8c5esm59066d50.3.2026.07.15.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:01:23 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add rockchip,efuse-write-enable property
Date: Wed, 15 Jul 2026 16:31:06 +0530
Message-ID: <20260715110107.409204-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715110107.409204-1-hrushirajg23@gmail.com>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional boolean property to explicitly opt in to write (OTP
programming) support. eFuse bits are one-time-programmable and
permanently set once written; write support must therefore not be
enabled by default on arbitrary boards.

Boards that intend to use software-initiated eFuse programming (e.g.
factory key provisioning) must declare this property and must ensure
the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
is present and correctly sequenced during writes.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index b80fd8d1ae5b..8a7195245c84 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -46,6 +46,17 @@ properties:
       this property is defined.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  rockchip,efuse-write-enable:
+    type: boolean
+    description:
+      Enable write (programming) support for this eFuse block. eFuse bits
+      are one-time-programmable; setting a bit is permanent and cannot be
+      undone. This property must only be set on boards where irreversible
+      OTP programming from software is an intended use case (e.g. factory
+      provisioning), and where the required VQPS programming voltage
+      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
+      correctly sequenced by the board's power design during writes.
+
 required:
   - compatible
   - reg
-- 
2.47.3

