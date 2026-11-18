Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009593;
	b=b0DtkL0BzDTp/lDYtTw5hYRKK+r5q2i9IpUmmrX0A8Kyfh8Ic90yamwDgzJXym29zzed
	 /s6Hn+M6yvBcskANeYiDjirD2qocjZEJKB+NC3kxgsTmXDqtiKrTVXUGNDS9Ql3jjr5oJ
	 d5T9NauL/NT5rP4rtqh/h6C1rs699sLkZEEnZAWt6QNRH2VJ0q9QAClZUEjzg30Fpb0m8
	 aJCY3zWnOhdAn88Mm8yvXh+vsSoVSlPcliFcllOozzh0zCSNcXg7FrihVZQFNGNEqKkeK
	 9LEut0Ch0D81M5jlyK8ApA7cZpsWq7kaIVQUzLN1DeLZIlWL8u2xAMBiV5jatBhxASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
	b=K0la8qOSXSMskKo72knKxIEDAdJM7WTrq7Kp6w7Flc4yjHr6zzpmyIQD9bm67dWDx4rf
	 jaBkjkHYkfMt0v8WwuzxJD+5vuJdqOa8hUB+uDGpqdZUJ0RbuaVv9wVCcP19jgsLswFR3
	 ZGSGeXiajWemzdwxMckuADNkouq2MXILD7HXAUIKwC05AihsF/pdSSoTH44UcdRvOINhN
	 jMp3JfeF9fRc4l45BJK3QxSyJ9A59QTPD8T8qlbA9XDnss/zuTvHxEgZ63u/hk8zHAdkJ
	 /IuGcdvr44hVfXe3vr5KjyZcbZ2t/35xD6IPcK5J67loReh9fAgITE2m/hPqlFwDoAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CI3T//Am";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FED606A33B
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FED606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI3T//Am
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so139845966b.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009591; x=1795614391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
        b=CI3T//AmB4WgxqmDLK9GofxG/Bymhupg2aUet9eCacSlxYrNgnwA37/u0VMT3FY8qZ
         u+AWDjn3gxLMDWCmuFKzKVxFOhm2K53C1Uzz4XoQ3HsPzNdvX9do+DWmoQ/F4W49APX4
         CYrg01bmy/hHY448naEYetdYQ3lTB9PZxcwDofbxZnj6HXGI4uEL9H2PguSqPZjR5+Gp
         IJ4cpdvM85isaIERTBArshTyzXpGxN46ZPlFNUigJceRK6Wdm6N+QE6P10GQVZMeF83/
         ZKYjMKH39oQwKAJ99GhWgrQ+D2wuyQMQ9WafweZR0tM2yd3RPXVXW/yz5qLsAMiEgKm/
         89xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009591; x=1795614391;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxCBlWe9xidf5BljIoViI2yy2fuy4UwH/MuESKWLU9M=;
        b=OHjvZV9znsZeSD3g73iPjirldDMsdAnqOzNFKIrLmszG5MF+0uAADyE8M19uXATI+r
         c6mRylRsLGDwTeMEAwtugV16BYk3P73vSvLTeGZLdipsKrebB2RWeKz4vJfr7onU5cy5
         RJ92soW9CzqD5RllrDTPwt7GCjo21tYZzzCFurGt1jkxgJhVA1Gze0gMqlI6e4+JujWz
         wh0udu2Yvxax/0k7ghGX29AgQgABidBQ3wUb0BXaq3IqRxoKAJGiPMs/oV3OY7UAY4pw
         nds/wq2tJZrRUpBr5s0rfDPCmDCuvPHBMn0B64qyLzAicCR33D3JCShmLNWfv0zyjrx2
         cftw==
X-Forwarded-Encrypted: i=1; AL+hErHyRbaJc/rhp19025onId+2MJ360Mwk7CVHZB+mx3FLaKdJb6veCG9QOOiFvkZqQHbmYGRhvARiwVh5@vger.kernel.org
X-Gm-Message-State: APuU4Z98ijqgqt1qdvXUnvtAU4fD/YCPicoo+RzFr0b49TFL3XcTh7hj
	Zm73tAEurLQ038QqIaGgRWdcjvaaFEr8CPEj86IKtW2cWGci4Tfk4gaf
X-Gm-Gg: AYBFou2pUHOfVMNcIdklTjlkG0QHWsI08jl7TzGWuIVdrcEybmWweihRWFgwZY/0pfr
	rmktuaWp9M/wsnG8Kd9wBoYSag8v642VUREcFXs/Xok3h9hjGwo4lKS/HO8q6n02TTa03C2NS7B
	6hm6WmupXf1UWypdV2YOoblJ13/des4vf4DB3uoTdFzyhblP1cBTkpLgRjSlJ7ixrsFDpfyo3s6
	icahTgHKZNm6j1tjwBoYhR/Y+1fY5fjPtoBu2s+a3R/oEjdwS+dSBym4QA92S8o5t4t294oFYpu
	Z6GVqKtfY8XclPbWZH3ZTotZt63Mz3DmPQPks9P0vIlcovMAdxYIIRmBnfpAC7nmwK5qqlroG1H
	um4r3nvGfaU/ociJ/aDeIeCwMcIBfNFjJh0o3s6vbvbKy+Ce1wU5FABCVpBp/SKvzLQmohAMia9
	1SnfJDZRB+RhQzOJFfosssRHN598DAKDkMJNvHuAWO+7ptNviRZ8rRjO7ExvZSq4/FhHAOJ1d8Q
	3Ag1tEnqWvhSJotD4TJa8OxZYuMZNRFeM6Xyvs8qDsp7c8qZsWnp/yw223MPHyNy4+vSJmAzAQ2
	n/FSx0cglfssmadjiUh7aOCR2yO8h8n3YRK8LUMpBRFmjKame0UinjFvfvUh3opyWf/Kk2JScg2
	s+regOviYUg==
X-Received: by 2002:a17:907:3e0c:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c510df534a3mr224094366b.6.1795009590871;
        Wed, 18 Nov 2026 05:46:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm95461766b.52.2026.11.18.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:46:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: i2c: Document ASUS Transformer's Dock
Date: Wed, 18 Nov 2026 15:45:46 +0200
Message-ID: <20261118134555.195479-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118134555.195479-1-clamor95@gmail.com>
References: <20261118134555.195479-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document a hardware configuration that uses a GPIO signal to determine the
presence and state of devices on the bus, allowing the system to
dynamically configure a predetermined set of I2C devices as they are
plugged in or removed used in Tegra based ASUS Transformers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/i2c/asus,transformer-dock.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml

diff --git a/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
new file mode 100644
index 0000000000000..5f4a40539c2b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/asus,transformer-dock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Dock for Tegra based devices
+
+maintainers:
+  - Michał Mirosław <mirq-linux@rere.qmqm.pl>
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: An I2C bus extension found in the ASUS Transformers, where
+  certain devices are hot-pluggable, with their presence indicated by a
+  GPIO line. The set of potential hot-pluggable devices must be predefined
+  and fixed.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+properties:
+  compatible:
+    const: asus,transformer-dock
+
+  detect-gpios:
+    description:
+      A pin whose active state indicates that detachable devices are plugged in.
+    maxItems: 1
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the I2C bus that this multiplexer's master-side port is
+      connected to.
+
+required:
+  - compatible
+  - detect-gpios
+  - i2c-parent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c-dock {
+        compatible = "asus,transformer-dock";
+
+        detect-gpios = <&gpio 164 GPIO_ACTIVE_LOW>;
+        i2c-parent = <&gen2_i2c>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+...
-- 
2.53.0

