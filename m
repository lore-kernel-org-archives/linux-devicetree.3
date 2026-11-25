Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649464;
	b=REZmclcnss1UeMa6eFbW8eSX4fWkkExCuGnejJ3UJlC+pYrfR+E/czG1iH0xAil6ADKU
	 rp2XIye52truEeWGEGaaWOrQOprPQjThbHKmQg2jI/Gr3QWdzunxk/54OG/HNi644D4L+
	 PpPpLB3GgpivNbLAUDmGEDJ/zzIeBsoLWfmvipCh6GVU75bT1Fxjv1/+ZSVFa/ER2rKyT
	 U0nl7AVlTbmipWRLrzhq13APRXHAgz7y3UWDkX1XPg0MeZIrrbrZY/kMkeeyAUF4x1Kl+
	 qMyZkQeI2pCglsYLkd8QNAy5c6353rRKuoWRCOuuKHhwvvwIBYqecuxB84G/Kn2h1rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
	b=muYOuEde8xeYSoGRX7KlmgZRVx7Bj5PcWiFh9IA7G6nGocXKKVvk1dqYd0S3sBS8Y+Y1
	 s8MTGCDcBhYSBV2xaLFmz0Y9rF2uSqKfOC0mMmA/hChkBqJSu4AQIkZuFxMh6MWqLwHlH
	 lD+eEDhTyAguTmn3nwedj/T6df6Ow7ec9XohHr6LI4H9flymnWp3YKIy3hurSaKh75dxM
	 0kQSE0izfsosRGx7M924U2x8NGh3nwgkRyhO0TXOAGTiffMoz4tZubGDxm2Q0jnDHQof7
	 5RQ6g/TsBg5OHwog2urU95phGRbOda69Vn3f7m6020V7K8wGEx1bmn7gBmF/Bl28aQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpiX0BzU;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD8606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BD8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpiX0BzU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so4027410f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649462; x=1796254262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=wpiX0BzUJXu/kaCWdaocWsdw9dSgG0bxBge8kQE7WVVGoMefDRIjwDEVewMoh1dcBx
         PHC3xtZDy3PVemrCU5byxIcTO3s9noXcA6SjFg1bTU8w3Yq8Dc7vEXb+Hg39Gtn05H/L
         71kAqKG7RkH/wC+0gxG+j/YSltqaQ1X/H3/DYW0J4AtN5F9DWz2uFkI48gLpJcvlqk6q
         v6IyDEjro3kpwn8ASJ+van1xCj1brtZQJlaEeprtajlWv4IvOT/ZvYYOapgzm/l3Jgxo
         92E7l7xArF0jtHe1NWURYQozt5S3noOCf8kLMmX73VmM3XZT6hVTJ78mCPfvsm3479bE
         cHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649462; x=1796254262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dpmqiSeirQccMrAkW6J9/IyqROVHEoT3mm3CSsBnXQ=;
        b=QZHy6Paybb+9omQW49jllAvfeEXSSipnimD6TNoxXI4qCp0y/wIEOewzoIoMSVqZDw
         ZZYNLabbQImCYYKIPEHlt0pteUPn0GvAqW4bhwoBCJHPNwVoKLkX6mmRcKHoV6KO7Ni2
         pfIwTYVc4iXZ1AMTyQwJ6SPlAvX12QK2SiDZyeSUXpLf/HQDYgHJQeGI2t4U1i3XnCld
         fxXzecfO52FagE/Joc5EoSrTMSRvUHQYsnk5Huj6ZQjN9AbtNDZS7CcZiYtkTViyLmv7
         CCVbcXWgD4AT09mo0+ESDiffqPNaduI3T8aTZ1zIIdZbbc2PoIM3rzxHY0OunQVTL+YK
         h6Xg==
X-Gm-Message-State: APuU4Z9BDxw4s8GGonyOLHMX98gQDCZdmrHgrIpbfOImL2D/dtuKwMcL
	D0QnfmogQJR7iGRHnHjwbypdex841Qb33VvJA4zo2yAjjm4SklAMPdOoVfYO7y/yQeE=
X-Gm-Gg: AZFdTZcxcFTmmu5nIYsWX+vl/jC+yLfTsWp1/ZIJIQH8KyrRWQHoWODI2DiuMNKFvcb
	6NzHokjjyBcNULFv4j0Klnll3WK7dBGTAQcAE9a24BI07AKAN2vYBc3IEhOHkwBhrH+ePIg5jC1
	6P2f2s6n+dtd7AZUJye5BjUY9fjN+KKrHZCehUXMnwSGCEXJR6pStsb8MgrjqGzx9GhDVKAeYly
	YKla2zRyBKksEObhfDZ1PbT1EC4KbUb67Mlt6HHZp2N02S4S88dSUz31/+h5s/z414p0d6nm5Tk
	zKySWFTReoyo8HXr1+BtrzF2mzcJ7LEL/2tzkBFagBlWAPx0xA6sFTwcGC6JXz42AT3AIcY63kl
	tmQuUTpHXD4WHWWjm2H0qdQvpyDDc0Sei6daYLGgpWrawCLjq3nfJyYLqe+IVTx2mPzQ8V83M1W
	zj531VsJOFLjzTLYbnFjOKE+uBmNOG/0grh5vf6TaSnL1EFShQCZwBO14c78bY98T0I9G0aL+4z
	NxrQK4/mDHLkw0HDbD7fVWc/+D6KIciWWC69HTMkS9dCRNPOMafuOtgepE+D6RDK9Y1si/yP2hs
	QDTPOHKrMZn8YGJRKbvBF+Uy+VUipnkgsXqj1xrhRiFz1ewoOe1odwfeZGIe9nGhhBU2j/G7Qk8
	SwZo3Ucq0SQ==
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr40271517f8f.17.1795649462181;
        Wed, 25 Nov 2026 15:31:02 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm38280390f8f.1.2026.11.25.15.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:01 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH RFC 07/19] dt-bindings: timer: Add Espressif ESP32-P4 CLINT
Date: Wed, 25 Nov 2026 23:30:08 +0000
Message-ID: <20261125233020.1380594-8-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

Document the ESP32-P4 CLINT compatible and its machine-mode software
and timer interrupts routed to the CLIC. Add an example showing both
interrupt specifiers.

AI assisted with drafting the binding.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 .../bindings/timer/sifive,clint.yaml          | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d88..e6d08a4ff702 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -27,6 +27,7 @@ description:
 properties:
   compatible:
     oneOf:
+      - const: esp,esp32p4-clint
       - items:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
@@ -74,6 +75,17 @@ properties:
     minItems: 1
     maxItems: 4095
 
+if:
+  properties:
+    compatible:
+      const: esp,esp32p4-clint
+then:
+  properties:
+    interrupts-extended:
+      items:
+        - description: Machine-mode software interrupt
+        - description: Machine-mode timer interrupt
+
 additionalProperties: false
 
 required:
@@ -91,4 +103,20 @@ examples:
                             <&cpu4intc 3>, <&cpu4intc 7>;
       reg = <0x2000000 0x10000>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    timer@20000000 {
+        compatible = "esp,esp32p4-clint";
+        reg = <0x20000000 0x10000>;
+        interrupts-extended = <&clic 3 IRQ_TYPE_LEVEL_HIGH>,
+                              <&clic 7 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    clic: interrupt-controller@20800000 {
+        compatible = "esp,esp32p4-clic";
+        reg = <0x20800000 0x10000>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
 ...
-- 
2.56.1

