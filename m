Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1119B342515
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916209; cv=none; b=bFu9A9iuKTGzaZKbSzluXpEWaGZuFD8W9wnH2JaJBsVeuGDeMmrubap3Vh4Xt8FgoKPTJ9A+ne/XtlzRi4yQeLMps6pl6UOVt6vkdBp1fpRB/bxc++SUVDHnvBScjI1bYN5q6h3C2R/9Qc8f6BcUkzcKyLObIgfZVpKbB9WsdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916209; c=relaxed/simple;
	bh=2XW1YLWJizNQohpYXEK8jt76PjghRUYJEyG+o9IP8gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAcO+pq27ZM2+wz4iOPJxxTOYugcx/CaRx4PJlNeIZo03xr/QTbaESlLsgPfRRUd1IqClIPbcXTgz5Ktte+O73MlSkFH6O7JSnm760tlm8E3g9wlhgweBXjjSAoTjJ7XdcBGdVJLAZ5nWrH0tk6++/inL1QT70SUSwHolFM0hHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qW7MGtno; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qW7MGtno"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so910877f8f.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916207; x=1783521007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d9xc1hK1wDKpjmJn7eEG84uycO+0Cq+uemYlSYPoc4=;
        b=qW7MGtnoSIRnZdpZE4EDjh7OoNiVkiGpHPxUsrF8tOeDC6iafI3tXWBWFNpapph4BV
         3yjigcYRCz7NAjkGQ53GBkS6HH7DZ3PHFltC8xl73yW8G0aQUQPVCe1N8vz2rSRvmumC
         Osf7QRZINnH6uauawljRPz5LCEoyz9+3bweasrXuLvyYQQZDFF9phKStbiC84SOrEmWs
         cR0j5wzEie2kl+A3oh8pJEIWMMNemgJUhOvzrtEorZw9OYmDWGWIWgh2GL8KbxLid4/9
         O6I0TNG3AUozBacBLrZ79GJ2inP0lVbQwbkMgK/mhDdywHEnYaHZnofG6vFKcl0cWkqo
         EMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916207; x=1783521007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d9xc1hK1wDKpjmJn7eEG84uycO+0Cq+uemYlSYPoc4=;
        b=UOV8a78t5LQ11QOX0KyBeOa0SaN13QYaJsgX2Md7EcxW58oSI8hgG5OiqY5HCkAxYw
         UDfvRtr7WwqEgYAxEhw3tBYRQyogLwR1w7NY9qCLDDqLhaQ/dKDp4oMy33D/ffdVOp54
         r+HQM6Qimu3J3z3ScZANV2TwLW2r03fIhIq9IUgoqSVgnnXHTnvv2C0lJ8zatPPJHpGe
         YSOnOrAUBmis2JlCZWUQZccLtNSgkb98sQwMVpj/BIpSSphMXMsCJt/efVFMzZlNn34D
         4BKCTNTYwr0RWdBOQyYItBc/je5ias/aJlf/Uuou70ndlusfZ3Aj+zVb9XQEyjpTr6zy
         BMqw==
X-Forwarded-Encrypted: i=1; AHgh+RrxQQyrp+jUhtpLhQSwqzbW0G0OVk9sOSy5u+5Y0tavMcwuM+yd8uPZJNoDmM16z72QTyd77uNrvEXH@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHwfB47cbakFOQ8lE0JNKCGA3mtKVZdpvvrYv/MzuTg5nKin0
	wfgxdUtMDWPvYZaes2LQBF7dlf8lAtFvj+Jc5Z0AOh6z2i8ajY3Ir097
X-Gm-Gg: AfdE7cmJjFcVJWe3tI5Th6OQTT4mPM6jmKLVTgtI2FPcXKVACX7tQ7EmRm9XWsx6bpX
	A2YzD4rBU3wuhEzZQakqZRhX/rCa6ILb400Z9t/tprxEgMyCI/38DuHRJYBsEvZWX+fvb5ruwHs
	uv7JrzvYaVgTLklOdRRIBPw7MiGOaL+BeITXhNMdeo2/1R6cjlNt9Ly2RpbpkB7a2HMao1BEyle
	Oam01Ju+CzmJZB784ph/ZTrhADV2WvSoJPnKs0KHpa56DLcIcAaJEKPVWIBxO4MaPnewVukBRKK
	iyjXIQtyakpfDQ3CV3v81Yd7UsOCYT5GSdJyJEkxpywsC9wZFm+N8zgCAZrLgyusaJGg1hlsoJK
	B1Hgeeo20GqFSxllXYP8tRY/pwpS6+QMRm4kDe9l9DamD0xnb7h1bhRq7lFmhobOm92MPSQWVeM
	ta37hJ/t+uI+WJ2IV3oQWkNvmF9jrWiNlWXdAUIHByRIXmKDWZzoojXzAkxYZRV6qPiTCPy1gEQ
	JZtoJZ83awYlJGl+k8EMl9CRF8=
X-Received: by 2002:a05:6000:1788:b0:475:613c:c9f2 with SMTP id ffacd0b85a97d-477b34b0313mr1284809f8f.5.1782916206537;
        Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 02/10] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Wed,  1 Jul 2026 15:29:45 +0100
Message-ID: <20260701142953.2014895-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 305f10a8a85b..aa27ad7f5941 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -464,6 +464,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.54.0

