Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB533EF0AF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182598; cv=none; b=R9LMqR6TLDOIG1mWCFSQYGTefSGCE5VXWEGPah1Z1WJuSpbrCNHbVzQ4cm04b/TJ9k8OyMWvNGWk8k9qnYYlr8/EA9+ehGjAmXffGj81Z9Zzx7DL/N5fhM2RdqhcQuEcbbmBmISqHw9Yj2rRHxzx5anc4kgbmZGR2exsUIW7x/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182598; c=relaxed/simple;
	bh=Ays/AOR03eQ9fnsVDYNlf8e3KW+AqPJ8S6XZihMvT+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii3B0rxUAmTDQy6j36ZjaYzknxviIfrb1aNcMJBaMCQtROPP2b0mYBMyppRHVZeiErSuHkgGvGn48MmdLAg6GABce9JzRHujqYyK+88sWTIioYhMemMDBWUzS52x5o/WproBcuv3/ArkskQA/dZbcB7S/HMTciQQJKb50+UzGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiHBahwW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiHBahwW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so657599466b.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182596; x=1779787396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/acds5PobtVmDUQ4dCMZg0BCAmtwvenliLGdACo8DBc=;
        b=RiHBahwWY0MDJ4aTNs/BMihA/xEMDRzefOchXUGvw6ukYXKJ4ISGElHuTfOE7q7pvZ
         sgxQA4nTEugM64uHJNG/eJMBdSF9H8tVwhM4BRHNkT0WTj7vBjAjgASC2l+j1FAxHRdN
         k3QkxaeJ0LZclrxuroWi1PXkJaC5S15RGMoYCFtoG6Byx8QPONldLZzLwOuvh4zkS1Py
         NaJzVVXL5BtM9dQ0yv8wHuNVLyXNE4bvNvOhLRuUzuphOowhLgOxBtDp8GOM8gHyQ8jD
         DR7mdEO+ZlcuZWvkfFVKJpc5RQmNL12qksfeLDZaB6yHXWOstvYo6D9iWf/+BdS5u/0x
         UMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182596; x=1779787396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/acds5PobtVmDUQ4dCMZg0BCAmtwvenliLGdACo8DBc=;
        b=hAVB3dX9KyCyraw+HeU14sFL2RPZ/MFBxlIwSgB0YKZTEwy8Hm7xsrbMehVN9NrHSZ
         REboRBbMvqvfvEG/IWViZ375W4ljjosU/uMwyDVvancJ0Fo3Mosf2+LV15tmEw8DuSaB
         UJLJ+RAGNyr5tZKLHH3flMJJMW8ZKJKVPyq2GiywgqGyODPRfh5NpIcyH6tlVvp+COFh
         j66WFC87xdmx1a0k4A1S5k1TgJHVKPBYPsfH800GPJ59pd+UE/oMujfgsG2n+7QvLpKa
         QcrZFCIAjwMhXYnUenqFIcAH8gj4CM8yqcIDgGNeL6bEe29k4rbBHSY4Aoop1mJ4uxcE
         7MSg==
X-Forwarded-Encrypted: i=1; AFNElJ/J9Ec+Rov9Ojgh+Erh90h6DJNRfbP/4TdZSUFys7ndEgRsLMYuwfMZMVp+AuI9omymIjBPBJQeXoVH@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTtYeVVM9m6+reQNJgK6MR2ZKHdUnLmUXzD29UuLnDJRdebgT
	Ap04TqD9zjZOqIxt8z6HU6Rsl/Gjm7klOqERySqaqdwTSmS2XzCC+ufN
X-Gm-Gg: Acq92OF6w5qokLhNRp7SMBRPrU9+NEEQJY2vvfMA9P6Rq25VDhesIYzy3XziIUyoGu3
	K3lcdGkD8mmoAqK1uTm8OXkMWysL7zmgn2PYRKX7jKKJppyuhJViVyfsSXRDpIx9YEdsiFTwJDu
	aoQvDcwZmYReSuQVIwE7F/wqILJqZJ6Uh+r75tvqNydxPAKCxGjdgvFwmrBPaH8eZ1nwOnzCx09
	acd/Xly0tv/f/++5BA7ajwNPdDWRWUm0DEF8YJr0XrUgfONEIXK65yEK1i2+xsbAFAWZ50hTz7t
	k6moC7Fsadxp0X8h8XwvXdwmOrAegmwF1igG/Exy4B5jC2rkV90jSZcjf5geTY1tNHWSrOvzsyw
	4yB7f5dqiwV6GOt6r085ej7IPul0OxEBX5ktee7LmYFM0khCREbiIZEdJ+8ME5zYrUjNRlnRgpM
	vrF+bOwN4riPggMlCzgxEWBzY7PrZGJIGX+Ft1Nw==
X-Received: by 2002:a17:907:3d45:b0:bd5:27b7:adaf with SMTP id a640c23a62f3a-bd527b7af46mr818011166b.33.1779182595357;
        Tue, 19 May 2026 02:23:15 -0700 (PDT)
Received: from gmail.com ([212.75.105.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dea93dsm675169366b.38.2026.05.19.02.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:23:15 -0700 (PDT)
Date: Tue, 19 May 2026 11:23:13 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: iio: light: add Broadcom APDS9999
Message-ID: <12b145839a1a9c5381946a9e5237bfe6fe0ae9a7.1779181370.git.azpijr@gmail.com>
X-Mailer: git-send-email 2.54.0
References: <cover.1779181370.git.azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779181370.git.azpijr@gmail.com>

Add Device Tree binding for the Broadcom APDS9999 ambient light
and proximity sensor. A separate binding file is used rather
than merging with avago,apds9300.yaml because the APDS9999
has an additional vled-supply for the VCSEL.

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
index 000000000000..4d9e9aff8894
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
+  vled-supply:
+    description: VCSEL power supply
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
+            vled-supply = <&vled_reg>;
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

