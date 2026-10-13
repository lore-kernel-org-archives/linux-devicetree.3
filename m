Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86B534451
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915277; cv=none; b=fa8r2Cill9gOpuTANvrFVpo9KxeNEzWAYq7uAREDxTd1ocvvlEVUhe8EBDj0B+lGbZD3OXF1xE6ExT1FcmmylV3yJ6anusTPXJgqDElhgj2n3s2PcwxSi2Ik8Aeph+ZzWOR0blU1kPZT/wdFl3XFabVjlNW+gjQ79LQcb82jqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915277; c=relaxed/simple;
	bh=tZGpSaw5LQjlo6oG4+EbFboTisPZkzxLFq3DS1Ghqt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfLu8BMQmdxONf9g3ED3s/8MHweisA4kaDznwnbGjgNfJu/Eod6r9aVuoYHjCByNdGuo4VpfgEx0w0DslHfK9CXiXTFqbwXJ98ln+LYMva1/xsbF/ZgmMczf/mxIHR8OdhrWd0RagqPFMj1b/ZNQDOwsaWjmBSndulWgkMDKRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ7yBhtI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ7yBhtI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1546415e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915273; x=1792520073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqyKIia1XbYDE+B3uqaKQd6nF2XRYDNbOxAZAiXhdrM=;
        b=SJ7yBhtINInJ6QDgkdn40Adz/ZiXPFNVdy/erhgMX7QE8sbHQQwO9+dyzC2mL5XnaK
         7BS1bDCscfVxLHHW4rWF5uRgVrQhCVouirpEdP51VTho6xETlDOo/oj5yrAbaF8puSju
         hI2mcVr5x0PyyW92Eju+1rl4VpGQAmA7W7ciUZ7ngLTKlahlfYCPeytDFm9qpWwyHghC
         AaKWMi9u5LqYWI9Grjg/AeqHSgwy4f7qPYCX2Cgr5/u8bONNJsi1qGNjPGQ3sApQW753
         uBKGVpveUC1JGkrTYRkoGS6HEl+Reene01KmTZASbOtKfVS4a+NZKpdiHmDajvGgXaAf
         VVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915273; x=1792520073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqyKIia1XbYDE+B3uqaKQd6nF2XRYDNbOxAZAiXhdrM=;
        b=jNAuUO3j1VdRGjf1qxt/e072LYSkkbyU30EE5ZWLTMbqXO0CyGt9wjn6/dq6DaO4t4
         vF6prwTR1AefKax0H4qTrhtO0dlQCKQjMbB4McZtAxQLAJplgYkNKLm34Ohrp/HsSzJj
         TjzBlr9/QMi0GzRrhdZVmp2OzkU/zn/Iw2ABEfDyMQ0pW2V/6sj2FKP/grJIbLzIhM4Q
         MQjdOyQDpmrqTz7f3Txq1NLb7aXivFzGEIwsiKvxkBFbdO/cusZBA84Ihxu2I4Vo6zkY
         DAneCNcXAzlrCv3zcW+KJwyKFhYO5PVpqXGAmrbqx5iAlGnFY0cxU7BMCUs165BHwcay
         /gQA==
X-Forwarded-Encrypted: i=1; AKwUvBznWaYfW2ciNZDIYYYS79dhidjVkWEIwT7GL6uisnCj3UWwq7e1x+B28XAmWdwv7YAubXt9eXGRpH+a@vger.kernel.org
X-Gm-Message-State: AFq9FYLBguuRCiKwlg/TLrG3RZDkz6t9JrOrxUzn7QjDOz/uB+i3hU0D
	Z7LEhcB3gWIPzqoDZDQD6bs9uBsBYMPRdeMkzjgPbTEbajULDhxI6S8w
X-Gm-Gg: AYBFou0jiItgz+shn9Csb3lMaSvWAhpViokupJh9OzPPpn2xzPwgJgzlhPz3WYvWCfG
	HK58nqdMMEHiMruAozJTjBALo7PwqWZx75ByPjBN5ymDNX7AbE72VhuaF0vxEqYeed3yQplUbl4
	EmROreI+VuJIFjKRqxm/XfdwJH1Myqvb4pcocrHdpZsBEJpYk9o1cPrrkq6qE6bV4pQ1GSUty4Q
	U1Cqumeg7TLMpfqbIcwN/gRc1wEux3BIzCOit+/5/WyIoUK0dDtBGQzn6Jx2B2d1l18qASo0kx5
	1QqaV7Ea/6nZdCrQvP8xctuGT0RMqfc6Z3LPD6VunTvLJymTL7gDmAHWEP3sBSr6sAl81wq9+KA
	6zEhtZvTiF+DJif3+Klt7x7WNJpMa/9gKc2fScyxHsUxL6FzC8y7zvR/EaSN1qFWFsKxffqod00
	0zlZ75MwyaqP7zsorMv+9OTrkbyLAO5KePxYqCoPWBq5vTWNw3AD16vhb+q0+BLS3UwTTrn0sE0
	j3Qdxl9F5j1cSqC96M7r3GR2z6EOA==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a1a49ea94bmr115642465e9.35.1791915272737;
        Tue, 13 Oct 2026 11:14:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] regulator: dt-bindings: ti,lp872x: Document input supplies
Date: Tue, 13 Oct 2026 21:14:12 +0300
Message-ID: <20261013181417.492252-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document input supplies of TI LP8720 and LP8725.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/ti,lp872x.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
index 8216f1e3125d4..df25102fdac34 100644
--- a/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
@@ -81,6 +81,16 @@ properties:
       Single BUCK regulator for LP8720.
 
 patternProperties:
+  "^(vbatt|vin([1-3]|b|lilo[1-2]))-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      vbatt - input supply for ldo1 and all internal circuitry (lp8720 only).
+      vin1 - input supply for ldo2 - ldo3 (lp8720) or ldo1 (lp8725).
+      vin2 - input supply for ldo4 - ldo5 (lp8720) or ldo2 - ldo3 (lp8725).
+      vin3 - input supply for ldo4 - ldo5 (lp8725).
+      vinb - input supply for buck.
+      vinlilo1 and vinlilo2 - input supply for lilo1 and lilo2.
+
   "^(buck[1-2]?|ldo[1-5]|lilo[1-2])$":
     type: object
     $ref: regulator.yaml#
@@ -101,6 +111,7 @@ allOf:
         reg:
           const: 0x7d
       patternProperties:
+        "^(vin(3|lilo[1-2]))-supply$": false
         "^(buck[1-2]|lilo[1-2])$": false
 
   - if:
@@ -112,6 +123,7 @@ allOf:
       properties:
         reg:
           const: 0x7a
+        vbatt-supply: false
         buck: false
 
 additionalProperties: false
-- 
2.53.0

