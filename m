Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA78374E46
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411322; cv=none; b=DCTEhVYAsktcf3OhVlbxJ5YHz2AcCvOYk2AYkX/zMwT/BMnBYwWjS+8mOL+PeeFsUpF2hOxgpJkrG2LZG1p4p35wt0H2kFnxilE8/PBW3TZ6T6aFANk2h3Fx2GLa1ASUg2aF7M7YAMqgn3PxQd9Zb43OV1hJ9lsJlT9o+S7MQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411322; c=relaxed/simple;
	bh=0gEwZwS/FYqnGRZ59VSyvYE3yvqWMDCYZCh5Jh3+mCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cxs6wxbp4oG9pLJYYBSdftji/HgUEmdaXlRlvZl9SJQFg5rGam/x91kqbmQ78ueNiYOrXXp7DifnQW/ZWu/gmBGrA4ruly2fN/Uj8/jO5RrHVmvrBsO6aK9BEk4ULqhj/shLgv0PBkGBtWu+AFDdFPCCBD6saLumKmjQELRBgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO+irBu1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO+irBu1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b936331786dso419874666b.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411316; x=1779016116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=RO+irBu1+Op4h8XLB/uOeezErvpufWhbhQfHy5rZJlMQKm6cBxFxaLi+wzVGkDDaUa
         20vdiA9Ab795fNmJAxIS5Dp/pW5NrhOwM7oi3E/yBw/PCmFh8OKSLslX/K/3/6PsgTwp
         u4TP9tsq7C3guBfhlfXBbahXQeDTv1G2VEtZT4QXUn4Qd60rt8KfrzzsXFmIiin8BoZV
         2nipEWSmt6WcN4/mv7GRHMxd5dLZcnHzz+1OpC33hli3p/6anmquhc50lkztT0biggxz
         k2zoqWW+2IMQvOtFrdsIoFHb4jKFLItvK3n0xb5N2xVX3jRdt7MTRPc+1J80Oi7+DZMf
         1ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411316; x=1779016116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=Uhe0ohr+ofxR4WMmwgbTMo+q8nS24HNL94YixVj6Vlwphbs05COU1TRa8NRbGhgofj
         xT4nisnvXU74q897J9FdyQIVMz3Mz/p9XkJ+DCOTWCoJKsaq3u35Lewcd04R/SBcV5xs
         xyUGkFU81qjn4NqfB0SVih97llt/B+aY/FZE91ymwm4EJwoHUyKEZzEQxyEjkZ4fYJn3
         1n669U65rICI1LoAMnR507lecUvNgr1NIRNtI+dAyDyP1+y39xo/t9fk+Cq0Ijw+sxH2
         ACcgLFHxNQzaWxu73KzEjTpCelNP9+ei/Ymf6UbvVsXEssAR0t5sjXa/2tKpl+MY3zRw
         nhNg==
X-Forwarded-Encrypted: i=1; AFNElJ/E75mnfjDX99GN7/osfHbSXrq283I1KhS9Q9k8gmZxmCQyBQhPDnD6UKonYF4nN68YV95sgo0l0M3U@vger.kernel.org
X-Gm-Message-State: AOJu0YzYRLXFrqzx6iNAAMEdtAx0f9EQ2CgzX7gmyIYziHsA7bzrkSTM
	BW95tPx93mLafpJwbx/SwOB/l6VslqEdw+2FEW8yemaVRvIjn1oEC2cd
X-Gm-Gg: Acq92OGdQZXGEkzSlym511qAPPiFnW2WlSQ+1uosKWRhXQzMJHHqff7vLWSRGeol4i3
	0Y1CVwDWY8WgZoIPrw6giX3RPUkG67OMWVrYELgZ6zQHnf4GA8w7v4evIZKR9+edJpg1dEcCP5j
	XFPJDPEl/7yUMiLuhOldBoIskg6+9USml74fzQD5Jeze5f/KeoanamoM/I8ISOHRsqLAsZ1zKoa
	y7RJCkRBSYLDGcY1fdkj1X0vCWP/mmxiwjEMUGIVsExkxlEudLSgkKSFao+7N+ndj1fopGdnJu/
	O6YmpD4vx7HLOEGPs2FokF5BEf4hEa4VzITFptNJnvJOQ80jxXPYmIOC6fgfeHyjMIENYbhgR9/
	331uuhlmrOaQuRq91AdTpxhFVz3b9jLMRrT+FUxiLv3VifyX0tCm+IA6lwZFF4QoMStjAAu2+di
	pwA2UjOPwiB0I5+DynU/GQwPY=
X-Received: by 2002:a17:907:3d89:b0:bcb:e626:523a with SMTP id a640c23a62f3a-bcc14b9b4camr232992066b.40.1778411315731;
        Sun, 10 May 2026 04:08:35 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Sun, 10 May 2026 14:08:02 +0300
Message-ID: <20260510110804.33045-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
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
index 7f257f3a1a5a..542d149d2b39 100644
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

