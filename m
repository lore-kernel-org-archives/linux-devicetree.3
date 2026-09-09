Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CB57C703
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966277; cv=pass; b=dQn6DLlYq/9iwb2gnY4B/7mW13vGls5dSa7YfyrcBXeu5tPclrRsyBlGCDTMmYYi1eJKlSuw5h/LA2fNHZQ8BCPEl3Yjmo9dcLwm65m4hbsPelcW4BeHinOGGvMfn4roAsO7iIyw0i2YTeZnQxayVrPy4ZSDUjRh2S+b4ZJKvdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966277; c=relaxed/simple;
	bh=U9knPo6p/2xLEVyt8CjUdjDIRZX4yEwqE/qKt1LDz20=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAtARqGyn+EUciCOfWRo+1g7y7789njEiwRNUHdjEGVOyt+OplSOjp4UVrxukitHh62BtuWlnZZNDZeXbP1M5QnmMZSpduZvaEPW/qrunQGdQ7oiJ8oyNLcxcKTYLt4Q945vVV470hgV1OaDKRfbJXiUI5VQ8xOTp1XNX/ii/qE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLPlQfnA; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLPlQfnA"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f64ea07036so5295683a34.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788966274; cv=none;
        d=google.com; s=arc-20260327;
        b=Le/oRr7pJ5THne3U7IbZFGeqCnQmSwupVM884lBEKFnHTVUiIA9HnJSZ37AiNIUdBD
         OpUBZIGHBu3pIk/9LG4kfpHDx2AajMd2mLVW/HDTauf0qynOaV2Cz4Z2Ypr0bVKiMa8K
         kMIkkMai8xQRcQtf0iU09fwufOZxu0ZmcTnpVcIqyEJN8hqwx4Dv8Hrad8SUpmL6n3E6
         8Ks/weJY7Awz2cwqSk2Guxl844q/baRHXQpMY0JYH5QHSUSJ1z1SwtRSYQhp/V98ObO0
         bbGS9Y8WAZK2jLsvCbBZvCIjGWcyAaoDp97qxHXrOectkgLGsGbmQGUpEoBK3usn/dNc
         5DmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=c49khVQxrcrrH9RLPrVBMjgMScn97uDmz2gB0YQQwyU=;
        fh=MUc6L48u3AnK8XOvdO/9W68xwVn0JnINz8azRDlgyUo=;
        b=CFM9VV5gK96WEMRKKtTBnRFLh4p0rZCCF8iFVEOvghb/aThBi58+7jCdiFwyDiHLZV
         PLg3XhQ8j1Sf9OvfuNNsrak9QskohDr6vbfnSjrbU4E5OWHfcR8SeSDVBY0LFqPyO/oe
         g88L6DmXCNgLcQk5xgG5Q+Fl7RhAzR8aUTjzmvovzMNzKptAGtAXCmwmLm5at0D6vzQA
         RGMMktHKK7Qq1TQpkjcNMqhyD/QhACQh6nJimNqVge8KU/eOLMbQzQxY1fa2q0GHWHyj
         7HvFIcrmd/fJD5KqyAaY8Cq1SdEyU+JluTCwGfHHkn/1YKtKjSNnFri/tfFvLrG1XILE
         sj4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966274; x=1789571074; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c49khVQxrcrrH9RLPrVBMjgMScn97uDmz2gB0YQQwyU=;
        b=ZLPlQfnAlt0lm9ztZf7OG7v/t4qbjajhcQK7x77emyaBtqaoS2qH5ltqhTOtv8FbX8
         f9W3DEJgytR2KYbTf9mH758VTJ8PkfN2Wy11z67h+UMrzOeMWsUSlsgBOKVcUXDucfWh
         HWbWikRBqKCGFwspjjujlBHkP2EZLNxQ25YZs/nBw2KwaiudPQ24Lbb3Pys1tYwJTv4w
         dbz6aYD9RcxQnmSKsao7sVPpftC+EisgmBqfiLdJS3UwT5qEpi3ga3gOUSy6I1dw/0zA
         celuHT8xE3BIfY8CEE2g7DrL9vUPpv6oBkD1TaIqfHl1Opdx8Gn8j1H3y8642lIbQMe9
         fFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966274; x=1789571074;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c49khVQxrcrrH9RLPrVBMjgMScn97uDmz2gB0YQQwyU=;
        b=UuP3o7GbYa6ycMmR2I9LZ5RVxUAqcJfi3G+Z9jeriAPSuApvosnGI+rxvkQ2qQxRb6
         wD7u0t7zpuGUNLbgvmmmCpDVdl1MbXLdigN1TEQrXBuIvMkUwD9wL9IIKOqWbccQSQ/K
         8SoUkrEJvYYyz4vJNV7tpIajTP54vesnho3jNlz8Wq2/eK8j4ch42vLsmjT4p0A8lZaT
         agYn84x4q+pBHWG/vZjE2ZUvLrXoed4KPSW4KU3pyq+cGcgR1k3QWVuUES4Iszqryady
         McTBMNqlxxVNGltxjr9UQbmFZ4dP2nCNBrPDVsTqXx8LRGTzocyJcfMO2uER4j5Ml++A
         iXcg==
X-Forwarded-Encrypted: i=1; AKwUvBxjrAUtPIc0DOdMxENxCJ0TJAWCXXlvBlt48Z/TgZvMjolNK1H9DMOpO3twE9oWRHxaaufWiLBKFbJY@vger.kernel.org
X-Gm-Message-State: AFuF++noyPAfhMsMyx+kBhR0b9qGM6iEh2rzuLOGnzNSqHqL0+gZeQcm
	rqdwv7PaEJtXH6FoTt8IaBhSopo3/rh1WKpy+x0/ZAAMsLc6eMy5rfEipIRIM7bXA01KpAf1o/a
	0HPrXD7JNvMSWp63uwX9wjd2PqoxfY50=
X-Gm-Gg: AYBFou25NWCyOxG4CRaeYvOvB3Uk+9GUG1C34HZx3kq8e+7BOmkFmrn14iUVksJh/24
	xjNUbXDuaADsF12nMOU5nFnX91iK28aQqEUnDa4rkGLo0L0syWONZZIIcph7Q6R/JCLPYsIQqf9
	vhd150cD1vqbJlK6+4wpY/a0bfaenRUX+gGB5PglCufVFcih71/yH2d8210bcvGb+1uXO8JQ8Lz
	pGGwtIBVqUkL8IsGLjJKl/hl8e5EVM3NyqMM0AnF2utFWOmbVCCmI1AziFEfHkJPYsLTs+WI7F8
	ANvprGD/FxjyjdmyyArq1HHgrQnrNi7bx9VymWpsQS9EbSxCPE8LVtvr+iD7S6PB/qnwSguhJYB
	C6BYbvVU+xzNwg1WTE7DNbpopi4dsbyH8b8N2Rg==
X-Received: by 2002:a05:6820:4ccb:b0:6be:31b7:e684 with SMTP id
 006d021491bc7-6be31b7f404mr2736324eaf.34.1788966274062; Wed, 09 Sep 2026
 08:04:34 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:04:30 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:04:30 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jinseob Kim <kimjinseob88@gmail.com>
In-Reply-To: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
References: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:04:30 -0700
X-Gm-Features: AcwNN1XYs9GTk3zlIcbnA3lnOyqdq9oaXAcxw599RIPrGm1qpMGnH9zSuQWNF6Y
Message-ID: <CALMSew+q5W1LWn5suOt+uADfoWwoJJvT36Wv34E=Xbmoix+eKw@mail.gmail.com>
Subject: [PATCH v9 1/5] dt-bindings: iio: add Open Sensor Fusion device
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, joshua.crofts1@gmail.com, 
	u.kleine-koenig@baylibre.com, julianbraha@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a binding for the generic Open Sensor Fusion host interface.

Open Sensor Fusion devices report capabilities and samples over an OSF
protocol stream. Sensor channels are discovered at runtime from
capability reports instead of being described individually in Device
Tree.

The protocol version is discovered at runtime from the OSF frame header.
OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
so neither is used as the Linux compatible string.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000000..3998390828cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Sensor Fusion Sensor Aggregation Hub
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description: |
+  This binding documents the generic Open Sensor Fusion host interface. Open
+  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF protocol
+  data stream over its host interface and reports capabilities and samples for
+  multiple sensor classes. The actual sensor channels are discovered at runtime
+  from OSF capability reports instead of describing them in Device Tree. The
+  protocol version is discovered at runtime.
+
+  Public project documentation is available at:
+
+    https://github.com/opensensorfusion
+
+  OSF0, protocol_major, and protocol_minor are wire-protocol details
+  exchanged in OSF frames.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf
+
+  vcc-supply:
+    description:
+      Regulator supplying power to the Open Sensor Fusion device.
+
+required:
+  - compatible
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf";
+            vcc-supply = <&vcc_sensor>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..0ec4e481c64b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1267,6 +1267,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index e033f2d564d6..ff09899bd645 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20511,6 +20511,12 @@ F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/

+OPEN SENSOR FUSION
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+K:	opensensorfusion
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0
