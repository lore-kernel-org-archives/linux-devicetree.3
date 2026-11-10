Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325382;
	b=5PT4XSflyC34LO4jU+8kX1iB9uJuUHRPyqPL7LBJjZA7+osoC0Vp2qjJEOPmWKOTiGoc
	 9HlVBbSOIIYgQRdmUaADd+vzdVyXiyvZsxsZFw0MdZJQXxBaMH69UQDI6HSWiIEIojKy5
	 /t0GQWrtJXr7Zo1YCAF+3tHOWDO3/mLGdE3PKD05iwXZtG3ueDZ6Hv4OMBr3Ky92fnZ4g
	 0gNHPrYhIdty8eBvmDt2Rc+fZTHO5ZBMTfTgdSobpbDK9lBG0CpXyctXNy/s4XScGD8x3
	 6ar5adRX6Mn/7sADKOQYjUrp+o8j60jQ0B6pL0Sma9WUSqO0qnQ7qq7b489V5143ZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
	b=oStAcrm/gW4FN9nlwg2F3UYX0IZI8soT1cyjShXjcWpnGgxPcpR+W7Lwy4oBb7LIEAQM
	 VZ1QXreqL1FXnVTdR0R8kZxGdBif6X4BnAmazBbvTeLmDc4DfWUb1UfLMihrBXFqfT8xP
	 ls03MRO6kIotT3N5J4jQ67qw4rlg20bIR9sGVOix3GfkLblQczjdHT8WAHEvga7zTL27G
	 M/XR6YnOTN2xwSX6gieR+fhDQSVvRDZIBriOucZz4eAg0rok80R66qq9ihKcAlO8aoj7d
	 dB09OycKUWqPYD68KMzmD03oOCkDRob77rky1givWpZhwQ/mjEzYlYwdpWPolZiCWuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juPNybO9;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF80606D760
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF80606D760
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juPNybO9
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfc004920so18650391fa.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325380; x=1794930180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
        b=juPNybO9ob3cWcrZLpGvPTYrhVk12lb5syJQk4janFfUd2bd2ELKI82pjVPIWTcz0B
         PvncSwO8k5BJg9+a1rWN+agfrvu7xWYAgGv06+hhQuwu7cOKId5DsTYN3pQ3mH9BdOrg
         8YD6u91iV+RBapoG4c1sk63alTFIJUMGy+W7cnEVyc/MbixacMqy/HiOM1TxHvwzyFTr
         KNMoEmLyCCJYaR6LfSS542oid00zkMjstykGx8JNKFmTjlJA2Gz+rnnVyTP34OlVNy6U
         EdF3edsZ4t618mW0x09KicJsr0Pdh81Ed2BuV3olYmf+dJIFb8/4+yeGLrC/GoF3DIxC
         Azug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325380; x=1794930180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcH0VH9d1TflRVvDyREb8NEQ6oBVJ5eOfoPTcpv7Fok=;
        b=wLsUNvbD0I8GIfwebDRQL7gchfBPVD/VZBuLz5sAZwb6u0XyZKu732pqF/RUIe2HOY
         szCuKSZmBy+3Sr1YXjRqAIKnf0oX/PhEuTharyZ/TmjHfotG+VJ6Hl6bgijHY9O8AtrF
         e0+UUsE3rAkxKyOlI7m9M+iEilQYOF8WVxItzMqz0cFtQ6EXNYtCwwNePPcRYSdHO5on
         s3EjKWmYo7LGZvIMXwIhalbMN9l8OJ7mWkK2gmLhk+iLVy92TZrMu8bTToG0IQCGHScx
         d6Bl6EehY9KI8lkgRYlNghljBy6TZ0B3yKxBlvi0GPKLw4GR8IKeytxE1EY1+AgNW4zI
         97FA==
X-Gm-Message-State: APuU4Z/tG8BQk7uZtNpMEs/J6GzQir/x4mIERU5/pQ/oamNfAQMh2TJV
	BSd30qNCSkcwqcUVx5/cLdNiFIkJA/QcjKLMZPPYwZxWVrsEW3xsE83zp+ie5FpT
X-Gm-Gg: AYBFou3rcwtQjdkegU9xAbmJG1twmTfwxnILszUakRldj/xPvkK/oHXh6WEwab4DKS7
	Krz/b/izmv9ng2l2QMUukqtSuT2I4QblJ4zp/fe5aaGZJ4Qid4NFCTenXhwuWzfhV9DdVIW8YE5
	UuZqfc1Q79oK0ckjOO9BpIQQeyzRV9duh7mWbejr3Xwv3aylCdD4K4jYFCe6UX/7Kv0JMqiQUW9
	M5NiGqbzYvP+cff74muGKt4hgpug9R1B7Q1LND90BTCKfthwIC3PxQ6coUFjVHH/+YY8VihjkAg
	qy/GNW6WBr+MXmCcaDUGnyz1TTHvT7C3XHaQEW4Yt3OCvCQcSLqANnzjAH+a0n4BTdU7P1xr2kC
	3s1+zq+DGK+b+s5H6DMg/AdKpA7okmZbWLWQBcpmA8LlPcHbDTF7NrMDD41ugWia3a3gFK+pnqv
	J/zf2ciB7fxny0Wp4HsTRA8pzmcqkapK1IjU/CsIYIOrFkBks30YBb5izDENuT+PV7gtWCxMEbc
	myXYCINsQdV4ZTiQ2RS0TtBvxY5NtscYTyHzqFSTJMPPvAbmL4O3UeRGqHTUARhhZ0LO3fWWgcB
	njFT0Y22hyeRZC+HbuJVRjaJrDgUpgziJGsi4L56bJZ8WHO0cALVVcsOUaHfzwlbH0S8mEeJUoo
	h6bGDW+YvrW6gCUiutNAhei3JMPq4E3aioHbLsA==
X-Received: by 2002:a05:651c:1608:b0:3a6:10d4:61c4 with SMTP id 38308e7fff4ca-3ae0964783cmr6048041fa.28.1794325379385;
        Tue, 10 Nov 2026 07:42:59 -0800 (PST)
Received: from yantra.. (nekmmqt3kfwnocz4ivv-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:453b:19fe:80e1:2b9b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923d583sm5751481fa.21.2026.11.10.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:42:59 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: pressure: infineon,dps310: Add interrupts
Date: Tue, 10 Nov 2026 17:42:53 +0200
Message-ID: <20261110154254.39092-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110154254.39092-1-zoone.rupert@gmail.com>
References: <20261110154254.39092-1-zoone.rupert@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DPS310 signals new results and a full FIFO on its SDO pin. In I2C mode
the same pin sets the address LSB, and interrupt polarity must be the
opposite of how SDO is strapped.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 .../bindings/iio/pressure/infineon,dps310.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 416117dfd927..cded6e0af147 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -23,6 +23,12 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description:
+      New result or full FIFO, on SDO pin. SDO also selects I2C address, so
+      interrupt is active high at 0x76 (SDO low) and active low at 0x77.
+
   "#io-channel-cells":
     const: 0
 
@@ -42,6 +48,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -49,6 +57,8 @@ examples:
         dps: pressure-sensor@76 {
             compatible = "infineon,dps310";
             reg = <0x76>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
             #io-channel-cells = <0>;
             vdd-supply = <&vref1>;
             vddio-supply = <&vref2>;
-- 
2.43.0

