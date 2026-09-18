Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641C64E80A9
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734093; cv=none; b=BjmR+dwnjKHzrc9CjeU7rPcjABC8O8JX6lXSBbZ8SEdw5z3igQjUuPmX1D+ImkmR70R2kN6/byFtrc6aRxrrKx9IC2Fw7uh1Rd+tfRkYPmqJiPw3kUg2tS+WsoyuFftnvl2hVW0b8L1WEi7l2hRAqYQZsR/6RLVmuwdO6djQ6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734093; c=relaxed/simple;
	bh=TuyjP1INHvUXJ5wQEnbUv/JdqrdpqiKRoAq0rTSCrCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdpKnMJTjqnyp18bru/7+FGAQkkrp9ZYtc4hV2Duaj6n9uJStavr6HJyJTIaX2QcW91EnUz/oQSDoyiYcoXLuK3qicox0HM9X9feWndi+A1v83mYyZ8GNwZDnPApWCLLTK0rKhfNSVW1eBHh7wB9lc0wqS1yp8oSBQaUjKj6QGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net; spf=pass smtp.mailfrom=arkamondal.net; dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b=EGEDyB08; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=AWcpesa/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamondal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamondal.net header.i=@arkamondal.net header.b="EGEDyB08";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="AWcpesa/"
DKIM-Signature: a=rsa-sha256; b=EGEDyB08keu9dVEZp5bKYTdcoJDL+Y3TWUSXTv9PqZtRlDVUT2JTNqtFsKYZGD1tcmeZjL1Z8JVB0zlYM9tgQ10jLq2PiagG4iH9hI4DVbf92MjhfYEAKSeod31/2HAlKD0JBZ4Xtr10KLBtZC5/wTJWNx7iUC+reSy0CD8UrTyAj5gPUkJmEkwlZ3AWeHaXa49EL2Ln3GCr2IA/JDXSrwxR4fZYpZZAZrylHZ8Jk19oxfELaxNlLxbHgWmbc2RvcrFA7AgQqybN7iJc32Amco91OiR0aN50I02rn2ODjMgvzMrUx79Lrq3ehT9EIib+iZqOrDL7G5lv5d5OlkuYgA==; s=purelymail2; d=arkamondal.net; v=1; bh=TuyjP1INHvUXJ5wQEnbUv/JdqrdpqiKRoAq0rTSCrCY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=AWcpesa/QylHKvcA1n3mvYVUrGpxtfuQWzi8ZXbZPiPcuu0N+BNtMg2FiCbJJO6dWDkpRTSAgv390pnoCWW7tMCSS8cJfALD7UMyfjtN4Il9ssBAUFPZDQDBdGW01GO66vMIzUz77WoCPgw2tH/SYTd8gD4DnujRyBNWqQzuBybTftpO2RFIO4ot+Lo9mkQQpuebFYikvpbTVpL68atFzkl0zPyabzbTLr+H4PH2ZKa7B3UM8JbTKV4W1S8YB/TkEK5ozqMX/gbUBbe5CBmi6aiHm+EexdqIJ0k1JbrHcgLkMb+4cVDHV8ejvo3kzqLbqeWPseSo+YN4vsBPSTwrkA==; s=purelymail2; d=purelymail.com; v=1; bh=TuyjP1INHvUXJ5wQEnbUv/JdqrdpqiKRoAq0rTSCrCY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1246644:48769:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -998652841;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 18 Sep 2026 12:20:59 +0000 (UTC)
From: Arka Mondal <arka@arkamondal.net>
To: Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arkamondalofficial@gmail.com,
	Arka Mondal <arka@arkamondal.net>
Subject: [PATCH 4/5] dt-bindings: iio: dac: adi,ad5758: Fix the 4 mA to 20 mA current range
Date: Fri, 18 Sep 2026 21:20:31 +0900
Message-ID: <20260918122032.134947-5-arka@arkamondal.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918122032.134947-1-arka@arkamondal.net>
References: <20260918122032.134947-1-arka@arkamondal.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

adi,range-microamp gives the 4 mA to 20 mA range as <4 24000>. The
values are in microamps, so this reads as 4 uA to 24 mA. The original
text binding described <4 24000> as the "4 mA to 20 mA current range",
and the data sheet (Rev. B, Table 32) confirms range code 1010 is
4 mA to 20 mA.

Add <4000 20000> and mark <4 24000> deprecated, so existing device
trees still validate.

Fixes: 777baca07ef1 ("dt-bindings: iio: dac: Add docs for AD5758 DAC")
Signed-off-by: Arka Mondal <arka@arkamondal.net>
---

Notes:
    Checked with make dt_binding_check; no relevant hardware available.

 Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml b/Do=
cumentation/devicetree/bindings/iio/dac/adi,ad5758.yaml
index 5121685337b5..ef0398170eb7 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5758.yaml
@@ -65,9 +65,13 @@ properties:
       - items:
           - const: 0
           - enum: [20000, 24000]
+      - items:
+          - const: 4000
+          - const: 20000
       - items:
           - const: 4
           - const: 24000
+        deprecated: true
       - items:
           - const: -20000
           - const: 20000
--=20
2.55.0

