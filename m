Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596877;
	b=gBVgk9UOUeVReH/jwWAsxoHgEECzZ0eU2CWEm7Zem4Npe2XK2+RpF6jyW0BiCaaqK5n0
	 PAlf0HyiS1t361wUMxWoQAxgVSiNwkDfvDGfHs8+mmSqJvdRdfPdrcFf1bef1aRomXQSO
	 mBqIBAh/0a6kHjqxHCSO/SSAdy7JTRug5zHgYrdAU22nK78esFntMF2YaSrCZYP0N6VF/
	 pgU++nAwlKQ64upZKt+73N1T0+1BRFU7sXqX7I5Cm6U/QpGCwIw1K8JntyP1THYJPrFln
	 95B79x9kwPNW3mPzbs8ygU319eP4pBhs3v0X2W4PYriNLYgY5XXnik6AgLdJzXYM9Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
	b=VwZ7doUNQhuF7jEDry6TRYId5BOCtqZcaTMSML4jPD/N9LCM9OtFNcLQzZ3F+zidiBSQ
	 LBxibiGbuWogqhKhOYvwJrksWo1NFhzYYJ+KkDkwfL0vZMzw+kiZHDY1S5dkar5I2r56I
	 c6/xWgI48bn+xkzOfw+mfnLjK5a5uRrMMxV93qHZ2sXyHQmjMhQBV8eRr9Sya2PV8xS7F
	 0mX4BOD9ieAJPsizxGULpwX++NPyvg8Of3tcW6isqjZCBzsQ+5ztfKrKnZECiZAtv6WLW
	 lqlRO3sxtRmMYcLYD28Ea8Mp0TFFgPkz+18Ut9HhUSlf2399kmWQyi+GPqB447KRcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CE60A3808
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2CE60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c468bd799ecso247818266b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596876; x=1795201676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=uwGcGaPh+BHfex7icC71WkfRYapSs0f9axsnDYJawncCBYbSymIONXbbByTOPA4Mxq
         +CThUvi39AO8kULxSYQr/f+xw1u6F1k09nzML4VhxmzWUWhRKrEMjgv2KeZZ3eAFw3EN
         g7LeZJ3AcCY9gsAwwTotWDvhn77KU5DIk0XZo5qBTBt4xvbvhUhhurEHQNLnQmTuKPSo
         g3wdA9Q4hQLuYGgtlW6F0M768H8c74wm6DdYrw8qOGQklh1OVG/IizczWWSUvUDEXMee
         U7hP5vy0RVUrnqMXRViuaOTkZmH1czb4EuZQoMFrl6qOh/lYG6qVAfp8IGf+Pu3RD8jw
         gxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596876; x=1795201676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=JRrEEaQjelmto0MxbfYtqcmonbfeWut78ayFAsrmxO8au28aL78NhIPHVPeyKzNC7A
         TP6P0+4QIfn0bGNTpvnXBCfn5QzR0zHOeJdyniqwEoKWQ7meK8+cY0/Pn0CBX9iA0/pa
         yWtswOuyIELor4aAON8WeEtsGesjvcNRQcOHw+BXXgYhnoq2PBzIb45IrCUfp9YerrSV
         eZkuBdxR/wH16fkuwP4zjwYfVBm8fWfoSdg3RKyox4mqU3qTX6l39q2Pah8h6M3IiFGS
         +/c8nLGIdWqP9jzzjQjg/Ia9BewMRi9CYS61VUCdYMXv3qlEiMw2ehhHsnq6FJ3uP7nf
         QGng==
X-Gm-Message-State: APuU4Z8O7xfE9j6mnxLs5pkRWe66GAmaCg7p+wB2hj76sJq7fxOw46dy
	dORpj10i2ReFSTqUU+BtKGJMrq/LT4lAr6d5ZgWuDoeGEGhC05E4JMAG
X-Gm-Gg: AYBFou29KTvUb9uABuM46cu0BL7FbYVRmMdhuGkGOjL1o8pqzRdCkmYW0nwa4PjR6Jz
	rOltDvPb8fDg/jAaUOVLCxoyk8HafQHmCesQ7bn0iROTeo1QripjVw/j7sdew7AvxzQFO8c89IY
	uJFNJi1CWKvosJ29wExC/qCD28XiOuZvK6iGgGx3NbeVBKLP+CIoUY8X16RHHe9Ez1LJ6Lu6mpF
	znE7isYVDwkijw/h6sNL3EKaREPua3xVxf9IRO9pwqSkOF6mHrRPhKqV2bytTvYVCfBo1YxWCvy
	YLn+ySxNLAJmsgPDZeoHP5qoKMdiZC1hIYZNaBbVLKv2dkSAm266d70X026p0pRPE0xoP9Xpw2t
	rwuHc7wvugMJCRbItELLy4mMNNGyI88U6xOHxe8H9ZEL7NdW3kpIrzvNMaeeAB437t2+yfNIH2T
	w+dMYtS/izTGJ8m2vtVwkm4XQi2TBS1s07++schUC6nj1VHUw5yerWGV4x8E7ox9LszAQGk1yF2
	KvoHlSkHNkV6l6C9DGCOHtedv7lFsyE/2tVyvcn7r7R5jj6lKHMrUamB1pRWCVD6MOLtdv+ThsH
	kNVNdXinr0SNECKaBtGJmHVdnrn51G2X6sgiJrBESUE3JRiV3zCSnLXvzFScJ0FA
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr336353966b.32.1794596875807;
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:01 +0300
Subject: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
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
Message-Id: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
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
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0

