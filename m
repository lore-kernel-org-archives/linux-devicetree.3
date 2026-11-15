Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794722460;
	b=bMVu9PfUDZ2lOgNE5+d2rfsI1chyQmJooRXndUwOsLN4YTbpUN/HBNqmRSxJveJcmxbH
	 Lx7WCvHlyN/K8f6qiJpI4U152zlaDRnq4IxHGu0PBBxtZgOj/2aXLhNLFfpm1LOawHQYc
	 7V4gWgVtTieEFXVHF2WT5/mBGvWJ7P7Xygqn/h5bekVCXun/3ZXfTsdfi9kA91e/igYJ6
	 odzMt1P/KmeVjwzcCiFhJAs1eNNpFWDh5m9zA16nzxR/Hev4Xdj0jR5f5473Sh1KZ71Pn
	 3vF94v4orGNkukYz/TOz6ctU4PnRtj+V8IGfh9s0jKM4mK5i9XvuqIZd0sg9DSn6+Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
	b=ui3HHnJ0s9YM2PYsNK5zF66brU29FfqNWvdh3tNGTdI0T0qMPa+34N2TfrC9Wc96oIuu
	 DRAuNjPdxfCCV5x2ifExnizOWm1QBn8YtwiMG8J4tOh+hk+ucgxfNFEoXMzIAsqmr9dwy
	 7weYoyg5STDKwbUm9iMGjehBU7NtplnHhucY0o/z6Evivoypi4pesbeve8Wpps0c48v37
	 v/Id8ajPxb3eL37q1omYW+OOVtco/awsuzw2uFHRqDD52Q4tcrhtfOI0AGgAVt5rtOpNW
	 W/KCBYYNQsWDksgqe+OakwcgNiIq/wR+ZQ4ct6ZmxyCDTdueNAjZibegzv19ZhYXdtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AySxjepw;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28300606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28300606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AySxjepw
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1687545a91.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794722459; x=1795327259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
        b=AySxjepwHPZGrkDowx8EnSp0zug319xmkETWuYn3bTpq+EJxJPH8yQzwb5pM3ylK9B
         gYXAjXO2Ext1+uLYbWbvqjgmPkZU5jdcaycLY5YywGhRiUPhxmtgyQ4BLBYT9tbSoUWI
         tJGYwNglgEhpmpzLLVsVz4e97SGWd29m5t+Qomh3OmnE+IPeOkAz0gTAqX6K2x1+7QJS
         3yiymLWvy/Ntm4Wy+NL8A0fYUvwI3iGucJuHSqHnYHnKgRVp6nhsYJszB73g5Ibpnx7j
         pw4AakxfKv0N4lqIslG4XHtKThmecL1u4zYQVryifJbNWYtUa5QmHWoBMDOyLCUxadIL
         Z2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722459; x=1795327259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
        b=0ve8CRFoGnvhaU+4MjSgoVRsaf3vFykketgOI5WqXMP0gBatZu9s+psaqLbN3cIgMo
         DgWcYEVxtg5GOiIEPA7U9uFPM8a4aI/JbVqwudi2xzuqR9Y6Smgm0Ix2ZK3XESik+bI1
         DFSDJ9ToOo21KOMLel5V0dfNo4gH3p/k2hkaTmtWiK4R9E48a96GosZWb7XnU+JVHo2Z
         mjK0V1vELxUeT7+p+qaLQIYMyy1tWvQlz3Bk+ZhhRjUFf0iF2WVUlFN8VNJSLWCIF15m
         gZ4EX5WbB/2yXFsaYFcva6z5AGGL4hBaPhD5Q3i2WClzAvl7RYi3O50d7Be5AOaOJam1
         eNeg==
X-Forwarded-Encrypted: i=1; AL+hErG0DEcxRQ3e8cuf9Wk3pu31U/kJW1B1hdNFYxro42ir+fQCitFp16wNNT4ZQQYDMySY/QX2YNrtIk0m@vger.kernel.org
X-Gm-Message-State: APuU4Z8U/smBDB9IqyNWXwqTc0Uo/ZJZ1lAGf3T5iLa+5/OwclZTx78y
	iMXBxu0Jpwzp2CNpRtxc5ApzMuuybMtADfGoP56O2XTPJNOVzeWw8WDL
X-Gm-Gg: AYBFou36K6P/XXvJuVS33FRwM8kcNcUxH+Lf7y8PNqvreJ7eltjT/iZp105vHnVVZ3l
	R0znr58t0xGgtQ7ic9VP1XUGPLucKRcU8TSFYFZMeawZ+laQVLaQbA9rbGKe8zU4DstPKgAU5fh
	4dH5Ag5ppglajwCkEYSrO1IAAze2hVG7fC2W3vr/TyzUjqucDaYyYd5giRbjl6pnMDBSoDOEo8g
	/AFMNlZX+Fu62x+6RzLwq0ql4vcXKnBQTolWUjnvzW7rG4Z/ps7tD/TJj8tJXIo6YtZtYFVe/hO
	dxigqhpC2Ug2fQ//y9D5aRAOG90qGxYBlkdchqkS+zAw5O1E7PNyUby+KQI8d1F2sWTil0fUIC5
	DaQND4MPMt/DafE+8D7Yt+3h2GExxLm1ICBKLcNgk15g8bxHrgLuZkpsPoEvOKBuawKhME8n2Xm
	tOLdWyLARmAe9C9XerAc/aK37v1gzyIRRnX6GYEa+D0peKwzTylpBBMO40WjxajQ8iPXm/sWUQT
	jIIfPFFJsMwSQkkS5SkVBMq3kUMDbbFnjG3s54LN85crfR00HQmxoqLBLfzfBiK1rBIvFWLlK7t
	F6xtIo1UMGKZR788YlhKjxL42OI3NI04rD1asYOh4alo3qVCVLkNRjDZ90K3bpI6YluNfLhNkbs
	HnV/s/BfhSZ2yPRKWLeTdZw==
X-Received: by 2002:a17:90b:4483:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b1b0a4c331mr6596624a91.37.1794722459394;
        Sat, 14 Nov 2026 22:00:59 -0800 (PST)
Received: from not-op-Victus-by-HP-Gaming-Laptop-15-fb3xxx ([2001:4490:48e1:a6d:b698:9913:39f1:6954])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm10988889a91.10.2026.11.14.22.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:00:58 -0800 (PST)
From: Akshat Chandra <notmissinge@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	andy@kernel.org,
	Lukasz Kulga <lukasz.kulga@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: chemical: Add Sensirion SGP41 binding
Date: Sun, 15 Nov 2026 11:29:39 +0530
Message-ID: <20261115055941.362185-2-notmissinge@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115055941.362185-1-notmissinge@gmail.com>
References: <20261115055941.362185-1-notmissinge@gmail.com>
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

Add a Device Tree binding for the Sensirion SGP41 VOC and NOx gas
sensor, including its VDD supply.

Signed-off-by: Akshat Chandra <notmissinge@gmail.com>
---
 .../iio/chemical/sensirion,sgp41.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml
new file mode 100644
index 000000000000..28528a695cf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/sensirion,sgp41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SGP41 VOC and NOx gas sensor
+
+maintainers:
+  - Akshat Chandra <notmissinge@gmail.com>
+
+description: |
+  Sensirion SGP41 indoor air quality sensor measuring raw VOC and NOx
+  signals over I2C.
+
+properties:
+  compatible:
+    const: sensirion,sgp41
+
+  reg:
+    const: 0x59
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      gas-sensor@59 {
+        compatible = "sensirion,sgp41";
+        reg = <0x59>;
+        vdd-supply = <&vdd>;
+      };
+    };
+...
-- 
2.53.0

