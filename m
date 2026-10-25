Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938263;
	b=Vl99mwd/e1LaNfnOXaEmw/UQ2UskbSWN2ie4RRxgySYNrpisNKQ+igl+UndTZvW7T1e0
	 apk6sN3W8V/Fv9EMa2Rr4vg69upCMtbeXHX2oawacwxk6X65BKHjN/+OAEtRo7REewo0z
	 WbwUKFFPPy/wR4oJjTi4B6zeI/GDjKA2TNnXose9eK200RGynSE70a6dTRXehtWXxhgWT
	 I4cX6OkehEHfXZ2xh6HboxZIdumtQtnu9KvYDIXe6cbiE9Vh9/0re1WoMk9gnxGMUGcx4
	 IaQgF8RvQJYkjyw7DAXnfa7Hat7upXVu/bJ+g+r6q8BOw4uboeDFepfgodKTpjAbGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
	b=KWFo2Oj62OONR6mxLA2z58atCN+MAvMrNr62x99oKPJ6ZjpVzazAVGD9J5d102JWB6or
	 XlTYzRd9LrAYk8l4LD2M1Gmp5lF24EmhrUw3qIJJlrpAWPGD/8HzzoixnxGfZYvudo41P
	 XlIBYL/u6xftv2FP/TNXaDh76+UDZWdYzU/bUTMd74IpBZGqTjEqyioVFbq1E03ein5uV
	 eJ3kD4oDajhxBNPLYmG8Dn4XHDLDqI3KqnAucqr/qqsU7sqy6qHbQ/OCGDkhWxbyc02y/
	 XosYxF4Tn2P7OSTYqsw/RfR+4hqV5IJ7G9+kuC4A72Y4jLaUwnwopZ41f4HqRl9+1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2C606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj7AoADT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25103955e9.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938260; x=1793543060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=dj7AoADTnEBgdCyYS0JghCvO6BccdqmC5lzxKqs1Zhzg645SPfsLFi1zmZAndrh5iN
         MHAU5cyNTNepv3G802hUXihBqAVYe+fJKebXuBynMSeauFl4lBw2Si5WzsAIluxEWOH6
         mQmcCyzvI5Lnmqw9ks1ZYZcA0XYcNZj+mra42vq64B5y/P9HfQwkMxJKqcxlSQp538Vw
         TWOWx5Ggi+fNxBqeO+KD3RHOCK5fvcUQPuupzsWb0gQ5kImt1tn0QO9JHNWqaJIf/BOw
         VYfndGweeXhDp4g/L9JHTAAqZfOInNehTUy0POg2+Ri7+OLVw0cjmv5SMt8+eUiOBmrA
         0Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938260; x=1793543060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=o7OWqfhK5tIewRChdVvucWU3/BWJ8s9azKRvmFr6c+57kEaPYI9XvsO234o+EDOFx9
         kN0oJfoRFXlTZ8N4WTgKTtxUlUPenH3cbN6BcjCO0TviznE7ffwZ/k1wsH0Sqj5tf+KV
         +NCDUdjNiTyGdfKHz170vLEcre4fM+P+vfk/4P2kU99otblvttZliYJExq9JvoSouLS0
         skf4VXXwJss7f5Jb4ifqUsukJ+n1ilTuI7KwCX8Gxpbk8yZKqzGaAYJGetURkMUzTrNh
         kzPFkrngQ8cJwlj6TqAqnSUUMrvVHOI42npC+zfrLd5mGWqpwppoGYS0LBMQ8kQg+awP
         FVFw==
X-Forwarded-Encrypted: i=1; AKwUvBxQDWZs5H6VaQhKoP1019Pkpp0KpQPVyuINIdYpIyYOdyf0riKM0gH47Im8XAs6H4wmND52Fi87ybZh@vger.kernel.org
X-Gm-Message-State: AFq9FYLOjEknUX8FDGVv/YA4sa7+NMPRo10PRYEf4l1j+vBTyiUvZQz2
	nvyfADAhkwHCS2zpY5gt09QCLU45mmw9RxcbAmOwvJgWgN+7MYi0I8MG
X-Gm-Gg: AYBFou3Pq+SsIKDl7CILtcQTDjpR3E7XfmgXfEMmGZWdsUKnyavPxwYaQZjo6Q5kJAi
	jrD6pRKZDkoVGEhrI3GxPoDtntDxlZVp8RDZJNSVrH298vVJQrlyObB/A/nHWaiEzB8p0tyTtv6
	jAVykAPvRhcWOGQEB+2wJWfx0CcqDwaGTBTBWV6WtUf6NN+1/DGAJoYMJRWOJRh3nAWho0Yc3P3
	8Vg+bQsgQV+y+eVKHpcJdP2n54lVXhMeJBq5Or2Ra/g4wkRufoVdHTqn5wkUM0bmMxcYXG+7jI2
	huwzgNjIQE/au5dWMCU7hlvdJZKDsswtazZAbCAQ/Dcrm53YWxkdszzsZVSv6Z6mjH9ADvwm6wr
	K0oNsj5jzH55p8TIZyIzZqzAXagZPpGWxlUb766hZdfONYRh+U6+BRgCL2x99+X+K1Kam3oJiJe
	4wdaTEk2NORlN7I9CNDylVKw0p/vwWN2gEIYwQW+mM+qYDIkZTSnqDDuqY+4skEvnQQycnS95XK
	EEsDCyUclGpzbrJwpu362mmt0Ux8IsG6CBYosnP2D1/a/EOJgAfldzjgt0D3E55yU5EAVTc65J3
	Zd/Hc/zC3H7IVw==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c890 with SMTP id 5b1f17b1804b1-4a35ac45770mr72563585e9.1.1792938260396;
        Sun, 25 Oct 2026 07:24:20 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:19 -0700 (PDT)
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
Subject: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:09 +0000
Message-ID: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

