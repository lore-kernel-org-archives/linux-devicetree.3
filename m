Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814820;
	b=QFhtNGBscsnXCk0IDjmAZMFY90AC1yez+7shvttcUUNweQRvEGF/XtURwdTOK6+qBnPg
	 m0ETvb4xUJjEWPlBw9h+6X6DUJ8oQ82cLp+lEHcxOu3mi81z5BsAktlfLk50uqN26x+qx
	 d8bQp2NaDsneAFXAlaVxcneyM1zhQVQ8L7TVI7ox39GHm4DQ9kOKq7p3L8uNFJ9X+9vcH
	 rPXwVb7kNtxijFr1tBIuYMs+Il8dFHuXFUR8Rn6V7nVk7XqULBCmmbDYFQgLQJrEG8EEI
	 chPCkmL80Cyh0gF0tXSwqAqu4tiDxcgqg10HMrQUfrCAHEx/bQ8p+8cfFaZC6tYg9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
	b=VEclyBmYg2Y7KCvUHgLzL+TqG7odIbFfKB5L+vhEsLIW4X6jr5aThhqd4N4OQGS4AH40
	 AfBgXt7Aoh5kYpfd571vs7zC9PWpUGNxJ1X/w3sC7tJXAcReX0XM66wzypBbgvRWy2+2S
	 hNnBf1LK01aZOd1T8CHzNw6vKNP0VMlWiECK+nrGzi52+pfLVxI3ATYClniHoEFdJV6XR
	 cmIafCkKrw2FEBwh975nrtj9NZLuG7vgVto/w7SkvEXqiUNyzHowNhd8mw1KmPva+Vv8t
	 k9kWpCa6Vsf4ZvesEVtATlqOplg1c2XsgIzdi+zKxJF053NS6dJXC79lNItIyfQKeDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQIllmdf;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A160A2620
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A07A160A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQIllmdf
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4741015e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814818; x=1795419618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
        b=MQIllmdfsamobYuYUbGh9pvlZFXvPPC48p3GzVjsX6TjMA3ZgemLVBR07Z5z9Pydgz
         BxmvMPGn6WGP+hHdEsPbYZJRL4BlW66LGLG55I1Rm9ppkiw02kUOE9DSKphefjhRHydL
         bPg9vXOPPx8xe/4on9mIkq4CkgjmcT7T/F3seQ0wNgjGjdmqW9S+5h3ecYHWgCQx43Wg
         Huest9FK/uzkeER2HS91v0veh8tjxG5oMm7lKtuxQK8ZRwnLxpF3OHvmGL8Gidd/ca+L
         E4R7h0BWSJcqGovUYSWpOToJanLNrfvuAX38juFYCZialZyFGIdoPfRfpfpBsKfPNcn1
         larQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814818; x=1795419618;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
        b=sjvZHlXJumhf9W1Ce523s5BrvXbI2UQaysEf3XfzDcFkNFnehT8yvl7Vv1vw7APcyh
         DkZ+NnHJkQfv2cjTG8JiOYgnwzabLGip0rLL07piaEsxUbYgoBMcKx25uY07Wu78krcP
         CZsWN16QLde2HB9dvmfUo3DJTY/SatkMG6cUXX+9fvkIhW8V4mw1nTR1XNXyZZw/EqhX
         fEHdQ/fNckDdlRBhjTn67Bh1woQ8oEJ9vQqSvyccfXup7oW295IchqW1vQ9B45Aljb7a
         IaBdomhHiPTxeY4KW3B3gW2XPQNhsGG8oN3cqSo692z9hWD9XjbBJK91qY9xVZ6vkEew
         TGvQ==
X-Forwarded-Encrypted: i=1; AL+hErEJBX0h3kASbgPg5l3LS9pxbR1CZ9JaTik+Wm9ck+YaBieMAhH38QLXI7SdPJk605eN1Mlr+dgqUcu1@vger.kernel.org
X-Gm-Message-State: APuU4Z/Pcb3vcwIdy27CDim0FJDHSJgNKaU1+OuJMfWmcaW2baZ4SJaC
	JihEM5qjlOBNpuvYFzMQM61NGrR7+3tHRS5Z6aPxErr5Fh5FANm2QFkO
X-Gm-Gg: AYBFou1pjZLZJ3BAp8x5FpDwVYr6O9ybuj7JvVgw78ZN4N+Vgputd0jBQrPHUS7EjoU
	cDf0ugpQqlRgXeyDeUr2R7wZZC3hNGGgpRmlVPSCEYXrfjiupL0qiqkKu8xyqvCJvVal09jGyaL
	syENwH+wP5ApRXpjVO/xZ6KTMgAYJpVA4T28fw9MSW93nkbE6com3Wlg0br0eTyxRl1A4AvjVIg
	yide1Mcgn3pCojyyQFHC2SDkP65BlengxMpwAVV01Eksjt34O5mPgGLbcgcBfC2XpDdS0bUfvuF
	ZXEuUrQEc4Agm7+ZNQKry2ho2/TvdEJLmMOeEezSnm5OrqCyjkTFBM+jtWY+qHW5JVuVWCLf2gu
	8xP6nmJxZVR/+FnSsLIxMABSdbseDvbRISToGaXqeHy3WUBCfgcoCRhJa3rfeUXODJyAwpjNEWQ
	tbMu2QJYEAO7/N8zQNWziGApGfS3UvZ368I0MhtX4wXMlcUuos7ZUGh5vFjjgx/M6y6f5Ebueqv
	dwo1/znYM+NqM664SWRv/rJM/yoGNZHb5yc2/rZ0OtBBszFGSPSSOeM2UIzcrmMRaWx4JuTXYla
	E02etvbSurg=
X-Received: by 2002:a05:600c:154a:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb6a5a798emr78860495e9.30.1794814817903;
        Sun, 15 Nov 2026 23:40:17 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm259712705e9.2.2026.11.15.23.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Mon, 16 Nov 2026 10:40:12 +0300
Message-ID: <20261116074013.355363-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
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

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic) and reviewed and
validated (dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../iio/proximity/imagis,isg5320a.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..b23d6bafd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip sensor (I2C), exposed as one IIO
+  proximity channel (B-channel diff = CDC16_T - BSL16_B). As fitted on the
+  Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  vdd-supply:
+    description: sensor supply
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        grip@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
-- 
2.53.0

