Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39C41735B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616093; cv=none; b=pmLwmzGmWGyaije6DhInlH3dmb2aURKqZX8UoI3nHJ7fXlZ7KbMUjjpEueXg6EhhtpbSktPvvFs1SKie1zYgQa1Bihuykm1txOJuXWgAMf8Q4w2yO+OZ2iZVLlcVaNbxoAhe7p15yGC16Tt3U6b59v+SkkjfEyrglXkA8PsAF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616093; c=relaxed/simple;
	bh=RAHefaXglt+Txkz0duK6/2S/HGE7LcBt0LhyGHHFfkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZBEG4KS3poGr53czAygEEYJJAAAxpZhNo+rxuXunMoNHJknJEg34wQJHg9Frpm5+MBbgERKma2OmRDeumtzgGMTux/QCFJJLh9rmM/tU4fK4AxtWEFvGuKUFpnjJ/mamD9mk6G08jvd8dzgOI4ZxIoZE8/0MAEcEHRLOe/hITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyIfiwIB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyIfiwIB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47df6a5655aso589842f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616090; x=1785220890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=AyIfiwIB3wU1RvzGOwsF+81XhK5MKiiCIWUJOhlvcsfHX2mNVKqhGPl9X7JZ72cugw
         MDIFJxE+QTDoRoZ551fyes6b4ag6mlbf9xMYdUVWv7iPhpoiSh/XI2+QhsmbShZwFq+J
         H+5CgGwQe+LTBjcUdb/V8h+T26xEev7cnxFGDtXo2vaH6cE3LoaehiNp0qoWa277SAjX
         6PjgxnP2+puWFgwJ/tBBTsIj9CIm7Y3Elf0gygWrcwMJgRRM8Onr5CzB6TjFOHKbot5N
         cqNd7OULhei7hs1IT3lNTQ1Ncht6Rw18/HKSYL9pE0xlaGZa4JiB7Wwsu4EFQaj/jRqn
         K08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616090; x=1785220890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=VDmu50QUf+FR5yh05P0jPPJNSvgOpm0z0rv6/LKOCl3+sIVw4a6kByX7A4/kVxrzw9
         paSMYYo26AjTGwRJjBbq3Gx2+mB7c63oXo56v3819caSJKvg84NuNQCvlJGX+sxTtU8v
         ttfJ5ahefgR38qwaukfwytG65fGvAg5b7LERymA0vqZp5UQGoCNsgiSxUIqXMwMYmtDl
         d6lXAxOolb1hjrq8FAhQJkdiKaUL8UAaCKGXRhyaqLDDN3/CMK0+AzKmvJou9NAzWJGq
         I5ItvnGK81/cj0Fz6ipueQvC872Yerzo5A2SH4Qht91ohTprT4pk1Fdbxfv8b/MAn6pB
         QjFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWuqjlg0Uxc1B6Z/Y341XTL0LLZnxB5s9i5WIQEEUVO4M00Axs9bAGNH/g1A6vK/Uvx4gmfUO7xxWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjb5SRXIzdMHbPVkBx2uQdCvz7FlUlYo7FEeKHA7nG2fr9sQyj
	yAEpArQyM52A7fhTH07v0e7kXkzc0Klaeh29yCUZ7oucGlpFxG1znhLS
X-Gm-Gg: AR+sD108UE8B4rGAjLebaQOyUhvdIb01MON2bUp7x2XxcfeI3GGCKJq5wJZwLgljklV
	10++tAIlvDM0NUP/F5HbIkOjy8jkAiiTJxrEjWk367Jf5kcHdvxQmo6mSbijXis5I5qtCe8VbzI
	2OgX1UwzQezFb4VlfyM8j9ZA71SiKhXdI2DDEZipl51C4jVHvzJnOhg/ujn4V23o0gIVdf9hkTu
	iC+4kqCHVqJcu9RwHHl+mIXHWXXy8f+8hQBBYUOnTpdB/UL01Nt7orhCZzM3LLmd2S4zl73bn4H
	pB64TPfZjBcJMO3z4kBGxSLxLTu7I/TZuTvOyCrQy1jANI9G2Za9QVMByldTfFmdWwM77sUIeEo
	3jstc3esgjEushCKo9+eJhZuc+94W9wZjzj8oTLO50Gyes7PPVbZL0jw811oYpgQT5p24ZMEH48
	imKUhayStG8cZLoTS1ks797Nytjtg5ouqUYp7nTrD/i/9KanMhfNbIaluCnJ21cbRSPXF9RQZIT
	n8roEZOfOBLWvyILPQLlQ==
X-Received: by 2002:a05:6000:238a:b0:475:3a97:8e2a with SMTP id ffacd0b85a97d-47f6233d4ecmr10721512f8f.7.1784616089904;
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Tue, 21 Jul 2026 08:41:12 +0200
Message-ID: <20260721064115.64809-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Krzysztof Kozlowski):
- reference dai-common.yaml and switch additionalProperties to
  unevaluatedProperties: false
- drop the consumer comment from the binding example

Changes in v3:
- no changes

Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..b80660d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -90,7 +97,10 @@ required:
   - pinctrl-0
   - hpd-gpios
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -129,4 +139,5 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0

