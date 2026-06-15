Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B2416D0A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544492; cv=none; b=CPp1agswBOZyJ6gG02fk7i2JoJWumuMZt8lIn5vBeq+92GuXvsm82M/ds6TyguxZJepvdGmt1lS0R0AusSXKHQO0zX/1B+bVN3/chw5gRAHjNptk07xuhw1cL6QUaDcztNrigwBKbumEJ9TCue6mJzS/DPacPKdop/wwzKrCNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544492; c=relaxed/simple;
	bh=fMKaNCHqvdnEkQNOcz/+Evogzl4yJdpF2G3aArECXqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJAj5JDG5F+4qyvb/X5aMJVgxDmlH515SJxafdvuAgFq6GrMZQL/4iSiW+U2aicj/WUOpJ05v+XQaORXVpX4ByVYwew/NhSZO1EnAcDNQRDZn9zq84ZF8CIGT9xKoObpff1iaxtO9z7pof30a910fIXMoEOtF11J4lBMzon1YEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SehANlFI; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SehANlFI"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e6cee520ccso2496102a34.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544490; x=1782149290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=SehANlFItaoCd7HdIarHtkcaHfZ4Rbk/VtRRTQIpVJZOJmTqncVrsxGSQ2gKR64Xvc
         /dirPSOHUdrk4Z73uer3MPss4VdvCnQhQ3E4uPKBYM/7pFIWbqzQPazZNURWabR553EL
         HL0MD1v3jLkSqUiOBuMalV9VdXEqmO8BV8uryrKQjzp/FkBSg1zSfO7TFb2laKV4LP56
         TbIktC1GVPjB655Iuh6nXsl3PR8KwBBSoIXlVO3vfwZHdwvPae1UTQJWBx0IUA1zs/Ge
         tQ0o9UDYPFenNkOdapO3mi9DYAVQcfEk8e8vNCWnDwOAnClZro8773IKM61qPhyNPIqd
         JPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544490; x=1782149290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG46e6wh0vfo+H1QfKvpne8/nrh3wipAUO48FCP+P1g=;
        b=s35K6RRTktQTMQJBM0miKcZCaOmd5NIOeTVTfdatPlnTk66QeH4Zs1w+adiMRtZfJ9
         8JPIQsA1NDxLp5QKRz72eDU7Sp3TqiVkJ5JXF7YKDHpkBSy8H1XoGS60I2oha50xWn3j
         Q+5F/4N1l8krLk7lHZIq/6laLduJCk3O6PZQiGYmivv8WjfNW1YDCVwHZoEXkAwbGetU
         +epk/ZyN+FpW0LqOAIXrNMACNQ9AE+ZLzgAKDYVWHxBUtFVu3zHmeR+QG4h9U4ifhxRe
         K+FnxxhfauxOzPg/BB9qOleYa4PuWl5JihGOMYUTN+4FMMpzTThcWoq0Dqa+R+X2gM5O
         jzTg==
X-Forwarded-Encrypted: i=1; AFNElJ8colhaDk4QXsjgz12hwGfngxhoHMhwVLQ3uVB9rpH7CxMfpTS8SusQFUnNk1dFkf3giDoFKbYJhD6j@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaEcYTZVKwC+4JOJRWRsYfUE7z2spw9Nq5h61fFEvO+i2+knZ
	WF5tBeu8zwllov8QlPc4Q079fLre4Q3jAn1LToGGwBahJGb4cuMetUQm
X-Gm-Gg: Acq92OHvDrSx+vvbMi5tPjqMujQRk6bkFk5eXeY4dS6r3f3ElNFlrtZOnMy6jjqIMLk
	csm1WjoUw90HgUhHIBb/ha4Qib8MLfHUf1dBb4XBWcqRYdjR2WRFPmdSVl9Kg+6P6Jfco7L335w
	XmilVN0zfsYZsa4wvevMjr5N/Us90WEBB9ZAqoG/9md200ir36Llspj5h4HG2qNf/JKobNIOZIG
	67XfUwF5XGKA2UGpeCeNhLv2FspY8hi+vWlfHQgI5dlPAw1bQc6Cz8IabE6MxipkXlExTw4QthI
	uxcPHTU0kopa2/vEqKcpobmGc/YNNvMsC6MUU4GVQUQ+IMAdsuLlIBLTgerApXESYusaJ4ecO5Y
	LvhvxEAML9fncFT3MNCvJdHer0sknpov1BT9hkUFSjUB5LyORWcjcIR1Fl0BcrxzS0OLJ7//Ylr
	cniDAPq7veOBmiLMT7sq9+Jg==
X-Received: by 2002:a05:6830:3915:b0:7dc:a51c:9197 with SMTP id 46e09a7af769-7e8fc87767fmr222189a34.7.1781544489699;
        Mon, 15 Jun 2026 10:28:09 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f451fe7sm4480033a34.0.2026.06.15.10.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:28:09 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V13 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Mon, 15 Jun 2026 12:25:45 -0500
Message-ID: <20260615172554.160910-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615172554.160910-1-macroalpha82@gmail.com>
References: <20260615172554.160910-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The driver does not require an
interrupt for these specific chip revisions.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

