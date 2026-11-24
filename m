Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557108;
	b=uQflWdFbuZSMT+hfwTQvpzTD/7O3P8R7Kq6O4gwT3k+yvl3htoUdBQhHRn40qA/kWUhp
	 LfNOtzJIAfV9jC0l6pzmpEiu0WGuTv8FDFy1FmyGm307PDEfFZjN3Tyy3G+AErsDW8MTy
	 tKsyEQxccoLkWXx7Hcx4vH2g75SC/FNj4k2fkB00qb+N7SjMu9t4n71RPFTHA25k7kHvp
	 meMm0qGPYgWJQmpXZQcqjM/3B01EZHN/rQQGcLA1Q+V+n694JjNMZ7B0c2yFwb3tlZamP
	 ta/yBiZ9APyUul9dHO9NXTgalhqcI4rAT11nR+o8zMUwN4H1786U3BE7z9vPpeSR3gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
	b=El8EFU/OOz+9LQCzK6F9RNuIpoNi1EpSudiWU7fOsURrIW2adKUzNuwJR8H+XA1sqJO/
	 sWl/Zxu65a4eXu3f0Z6mugMd3jZkxgNlcBtnsCGahrwpZMYE7nXqFloeFai6TxBdEmLaj
	 rWv9s0pF85B5W+CRy4Rvaw5mwNv13H7scmXWa/oEyq4i+OSdR3I2iMHqIYhRJ6MQamAoK
	 4EeT4dDJ7T9+PHY976rLPIHqJ3cGnyA9Sk+Zn54SFcfcxoPKDvzLUFLAx/nzq453+Isqo
	 KMjcj3DmSef+HjOZKAD112A6aXR8a2Aoy8EIWa7gAjeIMtZzP84zzvMFSugWtMnx03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B0606A68B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3B0606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXnDnFGO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4750041f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557106; x=1796161906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=AXnDnFGOBfQJb/4LS7OK+fGiXnmCp4COMdessyhleS1PvjJAfCVdKnNXxPDj1onRsM
         U1TjzEtBSkDNIJNqX5h9xLOHa0M9B+aZqkzO3uGlP789vCwldkYGSYjSA8R6JVIcqtaH
         0bqr06MnbbqGOb8gW7cq4f4VdqRiQDnq3RfZSjAWVT3SiwSJDFYh/JyODpglJDLo/bH6
         8nOSJZtc6tgjdoPIqrdJrrtjcCuJmgVZ7RH0iDVQDvziKrANGoqYAZhf4Oe+fJKa5NwI
         p5hzcB7bJZEIO52kP4OgEnppdA8XZy/AExuMSx4trEax/68pxeufD6qJFXgVdzqHCQOP
         VKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557106; x=1796161906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=li+7z6jcH0ZDl3twNQWFzyO/b95Y+6xz13imXlg2qV6hS8iTTz3go/nZDb9Jz6EsiE
         1hGtIrwpnYKwOrUqsFpyX5wBeOt+JEmXbqAykVYsGOxCqtyENccS7H657jGfGgSqhNY4
         +Rpx/cxl9l6xWjFFUVKYuJ2gbYuyjefuMfcDWOO9Yn2CR1x+kukajG5NGCiZaFG28EMR
         a9GV86VSaVgxBYA8u5nkQDRJVc77lDq9skSCAkL4JS5+IjlyjvezUOR0w/4v+6IVBs6z
         pL0tJ0WCD/V7zIJGRMv0lc9lhmCSWDvO4rfHjxfeEMCJ5CTfw4tNixnVKh7J42GNXMvP
         U6kA==
X-Forwarded-Encrypted: i=1; AL+hErHClB7a+q2mgL9ypcjLBZzRSTW+J28ZuSzVOleUpE1sBPp6UX99zgSS9lArLem1zlHsjZEvrHTV9CVG@vger.kernel.org
X-Gm-Message-State: APuU4Z8MvOH27oCbqtC92/fx/HWmJl6dEB/J1UsbqdbP7t1HB5bNGUNw
	M44UJ/N1rlpLME194wUUyvb6dfdoCilFcSzDJCbjtsLYY57S2RKgwFzz
X-Gm-Gg: AZFdTZdXfqzNQruuXLcOvxoRfenY5UnSHFe7gqUCT18Nfzx/xy8sTOBCIy5a4rJLCcY
	RLxwaBllwt5X36IB4wUflWSBM9m/0Ou5QR8WNg10mPskEVJYQjcaizQ4xUeHdXPRY4iAXIHNLZ5
	cnN849X4hBZEwf+MN1yPduEEon9UQd3weHHGbi+WznP//jDzmA7L0I9XPXm4sKL87lyvoB32CXd
	z/rXtGAVuXjLBA50T7EQbHDty81N8ytCXvlgEQK/eGZFfC1NFn0vCzq/2U+EeOxuEMb9tRmwU+9
	xhjLnebWqoutez9eIqxDb9PpCz89EwWVZjZ/SM5NjpLgztgFazmajhR6ZTjDviC+ohBvbyuui9P
	WbOApv6hn1v/F6UXl9LXIzOkP9zUX5rkC2rsuvRFWCHeixFrLBzK0I1VZQclyAYP08rxSbb+0MG
	j0hxhtiUKSPP4xbD8ySJBzJYGvNb2cV5GzZaX2dd8sTY0u/FgTumCQPPdFXX7z1ZzmsSfiNUeKj
	tmObiVAje09t2A+x9K+yATdoKdo38fzuF+MFFurS36f4GauvHelmeZSbxbRwjD6yTKfPKTlwXG6
	841d7XAOdZDAXtgLcY5i
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29539105f8f.32.1795557106230;
        Tue, 24 Nov 2026 13:51:46 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:45 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Tue, 24 Nov 2026 21:50:47 +0000
Message-ID: <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.1

