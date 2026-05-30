Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB4395AEA
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160825; cv=none; b=buQ6so3W5rO2OrkQpSEDBnb3+/X9JP9icc0Xxiycx91+t6dIMbHDCDk1l1WKK2PBsYS7yPVCo4KLXNXC6f4uW1uB1XkUIW5xv9bvWhikoLobbXVnwMCOws7vgkY6GnN9aUrWHJG3QsUb3/Eg4DlSkAsl3KOblz9pM9HyW6LfXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160825; c=relaxed/simple;
	bh=wMgstDTG3Htg8sV956v99iFXbhtolrOjZNrDTHpa1gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgHKFpbTDBQxCf0PGMGr9MFrbz9qp56eWQfF22H+F6xEMDNQuMSYEAokYul2Tzv5PXGZyiginMTDPLVd4t9GpJNPO/gjqLvmMIhrWlHXr01x1eHKjZaKXgh8xJYAVFURFlCMSIU4nC5B1ClpuxgMnVOJqZflhaiFtYWgWmsK3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe42Okgf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe42Okgf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso79233615e9.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780160822; x=1780765622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auC75XiHji4m/5c8v8bWvJiaMsYrhK57f/6mbMWrQHo=;
        b=Oe42OkgfqGsZq6fjXivRoOVeVThhwPpLde6FSKxqRi4RDRYpE/P1Ym8hTmJd2KJtdW
         vHASFVbLKO1NE9GuTFPFT+Vpj2dkCcL50ryUThZ4oOW5PG+S4EVh+jKBzQV9fY2B5wI0
         u1DlUo7iagudWn5UJmsdwGgaADWy6F/ab+Z9T4q+4oEIjQkmFFpAgc35Sm4zgVSd9QMO
         X4+S20HNlBI6/mMymxVx2so425n+6LhZ+h3XG3T/uCh1M3wDwN0lqFb1UZvh+eevNPfl
         hsGvPdUC4QWZ0gwbaMuea4yNqb380Ve/GbjYMwRPAkGFZxYoV0XG5GhvvW4kTFlGSk7x
         BMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780160822; x=1780765622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auC75XiHji4m/5c8v8bWvJiaMsYrhK57f/6mbMWrQHo=;
        b=abU0j2DXs2hz+R8WElZpBGzTuLmrHO6s127TEpNj1hMQcYIbDzR6M+40w0+lsHESe5
         vAoCJ7uPIvR612XiQKykBWogOhFtc1Buj7ozghICqT2aNWw0zwFFzk+/BzFWPR89jsyA
         wetyhtgDqwIYjygkyV1jyabVSvZyqC+xqf8RxhSSSHFksHt2FPi59EBy1SWyxDGxES60
         vnvvKcJg6aH1uaUkELweuAAennzm/O+l/fzzwptVHFKtlp6KzVyc9EJ+z/vL/U6LKjuC
         kGDa+45vzC5JUL4+PBeIOfh3EIv5UI5ilW1pCECV/NOS6lnzmnBaWKOnZc8NjJvQ8PQk
         ewUA==
X-Forwarded-Encrypted: i=1; AFNElJ+z0nDscwYzcpTX2OCF4TtY/cEj6mEe3khj8yjl7ihpOQ/NrlnnynwM3J+QVqWVZ4xRWBe8XCipK3y7@vger.kernel.org
X-Gm-Message-State: AOJu0YygFK1GesMEuzm2I8WuO/Awt3nu4Lcy4QZ6Bzol/OIV8ueGm7GC
	IzRJA3yOQlMJ6LjfjSWbdqy00SpCYHocVZAUbdB3N9UHDrohme8YMevU
X-Gm-Gg: Acq92OEdNf/c0b07Z9uOkAMkKn8UjyukLTkVpMGTNFxEkj55eairmrQNKFqLOyK/SIb
	bGEEbwsHJRjfpDbsRhUO+nTL/pNJmQD88z3CUeof4J1OYATq7sslZHGrIsiO5FG/2IVWbGU+gmU
	gxA64Kp0C2B1/i4NH5F4wVBvytxOSssohifCczprI5u/ppFMsxUHiqBe2+rpcFHXNCC83ctMYo5
	4Np7f4JYkUgshFV8LnPmVjdMB+l2y6d1V+I5wCeKoqJFYEhlri/LH3rO1aNweAVvMp5FULQoM22
	VV9VEdNopMC7TSfM3xpUf6vg+mMNlQSoX0omFz3oT/DgS87AGgRXZkHdIvL1yaZuArNw5Ft8Mky
	rF5TZRgJPDht16MocxpuKD4kqnNsmJD3O1NiqCefvxzr3Y/koovEW3Z0lv7q8wUBb7KEgwQg9e5
	+RCSRXgKLBLpu66828cjp7RKuKQxokmlVn7mqHbaNbDOQ2KIUtfF9dBv5dvPsWp08PHwFqFtiqa
	YNJKI6QPCSxfB7iSqki92u5QH1YZxKaYfG7syMDDc+LdYzkZkQ+b/dsBYxukSj+OUQXpbZzSXcW
	pVTPDZJatbqtPoGBd7aMOqiEuM5nsc/wIepc/KaOyfAcpnygl45CX1z2AUjKsg==
X-Received: by 2002:a05:600c:2158:b0:490:58ef:ce9b with SMTP id 5b1f17b1804b1-490a293df77mr50416235e9.16.1780160821738;
        Sat, 30 May 2026 10:07:01 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0:c287:187e:fb7a:66a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm229144675e9.13.2026.05.30.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:07:01 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 30 May 2026 19:06:46 +0200
Subject: [PATCH v3 1/2] dt-bindings: iio: light: veml6030: add veml3328
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-veml3328-v3-1-dd562eaee8d9@gmail.com>
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
In-Reply-To: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780160820; l=1857;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=wMgstDTG3Htg8sV956v99iFXbhtolrOjZNrDTHpa1gg=;
 b=aiW0KkSaI1EzHq1fpZ2Hs227JRUPIyp3AMZ1jRq1ky1jyrMeKlAlTifLyOLVIclJzLphK5Rm4
 5vfpCsm3qdUAb0CSSGnOpCB5EmZZ0k3fW59ij1g4ynpvfnROpu/vsD6
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The Vishay VEML3328 is an RGBCIR light sensor that shares similar
devicetree properties as other existing VEMLxxxx sensors in the
kernel.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
index 4ea69f1fdd63..0041e1db6838 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: VEML3235, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
+title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Light Sensors (ALS)
 
 maintainers:
   - Rishi Gupta <gupt21@gmail.com>
@@ -21,6 +21,7 @@ description: |
 
   Specifications about the sensors can be found at:
     https://www.vishay.com/docs/80131/veml3235.pdf
+    https://www.vishay.com/docs/84968/veml3328.pdf
     https://www.vishay.com/docs/84366/veml6030.pdf
     https://www.vishay.com/docs/84889/veml6035.pdf
     https://www.vishay.com/docs/84286/veml7700.pdf
@@ -29,6 +30,7 @@ properties:
   compatible:
     enum:
       - vishay,veml3235
+      - vishay,veml3328
       - vishay,veml6030
       - vishay,veml6035
       - vishay,veml7700
@@ -79,6 +81,7 @@ allOf:
         compatible:
           enum:
             - vishay,veml3235
+            - vishay,veml3328
             - vishay,veml7700
     then:
       properties:

-- 
2.54.0

