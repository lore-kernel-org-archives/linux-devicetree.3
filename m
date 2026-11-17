Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944342;
	b=fTByXtBW/zKdDXvlbQ2lNV+ulPinE4sGvGBtc6iZg48ekI7Z8iv2Wybr6M5Zt6B9bg0Q
	 aQPRSLEC6cW8mLdZkg++T3Z1XnMdnVlQFizansrdKBSS7drxM5fF93sqEauxlePu0nZeM
	 nS0VwSDI+QXPCUlpPn2DCzAVTk4qcQhyMaRivaxfmv6qvOBk8kAmFGW9rH8JjEbv4SWtH
	 SZHzbprvItVyU15pw+TMc4TltDfVWsF8K1laGedIkmnHw2xpA+xZ9lI/4zOdaOUK5e+qA
	 UTqOSbTK7su+eeYZK3I0GM3R6AK1U/SSahLCjdpFewv7/w3eTXpfFOkriM3KyYxHS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=j0GR26f/+5Za7J2xM0ZLDLWorExLLma7hyii3Ci4HVToDTwfLuyE0e3+ygmbv/0coVct
	 0IdMLIa2l75Xam7RIyzlEGV1rnzoK2ZhZoTkIPmiPJtpm87V9pYFgAf9ehlR+kbkhu/aW
	 vFqyBRCHc1v/zA1DRjb/YDG97KmcQPofUS3ZgDmvGCHzyW8xJwSk7g7ghtdriPBFHlrKF
	 45T11m8282gcdk7WOP/0x6QxGJqQCjCFnJrnYyddnATUhz7dzH5M16UDkVCjXApMc7SMf
	 VaMCT0RX5n9VzQ7qdvdonnbLdbzWLq50nbPzw3QESk5kvY0DQqbhx1EoPinT4hvUFFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835D606A8B5
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D835D606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10701755e9.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944340; x=1795549140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=hz2r2AlaEEMk6elF5K4RjTgSi0OthE+5VYoTEKoWW5La63Cfp6JA+0mePiiVroEdvz
         9w319qm8hnJQkrEHrH3PViesYyv/J2zy+d41MkduU/TKOxRMR2Bj7TDT/Vh5a/x38QZK
         4hFdljsWK0QgYbZFM1L3oq5p3ZlHsii1w4vHA0+KeJ03Emt9JktFKdx5bOsTBUOAgQ4+
         E0DJlAiL6ysSHOo7CnGbvmrTK7eqeNr5A4A2t9Dbt3DY2MqkWWPVtxXwlLDxTAN6DX50
         xiPaVn/Hmv0IwqSToKW9HZoI5WUfWaIwzUXEmdI8w6QUHJHJz5WLffYBlU9vAtVV+aBW
         409g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944340; x=1795549140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=jGuRhSJ7bNIS/FGJp6tmrbIfZpr+KiBgigMpJrF0Z6CIVIdvH3mmLegqyWgVJJmbAV
         eEjBUeiMnPwhKIxei2LOkzxUskXali7/oHV4B6bGg0/dRvfdQ118IyQI7Hbn4Qa6Pwwi
         qJZXsvvXOx+S++W1Fb0bilhb+mmXtjIU+yqYDlqzr4rXZjgJ7PJXEjEC2V9g+iGvunAI
         SFbZ5it4PKhZRUtZXcOvMrb+FMfZkmiF7iAs0fX7r1MfTQ2akJPgDTEfdtXjaqgiFkYS
         Dx4kvLXW23Kcksf1z1JtWC0SbyZwP+c2ZDoPo0yiuC/L3LCN0qSrwMOVXLcNdxF6ipvz
         qnUw==
X-Forwarded-Encrypted: i=1; AL+hErFOZwfF/HTbQ3TqCuMrBcg8yJgNctrRTn8G0opGFwYrdbiDSe81xi75lbKeXSirWmdyFwIkoouIDqzc@vger.kernel.org
X-Gm-Message-State: APuU4Z9vQ0fQh7dHgfQR5CrtNtj5wKUemHyUQiunz3QKOpbplC/YNtyr
	JihCUbGesvl0tvuq06JzvyJiXUC6v1KKY6CCdpoPkmIn2FNaX+oVRLRC
X-Gm-Gg: AYBFou3T9gWAF5qmPRua1iuz3WkW9J+SsmalrkxuWgBLD7qzzbI0H6kgDwL8x3l5Rpc
	UA7oInnS2JLqEaq0/WaQErW51PYLkZn03F43Y5RWn57N8slvvO4TO0pjiiABb0YkeL2DhHIS/cK
	ouKtw6y3bUWq6q7fHmBsNN9sqCfOJSuRNOXs9ORBVZLArd80GdrLkuYo2c8+VM2zUQTlgqnfvFn
	7sX9tKZrWX6t2w7CbVCvy5RoXaLzKfQgjAeMWCANagIYsqGy1pKVZiI4yQWnKiqKKEUVwDkG1Fs
	uLeH3gxaSow5qrNw5OwqxbzIPhFVwm19NdOBJ3ytdu6HMmVeKoASfgjnGJ95gSx3+O3BUKVEEoU
	Es7p/Js+SD/9L3bZmtO+F/E0gP53I81R/hLi29357HllRW0o0vwEJqxWwzqQnu2YvziYvNfYwDw
	j43rW4bvVU+sObnbtFjUVi0z/oR/pM1KeoaUNCtAo2Bb+Oe/TIpN7rXlKsow7xnkCTWDAG1fLaA
	mtT8bXT6NqNBpW4ydOfFAi5idC391E3XyXBcqSOGB63Y/9dS9ky8/hThU2V3B+Og352catQSva5
	INNnOf1mhApKvVnRE+z2W3+Tu4vnUNEb3mZ7LpTsk1rRFFt00FM0HRdMApYOiDmOn4WTjJakZyq
	6ou487M8ou8JRz7EWuYqk4wVPWuM60ZYQ6A==
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr3966105e9.9.1794944340157;
        Tue, 17 Nov 2026 11:39:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 17 Nov 2026 20:38:47 +0100
Message-ID: <20261117193851.235272-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117193851.235272-1-ansuelsmth@gmail.com>
References: <20261117193851.235272-1-ansuelsmth@gmail.com>
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

