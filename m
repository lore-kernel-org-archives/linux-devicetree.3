Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596869;
	b=FMOL8+1dhuJ6lbFqVKjm5JGgBpolmvX3KbDkSkz70yDLSOIwgbgKTm4I5dvojjZukgFc
	 wsQ4sQwSFb06ldXXg5C0SvYvX7zWb4g13blWCY1q87PtifhzDm2XHoJAsf/7Lh63opVUX
	 knDKx494mwU+uSImU0bV54BbjTvacBRH4Oj+IMd1yn1OFmEg4/NP0Mmjws0lSCGZG9khf
	 HzeAZfh++rO4Lf11a+LnQIfEWGXkIMBaErW5oFmqwyZy6XEbL5p2AOX41js758ttXaHqP
	 DJxB0aRD2y5kV6N8NNFaDQkM8u1Cv7COppIl/2EKjsBZTEjFwCVEoK42WZzU7MYFrgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
	b=AlfyulsKA61Vgu/I6sxb99d+tNwWFKajilrXRGk4rdmCJv3U5lYifVToh5Bv6389Qm0q
	 FeK7lmvJdx5clAHDa47pKpi98o4zeYrGixvGg/GzRbEFhRj1vWnjlP4oPlT3YzQN32IaH
	 SwNigvfkfdARZnt1JtTYPTXF/Pcpdlvxyldb3p/6i2c+l5ZCXjMw2fHzKwUoedBDBLnfh
	 f5cs28IE+jox1Pt8ptP1I7fn7nYnKtxH+gT2RiECB3iS47SwHhvLDh5MB/eBvW9/RLgEI
	 Z6PaJJ2fhph8kMvxDBPeDqh2eLWVzZl+P8KgDGUbpSwXF+tPMZJ8BuFCnzV6tZSUBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A5606A8BD
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4A5606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE2u3Ig9
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5067a2411bso255007366b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596868; x=1795201668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=rE2u3Ig9QQmvYdO4meupm38R07509KcJIbOAEE8bkGwjMEOVzVv0JJLzRE37Peidsb
         smpNCeOpTI7ROICLLY5L90EV6xSGREQ/ui4lN8ruSeUYnNG4G3X9tiX6tmBDjD4S+rmA
         EJ+gM48JWQjmSoetmjwKebkBu1/6kW1rn3mdQb8JgRGM1t922TkimGEZMcSERFZuIPXi
         452eL4fN1PQASGBc2YGLxX4d6X09AtHZIOSnl2GtlrSWA8UO0+oSOyfyLdzIXzzzqMTS
         vEBgWlzFFtez3312Bw35huiUspC7CzTPnn3dJJdqQugkUMAD1AMnk+Aob0x4KYw0XNBZ
         gFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596868; x=1795201668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=bjp0IiXLlog0V+Tr594qXhjkYJoLA2GWuM7s50WN8EpxhK/+nedOfnD9O/ZsUwcbs7
         8zLY2AGbtUnkGCXRIymfD10LYv9m+PJ3lkGkiE7MVGw0DFNh/EDaAWx8C9ViXSGcCQSi
         73qz6c2X0VAwHdU3LiM6IxeKzerhhs+2x4wQayQOKbUaMAunjEQESWrFVJPY9DVg0WkV
         HR9yw0pTEI/JY04AEGjP9Le/JRoGdU8HoxxMdgQPUfzYQuyBsTi3m03lVEQoNzR42jqn
         PIysDkt2zOsirln9cQQNU7CvhHID8kOy0DfYLk9+VYsgCLg2c9j2AEbh96PyNK9Neoc0
         lSOg==
X-Gm-Message-State: APuU4Z+7X9SUlzX1kJa3B5zSlo+hEjaL/74t80iQ46dffpWa1U2AYhBM
	I9/78C6/6onzMP6/V2m26pjytfrJ19t7bUwPtEIWwp7UT6o5KEK7Kn/A
X-Gm-Gg: AYBFou3CQtfgO8rzEKPjaRdLudsbAguaMoK6O4G3rleKvPIgtndwgrk81n5eQ0pg9/f
	/bHWR63/G2MlvbmxjGL1HGkRoJyCYnsSWL1+0m1wXbstucRbCRT/5DKGN7s7Ld+WVyML26HhR0/
	5OCxywiec7TmH9+Fi9SjX91t4PueHHdQYeE19TMkLlety1pfl28kc5VItr+/rTi/2wWj0UNGQgM
	+ERxo+Jt79dVHR9fJFT6NaLIvBTKW0nMqku8bK9CizPCwa5uosGLnXPEMjuJy/IImoJlD4cB5l4
	6GpjaaUuAo9U3+D4AHIgWI3YiT6IkCkPcoKa5n4wPNXguv7bFOAgdApAP5j4X/AfrsDEg7LgEV6
	oywF4CFo6EOfp+acNR1RagS3xyaXzm3oeQi3gyr//wB+EynIL7c4ibg+Ad7hA94TNeaDiY8lo5j
	ifC2O/9q5LDVNhY5/yC+OkZD10sa+aUOSsCIF/ASe4CLyRuMJc77dMSSUvk4BlHSbWl+4Wuh19b
	Ahk2In3tjfKP5jAfkfKMMBNKmDaTBita8QmzwfR0+UetyWLt8bfcU16Lk4tTjUioXRqcgNcJmmK
	2pn1g6oiPcrA7/GGBgaPugf/H3ZSY/kUX1slhUcniTpGbRDSYhnSoJzC5ernC32H
X-Received: by 2002:a17:907:2d8a:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c509683f389mr411823466b.44.1794596867571;
        Fri, 13 Nov 2026 11:07:47 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:58 +0300
Subject: [PATCH v2 2/9] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-2-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0

