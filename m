Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0941E6A9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389713; cv=none; b=m9lX5jhjgiYS3ekE2+smmejbymsXdKw047DQwPCX4Dv4BLAx2rm/vtYqhvKuLlIXHrKlr0mk1pCBBNpqQP4GII8dbeyRI6pC/9xkaOtu/h3cUTL+eRdPX4AJYYW9e1JDiDTaY1rm6S/6ZMde+NmPwy4jwGZ/coSmh3F/YXAXgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389713; c=relaxed/simple;
	bh=uexxpyY32n0KDJ6TFBGqjZAlB3EeE5v+ilAqXIhOHwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmS/BrCl7eI19guqGokduR23oKdnIOmgVP7N0ombrx1hmhwGThr4CGTHaBnEHCzr+SOW2n9t5aJmVsJYbC8Y9tkhg7j9wVTOWhRmlNeWD0gavFK1e7pnjqlL8mBzB6Gz+slRSVqCN2KcfRaD63FIvrWKuhVjWtDZq/fDp2xe2Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctvgjmmc; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctvgjmmc"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664ce3000e6so1710762d50.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389711; x=1786994511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N7xrd0aGyVwzggneWt5AqqDVcxSb93c/y3jTFurvbk=;
        b=Ctvgjmmcv3dNHutGk/juVowBBl5OdkRatntveyqEDpuZPML+u5XU3FWJKPQtMeGEF6
         llmZV8/pQ8tpDUH37hR3p3VFXrKGP6x358zSGaQTlG5WMpDl9DW1dLJeBMTn7rPGSK2T
         ZNgZ610elEpXG3xHR0QwOOFs5NRv3ftU8ZGK4SjPc84U0MJcLMNWcsrYe4pP0AlCtexp
         p0pFX5EhQqh0eluarWxRIjzrDtiBJiNeAkuN8331yOsEEV2TYbAmg460X8noaWEok+9Z
         1QqNXb9XFkYxOjKXbOvbZMUwCDL67GrtJPp8DE8ABO2FO8hbgRaNHLROQLqslwwsH05Y
         MQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389711; x=1786994511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N7xrd0aGyVwzggneWt5AqqDVcxSb93c/y3jTFurvbk=;
        b=Uj+JCr41WtzMa/GiDktZTPzqtPqytUCqRz7IgAdFC6sA9BNObDLQnTQzQdVGFepI75
         XROnus0KJXcsoxeJmQDpDzhdr+s2gGL/rtDFRVc3nPxDViRi/0+Dhun5B2YAF9UXMmUZ
         sYY9qTn7aaY3ztsPK9hKwQCvVlc2J4ApSlXHyPCkoUOEYEeDJM7Oe59i09a0Qm4jnkM+
         X0dpOCX0VJ/QCXu7ZbYLp6AtUm1T+WyvRToORMrPQHJosKZWV2vJvmrK2L5hA59Xsm5a
         Xj/YfLF7j0XXygupRRrxdOu7WAIAURSr1w5UxntKxviG1SSmwWMj8wYQsHUswTK94vWk
         Bt3g==
X-Forwarded-Encrypted: i=1; AHgh+RoIYkMyXKYF9NJ0QHnudOvwCoEZ0vnygM/o/Rg5XGBfpQPVM+9qg7v9ZSUvIrfOMiqwLgPxv8uluDeW@vger.kernel.org
X-Gm-Message-State: AOJu0YxUi+eCxswgzUG1WxTwdOBN/iaVPrO3phKmH72raGNiBDGGGiI3
	7oOHfkRX3girAU2w8eifnraXi92BBZNOvy3oFrphpG3tt3nchb7KjiCa
X-Gm-Gg: AR+sD13i7z+aIuX1tHka5Tlm78kdi/ew+lymkpVk2dotFlYQ007PJmkQu/lIEQxla4+
	SU4+t9KiJHLyyE4Opo+Wg3HhZaQncUg4KK/y8v0LlRvgDhYdVaGPylAiVGaoD7QQHrZ08FJawkC
	+JkzrdxGZE2ryiC9hI6+fOxXTBKPeDwmRH81vx8zRMUrN+8EgWOOSM8AxC/Ar2B8LHLAN7sfNyY
	5guNrE613IqA+Cjt8O5r4n642DEoWnN4SE0Tn1OvyGr2dGhYOowX3NNH0Of3n+lJzRPLz+6Ix7p
	2Xvd+Wkj2iEW07qK/Av4E/OYmVYqBPfxPfUwsZdfZTpBLKks3RtSNvzf0EpQA+/mK/Ic5zFbNcL
	rofeHnwJpzw/xxc1njHWxKeuKFUvlpptCY/PY8/R0B4iLPXXHD3aH61FDPC9SREy0TZIzmHdjns
	fU00EwMuhsMcbsb/MgBu0E7plyYMUwAEbP3//H4Xul15RgL8lC9DY3/lugzqYc2m3UJHB1CB2RX
	P1aWXqIacBN+IfRcekyCya8w3enD8IKO2EAwI6NQw0=
X-Received: by 2002:a05:690e:441b:b0:668:8b3c:77e6 with SMTP id 956f58d0204a3-66acd2f1fcemr10753609d50.26.1786389710698;
        Mon, 10 Aug 2026 12:21:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:5c54:b9f5:beef:8bf4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafa90basm6928863d50.16.2026.08.10.12.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:21:49 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback compatible
Date: Mon, 10 Aug 2026 16:18:41 -0300
Message-ID: <20260810192131.153495-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PulsedLight was acquired by Garmin, who now sells the LIDAR-Lite v3.
It is pin-compatible with the v2, and the driver already matches it
directly: commit b257c1a45e99 ("iio: pulsedlight-lidar-lite-v2: add
lidar-lite-v3 property") added a "grmn,lidar-lite-v3" of_device_id
entry, so no driver changes are needed here.

Document it with "pulsedlight,lidar-lite-v2" as a fallback compatible.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../proximity/pulsedlight,lidar-lite-v2.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
index e19c8d166b81..baae9bf20a30 100644
--- a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Pulsedlight LIDAR-Lite v2 range-finding sensor
+title: Pulsedlight/Garmin LIDAR-Lite range-finding sensors
 
 maintainers:
   - Matt Ranostay <mranostay@gmail.com>
 
 description: |
-  This binding covers the I2C interface of the Pulsedlight LIDAR-Lite v2
-  laser rangefinder.
+  This binding covers the I2C interface of the Pulsedlight/Garmin
+  LIDAR-Lite v2 and v3 laser rangefinders.
 
   Besides I2C, the mode control pin can also trigger acquisitions and
   report the measured distance through a PWM signal, without using I2C
@@ -20,12 +20,18 @@ description: |
   remains the active interface, as a plain status output signalling
   when an acquisition has completed.
 
-  Datasheet:
+  Datasheets:
+    https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf
     https://github.com/PulsedLight3D/LIDAR-Lite-Documentation/blob/master/Docs/LIDAR-Lite-v2-Docs.pdf
 
 properties:
   compatible:
-    const: pulsedlight,lidar-lite-v2
+    oneOf:
+      - items:
+          - enum:
+              - grmn,lidar-lite-v3
+          - const: pulsedlight,lidar-lite-v2
+      - const: pulsedlight,lidar-lite-v2
 
   reg:
     maxItems: 1
@@ -56,7 +62,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         lidar@62 {
-            compatible = "pulsedlight,lidar-lite-v2";
+            compatible = "grmn,lidar-lite-v3", "pulsedlight,lidar-lite-v2";
             reg = <0x62>;
             vdd-supply = <&vdd_5v0>;
         };
-- 
2.48.1

