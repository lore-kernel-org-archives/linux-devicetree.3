Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC2470EBE
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935745; cv=none; b=j4C4ERjhM9/gH2MLzV+VeE+PAxJkUIwptOlTKXILmo0w3/Nd0QxnOePtosbfbPYryFLzJsfmZi4C1xTi2M+0Sg1f9ZLSWSarbk1phel1dJjYiNiE0QC6Z2Nw9uRPjCUnQb5bsyfLjn5BT633VtSgrdehj/J6/OL1ieiK7j06lbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935745; c=relaxed/simple;
	bh=fbUKh1todKkP1FT2/cHCaDm4OfpjsPhk1f8mXru53ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMWH1rm7cO88JS1L9pIk410jG5hw1Dhu4T+2zP6fU5iApFwwerH1tNYi6eEnCpmCyrkM9VAOj+yCxQaZly8ZhPUWF2heYWpt5FDWEzYqugr95bc1YjHewA61pSBtyuzS6lC46Ct5zz13kYggekfqrmaYcGEyDXh97KhT2a0zJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ2V7wXN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ2V7wXN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so522814a12.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935742; x=1786540542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+l3n4KRaWC56rAxkOg4FR4j0cY6wBbchP2+x6Oxm4pc=;
        b=DJ2V7wXNib2XxPegFARJUtXRPsjIc1bSBiBWVxASJk0fsjCX+uQeEq4Oxlh08jYFVo
         rUSJQmymp9tEQiYsTeCDAoEf9f3rvm4IzNxJpid24Pn7IhbOAwLw7AAofgJkxiBGeMxD
         jwPcny2rsUL+GtiLrtgCAYd55zQfL3/uz7dJYXL0MrKLK0+OsyCX9/anHAx16hj58Q8i
         kCAfqKGPKVXBGOENz6gHcA7ZWxfzMRDJgn0OSt+XSDFBU3tOwvfMxALim5HRuxb6mqSJ
         swVPqZEOPVih/9JNvU2zfqRkCMFh6ykn3FGw3icjKTyCwzPrd2Cvux7114GteMyNbT3J
         0jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935742; x=1786540542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+l3n4KRaWC56rAxkOg4FR4j0cY6wBbchP2+x6Oxm4pc=;
        b=F7oM3PAU1HkaqOnDbpr9GDD0XZ2bHhbdWNamBtIHiSjg6LvdLYg8I8nwEiIlO68PY8
         o6JbZEEMg6CC1Ciz/msJKce2nSKAUqm851mkL6uhDNMsEJvJF2OUHhSkofNlT48eQ40R
         pnFhGn6EygZ4g9t4trzJBeQKS296i1cOul9skr8IPF7KXMmLMvj1KIUH7/wWEeIyM3Jn
         0zhzLydNODxnCLKBWGm8RN4ixaDDVJ8tOiml636V9AF/oJswTiAihumCdsPdT8Tb79T9
         pwNQyY4syE1XB9gh7mn+eeO/Mo04kqwAz9RtuZqADNIlbPWOR5fx9KyaRuoxVmheCfSt
         P4nA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ZSpN8DjH5oQTPLuWWl0GpFRzxaEV9qUlyR54UN6Gj4Hu/o2CLBEoAuhjZELyA3nQc2mruVAGqM+r@vger.kernel.org
X-Gm-Message-State: AOJu0YyxGOgB++x53lyhcRU+tURsjsmgl8gj6sgVRp07WdUit10rEEBh
	ux6mMd2ml7r0aRuExPsm9HcPTy58fRSZ2phzpPbe5jKr8sE/C3xwTAP1
X-Gm-Gg: AR+sD11nFhojD3kJPUrvRKlI10QxxSSGCQ4KQud5eYXY3nFE0VyXmHsbZ2sQHqIVTUK
	ly4j1CzpihNIe+vbXEoa7q4WaYtuOm/L9j8oTRevBCH7OA4l2Y1I8G+u/qVMpdCtAeducB7/obK
	5X+0SaX/18jzRoPFPpAFmr/jT5/hpun4twJorEx3INe8mQH42F4cre8HStRtuz2KQ8Z4cqe7Ch7
	bvkZiVfLW56BQtlaw7gxQRCpfHZovVB6DsYvAr7lJPNY3v6m5k1lByKegWLb+t1R/HjM3cJi/D5
	dOMLDuXuRE0Yeh+QaMnq43e4L3+myAQHIUILJxnmjYsPOL2320C/y1GHZLvOl7SB5L16JhOeeLe
	8dqvFez1WbjwYa4LEg9cdqraQ0ktrImDET+7Vai1SjG5cE0w01M3LWp0W9h7oL6E6iEA5jJJKtj
	O5Vj9a8rit4RbxYL6eDI//zVZobaZ+fYJYMSciFzHpjsazja3qpNnEFz0/2P1TU4CrF9crzISZh
	OWPfqeJPSI=
X-Received: by 2002:a05:6a20:734c:b0:3c3:91f5:82c2 with SMTP id adf61e73a8af0-3cb85e788b6mr7269693637.16.1785935741411;
        Wed, 05 Aug 2026 06:15:41 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:40 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:17 -0300
Subject: [hwmon-next PATCH v6 1/4] dt-bindings: hwmon: add adi,adt7470
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-1-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The Analog Devices ADT7470 is a multichannel temperature sensor and
PWM fan controller. It supports monitoring up to 10 external
temperature sensors and controlling up to 4 fans.

Add the device tree binding documentation for it. This includes
support for the thermal framework by defining the "#thermal-sensor-cells"
property, and models the fan control lines as PWM channels by
defining the "#pwm-cells" property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..a701542898ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADT7470 hwmon sensor
+
+maintainers:
+  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
+
+description:
+  Multi-channel temperature monitor and PWM fan controller.
+  It supports monitoring up to 10 external temperature sensors and
+  controlling up to 4 fans. The fan control lines are modeled
+  as standard PWM channels.
+
+properties:
+  compatible:
+    const: adi,adt7470
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      Valid index values are 0 to 9, corresponding to temp1 through temp10.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      required:
+        - "#thermal-sensor-cells"
+    then:
+      $ref: /schemas/thermal/thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@2f {
+            compatible = "adi,adt7470";
+            reg = <0x2f>;
+            #pwm-cells = <3>;
+            #thermal-sensor-cells = <1>;
+        };
+    };

-- 
2.55.0

