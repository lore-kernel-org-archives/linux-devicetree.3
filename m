Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110617;
	b=Bnr+wSoqScaWeKRL2QlGuwAHoajk9Dd20JkrfV2ZFdkkPS9ZjgMUg1cjoSDlIQpAioPD
	 MKhdMEsXDXFxgVkhlQ/cFxuoYov5zKIMNre88ICYfH74EyngLJbIuVBSzIN12EqfKxk82
	 axhTw7UBWXFc348ygSsRH6+eTWsH9bnYCp93P8ney47gsNScdytYl4vE34ce/dk5YMGTH
	 omLJQGdMqIcOHuh4Qc+HrsI57UixuGohy/g21SZOOaF2iUCt/vEgx2SEaPIYC8A7wWWpc
	 W2v3GvrOKZXSvG8odjjzfS+/KiumcKoJbMxq2hGedwY3cGPYw39b4aALFbruMxOLSwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
	b=speO3MKVnlhN3AXyzXo7bgpf6hpGJtK22a8xqo/unsXyfaThNDloyLv1ja4uzgQziQhG
	 WEqlW1f+NeHG9dU2ycEz3Qu7VVMX56ZDB6Scj42manS5a2iqDujTa6VLQEvkyRtepNKBE
	 VNa/EYkhHin/5lSFxtfcTpM9hMuAiNqxFsUwGv2lDV2nFNYxomrAhyPV2bQMVMpHnUNs0
	 pai3nTMU+GITeQvqQXYVzn6xD2Ez6Tts4pFI5tho0x0bh420yMnbtKJxqgDMxJhTFvQ8h
	 e078Wg2V2JPQEmxbCkVbZkepBxyjDssDTmC/YBvsxIKgL/HQD5C2sZy+ka0+ObtOnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A260A2611
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4A260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1265508f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110614; x=1795715414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=HqIwrB7x2+DpqqIgAt1fYw2X+S0cMj8zCUqo/TtX86KaS4qJ5mPzW9HLO8eqO2WDh4
         f+Khohjj9EDyDE4t1MOVwWqhBgN6AjH76sRgY4qojJCrR7L1gJ1A9Fdd2lpjkHyHD6lt
         5VNSXCEizYBZRgwGV32R+VJPHlhk9toLuBUl200ttN5SIS68yC4iCUGC0blpVJmbmYxL
         EKvoeT6aFBbexdCppiSSpaeeAcR++6QXZG3HB2r4kmmF95cLAX0hydKb9sIo3CnsQdCu
         vsuCknPexkSExhRu5B7HWAu4hRQ4egkHYCs+QC+l9Z2clQ4LZmhyI0afLUfzzFGEUIYF
         pdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110614; x=1795715414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=f0jJGmTw6t4CgNCS4PV9wjjKgBAb4LyXnUfK8Uj0IYyMP5wOj9o097sUGZmVleO9eh
         d4FZI1lYVI/fM2l3BLgsyFqoGQqqzyy5m+dxKELei2ZqVOLGOqgnar1docVwbRvE2gMX
         iveid6WOrcCPuS4/MHWa84gDG4EwaKSsUkSFK9ZEwbbKAVSvyUvp+r/pLsCYKHu3jEH5
         KAQ+hRTGTUjmvDZN7WQvmqTK38hi9KgMG0gAhnHrWNtFzwlhFFiLvTqHQkOmVQtOOTfH
         AjbK//DscdMhwRHWmU9diZlR5h3NFuyHzpxDkzJu5y9LS/5dDNUllCymdmqubkdKbS61
         gpGg==
X-Forwarded-Encrypted: i=1; AL+hErFzX+swl/njA4C2YDzuKeAkfLzqVU+Qz0ZG0x1FSsMj6grHov7WOPFxC1zhcKJugcLLBGd7oCZQ3rlB@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yrhyzx4iOEYcMYmDgFfGcyzAC9QDDVTyofc8mlGBDiGmXYatc
	Zn6P2VbuEOGyfV+WpjyphNgCSBtB7lp25YWaBpL/JFf1EjX4yN7ga4FkfNYt3psDgos=
X-Gm-Gg: AZFdTZcuvcTn3uBd6gfWzvsYUHKbNH9b6cAcWZgDedKiZQQhRzEj9jqMb8x8CuH+Kmr
	Mv03hhrh7+qJ9wLCuHrhc4Vps7ZeyPXACxU+3LqQjSdz6bjsq/cPC1Qm2RCjADoUzLWkcsx3j9v
	Qkn0Tbwf7raqsRZef/tlMbcfOQBE+GPo+Eu/dGkBhWknZTk2DkJaZy8HRgKtuf+gppvI7iMDuRl
	5OGI1mv3HQ3e42Cpzcla12cNz8vo08upz4Zbgy6AoG99HWGrO0dw/kU/j2tbXIRSSiULBmjR2Vd
	2VlcLryRsSwKuKDKRApZZcCux+PdNsul8qlUfb/bVvJ9oyIjUzlQajmbP7sLkdh1SN/O0F72K3P
	UnWd49Nge87pB0gJcamUgweov/6hHjVO68ZaxnMbQu0aydT7jFhlj0mPduGA1KBTgADPjHzlUtb
	JNJu+lcanYsGGTElVzu/mH0acRcMsDjuwSpa4TB+fvf9LXOWA1HGRqaQK3NCq9BtpnM11XWpfla
	3UW9PBsDkRtZdi0cDuJXYZKwCOIq4QgJBhvppGcbAc336hemn5mDOAeVSvZVxIbQv7LlWCwF254
	959TrSnYinuaEsZae+AJ8bGmhsdFlo7HMNFoZQSAFyI0e98OsFCu5XNF5BkUbXOMxMJW8ZN9GHu
	0f+9Cr+vHu3Qwup5oW7tN1rb1VDfmva01CkOZUCdm1nNMvCwoChaZV6phdjNQZhe1A73Npqwt2Y
	WCN8I=
X-Received: by 2002:a05:6000:4a0b:b0:4a7:4efc:11d0 with SMTP id ffacd0b85a97d-4abaf740155mr279928f8f.12.1795110613914;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm876032f8f.30.2026.11.19.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 07/10] dt-bindings: net: wireless: add XRadio XR819
Date: Thu, 19 Nov 2026 18:49:59 +0100
Message-ID: <20261119175002.458988-8-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

The XR819 exposes one SDIO function. Boards may provide a MAC address
and wire a GPIO interrupt instead of using the SDIO interrupt.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 .../bindings/net/wireless/xradio,xr819.yaml   | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
new file mode 100644
index 000000000000..4f6919b6bcbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/xradio,xr819.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XRadio XR819 SDIO wireless controller
+
+maintainers:
+  - Arthur Heymans <arthur@aheymans.xyz>
+
+description:
+  The XR819 is a 2.4 GHz IEEE 802.11b/g/n controller connected to the host
+  through SDIO. Its out-of-band interrupt may be connected to a host GPIO.
+
+properties:
+  compatible:
+    const: xradio,xr819
+
+  reg:
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  local-mac-address: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@1 {
+            compatible = "xradio,xr819";
+            reg = <1>;
+            interrupt-parent = <&pio>;
+            interrupts = <10 IRQ_TYPE_EDGE_RISING>;
+            local-mac-address = [02 00 00 00 00 01];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..6e7b5f6beba4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7211,6 +7211,7 @@ F:	Documentation/process/cve.rst
 CW1200 WLAN driver
 S:	Orphan
 L:	linux-wireless@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
 
-- 
2.56.0

