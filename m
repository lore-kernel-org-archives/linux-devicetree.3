Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392547;
	b=p1unjFhArF5uJc+36inJrXRdoqtWqxu8qf8oyjRIPqQQ0Up/eMaG4zbOWRYfZHYFeiG8
	 WygP6qkDL8heWubPouuz+1mTnu5uSmaEB28N82y+xowYrjBEljlm8CTZsrPZWMTxark0e
	 o4lkrkhZTa/xGXQqNUTSzCxCjqklXWa2GD1p387chhIr7jCT710Jd4ILxHO6wAg4coR5R
	 D/oAZqvXxIR4G4hdWh8/klVWl63nuQzxT796WJiI0PYiNBMvf7AYfcVt1OuvaQcFZWUWt
	 iX2bhEkl8adFm2u9xXc+/fLtIDM8y4qg9wG9c6C0/Xqa//H7dfBsS5DHxzN6Ba8LmeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
	b=boqviXRdzuqX1r5Gi6NhvmI5vO+ToDXEkf6EHu1iXi/yKEP01ATGA8fV2jMLAKkCfvTx
	 yhj4bBgv/qr5MfP9VkiRgC0hv5zRMYqH9qtTjHgNHTQAwpFX+xjye0wOQnfPBdDoZ1ZJ7
	 MpmhR/mzskMFKCH16oLserq3ZzYFxlbbWdMv8BGknLyDW3wp6MUxF+t2xcZHfnw7UohJG
	 mExMrl2hoKJVmuGYYLQfZK9ltSOdftvV0eMkYsvGsQYK34T4B2hqewkAyOGpCf+imvukd
	 j7bebjwBj+sY7sm7oXMKeF1b1Iy0K1iql52YvgrJfnW8wAoepq/lqtDNhe4vNUcwD2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC99606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 20:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=gRfj5uki
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so168372c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793392546; x=1793997346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=gRfj5ukiFnQcPmxwrG0sQ0WdFQjOXz3BybyC09i7cCNIXdMGl5c4zCiujxCEpx0TTA
         X1jZ1Q77aDNWtQDOooLsEs8NHHDV+C0uZaaL4vxs71Ys+FiRei2FRoyYkuaVdSNcPi42
         mkfNaaOkKl8BP8PY5r1jTJF7rw5y9B0gkep8DeZewg0V6+UbFvIwk7xpciLVnOpUgqO1
         /pEhwKpOhybIHVM+NwErNQbPp9jpnVkAtr1Qmg/+wXderXJNYxqEwRzgnnyIuSqQ2Wu7
         ro7H4QmoRjZjt5hhawODG5i5m6k801iPspjwCp1fmCPv4BGVPXEhZeYaj6q06U3LzNZ0
         RVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392546; x=1793997346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vesw8q50bxaqrPi7FemLEo6X3ZjANSYOODp2BdhZ57o=;
        b=Xq70+FQooi0pKYbBWUs5+bPMfLdXPqjRt83msTJlWpfACegy2/RIXmm55UMqkmmbgp
         po6C5x0jbacqt4rhc0O4l2TLprfsx3723BwJrMokzX/zkxV5rjaXgg6OemvD8hWeHSo/
         pnHahO3B0AV8BlNbAjFVJeb8QLNKjYcXozwktO/oUGiHmJ/5qzy9rVTJ8TGVyRHNOe9c
         2Ul8qc9M5UEm0iHvLi7SuBK/xGHGF0tWm/Zz5q1WxAjVCDcwJ95BD2uEAD2YrohgBOo+
         sC3FcoCEfR1zQzT8FdsF1PkGURMa2bjhUXoBjUbI6k/5n/TwtPgmP0finKySlcdnWH5K
         N9gQ==
X-Gm-Message-State: AFq9FYL8qWu4G60jiDrN7Gg1kLAJiOF9e7ZPjNqtejraBR9rkJTT+Uo2
	+9eGjse24lWWTZ0sjGwox+wlafx5YKs+O3WItaHogiIh1euvTMEFhq3yJcOh/9p6qUQ=
X-Gm-Gg: AYBFou0NbFz6Fi/wXYEOTvjAqSXdxM6eacSvSHe7GsdrDfTsler+qOdCTqzljoqqpD1
	bbUTmg2k2rOOHyMtKG3XkwfxF5GwhgWCGfq6z2jje6YESacw0WpksJJBhB8m33owLqIRftaP5hL
	UxuDSNk1aGLX2Ck3x2UElSgDwXYOB25+Jdve0b3Ctb92pIpWSd5trniHPeTky/LmsyPfuVu81+O
	mHyVECH2I2//UZJQg1AeOetIPj+Ggo8HJY3F/aZQZLAi2dY7+VVUE9VMHTkQxmtA7Vz54dOH4pc
	w0NGeT/Ou+pFvUbuqzdrzeUJXjYw2EzD9qFb2UBHk5KD0HAZCNJr7Rm+bixYg4tAXbGsSpnM74B
	u05E3YTAtW4GyP5C60GLGkII3yARtq8SPdyRS4HoGWSn1llpC5n9HImV1HP4lVlhmBZ13OpdXBQ
	/YfDJ5d/weTQ3QHKFsMFt3scjyh74wfNYJfLqQxYMTIlQYzv21dyxgek3I1smjLkIlZR3sdxGJY
	R9Jcr2BqMW+pZGd10OvpRJW8HeMZzhYUKO7bimTxn5G60NtS1F3itO6wzpx4Vma26kMxppDzv6g
	CVh26IRKeQklDzzco8sDqEY=
X-Received: by 2002:a05:701b:42d1:10b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1ac5d3bb2e3mr4938101c88.26.1793392545641;
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm15120020c88.7.2026.10.30.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Fri, 30 Oct 2026 20:35:37 +0000
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
In-Reply-To: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793392543; l=2267;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=xGdKc4ht4sX2nlaRXtCYdgqs5k7lEYKRlHOOJw+KAlQ=;
 b=6YG0xUeBgjJalLeVwtKSnruKW+t0L+cBhZ/wxrcpzArMdPEhJChqtHGyaPZOCG3ljIySGOMnV
 0ya2pBT9441D8bgW9ZcVLwL1/sy8bT1w9SPyxbEGBclq/tIFmK73jhz
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
no ID register, so each part and factory preset has its own compatible,
including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
an output current correction, so neither has a fallback.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 .../devicetree/bindings/hwmon/tdk,fs1603.yaml      | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
new file mode 100644
index 000000000000..48d6dc72f248
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/tdk,fs1603.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/tdk,fs1603.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDK FS160x and FS1006 uPOL DC-DC converters
+
+maintainers:
+  - Kevin Jia <kjia@nexthop.ai>
+
+description:
+  The TDK FS160x and FS1006 are uPOL DC-DC converters with an integrated
+  inductor. They report telemetry over a proprietary I2C register map and
+  have no ID register. The FS1604, FS1006 and FS1606-2500 encode telemetry
+  in the same way as the FS1603, and fall back to it. The base FS1606 and the
+  FS1606-0600 preset encode it differently and have no fallback.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - tdk,fs1603
+          - tdk,fs1606
+          - tdk,fs1606-0600
+      - items:
+          - enum:
+              - tdk,fs1006-3300
+              - tdk,fs1006-5000
+              - tdk,fs1604
+              - tdk,fs1606-2500
+          - const: tdk,fs1603
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@40 {
+            compatible = "tdk,fs1006-3300", "tdk,fs1603";
+            reg = <0x40>;
+        };
+    };

-- 
2.43.0

