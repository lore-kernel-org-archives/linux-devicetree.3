Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41D3CB918
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782122; cv=none; b=k1LeWmDezAZEGmjpHBRFa+nkLbC0CsfQh9+lge9kuHAFQGOOvLMfpNqtebbS170l12XEZJUA75lrJC7K6XbNHWT2Q9qiElGICBS4RPFvj3ImwgOcPPwj3JuSZ/uuvvhA0vSw+C4SEOCd0PEHcP5fEtPDWQrqNjz1a1qjcU2A+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782122; c=relaxed/simple;
	bh=QV0YlTAU2lskKT3uhQB3b6jvRCJQlkRZdCcoZ9mgN0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ddlz4yLpM+kf/AeGKY1UAAGYlLV7UMP1lDPbxEYkfiUDMpO0ywbEeVrZA37GBDVxy+nGpv8THtvKfv3NoRkUlpE9kTRDHFuYX2UzmW2GKvBpqxdQh9KSLeXPe0KKqUXZ7VMtn2ZJUsuZkeuWNzIA/terDyoZKsoW7k1wXsBCc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLjgnKbq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLjgnKbq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso26442185e9.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779782118; x=1780386918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D2aPyhO7hzXrLKywYqgkmZvTv+qfhylQJCaKMaJ/KcY=;
        b=oLjgnKbqHoIDzwJuvDMLsvrPbxh7ye7T/thlzz16Fo0kWvuJHtNVIjmrhd3+rGp7o+
         pCHZGXHOp3agQwNRsQToht9z85J486FS80MgkacalJBgyQK328vtDtsTVhYE0gQs6z7w
         ZxtL7LebjTrQZ5uSYWEQoTwzX6Vq7V2C86sfFORfIfaynYKIW8yP5JImPWbf7A4f+vPB
         QJH3lhlRRj9IqCzSc7OwZTsto7s7u+GNOmmyaJWWKs6nRUd3YqAsG8ES6zjI+Uu3MdJP
         Ieriy4SBpc9JdFLl5n+n9+HMTvS/3IscBqX7pGOroMeVJArHuFw1lSeJgFMKiYREAlNl
         V59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782118; x=1780386918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2aPyhO7hzXrLKywYqgkmZvTv+qfhylQJCaKMaJ/KcY=;
        b=k5PHAl/U6KxK0hvIVeqF334cl5W8hyHJQVbmz6ekx504OFW61PGxXJN/Y6E65oMJJq
         78U8AEBHGp61NlNqE3JtsKNspwpgrCynHTVLfHRyFrV9DxR/FeZD6qxngUxjBS+aSnIH
         +ulep9FvG1VCZ90egQypXTcbjhWs5ZDhKv9/HSDXRxaJ7kqKSW5rm3qRDasYpbzGhyQs
         WlLcOecpi3vYj/3F2R5cNiefHGp79mFZmSpUl0p2X2ojQkEhjzeaBXvNRDvrmM7gsuQa
         HfyP5CKmUEKCOw+UAsPII/RAp8VuMwJq6KS6kHRMNTvHPSI0BYm5pmiC651AiFJVj2/F
         vUKA==
X-Forwarded-Encrypted: i=1; AFNElJ9zR0xpnYjruvvnoIlpZFNdd01iQ88ch2wZK/CWWbvCjYbOyHJBKX0bBN9y2nZ0B4wQXBw1k3N8hVrm@vger.kernel.org
X-Gm-Message-State: AOJu0YxGusYV32dpAo9Ec9EB7lJ3O+jPV+83BZmqbDFgW9Bn/tS3u0I/
	58YkbT4pDAwH878r/noHXgK/x2rG4zy021rZe4WZ+Iv+PzNTsesTd/wPo2Eq7mzC
X-Gm-Gg: Acq92OGWc+4BQThQrqLI9TQ0urxN+Icnwt/3MOyWj44Dc+CSM/OnM/1UtyJTgljPj9q
	YLG7bVyX6emKUQdUZGCgum9mDKJragnzrDwWvGbE+iLvzl7xFZFMpyxidLeoLf3cs9dTHtRp5qR
	S9j5wBxTvQbIxpBaw7cyobulgCOEmBT4gc4hfwvlYrlS6S2GQjq23da/iRFp2+0o7fPtkv6DtsO
	Ui16oq9+R0ftzL17pho1GJ4enafeb6vr8PPKiQM9eqFn/Dwi/PKcG8upS4qLH0Q3TJDm4lpZj8/
	1kr1FcmlYN4pW/Ra1T0uX4F/EdJbF7fOpfGiektKPeaHXsENHoLhVCfnTO8/HCYGyD9a697c6ua
	ek3rMFtk1SLgqs/sv1LFArhFcz5FpdAbWHGwZo9MeQIh7eA1iYjXWWN3GJCbvLkKNBV00eW/GVd
	36+qeLrmli3zeNpf8kj2FuU1o177E=
X-Received: by 2002:a05:600c:4f82:b0:490:48e2:5618 with SMTP id 5b1f17b1804b1-49048e257admr254826205e9.22.1779782117880;
        Tue, 26 May 2026 00:55:17 -0700 (PDT)
Received: from gmail.com ([79.116.203.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm32916475f8f.18.2026.05.26.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:55:17 -0700 (PDT)
Date: Tue, 26 May 2026 09:55:15 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: iio: light: add Broadcom APDS9999
Message-ID: <2da5163825ceb794c73c9aebb5cadf6ab3728097.1779781224.git.azpijr@gmail.com>
X-Mailer: git-send-email 2.54.0
References: <cover.1779781224.git.azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779781224.git.azpijr@gmail.com>

Add Device Tree binding for the Broadcom APDS9999 ambient light
and proximity sensor. A separate binding file is used rather
than merging with avago,apds9300.yaml because the APDS9999
has an additional vcsel-supply for the VCSEL.

The APDS9999 features individual R, G, B, and IR channels with
a green channel that uses optical coating to approximate the
human eye spectral response for ALS/lux measurements. Calibrated
RGB color sensing is not yet implemented in the driver.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 .../bindings/iio/light/brcm,apds9999.yaml     | 54 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml b/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
new file mode 100644
index 000000000000..9f5b3b294c2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/brcm,apds9999.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: Broadcom APDS-9999 Digital Proximity and RGB Sensor
+
+maintainers:
+  - Jose A. Perez de Azpillaga <azpijr@gmail.com>
+
+description: |
+  Broadcom APDS-9999 is a digital proximity and RGB sensor with
+  ambient light sensing (ALS) capability. The device uses individual
+  R, G, B, and IR channels plus a Vertical Cavity Surface Emitting
+  Laser (VCSEL) for proximity detection.
+
+  Datasheet: https://docs.broadcom.com/docs/APDS-9999-DS
+
+properties:
+  compatible:
+    enum:
+      - brcm,apds9999
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vcsel-supply:
+    description: VCSEL power supply (VVCSEL pin)
+
+  interrupts:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        light-sensor@52 {
+            compatible = "brcm,apds9999";
+            reg = <0x52>;
+            vdd-supply = <&vdd_reg>;
+            vcsel-supply = <&vcsel_reg>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1aa9c989973f..2d8d4e2eab6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5000,6 +5000,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml
 F:	drivers/iio/light/apds9160.c

+BROADCOM APDS9999 AMBIENT LIGHT SENSOR DRIVER
+M:	Jose A. Perez de Azpillaga <azpijr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/brcm,apds9999.yaml
+
 BROADCOM ASP 2.0 ETHERNET DRIVER
 M:	Justin Chen <justin.chen@broadcom.com>
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
