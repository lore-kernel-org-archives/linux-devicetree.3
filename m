Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742794;
	b=NNZma7NFaXba14OWvqOnMaYHBLlchcrQrpZtdHds3qAwlym16EnDAysYPKLuKgyinr+j
	 q1BLkZDDNC8/u0n0mmsnSeP90IAdlQNmnGts8VH9Jgpdcu8RzjKFTv2OMympwb9zhcWcD
	 SoS+4lrMRrS9XSkelkx0Q4K38gu7jp60ip9oXpPKty6IcaoYJL/uILn/QLc55rEaKo7bM
	 1F9HCP+zjjvsXxRn/vEAxchiybNl8m+n3sz9hfP9m5Jw8aeh8rGC2pIuhBOAt0NYH7pJX
	 hoGBGN/lYseA9rUlXbuFLWjR0ZfOsguAcVABp/gaY4+xaLrCM5ns/UcRfZMvq0wFtsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
	b=Pz4rTkNlSzsr/z5GKIkStth/G4qmnKrmfAjD1mTi68S5ghZHuoA/3AFcZ8lY0Q9o2Fo7
	 yYscwdyqzJ4mMHgihnGBGn6YpbQkeTT585K5uaVRYVRqeLTqhCdmJ5uRYjH0jhtfk7Mc6
	 NTiwmUQg1Sx7hGsHbv0jl6YqSRKm0vTVX1OOgjQtxs1sn3fiaS1U1vRyPbB66oqMmOKw5
	 tvijFsoLX13PtVdi/fSgjesYZLWkGzeG0EACU2MXKB08HgZe7mW8Hoyfv+7N833oxhF06
	 3rg4WLyF99HLejVqKNqbr6ZtfYG2b4Nyg4QFdWlXmckbIVJZdVW3q+AmRZ9hA/uJYGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcPaCema;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FFF606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69FFF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcPaCema
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0414c1062so45445595ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742793; x=1796347593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=WcPaCema4u0dus+/y5eGcrErIOJSggLSuvW95VzkqNZDz8EyEfmHxof3ThrhY4OxIA
         pkWwfyT2CUrQ6S2SRfGCaCfe+yln8NAooerJurAwHkVk7cTZA8wkPKfBL7c1zR0A1tZR
         pZBsKoJyg2Kr8iXsQVbT1n8ZnplzBNnNUDavr9PJZ7d5b+DoTY75tF21VHr5poW0w+jT
         vEOOcVg2N6TE2KSNM87NItzwzWM1ohcAHtggS8IscFBhWlZ7z4vmQAEwrppMB1aOz+5x
         AV5ny2DCdBoyxNfGp2R0PeF37irRavhLeu9Khju7slPH7+Iqh//rUnp1UJMoi1tHTnxL
         +2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742793; x=1796347593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=QfiFqc/XVOd3mEQGWdAJziPfwdDj5stBuSn4QyAz9m6jQsGqhju2Ymrf1G/m1MAQk1
         Gos6tnhmo67qjHkUvNwbzXjlP/R3v3+/MfqFtNibIICfQG+Xj2gUYj7Tq02e2dit3b93
         R2z/yNAkZQwQ9Unyz2AOmMLuU0KUG7ckx7v5DiIG57zNx7S/8sw5hAEGJn9noQJIV4Mx
         pHt779hmpx6RgKMGg8tn+G96PLMM0G52fBTg1AirCCSFny7yqw8DrYAHQGYbfVNzevLE
         uhDmZZXQ14ZgImR6k82DZ1DJM0RlL03NZXTzO4hksyH3SOubPSd9YKvUdP6H5Lt6aOAa
         qa9A==
X-Forwarded-Encrypted: i=1; AL+hErGQc8RjzUVN0mNLrxq3ysDWZuF7pl6IH7hgT5ZBGflIGiiOGEzL9iwY413ZI6U9yz+sOyAH62Clfmt7@vger.kernel.org
X-Gm-Message-State: APuU4Z/6v7/CL17i64fZeHjA4LNxg2J/YDk1OnLOe+7QK+muc4scoXaS
	60qJXG8uJDVulTCbeJ+rb11ViokXMIPQcF7TRpIr9wSSdOIuHlzjZgUI2uCl2uq6Q0w=
X-Gm-Gg: AZFdTZdaB1hyNHJ9d8FuvNKqmUB86e5Nlxp9Ru+FtNfT8iSydjUCaBJfLqn7MWqxWYR
	ntN3IPcIy2x0+ohcZFuhkshIqSWXq0usxqRkXIIv/2rkq7kNANsfRe2g2Nnh208nqEkYwScQl3T
	+vAX94tBnP29e2sRUQsKFjlRZ9KAA+8YITDExAkZHhLD9JDCHD4VxKPdH4JC1pLKYdjooD8II5i
	RsNFSeWggTwRxQFCiQl6b7FKEAmnp/mYmiVtKOJpxYVzn9belS3Mat9nyM+SuCQMLbMhVHvDzwb
	So6Gb1xffIOGjQyg68y+nmrBI8dmGpw0ML8TOq4JpUSbMO4tp1bKYYCInS6oDTBTFtoxBot9DGk
	q+ellb0/ESYkBxTU3cp1t2pMNjhPXydhT+0UJPL3A9OgG1Kpr6FbVDBQ+QzhDgM1eINfSleZiTK
	V7MPH9MYwF0P2zxwXgaFYqMeMZ0WbOipt/O6OOkp/gHSv8BCWq24b4F/KSvCGpdIgIBvmLzRDUt
	fYPu32ZuZGEnOAEDG+HLDrd5PS3IKaPfgvE1eCtlqEITuDspq+Nvntfv3OBOOrZ25PjXR2AEaSy
	VWWveOlMSmNwO8RHson81htKEsLPpgvNHgZKNlBTISl+BwEdXFluxO2lMjEt57K1WZmir5yKJZW
	wtqQWUC8cTFn3K6WHzHt1kidVwxF0s6RmRlk2saE/lLTO/w==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr20023312a91.32.1795742792547;
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:09 +0100
Message-ID: <20261127012612.1589039-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller that samples the two stick potentiometers and streams
the raw 8-bit readings on a UART. Describe it as a serial device with two
IIO channels, X and Y, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/iio/adc/miyoo,a30-stick.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
new file mode 100644
index 000000000000..6c0e997d4ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,a30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Miyoo A30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The Miyoo A30 handheld reads its analog stick through a microcontroller
+  that samples the stick potentiometers and streams the raw readings on a
+  UART at 9600 baud. It provides two channels, X (0) and Y (1).
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: miyoo,a30-stick
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        adc {
+            compatible = "miyoo,a30-stick";
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

