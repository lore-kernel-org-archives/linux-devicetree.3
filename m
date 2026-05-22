Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2683A9611
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438258; cv=none; b=TSV6/Xg4h7X3EidVo+XFqPS8kRYuWljts+BMlCweIFqGU4fC1FLY/vfU1rpvyWvn4sQBDlXTIhzBY+Ku251WPgKwLcFT+524A/WGeTDopw+D0EeC7BAGVhtI/unkZ5uZq7cWXY3UMIHbcbL1YhWl//JC6n9J/OfXgs56wKX12PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438258; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u192OOxkVaxMz6VfWUXyMGSQ9XQKffhFiMifO85pAzLN6gTDsQppqMMzz6fhRBr5wjLIFSNSV8AUm7kUxAToJAwuVx8gIqMNGkFOpOs5rSCft+t2VW7lygSIONDuNuSB1Uwtj+XjLVaEFoa4w2dAfWb0Dywa711+vdCAcS7ixRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XuRpK3F8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XuRpK3F8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f6092eso4116640f8f.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438255; x=1780043055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=XuRpK3F8JcOQENl+OadbHzE7Kd+lY/zVqGFNMXrcQ+dZ52ys3ewfzO2sgSTDeQjKZd
         z+jgJr+mHMapo0V2MWWsG5EC5xI2XXwUIDn2lyup35yORAIBiXmiQ+2lpMaQi4Y/ZO1w
         iv6cnTzOxpHXdOOcueuvPsbe5yoCpZnzAeCCGxxutjuNYUMiPPrmY0S2KUHhDLbW0u7n
         xq8Y0ELLjA14kNHgiEnvps7CJVKa3ofW4ucgsx5sQ4i1T4Rm948hlAlZtsKUBv0B6paJ
         2XymPJSgpQZgm76TlzbTYNPDUsl1F4610p483KdPiU0PnDqZWpEpGfkRtujZOCHUwrRD
         9ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438255; x=1780043055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=OIy4EVv9jloBRrCbEGu8F1h0M8jDk7vv5GodWx+hbjjOt9HrPDVqCKIFI18JnhY0yw
         2c9pvwjLwxy0CEsZVtZf1T82arRyqa3SI2kn5USdmCp33AE9pCMphdD6K2IG4ZH17plu
         Q7YKxjYZ+4ut2fNYf9fUKa8aBUF8PDvYCwlFYTPXykH+NzI9hwpF36bJ7NGm+II85qbR
         SYx0k5oMbH/pa4crASuHAJq1XjWwfCoClJu41Xk3ZkNaJrN7vlud9RWo/TY0GAhlUPWY
         a4FF+gm4/jNu1D7Vhg0nVLFzaDiXaQuFXJSQhJ3PlkvTkyI3SvNZM797bKY6itXM6WnG
         qCdA==
X-Forwarded-Encrypted: i=1; AFNElJ9y1G4HDnyo2sFBe90w2uWxBR9WkgqMZPQdPml28qWjv4UuL4wfXW2MGPcs5hsf5+35A2zkf6PGgWvM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyycb0dkvZ2SqGZVMu3pQlQ4JDPnsm1r9m1VYwwZmVU6XaOoqgL
	KvmSvk14YSkm5bdzHPL7LIKtVewgLkv9uZez3DOv8ALXAJlsS1SPiWCuqL8tTxNC8kw=
X-Gm-Gg: Acq92OHvdK3WzQ2tRPcqkm28bBGt1a6NbUimIguClPW9efRwV+v7zoC528XtzG/fB1c
	0OYZ2Mwuj74+zNsgXIMln4oIN53jCXV7IPCVq2w3omg1ietGXtyvmAEwPFiP4V7tC1h+sVX+GqO
	aqFHnnGzbdh5imD8Ur4kn+qT2InFzoUUrjKwRCKdjo6N++e1iq/QQuYrhuXb6xEV3w6EV1nyQQf
	X0VrugYeS/vJsLe75juRux7urvBB8p664wzoESUqLugwltlWwKSfzoBbF2q+e4zN0docdlZTovi
	VREr3n8egMq95r7SfgBrAnJUzH/YCFg7BB1yr/2Jv3vQDdShxDVc9S650GxbNIsqjUAY0xy6/Gc
	ta7r82F6SGWZAv1tLKbp/eEzUUahy4AjA8gcl2+oJbSosHf1SRhC6Mt6RyuZZPBxmChapBFom1T
	iV6Sg+Zp44jL6uDEMekyQNtt4NiTjdS6KIobI9KhVxbBifR34MJooeICXj7eOXunsetzKihZV1D
	BSRfc2hPDw=
X-Received: by 2002:a05:6000:4905:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-45eb38a66d6mr3096802f8f.27.1779438254651;
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Fri, 22 May 2026 11:23:38 +0300
Message-ID: <20260522082349.2749970-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0

