Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF3399015
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141775; cv=none; b=SQuw3yb8afDVl+ka0Ve9ug/BzXiVcPf8fy4tC3Mh40qDI9Ls3Mz/cVjPb3+tPG+c32FWCOgP0Egtwwhj/4FXFU+ygBwKqP3KyPpEUMKAE+AHXlBEMKXlxLBV+wmtFSYZQLOuji20AlUNgnlmUtbJXYag5saOxBeYOGlcx35dYaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141775; c=relaxed/simple;
	bh=58hXK3+jjxdURzdM62kYNdhGnylmydkjDZ6DhB7yRAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceXodY5Kp3Sg+6yip6UqYoGfTk008AKzDGDkNyRI7RmdODc4kJ1D7b8h5EhqmAmEZlG18f1BCW+JmB1x5Jq6BJFnFurryu2W1ogXFhP6huS6E8bsiwEwKMq2fgM7cIbomc0CgaWH239FgR7A4zNrCWJYfjeU80b0kvBkTweyBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxX/gfG0; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxX/gfG0"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso1329295b3a.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141774; x=1779746574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ3L7gIVtDuWxh9a4b/o7Up/IHdND0VWYFyTOBzXy1Q=;
        b=sxX/gfG0UoxLsEk/xjAuUpaTiWBqzm/ajeS08EpqCK1mXtqtV45s2C8xd92M7TlEij
         HMErpGKYd5+YGfGCLU0fdbAJzCil9heEPubQqASmpZ18srp1H2HBJlMqbdAN+sa23eUX
         gZ8JG+hV5ve0nz63Mu3+lzYtorDd4rt2pDLe5WqyrQKEqgV7FIWkXzi1mviXgn+yxBRD
         0nWTitswxb1/RDPycnsOevI4UBMlY9F15VW7pypya68OeglDcTl2DV0idxymhmnzYWgM
         MnDDS/fzPd+FGevLXGBs9waUP9VAPSPHfPIBMSNolGY39CHcSniijOdgVPctm9oeeWTf
         YIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141774; x=1779746574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ3L7gIVtDuWxh9a4b/o7Up/IHdND0VWYFyTOBzXy1Q=;
        b=BVrD2ngFTrYjCJeoQNMz+GVXCEumIy6UrEHB8oTSmNU3RshddEKoiWDVf2XgtXJFkf
         ZOPX7YOi34iCjISySaJ9APkGHGMRGkSeAB3i1NXujc76YhrEc29U6gY5g+Y+MjZjG1ng
         pVpWzuqVRABF/QetCgqUzWyJE7ACKtyOFGVd4ji3y0IcZUk6qpZwrvWC8H2QHV1hXSBO
         qYYvAJchlCx3gJ/AC7CaMSCDNyJn4YM7C6ALPSW0Rqzakm7cVnsNrL8/8OfqOxVupTmc
         Wg8HES8YxWakZzQHPL2KszNgsj6BHRW0EMP4FOkpVSVjq1iTRdtZSGhP79G5le4IBCU+
         Vxuw==
X-Forwarded-Encrypted: i=1; AFNElJ9Eaysy2qA/3ZsCH71JLsDBNekYcX0chbnLqssIVsLEA1C3TSpHindfNvLoNOG36G6F/8d0Nsn1NcPO@vger.kernel.org
X-Gm-Message-State: AOJu0YwCM/HoCRlRp8fm4MKrj1UcOHlclaABcm/iCufm2ZS55DP48gC7
	y2iAhN+3khwQoeKFifmb9pJPAwuFMSPJYzYk6hBxMIq+kjoR8bbWd116
X-Gm-Gg: Acq92OH1Eb5tSCY1dgqD1PP1NFL7Y0ADpIOzux2EWpCJ7v6VSRMgNfInsQu9j6hBkrw
	UTIz1/D941+Re+g0ktbVQ7NBiUWuZvUtMoXUMuzX52JvH/mr7atOYkLr/Vj7Q2koXa7IaufPQrG
	5SrgSxKXJjS5qmg/ISJW/ejEh86CYgp57wleZkQMOYFc4aP4KoFEoeViPQi/Vbkf4UwTwUNrhcZ
	v0EHtefJTnpx4U+8RDIgdPUZdpVWXpgxRWsvmrorEhNo1tyR441is2L2g5tTMqYc4uyagtKlnh6
	dqcBbEapNNFjVreazgGro15Ue681smoHRvgJHQZtrTuO0OwW1dyHBYtuJwL//+B564hvXHFpDs2
	sNt7EWB4/REOuHjHcmtyutDILO3MF9Z9dZDx4FSkii+UpzeNShfOtV9ov8SfAjPiuOjVkc4CYbv
	35c3VA1/7hmZIJQNCO1jhIG3AUivNdbjxQBghgRJeBJ9L6o5WNZpS/YrT3FIR6cikugpvobSNG4
	oXD0r6XpKZkVVR2u9xhl1w1f2oU9BocCA+25nWkBJx/ic1F55hlBUvwSGbT
X-Received: by 2002:a05:6a00:14c4:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-83f33c9570fmr13371904b3a.21.1779141773709;
        Mon, 18 May 2026 15:02:53 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:02:53 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Date: Tue, 19 May 2026 03:32:20 +0530
Message-ID: <20260518220228.63322-5-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518220228.63322-1-piyushpatle228@gmail.com>
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the avia,hx710b compatible and document the HX710B-specific
DVDD and VREF supplies.

Add constraints that forbid HX711-only properties on HX710B nodes and
require vref-supply for HX710B, then add a separate HX710B example.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes from v8:
  - Dropped the trailing sentence "Keep the existing HX711-only binding
    extensions in earlier patches so this change is limited to the new
    variant." from the commit message.  The earlier patches in this
    series extend the shared top-level binding (VSUP, RATE GPIO, etc.)
    which are valid for both chips; there are no HX711-only binding
    extensions kept separate from this patch.

 .../bindings/iio/adc/avia-hx711.yaml          | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9134bbe41379..b2b5c7bdf05e 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AVIA HX711 ADC chip for weight cells
+title: AVIA HX711 and HX710B ADCs
 
 maintainers:
   - Andreas Klinger <ak@it-klinger.de>
@@ -14,9 +14,14 @@ description: |
   differential input channels. Channel A supports gain 64 and 128;
   channel B supports gain 32.
 
+  The HX710B is a 24-bit ADC with fixed gain of 128. One input measures
+  the differential voltage between the two input pins; a second measures
+  the DVDD-AVDD supply voltage difference for battery level detection.
+
 properties:
   compatible:
     enum:
+      - avia,hx710b
       - avia,hx711
 
   sck-gpios:
@@ -44,6 +49,17 @@ properties:
       RATE pin state is determined by the board wiring.
     maxItems: 1
 
+  dvdd-supply:
+    description:
+      Digital supply voltage (DVDD). For the HX710B, DVDD must be
+      greater than or equal to AVDD. When DVDD is a battery rail and
+      AVDD is a regulated supply, one channel monitors the DVDD-AVDD
+      difference for battery level detection.
+
+  vref-supply:
+    description:
+      Reference voltage input (VREF).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -53,6 +69,21 @@ properties:
     maximum: 2500000
     default: 400000
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: avia,hx710b
+    then:
+      properties:
+        vsup-supply: false
+        rate-gpios: false
+      required:
+        - vref-supply
+    else:
+      properties:
+        vref-supply: false
+
 required:
   - compatible
   - sck-gpios
@@ -72,3 +103,12 @@ examples:
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    weight {
+        compatible = "avia,hx710b";
+        sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+        dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        avdd-supply = <&avdd>;
+        vref-supply = <&vref>;
+    };
-- 
2.43.0

