Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BB483BD6
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966637; cv=none; b=Fw2J3/w1bVxBqyj0ZlMQ54FREEhz2EsMHPiguRXuUp+Xu9BFsD97sdlVXjZL+PCerhXAK59nu5xD7NKLMP2hFY9qlZSthnkDp9CVwJN4jbdbF+hitPp9IH+Wqiq7OD1cScinyMFOQGqyFOdxLeJeA8fr/pvG10fOdikXIhUlLpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966637; c=relaxed/simple;
	bh=sbxJIjfMPwOx2on3+UyWC5RWChgJP51qCvyPHjSCijI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdvqIcEsjoQHk1iU3ACe3n+Ow/73B1MesYEwbh5kktNNl9h6MAn6AE3O6RgR6SNsL2tG/0aHXBXmLUAdG82tJrrysXQnS88dzwkA1W3qhPZuwafNVCP2/kV3d0kM/z9LjUh8c0DU6LRsbRdwJwcOWr1qXBD44FyXxJSh16ohmZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPmCJQgg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPmCJQgg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ff680331aso7292485e9.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966633; x=1792571433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=;
        b=lPmCJQgguy0qxTr8JOHJESGl9KuUXALVzY5X5/ZE2ltQ5tc3ByYUqXcEY4TpaKdzua
         6RUM/8FD8OqKhS1op57Wqt/ZqcO75NHBW6LxfEh4qiPhy7g5s3LhZix4BvowBsvLg9NK
         zfXCMKr/J1sXx1CUamfwjKlfGDKCPLm4KHMD1shH34SbS9+VCgd+rF4nXEDNMZxfqwQC
         XJiLPdYaM5MC7adcutywV1m+zla59RRW4FcwHhmJuev0O9f2o6DdsbhiS0VxNAVZt12g
         yUWIAqoBpLiywJOqwZg7FqSc+LPNVvBcb/louPcW9xnnqWOBeg2lAp3nd5VI3kiNBvRh
         Nx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966633; x=1792571433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK4mu7evKVOV2GEU9FhgXywXMUX46qDQRJW8ekwQ4SQ=;
        b=qnT26qaSUn7fupgE6U+Ez4UQnhVSxcO2mM2Nl7xt07tGLl52AzB3S/BRM8snnXnAMv
         JcjGwtYvkdoh8Y+PDLmiq3aFsrW/A8uZrfrlk8A4thHP4rw5OwHYbHSx543In+CRKcYF
         zSQt/rzpqjdD/qr3u0DVI0XPL/iy2yXvPmv7/qG6UcpQ2Q308ixLA5JXpg7aJSu3XeT2
         tOFW2dKU7dgxNLDVssUqOh3brfJg6vXv9XjgjvycL9+QJFuUpo2g5yfzjll/g+tzNFJm
         rCNylmLpjiWbwymXRmORuA179eK08iyjf9z0g0Py9XrHYdHWLAUgoSPeM/BREbdo4mtf
         Vryg==
X-Forwarded-Encrypted: i=1; AKwUvBxni6+XzYgr+ouuXI71It/GLt4BLSAa9fX7c0/nr9z0OEL9H/R+gB4EseZlV/lsZatqo9DyFPmXsDNB@vger.kernel.org
X-Gm-Message-State: AFq9FYL9A65H/KABMCe3f9sJqqvNXiBL0LkUd+XousvTarR6kajKoLpb
	PU+pudCB+2GhUiOXKkEBcwdHelCczEMYBjd78kuCamCA43vU/MVSlpNIXGwTCksaH+k=
X-Gm-Gg: AYBFou2deMFZXDHYFlDwYNcI/rgxZ+/d/o2L0OgYSRiUORDlK506E8XXlEgCAyd4X8e
	4ESr5DO0dfT8IakGEHGlKWdRxryL5b4kKp2CWUAdUi3mjNnwLrIlZREgSAH/sS+eM1nrZtrQDxn
	sv5YCu5AzRLHjUDSUwAV9SGwv9YH1hswPh/aWek8dGVadf1pF2nVQ322HqyfQAkoL3lvSv4zdn/
	p5d/ieUkQAu7NpxTlMFwSK1Ix+LX9k41lv3JaW46paWSVFWfRd68z4AH+keTl6LViD4MNTiEerR
	1pYxEtkinMli+syw8r1BIP6ZVAFT8lSbmOTR4mlxUbSgMPvcVhzBvAbJIL+AX39NORXk9yZJcTl
	1pZvNb7QKQMBuZ7aQab7LF+sZFof7Cb5FZ8paOTdAt8qu8ij34wLqPp6L03pW2PiHw5sNQqm9ca
	HWE3kkkwc5T/N7aZQbdX/t57vriSJIrqNb2zxmbF2tKClQ6OrUypv2Jn2VfEgLsInuSkC+JWfDh
	lTT3hdpWZHjhOejch48BbAPXKQRXyOWkVTDv2z/XYD6fA==
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr334974655e9.17.1791966632877;
        Wed, 14 Oct 2026 01:30:32 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm431809745e9.15.2026.10.14.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:31 -0700 (PDT)
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
Subject: [PATCH v11 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Wed, 14 Oct 2026 10:30:14 +0200
Message-ID: <20261014083016.332338-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014083016.332338-1-sander.speetjens@gmail.com>
References: <20261014083016.332338-1-sander.speetjens@gmail.com>
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
V10 -> V11: No changes

V9 -> V10: No changes

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

