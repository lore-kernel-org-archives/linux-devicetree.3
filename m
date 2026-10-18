Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2874A387E
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336262; cv=none; b=dNf3BDOCx32saD2gJ1HvmqguNcPxoVN5+gD6cceW14b5ve/3oWCDuJS6El+aqxzzULn7AVdGZHDGS6yoiOA9akszQxQfsIkCtFK+NAnzp4e/vgCm0EHci8ynT42YGWQwTlACnCe1wia2VMYHWG/NueKQ6rdDsDqtRbAbgPLEO5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336262; c=relaxed/simple;
	bh=npIq4JBhHMqo+TX87kz0X8PXV65z96/F91/bn6YAQ8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH4Yoea+nEzKWyMLln3Z79TPPpTiVqqofWb6xjWYtKF6HeD7w+HyN6ldHHeHk249oF1bB0nDcNq9+4YQjqb0mC7IQsuw0oqfbZsETxq+ONj+pVpaziZcT0YMvn3XRVaJDa/SaghTeUaMUAIOYHDiAKSE95n3dGtEA8d67+gpHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L11ABpFu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L11ABpFu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso14075395e9.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336259; x=1792941059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL0E/vt9sxXlhTRMpInaKfEm9NwJYqDZiQ8jv73u6U8=;
        b=L11ABpFu216a9tZTwynSiGWwFcNRKWJZAkA3m/yta/wY0Iv4/PwXdjxV8lHsEDjJjA
         PWDIdgQSt4cF5F59l5zieXd6Ifsy5ul+Ow4zk2Mi9fahNhTzfoMOw2M6xR/LNqfRduJ1
         HwKPuXT5Mb/Q80Huc/XvsL0yCGPhItBF6Uck1xoFW/XQjNX0XPEaQR4IYtBtNzmj2DrV
         WoplGBU46BCUYO3N8utiCMfZhkUvWvxFqT5Pmay2QDI0aADvIMgi/MDl3doWWK9hfVNP
         obkWazV8YUfk7dPrpJd6Vz7oMIbaJQfRK34+3Pb1itny8knfUT2bNGqFFOr1RbZBgitA
         obZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336259; x=1792941059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IL0E/vt9sxXlhTRMpInaKfEm9NwJYqDZiQ8jv73u6U8=;
        b=Ofbax9MCvhD6HwoMnVEYl57gBVzY5Dw1jEzUmV0qGzBeF0Rq9NMnOD+0uMriyhhkML
         vWZ8P4ArKvUI6s+mH/mqCl4kqnezpgkrFzR2Hy7rXUaKwtQvFAnPqVY/yWZEzEcUSP1R
         +Kg1GTgtHT3BpVVEwcT71d841FtCacTa8sz4nKDNUhzCZVX5lYtW4D2Rd15kcAdY4vYf
         4WsQ4InihfsNHPeqZOhryicd4NddAZ9K4HPAXE7K9uGoIe50pCkZeBl3zFqTRzCF3gYr
         kbdg9RqlCwaikoJWcMV4aszzpocpZ5qwK4yrqHDZeDuZuIKCNn/h00/LnA+yPGvnQC+0
         8lXw==
X-Forwarded-Encrypted: i=1; AKwUvBwKTjv4xxaq3eqCojdox2tpO16kEm6GHw7hqUk8UQ11SjcQbfZCsZFj60xLUUQUvJlQAoi7NO9ZxnkG@vger.kernel.org
X-Gm-Message-State: AFq9FYLT/0xLunO/jsRwT2naT0T7kZe7JGe87V2mLqcYPb0XBP+trZYl
	rq06crZr4b6MwrOdc592RVeI2jKbuLvwyAjy9iswA8S4ZHXSklGZIqSz
X-Gm-Gg: AYBFou3VcS4iizyBDM32R0Xzz/9oEfXUEKeUfCTyL2VViEAFuzWr53y2NX7CLWfaP5N
	kAB71CwzpwwGEGrSMI3GtgKo5nbKaKGcfLBhu3Z/xoYtr5oyxuerUXDPIJX9tLnayJQB0ff8dH0
	25PqJIA1WeGt/Zxau8PM4mmZtDer1NzlRRTg6sG2iZi8gdwGs9xkwz3nqpcJaebpsyBPqyzoA/v
	ww2GrdZg29rIkN6Q+5fTiYZnm5rq3lNceEJvkHPPCgyRrSb3vF0uh0HTRojWWVWQCMuH1kpHuqZ
	9KFJNj1gGrbj+YPNHcKI9fs1c1Sv80sRWEBSq4p73XP5L/vSsuxkoLD8F0fI7kxRkIZfb8JoKjg
	xjdGjkXrPRap+s7CitqBqZ7znmzxRNygso7tpU8DtUE6AYsLB6ItrLaFqQrh/bdLqCch9w/jfze
	t8F6spwv18MCkMVqDWs+qSRIzJMWp/oHMlVOPCjWWNzCxZ1z8lCDQ6EE+xszGronmN8R/SaEWTN
	kS+tsYyGPrin/8QTVmtXlnqK+PTujn7EdZSqYAPZE+oKA==
X-Received: by 2002:a05:6000:24c3:b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48e079759cbmr9621680f8f.3.1792336259484;
        Sun, 18 Oct 2026 08:10:59 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
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
Subject: [PATCH v14 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 17:10:54 +0200
Message-ID: <20261018151056.1051330-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
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
V13 -> V14: No changes

V13: https://lore.kernel.org/linux-rtc/20261018150028.1047172-1-sander.speetjens@gmail.com

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

